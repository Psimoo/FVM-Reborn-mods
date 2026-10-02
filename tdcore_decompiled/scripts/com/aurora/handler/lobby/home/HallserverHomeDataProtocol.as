package com.aurora.handler.lobby.home
{
   import a_4716.b_154;
   import a_4754.TDHomeUINotify;
   import a_4759.b_167;
   import a_4760.a_2251;
   import a_4771.a_2650;
   import com.aurora.protocol.common.a_2670;
   import com.aurora.protocol.hallserver.home.CSRequestBuyCount;
   import com.aurora.protocol.hallserver.home.CSRequestClearTime;
   import com.aurora.protocol.hallserver.home.CSRequestCook;
   import com.aurora.protocol.hallserver.home.CSRequestFriendHomeInfo;
   import com.aurora.protocol.hallserver.home.CSRequestFunnyCat;
   import com.aurora.protocol.hallserver.home.CSRequestGetAward;
   import com.aurora.protocol.hallserver.home.CSRequestGetHomeInfo;
   import com.aurora.protocol.hallserver.home.CSRequestHarvest;
   import com.aurora.protocol.hallserver.home.CSRequestHistory;
   import com.aurora.protocol.hallserver.home.CSRequestRefrushStar;
   import com.aurora.protocol.hallserver.home.CSRequestStealOven;
   import com.aurora.protocol.hallserver.home.CSRequestStruggleCat;
   import com.aurora.protocol.hallserver.home.SCResponseBuyCount;
   import com.aurora.protocol.hallserver.home.SCResponseClearTime;
   import com.aurora.protocol.hallserver.home.SCResponseCook;
   import com.aurora.protocol.hallserver.home.SCResponseFriendHomeInfo;
   import com.aurora.protocol.hallserver.home.SCResponseFunnyCat;
   import com.aurora.protocol.hallserver.home.SCResponseGetAward;
   import com.aurora.protocol.hallserver.home.SCResponseGetHomeInfo;
   import com.aurora.protocol.hallserver.home.SCResponseHarvest;
   import com.aurora.protocol.hallserver.home.SCResponseHistory;
   import com.aurora.protocol.hallserver.home.SCResponseRefrushStar;
   import com.aurora.protocol.hallserver.home.SCResponseStealOven;
   import com.aurora.protocol.hallserver.home.SCResponseStruggleCat;
   import com.aurora.ui.maogoutd.home.TDHomeUIData;
   import flash.events.IEventDispatcher;
   import flash.utils.ByteArray;
   
   public class HallserverHomeDataProtocol extends b_167
   {
      
      private static var instance:HallserverHomeDataProtocol = new HallserverHomeDataProtocol();
      
      private var hallConn:a_2650;
      
      public function HallserverHomeDataProtocol(target:IEventDispatcher = null)
      {
         super(target);
         this.initail();
         TDHomeUINotify.e.register(this);
      }
      
      public static function getInstance() : HallserverHomeDataProtocol
      {
         return instance;
      }
      
      private function initail() : void
      {
         a_2247(b_154.MSG_HALL_GET_HOME_INFO,this.onResponseHomeInfo);
         a_2247(b_154.MSG_HALL_STRUGGLE_CAT,this.onResponseStruggleCat);
         a_2247(b_154.MSG_HALL_FUNNY_CAT,this.onResponseFunnyCat);
         a_2247(b_154.MSG_HALL_STEAL_OVEN,this.onResponseStealOven);
         a_2247(b_154.MSG_HALL_HOME_GET_AWARD,this.onResponseGetAward);
         a_2247(b_154.MSG_HALL_HARVEST,this.onResponseHarvest);
         a_2247(b_154.MSG_HALL_OVEN_COOK,this.onResponseCook);
         a_2247(b_154.MSG_HALL_HISTORY,this.onResponseHistory);
         a_2247(b_154.MSG_HALL_GET_HOME_STATE,this.onResponseFriendHomeInfo);
         a_2247(b_154.MSG_HALL_RAISE_OVEN,this.onResponseRefrushStar);
         a_2247(b_154.MSG_HALL_CLEAR_FIGHT_CD_TIME,this.onResponseClearTime);
         a_2247(b_154.MSG_HALL_BUY_FIGHTORSTEAL_COUNT,this.onResponseBuyCount);
         this.hallConn = a_2251.getInstance().a_2253();
      }
      
      public function RequestHomeInfoByUin(uin:int) : void
      {
         var length:int = 0;
         var m_stMyHomeInfo:Object = TDHomeUIData.getInstance().m_stMyHomeInfo;
         var request:CSRequestGetHomeInfo = new CSRequestGetHomeInfo();
         if(0 == uin)
         {
            uin = int(m_stMyHomeInfo.m_iUin);
         }
         request.m_iUin = uin;
         var byteArray:ByteArray = new ByteArray();
         request.encode(byteArray,length);
         pBaseProtocol.a_2201(this.hallConn,b_154.MSG_HALL_GET_HOME_INFO,byteArray);
      }
      
      public function onResponseHomeInfo(csPackageHeader:a_2670, byteArray:ByteArray) : void
      {
         var length:int = 0;
         var response:SCResponseGetHomeInfo = new SCResponseGetHomeInfo();
         response.decode(byteArray,length);
         TDHomeUINotify.e.responseInfoByUin(response);
      }
      
      public function RequestStruggleCat(uin:int, name:String) : void
      {
         var length:int = 0;
         var m_stMyHomeInfo:Object = TDHomeUIData.getInstance().m_stMyHomeInfo;
         var byteArray:ByteArray = new ByteArray();
         var request:CSRequestStruggleCat = new CSRequestStruggleCat();
         request.m_iSrcUin = m_stMyHomeInfo.m_iUin;
         request.m_iDstUin = uin;
         request.m_szSrcRoleName = m_stMyHomeInfo.m_szRoleName;
         request.m_szDstRoleName = name;
         request.encode(byteArray,length);
         pBaseProtocol.a_2201(this.hallConn,b_154.MSG_HALL_STRUGGLE_CAT,byteArray);
      }
      
      public function onResponseStruggleCat(csPackageHeader:a_2670, byteArray:ByteArray) : void
      {
         var length:int = 0;
         var response:SCResponseStruggleCat = new SCResponseStruggleCat();
         response.decode(byteArray,length);
         TDHomeUINotify.e.responseStruggleCat(response);
      }
      
      public function RequestStealOven(iHisUin:int, name:String, iOvenId:int) : void
      {
         var length:int = 0;
         var m_stMyHomeInfo:Object = TDHomeUIData.getInstance().m_stMyHomeInfo;
         var byteArray:ByteArray = new ByteArray();
         var request:CSRequestStealOven = new CSRequestStealOven();
         request.m_iSrcUin = m_stMyHomeInfo.m_iUin;
         request.m_iDstUin = iHisUin;
         request.m_szSrcRoleName = m_stMyHomeInfo.m_szRoleName;
         request.m_szDstRoleName = name;
         request.m_iOvenID = iOvenId;
         request.encode(byteArray,length);
         pBaseProtocol.a_2201(this.hallConn,b_154.MSG_HALL_STEAL_OVEN,byteArray);
      }
      
      public function onResponseStealOven(csPackageHeader:a_2670, byteArray:ByteArray) : void
      {
         var length:int = 0;
         var response:SCResponseStealOven = new SCResponseStealOven();
         response.decode(byteArray,length);
         TDHomeUINotify.e.responseStealOven(response);
      }
      
      public function RequestCook(iOvenId:int, propId:int, formulaId:int, iCont:int) : void
      {
         var length:int = 0;
         var m_stMyHomeInfo:Object = TDHomeUIData.getInstance().m_stMyHomeInfo;
         var byteArray:ByteArray = new ByteArray();
         var request:CSRequestCook = new CSRequestCook();
         request.m_iSrcUin = m_stMyHomeInfo.m_iUin;
         request.m_iOvenId = iOvenId;
         request.m_iProduceItemID = propId;
         request.m_iFormulaId = formulaId;
         request.m_iCont = iCont;
         request.encode(byteArray,length);
         pBaseProtocol.a_2201(this.hallConn,b_154.MSG_HALL_OVEN_COOK,byteArray);
      }
      
      public function onResponseCook(csPackageHeader:a_2670, byteArray:ByteArray) : void
      {
         var length:int = 0;
         var response:SCResponseCook = new SCResponseCook();
         response.decode(byteArray,length);
         TDHomeUINotify.e.responseCook(response);
      }
      
      public function RequestHarvest(iOvenId:int) : void
      {
         var length:int = 0;
         var m_stMyHomeInfo:Object = TDHomeUIData.getInstance().m_stMyHomeInfo;
         var byteArray:ByteArray = new ByteArray();
         var request:CSRequestHarvest = new CSRequestHarvest();
         request.m_iSrcUin = m_stMyHomeInfo.m_iUin;
         request.m_iOvenID = iOvenId;
         request.encode(byteArray,length);
         pBaseProtocol.a_2201(this.hallConn,b_154.MSG_HALL_HARVEST,byteArray);
      }
      
      public function onResponseHarvest(csPackageHeader:a_2670, byteArray:ByteArray) : void
      {
         var length:int = 0;
         var response:SCResponseHarvest = new SCResponseHarvest();
         response.decode(byteArray,length);
         TDHomeUINotify.e.responseHarvest(response);
      }
      
      public function RequestGetAward(iAwardId:int) : void
      {
         var length:int = 0;
         var m_stMyHomeInfo:Object = TDHomeUIData.getInstance().m_stMyHomeInfo;
         var byteArray:ByteArray = new ByteArray();
         var request:CSRequestGetAward = new CSRequestGetAward();
         request.m_iSrcUin = m_stMyHomeInfo.m_iUin;
         request.m_iAwardID = iAwardId;
         request.encode(byteArray,length);
         pBaseProtocol.a_2201(this.hallConn,b_154.MSG_HALL_HOME_GET_AWARD,byteArray);
      }
      
      public function onResponseGetAward(csPackageHeader:a_2670, byteArray:ByteArray) : void
      {
         var length:int = 0;
         var response:SCResponseGetAward = new SCResponseGetAward();
         response.decode(byteArray,length);
         TDHomeUINotify.e.responseGetAward(response);
      }
      
      public function RequestFunnyCat() : void
      {
         var length:int = 0;
         var m_stMyHomeInfo:Object = TDHomeUIData.getInstance().m_stMyHomeInfo;
         var byteArray:ByteArray = new ByteArray();
         var request:CSRequestFunnyCat = new CSRequestFunnyCat();
         request.m_iUin = m_stMyHomeInfo.m_iUin;
         request.encode(byteArray,length);
         pBaseProtocol.a_2201(this.hallConn,b_154.MSG_HALL_FUNNY_CAT,byteArray);
      }
      
      public function onResponseFunnyCat(csPackageHeader:a_2670, byteArray:ByteArray) : void
      {
         var length:int = 0;
         var response:SCResponseFunnyCat = new SCResponseFunnyCat();
         response.decode(byteArray,length);
         TDHomeUINotify.e.responseFunnyCat(response);
      }
      
      public function RequestHistory() : void
      {
         var length:int = 0;
         var m_stMyHomeInfo:Object = TDHomeUIData.getInstance().m_stMyHomeInfo;
         var byteArray:ByteArray = new ByteArray();
         var request:CSRequestHistory = new CSRequestHistory();
         request.m_iUin = m_stMyHomeInfo.m_iUin;
         request.encode(byteArray,length);
         pBaseProtocol.a_2201(this.hallConn,b_154.MSG_HALL_HISTORY,byteArray);
      }
      
      public function onResponseHistory(csPackageHeader:a_2670, byteArray:ByteArray) : void
      {
         var length:int = 0;
         var response:SCResponseHistory = new SCResponseHistory();
         response.decode(byteArray,length);
         TDHomeUINotify.e.responseHistory(response);
      }
      
      public function RequestFriendHomeInfo(arrUin:Array) : void
      {
         var length:int = 0;
         var m_stMyHomeInfo:Object = TDHomeUIData.getInstance().m_stMyHomeInfo;
         var byteArray:ByteArray = new ByteArray();
         var request:CSRequestFriendHomeInfo = new CSRequestFriendHomeInfo();
         request.m_iSrcUin = m_stMyHomeInfo.m_iUin;
         request.m_nDstCount = arrUin.length;
         request.m_aiDstUin = arrUin;
         request.encode(byteArray,length);
         pBaseProtocol.a_2201(this.hallConn,b_154.MSG_HALL_GET_HOME_STATE,byteArray);
      }
      
      public function onResponseFriendHomeInfo(csPackageHeader:a_2670, byteArray:ByteArray) : void
      {
         var length:int = 0;
         var response:SCResponseFriendHomeInfo = new SCResponseFriendHomeInfo();
         response.decode(byteArray,length);
         TDHomeUINotify.e.responseFriendHomeInfo(response);
      }
      
      public function RequestRefrushStar(ovenId:int) : void
      {
         var length:int = 0;
         var m_stMyHomeInfo:Object = TDHomeUIData.getInstance().m_stMyHomeInfo;
         var byteArray:ByteArray = new ByteArray();
         var request:CSRequestRefrushStar = new CSRequestRefrushStar();
         request.m_iUin = m_stMyHomeInfo.m_iUin;
         request.m_iOvenID = ovenId;
         request.encode(byteArray,length);
         pBaseProtocol.a_2201(this.hallConn,b_154.MSG_HALL_RAISE_OVEN,byteArray);
      }
      
      public function onResponseRefrushStar(csPackageHeader:a_2670, byteArray:ByteArray) : void
      {
         var length:int = 0;
         var response:SCResponseRefrushStar = new SCResponseRefrushStar();
         response.decode(byteArray,length);
         TDHomeUINotify.e.responseRefrushStar(response);
      }
      
      public function RequestBuyCount(flag:int) : void
      {
         var length:int = 0;
         var m_stMyHomeInfo:Object = TDHomeUIData.getInstance().m_stMyHomeInfo;
         var byteArray:ByteArray = new ByteArray();
         var request:CSRequestBuyCount = new CSRequestBuyCount();
         request.m_iUin = m_stMyHomeInfo.m_iUin;
         request.m_cFlag = flag;
         request.encode(byteArray,length);
         pBaseProtocol.a_2201(this.hallConn,b_154.MSG_HALL_BUY_FIGHTORSTEAL_COUNT,byteArray);
      }
      
      public function onResponseBuyCount(csPackageHeader:a_2670, byteArray:ByteArray) : void
      {
         var length:int = 0;
         var response:SCResponseBuyCount = new SCResponseBuyCount();
         response.decode(byteArray,length);
         TDHomeUINotify.e.responseBuyCount(response);
      }
      
      public function RequestClearTime() : void
      {
         var length:int = 0;
         var m_stMyHomeInfo:Object = TDHomeUIData.getInstance().m_stMyHomeInfo;
         var byteArray:ByteArray = new ByteArray();
         var request:CSRequestClearTime = new CSRequestClearTime();
         request.m_iUin = m_stMyHomeInfo.m_iUin;
         request.encode(byteArray,length);
         pBaseProtocol.a_2201(this.hallConn,b_154.MSG_HALL_CLEAR_FIGHT_CD_TIME,byteArray);
      }
      
      public function onResponseClearTime(csPackageHeader:a_2670, byteArray:ByteArray) : void
      {
         var length:int = 0;
         var response:SCResponseClearTime = new SCResponseClearTime();
         response.decode(byteArray,length);
         TDHomeUINotify.e.responseClearTime(response);
      }
   }
}

