package a_4770
{
   import a_4716.EnmConnLoginStatus;
   import a_4716.EnmPlayerProfileInfoType;
   import a_4716.b_154;
   import a_4728.a_1778;
   import a_4729.EventType;
   import a_4729.a_1789;
   import a_4758.a_2208;
   import a_4759.b_167;
   import a_4760.a_2256;
   import a_4771.a_2648;
   import a_4771.a_2650;
   import a_4788.a_4648;
   import com.aurora.protocol.common.a_2670;
   import com.aurora.protocol.logicserver.CProfileInfoItem;
   import com.aurora.protocol.logicserver.CWebBaseInfo;
   import com.aurora.protocol.logicserver.a_2920;
   import com.aurora.protocol.logicserver.a_2921;
   import com.aurora.protocol.logicserver.a_2935;
   import com.aurora.protocol.logicserver.a_2945;
   import com.aurora.protocol.logicserver.a_2946;
   import com.aurora.protocol.logicserver.a_2960;
   import com.aurora.protocol.profile.CUserBaseProfile;
   import flash.events.Event;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   
   public class a_2631 extends b_167
   {
      
      private static var a_849:a_2631;
      
      private var currTime:Number = 0;
      
      public function a_2631()
      {
         super();
         a_2247(b_154.a_125,this.a_2634);
         a_2247(b_154.a_126,this.a_2635);
         a_2247(b_154.a_127,this.a_2636);
      }
      
      public static function getInstance() : a_2631
      {
         if(null == a_849)
         {
            a_849 = new a_2631();
         }
         return a_849;
      }
      
      public function a_2334(iServerID:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var requestLogicServerLogic:a_2920 = new a_2920();
         requestLogicServerLogic.m_iLobbyVersion = 10000;
         requestLogicServerLogic.m_szAccount = a_2208.getInstance().getAccount();
         requestLogicServerLogic.m_profileCount = 0;
         requestLogicServerLogic.m_iRoleUin = a_2208.getInstance().getUin();
         requestLogicServerLogic.m_iUserSex = a_2208.getInstance().getGender();
         requestLogicServerLogic.m_szRoleName = a_2208.getInstance().getAccount();
         trace("AuthenticateHandler.getInstance().getAccount()=" + a_2208.getInstance().getAccount());
         requestLogicServerLogic.encode(encodeBuffer,encodeLengh);
         requestLogicServerLogic = null;
         var logicConn:a_2650 = a_2256.getInstance().a_2258(iServerID);
         a_4648.a_4649("LoginLogicServer.ip=" + logicConn.host + ",iServerID=" + iServerID + ",tiem=" + getTimer());
         if(pBaseProtocol.a_2201(logicConn,b_154.a_125,encodeBuffer))
         {
            logicConn.m_iLoginStatus = EnmConnLoginStatus.enmLogining;
            return true;
         }
         return false;
      }
      
      public function a_2632(iServerID:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var requestLogoutLogic:a_2921 = new a_2921();
         requestLogoutLogic.m_iTime = new Date().valueOf();
         requestLogoutLogic.encode(encodeBuffer,encodeLengh);
         requestLogoutLogic = null;
         var logicConn:a_2650 = a_2256.getInstance().a_2258(iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.a_126,encodeBuffer);
      }
      
      public function a_2633(serverId:int, userBaseProfile:CUserBaseProfile) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var requestUpdateProfile:a_2935 = new a_2935();
         requestUpdateProfile.m_byCount = 1;
         var profileItem:CProfileInfoItem = new CProfileInfoItem();
         profileItem.m_byProfileInfoType = EnmPlayerProfileInfoType.enmPlayerProfileInfoType_webbaseinfo;
         profileItem.m_stWebBaseInfo = new CWebBaseInfo();
         profileItem.m_stWebBaseInfo.m_szNickName = userBaseProfile.m_szNickName;
         profileItem.m_stWebBaseInfo.m_nFlag |= 2 - userBaseProfile.m_sex;
         profileItem.m_stWebBaseInfo.m_nFaceID = userBaseProfile.m_shFaceID;
         profileItem.m_stWebBaseInfo.m_iFaceVersion = userBaseProfile.m_iFaceVersion;
         profileItem.m_stWebBaseInfo.m_szSmallFaceURL = userBaseProfile.m_szSmallFaceURL;
         profileItem.m_stWebBaseInfo.m_szMiddleFaceURL = userBaseProfile.m_szMiddleFaceURL;
         profileItem.m_stWebBaseInfo.m_szLargeFaceURL = userBaseProfile.m_szLargeFaceURL;
         requestUpdateProfile.m_arrstProfileInfo = new Array();
         requestUpdateProfile.m_arrstProfileInfo.push(profileItem);
         requestUpdateProfile.encode(encodeBuffer,encodeLengh);
         requestUpdateProfile = null;
         var logicConn:a_2650 = a_2256.getInstance().a_2258(serverId);
         return pBaseProtocol.a_2201(logicConn,b_154.a_127,encodeBuffer);
      }
      
      private function a_2634(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var tcpConnection:a_2650 = null;
         var a_4730:a_1778 = null;
         var responseLogicServerLogin:a_2945 = new a_2945();
         if(responseLogicServerLogin.decode(protocalBuffer,decode_length))
         {
            tcpConnection = a_2648.getInstance().getTcpConnection(a_787.m_iServerType,a_787.m_iServerID);
            tcpConnection.m_iPlayerID = responseLogicServerLogin.m_iPlayerID;
            tcpConnection.m_iLoginStatus = EnmConnLoginStatus.enmLogined;
            a_4648.a_4649("OnLoginLogic.ip=" + tcpConnection.host + ",iServerID=" + a_787.m_iServerID + ",time=" + getTimer());
            a_4730 = new a_1778(EventType.a_568);
            a_4730.dataObject = {
               "iServerID":a_787.m_iServerID,
               "arrRoomSession":responseLogicServerLogin.m_arrRoomSessions
            };
            a_1789.getInstance().dispatchEvent(a_4730);
         }
         else
         {
            a_4648.a_4649("OnLoginLogic.Error time=" + getTimer());
         }
      }
      
      private function a_2635(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var responseLogoutLogic:a_2946 = new a_2946();
         if(responseLogoutLogic.decode(protocalBuffer,decode_length))
         {
            a_1789.getInstance().dispatchEvent(new Event(EventType.a_572));
         }
      }
      
      private function a_2636(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var responseUpdateProfile:a_2960 = new a_2960();
         if(responseUpdateProfile.decode(protocalBuffer,decode_length))
         {
            a_1789.getInstance().dispatchEvent(new Event(EventType.a_581));
         }
      }
   }
}

