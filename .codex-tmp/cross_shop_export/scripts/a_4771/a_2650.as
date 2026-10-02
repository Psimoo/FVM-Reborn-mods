package a_4771
{
   import a_4716.CommonConst;
   import a_4716.EnmConnLoginStatus;
   import a_4722.a_1765;
   import a_4728.a_1778;
   import a_4729.EventType;
   import a_4729.a_1779;
   import a_4729.a_1789;
   import a_4732.TcpPackageEvent;
   import a_4752.GameStringManager;
   import a_4788.a_4648;
   import com.aurora.protocol.a_2664;
   import com.aurora.ui.maogoutd.doctor.GameDoctor;
   import flash.errors.IOError;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.Socket;
   import flash.utils.ByteArray;
   
   public class a_2650 extends Socket
   {
      
      private var a_787:a_1765 = new a_1765();
      
      private var m_host:String;
      
      private var m_port:int;
      
      private var m_desIP:String;
      
      private var m_desPort:int;
      
      public var m_szSessionKey:ByteArray;
      
      public var m_iPlayerID:int = -1;
      
      public var m_iLoginStatus:int = -1;
      
      public var eventType:String = EventType.a_561;
      
      private var eventManage:a_1779 = a_1789.getInstance();
      
      private var tempPackage:ByteArray = null;
      
      private var leftSize:uint = 0;
      
      private var paddingSendData:ByteArray;
      
      public function a_2650(_host:String = null, _port:int = 0, _serverType:int = -1, _serverId:int = -1, _desIP:String = null, _desPort:int = 0)
      {
         this.a_787.m_iServerType = _serverType;
         this.a_787.m_iServerID = _serverId;
         this.m_host = _host;
         this.m_port = _port;
         this.m_desIP = _desIP;
         this.m_desPort = _desPort;
         this.initialize();
         super(_host,_port);
      }
      
      public function SetDestInfo(szDestIP:String = null, iDestPort:int = 0) : void
      {
         this.m_desIP = szDestIP;
         this.m_desPort = iDestPort;
      }
      
      public function closeConnection() : void
      {
         if(connected)
         {
            close();
            this.m_iPlayerID = -1;
            this.m_iLoginStatus = EnmConnLoginStatus.enmNoLogin;
            this.m_szSessionKey = null;
         }
      }
      
      public function get serverType() : int
      {
         return this.a_787.m_iServerType;
      }
      
      public function get serverId() : int
      {
         return this.a_787.m_iServerID;
      }
      
      public function get host() : String
      {
         return this.m_host;
      }
      
      public function get port() : int
      {
         return this.m_port;
      }
      
      private function initialize() : void
      {
         addEventListener(Event.CONNECT,this.a_2654);
         addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.a_2653);
         addEventListener(IOErrorEvent.IO_ERROR,this.a_2652);
         addEventListener(ProgressEvent.SOCKET_DATA,this.processRecievedPackage,false,65535);
         addEventListener(Event.CLOSE,this.a_2655);
      }
      
      private function processRecievedPackage(a_4730:ProgressEvent) : void
      {
         var read_size:int = 0;
         var sourceSocket:Socket = a_4730.target as Socket;
         if(null == sourceSocket)
         {
            trace("sourceSocket is null, failed return!");
            return;
         }
         var bytesAvail:uint = sourceSocket.bytesAvailable;
         var packageEvent:TcpPackageEvent = new TcpPackageEvent(this.eventType,this.a_787,this.m_szSessionKey);
         a_4648.a_4649("sourceSocket.bytesAvailable" + sourceSocket.bytesAvailable);
         trace("sourceSocket.bytesAvailable" + sourceSocket.bytesAvailable);
         if(this.leftSize > 0)
         {
            read_size = this.leftSize > bytesAvail ? int(bytesAvail) : int(this.leftSize);
            sourceSocket.readBytes(this.tempPackage,this.tempPackage.length,read_size);
            trace("leftSize[" + this.leftSize + "] > 0 so readed left bytes[" + read_size + "]");
            this.leftSize -= read_size;
            if(this.leftSize == 0)
            {
               this.tempPackage.position = 0;
               packageEvent.packageBytes.writeBytes(this.tempPackage,0,this.tempPackage.length);
               this.eventManage.dispatchEvent(packageEvent);
               this.tempPackage.length = 0;
               this.tempPackage.position = 0;
               if(bytesAvail > read_size + CommonConst.a_102)
               {
                  trace("bytesAvail [" + bytesAvail + "] > read_size - CommonConst.Package_Len_Size so resend ProgressEvent.SOCKET_DATA event");
                  sourceSocket.dispatchEvent(new ProgressEvent(ProgressEvent.SOCKET_DATA));
               }
            }
            return;
         }
         if(bytesAvail < CommonConst.a_102)
         {
            trace("bytesAvail[" + bytesAvail + "] < CommonConst.Package_Len_Size return!");
            return;
         }
         var packageLen:int = sourceSocket.readInt();
         if(packageLen <= CommonConst.a_102)
         {
            trace("packageLen[" + packageLen + "] < CommonConst.Package_Len_Size read out left error package!");
            sourceSocket.readUTFBytes(bytesAvail - CommonConst.a_102);
            return;
         }
         if(packageLen <= bytesAvail)
         {
            a_2664.encode_int32(packageEvent.packageBytes,packageLen);
            sourceSocket.readBytes(packageEvent.packageBytes,CommonConst.a_102,packageLen - CommonConst.a_102);
            this.eventManage.dispatchEvent(packageEvent);
            if(bytesAvail > packageLen + CommonConst.a_102)
            {
               trace("bytesAvail [" + bytesAvail + "] > packageLen[" + packageLen + "] + CommonConst.Package_Len_Size so resend ProgressEvent.SOCKET_DATA event");
               sourceSocket.dispatchEvent(new ProgressEvent(ProgressEvent.SOCKET_DATA));
            }
         }
         else
         {
            trace("packageLen[" + packageLen + "] > bytesAvail[" + bytesAvail + " read out left bytes!");
            if(null == this.tempPackage)
            {
               this.tempPackage = new ByteArray();
            }
            else
            {
               this.tempPackage.length = 0;
               this.tempPackage.position = 0;
            }
            a_2664.encode_int32(this.tempPackage,packageLen);
            this.leftSize = packageLen - bytesAvail;
            sourceSocket.readBytes(this.tempPackage,4,bytesAvail - CommonConst.a_102);
         }
      }
      
      private function finishSendData() : Boolean
      {
         if(null == this.paddingSendData)
         {
            trace("paddingSendData is null");
            return false;
         }
         try
         {
            writeBytes(this.paddingSendData,0,this.paddingSendData.length);
         }
         catch(error:IOError)
         {
            trace("send data failed, caused by IOError");
            try
            {
               writeBytes(paddingSendData,0,paddingSendData.length);
            }
            catch(error:IOError)
            {
               trace("send data failed, caused by IOError");
               return false;
            }
         }
         try
         {
            flush();
         }
         catch(error:IOError)
         {
            trace("send data failed, caused by IOError");
            try
            {
               flush();
            }
            catch(error:IOError)
            {
               trace("send data failed, caused by IOError");
               return false;
            }
         }
         this.paddingSendData = null;
         return true;
      }
      
      public function a_2651(packageBytes:ByteArray) : Boolean
      {
         if(null == packageBytes)
         {
            trace("packageBytes is null");
            return false;
         }
         if(null == this.paddingSendData)
         {
            this.paddingSendData = packageBytes;
         }
         else
         {
            this.paddingSendData.position = this.paddingSendData.length;
            this.paddingSendData.writeBytes(packageBytes,0,packageBytes.length);
         }
         if(true == connected)
         {
            return this.finishSendData();
         }
         return true;
      }
      
      public function reconnect(_host:String = null, _port:int = 0) : Boolean
      {
         if(_host != null && _port > 0)
         {
            this.m_host = _host;
            this.m_port = _port;
            connect(this.m_host,this.m_port);
            return true;
         }
         if(this.m_host != null && this.m_port > 0)
         {
            connect(this.m_host,this.m_port);
            return true;
         }
         return false;
      }
      
      public function a_2652(a_4730:IOErrorEvent) : void
      {
         a_4648.a_4649("send to server: " + this.host + ":" + this.port + " failed fo IO error:" + a_4730.text);
         GameDoctor.instance.pushInCache({"type":"ce"},GameStringManager.getInstance().getString(132659),GameStringManager.getInstance().getString(132660) + a_4730.text,{"cpShow":true});
      }
      
      public function a_2653(a_4730:SecurityErrorEvent) : void
      {
         a_4648.a_4649("connect failed : " + this.host + ":" + this.port + " for security error:" + a_4730.text);
         GameDoctor.instance.pushInCache({"type":"ce"},GameStringManager.getInstance().getString(132659),GameStringManager.getInstance().getString(132661) + a_4730.text,{"cpShow":true});
      }
      
      public function a_2654(a_4730:Event) : void
      {
         var httpGetByte:ByteArray = null;
         var str:String = null;
         a_4648.a_4649("Connect to server: " + this.host + ":" + this.port + " success:" + a_4730);
         if(this.m_desIP != null && this.m_desPort > 0)
         {
            httpGetByte = new ByteArray();
            str = "GET / HTTP/1.1\r\nHost: " + this.m_desIP + ":" + this.m_desPort + "\r\n\r\n";
            httpGetByte.writeUTFBytes(str);
            try
            {
               writeBytes(httpGetByte,0,httpGetByte.length);
            }
            catch(error:IOError)
            {
               trace("send data failed, caused by IOError");
               try
               {
                  writeBytes(httpGetByte,0,httpGetByte.length);
               }
               catch(error:IOError)
               {
                  trace("send data failed, caused by IOError");
               }
            }
         }
         this.finishSendData();
      }
      
      public function a_2655(a_4730:Event) : void
      {
         var iServerID:int = this.a_787.m_iServerID;
         var iServerType:int = this.a_787.m_iServerType;
         var dd:Event = a_4730;
         var dataEvent:a_1778 = new a_1778(EventType.a_567);
         dataEvent.dataObject = [iServerID,iServerType];
         this.eventManage.dispatchEvent(dataEvent);
         a_4648.a_4649("Socket OnClosed Event: " + this.host + ":" + this.port + " closed:" + a_4730);
         close();
         this.m_iPlayerID = -1;
         this.m_iLoginStatus = EnmConnLoginStatus.enmNoLogin;
         this.m_szSessionKey = null;
      }
   }
}

