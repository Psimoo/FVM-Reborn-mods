package com.aurora.ui.maogoutd.worldBossLevel.vo
{
   import a_4716.EnmWorldBossLevelSortType;
   import a_4723.a_1767;
   import a_4752.GameStringManager;
   import a_4752.a_2033;
   import a_4754.a_2161;
   import a_4763.a_2439;
   import a_4781.Tool;
   import a_4788.LocalData;
   import com.aurora.protocol.hallserver.worldBoss.CCSResponseGetWorldBossInfo;
   import com.aurora.protocol.hallserver.worldBoss.CCSResponseGetWorldBossRank;
   import com.aurora.protocol.hallserver.worldBoss.CResponseDivideAward;
   import com.aurora.protocol.hallserver.worldBoss.CResponseGetDivideMainInfo;
   import com.aurora.protocol.hallserver.worldBoss.CResponseGetWorldBossSummary;
   import com.aurora.protocol.hallserver.worldBoss.CResponseMsgWorldBossSkip;
   import com.aurora.protocol.hallserver.worldBoss.CResponseReceiveDivideAward;
   import com.aurora.protocol.hallserver.worldBoss.CWBDivideAward;
   import com.aurora.protocol.hallserver.worldBoss.CWBDividePlayerAward;
   import com.aurora.protocol.hallserver.worldBoss.CWBDividePlayerAwardInfo;
   import com.aurora.protocol.hallserver.worldBoss.CWBRankConsInfo;
   import com.aurora.protocol.hallserver.worldBoss.CWBRankInfo;
   import com.aurora.protocol.hallserver.worldBoss.CWBSummary;
   import com.aurora.ui.maogoutd.PayAward.AwardData;
   import com.aurora.ui.maogoutd.component.a_3228;
   import com.aurora.ui.maogoutd.component.award.GridItemData;
   import com.aurora.ui.maogoutd.component.scrollBar.VirtualList.VirtualGridData;
   import com.aurora.ui.maogoutd.component.scrollBar.VirtualList.VirtualRowData;
   import com.aurora.ui.maogoutd.role.a_4463;
   import com.aurora.ui.maogoutd.worldBossLevel.AnalysisWorldBossXml;
   import com.aurora.ui.maogoutd.worldBossLevel.conf.WorldBossAwardTypeConf;
   import com.aurora.ui.maogoutd.worldBossLevel.conf.WorldBossConf;
   import com.aurora.ui.maogoutd.worldBossLevel.conf.WorldBossDuanweiAwardConf;
   import com.aurora.ui.maogoutd.worldBossLevel.conf.WorldBossDuanweiConf;
   import com.aurora.ui.maogoutd.worldBossLevel.conf.WorldBossDuanweiQualityAwardConf;
   import com.aurora.ui.maogoutd.worldBossLevel.conf.WorldBossMemberInUnionRankAwardConf;
   import com.aurora.ui.maogoutd.worldBossLevel.conf.WorldBossQualityAwardConf;
   import com.aurora.ui.maogoutd.worldBossLevel.conf.WorldBossQualityConf;
   import com.aurora.ui.maogoutd.worldBossLevel.conf.WorldBossSeasonConf;
   import com.aurora.ui.maogoutd.worldBossLevel.conf.WorldBossShopItemConf;
   import com.aurora.ui.maogoutd.worldBossLevel.conf.WorldBossSystemMsgConf;
   import com.aurora.ui.maogoutd.worldBossLevel.conf.WorldBossUnionMemberAwardConf;
   import com.aurora.ui.maogoutd.worldBossLevel.conf.WorldBossUnionRankAwardConf;
   import com.aurora.ui.maogoutd.worldBossLevel.conf.WorldBossUserRankAwardConf;
   import flash.utils.Dictionary;
   
   public class WorldBossModel
   {
      
      private static var a_921:WorldBossModel;
      
      public static const STATE_UN_PK:int = 1;
      
      public static const STATE_NEAR_TO_PK:int = 2;
      
      public static const STATE_PK:int = 3;
      
      public static const STATE_PK_WAIT_RESULT:int = 4;
      
      public static const USER_CROSS_SERVER_AWARD:int = 1;
      
      public static const USER_LOCAL_SERVER_AWARD:int = 2;
      
      public static const USER_DUANWEI_AWARD:int = 3;
      
      public static const UNION_CROSS_SERVER_AWARD:int = 4;
      
      public static const UNION_LOCAL_SERVER_AWARD:int = 5;
      
      public static const CANT_RECEIVE_AWARD:int = 0;
      
      public static const CAN_RECEIVE_AWARD:int = 1;
      
      public static const RECEIVED_AWARD:int = 2;
      
      public static const SHOP_SELL_TYPE1:int = 1;
      
      public static const SHOP_SELL_TYPE2:int = 2;
      
      public static const SHOP_SELL_TYPE3:int = 3;
      
      public static const SHOP_SELL_TYPE4:int = 4;
      
      public static const SHOP_MONEY_TYPE_CHILD:int = 109;
      
      public static const SHOP_MONEY_TYPE_DEMON_KING:int = 110;
      
      public static const SHOP_MONEY_TYPE_BRAVE:int = 111;
      
      public static const SHOP_ITEM_UN_ACTIVE:int = 0;
      
      public static const SHOP_ITEM_CAN_BUY:int = 1;
      
      public static const SHOP_ITEM_CAN_NOT_BUY:int = 2;
      
      public static const MIN_IN_RANK:int = 1;
      
      public static const MAX_IN_RANK:int = 100;
      
      public static const OPEN_FAST_PK:int = 1;
      
      public static const OPEN_RECORD:int = 2;
      
      public static const FAST_PK_STATE_INIT:int = 0;
      
      public static const FAST_PK_STATE_AWARD_PREVIEW:int = 1;
      
      public static const FAST_PK_STATE_PLAY:int = 2;
      
      public static const FAST_PK_STATE_GET_AWARD:int = 3;
      
      public static const BUFF_SELECTER_MAX_COL_NUM:int = 3;
      
      public static const BUFF_CELL_WIDTH:int = 56;
      
      public static const BUFF_CELL_HEIGHT:int = 43;
      
      private var seasonId:int;
      
      private var state:int;
      
      private var isTrainMode:Boolean;
      
      private var preSeasonCfg:WorldBossSeasonConf;
      
      private var currentSeasonCfg:WorldBossSeasonConf;
      
      private var buffId:int;
      
      private var buffTrainIdDic:Dictionary;
      
      private var currSeasonMapID:int;
      
      private var currentWorldBossId:int;
      
      private var historyDuanweiLevel:int;
      
      private var historyDuanweiQualityLevel:int;
      
      private var realTimeDuanweiLevel:int;
      
      private var realTimeDuanweiQualityLevel:int;
      
      private var realTimePoint:int;
      
      private var fightCnt:int;
      
      private var lastRealTimePoint:int;
      
      private var lastRealTimeDuanweiLevel:int;
      
      private var lastRealTimeDuanweiQualityLevel:int;
      
      private var historyAllServerUserRankIdx:int;
      
      private var historyLocalServerUserRankIdx:int;
      
      private var historyUnionUserUserRankIdx:int;
      
      private var historyAllServerUnionRankIdx:int;
      
      private var historyLocalServerUnionRankIdx:int;
      
      private var historyIsUnionLeader:Boolean;
      
      private var currentAllServerUserRankIdx:int;
      
      private var currentLocalServerUserRankIdx:int;
      
      private var currentUnionUserUserRankIdx:int;
      
      private var currentAllServerUnionRankIdx:int;
      
      private var currentLocalServerUnionRankIdx:int;
      
      private var currentIsUnionLeader:Boolean;
      
      private var nowSeasonAwardStatesVect:Vector.<int>;
      
      private var preSeasonAwardStatesVect:Vector.<int>;
      
      private var flag:int;
      
      private var topUserData:WorldBossUserData = new WorldBossUserData();
      
      private var rankTimeCDDic:Dictionary;
      
      private var allServerSortList:Array;
      
      private var localServerSortList:Array;
      
      private var unionAllServerSortList:Array;
      
      private var unionLocalServerSortList:Array;
      
      private var unionUserSortList:Array;
      
      public var localAwardRowDic:Dictionary;
      
      private var shopMoneyTypeValueDic:Dictionary;
      
      private var shopLocalHasBuyItemIDDic:Dictionary;
      
      private var shopCrossHasBuyItemIDDic:Dictionary;
      
      private var maxRecordData:WorldBossRecordVO;
      
      private var summaryVect:Vector.<WorldBossSummaryVO>;
      
      private var systemMsgDic:Dictionary;
      
      private var fastPKPointOne:int;
      
      private var fastPKAwardData:CResponseMsgWorldBossSkip;
      
      private var localData:LocalData;
      
      private var localSharedData:Object;
      
      private var localSharedDataInitAutoOpenSummary:int;
      
      private var divideAwardFlag:int;
      
      private var isDivideUnionLeader:Boolean;
      
      private var divideEditor:Boolean;
      
      private var divideEditorState:int;
      
      private var divideEditorMemberList:Vector.<VirtualRowData>;
      
      private var divideReadMemberList:Vector.<VirtualRowData>;
      
      private var divideGridAwardList:Vector.<VirtualGridData>;
      
      private var divideMainInfo:CResponseGetDivideMainInfo;
      
      private var lastShopBuyStartTm:Number = 0;
      
      private var showRobBuyTmLock:Boolean = false;
      
      private const STATE_SYSTEM_MSG_CD:int = 900;
      
      private const LOCAL_SHARE_DATA_KEY:String = "worldboss";
      
      public function WorldBossModel()
      {
         super();
         this.allServerSortList = [];
         this.localServerSortList = [];
         this.unionAllServerSortList = [];
         this.unionLocalServerSortList = [];
         this.unionUserSortList = [];
         this.localAwardRowDic = new Dictionary(true);
         this.nowSeasonAwardStatesVect = new Vector.<int>();
         this.preSeasonAwardStatesVect = new Vector.<int>();
         this.summaryVect = new Vector.<WorldBossSummaryVO>();
         this.shopMoneyTypeValueDic = new Dictionary(true);
         this.shopLocalHasBuyItemIDDic = new Dictionary(true);
         this.shopCrossHasBuyItemIDDic = new Dictionary(true);
         this.buffTrainIdDic = new Dictionary(true);
         this.systemMsgDic = new Dictionary(true);
         this.currentSeasonCfg = null;
         this.preSeasonCfg = null;
         this.localSharedData = null;
         this.localSharedDataInitAutoOpenSummary = -1;
         this.realTimeDuanweiLevel = -1;
         this.realTimeDuanweiQualityLevel = -1;
         this.realTimePoint = -1;
         this.lastRealTimePoint = -1;
         this.lastRealTimeDuanweiLevel = -1;
         this.lastRealTimeDuanweiQualityLevel = -1;
         this.divideAwardFlag = 0;
         this.isDivideUnionLeader = false;
         this.divideEditor = false;
         this.divideEditorState = 0;
         this.divideEditorMemberList = new Vector.<VirtualRowData>();
         this.divideReadMemberList = new Vector.<VirtualRowData>();
         this.divideGridAwardList = new Vector.<VirtualGridData>();
      }
      
      public static function GetInstance() : WorldBossModel
      {
         if(null == a_921)
         {
            a_921 = new WorldBossModel();
         }
         return a_921;
      }
      
      public function clear() : void
      {
         this.setIsTrainMode(false);
      }
      
      public function init(data:CCSResponseGetWorldBossInfo) : void
      {
         this.rankTimeCDDic = new Dictionary(true);
         this.rankTimeCDDic[EnmWorldBossLevelSortType.RANK_DATA_TYPE_USER_ALL] = 0;
         this.rankTimeCDDic[EnmWorldBossLevelSortType.RANK_DATA_TYPE_USER_LOCAL] = 0;
         this.rankTimeCDDic[EnmWorldBossLevelSortType.RANK_DATA_TYPE_UNION_ALL] = 0;
         this.rankTimeCDDic[EnmWorldBossLevelSortType.RANK_DATA_TYPE_UNION_LOCAL] = 0;
         this.rankTimeCDDic[EnmWorldBossLevelSortType.RANK_DATA_TYPE_UNION_USER] = 0;
         this.setSeasonId(data.m_cSeasonID);
         this.setSeasonState();
         this.setCurrentWorldBossId(data.m_cBossID);
         this.setBuffId(data.m_cBuffID);
         this.setCurrSeasonMapID(data.m_iMapID);
         this.setFightCnt(data.m_cFightCount);
         this.setNowSeasonAwardFlag(data.m_iAwardFlag);
         this.setPreSeasonAwardFlag(data.m_iPreAwardFlag);
         this.setHistoryAllServerRankIdx(data.m_nPreCrossRank);
         this.setHistoryLocalServerRankIdx(data.m_nPreGroupRank);
         this.setHistoryUnionUserRankIdx(data.m_nPreConsortiaRank);
         this.setHistoryAllServerUnionRankIdx(data.m_cPreCrossConsRank);
         this.setHistoryLocalServerUnionRankIdx(0);
         this.setHistoryIsUnionLeader(data.m_isPreChariman == 1);
         this.setCurrentAllServerRankIdx(data.m_nCrossRank);
         this.setCurrentLocalServerRankIdx(data.m_nGroupRank);
         this.setCurrentUnionUserRankIdx(data.m_nConsortiaRank);
         this.setCurrentAllServerUnionRankIdx(data.m_cCrossConsRank);
         this.setCurrentIsUnionLeader(data.m_isChariman == 1);
         this.setCurrentLocalServerUnionRankIdx(0);
         this.setHistoryDuanweiLevel(data.m_cPreLevel);
         this.setHistoryDuanweiQualityLevel(data.m_cPreGrade);
         this.setRealTimePoint(data.m_nScore);
         this.setRealTimeDuanweiLevel(data.m_cLevel);
         this.setRealTimeDuanweiQualityLevel(data.m_cGrade);
         this.setFlag(data.m_cUpGradeFlag);
         this.setFastPKPreviewPoint(data.m_nSkipScore);
         this.setDivideAwardFlag(data.divideAwardFlag);
         this.topUserData.duanweiLevel = data.m_cTopLevel;
         this.topUserData.qualityLevel = data.m_cTopGrade;
         this.topUserData.platform = data.m_cTopPlatform;
         this.topUserData.server = data.m_nTopGroup;
         this.topUserData.uin = data.m_iTopUin;
         this.topUserData.sex = data.m_cSex;
         this.topUserData.userName = data.m_sUserName;
         this.topUserData.killBossID = data.m_cTopKillBossID;
         this.topUserData.killBossHP = data.m_iTopKillBossHP;
         var level:Object = a_2033.getInstance().getGameLevel(data.m_iTopExp);
         this.topUserData.userLevel = level.iLevel;
         this.topUserData.avatarList = data.m_arrAvatarInfo;
         this.topUserData.showAvatar = this.getSuitShowType(data.m_ishowcard);
         a_2439.getInstance().setRealTimeWorldBossDuanweiQuailty(this.getCurDuanweiQualityCfg());
         a_2439.getInstance().setWorldBossBuffId(this.buffId);
      }
      
      public function updateReadMemberItem(data:CResponseReceiveDivideAward) : void
      {
         var playerAwardInfo:CWBDividePlayerAwardInfo = null;
         var i:int = 0;
         if(this.divideMainInfo)
         {
            this.divideMainInfo.m_aryAwardInfo;
            for(i = 0; i < this.divideMainInfo.m_aryAwardInfo.length; i++)
            {
               playerAwardInfo = this.divideMainInfo.m_aryAwardInfo[i];
               if(playerAwardInfo.m_iUin == data.m_iUin)
               {
                  playerAwardInfo.m_aryAwardInfo = data.m_aryAwardInfo;
                  playerAwardInfo.m_cAwardCount = data.m_cAwardCount;
                  break;
               }
            }
            this.divideMainInfo.m_cConsAwardCount = data.m_cConsAwardCount;
            this.divideMainInfo.m_aryConsAwardInfo = data.m_aryConsAwardInfo;
         }
         this.setDivideReadMembers();
         this.setDivideGridAwardItems();
      }
      
      public function updateDivideAwardMainInfo(data:CResponseDivideAward) : void
      {
         var role:a_4463 = null;
         if(this.divideMainInfo)
         {
            this.divideMainInfo.m_cPlayerCount = data.m_cPlayerCount;
            this.divideMainInfo.m_aryAwardInfo = data.m_aryAwardInfo;
            this.divideMainInfo.m_cConsAwardCount = data.m_cConsAwardCount;
            this.divideMainInfo.m_aryConsAwardInfo = data.m_aryConsAwardInfo;
            role = a_2161.e.GetCurrentRole() as a_4463;
            this.setDivideReadMembers();
            this.setDivideGridAwardItems();
         }
      }
      
      public function setDivideAwardMainInfo(data:CResponseGetDivideMainInfo) : void
      {
         var role:a_4463 = null;
         this.divideMainInfo = data;
         if(this.divideMainInfo)
         {
            role = a_2161.e.GetCurrentRole() as a_4463;
            this.isDivideUnionLeader = data.m_iLeaderUin == role.m_iRoleUin;
            this.setDivideReadMembers();
            this.setDivideGridAwardItems();
         }
      }
      
      public function synBattleBuffID(worldBossCfg:WorldBossConf) : void
      {
         var buffId:int = 0;
         if(this.isTrainMode)
         {
            buffId = this.getBuffTrainId(worldBossCfg.id);
            a_2439.getInstance().setWorldBossBuffId(buffId);
         }
         else
         {
            a_2439.getInstance().setWorldBossBuffId(this.buffId);
         }
      }
      
      public function getIsTrainMode() : Boolean
      {
         return this.isTrainMode;
      }
      
      public function setIsTrainMode(isTrain:Boolean) : void
      {
         this.isTrainMode = isTrain;
      }
      
      public function getShopMoneyValueByType(type:int) : int
      {
         if(this.shopMoneyTypeValueDic.hasOwnProperty(type))
         {
            return this.shopMoneyTypeValueDic[type];
         }
         return 0;
      }
      
      public function getShopLocalItemUseByID(id:int) : int
      {
         var buyNum:int = 0;
         if(this.shopLocalHasBuyItemIDDic[id])
         {
            buyNum = int(this.shopLocalHasBuyItemIDDic[id]);
         }
         return buyNum;
      }
      
      public function getShopCrossUseByID(id:int) : int
      {
         var buyNum:int = 0;
         if(this.shopCrossHasBuyItemIDDic[id])
         {
            buyNum = int(this.shopCrossHasBuyItemIDDic[id]);
         }
         return buyNum;
      }
      
      public function setReasonShopData(data:Object) : void
      {
         var i:int = 0;
         this.shopMoneyTypeValueDic[SHOP_MONEY_TYPE_CHILD] = data.m_iCookieT;
         this.shopMoneyTypeValueDic[SHOP_MONEY_TYPE_DEMON_KING] = data.m_iCookieM;
         this.shopMoneyTypeValueDic[SHOP_MONEY_TYPE_BRAVE] = data.m_iCookieY;
         this.shopLocalHasBuyItemIDDic = new Dictionary(true);
         this.shopCrossHasBuyItemIDDic = new Dictionary(true);
         for(i = 0; i < data.m_aCrossItemID.length; i++)
         {
            this.shopCrossHasBuyItemIDDic[data.m_aCrossItemID[i]] = data.m_aCrossNumber[i];
         }
         for(i = 0; i < data.m_aNumber.length; i++)
         {
            this.shopLocalHasBuyItemIDDic[data.m_aItemID[i]] = data.m_aNumber[i];
         }
      }
      
      public function getSeasonShopItemsByType(type:int) : Array
      {
         var vo:WorldBossShopItemVo = null;
         var conf:WorldBossShopItemConf = null;
         var totalBuyCount:int = 0;
         var state:int = 0;
         var timeSeconds:Number = a_1767.getInstance().TimeSeconds;
         var robEndTm:int = this.getSeasonShopRobEndTime() - timeSeconds;
         var voList:Array = new Array();
         var list:Array = AnalysisWorldBossXml.GetInstance().getSeasonShopByType(type);
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         for(var i:int = 0; i < list.length; i++)
         {
            conf = list[i];
            if(conf.itemAttConf.m_iSex == 0 || conf.itemAttConf.m_iSex > 0 && conf.itemAttConf.m_iSex == role.m_iUserSex)
            {
               vo = new WorldBossShopItemVo();
               vo.buyCount = this.getShopLocalItemUseByID(conf.id);
               if(type == WorldBossModel.SHOP_SELL_TYPE1)
               {
                  totalBuyCount = this.getShopCrossUseByID(conf.id);
                  vo.leftCount = Math.max(0,conf.maxBuyCnt - totalBuyCount);
               }
               else
               {
                  vo.leftCount = Math.max(0,conf.maxBuyCnt - vo.buyCount);
               }
               vo.conf = list[i];
               if(type == WorldBossModel.SHOP_SELL_TYPE1)
               {
                  state = this.getState();
                  if(state != WorldBossModel.STATE_UN_PK || state == WorldBossModel.STATE_UN_PK && robEndTm > 0)
                  {
                     vo.state = SHOP_ITEM_UN_ACTIVE;
                  }
                  else if(vo.leftCount > 0)
                  {
                     vo.state = SHOP_ITEM_CAN_BUY;
                  }
                  else
                  {
                     vo.state = SHOP_ITEM_CAN_NOT_BUY;
                  }
               }
               else if(vo.leftCount > 0)
               {
                  vo.state = SHOP_ITEM_CAN_BUY;
               }
               else
               {
                  vo.state = SHOP_ITEM_CAN_NOT_BUY;
               }
               voList.push(vo);
            }
         }
         return voList;
      }
      
      public function getSeasonShopRule() : String
      {
         return AnalysisWorldBossXml.GetInstance().getSeasonShopRule();
      }
      
      public function getRankTimeCD(type:int) : Number
      {
         return this.rankTimeCDDic[type];
      }
      
      public function setRankTimeCD(type:int, tm:Number) : void
      {
         if(this.rankTimeCDDic[type] >= 0)
         {
            this.rankTimeCDDic[type] = tm;
         }
      }
      
      public function getFlag() : int
      {
         return this.flag;
      }
      
      public function setFlag(value:int) : void
      {
         this.flag = value;
      }
      
      public function getSeasonId() : int
      {
         return this.seasonId;
      }
      
      public function setSeasonId(value:int) : void
      {
         this.seasonId = value;
      }
      
      public function getState() : int
      {
         return this.state;
      }
      
      public function getCurrentWorldBossId() : int
      {
         return this.currentWorldBossId;
      }
      
      public function getHistoryDuanweiLevel() : int
      {
         return this.historyDuanweiLevel;
      }
      
      public function setHistoryDuanweiLevel(value:int) : void
      {
         this.historyDuanweiLevel = value;
      }
      
      public function getHistoryDuanweiQualityLevel() : int
      {
         return this.historyDuanweiQualityLevel;
      }
      
      public function setHistoryDuanweiQualityLevel(value:int) : void
      {
         this.historyDuanweiQualityLevel = value;
      }
      
      public function getRealTimeDuanweiLevel() : int
      {
         return this.realTimeDuanweiLevel;
      }
      
      public function getLastRealTimeDuanweiLevel() : int
      {
         return this.lastRealTimeDuanweiLevel;
      }
      
      public function setRealTimeDuanweiLevel(value:int) : void
      {
         this.lastRealTimeDuanweiLevel = this.realTimeDuanweiLevel;
         this.realTimeDuanweiLevel = value;
      }
      
      public function getRealTimeDuanweiQualityLevel() : int
      {
         return this.realTimeDuanweiQualityLevel;
      }
      
      public function getLastRealTimeDuanweiQualityLevel() : int
      {
         return this.lastRealTimeDuanweiQualityLevel;
      }
      
      public function setRealTimeDuanweiQualityLevel(value:int) : void
      {
         this.lastRealTimeDuanweiQualityLevel = this.realTimeDuanweiQualityLevel;
         this.realTimeDuanweiQualityLevel = value;
      }
      
      public function parseInt32To8x4Bits(value:int) : Vector.<int>
      {
         var part:int = 0;
         var result:Vector.<int> = new Vector.<int>();
         for(var i:int = 0; i < 8; i++)
         {
            part = value >> i * 4 & 0x0F;
            result.push(part);
         }
         return result;
      }
      
      public function checkCanReceiveAwardFlag() : Boolean
      {
         var i:int = 0;
         var divideFlag:int = 0;
         var canFlag:Boolean = false;
         if(this.state == WorldBossModel.STATE_UN_PK)
         {
            for(i = 0; i < this.nowSeasonAwardStatesVect.length; i++)
            {
               if(this.nowSeasonAwardStatesVect[i] == WorldBossModel.CAN_RECEIVE_AWARD)
               {
                  canFlag = true;
                  break;
               }
            }
         }
         if(!canFlag)
         {
            for(i = 0; i < this.preSeasonAwardStatesVect.length; i++)
            {
               if(this.preSeasonAwardStatesVect[i] == WorldBossModel.CAN_RECEIVE_AWARD)
               {
                  canFlag = true;
                  break;
               }
            }
         }
         if(!canFlag)
         {
            divideFlag = WorldBossModel.GetInstance().getDivideAwardFlag();
            if(divideFlag == 1)
            {
               canFlag = true;
            }
         }
         return canFlag;
      }
      
      public function getNowSeasonAwardFlag() : Vector.<int>
      {
         return this.nowSeasonAwardStatesVect;
      }
      
      public function setNowSeasonAwardFlag(value:int) : void
      {
         this.nowSeasonAwardStatesVect = this.parseInt32To8x4Bits(value);
      }
      
      public function updateNowSeasonAwardFlag(type:int, state:int) : void
      {
         this.nowSeasonAwardStatesVect[type - 1] = state;
      }
      
      public function getPreSeasonAwardFlag() : Vector.<int>
      {
         return this.preSeasonAwardStatesVect;
      }
      
      public function setPreSeasonAwardFlag(value:int) : void
      {
         this.preSeasonAwardStatesVect = this.parseInt32To8x4Bits(value);
      }
      
      public function updatePreSeasonAwardFlag(type:int, state:int) : void
      {
         this.preSeasonAwardStatesVect[type - 1] = state;
      }
      
      public function getRealTimePoint() : int
      {
         return this.realTimePoint;
      }
      
      public function getLastRealTimePoint() : int
      {
         return this.lastRealTimePoint;
      }
      
      public function setRealTimePoint(value:int) : void
      {
         this.lastRealTimePoint = this.realTimePoint;
         this.realTimePoint = value;
      }
      
      public function setCurrentWorldBossId(id:int) : void
      {
         this.currentWorldBossId = id;
      }
      
      public function getBuffId() : int
      {
         return this.buffId;
      }
      
      public function setBuffId(buffId:int) : void
      {
         this.buffId = buffId;
      }
      
      public function getBuffTrainId(bossId:String) : int
      {
         if(this.buffTrainIdDic.hasOwnProperty(bossId))
         {
            return this.buffTrainIdDic[bossId];
         }
         return 0;
      }
      
      public function setBuffTrainId(bossId:String, buffId:int) : void
      {
         this.buffTrainIdDic[bossId] = buffId;
      }
      
      public function systemMsgStateIsExpired(state:int) : Boolean
      {
         var saveTm:int = 0;
         if(this.systemMsgDic.hasOwnProperty(state))
         {
            saveTm = int(this.systemMsgDic[state]);
            if(saveTm + this.STATE_SYSTEM_MSG_CD < a_1767.getInstance().TimeSeconds)
            {
               return true;
            }
            return false;
         }
         return true;
      }
      
      public function setSystemMsgState(state:int) : void
      {
         this.systemMsgDic[state] = a_1767.getInstance().TimeSeconds;
      }
      
      public function getCurrSeasonMapID() : int
      {
         return this.currSeasonMapID;
      }
      
      public function setCurrSeasonMapID(value:int) : void
      {
         this.currSeasonMapID = value;
      }
      
      public function getFightCnt() : int
      {
         return this.fightCnt;
      }
      
      public function setFightCnt(value:int) : void
      {
         this.fightCnt = value;
      }
      
      public function getPreSeasonCfg() : WorldBossSeasonConf
      {
         return this.preSeasonCfg;
      }
      
      public function getCurrentSeasonCfg() : WorldBossSeasonConf
      {
         return this.currentSeasonCfg;
      }
      
      public function checkHasCurrentSeasonCfg() : Boolean
      {
         return this.currentSeasonCfg != null;
      }
      
      public function getCurrentAllServerRankIdx() : int
      {
         return this.currentAllServerUserRankIdx;
      }
      
      public function setCurrentAllServerRankIdx(value:int) : void
      {
         this.currentAllServerUserRankIdx = value;
      }
      
      public function getCurrentLocalServerRankIdx() : int
      {
         return this.currentLocalServerUserRankIdx;
      }
      
      public function setCurrentLocalServerRankIdx(value:int) : void
      {
         this.currentLocalServerUserRankIdx = value;
      }
      
      public function getCurrentUnionUserRankIdx() : int
      {
         return this.currentUnionUserUserRankIdx;
      }
      
      public function setCurrentUnionUserRankIdx(value:int) : void
      {
         this.currentUnionUserUserRankIdx = value;
      }
      
      public function getCurrentAllServerUnionRankIdx() : int
      {
         return this.currentAllServerUnionRankIdx;
      }
      
      public function setCurrentAllServerUnionRankIdx(value:int) : void
      {
         this.currentAllServerUnionRankIdx = value;
      }
      
      public function getCurrentLocalServerUnionRankIdx() : int
      {
         return this.currentLocalServerUnionRankIdx;
      }
      
      public function setCurrentLocalServerUnionRankIdx(value:int) : void
      {
         this.currentLocalServerUnionRankIdx = value;
      }
      
      public function getCurrentIsUnionLeader() : Boolean
      {
         return this.currentIsUnionLeader;
      }
      
      public function setCurrentIsUnionLeader(bool:Boolean) : void
      {
         this.currentIsUnionLeader = bool;
      }
      
      public function getHistoryAllServerRankIdx() : int
      {
         return this.historyAllServerUserRankIdx;
      }
      
      public function setHistoryAllServerRankIdx(value:int) : void
      {
         this.historyAllServerUserRankIdx = value;
      }
      
      public function getHistoryLocalServerRankIdx() : int
      {
         return this.historyLocalServerUserRankIdx;
      }
      
      public function setHistoryLocalServerRankIdx(value:int) : void
      {
         this.historyLocalServerUserRankIdx = value;
      }
      
      public function getHistoryUnionUserRankIdx() : int
      {
         return this.historyUnionUserUserRankIdx;
      }
      
      public function setHistoryUnionUserRankIdx(value:int) : void
      {
         this.historyUnionUserUserRankIdx = value;
      }
      
      public function getHistoryAllServerUnionRankIdx() : int
      {
         return this.historyAllServerUnionRankIdx;
      }
      
      public function setHistoryAllServerUnionRankIdx(value:int) : void
      {
         this.historyAllServerUnionRankIdx = value;
      }
      
      public function getHistoryLocalServerUnionRankIdx() : int
      {
         return this.historyLocalServerUnionRankIdx;
      }
      
      public function setHistoryLocalServerUnionRankIdx(value:int) : void
      {
         this.historyLocalServerUnionRankIdx = value;
      }
      
      public function getHistoryIsUnionLeader() : Boolean
      {
         return this.historyIsUnionLeader;
      }
      
      public function setHistoryIsUnionLeader(bool:Boolean) : void
      {
         this.historyIsUnionLeader = bool;
      }
      
      public function getAllServerFirstRoleData() : WorldBossUserData
      {
         return this.topUserData;
      }
      
      public function getDayOpenTmMsg() : String
      {
         var currentTimeSeconds:Number = a_1767.getInstance().TimeSeconds;
         var localStartDate:Date = this.getTimeAreaDate(currentTimeSeconds,this.currentSeasonCfg.dayPkStartHour,this.currentSeasonCfg.dayPkStartMinute);
         var localStartHour:String = Tool.num2str(localStartDate.hours,2);
         var localStartMinute:String = Tool.num2str(localStartDate.minutes,2);
         var localEndDate:Date = this.getTimeAreaDate(currentTimeSeconds,this.currentSeasonCfg.dayPkEndHour,this.currentSeasonCfg.dayPkEndMinute);
         var localEndHour:String = Tool.num2str(localEndDate.hours,2);
         var localEndMinute:String = Tool.num2str(localEndDate.minutes,2);
         var extMsg:String = "";
         if(localStartHour > localEndHour)
         {
            extMsg = "明日";
         }
         return "每日 " + localStartHour + ":" + localStartMinute + " - " + extMsg + " " + localEndHour + ":" + localEndMinute + " 开启";
      }
      
      private function getTimeAreaDate(currentTimeSeconds:Number, hour:int, minute:int) : Date
      {
         var offsetChina:int = -8 * 60 * 60 * 1000;
         var date:Date = new Date(currentTimeSeconds * 1000);
         date.hours = hour;
         date.minutes = minute;
         date.seconds = 0;
         date.milliseconds = 0;
         var localTm:Number = date.time + (offsetChina - date.timezoneOffset * 60 * 1000);
         return new Date(localTm);
      }
      
      public function canPK() : Boolean
      {
         var currentTimeSeconds:Number = NaN;
         var localStartDate:Date = null;
         var localStartTm:Number = NaN;
         var localEndDate:Date = null;
         var localEndTm:Number = NaN;
         var can:Boolean = false;
         if(this.state == WorldBossModel.STATE_PK && Boolean(this.currentSeasonCfg))
         {
            currentTimeSeconds = a_1767.getInstance().TimeSeconds;
            localStartDate = this.getTimeAreaDate(currentTimeSeconds,this.currentSeasonCfg.dayPkStartHour,this.currentSeasonCfg.dayPkStartMinute);
            localStartTm = localStartDate.getTime() / 1000;
            localEndDate = this.getTimeAreaDate(currentTimeSeconds,this.currentSeasonCfg.dayPkEndHour,this.currentSeasonCfg.dayPkEndMinute);
            localEndTm = localEndDate.getTime() / 1000;
            if(currentTimeSeconds >= localStartTm && currentTimeSeconds <= localEndTm)
            {
               can = true;
            }
         }
         return can;
      }
      
      public function getIsPKState() : Boolean
      {
         var startTm:Number = NaN;
         var accountStartTm:Number = NaN;
         var previewTm:int = 0;
         var pkStartTm:Number = NaN;
         var localStartDate:Date = null;
         var localStartTm:Number = NaN;
         var localEndDate:Date = null;
         var localEndTm:Number = NaN;
         var currentTimeSeconds:Number = a_1767.getInstance().TimeSeconds;
         var conf:WorldBossSeasonConf = AnalysisWorldBossXml.GetInstance().getSeasonDataByTm(currentTimeSeconds);
         if(conf != null)
         {
            startTm = conf.startTm;
            accountStartTm = conf.accountStartTm;
            previewTm = conf.previewTm;
            pkStartTm = startTm + previewTm;
            if(currentTimeSeconds > pkStartTm && currentTimeSeconds < accountStartTm)
            {
               localStartDate = this.getTimeAreaDate(currentTimeSeconds,conf.dayPkStartHour,conf.dayPkStartMinute);
               localStartTm = localStartDate.getTime() / 1000;
               localEndDate = this.getTimeAreaDate(currentTimeSeconds,conf.dayPkEndHour,conf.dayPkEndMinute);
               localEndTm = localEndDate.getTime() / 1000;
               if(currentTimeSeconds >= localStartTm && currentTimeSeconds <= localEndTm)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public function IsWaitState() : Boolean
      {
         var currentTimeSeconds:Number = NaN;
         var accountStartTm:Number = NaN;
         var endTm:Number = NaN;
         var isWaitResult:Boolean = false;
         if(this.currentSeasonCfg)
         {
            currentTimeSeconds = a_1767.getInstance().TimeSeconds;
            accountStartTm = this.currentSeasonCfg.accountStartTm;
            endTm = this.currentSeasonCfg.endTm;
            isWaitResult = currentTimeSeconds >= accountStartTm && currentTimeSeconds < endTm;
         }
         return isWaitResult;
      }
      
      public function getEndTmDes() : String
      {
         var endTm:Number = this.currentSeasonCfg.endTm * 1000;
         var date:Date = new Date(endTm);
         var month:String = date.month + 1 + "月";
         var day:String = date.date + "日";
         var hour:int = date.hours;
         var min:int = date.minutes;
         var msg:String = month + day + " " + Tool.num2str(hour,2) + ":" + Tool.num2str(min,2);
         return "最终结果将于 " + msg + " 公示";
      }
      
      public function setSeasonState() : void
      {
         var currentTimeSeconds:Number = NaN;
         var startTm:Number = NaN;
         var endTm:Number = NaN;
         var accountStartTm:Number = NaN;
         var previewTm:int = 0;
         var previewStartTm:Number = NaN;
         var dayPkStartHour:int = 0;
         var dayPkStartMin:int = 0;
         var dayEndHour:int = 0;
         var dayEndMin:int = 0;
         this.preSeasonCfg = AnalysisWorldBossXml.GetInstance().getSeasonData(this.seasonId - 1);
         this.currentSeasonCfg = AnalysisWorldBossXml.GetInstance().getSeasonData(this.seasonId);
         if(this.currentSeasonCfg)
         {
            currentTimeSeconds = a_1767.getInstance().TimeSeconds;
            startTm = this.currentSeasonCfg.startTm;
            endTm = this.currentSeasonCfg.endTm;
            accountStartTm = this.currentSeasonCfg.accountStartTm;
            previewTm = this.currentSeasonCfg.previewTm;
            previewStartTm = startTm + previewTm;
            dayPkStartHour = this.currentSeasonCfg.dayPkStartHour;
            dayPkStartMin = this.currentSeasonCfg.dayPkEndMinute;
            dayEndHour = this.currentSeasonCfg.dayPkEndHour;
            dayEndMin = this.currentSeasonCfg.dayPkEndMinute;
            if(currentTimeSeconds >= startTm && currentTimeSeconds < previewStartTm)
            {
               this.state = WorldBossModel.STATE_NEAR_TO_PK;
            }
            else if(currentTimeSeconds > previewStartTm && currentTimeSeconds < accountStartTm)
            {
               this.state = WorldBossModel.STATE_PK;
            }
            else if(currentTimeSeconds >= accountStartTm && currentTimeSeconds < endTm)
            {
               this.state = WorldBossModel.STATE_PK_WAIT_RESULT;
            }
            else
            {
               this.state = WorldBossModel.STATE_UN_PK;
            }
            this.state = this.state;
         }
         else
         {
            this.state = WorldBossModel.STATE_UN_PK;
         }
      }
      
      public function getSystemMsgByState() : Array
      {
         var sTm:String = null;
         var disTm:int = 0;
         var tm:int = 0;
         var localDate:Date = null;
         var localEndMonth:String = null;
         var localEndDate:String = null;
         var localEndHour:String = null;
         var localEndMin:String = null;
         var localEndSec:String = null;
         var msg:String = null;
         var pkStartTmMsg:String = null;
         var pkEndTmMsg:String = null;
         var localDailyStartDate:Date = null;
         var localDailyStartHour:String = null;
         var localDailyStartMinute:String = null;
         var localDailyEndDate:Date = null;
         var localDailyEndHour:String = null;
         var localDailyEndMinute:String = null;
         var extMsg:String = null;
         var dailyPkStartTmMsg:String = null;
         var dailyPkEndTmMsg:String = null;
         var robMsg:String = null;
         var systemMsg:String = "";
         var systemMsgAry:Array = new Array();
         var currentTimeSeconds:Number = a_1767.getInstance().TimeSeconds;
         var systemMsgSet:WorldBossSystemMsgConf = AnalysisWorldBossXml.GetInstance().getSystemMsgSet();
         if(this.state == WorldBossModel.STATE_NEAR_TO_PK)
         {
            tm = this.getNearToPKTime();
            localDate = new Date(tm * 1000);
            localEndMonth = Tool.num2str(localDate.month + 1,2);
            localEndDate = Tool.num2str(localDate.date,2);
            pkStartTmMsg = localEndMonth + " 月" + localEndDate + " 日 ";
            tm = this.getAccountStartTm();
            localDate = new Date((tm - 86400) * 1000);
            localEndMonth = Tool.num2str(localDate.month + 1,2);
            localEndDate = Tool.num2str(localDate.date,2);
            pkEndTmMsg = localEndMonth + " 月" + localEndDate + " 日 ";
            localDailyStartDate = this.getTimeAreaDate(currentTimeSeconds,this.currentSeasonCfg.dayPkStartHour,this.currentSeasonCfg.dayPkStartMinute);
            localDailyStartHour = Tool.num2str(localDailyStartDate.hours,2);
            localDailyStartMinute = Tool.num2str(localDailyStartDate.minutes,2);
            localDailyEndDate = this.getTimeAreaDate(currentTimeSeconds,this.currentSeasonCfg.dayPkEndHour,this.currentSeasonCfg.dayPkEndMinute);
            localDailyEndHour = Tool.num2str(localDailyEndDate.hours,2);
            localDailyEndMinute = Tool.num2str(localDailyEndDate.minutes,2);
            extMsg = "";
            if(localDailyStartHour > localDailyEndHour)
            {
               extMsg = "次日";
            }
            dailyPkStartTmMsg = localDailyStartHour + ":" + localDailyStartMinute;
            dailyPkEndTmMsg = extMsg + localDailyEndHour + ":" + localDailyEndMinute;
            systemMsgAry.push(GameStringManager.getInstance().getString(4211,[pkStartTmMsg,pkEndTmMsg,dailyPkStartTmMsg,dailyPkEndTmMsg]));
         }
         else if(this.state == WorldBossModel.STATE_PK)
         {
            localDate = this.getTimeAreaDate(currentTimeSeconds,this.currentSeasonCfg.dayPkEndHour,this.currentSeasonCfg.dayPkEndMinute);
            tm = localDate.getTime() / 1000;
            disTm = tm - currentTimeSeconds;
            if(disTm > 0 && disTm < systemMsgSet.noticeDailyPKEndTm)
            {
               localEndMonth = Tool.num2str(localDate.month + 1,2);
               localEndDate = Tool.num2str(localDate.date,2);
               localEndHour = Tool.num2str(localDate.hours,2);
               localEndMin = Tool.num2str(localDate.minutes,2);
               localEndSec = Tool.num2str(localDate.seconds,2);
               msg = localEndMonth + " 月" + localEndDate + " 日 " + localEndHour + " : " + localEndMin + " : " + localEndSec;
               systemMsgAry.push(GameStringManager.getInstance().getString(4212,[msg]));
            }
            tm = this.getAccountStartTm();
            localDate = new Date(tm * 1000);
            disTm = tm - currentTimeSeconds;
            if(disTm > 0 && disTm < systemMsgSet.noticeAccountTm)
            {
               localEndMonth = Tool.num2str(localDate.month + 1,2);
               localEndDate = Tool.num2str(localDate.date,2);
               localEndHour = Tool.num2str(localDate.hours,2);
               localEndMin = Tool.num2str(localDate.minutes,2);
               localEndSec = Tool.num2str(localDate.seconds,2);
               msg = localEndMonth + " 月" + localEndDate + " 日 " + localEndHour + " : " + localEndMin + " : " + localEndSec;
               systemMsgAry.push(GameStringManager.getInstance().getString(4213,[msg]));
            }
         }
         else if(this.state == WorldBossModel.STATE_PK_WAIT_RESULT)
         {
            tm = this.getSeasonEndTime();
            disTm = tm - currentTimeSeconds;
            localDate = new Date(tm * 1000);
            if(disTm > 0 && disTm < systemMsgSet.noticeReceiveAwardTm)
            {
               localEndMonth = Tool.num2str(localDate.month + 1,2);
               localEndDate = Tool.num2str(localDate.date,2);
               localEndHour = Tool.num2str(localDate.hours,2);
               localEndMin = Tool.num2str(localDate.minutes,2);
               localEndSec = Tool.num2str(localDate.seconds,2);
               msg = localEndMonth + " 月" + localEndDate + " 日 " + localEndHour + " : " + localEndMin + " : " + localEndSec;
               systemMsgAry.push(GameStringManager.getInstance().getString(4216,[msg]));
               tm = this.getSeasonShopRobEndTime();
               disTm = tm - currentTimeSeconds;
               localDate = new Date(tm * 1000);
               if(disTm > 0)
               {
                  localEndMonth = Tool.num2str(localDate.month + 1,2);
                  localEndDate = Tool.num2str(localDate.date,2);
                  localEndHour = Tool.num2str(localDate.hours,2);
                  localEndMin = Tool.num2str(localDate.minutes,2);
                  localEndSec = Tool.num2str(localDate.seconds,2);
                  robMsg = localEndMonth + " 月" + localEndDate + " 日 " + localEndHour + " : " + localEndMin + " : " + localEndSec;
               }
               systemMsgAry.push(GameStringManager.getInstance().getString(4215,[msg,robMsg]));
            }
         }
         else if(this.state == WorldBossModel.STATE_UN_PK)
         {
            systemMsgAry.push(GameStringManager.getInstance().getString(4214));
         }
         return systemMsgAry;
      }
      
      public function getSpeakId() : int
      {
         return this.currentSeasonCfg.speakerId;
      }
      
      public function getNearToPKTime() : Number
      {
         return this.currentSeasonCfg.startTm + this.currentSeasonCfg.previewTm;
      }
      
      public function getSeasonEndTime() : Number
      {
         return this.currentSeasonCfg.endTm;
      }
      
      public function getAccountStartTm() : Number
      {
         return this.currentSeasonCfg.accountStartTm;
      }
      
      public function getSeasonShopRobEndTime() : Number
      {
         return this.currentSeasonCfg.endTm + 15 * 60;
      }
      
      public function getWorldBossRule() : String
      {
         return AnalysisWorldBossXml.GetInstance().getWorldBossRule();
      }
      
      public function getCurDuanweiQualityCfg() : WorldBossQualityConf
      {
         return this.getDuanweiQualityCfg(this.realTimeDuanweiLevel,this.realTimeDuanweiQualityLevel);
      }
      
      public function getDuanweiQualityCfg(duanweiLevel:int, qualityLevel:int) : WorldBossQualityConf
      {
         var qualityCfg:WorldBossQualityConf = null;
         var i:int = 0;
         var cfg:WorldBossDuanweiConf = this.currentSeasonCfg.duanweiDic[duanweiLevel];
         if(Boolean(cfg) && Boolean(cfg.quality))
         {
            for(i = 0; i < cfg.quality.length; i++)
            {
               qualityCfg = cfg.quality[i];
               if(Boolean(qualityCfg) && qualityCfg.level == qualityLevel)
               {
                  return qualityCfg;
               }
            }
         }
         return null;
      }
      
      public function getDuanweiQualityName(duanweiLevel:int, qualityLevel:int) : String
      {
         var qualityCfg:WorldBossQualityConf = null;
         var i:int = 0;
         var name:String = "";
         var cfg:WorldBossDuanweiConf = this.currentSeasonCfg.duanweiDic[duanweiLevel];
         if(Boolean(cfg) && Boolean(cfg.quality))
         {
            name = cfg.name;
            for(i = 0; i < cfg.quality.length; i++)
            {
               qualityCfg = cfg.quality[i];
               if(Boolean(qualityCfg) && qualityCfg.level == qualityLevel)
               {
                  name += qualityCfg.name;
                  break;
               }
            }
         }
         return name;
      }
      
      public function setRecordData(data:Object) : void
      {
         var value:WorldBossDuanweiConf = null;
         var list:Vector.<VirtualRowData> = null;
         var m:int = 0;
         var itemData:VirtualRowData = null;
         var duanweiConf:WorldBossDuanweiConf = null;
         var recordItemVo:WorldBossRecordItemVo = null;
         var i:int = 0;
         this.maxRecordData = new WorldBossRecordVO();
         this.maxRecordData.userAllServerMaxRank = data.m_cTopCrossRank;
         this.maxRecordData.userLocalServerMaxRank = data.m_cTopGroupRank;
         this.maxRecordData.unionAllServerMaxRank = data.m_cTopCrossConsRank;
         this.maxRecordData.unionLocalServerMaxRank = data.m_cTopGroupConsRank;
         this.maxRecordData.unionName = data.m_sConsName;
         this.maxRecordData.joinSeasonCnt = data.m_iSeasonCount;
         this.maxRecordData.fightCnt = data.m_iBattleCount;
         this.maxRecordData.winCnt = data.m_iWin;
         this.maxRecordData.loseCnt = data.m_iLose;
         this.maxRecordData.killBossId = data.m_iBossID;
         this.maxRecordData.killBossHp = data.m_iBossHP;
         var idx:int = 0;
         var useCntAry:Array = data.m_aryLenvelRecord;
         var duanweiList:Array = [];
         for each(value in this.currentSeasonCfg.duanweiDic)
         {
            duanweiList.push(value);
         }
         duanweiList.sortOn("level",Array.NUMERIC);
         list = new Vector.<VirtualRowData>();
         for(i = 0; i < duanweiList.length; i++)
         {
            duanweiConf = duanweiList[i];
            recordItemVo = new WorldBossRecordItemVo();
            recordItemVo.conf = duanweiConf;
            for(m = 0; m < duanweiConf.quality.length; m++)
            {
               recordItemVo.usedCnts[m] = useCntAry[idx];
               if(useCntAry[idx] > 0)
               {
                  this.maxRecordData.maxDuanweiLevel = duanweiConf.level;
               }
               idx += 1;
            }
            itemData = new VirtualRowData();
            itemData.idx = i;
            itemData.name = duanweiConf.name;
            itemData.height = 124;
            itemData.data = recordItemVo;
            list.push(itemData);
         }
         this.maxRecordData.duanweiUseCntVects = list;
      }
      
      public function getRecordData() : WorldBossRecordVO
      {
         return this.maxRecordData;
      }
      
      public function getWorldBossDic() : Dictionary
      {
         return AnalysisWorldBossXml.GetInstance().getWorldBossDic();
      }
      
      public function getAutoScrollCD() : int
      {
         return AnalysisWorldBossXml.GetInstance().getAutoScrollCD();
      }
      
      public function getWorldBossBuff(bossId:int) : Array
      {
         return AnalysisWorldBossXml.GetInstance().getWorldBossBuff(bossId);
      }
      
      public function getPreviewWorldBossList() : Array
      {
         var worldBoss:WorldBossConf = null;
         var list:Array = [];
         var dic:Dictionary = this.getWorldBossDic();
         for each(worldBoss in dic)
         {
            if(worldBoss.previewOpen)
            {
               list.push(worldBoss);
            }
         }
         return list;
      }
      
      public function getTrainWorldBossList() : Array
      {
         var worldBoss:WorldBossConf = null;
         var list:Array = [];
         var dic:Dictionary = this.getWorldBossDic();
         for each(worldBoss in dic)
         {
            if(worldBoss.trainOpen)
            {
               list.push(worldBoss);
            }
         }
         list.sortOn("trainSort",Array.NUMERIC);
         return list;
      }
      
      public function getMoneyFrameByMoneyType(moneyType:int) : int
      {
         if(moneyType == SHOP_MONEY_TYPE_CHILD)
         {
            return 1;
         }
         if(moneyType == SHOP_MONEY_TYPE_DEMON_KING)
         {
            return 2;
         }
         if(moneyType == SHOP_MONEY_TYPE_BRAVE)
         {
            return 3;
         }
         return 0;
      }
      
      public function getAllServerSortData() : Array
      {
         return this.allServerSortList;
      }
      
      public function setAllServerSortData(data:CCSResponseGetWorldBossRank) : void
      {
         var list:Array = null;
         var len:int = 0;
         var vo:WorldBossAllServerSortVO = null;
         var itemData:CWBRankInfo = null;
         var i:int = 0;
         var level:Object = null;
         if(Boolean(data) && Boolean(data.m_astPlayerWBRank) && data.m_astPlayerWBRank.length > 0)
         {
            list = data.m_astPlayerWBRank;
            len = int(list.length);
            this.allServerSortList.length = 0;
            for(i = 0; i < len; i++)
            {
               itemData = list[i];
               vo = new WorldBossAllServerSortVO();
               vo.sortId = itemData.rank;
               vo.userId = itemData.uin;
               vo.sex = itemData.sex;
               vo.userName = itemData.name;
               vo.plat = itemData.platform;
               vo.server = itemData.group;
               vo.userDuanweiLevel = itemData.level;
               vo.userDuanweiSubLevel = itemData.grade;
               level = a_2033.getInstance().getGameLevel(itemData.exp);
               vo.userLevel = level.iLevel;
               vo.bossId = itemData.bossID;
               vo.killBossBlood = itemData.bossHP;
               vo.avatars = itemData.m_arrAvatarInfo;
               vo.showAvatar = this.getSuitShowType(itemData.m_ishowcard);
               this.allServerSortList[i] = vo;
            }
         }
      }
      
      public function getLocalServerSortData() : Array
      {
         return this.localServerSortList;
      }
      
      public function setLocalServerSortData(data:CCSResponseGetWorldBossRank) : void
      {
         var list:Array = null;
         var len:int = 0;
         var vo:WorldBossLocalServerSortVO = null;
         var itemData:CWBRankInfo = null;
         var i:int = 0;
         var level:Object = null;
         if(Boolean(data) && Boolean(data.m_astPlayerWBRank) && data.m_astPlayerWBRank.length > 0)
         {
            list = data.m_astPlayerWBRank;
            len = int(list.length);
            this.localServerSortList.length = 0;
            for(i = 0; i < len; i++)
            {
               itemData = list[i];
               vo = new WorldBossLocalServerSortVO();
               vo.sortId = itemData.rank;
               vo.userId = itemData.uin;
               vo.sex = itemData.sex;
               vo.userName = itemData.name;
               vo.plat = itemData.platform;
               vo.server = itemData.group;
               vo.userDuanweiLevel = itemData.level;
               vo.userDuanweiSubLevel = itemData.grade;
               level = a_2033.getInstance().getGameLevel(itemData.exp);
               vo.userLevel = level.iLevel;
               vo.bossId = itemData.bossID;
               vo.killBossBlood = itemData.bossHP;
               vo.avatars = itemData.m_arrAvatarInfo;
               vo.showAvatar = this.getSuitShowType(itemData.m_ishowcard);
               this.localServerSortList[i] = vo;
            }
         }
      }
      
      public function getUnionAllServerSortData() : Array
      {
         return this.unionAllServerSortList;
      }
      
      public function setUnionAllServerSortData(data:CCSResponseGetWorldBossRank) : void
      {
         var list:Array = null;
         var len:int = 0;
         var vo:WorldBossUnionSortVO = null;
         var itemData:CWBRankConsInfo = null;
         var i:int = 0;
         if(Boolean(data) && Boolean(data.m_astConsWBRank) && data.m_astConsWBRank.length > 0)
         {
            list = data.m_astConsWBRank;
            len = int(list.length);
            this.unionAllServerSortList.length = 0;
            for(i = 0; i < len; i++)
            {
               itemData = list[i];
               vo = new WorldBossUnionSortVO();
               vo.sortId = i + 1;
               vo.unionID = itemData.consID;
               vo.unionName = itemData.consName;
               vo.unionLevel = itemData.consLevel;
               vo.plat = itemData.platform;
               vo.server = itemData.groupID;
               vo.killBossBlood = itemData.sumBossHP;
               vo.leaderName = itemData.chairmanName ? itemData.chairmanName : "未知";
               vo.leaderSex = itemData.chairmanSex;
               vo.unionPoint = itemData.unionPoint;
               this.unionAllServerSortList[i] = vo;
            }
         }
      }
      
      public function getUnionLocalServerSortData() : Array
      {
         return this.unionLocalServerSortList;
      }
      
      public function setUnionLocalServerSortData(data:CCSResponseGetWorldBossRank) : void
      {
         var list:Array = null;
         var len:int = 0;
         var vo:WorldBossUnionSortVO = null;
         var itemData:CWBRankConsInfo = null;
         var i:int = 0;
         if(Boolean(data) && Boolean(data.m_astConsWBRank) && data.m_astConsWBRank.length > 0)
         {
            list = data.m_astConsWBRank;
            len = int(list.length);
            this.unionLocalServerSortList.length = 0;
            for(i = 0; i < len; i++)
            {
               itemData = list[i];
               vo = new WorldBossUnionSortVO();
               vo.sortId = i + 1;
               vo.unionID = itemData.consID;
               vo.unionName = itemData.consName;
               vo.unionLevel = itemData.consLevel;
               vo.plat = itemData.platform;
               vo.server = itemData.groupID;
               vo.killBossBlood = itemData.sumBossHP;
               vo.leaderName = itemData.chairmanName ? itemData.chairmanName : "未知";
               vo.leaderSex = itemData.chairmanSex;
               vo.unionPoint = itemData.unionPoint;
               this.unionLocalServerSortList[i] = vo;
            }
         }
      }
      
      public function getUnionUserSortData() : Array
      {
         return this.unionUserSortList;
      }
      
      public function setUnionUserSortData(data:CCSResponseGetWorldBossRank) : void
      {
         var list:Array = null;
         var len:int = 0;
         var vo:WorldBossUnionUserVO = null;
         var itemData:CWBRankInfo = null;
         var i:int = 0;
         var level:Object = null;
         if(Boolean(data) && Boolean(data.m_astPlayerWBRank) && data.m_astPlayerWBRank.length > 0)
         {
            list = data.m_astPlayerWBRank;
            len = int(list.length);
            this.unionUserSortList.length = 0;
            for(i = 0; i < len; i++)
            {
               itemData = list[i];
               vo = new WorldBossUnionUserVO();
               vo.sortId = itemData.rank;
               vo.userId = itemData.uin;
               vo.sex = itemData.sex;
               vo.userName = itemData.name;
               vo.plat = itemData.platform;
               vo.server = itemData.group;
               vo.userDuanweiLevel = itemData.level;
               vo.userDuanweiSubLevel = itemData.grade;
               level = a_2033.getInstance().getGameLevel(itemData.exp);
               vo.userLevel = level.iLevel;
               vo.bossId = itemData.bossID;
               vo.killBossBlood = itemData.bossHP;
               vo.avatars = itemData.m_arrAvatarInfo;
               vo.showAvatar = this.getSuitShowType(itemData.m_ishowcard);
               this.unionUserSortList[i] = vo;
            }
         }
      }
      
      public function checkRankAwardOpen(type:int) : Boolean
      {
         var dic:Dictionary = this.currentSeasonCfg.getRankAwardDic();
         var typeConf:WorldBossAwardTypeConf = dic[type];
         return typeConf != null;
      }
      
      public function getNowSeasonAwardPreviewVects() : Vector.<VirtualRowData>
      {
         var awardRows:int = 0;
         var key:Object = null;
         var vo:VirtualRowData = null;
         var crossItemData:WorldBossUserRankAwardConf = null;
         var copyCrossItemData:WorldBossUserRankAwardConf = null;
         var crossAwardData:AwardData = null;
         var localItemData:WorldBossUserRankAwardConf = null;
         var copyLocalItemData:WorldBossUserRankAwardConf = null;
         var localItemCnt:int = 0;
         var localAwardData:AwardData = null;
         var duanweiItemData:WorldBossDuanweiAwardConf = null;
         var duanweiQualityAwardConf:WorldBossDuanweiQualityAwardConf = null;
         var qualityAwardConf:WorldBossQualityAwardConf = null;
         var duanweiAwardData:AwardData = null;
         var unionCrossRank:WorldBossUnionRankAwardConf = null;
         var unionCrossMemberRankConf:WorldBossUnionMemberAwardConf = null;
         var leaderCrossList:Vector.<AwardData> = null;
         var unionLeaderCrossAward:AwardData = null;
         var memberCrossInUnion:WorldBossMemberInUnionRankAwardConf = null;
         var crossList:Vector.<AwardData> = null;
         var unionCrossAward:AwardData = null;
         var unionLocalRank:WorldBossUnionRankAwardConf = null;
         var unionLocalMemberRankConf:WorldBossUnionMemberAwardConf = null;
         var localLeaderList:Vector.<AwardData> = null;
         var unionLeaderLocalAward:AwardData = null;
         var memberLocalInUnion:WorldBossMemberInUnionRankAwardConf = null;
         var localList:Vector.<AwardData> = null;
         var unionLocalAward:AwardData = null;
         this.localAwardRowDic = new Dictionary(true);
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         var dic:Dictionary = this.currentSeasonCfg.getRankAwardDic();
         var list:Vector.<VirtualRowData> = new Vector.<VirtualRowData>();
         var m:int = 0;
         var i:int = 0;
         var idx:int = 0;
         var typeConf:WorldBossAwardTypeConf = dic[USER_CROSS_SERVER_AWARD];
         if(typeConf)
         {
            this.localAwardRowDic[USER_CROSS_SERVER_AWARD] = idx;
            for(key in typeConf.keyDic)
            {
               crossItemData = typeConf.keyDic[key];
               copyCrossItemData = new WorldBossUserRankAwardConf();
               copyCrossItemData.id = crossItemData.id;
               copyCrossItemData.startRank = crossItemData.startRank;
               copyCrossItemData.endRank = crossItemData.endRank;
               copyCrossItemData.name = crossItemData.name;
               copyCrossItemData.seasonId = this.seasonId;
               for(m = 0; m < crossItemData.awards.length; m++)
               {
                  crossAwardData = crossItemData.awards[m];
                  if(crossAwardData.m_iSex == 0)
                  {
                     copyCrossItemData.awards.push(crossAwardData);
                  }
                  else if(crossAwardData.m_iSex > 0 && crossAwardData.m_iSex == role.m_iUserSex)
                  {
                     copyCrossItemData.awards.push(crossAwardData);
                  }
               }
               awardRows = Math.ceil(copyCrossItemData.awards.length / 11);
               vo = new VirtualRowData();
               vo.idx = idx;
               vo.type = typeConf.id;
               vo.name = typeConf.name;
               vo.height = 113 + (awardRows - 1) * 50;
               vo.state = WorldBossModel.CANT_RECEIVE_AWARD;
               vo.data = copyCrossItemData;
               list.push(vo);
               idx += 1;
            }
         }
         typeConf = dic[USER_LOCAL_SERVER_AWARD];
         if(typeConf)
         {
            this.localAwardRowDic[USER_LOCAL_SERVER_AWARD] = idx;
            for(key in typeConf.keyDic)
            {
               localItemData = typeConf.keyDic[key];
               copyLocalItemData = new WorldBossUserRankAwardConf();
               copyLocalItemData.id = localItemData.id;
               copyLocalItemData.startRank = localItemData.startRank;
               copyLocalItemData.endRank = localItemData.endRank;
               copyLocalItemData.name = localItemData.name;
               copyLocalItemData.seasonId = this.seasonId;
               localItemCnt = 0;
               for(m = 0; m < localItemData.awards.length; m++)
               {
                  localAwardData = localItemData.awards[m];
                  if(localAwardData.m_iSex == 0)
                  {
                     copyLocalItemData.awards.push(localAwardData);
                  }
                  else if(localAwardData.m_iSex > 0 && localAwardData.m_iSex == role.m_iUserSex)
                  {
                     copyLocalItemData.awards.push(localAwardData);
                  }
               }
               awardRows = Math.ceil(copyLocalItemData.awards.length / 11);
               vo = new VirtualRowData();
               vo.idx = idx;
               vo.type = typeConf.id;
               vo.name = typeConf.name;
               vo.state = WorldBossModel.CANT_RECEIVE_AWARD;
               vo.height = 113 + (awardRows - 1) * 50;
               vo.data = copyLocalItemData;
               list.push(vo);
               idx += 1;
            }
         }
         typeConf = dic[USER_DUANWEI_AWARD];
         if(typeConf)
         {
            this.localAwardRowDic[USER_DUANWEI_AWARD] = idx;
            for(key in typeConf.keyDic)
            {
               duanweiItemData = typeConf.keyDic[key];
               for(i = 0; i < duanweiItemData.qualityConf.length; i++)
               {
                  qualityAwardConf = duanweiItemData.qualityConf[i];
                  duanweiQualityAwardConf = new WorldBossDuanweiQualityAwardConf();
                  duanweiQualityAwardConf.duanweiLevel = duanweiItemData.id;
                  duanweiQualityAwardConf.duanweiName = duanweiItemData.name;
                  duanweiQualityAwardConf.qualityLevel = qualityAwardConf.id;
                  duanweiQualityAwardConf.qualityName = qualityAwardConf.name;
                  duanweiQualityAwardConf.limitScrore = qualityAwardConf.limitScrore;
                  duanweiQualityAwardConf.seasonId = this.seasonId;
                  for(m = 0; m < qualityAwardConf.awards.length; m++)
                  {
                     duanweiAwardData = qualityAwardConf.awards[m];
                     if(duanweiAwardData.m_iSex == 0)
                     {
                        duanweiQualityAwardConf.awards.push(duanweiAwardData);
                     }
                     else if(duanweiAwardData.m_iSex > 0 && duanweiAwardData.m_iSex == role.m_iUserSex)
                     {
                        duanweiQualityAwardConf.awards.push(duanweiAwardData);
                     }
                  }
                  awardRows = Math.ceil(duanweiQualityAwardConf.awards.length / 11);
                  vo = new VirtualRowData();
                  vo.idx = idx;
                  vo.type = typeConf.id;
                  vo.name = typeConf.name;
                  vo.state = WorldBossModel.CANT_RECEIVE_AWARD;
                  vo.height = 113 + (awardRows - 1) * 50;
                  vo.data = duanweiQualityAwardConf;
                  list.push(vo);
                  idx += 1;
               }
            }
         }
         typeConf = dic[UNION_CROSS_SERVER_AWARD];
         if(typeConf)
         {
            this.localAwardRowDic[UNION_CROSS_SERVER_AWARD] = idx;
            for(key in typeConf.keyDic)
            {
               unionCrossRank = typeConf.keyDic[key];
               if(unionCrossRank.leaderAwards.length > 0)
               {
                  unionCrossMemberRankConf = new WorldBossUnionMemberAwardConf();
                  unionCrossMemberRankConf.unionStartRank = unionCrossRank.startRank;
                  unionCrossMemberRankConf.unionEndRank = unionCrossRank.endRank;
                  unionCrossMemberRankConf.unionRankName = unionCrossRank.name;
                  unionCrossMemberRankConf.seasonId = this.seasonId;
                  unionCrossMemberRankConf.isLeaderAward = true;
                  unionCrossMemberRankConf.memberStartRank = 0;
                  unionCrossMemberRankConf.memberEndRank = 0;
                  unionCrossMemberRankConf.memberRankName = "会长奖励";
                  leaderCrossList = unionCrossRank.leaderAwards;
                  for(m = 0; m < leaderCrossList.length; m++)
                  {
                     unionLeaderCrossAward = leaderCrossList[m];
                     if(unionLeaderCrossAward.m_iSex == 0)
                     {
                        unionCrossMemberRankConf.awards.push(unionLeaderCrossAward);
                     }
                     else if(unionLeaderCrossAward.m_iSex > 0 && unionLeaderCrossAward.m_iSex == role.m_iUserSex)
                     {
                        unionCrossMemberRankConf.awards.push(unionLeaderCrossAward);
                     }
                  }
                  awardRows = Math.ceil(unionCrossMemberRankConf.awards.length / 11);
                  vo = new VirtualRowData();
                  vo.idx = idx;
                  vo.type = typeConf.id;
                  vo.name = typeConf.name;
                  vo.state = WorldBossModel.CANT_RECEIVE_AWARD;
                  vo.height = 113 + (awardRows - 1) * 50;
                  vo.data = unionCrossMemberRankConf;
                  list.push(vo);
                  idx += 1;
               }
               for(i = 0; i < unionCrossRank.memberRank.length; i++)
               {
                  memberCrossInUnion = unionCrossRank.memberRank[i];
                  unionCrossMemberRankConf = new WorldBossUnionMemberAwardConf();
                  unionCrossMemberRankConf.unionStartRank = unionCrossRank.startRank;
                  unionCrossMemberRankConf.unionEndRank = unionCrossRank.endRank;
                  unionCrossMemberRankConf.unionRankName = unionCrossRank.name;
                  unionCrossMemberRankConf.seasonId = this.seasonId;
                  unionCrossMemberRankConf.memberStartRank = memberCrossInUnion.startRank;
                  unionCrossMemberRankConf.memberEndRank = memberCrossInUnion.endRank;
                  unionCrossMemberRankConf.memberRankName = memberCrossInUnion.name;
                  crossList = memberCrossInUnion.awards;
                  for(m = 0; m < crossList.length; m++)
                  {
                     unionCrossAward = crossList[m];
                     if(unionCrossAward.m_iSex == 0)
                     {
                        unionCrossMemberRankConf.awards.push(unionCrossAward);
                     }
                     else if(unionCrossAward.m_iSex > 0 && unionCrossAward.m_iSex == role.m_iUserSex)
                     {
                        unionCrossMemberRankConf.awards.push(unionCrossAward);
                     }
                  }
                  awardRows = Math.ceil(unionCrossMemberRankConf.awards.length / 11);
                  vo = new VirtualRowData();
                  vo.idx = idx;
                  vo.type = typeConf.id;
                  vo.name = typeConf.name;
                  vo.state = WorldBossModel.CANT_RECEIVE_AWARD;
                  vo.height = 113 + (awardRows - 1) * 50;
                  vo.data = unionCrossMemberRankConf;
                  list.push(vo);
                  idx += 1;
               }
            }
         }
         typeConf = dic[UNION_LOCAL_SERVER_AWARD];
         if(typeConf)
         {
            this.localAwardRowDic[UNION_LOCAL_SERVER_AWARD] = idx;
            for(key in typeConf.keyDic)
            {
               unionLocalRank = typeConf.keyDic[key];
               if(unionLocalRank.leaderAwards.length > 0)
               {
                  unionLocalMemberRankConf = new WorldBossUnionMemberAwardConf();
                  unionLocalMemberRankConf.unionStartRank = unionLocalRank.startRank;
                  unionLocalMemberRankConf.unionEndRank = unionLocalRank.endRank;
                  unionLocalMemberRankConf.unionRankName = unionLocalRank.name;
                  unionLocalMemberRankConf.seasonId = this.seasonId;
                  unionLocalMemberRankConf.isLeaderAward = true;
                  unionLocalMemberRankConf.memberStartRank = 0;
                  unionLocalMemberRankConf.memberEndRank = 0;
                  unionLocalMemberRankConf.memberRankName = "会长奖励";
                  localLeaderList = unionLocalRank.leaderAwards;
                  for(m = 0; m < localLeaderList.length; m++)
                  {
                     unionLeaderLocalAward = localLeaderList[m];
                     if(unionLeaderLocalAward.m_iSex == 0)
                     {
                        unionLocalMemberRankConf.awards.push(unionLeaderLocalAward);
                     }
                     else if(unionLeaderLocalAward.m_iSex > 0 && unionLeaderLocalAward.m_iSex == role.m_iUserSex)
                     {
                        unionLocalMemberRankConf.awards.push(unionLeaderLocalAward);
                     }
                  }
                  awardRows = Math.ceil(unionLocalMemberRankConf.awards.length / 11);
                  vo = new VirtualRowData();
                  vo.idx = idx;
                  vo.type = typeConf.id;
                  vo.name = typeConf.name;
                  vo.state = WorldBossModel.CANT_RECEIVE_AWARD;
                  vo.height = 113 + (awardRows - 1) * 50;
                  vo.data = unionLocalMemberRankConf;
                  list.push(vo);
                  idx += 1;
               }
               for(i = 0; i < unionLocalRank.memberRank.length; i++)
               {
                  memberLocalInUnion = unionLocalRank.memberRank[i];
                  unionLocalMemberRankConf = new WorldBossUnionMemberAwardConf();
                  unionLocalMemberRankConf.unionStartRank = unionLocalRank.startRank;
                  unionLocalMemberRankConf.unionEndRank = unionLocalRank.endRank;
                  unionLocalMemberRankConf.unionRankName = unionLocalRank.name;
                  unionLocalMemberRankConf.seasonId = this.seasonId;
                  unionLocalMemberRankConf.memberStartRank = memberLocalInUnion.startRank;
                  unionLocalMemberRankConf.memberEndRank = memberLocalInUnion.endRank;
                  unionLocalMemberRankConf.memberRankName = memberLocalInUnion.name;
                  localList = memberLocalInUnion.awards;
                  for(m = 0; m < localList.length; m++)
                  {
                     unionLocalAward = localList[m];
                     if(unionLocalAward.m_iSex == 0)
                     {
                        unionLocalMemberRankConf.awards.push(unionLocalAward);
                     }
                     else if(unionLocalAward.m_iSex > 0 && unionLocalAward.m_iSex == role.m_iUserSex)
                     {
                        unionLocalMemberRankConf.awards.push(unionLocalAward);
                     }
                  }
                  awardRows = Math.ceil(unionLocalMemberRankConf.awards.length / 11);
                  vo = new VirtualRowData();
                  vo.idx = idx;
                  vo.type = typeConf.id;
                  vo.name = typeConf.name;
                  vo.state = WorldBossModel.CANT_RECEIVE_AWARD;
                  vo.height = 113 + (awardRows - 1) * 50;
                  vo.data = unionLocalMemberRankConf;
                  list.push(vo);
                  idx += 1;
               }
            }
         }
         return list;
      }
      
      public function getNowSeasonAwardVects() : Vector.<VirtualRowData>
      {
         var list:Vector.<VirtualRowData> = null;
         if(this.currentSeasonCfg)
         {
            list = this.getCommonSeasonAwardList(this.seasonId,this.nowSeasonAwardStatesVect,this.currentSeasonCfg,this.currentAllServerUserRankIdx,this.currentLocalServerUserRankIdx,this.realTimeDuanweiLevel,this.realTimeDuanweiQualityLevel,this.currentAllServerUnionRankIdx,this.currentLocalServerUnionRankIdx,this.currentUnionUserUserRankIdx,this.currentIsUnionLeader);
         }
         else
         {
            list = new Vector.<VirtualRowData>();
         }
         return list;
      }
      
      public function getPreSeasonAwardVects() : Vector.<VirtualRowData>
      {
         var list:Vector.<VirtualRowData> = null;
         if(this.preSeasonCfg)
         {
            list = this.getCommonSeasonAwardList(this.seasonId - 1,this.preSeasonAwardStatesVect,this.preSeasonCfg,this.historyAllServerUserRankIdx,this.historyLocalServerUserRankIdx,this.historyDuanweiLevel,this.historyDuanweiQualityLevel,this.historyAllServerUnionRankIdx,this.historyLocalServerUnionRankIdx,this.historyUnionUserUserRankIdx,this.historyIsUnionLeader);
         }
         else
         {
            list = new Vector.<VirtualRowData>();
         }
         return list;
      }
      
      public function getCommonSeasonAwardList(seasonID:int, seasonAwardStateVect:Vector.<int>, seasonCfg:WorldBossSeasonConf, allServerUserRank:int, localServerUserRank:int, duanweiLevel:int, qualityLevel:int, allServerUnionRank:int, localServerUnionRank:int, unionMemberRank:int, isUnionLeader:Boolean) : Vector.<VirtualRowData>
      {
         var awardRows:int = 0;
         var key:Object = null;
         var vo:VirtualRowData = null;
         var m:int = 0;
         var crossState:int = 0;
         var crossItemData:WorldBossUserRankAwardConf = null;
         var copyCrossItemData:WorldBossUserRankAwardConf = null;
         var crossAwardData:AwardData = null;
         var localState:int = 0;
         var localItemData:WorldBossUserRankAwardConf = null;
         var copyLocalItemData:WorldBossUserRankAwardConf = null;
         var localAwardData:AwardData = null;
         var duanweiState:int = 0;
         var duanweiItemData:WorldBossDuanweiAwardConf = null;
         var duanweiQualityAwardConf:WorldBossDuanweiQualityAwardConf = null;
         var qualityAwardConf:WorldBossQualityAwardConf = null;
         var duanweiAwardData:AwardData = null;
         var allServerUnionState:int = 0;
         var unionCrossRank:WorldBossUnionRankAwardConf = null;
         var unionCrossMemberRankConf:WorldBossUnionMemberAwardConf = null;
         var leaderCrossList:Vector.<AwardData> = null;
         var unionLeaderCrossAward:AwardData = null;
         var memberCrossInUnion:WorldBossMemberInUnionRankAwardConf = null;
         var crossList:Vector.<AwardData> = null;
         var unionCrossAward:AwardData = null;
         var localServerUnionState:int = 0;
         var unionLocalRank:WorldBossUnionRankAwardConf = null;
         var unionLocalMemberRankConf:WorldBossUnionMemberAwardConf = null;
         var leaderLocalList:Vector.<AwardData> = null;
         var unionLeaderLocalAward:AwardData = null;
         var memberLocalInUnion:WorldBossMemberInUnionRankAwardConf = null;
         var localList:Vector.<AwardData> = null;
         var unionLocalAward:AwardData = null;
         this.localAwardRowDic = new Dictionary(true);
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         var dic:Dictionary = seasonCfg.getRankAwardDic();
         var list:Vector.<VirtualRowData> = new Vector.<VirtualRowData>();
         var i:int = 0;
         var idx:int = 0;
         var find:Boolean = false;
         var typeConf:WorldBossAwardTypeConf = dic[USER_CROSS_SERVER_AWARD];
         if(typeConf)
         {
            this.localAwardRowDic[USER_CROSS_SERVER_AWARD] = idx;
            crossState = seasonAwardStateVect[USER_CROSS_SERVER_AWARD - 1];
            for(key in typeConf.keyDic)
            {
               crossItemData = typeConf.keyDic[key];
               if(crossState > 0 && allServerUserRank >= crossItemData.startRank && allServerUserRank <= crossItemData.endRank)
               {
                  copyCrossItemData = new WorldBossUserRankAwardConf();
                  copyCrossItemData.id = crossItemData.id;
                  copyCrossItemData.startRank = crossItemData.startRank;
                  copyCrossItemData.endRank = crossItemData.endRank;
                  copyCrossItemData.name = crossItemData.name;
                  copyCrossItemData.seasonId = seasonID;
                  for(m = 0; m < crossItemData.awards.length; m++)
                  {
                     crossAwardData = crossItemData.awards[m];
                     if(crossAwardData.m_iSex == 0)
                     {
                        copyCrossItemData.awards.push(crossAwardData);
                     }
                     else if(crossAwardData.m_iSex > 0 && crossAwardData.m_iSex == role.m_iUserSex)
                     {
                        copyCrossItemData.awards.push(crossAwardData);
                     }
                  }
                  awardRows = Math.ceil(copyCrossItemData.awards.length / 11);
                  vo = new VirtualRowData();
                  vo.idx = idx;
                  vo.type = typeConf.id;
                  vo.name = typeConf.name;
                  vo.height = 113 + (awardRows - 1) * 50;
                  vo.state = crossState;
                  vo.data = copyCrossItemData;
                  list.push(vo);
                  idx += 1;
                  break;
               }
            }
         }
         typeConf = dic[USER_LOCAL_SERVER_AWARD];
         if(typeConf)
         {
            this.localAwardRowDic[USER_LOCAL_SERVER_AWARD] = idx;
            localState = seasonAwardStateVect[USER_LOCAL_SERVER_AWARD - 1];
            for(key in typeConf.keyDic)
            {
               localItemData = typeConf.keyDic[key];
               if(localState > 0 && localServerUserRank >= localItemData.startRank && localServerUserRank <= localItemData.endRank)
               {
                  copyLocalItemData = new WorldBossUserRankAwardConf();
                  copyLocalItemData.id = localItemData.id;
                  copyLocalItemData.startRank = localItemData.startRank;
                  copyLocalItemData.endRank = localItemData.endRank;
                  copyLocalItemData.name = localItemData.name;
                  copyLocalItemData.seasonId = seasonID;
                  for(m = 0; m < localItemData.awards.length; m++)
                  {
                     localAwardData = localItemData.awards[m];
                     if(localAwardData.m_iSex == 0)
                     {
                        copyLocalItemData.awards.push(localAwardData);
                     }
                     else if(localAwardData.m_iSex > 0 && localAwardData.m_iSex == role.m_iUserSex)
                     {
                        copyLocalItemData.awards.push(localAwardData);
                     }
                  }
                  awardRows = Math.ceil(copyLocalItemData.awards.length / 11);
                  vo = new VirtualRowData();
                  vo.idx = idx;
                  vo.type = typeConf.id;
                  vo.name = typeConf.name;
                  vo.state = localState;
                  vo.height = 113 + (awardRows - 1) * 50;
                  vo.data = copyLocalItemData;
                  list.push(vo);
                  idx += 1;
                  break;
               }
            }
         }
         typeConf = dic[USER_DUANWEI_AWARD];
         if(typeConf)
         {
            this.localAwardRowDic[USER_DUANWEI_AWARD] = idx;
            duanweiState = seasonAwardStateVect[USER_DUANWEI_AWARD - 1];
            var _loc52_:int = 0;
            var _loc53_:* = typeConf.keyDic;
            do
            {
               for(key in _loc53_)
               {
                  duanweiItemData = typeConf.keyDic[key];
                  i = 0;
                  while(i < duanweiItemData.qualityConf.length)
                  {
                     qualityAwardConf = duanweiItemData.qualityConf[i];
                     if(duanweiState > 0 && duanweiLevel == duanweiItemData.id && qualityLevel == qualityAwardConf.id)
                     {
                        duanweiQualityAwardConf = new WorldBossDuanweiQualityAwardConf();
                        duanweiQualityAwardConf.duanweiLevel = duanweiItemData.id;
                        duanweiQualityAwardConf.duanweiName = duanweiItemData.name;
                        duanweiQualityAwardConf.qualityLevel = qualityAwardConf.id;
                        duanweiQualityAwardConf.qualityName = qualityAwardConf.name;
                        duanweiQualityAwardConf.limitScrore = qualityAwardConf.limitScrore;
                        duanweiQualityAwardConf.seasonId = seasonID;
                        for(m = 0; m < qualityAwardConf.awards.length; m++)
                        {
                           duanweiAwardData = qualityAwardConf.awards[m];
                           if(duanweiAwardData.m_iSex == 0)
                           {
                              duanweiQualityAwardConf.awards.push(duanweiAwardData);
                           }
                           else if(duanweiAwardData.m_iSex > 0 && duanweiAwardData.m_iSex == role.m_iUserSex)
                           {
                              duanweiQualityAwardConf.awards.push(duanweiAwardData);
                           }
                        }
                        awardRows = Math.ceil(duanweiQualityAwardConf.awards.length / 11);
                        vo = new VirtualRowData();
                        vo.idx = idx;
                        vo.type = typeConf.id;
                        vo.name = typeConf.name;
                        vo.state = duanweiState;
                        vo.height = 113 + (awardRows - 1) * 50;
                        vo.data = duanweiQualityAwardConf;
                        list.push(vo);
                        idx += 1;
                        find = true;
                        break;
                     }
                     i++;
                  }
               }
               break;
            }
            while(!find);
            find = false;
         }
         typeConf = dic[UNION_CROSS_SERVER_AWARD];
         if(typeConf)
         {
            this.localAwardRowDic[UNION_CROSS_SERVER_AWARD] = idx;
            allServerUnionState = seasonAwardStateVect[UNION_CROSS_SERVER_AWARD - 1];
            _loc52_ = 0;
            _loc53_ = typeConf.keyDic;
            do
            {
               for(key in _loc53_)
               {
                  unionCrossRank = typeConf.keyDic[key];
                  if(allServerUnionState > 0 && allServerUnionRank >= unionCrossRank.startRank && allServerUnionRank <= unionCrossRank.endRank)
                  {
                     if(isUnionLeader && unionCrossRank.leaderAwards.length > 0)
                     {
                        unionCrossMemberRankConf = new WorldBossUnionMemberAwardConf();
                        unionCrossMemberRankConf.unionStartRank = unionCrossRank.startRank;
                        unionCrossMemberRankConf.unionEndRank = unionCrossRank.endRank;
                        unionCrossMemberRankConf.unionRankName = unionCrossRank.name;
                        unionCrossMemberRankConf.seasonId = seasonID;
                        unionCrossMemberRankConf.isLeaderAward = true;
                        unionCrossMemberRankConf.memberStartRank = 0;
                        unionCrossMemberRankConf.memberEndRank = 0;
                        unionCrossMemberRankConf.memberRankName = "会长奖励";
                        leaderCrossList = unionCrossRank.leaderAwards;
                        for(m = 0; m < leaderCrossList.length; m++)
                        {
                           unionLeaderCrossAward = leaderCrossList[m];
                           if(unionLeaderCrossAward.m_iSex == 0)
                           {
                              unionCrossMemberRankConf.awards.push(unionLeaderCrossAward);
                           }
                           else if(unionLeaderCrossAward.m_iSex > 0 && unionLeaderCrossAward.m_iSex == role.m_iUserSex)
                           {
                              unionCrossMemberRankConf.awards.push(unionLeaderCrossAward);
                           }
                        }
                        awardRows = Math.ceil(unionCrossMemberRankConf.awards.length / 11);
                        vo = new VirtualRowData();
                        vo.idx = idx;
                        vo.type = typeConf.id;
                        vo.name = typeConf.name;
                        vo.state = allServerUnionState;
                        vo.height = 113 + (awardRows - 1) * 50;
                        vo.data = unionCrossMemberRankConf;
                        list.push(vo);
                        idx += 1;
                     }
                     i = 0;
                     while(i < unionCrossRank.memberRank.length)
                     {
                        memberCrossInUnion = unionCrossRank.memberRank[i];
                        if(unionMemberRank >= memberCrossInUnion.startRank && unionMemberRank <= memberCrossInUnion.endRank)
                        {
                           unionCrossMemberRankConf = new WorldBossUnionMemberAwardConf();
                           unionCrossMemberRankConf.unionStartRank = unionCrossRank.startRank;
                           unionCrossMemberRankConf.unionEndRank = unionCrossRank.endRank;
                           unionCrossMemberRankConf.unionRankName = unionCrossRank.name;
                           unionCrossMemberRankConf.seasonId = seasonID;
                           unionCrossMemberRankConf.memberStartRank = memberCrossInUnion.startRank;
                           unionCrossMemberRankConf.memberEndRank = memberCrossInUnion.endRank;
                           unionCrossMemberRankConf.memberRankName = memberCrossInUnion.name;
                           crossList = memberCrossInUnion.awards;
                           for(m = 0; m < crossList.length; m++)
                           {
                              unionCrossAward = crossList[m];
                              if(unionCrossAward.m_iSex == 0)
                              {
                                 unionCrossMemberRankConf.awards.push(unionCrossAward);
                              }
                              else if(unionCrossAward.m_iSex > 0 && unionCrossAward.m_iSex == role.m_iUserSex)
                              {
                                 unionCrossMemberRankConf.awards.push(unionCrossAward);
                              }
                           }
                           awardRows = Math.ceil(unionCrossMemberRankConf.awards.length / 11);
                           vo = new VirtualRowData();
                           vo.idx = idx;
                           vo.type = typeConf.id;
                           vo.name = typeConf.name;
                           vo.state = allServerUnionState;
                           vo.height = 113 + (awardRows - 1) * 50;
                           vo.data = unionCrossMemberRankConf;
                           list.push(vo);
                           idx += 1;
                           find = true;
                           break;
                        }
                        i++;
                     }
                  }
               }
               break;
            }
            while(!find);
            find = false;
         }
         typeConf = dic[UNION_LOCAL_SERVER_AWARD];
         if(typeConf)
         {
            this.localAwardRowDic[UNION_LOCAL_SERVER_AWARD] = idx;
            localServerUnionState = seasonAwardStateVect[UNION_LOCAL_SERVER_AWARD - 1];
            _loc52_ = 0;
            _loc53_ = typeConf.keyDic;
            do
            {
               for(key in _loc53_)
               {
                  unionLocalRank = typeConf.keyDic[key];
                  if(localServerUnionState > 0 && localServerUnionRank >= unionLocalRank.startRank && localServerUnionRank <= unionLocalRank.endRank)
                  {
                     if(isUnionLeader && unionLocalRank.leaderAwards.length > 0)
                     {
                        unionLocalMemberRankConf = new WorldBossUnionMemberAwardConf();
                        unionLocalMemberRankConf.unionStartRank = unionLocalRank.startRank;
                        unionLocalMemberRankConf.unionEndRank = unionLocalRank.endRank;
                        unionLocalMemberRankConf.unionRankName = unionLocalRank.name;
                        unionLocalMemberRankConf.seasonId = seasonID;
                        unionLocalMemberRankConf.isLeaderAward = true;
                        unionLocalMemberRankConf.memberStartRank = 0;
                        unionLocalMemberRankConf.memberEndRank = 0;
                        unionLocalMemberRankConf.memberRankName = "会长奖励";
                        leaderLocalList = unionLocalRank.leaderAwards;
                        for(m = 0; m < leaderLocalList.length; m++)
                        {
                           unionLeaderLocalAward = leaderLocalList[m];
                           if(unionLeaderLocalAward.m_iSex == 0)
                           {
                              unionLocalMemberRankConf.awards.push(unionLeaderLocalAward);
                           }
                           else if(unionLeaderLocalAward.m_iSex > 0 && unionLeaderLocalAward.m_iSex == role.m_iUserSex)
                           {
                              unionLocalMemberRankConf.awards.push(unionLeaderLocalAward);
                           }
                        }
                        awardRows = Math.ceil(unionLocalMemberRankConf.awards.length / 11);
                        vo = new VirtualRowData();
                        vo.idx = idx;
                        vo.type = typeConf.id;
                        vo.name = typeConf.name;
                        vo.state = localServerUnionState;
                        vo.height = 113 + (awardRows - 1) * 50;
                        vo.data = unionLocalMemberRankConf;
                        list.push(vo);
                        idx += 1;
                     }
                     i = 0;
                     while(i < unionLocalRank.memberRank.length)
                     {
                        memberLocalInUnion = unionLocalRank.memberRank[i];
                        if(unionMemberRank >= memberLocalInUnion.startRank && unionMemberRank <= memberLocalInUnion.endRank)
                        {
                           unionLocalMemberRankConf = new WorldBossUnionMemberAwardConf();
                           unionLocalMemberRankConf.unionStartRank = unionLocalRank.startRank;
                           unionLocalMemberRankConf.unionEndRank = unionLocalRank.endRank;
                           unionLocalMemberRankConf.unionRankName = unionLocalRank.name;
                           unionLocalMemberRankConf.seasonId = seasonID;
                           unionLocalMemberRankConf.memberStartRank = memberLocalInUnion.startRank;
                           unionLocalMemberRankConf.memberEndRank = memberLocalInUnion.endRank;
                           unionLocalMemberRankConf.memberRankName = memberLocalInUnion.name;
                           localList = memberLocalInUnion.awards;
                           for(m = 0; m < localList.length; m++)
                           {
                              unionLocalAward = localList[m];
                              if(unionLocalAward.m_iSex == 0)
                              {
                                 unionLocalMemberRankConf.awards.push(unionLocalAward);
                              }
                              else if(unionLocalAward.m_iSex > 0 && unionLocalAward.m_iSex == role.m_iUserSex)
                              {
                                 unionLocalMemberRankConf.awards.push(unionLocalAward);
                              }
                           }
                           awardRows = Math.ceil(unionLocalMemberRankConf.awards.length / 11);
                           vo = new VirtualRowData();
                           vo.idx = idx;
                           vo.type = typeConf.id;
                           vo.name = typeConf.name;
                           vo.state = localServerUnionState;
                           vo.height = 113 + (awardRows - 1) * 50;
                           vo.data = unionLocalMemberRankConf;
                           list.push(vo);
                           idx += 1;
                           find = true;
                           break;
                        }
                        i++;
                     }
                  }
               }
               break;
            }
            while(!find);
            find = false;
         }
         return list;
      }
      
      public function getSuitShowType(m_byShowCard:int) : int
      {
         if(m_byShowCard & 0x40)
         {
            return 3;
         }
         if(m_byShowCard & 0x10)
         {
            return 2;
         }
         if(m_byShowCard & 4)
         {
            return 1;
         }
         return 0;
      }
      
      public function getSummaryData() : Vector.<WorldBossSummaryVO>
      {
         return this.summaryVect;
      }
      
      public function getSummaryConf() : Dictionary
      {
         return AnalysisWorldBossXml.GetInstance().getSummary();
      }
      
      public function getFastPKRule() : String
      {
         return AnalysisWorldBossXml.GetInstance().getFastPKRule();
      }
      
      public function getTransRule() : String
      {
         return AnalysisWorldBossXml.GetInstance().getTransRuleDes();
      }
      
      public function getTransBuffList(bossId:int) : Array
      {
         var dic:Dictionary = this.getWorldBossDic();
         if(Boolean(dic) && Boolean(dic[bossId]))
         {
            return dic[bossId];
         }
         return [];
      }
      
      public function getFastPKPreviewPoint() : int
      {
         return this.fastPKPointOne;
      }
      
      public function setFastPKPreviewPoint(value:int) : void
      {
         this.fastPKPointOne = value;
      }
      
      public function getFastPKAwardData() : CResponseMsgWorldBossSkip
      {
         return this.fastPKAwardData;
      }
      
      public function setFastPKAwardData(data:CResponseMsgWorldBossSkip) : void
      {
         this.fastPKAwardData = data;
      }
      
      public function getFastPKCostItemID() : int
      {
         return AnalysisWorldBossXml.GetInstance().getFastPKCostItemID();
      }
      
      public function getFastPKAnimationPlayTm() : int
      {
         return AnalysisWorldBossXml.GetInstance().getFastPKAnimationPlayTm();
      }
      
      private function getWBSummary(seasonId:int, summaryList:Array) : CWBSummary
      {
         var wbSummary:CWBSummary = null;
         for(var i:int = 0; i < summaryList.length; i++)
         {
            wbSummary = summaryList[i];
            if(wbSummary.m_nSeasonID == seasonId)
            {
               return wbSummary;
            }
         }
         return null;
      }
      
      public function setSummaryData(data:CResponseGetWorldBossSummary) : void
      {
         var vo:WorldBossSummaryVO = null;
         var wbSummary:CWBSummary = null;
         var id:int = 0;
         var eventList:Array = null;
         var itemData:WorldBossSummaryEventVO = null;
         var strTime:Date = null;
         var timeStr:String = null;
         var duanweiQualityName:String = null;
         this.summaryVect.length = 0;
         var summaryDesDic:Dictionary = this.getSummaryConf();
         var startSeasonId:int = Math.max(2,this.seasonId - 4);
         var endSeasonId:int = this.seasonId;
         for(var i:int = startSeasonId; i <= endSeasonId; i++)
         {
            wbSummary = this.getWBSummary(i,data.m_aryWBSummary);
            vo = new WorldBossSummaryVO();
            if(wbSummary != null)
            {
               vo.seasonId = wbSummary.m_nSeasonID;
               vo.totalCnt = wbSummary.m_iBattleCount;
               vo.allServerRank = wbSummary.m_cCrossRank;
               vo.localServerRank = wbSummary.m_cGroupRank;
               vo.inUnionRank = wbSummary.m_cConsRank;
               vo.killBossTm = wbSummary.m_iRecordTime;
               vo.killBlood = wbSummary.m_iBossHP;
               vo.duanweiLevel = wbSummary.m_cLevel;
               vo.qualityLevel = wbSummary.m_cgrade;
               vo.duanweiLevelChange = wbSummary.m_cLevelChange;
            }
            else
            {
               vo.seasonId = i;
               vo.totalCnt = 0;
               vo.allServerRank = 0;
               vo.localServerRank = 0;
               vo.inUnionRank = 0;
               vo.killBossTm = 0;
               vo.killBlood = 0;
               vo.duanweiLevel = 0;
               vo.qualityLevel = 0;
               vo.duanweiLevelChange = 0;
            }
            vo.seasonName = "S-" + (vo.seasonId - 1) + "赛季";
            if(vo.totalCnt <= 0 && vo.killBlood <= 0 && vo.duanweiLevel <= 0 && vo.allServerRank <= 0 && vo.localServerRank <= 0 && vo.inUnionRank <= 0)
            {
               vo.hasData = false;
               this.summaryVect[i - startSeasonId] = vo;
            }
            else
            {
               vo.hasData = true;
               id = 1;
               eventList = summaryDesDic[1];
               if(vo.totalCnt > 0)
               {
                  itemData = new WorldBossSummaryEventVO();
                  itemData.id = id;
                  itemData.a_4730 = GameStringManager.getInstance().replaceString(eventList[0],[vo.totalCnt]);
                  vo.eventList.push(itemData);
                  id += 1;
               }
               if(vo.killBlood > 0)
               {
                  eventList = summaryDesDic[2];
                  itemData = new WorldBossSummaryEventVO();
                  itemData.id = id;
                  strTime = new Date(Number(vo.killBossTm * 1000));
                  timeStr = String(strTime.fullYear) + GameStringManager.getInstance().getString(131842) + String(strTime.month + 1) + GameStringManager.getInstance().getString(131841) + String(strTime.date) + GameStringManager.getInstance().getString(131840) + " " + String(strTime.hours) + GameStringManager.getInstance().getString(131843) + String(strTime.minutes) + GameStringManager.getInstance().getString(131844) + String(strTime.seconds) + GameStringManager.getInstance().getString(131845);
                  itemData.a_4730 = GameStringManager.getInstance().replaceString(eventList[0],[timeStr,vo.killBlood]);
                  vo.eventList.push(itemData);
                  id += 1;
               }
               eventList = summaryDesDic[3];
               if(vo.allServerRank >= WorldBossModel.MIN_IN_RANK && vo.allServerRank <= WorldBossModel.MAX_IN_RANK)
               {
                  itemData = new WorldBossSummaryEventVO();
                  itemData.id = id;
                  itemData.a_4730 = GameStringManager.getInstance().replaceString(eventList[0],[vo.allServerRank]);
                  vo.eventList.push(itemData);
               }
               else if(vo.localServerRank >= WorldBossModel.MIN_IN_RANK && vo.localServerRank <= WorldBossModel.MAX_IN_RANK)
               {
                  itemData = new WorldBossSummaryEventVO();
                  itemData.id = id;
                  itemData.a_4730 = GameStringManager.getInstance().replaceString(eventList[1],[vo.localServerRank]);
                  vo.eventList.push(itemData);
               }
               else if(vo.inUnionRank >= WorldBossModel.MIN_IN_RANK)
               {
                  itemData = new WorldBossSummaryEventVO();
                  itemData.id = id;
                  itemData.a_4730 = GameStringManager.getInstance().replaceString(eventList[2],[vo.inUnionRank]);
                  vo.eventList.push(itemData);
               }
               else
               {
                  itemData = new WorldBossSummaryEventVO();
                  itemData.id = id;
                  itemData.a_4730 = GameStringManager.getInstance().replaceString(eventList[3]);
                  vo.eventList.push(itemData);
               }
               id += 1;
               if(vo.duanweiLevel > 0 && vo.qualityLevel > 0)
               {
                  duanweiQualityName = this.getDuanweiQualityName(vo.duanweiLevel,vo.qualityLevel);
                  eventList = summaryDesDic[4];
                  if(vo.duanweiLevelChange > 0)
                  {
                     itemData = new WorldBossSummaryEventVO();
                     itemData.id = id;
                     itemData.a_4730 = GameStringManager.getInstance().replaceString(eventList[0],[vo.duanweiLevelChange,duanweiQualityName]);
                     vo.eventList.push(itemData);
                  }
                  else if(vo.duanweiLevelChange < 0)
                  {
                     itemData = new WorldBossSummaryEventVO();
                     itemData.id = id;
                     itemData.a_4730 = GameStringManager.getInstance().replaceString(eventList[1],[-vo.duanweiLevelChange,duanweiQualityName]);
                     vo.eventList.push(itemData);
                  }
                  else
                  {
                     itemData = new WorldBossSummaryEventVO();
                     itemData.id = id;
                     itemData.a_4730 = GameStringManager.getInstance().replaceString(eventList[2],[duanweiQualityName]);
                     vo.eventList.push(itemData);
                  }
                  this.summaryVect[i - startSeasonId] = vo;
               }
            }
         }
      }
      
      public function getFastPKAwardPreviewConfig() : Array
      {
         return AnalysisWorldBossXml.GetInstance().getFastPKAwardPreview();
      }
      
      public function getFastPKAwardPreviewVects() : Vector.<VirtualRowData>
      {
         var list:Vector.<VirtualRowData> = new Vector.<VirtualRowData>();
         var awardList:Array = AnalysisWorldBossXml.GetInstance().getFastPKAwardPreview();
         var awardVect:Vector.<AwardData> = new Vector.<AwardData>();
         for(var i:int = 0; i < awardList.length; i++)
         {
            awardVect[i] = awardList[i];
         }
         var awardRows:int = Math.ceil(awardVect.length / 6);
         var vo:VirtualRowData = new VirtualRowData();
         vo.idx = 1;
         vo.type = 0;
         vo.name = "";
         vo.state = 0;
         vo.height = 52 * awardRows;
         vo.data = awardVect;
         list.push(vo);
         return list;
      }
      
      public function setLocalShareDataAutoOpenSummary(value:int) : void
      {
         if(this.localSharedData)
         {
            this.localSharedData.autoOpenSummary = value;
         }
      }
      
      public function checkLocalShareDataSelected() : Boolean
      {
         if(Boolean(this.localSharedData) && this.localSharedData.autoOpenSummary == 1)
         {
            return true;
         }
         return false;
      }
      
      public function readLocalShareObject() : Object
      {
         if(!this.localData)
         {
            this.localData = new LocalData();
         }
         this.localSharedData = this.localData.read(this.LOCAL_SHARE_DATA_KEY,"/");
         if(isNaN(this.localSharedData.autoOpenSummary))
         {
            this.localSharedData.autoOpenSummary = 0;
         }
         else
         {
            this.localSharedDataInitAutoOpenSummary = this.localSharedData.autoOpenSummary;
         }
         return this.localSharedData;
      }
      
      public function writeAndSaveLocalShareObject() : void
      {
         if(Boolean(this.localData) && Boolean(this.localSharedData))
         {
            if(this.localSharedDataInitAutoOpenSummary != this.localSharedData.autoOpenSummary)
            {
               this.localSharedDataInitAutoOpenSummary = this.localSharedData.autoOpenSummary;
               this.localData.writeAndSave(this.localSharedData,this.LOCAL_SHARE_DATA_KEY,"/");
            }
         }
      }
      
      public function setDivideGridAwardItems() : void
      {
         var divideAward:CWBDivideAward = null;
         var cardAttr:a_3228 = null;
         var gridData:VirtualGridData = null;
         var gridLen:int = 0;
         var i:int = 0;
         this.divideGridAwardList = new Vector.<VirtualGridData>();
         if(this.divideMainInfo)
         {
            gridLen = Math.max(this.divideMainInfo.m_cConsAwardCount,40);
            for(i = 0; i < gridLen; i++)
            {
               divideAward = this.divideMainInfo.m_aryConsAwardInfo[i];
               gridData = new VirtualGridData();
               gridData.idx = i;
               gridData.name = "grid_" + i;
               gridData.gridBgId = 3;
               if(i < this.divideMainInfo.m_cConsAwardCount)
               {
                  cardAttr = new a_3228();
                  cardAttr.CardPositionID = i;
                  cardAttr.CardID = divideAward.m_iID;
                  cardAttr.CardCount = divideAward.m_nCount;
                  cardAttr.UseNumber = "";
                  gridData.data = cardAttr;
               }
               else
               {
                  gridData.data = null;
               }
               this.divideGridAwardList.push(gridData);
            }
         }
      }
      
      public function setDivideAwardFlag(value:int) : void
      {
         this.divideAwardFlag = value;
      }
      
      public function getDivideAwardFlag() : int
      {
         return this.divideAwardFlag;
      }
      
      public function setDivideUnionLeader(value:Boolean) : void
      {
         this.isDivideUnionLeader = value;
      }
      
      public function getDivideUnionLeader() : Boolean
      {
         return this.isDivideUnionLeader;
      }
      
      public function getDivideUnionLeaderId() : int
      {
         if(this.divideMainInfo)
         {
            return this.divideMainInfo.m_iLeaderUin;
         }
         return -1;
      }
      
      public function setDivideEditor(value:Boolean) : void
      {
         this.divideEditor = value;
         this.divideEditorState = 0;
      }
      
      public function canDvideEditor() : Boolean
      {
         return this.divideEditor;
      }
      
      public function setDivideEditorState(state:int) : void
      {
         this.divideEditorState = state;
      }
      
      public function getDivideEditorState() : int
      {
         return this.divideEditorState;
      }
      
      public function addMemberDivideAwardCnt(idx:int, addCnt:int) : void
      {
         var gridItemData:GridItemData = null;
         var row:int = 0;
         var virtualRowData:VirtualRowData = this.getDivideEditorMemberByIdx(idx);
         var memberVo:WorldBossLevelDivideMemberVO = virtualRowData.data as WorldBossLevelDivideMemberVO;
         for(var i:int = 0; i < addCnt; i++)
         {
            gridItemData = new GridItemData();
            gridItemData.idx = i + 8;
            gridItemData.data = null;
            gridItemData.gridBgId = virtualRowData.type == 0 ? 6 : 7;
            memberVo.cards.push(gridItemData);
         }
         if(memberVo.cards.length <= 8)
         {
            virtualRowData.height = 56;
         }
         else
         {
            row = (memberVo.cards.length - 8) / 12;
            if((memberVo.cards.length - 8) % 12 > 0)
            {
               row += 1;
            }
            virtualRowData.height = 56 + 50 * row;
         }
      }
      
      public function getDivideGridAwardItems() : Vector.<VirtualGridData>
      {
         if(this.divideGridAwardList.length == 0)
         {
            this.setDivideGridAwardItems();
         }
         return this.divideGridAwardList;
      }
      
      public function delDivideGridAwardItem(gridIdx:int, removeCount:int) : Object
      {
         var cardId:int = 0;
         var cardAttr:a_3228 = null;
         var virtualGridData:VirtualGridData = null;
         var delCnt:int = 0;
         for(var i:int = 0; i < this.divideGridAwardList.length; i++)
         {
            virtualGridData = this.divideGridAwardList[i];
            if(virtualGridData.idx == gridIdx && Boolean(virtualGridData.data))
            {
               cardAttr = virtualGridData.data as a_3228;
               cardId = cardAttr.CardID;
               if(cardAttr.CardCount > removeCount)
               {
                  delCnt = removeCount;
                  cardAttr.CardCount -= removeCount;
               }
               else
               {
                  delCnt = cardAttr.CardCount;
                  cardAttr.CardCount = 0;
                  virtualGridData.data = null;
               }
               break;
            }
         }
         return {
            "cardID":cardId,
            "cardCount":delCnt
         };
      }
      
      public function addDivideGridAwardItem(cardID:int, cardCount:int) : void
      {
         var cardAttr:a_3228 = null;
         var virtualGridData:VirtualGridData = null;
         var gridData:VirtualGridData = null;
         var find:int = -1;
         var emptyFirstIdx:int = -1;
         for(var i:int = 0; i < this.divideGridAwardList.length; i++)
         {
            virtualGridData = this.divideGridAwardList[i];
            if(virtualGridData.data)
            {
               if(!((cardID & 0xFF000000) == 335544320 || (cardID & 0xFF000000) == 285212672))
               {
                  cardAttr = virtualGridData.data as a_3228;
                  if(cardAttr.CardID == cardID)
                  {
                     find = i;
                     break;
                  }
               }
            }
            else if(emptyFirstIdx == -1)
            {
               emptyFirstIdx = i;
            }
         }
         if(find == -1 && emptyFirstIdx == -1)
         {
            gridData = new VirtualGridData();
            gridData.idx = this.divideGridAwardList.length;
            gridData.name = "grid_" + gridData.idx;
            gridData.gridBgId = 3;
            cardAttr = new a_3228();
            cardAttr.CardID = cardID;
            cardAttr.CardCount = cardCount;
            cardAttr.CardPositionID = gridData.idx;
            cardAttr.UseNumber = "";
            gridData.data = cardAttr;
            this.divideGridAwardList.push(gridData);
         }
         else if(find != -1)
         {
            gridData = this.divideGridAwardList[find];
            (gridData.data as a_3228).CardCount += cardCount;
         }
         else if(emptyFirstIdx != -1)
         {
            gridData = this.divideGridAwardList[emptyFirstIdx];
            gridData.data = new a_3228();
            cardAttr = new a_3228();
            cardAttr.CardID = cardID;
            cardAttr.CardCount = cardCount;
            cardAttr.CardPositionID = gridData.idx;
            cardAttr.UseNumber = "";
            gridData.data = cardAttr;
         }
      }
      
      public function checkCanReceiveDivideAward() : Boolean
      {
         var rowData:VirtualRowData = null;
         var memberVO:WorldBossLevelDivideMemberVO = null;
         var gridItemData:GridItemData = null;
         var i:int = 0;
         if(Boolean(this.divideReadMemberList) && this.divideReadMemberList.length > 0)
         {
            rowData = this.divideReadMemberList[0];
            memberVO = rowData.data as WorldBossLevelDivideMemberVO;
            if(Boolean(memberVO) && Boolean(memberVO.cards) && memberVO.cards.length > 0)
            {
               for(i = 0; i < memberVO.cards.length; i++)
               {
                  gridItemData = memberVO.cards[i];
                  if(gridItemData.state == 0)
                  {
                     return true;
                  }
               }
            }
         }
         return false;
      }
      
      public function getCanReceiveDivideAwardList() : Array
      {
         var rowData:VirtualRowData = null;
         var memberVO:WorldBossLevelDivideMemberVO = null;
         var cardAttr:a_3228 = null;
         var gridItemData:GridItemData = null;
         var i:int = 0;
         var obj:Object = null;
         var ary:Array = [];
         if(Boolean(this.divideReadMemberList) && this.divideReadMemberList.length > 0)
         {
            rowData = this.divideReadMemberList[0];
            memberVO = rowData.data as WorldBossLevelDivideMemberVO;
            if(Boolean(memberVO) && Boolean(memberVO.cards) && memberVO.cards.length > 0)
            {
               for(i = 0; i < memberVO.cards.length; i++)
               {
                  gridItemData = memberVO.cards[i];
                  if(Boolean(gridItemData) && gridItemData.state == 0)
                  {
                     cardAttr = gridItemData.data as a_3228;
                     obj = new Object();
                     obj.m_iItemID = cardAttr.CardID;
                     obj.m_iNum = cardAttr.CardCount;
                     ary.push(obj);
                  }
               }
            }
         }
         return ary;
      }
      
      public function setDivideReadMembers() : void
      {
         var i:int = 0;
         var isFirst:Boolean = false;
         var rowData:VirtualRowData = null;
         var memberVo:WorldBossLevelDivideMemberVO = null;
         var memberData:CWBDividePlayerAwardInfo = null;
         var cnt:int = 0;
         var gridItemData:GridItemData = null;
         var cardAttr:a_3228 = null;
         var row:int = 0;
         var realCnt:int = 0;
         var cwbAwardList:Array = null;
         var m:int = 0;
         var cwbAward:CWBDividePlayerAward = null;
         var list:Vector.<VirtualRowData> = new Vector.<VirtualRowData>();
         if(this.divideMainInfo)
         {
            for(i = 0; i < this.divideMainInfo.m_cPlayerCount; i++)
            {
               memberData = this.divideMainInfo.m_aryAwardInfo[i];
               isFirst = i == 0 ? true : false;
               rowData = new VirtualRowData();
               rowData.idx = i;
               rowData.type = isFirst ? 0 : 1;
               rowData.state = isFirst ? 1 : 0;
               rowData.editor = false;
               memberVo = new WorldBossLevelDivideMemberVO();
               memberVo.roleId = memberData.m_iUin;
               memberVo.roleName = memberData.m_sName;
               memberVo.roleSex = memberData.m_cSex;
               memberVo.roleRank = memberData.m_cRank;
               memberVo.isLeader = memberData.m_iUin == this.divideMainInfo.m_iLeaderUin;
               cnt = memberData.m_cAwardCount;
               realCnt = 8;
               if(cnt > 8)
               {
                  row = (cnt - 8) / 12;
                  if((cnt - 8) % 12 > 0)
                  {
                     row += 1;
                  }
                  realCnt = 8 + 12 * row;
               }
               cwbAwardList = memberData.m_aryAwardInfo;
               for(m = 0; m < realCnt; m++)
               {
                  gridItemData = new GridItemData();
                  gridItemData.idx = m;
                  if(m < cnt)
                  {
                     cwbAward = memberData.m_aryAwardInfo[m];
                     cardAttr = new a_3228();
                     cardAttr.CardID = cwbAward.m_iID;
                     cardAttr.CardCount = cwbAward.m_nCount;
                     gridItemData.state = isFirst ? cwbAward.m_cFlag : 0;
                     gridItemData.data = cardAttr;
                  }
                  else
                  {
                     gridItemData.data = null;
                  }
                  gridItemData.gridBgId = rowData.type == 0 ? 4 : 5;
                  memberVo.cards.push(gridItemData);
               }
               if(memberVo.cards.length <= 8)
               {
                  rowData.height = 56;
               }
               else
               {
                  row = (memberVo.cards.length - 8) / 12;
                  if((memberVo.cards.length - 8) % 12 > 0)
                  {
                     row += 1;
                  }
                  rowData.height = 56 + 50 * row;
               }
               rowData.data = memberVo;
               list.push(rowData);
            }
         }
         this.divideReadMemberList = list;
      }
      
      public function cancelDivide() : void
      {
         var rowData:VirtualRowData = null;
         var memberVo:WorldBossLevelDivideMemberVO = null;
         var gridItemData:GridItemData = null;
         var cardAttr:a_3228 = null;
         var j:int = 0;
         for(var i:int = 0; i < this.divideEditorMemberList.length; i++)
         {
            rowData = this.divideEditorMemberList[i];
            memberVo = rowData.data as WorldBossLevelDivideMemberVO;
            for(j = 0; j < memberVo.cards.length; j++)
            {
               gridItemData = memberVo.cards[j];
               if(Boolean(gridItemData) && Boolean(gridItemData.data))
               {
                  cardAttr = gridItemData.data as a_3228;
                  if(cardAttr)
                  {
                     this.addDivideGridAwardItem(cardAttr.CardID,cardAttr.CardCount);
                  }
               }
            }
         }
      }
      
      public function checkIsEmptyInEditorMember() : Boolean
      {
         var rowData:VirtualRowData = null;
         var memberVo:WorldBossLevelDivideMemberVO = null;
         var gridItemData:GridItemData = null;
         var cardAttr:a_3228 = null;
         var j:int = 0;
         loop0:
         for(var i:int = 0; i < this.divideEditorMemberList.length; )
         {
            rowData = this.divideEditorMemberList[i];
            memberVo = rowData.data as WorldBossLevelDivideMemberVO;
            j = 0;
            while(true)
            {
               if(j >= memberVo.cards.length)
               {
                  i++;
                  continue loop0;
               }
               gridItemData = memberVo.cards[j];
               if(Boolean(gridItemData) && Boolean(gridItemData.data))
               {
                  break;
               }
               j++;
            }
            return false;
         }
         return true;
      }
      
      public function createNewDivideEditorMembers() : Vector.<VirtualRowData>
      {
         var list:Vector.<VirtualRowData> = null;
         var i:int = 0;
         var isFirst:Boolean = false;
         var rowData:VirtualRowData = null;
         var memberVo:WorldBossLevelDivideMemberVO = null;
         var memberData:CWBDividePlayerAwardInfo = null;
         var gridItemData:GridItemData = null;
         var cardAttr:a_3228 = null;
         var row:int = 0;
         var m:int = 0;
         list = new Vector.<VirtualRowData>();
         if(this.divideMainInfo)
         {
            isFirst = false;
            for(i = 0; i < this.divideMainInfo.m_cPlayerCount; i++)
            {
               memberData = this.divideMainInfo.m_aryAwardInfo[i];
               isFirst = i == 0 ? true : false;
               rowData = new VirtualRowData();
               rowData.idx = i;
               rowData.type = isFirst ? 0 : 1;
               rowData.state = isFirst ? 1 : 0;
               rowData.editor = true;
               memberVo = new WorldBossLevelDivideMemberVO();
               memberVo.roleId = memberData.m_iUin;
               memberVo.roleName = memberData.m_sName;
               memberVo.roleSex = memberData.m_cSex;
               memberVo.roleRank = memberData.m_cRank;
               memberVo.isLeader = memberData.m_iUin == this.divideMainInfo.m_iLeaderUin;
               for(m = 0; m < 8; m++)
               {
                  gridItemData = new GridItemData();
                  gridItemData.idx = m;
                  gridItemData.data = null;
                  gridItemData.gridBgId = rowData.type == 0 ? 6 : 7;
                  memberVo.cards.push(gridItemData);
               }
               rowData.height = 56;
               rowData.data = memberVo;
               list.push(rowData);
            }
         }
         this.divideEditorMemberList = list;
         return this.divideEditorMemberList;
      }
      
      public function getDivideReadMember() : Vector.<VirtualRowData>
      {
         if(this.divideReadMemberList.length == 0)
         {
            this.setDivideReadMembers();
         }
         return this.divideReadMemberList;
      }
      
      public function getDivideEditorMembers() : Vector.<VirtualRowData>
      {
         return this.divideEditorMemberList;
      }
      
      public function getDivideEditorMemberByIdx(idx:int) : VirtualRowData
      {
         if(idx < this.divideEditorMemberList.length)
         {
            return this.divideEditorMemberList[idx];
         }
         return null;
      }
      
      public function updateDivideEditorMember(idx:int) : void
      {
         var rowData:VirtualRowData = null;
         var i:int = 0;
         for(i = 0; i < this.divideEditorMemberList.length; i++)
         {
            rowData = this.divideEditorMemberList[i];
            if(idx == i)
            {
               rowData.state = 1;
            }
            else
            {
               rowData.state = 0;
            }
         }
      }
      
      public function setLastShopBuyStartTm(tm:Number) : void
      {
         this.lastShopBuyStartTm = tm;
      }
      
      public function getLastShopBuyStartTm() : Number
      {
         return this.lastShopBuyStartTm;
      }
      
      public function setShowRobBuyTmLock(show:Boolean) : void
      {
         this.showRobBuyTmLock = show;
      }
      
      public function getShowRobBuyTmLock() : Boolean
      {
         return this.showRobBuyTmLock;
      }
      
      private function getTimeFormat(tm:int, showType:int) : String
      {
         var second:int = 0;
         var minutes:int = 0;
         var hour:int = 0;
         var day:int = 0;
         var msg:String = null;
         var sDay:String = null;
         var sHour:String = null;
         var sMinutes:String = null;
         var sSecond:String = null;
         if(tm > 0)
         {
            second = tm % 60;
            minutes = tm / 60 % 60;
            hour = tm / 3600 % 24;
            day = tm / 3600 / 24;
            sDay = Tool.num2str(day,2);
            sHour = Tool.num2str(hour,2);
            sMinutes = Tool.num2str(minutes,2);
            sSecond = Tool.num2str(second,2);
            if(showType == 1)
            {
               msg = sHour + " 时" + sMinutes + " 分" + sSecond + " 秒";
            }
            else
            {
               msg = sDay + " 天" + sHour + " 时" + sMinutes + " 分" + sSecond + " 秒";
            }
         }
         return msg;
      }
   }
}

