package a_4767
{
   import a_4716.EnmConnLoginStatus;
   import a_4716.EnmInviteType;
   import a_4716.EnmRoomEventID;
   import a_4716.EnmServerEntity;
   import a_4716.a_1731;
   import a_4716.a_1736;
   import a_4716.a_1740;
   import a_4720.EnmGameIM;
   import a_4720.a_1748;
   import a_4720.a_1750;
   import a_4720.a_1755;
   import a_4720.a_1756;
   import a_4726.a_1770;
   import a_4728.a_1778;
   import a_4729.EventType;
   import a_4729.a_1779;
   import a_4729.a_1789;
   import a_4752.GameStringManager;
   import a_4757.a_2220;
   import a_4758.a_2208;
   import a_4759.b_151;
   import a_4759.b_152;
   import a_4760.a_2251;
   import a_4760.a_2256;
   import a_4763.a_2439;
   import a_4763.a_2445;
   import a_4764.a_2307;
   import a_4764.a_2332;
   import a_4764.b_173;
   import a_4764.b_174;
   import a_4764.b_175;
   import a_4765.ComposeServerDataProtocol;
   import a_4765.a_2333;
   import a_4765.a_2418;
   import a_4768.a_2603;
   import a_4770.a_2610;
   import a_4770.a_2631;
   import a_4770.b_177;
   import a_4770.b_178;
   import a_4771.a_2648;
   import a_4771.a_2650;
   import a_4789.IModulesBridge;
   import a_4789.a_4657;
   import com.aurora.event.activity.ActivityEventManagerFactory;
   import com.aurora.event.activity.ActivityEventType;
   import com.aurora.handler.lobby.home.HallServerHomeDataNotifyProtocol;
   import com.aurora.handler.lobby.home.HallserverHomeDataProtocol;
   import com.aurora.protocol.friend.CStateData;
   import com.aurora.protocol.friend.CUserStatus;
   import com.aurora.protocol.friend.LogicServerState;
   import com.aurora.protocol.hallserver.a_2739;
   import com.aurora.protocol.logicserver.CTableInfo;
   import com.aurora.protocol.profile.CUserBaseProfile;
   import com.aurora.ui.maogoutd.ClientLog.MessageTipHandler;
   import com.aurora.ui.maogoutd.ITDLobbyUI;
   import com.aurora.ui.maogoutd.achievement.a_3168;
   import com.aurora.ui.maogoutd.im.IMUtil;
   import com.aurora.ui.maogoutd.role.a_4463;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import flash.utils.clearInterval;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class a_2545 implements b_176
   {
      
      private static var a_840:a_2545;
      
      private static var m_sign:Boolean = false;
      
      private var a_841:a_1779;
      
      private var a_826:int = 0;
      
      private var a_827:int = 0;
      
      private var a_828:int = 0;
      
      private var a_829:ITDLobbyUI;
      
      private var authenHandler:a_2208;
      
      private var hallServerConsortiaDataProtocol:b_174;
      
      private var hallServerConsortiaDataNotifyProtocol:b_173;
      
      private var hallServerHomeDataProtocol:HallserverHomeDataProtocol;
      
      private var hallServerHomeDataNotifyProtocol:HallServerHomeDataNotifyProtocol;
      
      private var composeServerDataProtocol:ComposeServerDataProtocol;
      
      private var hallServerDataProtocol:a_2333;
      
      private var hallServerNotifyProtocol:a_2418;
      
      private var miscServerDataProtocol:a_2603;
      
      private var loginLogicServerProtocol:a_2631;
      
      private var enterLeaveRoomProtocal:a_2610;
      
      private var logicServerNotifyProtocol:b_178;
      
      private var logicGameDataProtocol:b_177;
      
      private var a_833:Array = [];
      
      private var a_834:Array = [];
      
      private var m_stViewPlayerCountArray:Array = [];
      
      private var a_837:Array = [];
      
      private var a_839:Array = [];
      
      private var a_842:Timer;
      
      private var isNotifyKick:Boolean = false;
      
      private var m_iTypeByGetOtherHeroInfo:int = -1;
      
      private var a_843:int = 0;
      
      private var a_844:int = 0;
      
      private var mBridge:IModulesBridge;
      
      public function a_2545()
      {
         super();
         if(!m_sign)
         {
            throw new Error("请通过getInstance()方法获取引用！");
         }
         this.a_1797();
      }
      
      public static function getInstance() : a_2545
      {
         if(null == a_840)
         {
            m_sign = true;
            a_840 = new a_2545();
            m_sign = false;
         }
         return a_840;
      }
      
      private function a_1797() : Boolean
      {
         this.a_841 = a_1789.getInstance();
         this.authenHandler = a_2208.getInstance();
         var baseProtocalHandler:a_2220 = a_2220.getInstance();
         this.hallServerDataProtocol = a_2333.getInstance();
         this.hallServerDataProtocol.a_2246(baseProtocalHandler);
         this.hallServerNotifyProtocol = a_2418.getInstance();
         this.hallServerNotifyProtocol.a_2246(baseProtocalHandler);
         this.loginLogicServerProtocol = a_2631.getInstance();
         this.loginLogicServerProtocol.a_2246(baseProtocalHandler);
         this.enterLeaveRoomProtocal = a_2610.getInstance();
         this.enterLeaveRoomProtocal.a_2246(baseProtocalHandler);
         this.logicServerNotifyProtocol = b_178.getInstance();
         this.logicServerNotifyProtocol.a_2246(baseProtocalHandler);
         this.logicGameDataProtocol = b_177.getInstance();
         this.logicGameDataProtocol.a_2246(baseProtocalHandler);
         this.miscServerDataProtocol = a_2603.getInstance();
         this.miscServerDataProtocol.a_2246(baseProtocalHandler);
         this.hallServerConsortiaDataProtocol = b_174.getInstance();
         this.hallServerConsortiaDataProtocol.a_2246(baseProtocalHandler);
         this.hallServerConsortiaDataNotifyProtocol = b_173.getInstance();
         this.hallServerConsortiaDataNotifyProtocol.a_2246(baseProtocalHandler);
         a_2332.getInstance().a_1797(this.hallServerConsortiaDataProtocol);
         this.hallServerHomeDataNotifyProtocol = HallServerHomeDataNotifyProtocol.getInstance();
         this.hallServerHomeDataNotifyProtocol.a_2246(baseProtocalHandler);
         this.hallServerHomeDataProtocol = HallserverHomeDataProtocol.getInstance();
         this.hallServerHomeDataProtocol.a_2246(baseProtocalHandler);
         this.composeServerDataProtocol = ComposeServerDataProtocol.getInstance();
         this.composeServerDataProtocol.a_2246(baseProtocalHandler);
         TDComposeLogic.getInstance().a_1797(this.composeServerDataProtocol);
         this.a_841.addEventListener(EventType.a_573,this.a_2528);
         this.a_841.addEventListener(EventType.a_569,this.a_2529);
         this.a_841.addEventListener(EventType.a_597,this.a_2530);
         this.a_841.addEventListener(EventType.a_580,this.a_2541);
         this.a_841.addEventListener(EventType.a_626,this.a_2551);
         this.a_841.addEventListener(EventType.a_627,this.a_2552);
         this.a_841.addEventListener(EventType.a_628,this.a_2553);
         this.a_841.addEventListener(EventType.a_629,this.a_2554);
         this.a_841.addEventListener(EventType.a_592,this.a_2546);
         this.a_841.addEventListener(EventType.a_631,this.a_2555);
         this.a_841.addEventListener(EventType.a_578,this.a_2419);
         this.a_841.addEventListener(EventType.a_579,this.a_2422);
         this.a_841.addEventListener(EventType.a_582,this.a_2420);
         this.a_841.addEventListener(EventType.a_584,this.a_2421);
         this.a_841.addEventListener(EventType.a_568,this.a_2531);
         this.a_841.addEventListener(EventType.a_574,this.a_2532);
         this.a_841.addEventListener(EventType.a_575,this.a_2533);
         this.a_841.addEventListener(EventType.a_576,this.a_2538);
         this.a_841.addEventListener(EventType.a_591,this.a_2547);
         this.a_841.addEventListener(EventType.a_601,this.a_2548);
         this.a_841.addEventListener(EventType.a_603,this.a_2549);
         this.a_841.addEventListener(EventType.a_577,this.a_2539);
         this.a_841.addEventListener(EventType.a_586,this.a_2556);
         this.a_841.addEventListener(EventType.a_587,this.a_2557);
         this.a_841.addEventListener(EventType.a_588,this.a_2558);
         this.a_841.addEventListener(EventType.a_589,this.a_2559);
         this.a_841.addEventListener(EventType.a_590,this.a_2560);
         this.a_841.addEventListener(EventType.a_637,this.a_2561);
         this.a_841.addEventListener(EventType.a_654,this.a_2540);
         this.a_841.addEventListener(EventType.a_663,this.a_2589);
         this.a_841.addEventListener(EventType.a_645,this.a_2562);
         this.a_841.addEventListener(EventType.a_646,this.a_2563);
         this.a_841.addEventListener(EventType.a_640,this.a_2564);
         this.a_841.addEventListener(EventType.a_641,this.a_2565);
         this.a_841.addEventListener(EventType.a_642,this.a_2566);
         this.a_841.addEventListener(EventType.a_643,this.a_2567);
         this.a_841.addEventListener(EventType.a_644,this.a_2568);
         this.a_841.addEventListener(EventType.a_658,this.a_2594);
         this.a_841.addEventListener(EventType.a_660,this.a_2595);
         this.a_841.addEventListener(EventType.a_659,this.a_2596);
         this.a_841.addEventListener(EventType.a_614,this.a_2569);
         this.a_841.addEventListener(EventType.a_615,this.a_2570);
         this.a_841.addEventListener(EventType.a_620,this.a_2426);
         this.a_841.addEventListener(EventType.a_618,this.a_2572);
         this.a_841.addEventListener(EventType.a_617,this.a_2571);
         this.a_841.addEventListener(EventType.a_619,this.a_2573);
         this.a_841.addEventListener(EventType.a_624,this.a_2574);
         this.a_841.addEventListener(EventType.a_623,this.a_2575);
         this.a_841.addEventListener(EventType.a_632,this.a_2576);
         this.a_841.addEventListener(EventType.a_625,this.a_2424);
         this.a_841.addEventListener(EventType.a_638,this.a_2578);
         this.a_841.addEventListener(EventType.a_639,this.a_2579);
         this.a_841.addEventListener(EventType.a_621,this.a_2427);
         this.a_841.addEventListener(EventType.a_622,this.a_2577);
         this.a_841.addEventListener(EventType.a_647,this.a_2580);
         this.a_841.addEventListener(EventType.a_630,this.a_2428);
         this.a_841.addEventListener(EventType.a_567,this.a_2583);
         this.a_841.addEventListener(EventType.a_604,this.a_2585);
         this.a_841.addEventListener(EventType.a_655,this.a_2586);
         this.a_841.addEventListener(EventType.a_656,this.a_2587);
         this.a_841.addEventListener(EventType.a_657,this.a_2588);
         this.a_841.addEventListener(EventType.a_605,this.a_2590);
         this.a_841.addEventListener(EventType.UseSkillBook,this.a_2591);
         this.a_841.addEventListener(EventType.a_607,this.a_2592);
         this.a_841.addEventListener(EventType.a_698,this.a_2593);
         this.a_841.addEventListener(EventType.Notfiy_MiBaoKuGameData,this.OnMiBaoKuGameData);
         this.a_841.addEventListener(EventType.a_694,this.OnMarginListData);
         this.a_841.addEventListener(EventType.a_690,this.OnMarginRegisterFriend);
         this.a_841.addEventListener(EventType.a_691,this.OnMarginReverseRegister);
         this.a_841.addEventListener(EventType.a_692,this.OnMarginRegistAdvert);
         this.a_841.addEventListener(EventType.a_695,this.OnMarginStar);
         this.a_841.addEventListener(EventType.a_693,this.OnMarginPlayerByUin);
         this.a_841.addEventListener(EventType.a_696,this.OnMarginModifyAdvert);
         this.a_841.addEventListener(EventType.a_213,this.OnMarginSearch);
         this.a_841.addEventListener(EventType.a_228,this.OnChangeName);
         this.a_841.addEventListener(EventType.a_700,this.a_2597);
         this.a_841.addEventListener(EventType.a_701,this.a_2598);
         this.a_841.addEventListener(EventType.a_662,this.a_2599);
         this.a_841.addEventListener(EventType.a_661,this.a_2600);
         this.a_841.addEventListener(EventType.a_702,this.a_2601);
         this.a_841.addEventListener(EventType.a_703,this.a_2602);
         this.mBridge = a_4657.getInstance();
         this.mBridge.addListener(this,true);
         return true;
      }
      
      public function a_2524() : ITDLobbyUI
      {
         return this.a_829;
      }
      
      public function getTDLobbyLogicConsortia() : b_175
      {
         return a_2332.getInstance();
      }
      
      public function a_2230(lobbyView:ITDLobbyUI) : Boolean
      {
         this.a_829 = lobbyView;
         return true;
      }
      
      public function a_2480(szAccount:String, szPassword:String, nUserType:uint = 0, nSourceAppId:int = 0, szMemoryBuffer:ByteArray = null) : Boolean
      {
         return this.authenHandler.a_2209(szAccount,nUserType,szPassword,nSourceAppId,szMemoryBuffer);
      }
      
      private function onGetRoomPlayerCountTimerEvent(a_4730:TimerEvent) : void
      {
         var enterRoom:Object = a_2439.getInstance().a_2483;
         this.logicGameDataProtocol.a_2619(enterRoom.m_iServerID);
      }
      
      public function a_2481(iServerID:int) : Boolean
      {
         var enterRoom:Object = a_2439.getInstance().getEnterRoom();
         var m_iServerID:int = int(enterRoom.m_iUpServerID);
         if(m_iServerID != iServerID && m_iServerID != -1)
         {
         }
         if(this.a_842 == null)
         {
            this.a_842 = new Timer(300000,-1);
            this.a_842.addEventListener(TimerEvent.TIMER_COMPLETE,this.onGetRoomPlayerCountTimerEvent);
         }
         return this.loginLogicServerProtocol.a_2334(iServerID);
      }
      
      public function a_2482(iServerID:int) : Boolean
      {
         return this.loginLogicServerProtocol.a_2632(iServerID);
      }
      
      public function a_2483(iServerID:int, iRoomID:int) : Boolean
      {
         var logicConn:a_2650 = a_2256.getInstance().a_2258(iServerID);
         if(EnmConnLoginStatus.enmNoLogin == logicConn.m_iLoginStatus)
         {
            this.a_2519(iServerID,iRoomID);
            return this.a_2481(iServerID);
         }
         if(EnmConnLoginStatus.enmLogined == logicConn.m_iLoginStatus)
         {
            return this.enterLeaveRoomProtocal.a_2483(iServerID,iRoomID);
         }
         if(EnmConnLoginStatus.enmLogining == logicConn.m_iLoginStatus)
         {
            this.a_2519(iServerID,iRoomID);
         }
         return false;
      }
      
      public function a_2484(iServerID:int = -1, iRoomID:int = -1) : Boolean
      {
         var enterRoom:Object = null;
         if(iServerID == -1 && iRoomID == -1)
         {
            enterRoom = a_2439.getInstance().a_2483;
            iServerID = int(enterRoom.m_iServerID);
            iRoomID = int(enterRoom.m_iRoomID);
         }
         if(this.a_842 != null)
         {
            this.a_842.stop();
         }
         this.enterLeaveRoomProtocal.a_2484(iServerID,iRoomID);
         var logicConn:a_2650 = a_2256.getInstance().a_2258(iServerID);
         logicConn.closeConnection();
         return true;
      }
      
      public function a_2485(iServerID:int, iRoomID:int, iTableID:int, iSeatID:int, szTableName:String = "", szTableKey:String = "", iGameMapID:Array = null, byGameMod:int = -1, iPlayerCount:int = -1, byLevel:int = 0) : Boolean
      {
         var enterRoom:Object = a_2439.getInstance().a_2483;
         enterRoom.m_iTableID = iTableID;
         enterRoom.m_szTableName = szTableName;
         return this.logicGameDataProtocol.a_2485(enterRoom.m_iServerID,enterRoom.m_iRoomID,iTableID,iSeatID,szTableName,szTableKey,iGameMapID,byGameMod,iPlayerCount,byLevel);
      }
      
      public function a_2490() : Boolean
      {
         var enterRoom:Object = a_2439.getInstance().a_2483;
         return this.logicGameDataProtocol.a_2616(enterRoom.m_iServerID,enterRoom.m_iRoomID);
      }
      
      public function a_2491() : Boolean
      {
         return this.hallServerDataProtocol.RequestTDCardsInfo();
      }
      
      public function a_2476(iServerID:int, iRoomID:int, iTableID:int, iSeatID:int, seatStatus:int) : Boolean
      {
         return this.logicGameDataProtocol.a_2476(iServerID,iRoomID,iTableID,iSeatID,seatStatus);
      }
      
      public function a_2488(iServerID:int, iMatchId:int) : Boolean
      {
         var logicConn:a_2650 = a_2256.getInstance().a_2258(iServerID);
         if(EnmConnLoginStatus.enmNoLogin == logicConn.m_iLoginStatus)
         {
            this.AddPaddingViewPlayerCount(iServerID);
            return this.a_2481(iServerID);
         }
         if(EnmConnLoginStatus.enmLogined == logicConn.m_iLoginStatus)
         {
            this.logicGameDataProtocol.a_2619(iServerID);
         }
         else if(EnmConnLoginStatus.enmLogining == logicConn.m_iLoginStatus)
         {
            return this.AddPaddingViewPlayerCount(iServerID);
         }
         return false;
      }
      
      public function a_2492(roleName:String, sex:int) : Boolean
      {
         return this.hallServerDataProtocol.a_2345(roleName,sex);
      }
      
      public function a_2494(roleName:String) : Boolean
      {
         return this.hallServerDataProtocol.a_2344(roleName);
      }
      
      public function a_2354(arrUpdateTDCards:Array) : Boolean
      {
         return this.hallServerDataProtocol.a_2354(this.authenHandler.getUin(),arrUpdateTDCards);
      }
      
      public function a_2359(arrUpdateTDCards:Array, iUpdateMode:int) : Boolean
      {
         return this.hallServerDataProtocol.a_2359(this.authenHandler.getUin(),arrUpdateTDCards,iUpdateMode);
      }
      
      public function a_2356(iCardID:int, iCardSeq:int) : Boolean
      {
         return this.hallServerDataProtocol.a_2356(iCardID,iCardSeq);
      }
      
      public function a_2496(iCardID:int, iCardSeq:int) : Boolean
      {
         return this.hallServerDataProtocol.RequestUseService(iCardID,iCardSeq);
      }
      
      public function a_2351(iFavoriteID:int, szFavoriteName:String, favitemsContent:String) : Boolean
      {
         return this.hallServerDataProtocol.a_2351(this.authenHandler.getUin(),iFavoriteID,szFavoriteName,favitemsContent);
      }
      
      public function a_2497(arrUpdateHeroCards:Array) : Boolean
      {
         return this.hallServerDataProtocol.a_2361(this.authenHandler.getUin(),arrUpdateHeroCards);
      }
      
      public function a_2489(arrUin:Array) : Boolean
      {
         return false;
      }
      
      public function a_2309(arrUin:Array) : Boolean
      {
         if(!arrUin is Array || arrUin.length <= 0)
         {
            trace("arrUin is null or arrUin.length <= 0 GetPlayerCommonInfo failed!");
            return false;
         }
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         if(EnmConnLoginStatus.enmNoLogin == hallConn.m_iLoginStatus)
         {
            this.a_2523(arrUin);
            return this.a_2525();
         }
         if(EnmConnLoginStatus.enmLogined == hallConn.m_iLoginStatus)
         {
            return this.hallServerDataProtocol.a_2309(arrUin,a_1731.a_339 | a_1731.a_338 | a_1731.FLAG_GAME | a_1731.a_340 | a_1731.a_342 | a_1731.FLAG_VIP);
         }
         if(EnmConnLoginStatus.enmLogining == hallConn.m_iLoginStatus)
         {
            return this.a_2523(arrUin);
         }
         return false;
      }
      
      public function a_1794(iServerID:int, iRoomID:int) : Boolean
      {
         --this.a_828;
         if(this.a_828 <= 0)
         {
         }
         var gameLoaderIndex:String = iServerID + "_" + iRoomID;
         var connInfo:a_1770 = new a_1770();
         connInfo.m_iServerID = iServerID;
         connInfo.m_iRoomID = iRoomID;
         this.a_829.a_2098();
         return this.a_829.a_2238(iServerID,iRoomID);
      }
      
      public function a_2526(iServerID:int, iRoomID:int) : Boolean
      {
         var gameLoaderIndex:String = iServerID + "_" + iRoomID;
         if(null == this.a_839[gameLoaderIndex])
         {
            trace("CreateGameLoader for gameLoaderIndex=" + gameLoaderIndex);
            this.a_839[gameLoaderIndex] = this.a_829.a_2236(iServerID,iRoomID);
         }
         return true;
      }
      
      public function a_2493(role:Object) : Boolean
      {
         this.a_829.a_3744(GameStringManager.getInstance().getString(24636),GameStringManager.getInstance().getString(24577),true,false,false,false);
         var roleInfo:Object = a_2439.getInstance().getUserRole(role.m_iRoleUin);
         this.authenHandler.a_2212(role.m_iRoleUin,roleInfo.m_szRoleName,role.m_iUserSex);
         a_2439.getInstance().m_currentRoleUin = role.m_iRoleUin;
         a_2307.getInstance().setCurrentRoleUin(role.m_iRoleUin);
         var enterRoom:Object = a_2439.getInstance().a_2483;
         enterRoom.m_iServerID = roleInfo.m_iLogicServerID;
         enterRoom.m_iRoomID = roleInfo.m_iRoomID;
         var clientIP:int = int(enterRoom.m_iClientIP);
         this.hallServerDataProtocol.a_2335(role.m_iRoleUin,clientIP);
         return true;
      }
      
      public function a_2495(iUin:int) : Boolean
      {
         return this.hallServerDataProtocol.a_2346(iUin);
      }
      
      public function a_2499(dstRole:Object, arrBuyGoods:Array) : Boolean
      {
         var currentRole:Object = a_2439.getInstance().GetCurrentRole();
         return this.hallServerDataProtocol.a_2365(currentRole,dstRole,arrBuyGoods);
      }
      
      public function a_2500() : Boolean
      {
         var roleUin:int = a_2439.getInstance().m_currentRoleUin;
         return this.hallServerDataProtocol.a_2366(roleUin);
      }
      
      public function a_2501(taskID:int) : Boolean
      {
         var roleUin:int = a_2439.getInstance().m_currentRoleUin;
         return this.hallServerDataProtocol.RequestPlayerAcceptTask(roleUin,taskID);
      }
      
      public function a_2502(taskID:int, byType:int = 0) : Boolean
      {
         if(false == a_3168.getInstance().isLegal)
         {
            return false;
         }
         var roleUin:int = a_2439.getInstance().m_currentRoleUin;
         return this.hallServerDataProtocol.RequestPlayerAccomplishTask(roleUin,taskID,byType);
      }
      
      public function a_2503(taskID:int, select:int) : Boolean
      {
         var roleUin:int = a_2439.getInstance().m_currentRoleUin;
         return this.hallServerDataProtocol.RequestPlayerGetTaskAward(roleUin,taskID,select);
      }
      
      public function a_2504(taskInfo:Object) : Boolean
      {
         var roleUin:int = a_2439.getInstance().m_currentRoleUin;
         return this.hallServerDataProtocol.RequestPlayerSaveTask(roleUin,taskInfo);
      }
      
      public function a_2498(composeRate:Object) : Boolean
      {
         return false;
      }
      
      public function a_2505(friendData:Object) : Boolean
      {
         return this.hallServerDataProtocol.RequestAddFriend(friendData);
      }
      
      public function a_2506(roleUin:int) : Boolean
      {
         return this.hallServerDataProtocol.a_2372(roleUin);
      }
      
      public function SendTalkOnTable(iDstUin:int, message:String) : Boolean
      {
         var enterRoom:Object = a_2439.getInstance().a_2483;
         return this.logicGameDataProtocol.a_2618(enterRoom.m_iServerID,enterRoom.m_iRoomID,enterRoom.m_iTableID,message);
      }
      
      public function SendTalkInRoom(iDstUin:int, message:String) : Boolean
      {
         var enterRoom:Object = a_2439.getInstance().a_2483;
         return this.logicGameDataProtocol.a_2617(enterRoom.m_iServerID,enterRoom.m_iRoomID,iDstUin,message);
      }
      
      public function SendTalkTransferMessage(iDstUin:int, message:String) : Boolean
      {
         return this.hallServerDataProtocol.a_2118(iDstUin,message);
      }
      
      public function RequestUseSpeaker(msg:String, nGameID:int = 0) : Boolean
      {
         return this.hallServerDataProtocol.RequestUseSpeaker(msg,nGameID);
      }
      
      public function onNotifyGameResult(mGameResult:Object) : void
      {
         if(mGameResult.byLoseTeamID == mGameResult.byTeamID)
         {
            mGameResult.iWin = 2;
         }
         trace(" mGameResult.iWin=" + mGameResult.iWin + ", mGameResult.iTotalEnergy =" + mGameResult.iTotalEnergy + ", mGameResult.iTeamMateSex=" + mGameResult.iTeamMateSex);
         this.a_829.a_3755(mGameResult);
      }
      
      public function onNotifyCancelGame() : void
      {
         this.a_829.a_3756();
      }
      
      public function a_2507(dictUpdateInfo:Dictionary) : Boolean
      {
         return this.hallServerDataProtocol.a_2363(this.authenHandler.getUin(),dictUpdateInfo);
      }
      
      public function a_2508() : Boolean
      {
         var enterRoom:Object = a_2439.getInstance().a_2483;
         return this.logicGameDataProtocol.a_2508(enterRoom.m_iServerID,enterRoom.m_iRoomID,enterRoom.m_iHeadTableID,enterRoom.m_iTailTableID);
      }
      
      public function RequsetRenewCard(iItemID:int, iItemSeq:int, iCoinPrice:int, iDays:int) : Boolean
      {
         var role:a_4463 = a_2439.getInstance().GetCurrentRole() as a_4463;
         return this.hallServerDataProtocol.a_2389(role.m_iRoleUin,role.m_szRoleName,iItemID,iItemSeq,iCoinPrice,iDays);
      }
      
      public function a_2509(iUserStatus:int) : void
      {
         var enterRoom:Object = a_2439.getInstance().a_2483;
         this.a_2550(iUserStatus,1888,enterRoom.m_iServerID,enterRoom.m_iRoomID,1);
      }
      
      public function RequestTransferClientLog(iType:int, log:String) : void
      {
         this.hallServerDataProtocol.RequestTransferClientLog(iType,log);
      }
      
      public function a_2397(iServerID:int, iRoomID:int) : void
      {
         var iRoleUin:int = a_2439.getInstance().m_currentRoleUin;
         this.hallServerDataProtocol.a_2397(this.authenHandler.getRawUin(),iRoleUin,iServerID,iRoomID);
      }
      
      private function a_2525() : Boolean
      {
         this.hallServerDataProtocol.a_2334();
         return true;
      }
      
      private function a_2519(iServerID:int, iRoomID:int) : Boolean
      {
         if(null == this.a_833[iServerID])
         {
            this.a_833[iServerID] = new Array();
         }
         (this.a_833[iServerID] as Array).push(iRoomID);
         return true;
      }
      
      private function a_2520(iServerID:int, iRoomID:int, by:ByteArray) : Boolean
      {
         if(null == this.a_834[iServerID])
         {
            this.a_834[iServerID] = new Array();
         }
         (this.a_834[iServerID] as Array).push({
            "iRoomID":iRoomID,
            "data":by
         });
         return true;
      }
      
      private function AddPaddingViewPlayerCount(iServerID:int) : Boolean
      {
         if(iServerID != 0 && null == this.m_stViewPlayerCountArray[iServerID])
         {
            this.m_stViewPlayerCountArray[iServerID] = iServerID;
         }
         return true;
      }
      
      private function a_2523(arrUins:Array) : Boolean
      {
         this.a_837.push(arrUins);
         return true;
      }
      
      private function a_2528(a_4730:Event) : void
      {
      }
      
      private function a_2546(a_4730:a_1778) : void
      {
         var iRoleUin:int = 0;
         var response:Object = a_4730.dataObject;
         if(response.m_nResultID == 0)
         {
            iRoleUin = a_2439.getInstance().m_currentRoleUin;
            this.a_2491();
            this.hallServerDataProtocol.onRequestStoreBoxInfo(iRoleUin);
            this.a_2309([iRoleUin]);
            this.a_2500();
            this.a_2506(iRoleUin);
            this.hallServerDataProtocol.a_2408(iRoleUin);
            this.hallServerDataProtocol.a_2400(iRoleUin,1888);
         }
         else
         {
            this.a_844 = 0;
         }
      }
      
      private function a_2529(a_4730:Event) : void
      {
         var enterRoom:Object = a_2439.getInstance().a_2483;
         enterRoom.m_iUin = this.authenHandler.getRawUin();
         var hallServerConn:a_2650 = a_2251.getInstance().a_2253();
         if(hallServerConn.m_iLoginStatus == EnmConnLoginStatus.enmNoLogin && !this.isNotifyKick)
         {
            this.a_2525();
         }
      }
      
      private function a_2530(a_4730:Event) : void
      {
         if(this.a_826 < 4)
         {
            this.authenHandler.a_2210();
            ++this.a_826;
         }
         else
         {
            this.a_829.a_3744(GameStringManager.getInstance().getString(132612),GameStringManager.getInstance().getString(24578),true);
         }
      }
      
      private function a_2531(a_4730:Event) : void
      {
         var iRoomID:int = 0;
         var data:Object = null;
         var iServerID:int = (a_4730 as a_1778).dataObject.iServerID as int;
         var arrRoomSession:Array = (a_4730 as a_1778).dataObject.arrRoomSession as Array;
         if(this.authenHandler.m_stUserBaseProfile is CUserBaseProfile)
         {
            this.loginLogicServerProtocol.a_2633(iServerID,this.authenHandler.m_stUserBaseProfile);
         }
         else
         {
            trace("用户详细信息还没回来.");
         }
         var arrEnterRoomArry:Array = this.a_833[iServerID] as Array;
         while(arrEnterRoomArry is Array && arrEnterRoomArry.length > 0)
         {
            iRoomID = arrEnterRoomArry.shift() as int;
            this.a_2483(iServerID,iRoomID);
         }
         var arrMatchSignUp:Array = this.a_834[iServerID] as Array;
         while(arrMatchSignUp is Array && arrMatchSignUp.length > 0)
         {
            data = arrMatchSignUp.shift() as Object;
            this.sendMatchGameData(iServerID,data.iRoomID,data.data);
         }
         if(this.m_stViewPlayerCountArray[iServerID] != null)
         {
            this.logicGameDataProtocol.a_2619(iServerID);
         }
      }
      
      private function a_2532(a_4730:Event) : void
      {
         var enterRoom:Object = null;
         var dataObj:Object = (a_4730 as a_1778).dataObject;
         if(dataObj.m_nResultID == 0)
         {
            ++this.a_828;
            enterRoom = a_2439.getInstance().a_2483;
            enterRoom.m_iServerID = dataObj.iServerID;
            enterRoom.m_iRoomID = dataObj.iRoomID;
            enterRoom.m_iHeadTableID = dataObj.iHeadTableID;
            enterRoom.m_iTailTableID = dataObj.iTailTableID;
            enterRoom.m_iGameID = a_2256.getInstance().a_2259(enterRoom.m_iServerID,enterRoom.m_iRoomID);
            if(enterRoom.m_iUpServerID != -1 && enterRoom.m_iUpRoomeID != -1)
            {
               if(enterRoom.m_iUpServerID != enterRoom.m_iServerID || enterRoom.m_iUpRoomeID != enterRoom.m_iRoomID)
               {
                  this.enterLeaveRoomProtocal.a_2484(enterRoom.m_iUpServerID,enterRoom.m_iUpRoomeID);
               }
               enterRoom.m_iUpServerID = -1;
               enterRoom.m_iUpRoomeID = -1;
            }
            this.a_2490();
            this.a_829.a_3138(enterRoom.m_iServerID,enterRoom.m_iRoomID,enterRoom.m_iHeadTableID,enterRoom.m_iTailTableID);
         }
         else
         {
            this.a_829.a_3744(dataObj.m_szReasonMsg + GameStringManager.getInstance().getString(135428) + dataObj.m_nResultID,GameStringManager.getInstance().getString(24578),false,true,false,false);
         }
      }
      
      private function a_2533(a_4730:Event) : void
      {
         var dataObj:Object = (a_4730 as a_1778).dataObject;
         trace("离开房间消息[ServerID:" + dataObj.iServerID + "， Room:" + dataObj.iRoomID + "]， 删除LobbyAdapterHandler and RemoveGameUI");
      }
      
      private function a_2538(a_4730:Event) : void
      {
         var dataObject:Object = (a_4730 as a_1778).dataObject;
         var connInfo:a_1770 = new a_1770();
         connInfo.m_iServerID = dataObject.m_iServerID;
         connInfo.m_iGameID = dataObject.m_iGameID;
         connInfo.m_iRoomID = dataObject.m_iRoomID;
         connInfo.m_iTableID = dataObject.m_iTableID;
         connInfo.m_iCrossID = dataObject.m_iCrossID;
         var enterRoom:Object = a_2439.getInstance().a_2483;
         enterRoom.m_iTableID = dataObject.m_iTableID;
         var gameLoaderIndex:String = dataObject.m_iServerID + "_" + dataObject.m_iRoomID;
         var sitDown:Object = a_2439.getInstance().GetSitDown();
         if(sitDown)
         {
            sitDown.m_iCrossID = connInfo.m_iCrossID;
         }
         if(sitDown != null && sitDown.m_iGameMapID == -1)
         {
            this.RequestTransferClientLog(3,"SitDownSuccess地图ID返回为-1,房间号=" + sitDown.m_iTableID + ",游戏模式=" + sitDown.m_byGameMode);
         }
         if(null == this.a_839[gameLoaderIndex])
         {
            trace("Warning: m_stGameLoaderArray[" + gameLoaderIndex + "] is null !");
            trace("CreateGameLoader for gameLoaderIndex=" + gameLoaderIndex);
            this.a_839[gameLoaderIndex] = this.a_829.a_2236(dataObject.m_iServerID,dataObject.m_iRoomID);
         }
         var stGameLoader:Loader = this.a_839[gameLoaderIndex] as Loader;
         if(stGameLoader.contentLoaderInfo.bytesLoaded != stGameLoader.contentLoaderInfo.bytesTotal || null == stGameLoader.content)
         {
            trace("Warning: stGameLoader not loading finished waiting finish it  and delay dispatch event;");
            setTimeout(this.a_841.dispatchEvent,300,a_4730);
            return;
         }
         var pGameLobby:b_152 = stGameLoader.content as b_152;
         if(null == pGameLobby)
         {
            trace("Error: pGameLobby is null OnSitDownSuccess failed");
            return;
         }
         var pGameHandler:b_151 = pGameLobby.getGame();
         if(null == pGameHandler)
         {
            trace("Error: pGameHandler is null OnSitDownSuccess failed");
            return;
         }
         var pLobbyAdapterHandler:a_2445 = a_2445.getLobbyAdapterHandlerByConnInfo(connInfo);
         if(null == pLobbyAdapterHandler)
         {
            trace("Error: pLobbyAdapterHandler is null OnSitDownSuccess failed");
            return;
         }
         if(stGameLoader.content.hasOwnProperty("m_stTDGameReadyUILoader"))
         {
            (stGameLoader.content as Object).m_stTDGameReadyUILoader = enterRoom.TDGameReadyUILoader;
         }
         this.a_2550(a_1750.enm_SitDownStatus,connInfo.m_iGameID,connInfo.m_iServerID,connInfo.m_iRoomID,1,connInfo.m_iTableID);
         pGameLobby.setLobby(pLobbyAdapterHandler);
         pLobbyAdapterHandler.a_1797(pGameHandler,"MaoGouTD");
         this.a_829.a_2237(dataObject.m_iServerID,dataObject.m_iRoomID);
         this.a_829.a_2621({"m_nResultID":0});
      }
      
      private function a_2547(a_4730:a_1778) : void
      {
         this.a_829.a_2621(a_4730.dataObject);
      }
      
      private function a_2548(a_4730:Event) : void
      {
         var dataObject:Object = (a_4730 as a_1778).dataObject;
         var connInfo:a_1770 = new a_1770();
         connInfo.m_iServerID = dataObject.m_iServerID;
         connInfo.m_iGameID = dataObject.m_iGameID;
         connInfo.m_iRoomID = dataObject.m_iRoomID;
         connInfo.m_iTableID = dataObject.m_iTableID;
         this.a_2550(a_1750.enm_EnterRoomStatus,connInfo.m_iGameID,connInfo.m_iServerID,connInfo.m_iRoomID,1,-1);
      }
      
      private function a_2549(a_4730:Event) : void
      {
         var dataObject:Object = (a_4730 as a_1778).dataObject;
         var iUserStatus:int = a_1750.enm_GameEndStatus;
         var enterRoom:Object = a_2439.getInstance().a_2483;
         if(dataObject == 1)
         {
            this.a_829.a_2088();
            iUserStatus = a_1750.enm_GameStartStatus;
         }
         else
         {
            this.a_829.a_2098();
         }
         this.a_2550(iUserStatus,enterRoom.m_iGameID,enterRoom.m_iServerID,enterRoom.m_iRoomID,1,enterRoom.m_iTableID);
      }
      
      private function a_2550(iUserStatus:int, iGameID:int, iServerID:int, iRoomID:int, iRoomCount:int, iTableID:int = -1, iSeatID:int = -1, iHallState:int = 1) : void
      {
         var arrUserState:Array = null;
         var stStateData:CStateData = null;
         var logic:LogicServerState = null;
         var stUserStatus:CUserStatus = null;
         var m_szPath:String = null;
         var info:String = null;
         var enterRoom:Object = a_2439.getInstance().a_2483;
         enterRoom.m_iUserStatus = iUserStatus;
         var arrStateDatas:Array = [];
         var hallStateData:CStateData = new CStateData();
         hallStateData.hallState = iHallState;
         hallStateData.m_cClass = a_1755.a_522;
         arrStateDatas.push(hallStateData);
         if(iUserStatus == a_1750.enm_OnlineStatus || iUserStatus == a_1750.enm_DefaultStatus)
         {
            hallStateData.hallState = iUserStatus;
         }
         else
         {
            arrUserState = [];
            stStateData = new CStateData();
            stStateData.m_cClass = a_1755.a_523;
            logic = new LogicServerState();
            stUserStatus = new CUserStatus();
            stUserStatus.m_iGameID = iGameID;
            stUserStatus.m_iSeatID = iSeatID;
            stUserStatus.m_iState = iUserStatus;
            stUserStatus.m_nRoomID = iRoomID;
            stUserStatus.m_nServerID = iServerID;
            stUserStatus.m_nTableID = iTableID;
            m_szPath = a_2439.getInstance().getUserGameInfo(iServerID,iRoomID,iTableID,iSeatID);
            info = enterRoom.m_szFigureurl + "," + enterRoom.m_szNickname + "," + enterRoom.m_szTxZone;
            stUserStatus.m_szPath = m_szPath + "," + info;
            arrUserState.push(stUserStatus);
            logic.m_arrStatus = arrUserState;
            logic.m_cRoomCount = iRoomCount;
            stStateData.logicState = logic;
            arrStateDatas.push(stStateData);
         }
         this.hallServerDataProtocol.a_2377(this.authenHandler.getUin(),this.authenHandler.getAccount(),arrStateDatas);
      }
      
      private function a_2539(a_4730:Event) : void
      {
         var dataObject:Object = (a_4730 as a_1778).dataObject;
         var connInfo:a_1770 = new a_1770();
         connInfo.m_iServerID = dataObject.m_iServerID;
         connInfo.m_iGameID = dataObject.m_iGameID;
         connInfo.m_iRoomID = dataObject.m_iRoomID;
         connInfo.m_iTableID = dataObject.m_iTableID;
         var gameLoaderIndex:String = dataObject.m_iServerID + "_" + dataObject.m_iRoomID;
         if(null == this.a_839[gameLoaderIndex])
         {
            trace("CreateGameLoader for gameLoaderIndex=" + gameLoaderIndex);
            this.a_839[gameLoaderIndex] = this.a_829.a_2236(dataObject.m_iServerID,dataObject.m_iRoomID);
         }
         var stGameLoader:Loader = this.a_839[gameLoaderIndex] as Loader;
         if(stGameLoader.contentLoaderInfo.bytesLoaded != stGameLoader.contentLoaderInfo.bytesTotal || null == stGameLoader.content)
         {
            trace("Warning: stGameLoader not loading finished waiting finish it  and delay dispatch event;");
            setTimeout(this.a_841.dispatchEvent,300,a_4730);
            return;
         }
         var pGameLobby:b_152 = stGameLoader.content as b_152;
         if(null == pGameLobby)
         {
            trace("Error: pGameLobby is null OnReplaySuccess failed");
            return;
         }
         var pGameHandler:b_151 = pGameLobby.getGame();
         if(null == pGameHandler)
         {
            trace("Error: pGameHandler is null OnReplaySuccess failed");
            return;
         }
         var pLobbyAdapterHandler:a_2445 = a_2445.getLobbyAdapterHandlerByConnInfo(connInfo);
         if(null == pLobbyAdapterHandler)
         {
            trace("Error: pLobbyAdapterHandler is null OnReplaySuccess failed");
            return;
         }
         pGameLobby.setLobby(pLobbyAdapterHandler);
         pLobbyAdapterHandler.a_1797(pGameHandler,"hlddz");
         this.a_829.a_2237(dataObject.m_iServerID,dataObject.m_iRoomID);
      }
      
      private function a_2540(a_4730:a_1778) : void
      {
         this.a_829.a_3744(a_4730.dataObject as String,GameStringManager.getInstance().getString(24577),true,true);
      }
      
      private function a_2541(a_4730:a_1778) : void
      {
         var data:Object = a_4730.dataObject;
         clearTimeout(this.a_843);
         if(data.m_nResultID == 0)
         {
            this.hallServerDataProtocol.a_2343(this.authenHandler.getRawUin());
         }
         else
         {
            trace("登录hall不成功m_nResultID：" + data.m_nResultID);
            this.a_843 = setTimeout(this.a_2584,1000);
         }
      }
      
      private function a_2551(a_4730:Event) : void
      {
         var dataObj:Object = (a_4730 as a_1778).dataObject;
         if(dataObj.m_nResultID != 0)
         {
            this.a_829.a_3744(dataObj.m_szReasonMessage,GameStringManager.getInstance().getString(24578),true,true);
         }
         else if(dataObj.m_arrRoleInfo.length == 0)
         {
            this.a_829.a_3746();
         }
      }
      
      private function a_2552(a_4730:Event) : void
      {
         var currentRole:Object = null;
         var enterRoom:Object = null;
         var clientIP:int = 0;
         var dataObj:Object = (a_4730 as a_1778).dataObject;
         if(dataObj.m_nResultID == 0)
         {
            currentRole = a_2439.getInstance().GetCurrentRole();
            this.authenHandler.a_2212(currentRole.m_iRoleUin,currentRole.m_szRoleName,currentRole.m_iUserSex);
            enterRoom = a_2439.getInstance().getEnterRoom();
            if(enterRoom != null)
            {
               clientIP = int(enterRoom.m_iClientIP);
            }
            this.hallServerDataProtocol.a_2335(currentRole.m_iRoleUin,clientIP);
            this.mBridge.execute("onCreateRoleSuccess",this);
         }
         else
         {
            this.a_829.a_3744(dataObj.m_szReasonMessage,GameStringManager.getInstance().getString(24578),true,true);
         }
      }
      
      private function a_2553(a_4730:Event) : void
      {
         var dataObj:Object = (a_4730 as a_1778).dataObject;
         this.a_829.a_2350(dataObj);
      }
      
      private function a_2554(a_4730:Event) : void
      {
         var dataObj:Object = (a_4730 as a_1778).dataObject;
         this.a_2493(dataObj);
      }
      
      private function a_2555(a_4730:Event) : void
      {
         var dataObj:Object = (a_4730 as a_1778).dataObject;
         this.a_829.a_3757(dataObj as Number);
      }
      
      private function a_2419(a_4730:Event) : void
      {
         var dataObj:Object = (a_4730 as a_1778).dataObject;
         this.a_829.a_3142(dataObj);
      }
      
      private function a_2420(a_4730:Event) : void
      {
         var dataObj:Object = (a_4730 as a_1778).dataObject;
         this.a_829.a_3143(dataObj);
      }
      
      private function a_2421(a_4730:Event) : void
      {
         var dataObj:Object = (a_4730 as a_1778).dataObject;
      }
      
      private function a_2422(a_4730:Event) : void
      {
         var logicConnArray:Array = null;
         var logicConn:a_2650 = null;
         var dataObj:Object = (a_4730 as a_1778).dataObject;
         if(dataObj.m_iUin == this.authenHandler.getUin())
         {
            logicConnArray = a_2648.getInstance().getTcpConnectionsByServerType(EnmServerEntity.server_entity_logic);
            for each(logicConn in logicConnArray)
            {
               if(true == logicConn.connected)
               {
                  this.loginLogicServerProtocol.a_2633(logicConn.serverId,this.authenHandler.m_stUserBaseProfile);
               }
            }
         }
         ++this.a_827;
      }
      
      private function a_2556(a_4730:Event) : void
      {
         var dataObj:Object = (a_4730 as a_1778).dataObject;
         this.a_829.a_3743();
      }
      
      private function a_2557(a_4730:Event) : void
      {
         this.a_829.a_3745();
         trace("显示城镇!");
         this.a_829.a_3747(-1,-1);
      }
      
      private function a_2558(a_4730:Event) : void
      {
         var dataObj:Object = (a_4730 as a_1778).dataObject;
         this.a_829.a_3752(true,dataObj);
      }
      
      private function a_2559(a_4730:Event) : void
      {
         this.a_829.a_3752(false,null);
      }
      
      private function a_2560(a_4730:a_1778) : void
      {
         var result:String = GameStringManager.getInstance().getString(135429) + a_4730.dataObject.m_nResultID;
         result = "开启19-21卡槽请依次使用专用道具!";
         if(a_4730.dataObject.m_nResultID == 0)
         {
            result = GameStringManager.getInstance().getString(135430,[a_4730.dataObject.m_nStoreCount]);
         }
         this.a_829.a_3744(result,GameStringManager.getInstance().getString(24577),true,true,false,false,3000);
      }
      
      private function a_2561(a_4730:Event) : void
      {
         var stRoomEvent:Object = null;
         var m_iTableID:int = 0;
         var m_nTableStatus:int = 0;
         var flag:int = 0;
         var roomTableInfo:CTableInfo = null;
         var iPlayerID:int = 0;
         var m_iPlayerID:int = 0;
         var dataObj:Object = (a_4730 as a_1778).dataObject;
         var arrRoomEvents:Array = dataObj as Array;
         var isUserEnterOrExit:Boolean = false;
         for each(stRoomEvent in arrRoomEvents)
         {
            m_iTableID = -1;
            m_nTableStatus = -1;
            flag = -1;
            roomTableInfo = new CTableInfo();
            switch(stRoomEvent.m_byEventID)
            {
               case EnmRoomEventID.room_event_settableinfo:
                  roomTableInfo.m_iTableID = stRoomEvent.m_stEventObject.m_iTableID;
                  roomTableInfo.m_nTableStatus = -1;
                  roomTableInfo.m_szTableName = stRoomEvent.m_stEventObject.m_szTableName;
                  roomTableInfo.m_byMMCount = 0;
                  roomTableInfo.m_bySeatCount = 1;
                  roomTableInfo.m_iGameMapID = stRoomEvent.m_stEventObject.m_iMapID;
                  roomTableInfo.m_byGameMode = stRoomEvent.m_stEventObject.m_byMode;
                  roomTableInfo.m_byLevel = stRoomEvent.m_stEventObject.m_byLevel;
                  if(roomTableInfo.m_byGameMode == a_1748.enmGameMode_vComputer)
                  {
                     roomTableInfo.m_byValidCount = 2;
                  }
                  else
                  {
                     roomTableInfo.m_byValidCount = 4;
                  }
                  a_2439.getInstance().updateTDTableInfo(roomTableInfo);
                  break;
               case EnmRoomEventID.room_event_bekicked:
               case EnmRoomEventID.room_event_standup:
               case EnmRoomEventID.room_event_sitdown:
                  iPlayerID = int(stRoomEvent.m_stEventObject.m_iPlayerID);
                  roomTableInfo.m_iTableID = stRoomEvent.m_stEventObject.m_iTableID;
                  roomTableInfo.m_byMMCount = stRoomEvent.m_stEventObject.m_byMMCount;
                  roomTableInfo.m_bySeatCount = stRoomEvent.m_stEventObject.m_bySeatCount;
                  roomTableInfo.m_byValidCount = stRoomEvent.m_stEventObject.m_byValidCount;
                  roomTableInfo.m_nTableStatus = -1;
                  roomTableInfo.m_byLevel = -1;
                  a_2439.getInstance().updateTDTableInfo(roomTableInfo);
                  a_2439.getInstance().updateRoomUser(iPlayerID,roomTableInfo.m_iTableID,stRoomEvent.m_byEventID);
                  break;
               case EnmRoomEventID.room_event_unlock:
                  m_iTableID = int(stRoomEvent.m_stEventObject.m_iTableID);
                  m_nTableStatus = a_1736.table_status_idle;
                  flag = -1;
                  break;
               case EnmRoomEventID.room_event_lock:
                  m_iTableID = int(stRoomEvent.m_stEventObject.m_iTableID);
                  m_nTableStatus = a_1736.table_status_locked;
                  flag = 0;
                  break;
               case EnmRoomEventID.room_event_gamestart:
                  m_iTableID = int(stRoomEvent.m_stEventObject.m_iTableID);
                  m_nTableStatus = a_1736.table_status_gaming;
                  flag = 0;
                  break;
               case EnmRoomEventID.room_event_gameend:
                  m_iTableID = int(stRoomEvent.m_stEventObject.m_iTableID);
                  m_nTableStatus = a_1736.table_status_gaming;
                  flag = 1;
                  break;
               case EnmRoomEventID.room_event_enter:
                  a_2439.getInstance().addEnterRoomUser(stRoomEvent.m_stEventObject);
                  isUserEnterOrExit = true;
                  break;
               case EnmRoomEventID.room_event_exit:
                  m_iPlayerID = int(stRoomEvent.m_stEventObject.m_iPlayerID);
                  a_2439.getInstance().removeExitRoomUser(m_iPlayerID);
                  isUserEnterOrExit = true;
                  break;
               case EnmRoomEventID.room_event_setseatstate:
                  a_2439.getInstance().updateTDTableSeatStatus(stRoomEvent.m_stEventObject);
            }
            if(m_iTableID != -1 && m_nTableStatus != -1)
            {
               a_2439.getInstance().updateTDTableInfoStatus(m_iTableID,m_nTableStatus,flag);
            }
         }
         if(isUserEnterOrExit)
         {
            trace("isUserEnterOrExit=" + isUserEnterOrExit);
            this.a_829.a_2578(null);
         }
         this.a_829.a_3743();
      }
      
      private function a_2562(a_4730:Event) : void
      {
         var dataObj:Object = (a_4730 as a_1778).dataObject;
         this.a_829.a_2562(dataObj);
      }
      
      private function a_2563(a_4730:Event) : void
      {
         var dataObj:Object = (a_4730 as a_1778).dataObject;
      }
      
      private function a_2564(a_4730:Event) : void
      {
         var systemMsg:String = null;
         var dataObj:Object = (a_4730 as a_1778).dataObject;
         var status:int = a_2439.getInstance().TaskStatus;
         this.a_829.a_3748(status);
         if(dataObj.systemMsg != "")
         {
            systemMsg = dataObj.systemMsg;
            systemMsg = IMUtil.sendMsgFormat({
               "tag":EnmGameIM.a_509,
               "msg":systemMsg
            });
            this.mBridge.execute("onSystemMessageNotify",this,systemMsg);
         }
      }
      
      private function a_2565(a_4730:Event) : void
      {
         var dataObj:Object = (a_4730 as a_1778).dataObject;
         a_2439.getInstance().setTaskInfoStatus(dataObj.m_iTaskID,a_1756.enm_TaskUnderwayStatus);
         this.a_829.a_3749(dataObj.m_iTaskID,a_1756.enm_TaskUnderwayStatus);
      }
      
      private function a_2566(a_4730:Event) : void
      {
         var iTaskID:int = 0;
         var dataObj:Object = (a_4730 as a_1778).dataObject;
         a_2439.getInstance().setTaskInfoStatus(dataObj.m_iTaskID,a_1756.enm_TaskCompleteStatus);
         for each(iTaskID in dataObj.m_szNewTaskID)
         {
            a_2439.getInstance().setTaskInfoStatus(iTaskID,a_1756.enm_TaskOpenedStatus);
         }
         this.a_829.a_3749(dataObj.m_iTaskID,a_1756.enm_TaskCompleteStatus);
         this.a_2500();
      }
      
      private function a_2567(a_4730:Event) : void
      {
         var dataObj:Object = (a_4730 as a_1778).dataObject;
         a_2439.getInstance().setTaskInfoStatus(dataObj.m_iTaskID,a_1756.enm_TaskOverdateStatus);
         this.a_829.a_3750(dataObj);
      }
      
      private function a_2568(a_4730:Event) : void
      {
         var dataObj:Object = (a_4730 as a_1778).dataObject;
      }
      
      private function a_2569(a_4730:a_1778) : void
      {
         this.a_829.a_2569(a_4730.dataObject);
      }
      
      private function a_2570(a_4730:Event) : void
      {
         var dataObj:Object = (a_4730 as a_1778).dataObject;
         this.a_829.a_2570(dataObj);
      }
      
      private function a_2426(a_4730:Event) : void
      {
         var dataObj:Object = (a_4730 as a_1778).dataObject;
         this.a_829.a_3751(dataObj);
         this.hallServerDataProtocol.a_2309([dataObj.m_iUIN],a_1731.FLAG_GAME | a_1731.a_340 | a_1731.FLAG_VIP);
      }
      
      private function a_2571(a_4730:Event) : Boolean
      {
         var dataObj:Object = (a_4730 as a_1778).dataObject;
         this.mBridge.execute("onTalkInRoomNotify",this,dataObj as String);
         return true;
      }
      
      private function a_2572(a_4730:a_1778) : Boolean
      {
         var dataObj:Object = (a_4730 as a_1778).dataObject;
         this.mBridge.execute("onTalkOnTableNotify",this,dataObj as String);
         return true;
      }
      
      private function a_2573(a_4730:Event) : Boolean
      {
         var dataObj:Object = (a_4730 as a_1778).dataObject;
         this.mBridge.execute("onPrivateTalkNotify",this,dataObj as String);
         return true;
      }
      
      private function a_2574(a_4730:a_1778) : void
      {
         var systemMsg:String = null;
         if(a_4730.dataObject.m_nResultID != 0)
         {
            if(a_4730.dataObject.m_nResultID == 4)
            {
               systemMsg = GameStringManager.getInstance().getString(133126) + "(" + a_4730.dataObject.m_szReasonMessage + ")";
               systemMsg = IMUtil.sendMsgFormat({
                  "tag":EnmGameIM.a_509,
                  "msg":systemMsg
               });
               this.mBridge.execute("onSystemMessageNotify",this,systemMsg);
            }
            else
            {
               this.mBridge.execute("OnBigSpeakerError",this,a_4730.dataObject);
            }
         }
         else
         {
            this.a_829.a_3753(a_4730.dataObject);
         }
      }
      
      private function a_2575(a_4730:a_1778) : void
      {
         this.mBridge.execute("onBigSpeakerNotify",this,a_4730.dataObject);
      }
      
      private function a_2576(a_4730:a_1778) : void
      {
         this.mBridge.execute("onSystemMessageNotify",this,a_4730.dataObject as String,0);
      }
      
      public function a_2379(p_commandID:int, p_commandData:Object) : void
      {
         this.hallServerDataProtocol.a_2379(p_commandID,p_commandData);
      }
      
      private function a_2424(a_4730:a_1778) : void
      {
         var data:Object = a_4730.dataObject;
         switch(data.m_nCommandID)
         {
            case a_1740.a_393:
               this.onNotifyPlayWith(data);
               break;
            default:
               trace("OnNotifyTransferClientCommand>>m_nCommandID=" + data.m_nCommandID + " 该命令没被处理！");
         }
      }
      
      private function onNotifyPlayWith(data:Object) : void
      {
         var decoder:a_2739 = null;
         var strUserName:String = null;
         var systemMsg:String = null;
         var decodeBuffer:ByteArray = data.m_szCommandData;
         decoder = new a_2739();
         decoder.decode(decodeBuffer,0);
         switch(decoder.m_iACT)
         {
            case EnmInviteType.REQUEST:
               this.a_829.a_3754(decoder);
               break;
            case EnmInviteType.REJECT:
               strUserName = IMUtil.showUserInMsgFormat(decoder.m_getUin,decoder.m_getNick);
               systemMsg = strUserName + GameStringManager.getInstance().getString(135431);
               systemMsg = IMUtil.sendMsgFormat({
                  "tag":EnmGameIM.a_509,
                  "msg":systemMsg
               });
               this.mBridge.execute("onSystemMessageNotify",this,systemMsg);
               break;
            default:
               trace("EnmInviteType>>非法邀请类型>m_iACT = " + decoder.m_iACT);
         }
      }
      
      private function a_2427(a_4730:a_1778) : void
      {
         var userStatus:Object = null;
         var systemMsg:String = null;
         var stPlayerStatus:Object = a_4730.dataObject;
         var stateData:Object = stPlayerStatus.m_stStateData[0];
         var friend:Object = a_2439.getInstance().getFriendByUin(stPlayerStatus.m_nUin);
         var consortiaMember:Object = a_2307.getInstance().getConsortiaMember(stPlayerStatus.m_nUin);
         var strUserName:String = null;
         var online:int = -1;
         if(stateData != null)
         {
            if(stateData.m_cClass == a_1755.a_522)
            {
               online = int(stateData.hallState);
            }
         }
         if(stPlayerStatus.m_byClassCount == 0)
         {
            online = a_1750.enm_LeaveStatus;
         }
         if(stPlayerStatus.m_nUin != a_2439.getInstance().m_currentRoleUin)
         {
            systemMsg = "";
            if(online == a_1750.enm_OnlineStatus)
            {
               if(null != consortiaMember && consortiaMember.m_iGameStatus != online)
               {
                  strUserName = IMUtil.showUserInMsgFormat(consortiaMember.m_iUIN,consortiaMember.m_czName);
               }
               if(null != friend && friend.m_iGameStatus != online)
               {
                  strUserName = IMUtil.showUserInMsgFormat(friend.m_szRoleName,friend.m_szRoleName);
                  this.hallServerDataProtocol.a_2310([friend.m_iRoleUin]);
               }
               if(strUserName != null)
               {
                  systemMsg = strUserName + GameStringManager.getInstance().getString(135432);
                  systemMsg = IMUtil.sendMsgFormat({
                     "tag":EnmGameIM.a_509,
                     "msg":systemMsg
                  });
                  this.mBridge.execute("onSystemMessageNotify",this,systemMsg);
               }
            }
            else if(online == a_1750.enm_LeaveStatus)
            {
               if(null != friend && friend.m_iGameStatus != a_1750.enm_LeaveStatus)
               {
                  strUserName = IMUtil.showUserInMsgFormat(friend.m_szRoleName,friend.m_szRoleName);
               }
               if(null != consortiaMember && consortiaMember.m_iGameStatus != a_1750.enm_LeaveStatus)
               {
                  strUserName = IMUtil.showUserInMsgFormat(consortiaMember.m_iUIN,consortiaMember.m_czName);
               }
               if(strUserName != null)
               {
                  systemMsg = strUserName + GameStringManager.getInstance().getString(135433);
                  systemMsg = IMUtil.sendMsgFormat({
                     "tag":EnmGameIM.a_509,
                     "msg":systemMsg
                  });
                  this.mBridge.execute("onSystemMessageNotify",this,systemMsg);
               }
            }
            a_2439.getInstance().updateFriendStatus([stPlayerStatus]);
            a_2307.getInstance().changeConsortiaMemberStatue(stPlayerStatus);
            if(null != consortiaMember)
            {
               this.mBridge.execute("onOnlineStateChangedNotify",this,stPlayerStatus);
            }
         }
      }
      
      private function a_2577(a_4730:a_1778) : void
      {
         this.mBridge.execute("onOnlineStateChangedNotify",this,null);
      }
      
      private function a_2578(a_4730:a_1778) : void
      {
         var arrUserViewArea:Array = a_4730.dataObject as Array;
         this.a_829.a_2578(arrUserViewArea);
      }
      
      private function a_2579(a_4730:a_1778) : void
      {
         var playerCounts:Object = a_4730.dataObject;
         this.a_829.a_2579(playerCounts);
      }
      
      private function a_2580(a_4730:a_1778) : void
      {
         var o:Object = a_4730.dataObject;
         if(o.m_nResultID == 0)
         {
            this.a_829.a_3744(GameStringManager.getInstance().getString(135434),GameStringManager.getInstance().getString(24577),false,true,false,false);
         }
         else
         {
            this.a_829.a_3744(GameStringManager.getInstance().getString(135435),GameStringManager.getInstance().getString(24577),false,true,false,false);
         }
      }
      
      private function a_2428(a_4730:a_1778) : void
      {
         var timeoutId:uint = 0;
         this.isNotifyKick = true;
         timeoutId = setTimeout(function():void
         {
            clearInterval(timeoutId);
            a_829.a_3762(a_4730.dataObject.m_szReasonMessage);
         },300);
      }
      
      private function a_2583(a_4730:a_1778) : void
      {
         var enterRoom:Object = null;
         var data:Object = a_4730.dataObject;
         if(data as Array)
         {
            if(data[1] == EnmServerEntity.server_entity_hall)
            {
               if(!this.isNotifyKick)
               {
                  clearTimeout(this.a_843);
                  this.a_843 = setTimeout(this.a_2584,1000);
               }
               else if(this.a_843 != 0)
               {
                  clearTimeout(this.a_843);
                  this.a_829.a_3762(data);
               }
            }
            enterRoom = a_2439.getInstance().a_2483;
            if(enterRoom.m_iServerID == data[0] && data[1] == EnmServerEntity.server_entity_logic)
            {
               this.a_829.a_3762(data);
            }
         }
      }
      
      private function a_2584() : Boolean
      {
         var enterRoom:Object = null;
         var arrData:Array = null;
         trace("重复登录hallserver次数：" + this.a_844);
         ++this.a_844;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         clearTimeout(this.a_843);
         if(this.a_844 > 5)
         {
            enterRoom = a_2439.getInstance().a_2483;
            arrData = [enterRoom.m_iServerID,EnmServerEntity.server_entity_hall];
            this.a_829.a_3762(arrData);
            return false;
         }
         if(EnmConnLoginStatus.enmNoLogin == hallConn.m_iLoginStatus)
         {
            this.a_2525();
         }
         else if(EnmConnLoginStatus.enmLogined == hallConn.m_iLoginStatus)
         {
         }
         return true;
      }
      
      private function a_2585(a_4730:a_1778) : void
      {
         var stItemInfoEvent:a_1778 = null;
         if(this.m_iTypeByGetOtherHeroInfo < 0)
         {
            return;
         }
         switch(this.m_iTypeByGetOtherHeroInfo)
         {
            case 1:
               this.a_829.a_3765(a_4730.dataObject);
               break;
            case 2:
               stItemInfoEvent = new a_1778(ActivityEventType.NOTIFY_PARTNER_ITEM_INFO);
               stItemInfoEvent.dataObject = a_4730.dataObject;
               ActivityEventManagerFactory.getInstance().dispatchEvent(stItemInfoEvent);
         }
         this.m_iTypeByGetOtherHeroInfo = -1;
      }
      
      private function a_2586(a_4730:a_1778) : void
      {
         this.a_829.a_2586(a_4730.dataObject);
      }
      
      private function a_2587(a_4730:a_1778) : void
      {
         this.a_829.a_3763(a_4730.dataObject);
      }
      
      public function a_2510(iUin:int) : void
      {
         this.hallServerDataProtocol.a_2400(iUin,1888);
      }
      
      public function a_2511(iRoleUin:int, iTypeByGetOtherHeroInfo:int = 1) : void
      {
         this.m_iTypeByGetOtherHeroInfo = iTypeByGetOtherHeroInfo;
         this.hallServerDataProtocol.a_2310([iRoleUin]);
      }
      
      public function a_2512(iRoleUin:int) : void
      {
         this.hallServerDataProtocol.a_2402(iRoleUin);
      }
      
      public function a_2588(a_4730:a_1778) : void
      {
         var data:Object = a_4730.dataObject;
         if(data != null)
         {
            this.a_829.a_2588(data.m_iRoleUin,data);
         }
      }
      
      public function RequestUpdateShowCardSetUp(iShowCard:int) : void
      {
         this.hallServerDataProtocol.RequestUpdateShowCardSetUp(iShowCard);
      }
      
      private function a_2589(a_4730:a_1778) : void
      {
         var enterRoom:Object = a_2439.getInstance().a_2483;
         var systemMsg:String = GameStringManager.getInstance().getString(135436);
         if(a_4730.dataObject.m_nReasonID == 15)
         {
            systemMsg = "非本公会成员，不能进入公会副本";
         }
         MessageTipHandler.Get().a_3146(systemMsg);
         systemMsg = IMUtil.sendMsgFormat({
            "tag":EnmGameIM.a_509,
            "msg":systemMsg
         });
         this.mBridge.execute("onSystemMessageNotify",this,systemMsg);
         this.a_2550(a_1750.enm_EnterRoomStatus,enterRoom.m_iGameID,enterRoom.m_iServerID,enterRoom.m_iRoomID,1,-1);
      }
      
      public function RequestDelFriend(p_uin:int) : void
      {
         this.hallServerDataProtocol.RequestDelFriend(p_uin);
      }
      
      private function a_2590(a_4730:a_1778) : void
      {
         this.a_829.a_3766(a_4730.dataObject);
      }
      
      public function UseSkillBook(iCardID:int, iCardSeq:int) : void
      {
         this.hallServerDataProtocol.RequestUseSkillBook(iCardID,iCardSeq);
      }
      
      public function a_2514(iCardID:int, iCardSeq:int) : void
      {
         this.hallServerDataProtocol.RequestUseExchangeItem(iCardID,iCardSeq);
      }
      
      private function a_2591(a_4730:a_1778) : void
      {
         this.a_829.a_3767(a_4730.dataObject);
      }
      
      private function a_2592(a_4730:a_1778) : void
      {
         this.a_829.a_3768(a_4730.dataObject);
      }
      
      private function a_2593(a_4730:a_1778) : void
      {
         this.a_829.a_2593(a_4730.dataObject);
      }
      
      private function OnMiBaoKuGameData(a_4730:a_1778) : void
      {
         this.a_829.OnMiBaoKuGameData(a_4730.dataObject);
      }
      
      public function sendMatchGameData(iServerID:int, iRoomID:int, byMatchGameData:ByteArray) : void
      {
         var logicConn:a_2650 = a_2256.getInstance().a_2258(iServerID);
         if(EnmConnLoginStatus.enmNoLogin == logicConn.m_iLoginStatus)
         {
            this.a_2520(iServerID,iRoomID,byMatchGameData);
            this.a_2481(iServerID);
         }
         else if(EnmConnLoginStatus.enmLogined == logicConn.m_iLoginStatus)
         {
            this.logicGameDataProtocol.a_2620(iServerID,iRoomID,byMatchGameData);
         }
         else if(EnmConnLoginStatus.enmLogining == logicConn.m_iLoginStatus)
         {
            this.a_2520(iServerID,iRoomID,byMatchGameData);
         }
      }
      
      public function a_2515(iTaskID:int, byType:int = 0) : void
      {
         if(false == a_3168.getInstance().isLegal)
         {
            return;
         }
         var iRoleUin:int = a_2439.getInstance().m_currentRoleUin;
         this.hallServerDataProtocol.a_2412(iRoleUin,iTaskID,byType);
      }
      
      public function a_2516(taskInfo:Object) : void
      {
         var iRoleUin:int = a_2439.getInstance().m_currentRoleUin;
         this.hallServerDataProtocol.a_2410(iRoleUin,taskInfo);
      }
      
      public function a_2594(a_4730:a_1778) : void
      {
         this.a_829.a_3764(a_4730.dataObject);
      }
      
      public function a_2595(a_4730:a_1778) : void
      {
         this.a_829.a_2595(a_4730.dataObject);
      }
      
      public function a_2596(a_4730:a_1778) : void
      {
         this.a_829.a_2596(a_4730.dataObject);
      }
      
      public function RequestMarginListData(data:Object) : Boolean
      {
         return this.hallServerDataProtocol.requestMarginListData(data);
      }
      
      public function RequestMarginReverseRegister(data:Object) : Boolean
      {
         return this.hallServerDataProtocol.requestMarginReverseRegister(data);
      }
      
      public function RequestMarginRegisterFriend(data:Object) : Boolean
      {
         return this.hallServerDataProtocol.requestMarginRegisterFriend(data);
      }
      
      public function RequestMarginPlayerByUin(data:Object) : Boolean
      {
         return this.hallServerDataProtocol.requestMarginPlayerByUin(data);
      }
      
      public function RequestMarginRegistAdvert(data:Object) : Boolean
      {
         return this.hallServerDataProtocol.requestMarginRegistAdvert(data);
      }
      
      public function RequestMarginModifyAdvert(data:Object) : Boolean
      {
         return this.hallServerDataProtocol.requestMarginModifyAdvert(data);
      }
      
      public function RequestMarginStar(data:Object) : Boolean
      {
         return this.hallServerDataProtocol.requestMarginStar(data);
      }
      
      public function RequestMarginSearch(pData:Object) : Boolean
      {
         return this.hallServerDataProtocol.requestMarginSearch(pData);
      }
      
      public function OnMarginListData(a_4730:a_1778) : void
      {
         var obj:Object = a_4730.dataObject;
         this.a_829.onMarginListData(obj);
      }
      
      public function OnMarginRegisterFriend(a_4730:a_1778) : void
      {
         var obj:Object = a_4730.dataObject;
         this.a_829.onMarginRegisterFriend(obj);
      }
      
      public function OnMarginReverseRegister(a_4730:a_1778) : void
      {
         var obj:Object = a_4730.dataObject;
         this.a_829.onMarginReverseRegister(obj);
      }
      
      public function OnMarginRegistAdvert(a_4730:a_1778) : void
      {
         var obj:Object = a_4730.dataObject;
         this.a_829.onMarginRegistAdvert(obj);
      }
      
      public function OnMarginModifyAdvert(a_4730:a_1778) : void
      {
         var obj:Object = a_4730.dataObject;
         this.a_829.onMarginModifyAdvert(obj);
      }
      
      public function OnMarginStar(a_4730:a_1778) : void
      {
         var obj:Object = a_4730.dataObject;
         this.a_829.onMarginStar(obj);
      }
      
      public function OnMarginPlayerByUin(a_4730:a_1778) : void
      {
         var obj:Object = a_4730.dataObject;
         this.a_829.onMarginPlayerByUin(obj);
      }
      
      public function OnMarginSearch(a_4730:a_1778) : void
      {
         var obj:Object = a_4730.dataObject;
         this.a_829.onMarginSearch(obj);
      }
      
      public function RequestChangeName(pData:Object) : void
      {
         this.hallServerDataProtocol.requestChangeName(pData);
      }
      
      public function OnChangeName(a_4730:a_1778) : void
      {
         var obj:Object = a_4730.dataObject;
         this.a_829.onChangeName(obj);
      }
      
      public function RequestUseCardSlotPackage(data:Object) : void
      {
         this.hallServerDataProtocol.RequestUseCardSlotPackage(data);
      }
      
      public function RequestOpenCardSlotPackage(data:Object) : void
      {
         this.hallServerDataProtocol.RequestOpenCardSlotPackage(data);
      }
      
      private function a_2597(a_4730:a_1778) : void
      {
         this.a_829.a_2416(a_4730.dataObject);
      }
      
      private function a_2598(a_4730:a_1778) : void
      {
         this.a_829.a_2417(a_4730.dataObject);
      }
      
      private function a_2599(a_4730:a_1778) : void
      {
         this.a_829.a_2599(a_4730.dataObject);
      }
      
      private function a_2600(a_4730:a_1778) : void
      {
         this.a_829.a_2600(a_4730.dataObject);
      }
      
      public function RequestSendVow(data:Object) : void
      {
         this.hallServerDataProtocol.RequestSendVow(data);
      }
      
      public function RequestGetVowNews(data:Object) : void
      {
         this.hallServerDataProtocol.RequestGetVowNews(data);
      }
      
      private function a_2601(a_4730:a_1778) : void
      {
         this.a_829.a_2601(a_4730.dataObject);
      }
      
      private function a_2602(a_4730:a_1778) : void
      {
         this.a_829.a_2602(a_4730.dataObject);
      }
      
      public function a_2517(iHealthStatus:int, iStartTime:int) : void
      {
         var enterRoom:Object = a_2439.getInstance().a_2483;
         this.logicGameDataProtocol.a_2517(enterRoom.m_iServerID,enterRoom.m_iRoomID,iHealthStatus,iStartTime);
      }
      
      public function RequestBuyMiShiUseNum(iInstanceType:int) : Boolean
      {
         return this.hallServerDataProtocol.RequestBuyMiShiUseNum(iInstanceType);
      }
      
      public function RequestBuyClimbTowerCount(iType:int) : void
      {
         this.hallServerDataProtocol.RequestBuyClimbTowerCount(iType);
      }
      
      public function RequestGetClimbTowerRank(iFlag:int) : void
      {
         this.logicGameDataProtocol.RequestGetClimbTowerRank(iFlag);
      }
      
      public function RequestChangeGuideData(guideData:String) : Boolean
      {
         return this.hallServerDataProtocol.ChangeGuideData(guideData);
      }
      
      public function OnRequestSendChatMsg(iType:int, iUin:int, iGroupID:int, iPlatformID:int, strMsg:String, iDstUin:int = 0, iDstGroupID:int = 0, iDstPlatformID:int = 0) : void
      {
         this.logicGameDataProtocol.OnRequestSendChatMsg(iType,iUin,iGroupID,iPlatformID,strMsg,iDstUin,iDstGroupID,iDstPlatformID);
      }
      
      public function OnCRequestCrossRoomList(iUin:int, iRoomID:int, iType:int, iSearchID:int) : void
      {
         this.logicGameDataProtocol.OnCRequestCrossRoomList(iUin,iRoomID,iType,iSearchID);
      }
      
      public function OnRequestGameResult(iUin:int) : void
      {
         this.logicGameDataProtocol.OnRequestGameResult(iUin);
      }
      
      public function OnCCSRequestCrossDropCount(iUin:int) : void
      {
         this.logicGameDataProtocol.OnCCSRequestCrossDropCount(iUin);
      }
      
      public function OnCRequestCrossGetTableInfo(iTableId:int) : void
      {
         this.logicGameDataProtocol.OnCRequestCrossGetTableInfo(iTableId);
      }
      
      public function OnCRequestDiyGetSelfMap(iUin:int, iType:int, iFrom:int, iNum:int) : void
      {
         this.logicGameDataProtocol.OnCRequestDiyGetSelfMap(iUin,iType,iFrom,iNum);
      }
      
      public function OnCRequestGetDiyStoreInfo(iUin:int, iId:int = -1) : void
      {
         this.logicGameDataProtocol.OnCRequestGetDiyStoreInfo(iUin,iId);
      }
      
      public function OnCRequestDiyCreateMap(iUin:int, iMapId:int = 0) : void
      {
         this.logicGameDataProtocol.OnCRequestDiyCreateMap(iUin,iMapId);
      }
      
      public function OnCRequestDiyGetMapInfo(iUin:int, iMapId:int = 0) : void
      {
         this.logicGameDataProtocol.OnCRequestDiyGetMapInfo(iUin,iMapId);
      }
      
      public function OnCRequestDiyUpdateMapInfo(iUin:int, iMapID:int, obj:Object) : void
      {
         this.logicGameDataProtocol.OnCRequestDiyUpdateMapInfo(iUin,iMapID,obj);
      }
      
      public function OnCRequestDiyUpdateMapWave(iUin:int, iMapID:int, iWaveID:int, iDataSize:int, szData:ByteArray) : void
      {
         this.logicGameDataProtocol.OnCRequestDiyUpdateMapWave(iUin,iMapID,iWaveID,iDataSize,szData);
      }
      
      public function OnCRequestDiyGetMapWave(iUin:int, iMapID:int, iWaveID:int, iUsage:int) : void
      {
         this.logicGameDataProtocol.OnCRequestDiyGetMapWave(iUin,iMapID,iWaveID,iUsage);
      }
      
      public function OnCRequestDiyPublishMap(iUin:int, iMapId:int, szName:String, szDesz:String) : void
      {
         this.logicGameDataProtocol.OnCRequestDiyPublishMap(iUin,iMapId,szName,szDesz);
      }
      
      public function OnCRequestDiyDelMap(iUin:int, iMapId:int) : void
      {
         this.logicGameDataProtocol.OnCRequestDiyDelMap(iUin,iMapId);
      }
      
      public function OnCRequestDiyGetMapList(iUin:int, iType:int, szSearch:String) : void
      {
         this.logicGameDataProtocol.OnCRequestDiyGetMapList(iUin,iType,szSearch);
      }
      
      public function OnCRequestGetDiyPlayerMapData(iUin:int, vMapId:Vector.<int>) : void
      {
         this.logicGameDataProtocol.OnCRequestGetDiyPlayerMapData(iUin,vMapId);
      }
      
      public function OnCCSRequestAppraiseDIYMap(iUin:int, iMapId:int, iOpt:int) : void
      {
         this.logicGameDataProtocol.OnCCSRequestAppraiseDIYMap(iUin,iMapId,iOpt);
      }
      
      public function OnCCSRequestReceiveDIYCoin(iUin:int, iMapId:int) : void
      {
         this.logicGameDataProtocol.OnCCSRequestReceiveDIYCoin(iUin,iMapId);
      }
      
      public function OnCCSRequestGetTwoPataCount(iUin:int) : void
      {
         this.logicGameDataProtocol.OnCCSRequestGetTwoPataCount(iUin);
      }
      
      public function OnCCSRequestGetTwoPataLevel(iUin:int) : void
      {
         this.logicGameDataProtocol.OnCCSRequestGetTwoPataLevel(iUin);
      }
      
      public function OnCCSRequestGetTwoPataRank(iUin:int, iFrom:int, iTo:int) : void
      {
         this.logicGameDataProtocol.OnCCSRequestGetTwoPataRank(iUin,iFrom,iTo);
      }
      
      public function OnCCRequestGetTowRankInfo(iUin:int, iMod:int) : void
      {
         this.logicGameDataProtocol.OnCCRequestGetTowRankInfo(iUin,iMod);
      }
      
      public function OnCRequestGetDiyTerrain(iUin:int, iMapID:int, iUsage:int) : void
      {
         this.logicGameDataProtocol.OnCRequestGetDiyTerrain(iUin,iMapID,iUsage);
      }
      
      public function OnCRequestUpdateDiyTerrain(iUin:int, iMapID:int, iDataSize:int, szData:ByteArray) : void
      {
         this.logicGameDataProtocol.OnCRequestUpdateDiyTerrain(iUin,iMapID,iDataSize,szData);
      }
      
      public function OnCCSRequestGetWorldBossInfo(iUin:int) : void
      {
         this.logicGameDataProtocol.OnCCSRequestGetWorldBossInfo(iUin);
      }
      
      public function OnCCSRequestGetWorldBossRank(type:int, platform:int, serverId:int, targetId:int, seasonId:int) : void
      {
         this.logicGameDataProtocol.OnCCSRequestGetWorldBossRank(type,platform,serverId,targetId,seasonId);
      }
      
      public function OnCCSRequestGetCheckWorldBossPlayerInfo(platform:int, group:int, targetUin:int) : void
      {
         this.logicGameDataProtocol.OnCCSRequestCheckWorldBossPlayerInfo(platform,group,targetUin);
      }
      
      public function OnCCSRequestGetWorldBossRecord(iUin:int) : void
      {
         this.logicGameDataProtocol.onCCSRequestGetWorldBossRecord(iUin);
      }
      
      public function OnCCSRequestGetWorldBossSummary(iUin:int) : void
      {
         this.logicGameDataProtocol.onCCSRequestGetWorldBossSummary(iUin);
      }
      
      public function OnCCSRequestWorldBossFastPK(iUin:int, iCount:int) : void
      {
         this.logicGameDataProtocol.onCCSRequestMsgWorldBossSkip(iUin,iCount);
      }
      
      public function OnCCsRequestWorldBossMapID(iUin:int, bossID:int, buffID:int) : void
      {
         this.logicGameDataProtocol.onCCSRequestGetWorldBossMap(iUin,bossID,buffID);
      }
   }
}

