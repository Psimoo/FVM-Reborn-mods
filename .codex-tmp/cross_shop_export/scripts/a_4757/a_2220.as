package a_4757
{
   import a_4716.b_154;
   import a_4716.b_155;
   import a_4716.b_160;
   import a_4722.a_1765;
   import a_4727.b_164;
   import a_4758.a_2208;
   import a_4759.IProtocal;
   import a_4759.b_167;
   import a_4759.b_169;
   import a_4771.a_2650;
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.a_2670;
   import flash.net.LocalConnection;
   import flash.utils.ByteArray;
   
   public class a_2220 implements b_169
   {
      
      private static var a_785:a_2220;
      
      protected static var mapProtocalRoutine:Object = {};
      
      public var authenticateHandler:a_2208;
      
      public var connect_status:int = 0;
      
      private var a_786:int = 0;
      
      public var _localConn:LocalConnection = new LocalConnection();
      
      public function a_2220()
      {
         super();
         this.authenticateHandler = a_2208.getInstance();
      }
      
      public static function getInstance() : a_2220
      {
         if(null == a_785)
         {
            a_785 = new a_2220();
         }
         return a_785;
      }
      
      public function getNextSequence() : uint
      {
         return this.a_786++;
      }
      
      public function getProtocolVersion() : uint
      {
         return 3;
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
      
      public function a_2221(moduleName:String, messageIds:Array) : void
      {
         var messageId:uint = 0;
         if(moduleName == null || messageIds == null)
         {
            trace("RegisterModule failed");
            return;
         }
         this.a_2222(moduleName);
         for each(messageId in messageIds)
         {
            if(null != mapProtocalRoutine[messageId])
            {
               trace("messageId:" + messageId + "exists in mapDecodeRoutines");
            }
            mapProtocalRoutine[messageId] = moduleName;
         }
      }
      
      public function a_2222(moduleName:String) : void
      {
         var property:Object = null;
         if(moduleName == null)
         {
            trace("moduleName is null, UnregisterProtocal failed");
            return;
         }
         for(property in mapProtocalRoutine)
         {
            if(mapProtocalRoutine[property] == moduleName)
            {
               delete mapProtocalRoutine[property];
            }
         }
      }
      
      public function a_2201(tcpConn:a_2650, messageId:uint, protocalBody:ByteArray, optionBuffer:ByteArray = null) : Boolean
      {
         var encode_length:int = 0;
         var authenKey:ByteArray = null;
         if(null == tcpConn)
         {
            trace("tcpConn is null");
            return false;
         }
         if(protocalBody == null)
         {
            trace("protocalBody is null  OR baseProtocal is not connected, status:" + this.connect_status);
            return false;
         }
         if(null == this.authenticateHandler || null == this.authenticateHandler.getAuthenKey() || this.authenticateHandler.getAuthenKey().length <= 0)
         {
            trace("authenticateHandler is null or \"\" == authenticateHandler.getAuthenKey()");
            return false;
         }
         if(optionBuffer == null)
         {
            optionBuffer = new ByteArray();
         }
         if(false == tcpConn.connected || null == tcpConn.m_szSessionKey)
         {
            authenKey = this.authenticateHandler.getAuthenKey();
            tcpConn.m_szSessionKey = new ByteArray();
            tcpConn.m_szSessionKey.writeBytes(authenKey,0,authenKey.length);
            optionBuffer.length = 0;
            optionBuffer.writeBytes(this.authenticateHandler.getSignature(),0,this.authenticateHandler.getSignature().length);
         }
         var shHeaderLength:int = b_154.a_331 + optionBuffer.length;
         var tcpSessionKey:ByteArray = tcpConn.m_szSessionKey;
         var decryptBuffer:ByteArray = new ByteArray();
         a_2664.encode_int32(decryptBuffer,this.getNextSequence());
         decryptBuffer.writeBytes(protocalBody,0,protocalBody.length);
         var encryptOutBuffer:ByteArray = new ByteArray();
         var nEncryptLength:int = int(b_164.a_1772(decryptBuffer,encryptOutBuffer,tcpSessionKey));
         var nPackageLength:uint = b_154.a_331 + optionBuffer.length + nEncryptLength;
         var stMessageHeader:a_2670 = new a_2670();
         stMessageHeader.nPackageLength = nPackageLength;
         stMessageHeader.nUIN = this.authenticateHandler.getRawUin();
         stMessageHeader.shFlag = b_155.b_157;
         stMessageHeader.shOptionalLen = optionBuffer.length;
         stMessageHeader.lpbyOptional = optionBuffer;
         stMessageHeader.shHeaderLen = shHeaderLength;
         stMessageHeader.shMessageID = messageId;
         stMessageHeader.shMessageType = b_154.a_104;
         stMessageHeader.shVersion = this.getProtocolVersion();
         stMessageHeader.nPlayerID = tcpConn.m_iPlayerID;
         var packageBytes:ByteArray = new ByteArray();
         stMessageHeader.encode(packageBytes,encode_length);
         packageBytes.writeBytes(encryptOutBuffer,0,encryptOutBuffer.length);
         decryptBuffer = null;
         encryptOutBuffer = null;
         if(!tcpConn.a_2651(packageBytes))
         {
            trace("tcpConn.SendDate(packageBytes) failed");
            return false;
         }
         if(false == tcpConn.connected)
         {
            if(!tcpConn.reconnect())
            {
               trace("reconnect server: " + tcpConn.host + ":" + tcpConn.port + " failed.");
               return false;
            }
         }
         packageBytes = null;
         return true;
      }
      
      public function a_2204(stServerInfo:a_1765, tcpSessionKey:ByteArray, packageBuffer:ByteArray) : void
      {
         var decodeLenght:int = 0;
         var nEncryptedLength:uint = 0;
         var nDecodeRound:int = 0;
         var arrDecryptedPart:ByteArray = null;
         var arrEncryptedPart:ByteArray = null;
         var nDecryptedDataLength:uint = 0;
         var startPosition:int = int(packageBuffer.position);
         var stMessageHeader:a_2670 = new a_2670();
         stMessageHeader.decode(packageBuffer,decodeLenght);
         if(0 > stMessageHeader.shOptionalLen)
         {
            trace("stMessageHeader.shOptionalLen less than 0, exit");
            return;
         }
         var nDecodedSize:int = packageBuffer.position - startPosition;
         if(0 >= nDecodedSize)
         {
            trace("nDecodedSize must > 0 return");
            return;
         }
         if(stMessageHeader.nPackageLength <= nDecodedSize)
         {
            trace("nPackageLength[" + stMessageHeader.nPackageLength + "] must > nDecodedSize[" + nDecodedSize + "  return");
            return;
         }
         if(0 < nDecodedSize && stMessageHeader.nPackageLength > nDecodedSize)
         {
            nEncryptedLength = stMessageHeader.nPackageLength - nDecodedSize;
            if(0 == (stMessageHeader.shFlag & b_160.b_162))
            {
               stMessageHeader.nSequence = a_2664.decode_int32(packageBuffer);
               nEncryptedLength -= 4;
               this.a_2205(stMessageHeader,packageBuffer,stServerInfo);
               return;
            }
            if(0 < packageBuffer.bytesAvailable)
            {
               nDecodeRound = -32;
               if(0 != (stMessageHeader.shFlag & b_155.b_158))
               {
                  nDecodeRound = -8;
               }
               arrDecryptedPart = new ByteArray();
               arrEncryptedPart = new ByteArray();
               arrEncryptedPart.writeBytes(packageBuffer,packageBuffer.position,packageBuffer.length - packageBuffer.position);
               arrEncryptedPart.position = 0;
               nDecryptedDataLength = b_164.a_1775(arrEncryptedPart,arrDecryptedPart,tcpSessionKey,nDecodeRound);
               if(0 < nDecryptedDataLength)
               {
                  arrDecryptedPart.position = 0;
                  if(arrDecryptedPart.length > 4)
                  {
                     stMessageHeader.nSequence = a_2664.decode_int32(arrDecryptedPart);
                     nDecryptedDataLength -= 4;
                     this.a_2205(stMessageHeader,arrDecryptedPart,stServerInfo);
                  }
                  return;
               }
               throw new Error("ERROR: nDecryptedDataLength  must > 0");
            }
         }
      }
      
      public function a_2205(csPackageHeader:a_2670, bodyBuffer:ByteArray, stServerInfo:a_1765) : Boolean
      {
         var copyBodyBuffer:ByteArray = null;
         var handler:Object = mapProtocalRoutine[csPackageHeader.shMessageID];
         if(null != handler && handler is b_167)
         {
            copyBodyBuffer = new ByteArray();
            if(null != bodyBuffer)
            {
               copyBodyBuffer.writeBytes(bodyBuffer,bodyBuffer.position,bodyBuffer.bytesAvailable);
               bodyBuffer = null;
            }
            copyBodyBuffer.position = 0;
            (handler as b_167).a_2204(csPackageHeader,copyBodyBuffer,stServerInfo);
            return true;
         }
         if(null != handler && handler is String)
         {
            copyBodyBuffer = new ByteArray();
            if(null != bodyBuffer)
            {
               copyBodyBuffer.writeBytes(bodyBuffer,bodyBuffer.position,bodyBuffer.bytesAvailable);
               bodyBuffer = null;
            }
            copyBodyBuffer.position = 0;
            this._localConn.send(handler as String,"a_2204",csPackageHeader,copyBodyBuffer,stServerInfo);
            return true;
         }
         trace("Can\'t find the handler or module for MessageID:" + csPackageHeader.shMessageID);
         bodyBuffer = null;
         return false;
      }
      
      public function a_2206(tcpConn:a_2650, messageId:uint, protocalBody:ByteArray, optionBuffer:ByteArray = null) : Boolean
      {
         var encode_length:int = 0;
         var szLocalKey:String = null;
         if(null == tcpConn)
         {
            trace("tcpConn is null");
            return false;
         }
         if(protocalBody == null)
         {
            trace("protocalBody is null  OR baseProtocal is not connected, status:" + this.connect_status);
            return false;
         }
         if(optionBuffer == null)
         {
            optionBuffer = new ByteArray();
         }
         if(false == tcpConn.connected || null == tcpConn.m_szSessionKey)
         {
            szLocalKey = this.authenticateHandler.getLocalKey();
            tcpConn.m_szSessionKey = new ByteArray();
            tcpConn.m_szSessionKey.writeUTFBytes(szLocalKey);
         }
         var shHeaderLength:int = b_154.a_331 + optionBuffer.length;
         var tcpSessionKey:ByteArray = tcpConn.m_szSessionKey;
         var decryptBuffer:ByteArray = new ByteArray();
         a_2664.encode_int32(decryptBuffer,this.getNextSequence());
         decryptBuffer.writeBytes(protocalBody,0,protocalBody.length);
         var encryptOutBuffer:ByteArray = new ByteArray();
         var nEncryptLength:int = int(b_164.a_1772(decryptBuffer,encryptOutBuffer,tcpSessionKey));
         var nPackageLength:uint = b_154.a_331 + optionBuffer.length + nEncryptLength;
         var stMessageHeader:a_2670 = new a_2670();
         stMessageHeader.nPackageLength = nPackageLength;
         stMessageHeader.nUIN = this.authenticateHandler.getRawUin();
         stMessageHeader.shFlag = b_155.b_159;
         stMessageHeader.shOptionalLen = optionBuffer.length;
         stMessageHeader.lpbyOptional = optionBuffer;
         stMessageHeader.shHeaderLen = shHeaderLength;
         stMessageHeader.shMessageID = messageId;
         stMessageHeader.shMessageType = b_154.a_104;
         stMessageHeader.shVersion = this.getProtocolVersion();
         stMessageHeader.nPlayerID = tcpConn.m_iPlayerID;
         var packageBytes:ByteArray = new ByteArray();
         stMessageHeader.encode(packageBytes,encode_length);
         packageBytes.writeBytes(encryptOutBuffer,0,encryptOutBuffer.length);
         decryptBuffer = null;
         encryptOutBuffer = null;
         if(!tcpConn.a_2651(packageBytes))
         {
            trace("tcpConn.SendDate(packageBytes) failed");
            return false;
         }
         if(false == tcpConn.connected)
         {
            if(!tcpConn.reconnect())
            {
               trace("reconnect server: " + tcpConn.host + ":" + tcpConn.port + " failed.");
               return false;
            }
         }
         packageBytes = null;
         return true;
      }
   }
}

