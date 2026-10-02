package a_4758
{
   import a_4716.EnmAppTypeID;
   import a_4716.b_154;
   import a_4723.RegisterInfo;
   import a_4727.b_164;
   import a_4728.a_1778;
   import a_4729.EventType;
   import a_4729.a_1789;
   import a_4752.GameStringManager;
   import a_4752.a_2036;
   import a_4757.a_2200;
   import a_4759.b_166;
   import a_4771.a_2650;
   import a_4788.a_4648;
   import com.adobe.crypto.MD5;
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.authen.a_2660;
   import com.aurora.protocol.authen.a_2661;
   import com.aurora.protocol.authen.a_2662;
   import com.aurora.protocol.authen.a_2663;
   import com.aurora.protocol.common.a_2667;
   import com.aurora.protocol.hallserver.a_2751;
   import com.aurora.protocol.profile.CUserBaseProfile;
   import com.aurora.ui.maogoutd.doctor.GameDoctor;
   import flash.events.Event;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   import flash.utils.clearInterval;
   import flash.utils.getTimer;
   import flash.utils.setInterval;
   
   public class a_2208 extends b_166
   {
      
      private static var a_776:a_2208;
      
      private static var intervalId:uint = 0;
      
      private var a_777:String = "Authentic@51.COM";
      
      private var a_778:String = "51Auth";
      
      private var a_779:uint = 0;
      
      private var a_780:int = 0;
      
      private var a_781:ByteArray;
      
      private var m_iRawUin:int = -1;
      
      private var a_782:String = "";
      
      private var m_iMyUin:int = -1;
      
      private var m_szAccount:String = "";
      
      private var m_nUserType:int = 0;
      
      private var m_iUserSex:int = -1;
      
      private var m_szSessionKey:ByteArray = new ByteArray();
      
      private var a_783:ByteArray = new ByteArray();
      
      private var a_784:ByteArray = new ByteArray();
      
      public var m_stUserBaseProfile:CUserBaseProfile;
      
      public var a_812:a_2751;
      
      private var currTime:int;
      
      public function a_2208()
      {
         super();
         a_2247(b_154.a_110,this.a_2214);
         a_2247(b_154.a_114,this.a_2215);
         a_2246(a_2200.getInstance());
      }
      
      public static function getInstance() : a_2208
      {
         if(null == a_776)
         {
            a_776 = new a_2208();
         }
         return a_776;
      }
      
      public static function a_2216() : void
      {
         a_2208.getInstance().a_2211();
      }
      
      public static function a_2217() : Boolean
      {
         if(intervalId == 0)
         {
            intervalId = setInterval(a_2216,10 * 60 * 1000);
            trace("AuthenticateHandler renewAuthenticate started, intervalId:" + intervalId);
            return true;
         }
         trace("AuthenticateHandler renewAuthenticate has been started return failed, intervalId:" + intervalId);
         return false;
      }
      
      public static function a_2218() : Boolean
      {
         if(intervalId > 0)
         {
            clearInterval(intervalId);
            intervalId = 0;
         }
         return true;
      }
      
      public function getUin() : int
      {
         return this.m_iMyUin;
      }
      
      public function getRawUin() : int
      {
         return this.m_iRawUin;
      }
      
      public function getAccount() : String
      {
         return this.m_szAccount;
      }
      
      public function getRawAccount() : String
      {
         return this.a_782;
      }
      
      public function getGender() : int
      {
         return this.m_iUserSex;
      }
      
      public function getLocalKey() : String
      {
         return this.a_777;
      }
      
      public function getAuthenKey() : ByteArray
      {
         return this.m_szSessionKey;
      }
      
      public function getSignature() : ByteArray
      {
         return this.a_783;
      }
      
      public function get passwordHash() : ByteArray
      {
         return this.a_784;
      }
      
      public function getNextSequence() : uint
      {
         return this.a_780++;
      }
      
      public function a_2209(account:String, nUserType:uint, password:String, nSourceAppId:int = 0, szMemoryBuffer:ByteArray = null) : Boolean
      {
         if(account.length < 1 || account.length > 32)
         {
            trace("account lenght: " + account.length + " error");
            GameDoctor.instance.pushInCache({"type":"ce"},GameStringManager.getInstance().getString(132613),"account lenght: " + account.length + " error",{"cpShow":true});
            return false;
         }
         if("" == password)
         {
            trace("password can not null");
            GameDoctor.instance.pushInCache({"type":"ce"},GameStringManager.getInstance().getString(132614),"password can not null",{"cpShow":true});
            return false;
         }
         var passwordMd5:String = MD5.hash(password);
         this.a_784.position = 0;
         this.a_784.endian = Endian.LITTLE_ENDIAN;
         this.a_784.writeUnsignedInt(MD5.digest.readUnsignedInt());
         this.a_784.writeUnsignedInt(MD5.digest.readUnsignedInt());
         this.a_784.writeUnsignedInt(MD5.digest.readUnsignedInt());
         this.a_784.writeUnsignedInt(MD5.digest.readUnsignedInt());
         this.a_784.position = 0;
         this.a_784.endian = Endian.BIG_ENDIAN;
         MD5.digest.position = 0;
         var finalBuffer:ByteArray = new ByteArray();
         a_2664.encode_int32(finalBuffer,this.getNextSequence());
         var encode_lenght:int = 0;
         var requestAuthen:a_2661 = new a_2661();
         requestAuthen.account = account;
         requestAuthen.m_nUserType = nUserType;
         this.a_784.position = 0;
         requestAuthen.passwordMd5Key = this.a_784;
         requestAuthen.sourceAppID = nSourceAppId;
         requestAuthen.targetAppID = 0;
         requestAuthen.m_nMemorySize = szMemoryBuffer is ByteArray ? int(szMemoryBuffer.length) : 0;
         requestAuthen.m_szMemoryBuffer = szMemoryBuffer;
         requestAuthen.encode(finalBuffer,encode_lenght);
         finalBuffer.position = 0;
         var authenKey:ByteArray = new ByteArray();
         authenKey.writeUTFBytes(this.a_777);
         this.a_781 = new ByteArray();
         b_164.a_1772(finalBuffer,this.a_781,authenKey);
         a_4648.a_4649("RequestAuthenticate.ip=" + a_2200.getInstance().authenConn.host + ",account=" + account + ",time=" + getTimer());
         GameDoctor.instance.pushInCache({"type":"cc"},"<font color=\'#ee1111\'>" + account + "</font>" + GameStringManager.getInstance().getString(132615),GameStringManager.getInstance().getString(132616) + a_2200.getInstance().authenConn.host,{});
         return pBaseProtocol.a_2201(null,b_154.a_109,this.a_781);
      }
      
      public function a_2210() : Boolean
      {
         a_4648.a_4649("RefreshAuthenticate.account=" + this.m_szAccount + ",time=" + getTimer());
         GameDoctor.instance.pushInCache({"type":"cc"},"<font color=\'#ee1111\'>" + this.m_szAccount + "</font>" + GameStringManager.getInstance().getString(132618),"",{});
         a_2200.getInstance().authenConn.close();
         trace("m_szFinalFinalBuffer:" + this.a_781 + "m_szFinalFinalBuffer.length:" + this.a_781.length);
         if(null != this.a_781 && this.a_781.length > 0)
         {
            trace("ReAuthenticate now:" + new Date().toDateString());
            return pBaseProtocol.a_2201(null,b_154.a_109,this.a_781);
         }
         GameDoctor.instance.pushInCache({"type":"ce"},this.m_szAccount + GameStringManager.getInstance().getString(132619),"",{});
         trace("ReAuthenticate Failed, m_szFinalFinalBuffer == null or length <=0  time:" + new Date().toDateString());
         return false;
      }
      
      public function a_2211() : Boolean
      {
         GameDoctor.instance.pushInCache({"type":"cc"},"<font color=\'#ee1111\'>" + this.m_szAccount + "</font>" + GameStringManager.getInstance().getString(132618),"",{});
         var finalBuffer:ByteArray = new ByteArray();
         a_2664.encode_int32(finalBuffer,this.getNextSequence());
         var encode_lenght:int = 0;
         var requestAuthen:a_2661 = new a_2661();
         requestAuthen.account = this.a_782;
         requestAuthen.m_nUserType = this.m_nUserType;
         this.a_784.position = 0;
         requestAuthen.passwordMd5Key = this.a_784;
         requestAuthen.sourceAppID = EnmAppTypeID.enm_apptype_game_normal;
         requestAuthen.targetAppID = EnmAppTypeID.enm_apptype_game_renew_signature;
         requestAuthen.m_nMemorySize = this.a_783.length;
         requestAuthen.m_szMemoryBuffer = this.a_783;
         requestAuthen.encode(finalBuffer,encode_lenght);
         finalBuffer.position = 0;
         var authenKey:ByteArray = new ByteArray();
         authenKey.writeUTFBytes(this.a_777);
         this.a_781 = new ByteArray();
         b_164.a_1772(finalBuffer,this.a_781,authenKey);
         return pBaseProtocol.a_2201(null,b_154.a_109,this.a_781);
      }
      
      public function a_2212(iNewUin:int, szNewAccount:String, byGender:int) : Boolean
      {
         if(iNewUin <= 0 || "" == szNewAccount)
         {
            return false;
         }
         this.m_iMyUin = iNewUin;
         this.m_szAccount = szNewAccount;
         this.m_iUserSex = byGender;
         return true;
      }
      
      public function a_2213(registerInfo:RegisterInfo) : Boolean
      {
         if(null == registerInfo)
         {
            trace("registerInfo is null error");
            return false;
         }
         if(registerInfo.m_szAccount == null || registerInfo.m_szAccount.length < 1 || registerInfo.m_szAccount.length > 32)
         {
            trace("registerInfo.m_szAccount is null, account lenght: " + registerInfo.m_szAccount.length + " error");
            return false;
         }
         if("" == registerInfo.m_szPassword)
         {
            trace("password can not null");
            return false;
         }
         var finalBuffer:ByteArray = new ByteArray();
         a_2664.encode_int32(finalBuffer,this.getNextSequence());
         var encode_lenght:int = 0;
         var accountRegisterRequest:a_2660 = new a_2660();
         accountRegisterRequest.m_szAccount = registerInfo.m_szAccount;
         accountRegisterRequest.m_szPassword = registerInfo.m_szPassword;
         accountRegisterRequest.m_szNickName = registerInfo.m_szNickName;
         accountRegisterRequest.m_bySex = registerInfo.m_bySex;
         accountRegisterRequest.encode(finalBuffer,encode_lenght);
         finalBuffer.position = 0;
         var finalFinalBuffer:ByteArray = new ByteArray();
         var authenKey:ByteArray = new ByteArray();
         authenKey.writeUTFBytes(this.a_777);
         b_164.a_1772(finalBuffer,finalFinalBuffer,authenKey);
         finalFinalBuffer.position = 0;
         return pBaseProtocol.a_2201(null,b_154.a_114,finalFinalBuffer);
      }
      
      private function a_2214(authenPackageHeader:a_2667, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var authenResponse:a_2663 = new a_2663();
         if(!authenResponse.decode(protocalBuffer,decode_length))
         {
            trace("decode the Authenticate response failed!");
            GameDoctor.instance.pushInCache({"type":"ce"},GameStringManager.getInstance().getString(132620),"",{"cpShow":true});
            return;
         }
         var authenConn:a_2650 = a_2200.getInstance().authenConn;
         if(0 == authenResponse.m_nResultID)
         {
            a_4648.a_4649("OnAuthenticate.ip=" + authenConn.host + ",iUin=" + authenResponse.m_iUIN + ",time=" + getTimer());
            GameDoctor.instance.pushInCache({"type":"cc"},GameStringManager.getInstance().getString(132621),"",{});
            this.m_szSessionKey.length = 0;
            this.a_783.length = 0;
            this.m_szSessionKey.writeBytes(authenResponse.m_szSessionKey,0,authenResponse.m_szSessionKey.length);
            this.a_783.writeBytes(authenResponse.m_szPlayerSignature,0,authenResponse.m_szPlayerSignature.length);
            a_2036.getInstance().setSignature(this.a_783);
            if(this.m_iMyUin < 0)
            {
               this.m_iMyUin = authenResponse.m_iUIN;
            }
            this.m_iRawUin = authenResponse.m_iUIN;
            a_2036.getInstance().m_iUin = authenResponse.m_iUIN;
            if("" == this.m_szAccount)
            {
               this.m_szAccount = authenResponse.m_szAccount;
            }
            this.a_782 = authenResponse.m_szAccount;
            this.m_nUserType = authenResponse.m_nUserType;
            this.a_779 = new Date().valueOf() / 1000;
            a_1789.getInstance().dispatchEvent(new Event(EventType.a_569));
         }
         else
         {
            trace("request Authenticate by passwordhash failed:" + authenResponse.m_szReasonMsg);
            a_4648.a_4649("OnAuthenticate.ip=" + authenConn.host + ",Failed=" + authenResponse.m_szReasonMsg + ",time=" + getTimer());
            GameDoctor.instance.pushInCache({"type":"ce"},GameStringManager.getInstance().getString(132622),"ResultID:" + authenResponse.m_nResultID,{});
            a_1789.getInstance().dispatchEvent(new Event(EventType.a_597));
         }
      }
      
      private function a_2215(authenPackageHeader:a_2667, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         authenPackageHeader.nPlayerID;
         var accountRegisterResponse:a_2662 = new a_2662();
         if(accountRegisterResponse.decode(protocalBuffer,decode_length))
         {
            trace(accountRegisterResponse);
            dataEvent = new a_1778(EventType.a_573);
            dataEvent.dataObject = accountRegisterResponse.m_nResultID;
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
      }
   }
}

