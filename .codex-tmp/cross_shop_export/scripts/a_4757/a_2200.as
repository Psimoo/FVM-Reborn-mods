package a_4757
{
   import a_4716.b_154;
   import a_4716.b_155;
   import a_4716.b_160;
   import a_4727.b_164;
   import a_4729.EventType;
   import a_4752.GameStringManager;
   import a_4758.a_2208;
   import a_4759.IProtocal;
   import a_4759.b_166;
   import a_4759.b_169;
   import a_4760.a_2248;
   import a_4771.a_2650;
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.a_2667;
   import com.aurora.protocol.common.a_2670;
   import com.aurora.ui.maogoutd.doctor.GameDoctor;
   import flash.utils.ByteArray;
   
   public class a_2200 implements b_169
   {
      
      private static var a_774:a_2200;
      
      protected static var mapProtocalRoutine:Object = {};
      
      private var a_775:a_2650;
      
      public var parameters:Object = null;
      
      public function a_2200()
      {
         super();
         this.a_775 = new a_2650();
         this.a_775.eventType = EventType.a_564;
      }
      
      public static function getInstance() : a_2200
      {
         if(null == a_774)
         {
            a_774 = new a_2200();
         }
         return a_774;
      }
      
      public function getProtocolVersion() : uint
      {
         return 1;
      }
      
      public function get authenConn() : a_2650
      {
         return this.a_775;
      }
      
      public function refreshAuthenConnection() : Boolean
      {
         var authenHost:Object = null;
         var hostsArray:Array = a_2248.getInstance().a_2250();
         var hostsNum:int = int(hostsArray.length);
         var i:int = 0;
         if(!(i < hostsNum && false == this.a_775.connected))
         {
            return false;
         }
         if(this.parameters != null && this.parameters.sitetype == "4399" && this.parameters.group_id == "423")
         {
            authenHost = hostsArray[hostsNum - 1];
            this.a_775.SetDestInfo(authenHost.DesIP,authenHost.DesPort);
            this.a_775.reconnect(authenHost.IP,authenHost.Port);
            return true;
         }
         if(this.parameters != null && this.parameters.sitetype == "joyyou" && this.parameters.group_id == "2")
         {
            authenHost = hostsArray[hostsNum - 1];
            this.a_775.SetDestInfo(authenHost.DesIP,authenHost.DesPort);
            this.a_775.reconnect(authenHost.IP,authenHost.Port);
            return true;
         }
         authenHost = hostsArray[0];
         this.a_775.SetDestInfo(authenHost.DesIP,authenHost.DesPort);
         this.a_775.reconnect(authenHost.IP,authenHost.Port);
         return true;
      }
      
      public function a_2201(tcpConn:a_2650, messageId:uint, protocalBody:ByteArray, optionBuffer:ByteArray = null) : Boolean
      {
         var encode_length:int = 0;
         if(messageId < 0)
         {
            trace("error: messageId must > 0");
            return false;
         }
         if(protocalBody == null)
         {
            trace("protocalBody is null ");
            return false;
         }
         var optionalLenght:int = optionBuffer is ByteArray ? int(optionBuffer.length) : 0;
         var stMessageHeader:a_2670 = new a_2670();
         stMessageHeader.nPackageLength = b_154.a_331 + protocalBody.length + optionalLenght;
         stMessageHeader.nUIN = -1;
         stMessageHeader.shFlag = b_155.b_159;
         stMessageHeader.shOptionalLen = optionalLenght;
         stMessageHeader.lpbyOptional = optionBuffer;
         stMessageHeader.shHeaderLen = b_154.a_331 + optionalLenght;
         stMessageHeader.shMessageID = messageId;
         stMessageHeader.shMessageType = b_154.a_104;
         stMessageHeader.shVersion = this.getProtocolVersion();
         stMessageHeader.nPlayerID = -1;
         var packageBytes:ByteArray = new ByteArray();
         stMessageHeader.encode(packageBytes,encode_length);
         packageBytes.writeBytes(protocalBody,0,protocalBody.length);
         if(!this.a_775.a_2651(packageBytes))
         {
            trace("getAuthenConnection().SendDate(packageBytes) failed");
            GameDoctor.instance.pushInCache({"type":"ce"},GameStringManager.getInstance().getString(132662),"getAuthenConnection().SendDate(packageBytes) failed",{"cpShow":true});
            return false;
         }
         if(false == this.a_775.connected)
         {
            if(!this.refreshAuthenConnection())
            {
               trace("refreshAuthenConnection failed.");
               GameDoctor.instance.pushInCache({"type":"ce"},GameStringManager.getInstance().getString(132663),"refreshAuthenConnection failed.",{"cpShow":true});
               return false;
            }
         }
         return true;
      }
      
      public function a_2202(pProtocol:IProtocal, messageIds:Array) : void
      {
         var messageId:uint = 0;
         if(pProtocol == null || messageIds == null)
         {
            trace("RegisterProtocal failed");
            return;
         }
         this.a_2203(pProtocol);
         for each(messageId in messageIds)
         {
            if(null != mapProtocalRoutine[messageId])
            {
               trace("messageId:" + messageId + "exists in mapDecodeRoutines");
            }
            mapProtocalRoutine[messageId] = pProtocol;
         }
      }
      
      public function a_2203(pProtocol:IProtocal) : void
      {
         var property:Object = null;
         if(pProtocol == null)
         {
            trace("pProtocal is null, UnregisterProtocal failed");
            return;
         }
         for(property in mapProtocalRoutine)
         {
            if(mapProtocalRoutine[property] == pProtocol)
            {
               delete mapProtocalRoutine[property];
            }
         }
      }
      
      public function a_2204(packageBuffer:ByteArray) : void
      {
         var decodeLenght:int = 0;
         var nEncryptedLength:uint = 0;
         var nDecodeRound:int = 0;
         var arrDecryptedPart:ByteArray = null;
         var arrEncryptedPart:ByteArray = null;
         var sessionKey:ByteArray = null;
         var nDecryptedDataLength:uint = 0;
         var authenKey:ByteArray = null;
         var startPosition:int = int(packageBuffer.position);
         var authenPackageHeader:a_2667 = new a_2667();
         authenPackageHeader.decode(packageBuffer,decodeLenght);
         if(0 > authenPackageHeader.nPackageLength)
         {
            trace("authenPackageHeader.shOptionalLen less than 0, exit");
            GameDoctor.instance.pushInCache({"type":"ce"},GameStringManager.getInstance().getString(132664),"authenPackageHeader.shOptionalLen less than 0",{"cpShow":true});
            return;
         }
         var nDecodedSize:int = packageBuffer.position - startPosition;
         if(0 >= nDecodedSize)
         {
            trace("nDecodedSize must > 0");
            GameDoctor.instance.pushInCache({"type":"ce"},GameStringManager.getInstance().getString(132665),"nDecodedSize must > 0",{"cpShow":true});
         }
         if(authenPackageHeader.nPackageLength <= nDecodedSize)
         {
            trace("shPackageLength must > nDecodedSize");
            GameDoctor.instance.pushInCache({"type":"ce"},GameStringManager.getInstance().getString(132666),"shPackageLength must > nDecodedSize",{"cpShow":true});
         }
         if(0 < nDecodedSize && authenPackageHeader.nPackageLength > nDecodedSize)
         {
            nEncryptedLength = authenPackageHeader.nPackageLength - nDecodedSize;
            if(0 == (authenPackageHeader.shFlag & b_160.b_162))
            {
               authenPackageHeader.nSequence = a_2664.decode_int32(packageBuffer);
               nEncryptedLength -= 4;
               this.a_2205(authenPackageHeader,packageBuffer);
               return;
            }
            if(0 < packageBuffer.bytesAvailable)
            {
               nDecodeRound = -32;
               if(0 != (authenPackageHeader.shFlag & b_155.b_158))
               {
                  nDecodeRound = -8;
               }
               arrDecryptedPart = new ByteArray();
               arrEncryptedPart = new ByteArray();
               arrEncryptedPart.writeBytes(packageBuffer,packageBuffer.position,packageBuffer.length - packageBuffer.position);
               arrEncryptedPart.position = 0;
               sessionKey = a_2208.getInstance().passwordHash;
               sessionKey.position = 0;
               nDecryptedDataLength = b_164.a_1775(arrEncryptedPart,arrDecryptedPart,sessionKey,nDecodeRound);
               sessionKey.position = 0;
               if(0 >= nDecryptedDataLength)
               {
                  authenKey = new ByteArray();
                  authenKey.writeUTFBytes(a_2208.getInstance().getLocalKey());
                  arrEncryptedPart.position = 0;
                  arrDecryptedPart.length = 0;
                  nDecryptedDataLength = b_164.a_1775(arrEncryptedPart,arrDecryptedPart,authenKey,nDecodeRound);
               }
               if(0 < nDecryptedDataLength)
               {
                  arrDecryptedPart.position = 0;
                  if(arrDecryptedPart.length > 4)
                  {
                     authenPackageHeader.nSequence = a_2664.decode_int32(arrDecryptedPart);
                     nDecryptedDataLength -= 4;
                     this.a_2205(authenPackageHeader,arrDecryptedPart);
                  }
                  else
                  {
                     trace(" 解压出来的部分 没有包含body");
                     GameDoctor.instance.pushInCache({"type":"ce"},GameStringManager.getInstance().getString(132667),GameStringManager.getInstance().getString(132670),{"cpShow":true});
                  }
                  return;
               }
               trace("ERROR: nDecryptedDataLength  must > 0");
               GameDoctor.instance.pushInCache({"type":"ce"},GameStringManager.getInstance().getString(132668),"ERROR: nDecryptedDataLength  must > 0",{"cpShow":true});
               return;
            }
         }
      }
      
      public function a_2205(authenPackageHeader:a_2667, bodyBuffer:ByteArray) : Boolean
      {
         var copyBodyBuffer:ByteArray = null;
         var handler:Object = mapProtocalRoutine[authenPackageHeader.shMessageID];
         if(null != handler && handler is b_166)
         {
            copyBodyBuffer = new ByteArray();
            if(null != bodyBuffer)
            {
               copyBodyBuffer.writeBytes(bodyBuffer,bodyBuffer.position,bodyBuffer.bytesAvailable);
               copyBodyBuffer.position = 0;
               bodyBuffer = null;
            }
            copyBodyBuffer.position = 0;
            (handler as b_166).a_2224(authenPackageHeader,copyBodyBuffer);
            return true;
         }
         trace("Can\'t find the handler or module for MessageID:" + authenPackageHeader.shMessageID);
         bodyBuffer = null;
         return false;
      }
      
      public function a_2206(tcpConn:a_2650, messageId:uint, protocalBody:ByteArray, optionBuffer:ByteArray = null) : Boolean
      {
         return false;
      }
   }
}

