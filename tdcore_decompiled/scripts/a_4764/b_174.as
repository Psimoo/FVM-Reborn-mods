package a_4764
{
   import a_4716.EnmConsortia;
   import a_4716.b_154;
   import a_4728.a_1778;
   import a_4729.EventType;
   import a_4729.a_1789;
   import a_4759.b_167;
   import a_4760.a_2251;
   import a_4771.a_2650;
   import com.aurora.protocol.common.a_2670;
   import com.aurora.protocol.hallserver.a_2817;
   import com.aurora.protocol.hallserver.a_2859;
   import com.aurora.protocol.hallserver.consortia.a_2765;
   import com.aurora.protocol.hallserver.consortia.a_2766;
   import com.aurora.protocol.hallserver.consortia.a_2767;
   import com.aurora.protocol.hallserver.consortia.a_2768;
   import com.aurora.protocol.hallserver.consortia.a_2769;
   import com.aurora.protocol.hallserver.consortia.a_2770;
   import com.aurora.protocol.hallserver.consortia.a_2771;
   import com.aurora.protocol.hallserver.consortia.a_2772;
   import com.aurora.protocol.hallserver.consortia.a_2773;
   import com.aurora.protocol.hallserver.consortia.a_2774;
   import com.aurora.protocol.hallserver.consortia.a_2775;
   import com.aurora.protocol.hallserver.consortia.a_2776;
   import com.aurora.protocol.hallserver.consortia.a_2777;
   import com.aurora.protocol.hallserver.consortia.a_2778;
   import com.aurora.protocol.hallserver.consortia.a_2779;
   import com.aurora.protocol.hallserver.consortia.a_2780;
   import com.aurora.protocol.hallserver.consortia.a_2781;
   import com.aurora.protocol.hallserver.consortia.a_2782;
   import com.aurora.protocol.hallserver.consortia.a_2783;
   import com.aurora.protocol.hallserver.consortia.a_2791;
   import com.aurora.protocol.hallserver.consortia.a_2792;
   import com.aurora.protocol.hallserver.consortia.a_2793;
   import com.aurora.protocol.hallserver.consortia.a_2794;
   import com.aurora.protocol.hallserver.consortia.a_2795;
   import com.aurora.protocol.hallserver.consortia.a_2796;
   import com.aurora.protocol.hallserver.consortia.a_2798;
   import com.aurora.protocol.hallserver.consortia.a_2799;
   import com.aurora.protocol.hallserver.consortia.a_2800;
   import com.aurora.protocol.hallserver.consortia.a_2801;
   import com.aurora.protocol.hallserver.consortia.a_2802;
   import com.aurora.protocol.hallserver.consortia.a_2803;
   import com.aurora.protocol.hallserver.consortia.a_2804;
   import com.aurora.protocol.hallserver.consortia.a_2805;
   import com.aurora.protocol.hallserver.consortia.a_2806;
   import com.aurora.protocol.hallserver.consortia.a_2807;
   import com.aurora.protocol.hallserver.consortia.a_2808;
   import com.aurora.protocol.hallserver.consortia.a_2809;
   import com.aurora.protocol.hallserver.consortia.a_2810;
   import com.aurora.protocol.hallserver.consortia.a_2811;
   import flash.events.IEventDispatcher;
   import flash.utils.ByteArray;
   
   public class b_174 extends b_167
   {
      
      private static var _instance:b_174;
      
      public function b_174(target:IEventDispatcher = null)
      {
         super(target);
         this.init();
      }
      
      public static function getInstance() : b_174
      {
         if(null == _instance)
         {
            _instance = new b_174();
         }
         return _instance;
      }
      
      private function init() : void
      {
         a_2247(b_154.a_179,this.a_2311);
         a_2247(b_154.a_180,this.a_2312);
         a_2247(b_154.a_204,this.a_2312);
         a_2247(b_154.a_181,this.a_2313);
         a_2247(b_154.a_182,this.a_2314);
         a_2247(b_154.a_183,this.a_2315);
         a_2247(b_154.a_184,this.a_2316);
         a_2247(b_154.a_185,this.a_2317);
         a_2247(b_154.a_186,this.a_2318);
         a_2247(b_154.a_187,this.a_2319);
         a_2247(b_154.a_191,this.a_2320);
         a_2247(b_154.a_190,this.a_2321);
         a_2247(b_154.a_192,this.a_2322);
         a_2247(b_154.a_193,this.a_2323);
         a_2247(b_154.a_194,this.a_2324);
         a_2247(b_154.a_195,this.a_2325);
         a_2247(b_154.a_197,this.a_2326);
         a_2247(b_154.a_199,this.a_2327);
         a_2247(b_154.a_200,this.a_2328);
         a_2247(b_154.a_201,this.a_2329);
         a_2247(b_154.a_202,this.a_2330);
         a_2247(b_154.a_205,this.a_2331);
      }
      
      public function a_2309(arrUins:Array, iFlag:int = -1) : Boolean
      {
         var encodeLengh:int = 0;
         if(!arrUins is Array || arrUins.length <= 0)
         {
            trace("arrUins is null or arrUins.length <= 0");
            return false;
         }
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2817 = new a_2817();
         request.m_nUserCount = arrUins.length;
         request.m_arrUin = arrUins;
         request.m_iFlag = iFlag;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallServerConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallServerConn,b_154.a_290,encodeBuffer);
      }
      
      public function a_2310(aryRoleUin:Array) : Boolean
      {
         var encodeLengh:int = 0;
         if(aryRoleUin == null || aryRoleUin.length == 0)
         {
            return false;
         }
         if(aryRoleUin.length > 200)
         {
            throw new Error("每次请求的数据不能超过100个！");
         }
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2859 = new a_2859();
         request.m_nCount = aryRoleUin.length;
         request.m_aryRoleUin = aryRoleUin;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_332,encodeBuffer);
      }
      
      public function createConsortiaRequest(pData:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2766 = new a_2766();
         request.m_szConsortiaName = pData.consortiaName;
         request.m_szConsortiaDesc = pData.consortiaDesc;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_179,encodeBuffer);
      }
      
      public function disengageConsortiaRequest(pData:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2767 = new a_2767();
         request.m_iConsortiaID = pData.m_iID;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         var msg_id:uint = pData.flag == EnmConsortia.enm_disengage ? b_154.a_180 : b_154.a_204;
         return pBaseProtocol.a_2201(hallConn,msg_id,encodeBuffer);
      }
      
      public function getConsortiaInfoRequest(pData:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2769 = new a_2769();
         request.m_iConsortiaID = pData.m_iConsortiaID;
         request.m_iFlag = pData.m_iFlag;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_181,encodeBuffer);
      }
      
      public function updateConsortiaInfoRequest(pData:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2780 = new a_2780();
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_182,encodeBuffer);
      }
      
      public function requestJoinConsortiaRequest(pData:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2774 = new a_2774();
         request.m_iConsortiaID = pData.m_iID;
         request.m_szComment = pData.m_szComment;
         request.m_cCmd = pData.m_cCmd;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_183,encodeBuffer);
      }
      
      public function responseJoinConsortiaRequest(pData:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2775 = new a_2775();
         request.m_iConsortiaID = pData.m_iConsortiaID;
         request.m_iProposerUIN = pData.m_iUIN;
         request.m_iRefuse = pData.m_iRefuse;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_184,encodeBuffer);
      }
      
      public function getConsortiaBriefRequest(pData:Object, iType:int = 0) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2768 = new a_2768();
         request.m_nAdjust = iType;
         if(iType == 0)
         {
            if(pData as Array)
            {
               request.m_aryConsortia = pData as Array;
               request.m_nCount = request.m_aryConsortia.length;
               request.m_szConsortiaName = "";
            }
            else
            {
               request.m_aryConsortia = [];
               request.m_nCount = 0;
               request.m_szConsortiaName = String(pData);
            }
         }
         else if(pData as Array)
         {
            request.m_aryConsortia = pData as Array;
            request.m_nCount = request.m_aryConsortia.length;
            request.m_szConsortiaName = "";
         }
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_185,encodeBuffer);
      }
      
      public function kickConsortiaMemberRequest(pData:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2773 = new a_2773();
         request.m_iConsortiaID = pData.m_iConsortiaID;
         request.m_iBeKickUIN = pData.m_iBeKickUIN;
         request.m_szReason = pData.m_szReason;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_186,encodeBuffer);
      }
      
      public function setConsortiaAdminRequest(pData:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2776 = new a_2776();
         request.m_iConsortiaID = pData.m_iConsortiaID;
         request.m_iNewAdmin = pData.m_iNewAdmin;
         request.m_iFlag = pData.m_iFlag;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_187,encodeBuffer);
      }
      
      public function consortiaSetNotifyRequest(pData:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2781 = new a_2781();
         request.m_iConsortiaID = pData.m_iConsortiaID;
         request.m_szConsortiaNotify = pData.m_szConsortiaNotify;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_191,encodeBuffer);
      }
      
      public function updatePlayConsortiaDataRequest(pData:Object) : Boolean
      {
         return true;
      }
      
      public function consortiaGetProposerListRequest(pData:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2767 = new a_2767();
         request.m_iConsortiaID = int(pData);
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_189,encodeBuffer);
      }
      
      public function consortiaSetEnounceRequest(pData:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2781 = new a_2781();
         request.m_iConsortiaID = pData.m_iConsortiaID;
         request.m_szConsortiaNotify = pData.m_szConsortiaNotify;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_192,encodeBuffer);
      }
      
      public function consortiaUpgradeRequest(pData:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2782 = new a_2782();
         request.m_iConsortiaID = int(pData);
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_193,encodeBuffer);
      }
      
      public function consortiaSetMemberTitleRequest(pData:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2778 = new a_2778();
         request.m_cTitle = pData.m_cTitle;
         request.m_iConsortiaID = pData.m_iConsortiaID;
         request.m_iDstUIN = pData.m_iDstUIN;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_194,encodeBuffer);
      }
      
      public function getJoinConsortiaInfoRequest(pData:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2770 = new a_2770();
         request.m_iUIN = int(pData);
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_195,encodeBuffer);
      }
      
      public function transferConsortiaMsgRequest(pData:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2779 = new a_2779();
         request.m_iConsortiaID = pData.m_iConsortiaID;
         request.m_nCmd = 0;
         var ba:ByteArray = new ByteArray();
         ba.writeUTFBytes(pData.m_sMsg);
         ba.position = 0;
         request.m_nLen = ba.length;
         request.m_szContent = ba;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_197,encodeBuffer);
      }
      
      public function upgradeConsortiaEstablishmentRequest(pData:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2783 = new a_2783();
         request.m_iConsortiaID = pData.m_iConsortiaID;
         request.m_iEstablishment = pData.m_iEstablishment;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_199,encodeBuffer);
      }
      
      public function setConsortiaEstablishmentRequest(pData:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2777 = new a_2777();
         request.m_arySettings = pData.m_arySettings;
         request.m_iConsortiaID = pData.m_iConsortiaID;
         request.m_iEstablishment = pData.m_iEstablishment;
         request.m_nSettingCount = pData.m_nSettingCount;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_200,encodeBuffer);
      }
      
      public function inviteJoinConsortiaRequest(pData:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2772 = new a_2772();
         request.m_iConsortiaID = pData.m_iConsortiaID;
         request.m_iDstUIN = pData.m_iDstUIN;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_201,encodeBuffer);
      }
      
      public function consortiaContributeRequest(pData:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2765 = new a_2765();
         request.m_iConsortiaID = pData.m_iConsortiaID;
         request.m_iMoney = pData.m_iMoney;
         request.m_iCoin = pData.m_iCoin;
         if(isNaN(request.m_iCoin))
         {
            request.m_iCoin = 0;
         }
         if(isNaN(request.m_iMoney))
         {
            request.m_iMoney = 0;
         }
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_202,encodeBuffer);
      }
      
      private function a_2311(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2792 = new a_2792();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseCreateConsortia failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_665);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2312(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2793 = new a_2793();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseDisengageConsortia failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_666);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2313(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2796 = new a_2796();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseGetConsortiaInfo failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_667);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2314(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2808 = new a_2808();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseUpdateConsortiaInfo failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_668);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2315(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2802 = new a_2802();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseRequestJoinConsortia failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_669);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2316(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2803 = new a_2803();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseResponseJoinConsortia failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_670);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2317(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2795 = new a_2795();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseGetConsortiaBrief failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_671);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2318(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2801 = new a_2801();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseKickConsortiaMember failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_672);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2319(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2804 = new a_2804();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseSetConsortiaAdmin failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_673);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2320(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2809 = new a_2809();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseUpdateConsortiaNotify failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_677);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2321(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2794 = new a_2794();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseGetConsortiaAdminList failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_676);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2322(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2809 = new a_2809();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseUpdateConsortiaNotify failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_678);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2323(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2810 = new a_2810();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseUpgradeConsortia failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_679);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2324(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2806 = new a_2806();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseSetConsortiaMemberTitle failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_680);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2325(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2798 = new a_2798();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseGetJoinConsortiaInfo failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_681);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2326(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2807 = new a_2807();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseTransferConsortiaMsg failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_683);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2327(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2811 = new a_2811();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseUpgradeConsortiaEstablishment failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_685);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2328(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2805 = new a_2805();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseUpgradeConsortiaEstablishment failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_686);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2329(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2800 = new a_2800();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseUpgradeConsortiaEstablishment failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_687);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2330(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2791 = new a_2791();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CSRequestConsortiaContribute failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_688);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function getValidConsortiaIDsRequest(pData:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2771 = new a_2771();
         request.m_iStart = pData.m_iStart;
         request.m_iEnd = pData.m_iEnd;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_205,encodeBuffer);
      }
      
      private function a_2331(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2799 = new a_2799();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseGetValidConsortia failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_689);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
   }
}

