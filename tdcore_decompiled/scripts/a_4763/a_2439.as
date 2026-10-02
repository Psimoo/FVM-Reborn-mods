package a_4763
{
   import a_4716.EnmPlatform;
   import a_4716.EnmPlayerDataType;
   import a_4716.EnmRoomEventID;
   import a_4716.a_1730;
   import a_4720.a_1748;
   import a_4720.a_1750;
   import a_4720.a_1755;
   import a_4720.a_1756;
   import a_4723.a_1767;
   import a_4728.a_1778;
   import a_4729.EventType;
   import a_4729.a_1789;
   import a_4752.a_2027;
   import a_4752.a_2033;
   import a_4752.a_2037;
   import a_4752.a_2048;
   import a_4754.a_1825;
   import a_4754.a_2150;
   import a_4754.a_2161;
   import a_4764.a_2307;
   import a_4781.Tool;
   import a_4789.a_4657;
   import com.aurora.protocol.friend.a_2672;
   import com.aurora.protocol.hallserver.CHeroItem;
   import com.aurora.protocol.hallserver.CPlayerDataPair;
   import com.aurora.protocol.hallserver.CResponseBuyClimbTowerCount;
   import com.aurora.protocol.hallserver.CResponseGetPlayerRechargeActivityInfo;
   import com.aurora.protocol.hallserver.CUpdateHeroInfoRes;
   import com.aurora.protocol.hallserver.Message.stroeBox.CResponseGetStroeBoxInfo;
   import com.aurora.protocol.hallserver.a_2737;
   import com.aurora.protocol.hallserver.a_2745;
   import com.aurora.protocol.hallserver.a_2751;
   import com.aurora.protocol.hallserver.a_2755;
   import com.aurora.protocol.hallserver.a_2756;
   import com.aurora.protocol.hallserver.a_2855;
   import com.aurora.protocol.hallserver.marriage.CResponsePlayerMarriageInfo;
   import com.aurora.protocol.logicserver.CCardExtraAttr;
   import com.aurora.protocol.logicserver.CTableInfo;
   import com.aurora.protocol.logicserver.CUpdateSkillPoint;
   import com.aurora.protocol.logicserver.a_2897;
   import com.aurora.protocol.logicserver.a_2898;
   import com.aurora.protocol.logicserver.a_2909;
   import com.aurora.protocol.logicserver.a_2943;
   import com.aurora.ui.maogoutd.component.a_3228;
   import com.aurora.ui.maogoutd.pag.StorageRoom.StorageBagConfig;
   import com.aurora.ui.maogoutd.pag.StorageRoom.StroeBoxRes;
   import com.aurora.ui.maogoutd.role.a_4461;
   import com.aurora.ui.maogoutd.role.a_4463;
   import com.aurora.ui.maogoutd.task.a_4517;
   import com.aurora.ui.maogoutd.worldBossLevel.vo.WorldBossModel;
   import flash.utils.Dictionary;
   
   public class a_2439
   {
      
      private static var instance:a_2439;
      
      private var a_806:Array;
      
      private var a_807:Dictionary;
      
      private var a_808:Dictionary;
      
      private var a_809:Dictionary;
      
      private var a_810:Dictionary;
      
      private var a_811:Dictionary;
      
      private var m_enterRoom:Object;
      
      public var m_currentRoleUin:int;
      
      private var a_812:a_2751;
      
      private var a_813:int;
      
      private var m_sitdown:Object;
      
      private var a_814:Array;
      
      private var a_815:Array;
      
      private var a_817:Dictionary;
      
      private var a_818:Object;
      
      private var m_arrHeroOpen:Array;
      
      private var m_guideData:Object;
      
      private var m_iPetCount:int;
      
      private var m_stVerifyInGame:Object;
      
      private var realTimeDuanweiQualityCfg:Object;
      
      private var worldBossBuffId:int;
      
      private var newYearTurnCostMoney:int;
      
      private var autoOpenBirthdayActivity:Boolean;
      
      private var m_stPlayerRechargeActivityInfo:CResponseGetPlayerRechargeActivityInfo;
      
      private var m_stPlayerMarriageInfo:CResponsePlayerMarriageInfo;
      
      public var m_szCurrentTime:String;
      
      public var m_szExtSign:String;
      
      public var m_browser_env_md5:String;
      
      public var m_szDeviceInfo:String;
      
      public function a_2439()
      {
         super();
         this.m_enterRoom = {};
         this.m_enterRoom.m_iGroupID = 1;
         this.a_810 = new Dictionary();
         this.m_currentRoleUin = 0;
         a_2161.e.onlyRegister(this,true);
         this.m_sitdown = {};
      }
      
      public static function getInstance() : a_2439
      {
         if(instance == null)
         {
            instance = new a_2439();
         }
         return instance;
      }
      
      public function getConsortiaInfo() : Object
      {
         return a_2307.getInstance().getConsortiaInfo();
      }
      
      public function getConsortiaMembers() : Array
      {
         return a_2307.getInstance().getConsortiaMembers();
      }
      
      public function getConsortiaCurrentSkill() : Object
      {
         return a_2307.getInstance().getConsortiaCurrentSkill();
      }
      
      public function getConsortiaCurrentCompose() : Object
      {
         return a_2307.getInstance().getConsortiaCurrentCompose();
      }
      
      public function getMyConsortiaContribute() : int
      {
         return a_2307.getInstance().getMyConsortiaContribute();
      }
      
      public function set a_2483(enterRoom:Object) : void
      {
         this.m_enterRoom = enterRoom;
      }
      
      public function get a_2483() : Object
      {
         return this.m_enterRoom;
      }
      
      public function getEnterRoom() : Object
      {
         return this.m_enterRoom;
      }
      
      public function GetGameMode() : int
      {
         if(null != this.m_enterRoom)
         {
            return this.m_enterRoom.m_iGameMode;
         }
         return -1;
      }
      
      public function setGameReadyUrl(url:String) : void
      {
         this.m_sitdown.TDGameReadyUI = url;
      }
      
      public function setSitDown(sitDown:Object) : void
      {
         var map:Object = null;
         this.m_sitdown.m_iRoomID = this.m_enterRoom.m_iRoomID;
         this.m_sitdown.m_iServerID = this.m_enterRoom.m_iServerID;
         if(null == this.m_sitdown.a_820)
         {
            this.m_sitdown.a_820 = "";
         }
         this.m_sitdown.m_szTableName = this.m_enterRoom.m_szTableName;
         this.m_sitdown.m_iGameMapID = sitDown.m_iMapID;
         this.m_sitdown.m_iGameMapTypeID = sitDown.m_iMapID & 0xFFFF0000;
         this.m_sitdown.m_iGameMode = sitDown.m_byGameMode;
         this.m_sitdown.m_iTableID = sitDown.m_iTableID;
         this.m_sitdown.m_iSeatMask = sitDown.m_nseatmask;
         this.m_sitdown.m_byLevel = sitDown.m_bLevel;
         this.m_sitdown.m_iSeatID = sitDown.m_bySeatID;
         this.m_sitdown.m_iCrossID = sitDown.m_iCrossID;
         var iGameMapID:int = int(this.m_sitdown.m_iGameMapID);
         var dictMapMouse:Dictionary = a_2037.getInstance().m_dictMapMouse;
         if(dictMapMouse != null && dictMapMouse[iGameMapID] != null)
         {
            map = dictMapMouse[iGameMapID];
            this.m_sitdown.m_arrMouse = map.arrMapMouseID;
            this.m_sitdown.m_szMapName = map.szMapName;
         }
      }
      
      public function setDIYMouseInfo(arrMouse:Object) : void
      {
         this.m_sitdown.m_arrMouse = arrMouse.m_iMouseID;
         a_4657.getInstance().execute("OnSetDIYMouseInfo",this,arrMouse.m_iMouseID);
      }
      
      public function setDIYInfo(response:Object) : void
      {
         a_4657.getInstance().execute("OnSetDIYInfo",this,response);
      }
      
      public function GetSitDown() : Object
      {
         return this.m_sitdown;
      }
      
      public function GetPlayerCommon() : a_2751
      {
         return this.a_812;
      }
      
      public function getUserGameInfo(iServerID:int, iRoomID:int, iTableID:int = -1, iSeatID:int = -1) : String
      {
         var szRoomName:String = this.m_sitdown.a_820;
         if(iTableID != -1)
         {
            szRoomName += iTableID + "桌" + this.m_sitdown.m_szMapName;
            if(this.m_sitdown.m_iGameMode == a_1748.enmGameMode_vComputer)
            {
               szRoomName += "通关";
            }
            else
            {
               szRoomName += "对战";
            }
         }
         return szRoomName;
      }
      
      public function updatePlayerCommonCoin(iCurrentCoin:int, lCurrentHappyBean:int, iCurrentLottery:int, iCurrentCharm:int) : void
      {
         if(this.a_812 != null)
         {
            this.a_812.m_iMoney = iCurrentCoin;
            this.a_812.m_lHappyBean = lCurrentHappyBean;
            this.a_812.m_iLottery = iCurrentLottery;
            this.a_812.m_iCharming = iCurrentCharm;
            a_1825.e.onNotifyPlayerCommonChange(this.a_812);
         }
      }
      
      public function updateBuyCountPlayerCommon(buyClimbTowerCount:CResponseBuyClimbTowerCount) : void
      {
         var dbGameData:a_2745 = null;
         if(this.a_812 != null && buyClimbTowerCount.m_nResultID == 0)
         {
            this.a_812.m_iMoney = buyClimbTowerCount.m_iCurrentMoney;
            if(this.a_812.m_arrGameData == null || this.a_812.m_arrGameData.length == 0)
            {
               this.a_812.m_arrGameData = [new a_2745()];
            }
            dbGameData = this.a_812.m_arrGameData[0];
            dbGameData.m_iOrgID = buyClimbTowerCount.m_iOrgID;
            a_1825.e.onNotifyPlayerCommonChange(this.a_812);
         }
      }
      
      public function updateRoleAchievements(arrAchievements:Array) : void
      {
         if(this.a_814 != null)
         {
            this.a_814.splice(0);
         }
         this.a_814 = arrAchievements;
      }
      
      public function GetRoleAchievements() : Object
      {
         if(this.a_814 == null)
         {
            this.a_814 = [];
         }
         return this.a_814;
      }
      
      public function updateNotifyGameData(updateGameDataNotify:a_2755) : void
      {
         var dataEvent:a_1778 = null;
         var obj:Object = null;
         var dbGameData:a_2745 = null;
         if(this.a_812 != null)
         {
            if(this.a_812.m_iMoney > updateGameDataNotify.m_iMoney)
            {
               dataEvent = new a_1778(EventType.QQGAME_POST_CONSUME);
               obj = {};
               obj.iValue = this.a_812.m_iMoney - updateGameDataNotify.m_iMoney;
               obj.iUin = this.a_812.m_iUin;
               dataEvent.dataObject = obj;
               a_1789.getInstance().dispatchEvent(dataEvent);
            }
            this.a_812.m_iMoney = updateGameDataNotify.m_iMoney;
            this.a_812.m_lHappyBean = updateGameDataNotify.m_lHappyBean;
            this.a_812.m_iLottery = updateGameDataNotify.m_iLottery;
            this.a_812.m_iCharming = updateGameDataNotify.m_iCharming;
            this.a_812.m_iTotalCharm = updateGameDataNotify.m_iTotalCharm;
            this.a_812.m_iCharmCoin = updateGameDataNotify.m_iCharmCoin;
            this.a_812.m_iLastOfflineCharming = updateGameDataNotify.m_iPrestige;
            this.a_812.m_stVIP.m_iGameVIPScore = updateGameDataNotify.m_iVIPScore;
            this.a_812.m_iWarriorProgress = updateGameDataNotify.m_iWarriorProgress;
            this.a_812.m_iTotalMoneyConsume = updateGameDataNotify.m_iTotalMoneyConsume;
            this.a_812.m_iWishingTalisman = updateGameDataNotify.m_iWishingTalisman;
            this.a_812.m_iDataReversed = updateGameDataNotify.m_iDataReversed;
            if(updateGameDataNotify.m_nGameID != -1)
            {
               if(this.a_812.m_arrGameData == null || this.a_812.m_arrGameData.length == 0)
               {
                  this.a_812.m_arrGameData = [new a_2745()];
               }
               dbGameData = this.a_812.m_arrGameData[0];
               dbGameData.m_iWinRound = updateGameDataNotify.m_iWinRound;
               dbGameData.m_iLoseRound = updateGameDataNotify.m_iLossRound;
               dbGameData.m_iDrawRound = updateGameDataNotify.m_iDrawRound;
               dbGameData.m_iEscapeRound = updateGameDataNotify.m_iEscapeRound;
               dbGameData.m_iAchievement = updateGameDataNotify.m_iAchievement;
               dbGameData.m_iExperiencePoint = updateGameDataNotify.m_iExperiencePoint;
               dbGameData.m_iPoint = updateGameDataNotify.m_iGamePoint;
               dbGameData.m_iOrgID = updateGameDataNotify.m_iOrgID;
               dbGameData.m_nPosition = updateGameDataNotify.m_nPosition;
               dbGameData.m_iHeroCount = updateGameDataNotify.m_iHeroCount;
               dbGameData.m_iSeasonCount = updateGameDataNotify.m_iSeasonCount;
               dbGameData.m_oMiShi = updateGameDataNotify.m_oMiShi;
               dbGameData.m_Reserved = updateGameDataNotify.m_Reserved;
            }
            a_1825.e.onNotifyPlayerCommonChange(this.a_812);
         }
      }
      
      public function updatePlayerData(updatePlayerDataNotify:a_2756) : void
      {
         var dataPair:CPlayerDataPair = null;
         if(updatePlayerDataNotify.m_iUin == this.m_currentRoleUin && updatePlayerDataNotify.m_nCount > 0)
         {
            for each(dataPair in updatePlayerDataNotify.m_arrDataPair)
            {
               if(EnmPlayerDataType.constplayer_attr_type_money == dataPair.m_nType)
               {
                  this.a_812.m_iMoney = dataPair.m_iValue;
               }
               else if(EnmPlayerDataType.constplayer_attr_type_bean == dataPair.m_nType)
               {
                  this.a_812.m_lHappyBean = dataPair.m_iValue;
               }
               else if(EnmPlayerDataType.constplayer_attr_type_charm == dataPair.m_nType)
               {
                  this.a_812.m_iCharming = dataPair.m_iValue;
               }
            }
            a_1825.e.onNotifyPlayerCommonChange(this.a_812);
         }
      }
      
      public function set PlayerCommon(stPlayerCommonInfo:a_2751) : void
      {
         this.a_812 = stPlayerCommonInfo;
      }
      
      public function set RechargeActivityInfo(stPlayerRechargeActivityInfo:CResponseGetPlayerRechargeActivityInfo) : void
      {
         this.m_stPlayerRechargeActivityInfo = stPlayerRechargeActivityInfo;
      }
      
      public function set MarriageInfo(stPlayerMarriageInfo:CResponsePlayerMarriageInfo) : void
      {
         this.m_stPlayerMarriageInfo = stPlayerMarriageInfo;
      }
      
      public function GetDictTDTables() : Dictionary
      {
         return this.a_810;
      }
      
      public function getTDTableInfo(iTableID:int) : Object
      {
         return this.a_810[iTableID];
      }
      
      public function initTDTalbeInfo(arrTDTableInfo:Array) : void
      {
         var iTableID:String = null;
         var tempTableInfo:CTableInfo = null;
         var stTableInfo:Object = null;
         for(iTableID in this.a_810)
         {
            delete this.a_810[iTableID];
         }
         for each(tempTableInfo in arrTDTableInfo)
         {
            stTableInfo = new Object();
            stTableInfo.m_iTableID = tempTableInfo.m_iTableID;
            stTableInfo.m_nTableStatus = tempTableInfo.m_nTableStatus;
            stTableInfo.m_szTableName = tempTableInfo.m_szTableName;
            stTableInfo.m_byMMCount = tempTableInfo.m_byMMCount;
            stTableInfo.m_bySeatCount = tempTableInfo.m_bySeatCount;
            stTableInfo.m_byValidCount = tempTableInfo.m_byValidCount;
            stTableInfo.m_iGameMapID = tempTableInfo.m_iGameMapID;
            stTableInfo.m_byGameMode = tempTableInfo.m_byGameMode;
            stTableInfo.m_byLevel = tempTableInfo.m_byLevel;
            stTableInfo.m_index = this.m_enterRoom.m_index;
            this.a_810[stTableInfo.m_iTableID] = stTableInfo;
         }
         arrTDTableInfo = null;
      }
      
      public function updateTDTableInfo(roomTableInfo:Object) : void
      {
         var iTableID:int = int(roomTableInfo.m_iTableID);
         var stTableInfo:Object = this.a_810[iTableID];
         if(stTableInfo != null)
         {
            if(roomTableInfo.m_nTableStatus != undefined && roomTableInfo.m_nTableStatus != -1)
            {
               stTableInfo.m_nTableStatus = roomTableInfo.m_nTableStatus;
            }
            if(stTableInfo.m_nTableStatus == undefined)
            {
               stTableInfo.m_nTableStatus = 0;
            }
            stTableInfo.m_byMMCount = roomTableInfo.m_byMMCount;
            stTableInfo.m_bySeatCount = roomTableInfo.m_bySeatCount;
            stTableInfo.m_byValidCount = roomTableInfo.m_byValidCount;
            if(roomTableInfo.m_byLevel != -1)
            {
               stTableInfo.m_byLevel = roomTableInfo.m_byLevel;
            }
            if(stTableInfo.m_bySeatCount == 0)
            {
               delete this.a_810[iTableID];
            }
         }
         else
         {
            stTableInfo = {};
            stTableInfo.m_iTableID = roomTableInfo.m_iTableID;
            if(roomTableInfo.m_nTableStatus != undefined && roomTableInfo.m_nTableStatus != -1)
            {
               stTableInfo.m_nTableStatus = roomTableInfo.m_nTableStatus;
            }
            else
            {
               stTableInfo.m_nTableStatus = 0;
            }
            stTableInfo.m_szTableName = roomTableInfo.m_szTableName;
            stTableInfo.m_byMMCount = roomTableInfo.m_byMMCount;
            stTableInfo.m_bySeatCount = roomTableInfo.m_bySeatCount;
            stTableInfo.m_byValidCount = roomTableInfo.m_byValidCount;
            stTableInfo.m_iGameMapID = roomTableInfo.m_iGameMapID;
            stTableInfo.m_byGameMode = roomTableInfo.m_byGameMode;
            stTableInfo.m_index = this.m_enterRoom.m_index;
            if(roomTableInfo.m_byLevel != -1)
            {
               stTableInfo.m_byLevel = roomTableInfo.m_byLevel;
            }
            this.a_810[stTableInfo.m_iTableID] = stTableInfo;
         }
      }
      
      public function updateTDTableInfoStatus(iTableID:int, iStatus:int, flag:int = -1) : void
      {
         var stTableInfo:Object = this.a_810[iTableID];
         if(stTableInfo != null)
         {
            if(stTableInfo.m_nTableStatus == undefined)
            {
               stTableInfo.m_nTableStatus = 0;
            }
            switch(flag)
            {
               case 0:
                  stTableInfo.m_nTableStatus |= iStatus;
                  break;
               case 1:
                  stTableInfo.m_nTableStatus &= ~iStatus;
                  break;
               default:
                  stTableInfo.m_nTableStatus = iStatus;
            }
         }
      }
      
      public function updateTDTableSeatStatus(obj:Object) : void
      {
         var stTableInfo:Object = this.a_810[obj.m_iTableID];
         if(stTableInfo != null)
         {
            if(obj.m_bState == 0)
            {
               --stTableInfo.m_byValidCount;
            }
            else if(obj.m_bState == 1)
            {
               ++stTableInfo.m_byValidCount;
            }
            if(this.m_enterRoom.m_iTableID == obj.m_iTableID)
            {
               a_1825.e.onRoomEventSeatStatus(obj.m_bSeatID,obj.m_bState);
            }
         }
      }
      
      public function updateGuideData(guideData:String) : void
      {
         var str:String = null;
         var tmpArr:Array = null;
         var i:int = 0;
         if(this.m_guideData == null)
         {
            this.m_guideData = {};
         }
         if(guideData == null)
         {
            guideData = "";
         }
         this.m_guideData.guideData = [];
         this.m_guideData.guideData[0] = [];
         this.m_guideData.guideData[1] = [];
         this.m_guideData.guideData[2] = [];
         this.m_guideData.guideData[3] = [];
         this.m_guideData.guideData[4] = [];
         this.m_guideData.guideData[5] = [];
         this.m_guideData.guideData[6] = [];
         if(guideData != "")
         {
            str = guideData;
            tmpArr = str.split(",");
            this.m_guideData.guideData[0] = tmpArr[0];
            for(i = 1; i < tmpArr.length; i++)
            {
               this.m_guideData.guideData[i] = (tmpArr[i] as String).split("|");
            }
         }
         a_4657.getInstance().execute("onLobbyGuide",null,guideData);
      }
      
      public function GetTDCardsInfo() : Array
      {
         return this.a_806;
      }
      
      public function GetTDCanUsePropNum(itemId:int) : int
      {
         var cardAttr:a_3228 = null;
         var num:int = 0;
         var props:Array = this.a_806[1];
         var cnt:int = int(props.length);
         for(var i:int = 0; i < cnt; i++)
         {
            cardAttr = props[i];
            if(Boolean(cardAttr) && cardAttr.CardID == itemId)
            {
               num = cardAttr.CardCount;
               break;
            }
         }
         return num;
      }
      
      public function a_2440(cardID:int) : int
      {
         return -1;
      }
      
      public function GetCardsByType(type:int) : Array
      {
         if(this.a_806 == null || this.a_806.length == 0)
         {
            return [];
         }
         var arrTemp:Array = [];
         switch(type)
         {
            case a_1730.card_slot_package_game_card:
               arrTemp = this.a_806[0];
               break;
            case a_1730.card_slot_package_game_props:
               arrTemp = this.a_806[1];
               break;
            case a_1730.card_slot_package_hero_item:
               arrTemp = a_4463(this.a_809[this.m_currentRoleUin]).a_951;
               break;
            default:
               trace("GetCardsByType->不支持的类型>>type=" + type);
         }
         return arrTemp;
      }
      
      public function GetPackageOpenedNumByType(type:int) : int
      {
         var intNum:int = 0;
         if(this.a_806 == null || this.a_806.length == 0)
         {
            return intNum;
         }
         switch(type)
         {
            case a_1730.card_slot_package_game_card:
               intNum = int(this.a_806["defPackageSize"]);
               break;
            case a_1730.card_slot_package_game_props:
               intNum = int(this.a_806["propsPackageSize"]);
               break;
            case a_1730.card_slot_package_hero_item:
               intNum = int(this.a_806["heroPackageSize"]);
               break;
            default:
               trace("GetPackageOpenedNumByType->不支持的类型>>type=" + type);
         }
         return intNum;
      }
      
      public function setTDCardsInfo(cardsResponse:a_2943) : void
      {
         var stCardStore:Object = null;
         var m_arrDefCards:Array = null;
         var m_arrPropsCards:Array = null;
         var m_arrOtherPropsCards:Array = null;
         var arrDefCards:Array = null;
         var arrPropsCards:Array = null;
         var arrOtherPropsCards:Array = null;
         var m_dictDesc:Dictionary = null;
         var cardInfo:a_2898 = null;
         var cardProps:a_2897 = null;
         var cardOther:a_2897 = null;
         var defCard:a_3228 = null;
         var extraAttr:Array = null;
         var attr:CCardExtraAttr = null;
         var propsCard:a_3228 = null;
         var otherCard:a_3228 = null;
         this.a_806 = [];
         for each(stCardStore in cardsResponse.m_arrCardStore)
         {
            this.updatePackageSize(stCardStore.m_byCardStoreType,stCardStore.m_nCardStoreOpenedNum);
         }
         this.a_806["CardStore"] = cardsResponse.m_arrCardStore;
         this.a_806[3] = cardsResponse.m_aryCardList;
         this.a_806[4] = cardsResponse.m_arrSkillInfos;
         m_arrDefCards = cardsResponse.m_arrCardInfos;
         m_arrPropsCards = cardsResponse.m_arrCardBuyInfos;
         m_arrOtherPropsCards = cardsResponse.m_arrCardComposeInfos;
         arrDefCards = [];
         arrPropsCards = [];
         arrOtherPropsCards = [];
         m_dictDesc = a_2027.getInstance().m_dictDesc;
         for each(cardInfo in m_arrDefCards)
         {
            if(cardInfo.m_nCardCount != 0)
            {
               defCard = new a_3228();
               defCard.CardCount = cardInfo.m_nCardCount;
               defCard.CardID = cardInfo.m_iCardID;
               defCard.CardPositionID = cardInfo.m_nCardPosition;
               defCard.CardSeq = cardInfo.m_iCardSeq;
               defCard.ExpiredTime = cardInfo.m_iUsedTime;
               defCard.UsedCount = cardInfo.m_nCardUsedCount;
               defCard.IsBind = cardInfo.m_cIsBind;
               defCard.DeltaTime = cardInfo.m_iDeltaTime;
               extraAttr = cardInfo.m_arrCardExtraAttr;
               for each(attr in extraAttr)
               {
                  if(attr.m_cAttrType == 10)
                  {
                     defCard.Type = attr.m_cAttrType;
                     defCard.TypeValue = attr.m_iAttrAdd;
                  }
                  else if(attr.m_cAttrType == 7)
                  {
                     defCard.GradeLevel = attr.m_iAttrAdd;
                  }
               }
               if(m_dictDesc != null && m_dictDesc[defCard.CardID] != null)
               {
                  defCard.UseNumber = m_dictDesc[defCard.CardID].Use;
                  defCard.Name = m_dictDesc[defCard.CardID].Name;
               }
               else
               {
                  defCard.UseNumber = "0";
               }
               arrDefCards.push(defCard);
            }
         }
         this.a_806[0] = arrDefCards;
         for each(cardProps in m_arrPropsCards)
         {
            if(cardProps.m_nCardCount != 0)
            {
               propsCard = new a_3228();
               propsCard.CardCount = cardProps.m_nCardCount;
               propsCard.CardID = cardProps.m_iCardID;
               propsCard.CardPositionID = cardProps.m_nCardPosition;
               propsCard.CardSeq = cardProps.m_iCardSeq;
               propsCard.ExpiredTime = -1;
               propsCard.UsedCount = cardProps.m_nCardUsedCount;
               propsCard.IsBind = cardProps.m_cIsBind;
               propsCard.DeltaTime = cardProps.m_iDeltaTime;
               if(m_dictDesc != null && m_dictDesc[propsCard.CardID] != null)
               {
                  propsCard.Name = m_dictDesc[propsCard.CardID].Name;
               }
               arrPropsCards.push(propsCard);
            }
         }
         this.a_806[1] = arrPropsCards;
         for each(cardOther in m_arrOtherPropsCards)
         {
            if(cardOther.m_nCardCount != 0)
            {
               otherCard = new a_3228();
               otherCard.CardCount = cardOther.m_nCardCount;
               otherCard.CardID = cardOther.m_iCardID;
               otherCard.CardPositionID = cardOther.m_nCardPosition;
               otherCard.CardSeq = cardOther.m_iCardSeq;
               otherCard.ExpiredTime = -1;
               otherCard.UsedCount = cardOther.m_nCardUsedCount;
               otherCard.IsBind = cardOther.m_cIsBind;
               otherCard.DeltaTime = cardOther.m_iDeltaTime;
               if(m_dictDesc != null && m_dictDesc[otherCard.CardID] != null)
               {
                  otherCard.Name = m_dictDesc[otherCard.CardID].Name;
               }
               arrOtherPropsCards.push(otherCard);
            }
         }
         this.a_806[2] = arrOtherPropsCards;
         this.dealEquipmentCards(false);
      }
      
      public function updatePackageSize(type:int, newSize:int) : void
      {
         if(this.a_806 == null)
         {
            return;
         }
         switch(type)
         {
            case a_1730.card_slot_package_game_props:
               this.a_806["propsPackageSize"] = newSize;
               break;
            case a_1730.card_slot_package_game_card:
               this.a_806["defPackageSize"] = newSize;
               break;
            case a_1730.card_slot_package_hero_item:
               this.a_806["heroPackageSize"] = newSize;
               break;
            case a_1730.card_slot_fighting:
               this.a_806["fightingSize"] = newSize;
               break;
            default:
               trace("updatePackageSize error ,type=" + type);
         }
      }
      
      public function updateNotifyCards(arrCardItem:Array) : void
      {
         var notifyUpdate:a_2737 = null;
         var CardID:int = 0;
         var CardSeq:int = 0;
         var ID:String = null;
         var arrDef:Array = null;
         var notifyDef:a_2737 = null;
         var defCard:a_3228 = null;
         var arrCardExtraAttr:Array = null;
         var attr:CCardExtraAttr = null;
         var arrProps:Array = null;
         var notifyProps:Object = null;
         var propsCard:a_3228 = null;
         var arrOther:Array = null;
         var notifyOther:Object = null;
         var otherCard:a_3228 = null;
         if(arrCardItem.length == 0)
         {
            return;
         }
         var arrDefCards:Array = this.a_806[0];
         var arrPropsCards:Array = this.a_806[1];
         var arrOtherCards:Array = this.a_806[2];
         var index:* = 0;
         var m_dictDesc:Dictionary = a_2027.getInstance().m_dictDesc;
         var dictDefNotify:Dictionary = null;
         var dictPropsNotify:Dictionary = null;
         var dictOtherNotify:Dictionary = null;
         for each(notifyUpdate in arrCardItem)
         {
            CardID = notifyUpdate.m_iCardID;
            CardSeq = notifyUpdate.m_iCardSeq;
            ID = CardID + "-" + CardSeq;
            if((CardID & 0xFF000000) == 285212672)
            {
               if(dictDefNotify == null)
               {
                  dictDefNotify = new Dictionary();
               }
               dictDefNotify[ID] = notifyUpdate;
            }
            if((CardID & 0xFF000000) == 301989888)
            {
               if(dictPropsNotify == null)
               {
                  dictPropsNotify = new Dictionary();
               }
               dictPropsNotify[ID] = notifyUpdate;
            }
            if((CardID & 0xFF000000) == 318767104)
            {
               if(dictOtherNotify == null)
               {
                  dictOtherNotify = new Dictionary();
               }
               dictOtherNotify[ID] = notifyUpdate;
            }
         }
         if(dictDefNotify != null)
         {
            arrDef = arrDefCards.concat();
            for each(defCard in arrDef)
            {
               notifyDef = dictDefNotify[defCard.ID];
               if(notifyDef != null)
               {
                  defCard.CardCount = notifyDef.m_nCardCount;
                  defCard.CardID = notifyDef.m_iCardID;
                  defCard.IsBind = notifyDef.m_cIsBind;
                  defCard.CardSeq = notifyDef.m_iCardSeq;
                  defCard.ExpiredTime = notifyDef.m_iUsedTime;
                  defCard.UsedCount = notifyDef.m_nCardUsedCount;
                  defCard.DeltaTime = notifyDef.m_iDeltaTime;
                  if(defCard.CardCount == 0)
                  {
                     arrDefCards.splice(index,1);
                     index--;
                  }
                  delete dictDefNotify[defCard.ID];
               }
               index++;
            }
            for each(notifyDef in dictDefNotify)
            {
               defCard = new a_3228();
               defCard.CardCount = notifyDef.m_nCardCount;
               defCard.CardID = notifyDef.m_iCardID;
               defCard.CardPositionID = -1;
               defCard.CardSeq = notifyDef.m_iCardSeq;
               defCard.ExpiredTime = notifyDef.m_iUsedTime;
               defCard.UsedCount = notifyDef.m_nCardUsedCount;
               defCard.IsBind = notifyDef.m_cIsBind;
               defCard.DeltaTime = notifyDef.m_iDeltaTime;
               arrCardExtraAttr = notifyDef.arrCardExtraAttr;
               for each(attr in arrCardExtraAttr)
               {
                  if(attr.m_cAttrType == 10)
                  {
                     defCard.Type = attr.m_cAttrType;
                     defCard.TypeValue = attr.m_iAttrAdd;
                  }
                  else if(attr.m_cAttrType == 7)
                  {
                     defCard.GradeLevel = attr.m_iAttrAdd;
                  }
               }
               if(m_dictDesc != null && m_dictDesc[defCard.CardID] != null)
               {
                  defCard.UseNumber = m_dictDesc[defCard.CardID].Use;
               }
               arrDefCards.push(defCard);
            }
            a_1825.e.onNotifyDefCardsChange(arrDefCards);
         }
         if(dictPropsNotify != null)
         {
            arrProps = arrPropsCards.concat();
            index = 0;
            for each(propsCard in arrProps)
            {
               notifyProps = dictPropsNotify[propsCard.ID];
               if(notifyProps != null)
               {
                  propsCard.CardCount = notifyProps.m_nCardCount;
                  propsCard.CardID = notifyProps.m_iCardID;
                  propsCard.CardSeq = notifyProps.m_iCardSeq;
                  propsCard.ExpiredTime = -1;
                  propsCard.UsedCount = notifyProps.m_nCardUsedCount;
                  propsCard.IsBind = notifyProps.m_cIsBind;
                  propsCard.DeltaTime = notifyProps.m_iDeltaTime;
                  if(propsCard.CardCount == 0)
                  {
                     arrPropsCards.splice(index,1);
                     index--;
                  }
                  delete dictPropsNotify[propsCard.ID];
               }
               index++;
            }
            for each(notifyProps in dictPropsNotify)
            {
               propsCard = new a_3228();
               propsCard.CardCount = notifyProps.m_nCardCount;
               propsCard.CardID = notifyProps.m_iCardID;
               propsCard.CardPositionID = -1;
               propsCard.CardSeq = notifyProps.m_iCardSeq;
               propsCard.ExpiredTime = -1;
               propsCard.UsedCount = notifyProps.m_nCardUsedCount;
               propsCard.IsBind = notifyProps.m_cIsBind;
               propsCard.DeltaTime = notifyProps.m_iDeltaTime;
               if(m_dictDesc != null && m_dictDesc[propsCard.CardID] != null)
               {
                  propsCard.Name = m_dictDesc[propsCard.CardID].Name;
               }
               arrPropsCards.push(propsCard);
            }
            a_1825.e.onNotifyPropsCardsChange(arrPropsCards);
         }
         if(dictOtherNotify != null)
         {
            arrOther = arrOtherCards.concat();
            index = 0;
            for each(otherCard in arrOther)
            {
               notifyOther = dictOtherNotify[otherCard.ID];
               if(notifyOther != null)
               {
                  otherCard.CardCount = notifyOther.m_nCardCount;
                  otherCard.CardID = notifyOther.m_iCardID;
                  otherCard.CardSeq = notifyOther.m_iCardSeq;
                  otherCard.ExpiredTime = -1;
                  otherCard.UsedCount = notifyOther.m_nCardUsedCount;
                  otherCard.IsBind = notifyOther.m_cIsBind;
                  otherCard.DeltaTime = notifyOther.m_iDeltaTime;
                  if(otherCard.CardCount == 0)
                  {
                     arrOtherCards.splice(index,1);
                     index--;
                  }
                  delete dictOtherNotify[otherCard.ID];
               }
               index++;
            }
            for each(notifyOther in dictOtherNotify)
            {
               otherCard = new a_3228();
               otherCard.CardCount = notifyOther.m_nCardCount;
               otherCard.CardID = notifyOther.m_iCardID;
               otherCard.CardPositionID = -1;
               otherCard.CardSeq = notifyOther.m_iCardSeq;
               otherCard.ExpiredTime = -1;
               otherCard.UsedCount = notifyOther.m_nCardUsedCount;
               otherCard.IsBind = notifyOther.m_cIsBind;
               otherCard.DeltaTime = notifyOther.m_iDeltaTime;
               if(m_dictDesc != null && m_dictDesc[otherCard.CardID] != null)
               {
                  otherCard.Name = m_dictDesc[otherCard.CardID].Name;
               }
               arrOtherCards.push(otherCard);
            }
            this.dealEquipmentCards(true);
         }
      }
      
      public function updateNotifyHeroCards(arrHeroCardItem:Array) : void
      {
         var notifyUpdate:CUpdateHeroInfoRes = null;
         var iItemID:int = 0;
         var iItemSeq:int = 0;
         var ID:String = null;
         var heroItem:a_4461 = null;
         var a_951:Array = null;
         var index:int = 0;
         var attr:a_3228 = null;
         var m_arrHeroCards:Array = null;
         var item:a_4461 = null;
         var cardAttr:a_3228 = null;
         if(arrHeroCardItem.length == 0)
         {
            return;
         }
         var role:a_4463 = this.GetCurrentRole() as a_4463;
         var dictHeroDetail:Dictionary = role.m_dictHeroDetail;
         for each(notifyUpdate in arrHeroCardItem)
         {
            iItemID = notifyUpdate.m_iItemID;
            iItemSeq = notifyUpdate.m_iItemSeq;
            if((iItemID & 0xFF000000) == 335544320)
            {
               ID = iItemID + "-" + iItemSeq;
               heroItem = dictHeroDetail[ID];
               if(heroItem != null)
               {
                  if(notifyUpdate.m_nItemExtraAttrCount > 0)
                  {
                     this.updateHeroItemAttr(heroItem,notifyUpdate.m_arrExtraAttr);
                  }
                  heroItem.m_cIsBind = notifyUpdate.m_cIsBind;
                  heroItem.m_cItemColor = notifyUpdate.m_cItemColor;
                  heroItem.m_iUsedTime = notifyUpdate.m_iUsedTime;
                  heroItem.m_iItemID = notifyUpdate.m_iItemID;
                  heroItem.m_iItemSeq = notifyUpdate.m_iItemSeq;
                  heroItem.m_nItemCount = notifyUpdate.m_nItemCount;
                  heroItem.m_nItemUsedCount = notifyUpdate.m_nItemUsedCount;
                  heroItem.m_iDeltaTime = notifyUpdate.m_iDeltaTime;
                  if(heroItem.m_nItemCount == 0)
                  {
                     delete dictHeroDetail[heroItem.ID];
                  }
                  a_951 = role.a_951;
                  index = 0;
                  for each(attr in a_951)
                  {
                     if(attr.ID == heroItem.ID)
                     {
                        if(heroItem.m_nItemCount == 0)
                        {
                           a_951.splice(index,1);
                        }
                        else
                        {
                           attr.CardCount = heroItem.m_nItemCount;
                           attr.CardID = heroItem.m_iItemID;
                           attr.CardPositionID = heroItem.m_nItemPosition;
                           attr.CardSeq = heroItem.m_iItemSeq;
                           attr.IsBind = heroItem.m_cIsBind;
                           attr.ExpiredTime = heroItem.m_iUsedTime;
                           attr.DeltaTime = heroItem.m_iDeltaTime;
                           attr.Type = heroItem.m_iType;
                           attr.TypeValue = heroItem.m_iTypeValue;
                           attr.DictExtraAttr = heroItem.m_dictExtraAttr;
                           attr.m_arrExtraAttr = heroItem.m_arrExtraAttr;
                        }
                        break;
                     }
                     index++;
                  }
                  m_arrHeroCards = role.m_arrHeroItemID;
                  index = 0;
                  for each(item in m_arrHeroCards)
                  {
                     if(item.ID == heroItem.ID)
                     {
                        if(heroItem.m_nItemCount == 0)
                        {
                           m_arrHeroCards.splice(index,1);
                        }
                        else
                        {
                           item.m_nItemCount = heroItem.m_nItemCount;
                           item.m_iItemID = heroItem.m_iItemID;
                           item.m_nItemPosition = heroItem.m_nItemPosition;
                           item.m_iItemSeq = heroItem.m_iItemSeq;
                           item.m_cIsBind = heroItem.m_cIsBind;
                           item.m_iUsedTime = heroItem.m_iUsedTime;
                           item.m_iDeltaTime = heroItem.m_iDeltaTime;
                           item.m_iType = heroItem.m_iType;
                           item.m_iTypeValue = heroItem.m_iTypeValue;
                        }
                        break;
                     }
                     index++;
                  }
               }
               else
               {
                  heroItem = new a_4461();
                  if(notifyUpdate.m_nItemExtraAttrCount > 0)
                  {
                     this.updateHeroItemAttr(heroItem,notifyUpdate.m_arrExtraAttr);
                  }
                  heroItem.m_cIsBind = notifyUpdate.m_cIsBind;
                  heroItem.m_cItemColor = notifyUpdate.m_cItemColor;
                  heroItem.m_iUsedTime = notifyUpdate.m_iUsedTime;
                  heroItem.m_iItemID = notifyUpdate.m_iItemID;
                  heroItem.m_iItemSeq = notifyUpdate.m_iItemSeq;
                  heroItem.m_nItemPosition = -1;
                  heroItem.m_nItemCount = notifyUpdate.m_nItemCount;
                  heroItem.m_nItemUsedCount = notifyUpdate.m_nItemUsedCount;
                  heroItem.m_iDeltaTime = notifyUpdate.m_iDeltaTime;
                  dictHeroDetail[heroItem.ID] = heroItem;
                  cardAttr = this.transformHeroItemToCards(heroItem);
                  role.a_951.push(cardAttr);
               }
            }
         }
         this.dealEquipmentCards(false);
         a_1825.e.onNotifyRoleChange(role);
      }
      
      private function updateHeroItemAttr(heroItem:a_4461, arrExtraAttr:Array) : void
      {
         var itemExtra:Object = null;
         var itemType:int = 0;
         var itemTypeValue:int = 0;
         var dictExtraAttr:Dictionary = heroItem.m_dictExtraAttr;
         for each(itemExtra in arrExtraAttr)
         {
            itemType = int(itemExtra.m_cItemType);
            itemTypeValue = int(itemExtra.m_iItemAdd);
            if(itemType == 2)
            {
               heroItem.m_iType = itemType;
               heroItem.m_iTypeValue = itemTypeValue;
            }
            dictExtraAttr[itemType] = itemTypeValue;
         }
         heroItem.m_arrExtraAttr = Tool.a_4653(arrExtraAttr) as Array;
      }
      
      public function updateCardAttr(notify:Object) : void
      {
         var arrDefCards:Array = null;
         var defCard:a_3228 = null;
         var arrPropsCards:Array = null;
         var propsCard:a_3228 = null;
         var arrOtherCards:Array = null;
         var otherCard:a_3228 = null;
         var role:a_4463 = null;
         var heroItem:a_4461 = null;
         var attr:a_3228 = null;
         var CardID:int = int(notify.m_iCardID);
         var CardSeq:int = int(notify.m_iCardSeq);
         var cardChange:Boolean = false;
         if((CardID & 0xFF000000) == 285212672)
         {
            arrDefCards = this.a_806[0];
            for each(defCard in arrDefCards)
            {
               if(defCard.CardID == CardID && defCard.CardSeq == CardSeq)
               {
                  if(notify.m_cAttrType == 10)
                  {
                     defCard.Type = notify.m_cAttrType;
                     defCard.TypeValue = notify.m_iAttrAdd;
                  }
                  else if(notify.m_cAttrType == 7)
                  {
                     defCard.GradeLevel = notify.m_iAttrAdd;
                  }
                  cardChange = true;
                  break;
               }
            }
         }
         if((CardID & 0xFF000000) == 301989888)
         {
            arrPropsCards = this.a_806[1];
            for each(propsCard in arrPropsCards)
            {
               if(propsCard.CardID == CardID && propsCard.CardSeq == CardSeq)
               {
                  propsCard.Type = notify.m_cAttrType;
                  propsCard.TypeValue = notify.m_iAttrAdd;
                  cardChange = true;
                  break;
               }
            }
         }
         if((CardID & 0xFF000000) == 318767104)
         {
            arrOtherCards = this.a_806[2];
            for each(otherCard in arrOtherCards)
            {
               if(otherCard.CardID == CardID && otherCard.CardSeq == CardSeq)
               {
                  otherCard.Type = notify.m_cAttrType;
                  otherCard.TypeValue = notify.m_iAttrAdd;
                  break;
               }
            }
            this.dealEquipmentCards(true);
         }
         if((CardID & 0xFF000000) == 335544320)
         {
            role = this.GetCurrentRole() as a_4463;
            heroItem = role.m_dictHeroDetail[CardID + "-" + CardSeq];
            if(heroItem != null)
            {
               heroItem.m_iType = notify.m_cAttrType;
               heroItem.m_iTypeValue = notify.m_iAttrAdd;
            }
            for each(attr in role.a_951)
            {
               if(attr.CardID == CardID && attr.CardSeq == CardSeq)
               {
                  attr.Type = notify.m_cAttrType;
                  attr.TypeValue = notify.m_iAttrAdd;
                  break;
               }
            }
            this.dealEquipmentCards(true);
         }
         if(cardChange)
         {
            a_1825.e.onNotifyCardsChange(this.a_806);
         }
      }
      
      private function dealEquipmentCards(isNotify:Boolean = false, needMatchPosition:Boolean = false) : void
      {
         var attr:a_3228 = null;
         var arrOtherCards:Array = null;
         var otherCard:a_3228 = null;
         var role:a_4463 = this.GetCurrentRole() as a_4463;
         var arrEquipmentCards:Array = role.a_951.concat();
         role.a_951.splice(0);
         for each(attr in arrEquipmentCards)
         {
            if((attr.CardID & 0xFF000000) == 335544320)
            {
               role.a_951.push(attr);
            }
         }
         arrOtherCards = this.a_806[2];
         for each(otherCard in arrOtherCards)
         {
            role.a_951.push(otherCard);
         }
         if(isNotify)
         {
            a_1825.e.onNotifyEquipmentCardsChange(role.a_951,needMatchPosition);
         }
      }
      
      public function updateTDCardsStore(fightingSize:int) : void
      {
         this.a_806["fightingSize"] = fightingSize;
         a_1825.e.onNotifyCardsStore(fightingSize);
      }
      
      public function setTDFavouriteCardInfo(arrFavouriteCards:Array) : void
      {
         this.a_806[3] = arrFavouriteCards;
      }
      
      public function GetTasks() : Vector.<a_4517>
      {
         var dataItem:a_4517 = null;
         var tasks:Vector.<a_4517> = new Vector.<a_4517>();
         if(this.a_807 != null)
         {
            for each(dataItem in this.a_807)
            {
               if(dataItem.m_iTaskID != 285212672)
               {
                  tasks.push(dataItem);
               }
            }
         }
         return tasks;
      }
      
      public function setTaskInfo(arrTaskInfos:Array) : void
      {
         var a_1660:Object = null;
         var levelDesc:Object = null;
         var iLevel:int = 0;
         var iVip:Boolean = false;
         var iYearVip:Boolean = false;
         var iSiteType:String = null;
         var iNormalLogin:int = 0;
         var task:Object = null;
         var dataItem:a_4517 = null;
         var iTaskID:* = undefined;
         var desc:Object = null;
         var iType:int = 0;
         var SiteTypes:String = null;
         var iHideLevel:int = 0;
         var taskDate:Date = null;
         var lbTime:Number = NaN;
         var endDate:Date = null;
         var leTime:Number = NaN;
         var taskInfo:a_4517 = null;
         this.a_813 = 0;
         if(this.a_807 == null)
         {
            this.a_807 = new Dictionary();
         }
         else
         {
            for(iTaskID in this.a_807)
            {
               delete this.a_807[iTaskID];
            }
         }
         a_1660 = this.GetCurrentRole();
         levelDesc = a_2033.getInstance().getGameLevel(a_1660.m_iGamePoint);
         iLevel = Number(levelDesc.iLevel);
         iVip = Boolean(this.m_enterRoom.m_isYellowGem);
         iYearVip = Boolean(this.m_enterRoom.m_isYearYellowGem);
         iSiteType = this.m_enterRoom.m_iSiteType;
         iNormalLogin = -1;
         if(this.m_enterRoom.is_normal_login)
         {
            iNormalLogin = int(this.m_enterRoom.is_normal_login);
         }
         var systemTime:Number = a_1767.getInstance().SystemTime * 1000;
         for each(task in arrTaskInfos)
         {
            desc = a_2048.getInstance().a_1663[task.m_iTaskID];
            if(desc != null && task.m_iTaskID != 285212672)
            {
               if(null != desc.strStartTime && "0" != desc.strStartTime)
               {
                  taskDate = new Date(desc.strStartTime);
                  lbTime = taskDate.time;
                  if(systemTime < lbTime)
                  {
                     continue;
                  }
               }
               if(null != desc.strEndTime && "0" != desc.strEndTime)
               {
                  endDate = new Date(desc.strEndTime);
                  leTime = endDate.time;
                  if(systemTime >= leTime)
                  {
                     continue;
                  }
               }
               if(!(39848193 == task.m_iTaskID && 1 != iNormalLogin))
               {
                  iType = int(desc.iVip);
                  SiteTypes = desc.SiteType;
                  iHideLevel = Number(desc.iHideLevel);
                  if("" != SiteTypes)
                  {
                     trace(SiteTypes.search(iSiteType));
                     if(-1 == SiteTypes.search(iSiteType))
                     {
                        continue;
                     }
                  }
                  if(desc.level <= iLevel)
                  {
                     if(iHideLevel == 0 || iHideLevel >= iLevel)
                     {
                        if(0 == iType || 1 == iType && iVip || 2 == iType && iYearVip || 3 == iType && (iVip || iYearVip) || 4 == iType && (!iVip && !iYearVip))
                        {
                           taskInfo = new a_4517();
                           taskInfo.m_iTaskID = task.m_iTaskID;
                           taskInfo.m_iAcceptDate = task.m_iAcceptDate;
                           taskInfo.m_iAccomplishedDate = task.m_iAccomplishedDate;
                           taskInfo.m_iTaskStatus = task.m_iTaskStatus;
                           taskInfo.m_iUserDef1 = task.m_iUserDef1;
                           this.a_807[task.m_iTaskID] = taskInfo;
                        }
                     }
                  }
               }
            }
         }
         for each(dataItem in this.a_807)
         {
            if(dataItem.m_iTaskID != 285212672)
            {
               if(dataItem.m_iTaskStatus == a_1756.enm_TaskCompleteStatus || dataItem.m_iTaskStatus == a_1756.enm_TaskOpenedStatus)
               {
                  this.a_813 = dataItem.m_iTaskStatus;
               }
            }
         }
      }
      
      public function setTaskInfoStatus(m_iTaskID:int, m_status:int) : void
      {
         var taskInfo:a_4517 = null;
         if(this.a_807 != null)
         {
            taskInfo = this.a_807[m_iTaskID];
            if(taskInfo != null)
            {
               taskInfo.m_iTaskStatus = m_status;
            }
         }
      }
      
      public function get TaskStatus() : int
      {
         return this.a_813;
      }
      
      public function getTaskItemLogicData(logicType:int) : Array
      {
         var dataItem:Object = null;
         var type:int = 0;
         var arrLogicData:Array = [];
         if(this.a_807 != null)
         {
            for each(dataItem in this.a_807)
            {
               type = (dataItem.m_iTaskID & 0xF0000000) >> 28;
               if(type == logicType && dataItem.m_iTaskStatus == a_1756.enm_TaskUnderwayStatus)
               {
                  arrLogicData.push(dataItem);
               }
            }
         }
         return arrLogicData;
      }
      
      public function setPositiveFriends(arrFriends:Array) : void
      {
         var friendInfo:Object = null;
         var iUin:* = undefined;
         var friendData:Object = null;
         if(this.a_808 == null)
         {
            this.a_808 = new Dictionary();
         }
         else
         {
            for(iUin in this.a_808)
            {
               delete this.a_808[iUin];
            }
         }
         for each(friendInfo in arrFriends)
         {
            friendData = this.a_808[friendInfo.m_iFriendUIN];
            if(friendData == null)
            {
               friendData = {};
               this.a_808[friendInfo.m_iFriendUIN] = friendData;
               friendData.m_iGameStatus = a_1750.enm_LeaveStatus;
            }
            friendData.m_iRoleUin = friendInfo.m_iFriendUIN;
            friendData.m_szRoleName = friendInfo.m_szFriendAccount;
            if(friendData.m_szRoleName == null)
            {
               friendData.m_szRoleName = friendData.m_iRoleUin;
            }
            friendData.m_UserStatus = null;
         }
         a_2150.e.onPositiveFriendsChange();
      }
      
      public function updateFriendStatus(arrPlayerStatusInfo:Array) : void
      {
         var stPlayerStatus:Object = null;
         var iUin:int = 0;
         var friendData:Object = null;
         if(this.a_808 == null)
         {
            return;
         }
         var changed:Boolean = false;
         for each(stPlayerStatus in arrPlayerStatusInfo)
         {
            iUin = int(stPlayerStatus.m_nUin);
            if(iUin != this.m_currentRoleUin)
            {
               friendData = this.a_808[stPlayerStatus.m_nUin];
               if(friendData != null)
               {
                  changed = true;
                  if(stPlayerStatus.m_byClassCount > 0)
                  {
                     friendData.m_iRoleUin = stPlayerStatus.m_nUin;
                     friendData.m_szRoleName = stPlayerStatus.m_szAccount;
                  }
                  this.updatePlayerStatus(friendData,stPlayerStatus);
               }
            }
         }
         if(changed)
         {
            a_2150.e.onPositiveFriendsChange();
         }
      }
      
      public function getGameStatusFromPlayerStatus(objNewStatus:Object) : int
      {
         var stateData:Object = null;
         var userStatus:Object = null;
         var classCount:int = int(objNewStatus.m_byClassCount);
         var iGameStatus:int = a_1750.enm_LeaveStatus;
         if(classCount > 0)
         {
            stateData = objNewStatus.m_stStateData[classCount - 1];
            if(stateData != null)
            {
               if(stateData.m_cClass == a_1755.a_523)
               {
                  if(stateData.logicState.m_cRoomCount > 0)
                  {
                     userStatus = stateData.logicState.m_arrStatus[0];
                     if(userStatus != null)
                     {
                        iGameStatus = int(userStatus.m_iState);
                     }
                  }
               }
               else
               {
                  iGameStatus = int(stateData.hallState);
               }
            }
         }
         return iGameStatus;
      }
      
      private function updatePlayerStatus(objPlayer:Object, objNewStatus:Object) : void
      {
         var stateData:Object = null;
         var userStatus:Object = null;
         var classCount:int = int(objNewStatus.m_byClassCount);
         objPlayer.m_iGameStatus = this.getGameStatusFromPlayerStatus(objNewStatus);
         if(classCount > 0)
         {
            stateData = objNewStatus.m_stStateData[classCount - 1];
            if(stateData != null)
            {
               if(stateData.m_cClass == a_1755.a_523)
               {
                  if(stateData.logicState.m_cRoomCount > 0)
                  {
                     userStatus = stateData.logicState.m_arrStatus[0];
                     objPlayer.m_UserStatus = userStatus;
                     return;
                  }
               }
            }
         }
         objPlayer.m_UserStatus = null;
      }
      
      public function updateBeFriends(notify:a_2672) : void
      {
         if(this.a_817 == null)
         {
            this.a_817 = new Dictionary();
         }
         var data:Object = this.a_817[notify.m_iUIN];
         if(data == null)
         {
            data = new Object();
            this.a_817[notify.m_iUIN] = data;
            data.m_iGameStatus = a_1750.enm_OnlineStatus;
         }
         data.m_iRoleUin = notify.m_iUIN;
         data.m_szRoleName = notify.m_szNick;
         if(data.m_szRoleName == null)
         {
            data.m_szRoleName = data.m_iUIN;
         }
         data.m_iUserSex = notify.m_cGender;
         data.m_UserStatus = null;
         data.m_iType = 1;
      }
      
      public function updateFriendGameInfo(iUin:int, gamedata:a_2745) : void
      {
         var objFriend:Object = null;
         var objBeFriend:Object = null;
         if(this.a_808 != null)
         {
            if(this.a_808[iUin] != undefined || this.a_808[iUin] != null)
            {
               objFriend = this.a_808[iUin];
               objFriend.m_iGamePoint = gamedata.m_iPoint;
               objFriend.m_iVsExp = gamedata.m_iExperiencePoint;
               objFriend.m_iVsScore = gamedata.m_iAchievement;
            }
         }
         if(this.a_817 != null)
         {
            if(this.a_817[iUin] != undefined || this.a_817[iUin] != null)
            {
               objBeFriend = this.a_817[iUin];
               objBeFriend.m_iGamePoint = gamedata.m_iPoint;
               objBeFriend.m_iVsExp = gamedata.m_iExperiencePoint;
               objBeFriend.m_iVsScore = gamedata.m_iAchievement;
            }
         }
      }
      
      public function getFriendByUin(iUin:int) : Object
      {
         if(this.a_808 == null)
         {
            return null;
         }
         return this.a_808[iUin];
      }
      
      public function addNewFriend(addFriend:Object) : void
      {
         if(this.a_808 == null)
         {
            this.a_808 = new Dictionary();
         }
         var newFriend:Object = new Object();
         newFriend.m_iRoleUin = addFriend.m_stFriendInfo.m_iUIN;
         newFriend.m_szRoleName = addFriend.m_stFriendInfo.m_szNick;
         newFriend.m_iUserSex = addFriend.m_stFriendInfo.m_cGender;
         newFriend.m_iGroupFlag = addFriend.m_iGroupFlag;
         newFriend.m_iGameStatus = a_1750.enm_OnlineStatus;
         this.a_808[newFriend.m_iRoleUin] = newFriend;
         a_2150.e.onPositiveFriendsChange();
      }
      
      public function updateFriendHeroInfo(heroInfo:Object) : void
      {
         var obj:Object = null;
         if(heroInfo.m_nResultID == 0 && this.a_808 != null)
         {
            obj = this.a_808[heroInfo.m_iSrcUin];
            if(obj != null)
            {
               obj.m_iUserSex = heroInfo.m_cUserSex;
               obj.m_iHeroAttack = heroInfo.m_iHeroAttack;
               obj.m_iHeroDefense = heroInfo.m_iHeroDefense;
            }
         }
      }
      
      public function updateFriendByDel(data:Object) : void
      {
         if(data.m_nResultID == 0)
         {
            delete this.a_808[data.m_iFriendUIN];
            a_2150.e.onPositiveFriendsChange();
         }
         else
         {
            a_2150.e.onDelFriendFaild(data.m_szReasonMessage);
         }
      }
      
      public function GetPositiveFriends() : Dictionary
      {
         return this.a_808;
      }
      
      public function GetBeFriends() : Dictionary
      {
         return this.a_817;
      }
      
      public function setUserRoleList(arrRoleList:Array) : void
      {
         var cRole:Object = null;
         var iUin:* = undefined;
         var role:a_4463 = null;
         if(this.a_809 == null)
         {
            this.a_809 = new Dictionary();
         }
         else
         {
            for(iUin in this.a_809)
            {
               delete this.a_809[iUin];
            }
         }
         for each(cRole in arrRoleList)
         {
            role = new a_4463();
            role.m_cState = cRole.m_cState;
            role.m_iRoleUin = cRole.m_iRoleUin;
            role.m_szRoleName = cRole.m_szRoleName;
            role.m_iLogicServerID = cRole.m_iLogicServerID;
            role.m_iRoomID = cRole.m_iRoomID;
            role.m_iLastLoginTime = cRole.m_iLastLoginTime;
            this.a_809[cRole.m_iRoleUin] = role;
         }
      }
      
      public function getUserRoleList() : Array
      {
         var index:int = 0;
         var role:Object = null;
         var arrRoleList:Array = [];
         if(this.a_809 != null)
         {
            index = 0;
            for each(role in this.a_809)
            {
               arrRoleList[index] = role;
               index++;
            }
         }
         return arrRoleList;
      }
      
      public function setUserRole(roleInfoResponse:Object) : void
      {
         var arrEquipmentCards:Array = null;
         var arrHeroItemID:Array = null;
         var dictHeroItem:Dictionary = null;
         var iHero:a_4461 = null;
         var hero:Object = null;
         var avatarItem:a_4461 = null;
         var heroItem:a_4461 = null;
         var cardAttr:a_3228 = null;
         var iHeroItem:a_4461 = null;
         var systemTime:int = 0;
         var attr:a_3228 = null;
         var iRoleUin:int = int(roleInfoResponse.m_iRoleUin);
         var role:a_4463 = this.a_809[iRoleUin];
         if(role != null)
         {
            role.m_dictHeroDetail = new Dictionary();
            role.m_szHeroItemString = roleInfoResponse.m_szHeroItemString;
            role.m_iUserSex = roleInfoResponse.m_iUserSex;
            role.m_iGamePoint = roleInfoResponse.m_iGamePoint;
            role.m_iGameScore = roleInfoResponse.m_iGameScore;
            role.m_iVsExp = roleInfoResponse.m_iVsExp;
            role.m_iVsScore = roleInfoResponse.m_iVsScore;
            role.m_byShowCard = roleInfoResponse.m_byShowCard;
            arrEquipmentCards = role.a_951;
            if(arrEquipmentCards != null)
            {
               arrEquipmentCards.splice(0);
            }
            if(role.m_arrHeroItemID != null)
            {
               role.m_arrHeroItemID.splice(0);
            }
            arrHeroItemID = [];
            if(role.m_szHeroItemString != null)
            {
               arrHeroItemID = role.formatItems(role.m_szHeroItemString);
            }
            dictHeroItem = new Dictionary();
            for each(iHero in arrHeroItemID)
            {
               dictHeroItem[iHero.ID] = iHero;
            }
            for each(hero in roleInfoResponse.m_arrHeroInfo)
            {
               heroItem = new a_4461();
               if(hero.m_arrExtraAttr != null && hero.m_arrExtraAttr.length > 0)
               {
                  this.updateHeroItemAttr(heroItem,hero.m_arrExtraAttr);
               }
               heroItem.m_iUsedTime = hero.m_iUsedTime;
               heroItem.m_iItemID = hero.m_iItemID;
               heroItem.m_iItemSeq = hero.m_iItemSeq;
               heroItem.m_nItemPosition = hero.m_nItemPosition;
               heroItem.m_nItemUsedCount = hero.m_nItemUsedCount;
               heroItem.m_nItemSlotNum = hero.m_nItemSlotNum;
               heroItem.m_cIsBind = hero.m_cIsBind;
               heroItem.m_cItemColor = hero.m_cItemColor;
               heroItem.m_nItemCount = hero.m_nItemCount;
               heroItem.m_iDeltaTime = hero.m_iDeltaTime;
               role.m_dictHeroDetail[heroItem.ID] = heroItem;
               if(dictHeroItem[heroItem.ID] == null)
               {
                  cardAttr = this.transformHeroItemToCards(heroItem);
                  role.a_951.push(cardAttr);
               }
            }
            role.m_iRoleUin = roleInfoResponse.m_iRoleUin;
            role.m_iRoleAttack = roleInfoResponse.m_iRoleAttack;
            role.m_iRoleDefense = roleInfoResponse.m_iRoleDefense;
            role.m_iRoleScore = roleInfoResponse.m_iRoleScore;
            for each(avatarItem in arrHeroItemID)
            {
               iHeroItem = role.m_dictHeroDetail[avatarItem.ID];
               systemTime = a_1767.getInstance().SystemTime;
               if(iHeroItem != null)
               {
                  if(iHeroItem.m_iUsedTime != -2 && iHeroItem.m_iUsedTime != -1 && iHeroItem.m_iUsedTime < systemTime)
                  {
                     attr = this.transformHeroItemToCards(iHeroItem);
                     role.a_951.push(attr);
                  }
                  else
                  {
                     role.m_arrHeroItemID.push(iHeroItem);
                  }
               }
            }
            role.m_szHeroItemString = role.toAvatarContent();
         }
      }
      
      public function handlerStroeBoxInfo(response:CResponseGetStroeBoxInfo) : void
      {
         var role:a_4463 = null;
         var m_dictDesc:Dictionary = null;
         var i:int = 0;
         var vo:StroeBoxRes = null;
         var hero:CHeroItem = null;
         var heroItem:a_4461 = null;
         var cardAttr:a_3228 = null;
         if(response.m_nResultID == 0)
         {
            role = this.GetCurrentRole() as a_4463;
            m_dictDesc = a_2027.getInstance().m_dictDesc;
            for(i = 0; i < response.m_arrStroeBoxInfo.length; i++)
            {
               vo = response.m_arrStroeBoxInfo[i];
               StorageBagConfig.GetInstance().getStorageBag(i).m_arrCardInfos = [];
               StorageBagConfig.GetInstance().getStorageBag(i).iCurStoreCount = vo.iStoreCount;
               StorageBagConfig.GetInstance().getStorageBag(i).iStoreName = vo.iStoreName;
               for each(hero in vo.m_arrCardInfos)
               {
                  heroItem = new a_4461();
                  if(hero.m_arrExtraAttr != null && hero.m_arrExtraAttr.length > 0)
                  {
                     this.updateStoreHeroItemAttr(heroItem,hero.m_arrExtraAttr);
                  }
                  heroItem.m_iUsedTime = hero.m_iUsedTime;
                  heroItem.m_iItemID = hero.m_iItemID;
                  heroItem.m_iItemSeq = hero.m_iItemSeq;
                  heroItem.m_nItemPosition = hero.m_nItemPosition;
                  heroItem.m_nItemUsedCount = hero.m_nItemUsedCount;
                  heroItem.m_nItemSlotNum = hero.m_nItemSlotNum;
                  heroItem.m_cIsBind = hero.m_cIsBind;
                  heroItem.m_cItemColor = hero.m_cItemColor;
                  heroItem.m_nItemCount = hero.m_nItemCount;
                  heroItem.m_iDeltaTime = hero.m_iDeltaTime;
                  cardAttr = this.transformHeroItemToCards(heroItem);
                  if(m_dictDesc != null && m_dictDesc[cardAttr.CardID] != null)
                  {
                     cardAttr.UseNumber = m_dictDesc[cardAttr.CardID].Use;
                  }
                  StorageBagConfig.GetInstance().getStorageBag(i).m_arrCardInfos.push(cardAttr);
               }
            }
         }
      }
      
      public function updateNotifyStoreBoxCards(stroeBoxInfo:Vector.<StroeBoxRes>) : void
      {
         var notifyUpdate:CHeroItem = null;
         var vo:StroeBoxRes = null;
         var CardID:int = 0;
         var CardSeq:int = 0;
         var ID:String = null;
         var arrDef:Array = null;
         var cardAttr:a_3228 = null;
         var heroItem:a_4461 = null;
         var dictStoreBoxNotify:Dictionary = null;
         var index:* = 0;
         var m_dictDesc:Dictionary = a_2027.getInstance().m_dictDesc;
         for(var i:int = 0; i < stroeBoxInfo.length; i++)
         {
            vo = stroeBoxInfo[i];
            if(vo.m_arrCardInfos.length != 0)
            {
               for each(notifyUpdate in vo.m_arrCardInfos)
               {
                  CardID = notifyUpdate.m_iItemID;
                  CardSeq = notifyUpdate.m_iItemSeq;
                  ID = CardID + "-" + CardSeq;
                  if(dictStoreBoxNotify == null)
                  {
                     dictStoreBoxNotify = new Dictionary();
                  }
                  dictStoreBoxNotify[ID] = notifyUpdate;
               }
               if(dictStoreBoxNotify != null)
               {
                  arrDef = StorageBagConfig.GetInstance().getStorageBag(i).m_arrCardInfos.concat();
                  for each(cardAttr in arrDef)
                  {
                     notifyUpdate = dictStoreBoxNotify[cardAttr.ID];
                     if(notifyUpdate != null)
                     {
                        cardAttr.CardCount = notifyUpdate.m_nItemCount;
                        cardAttr.CardPositionID = notifyUpdate.m_nItemPosition;
                        if(cardAttr.CardCount == 0)
                        {
                           StorageBagConfig.GetInstance().getStorageBag(i).m_arrCardInfos.splice(index,1);
                           index--;
                        }
                        delete dictStoreBoxNotify[cardAttr.ID];
                     }
                     index++;
                  }
                  for each(notifyUpdate in dictStoreBoxNotify)
                  {
                     heroItem = new a_4461();
                     if(notifyUpdate.m_arrExtraAttr != null && notifyUpdate.m_arrExtraAttr.length > 0)
                     {
                        this.updateStoreHeroItemAttr(heroItem,notifyUpdate.m_arrExtraAttr);
                     }
                     heroItem.m_iUsedTime = notifyUpdate.m_iUsedTime;
                     heroItem.m_iItemID = notifyUpdate.m_iItemID;
                     heroItem.m_iItemSeq = notifyUpdate.m_iItemSeq;
                     heroItem.m_nItemPosition = notifyUpdate.m_nItemPosition;
                     heroItem.m_nItemUsedCount = notifyUpdate.m_nItemUsedCount;
                     heroItem.m_nItemSlotNum = notifyUpdate.m_nItemSlotNum;
                     heroItem.m_cIsBind = notifyUpdate.m_cIsBind;
                     heroItem.m_cItemColor = notifyUpdate.m_cItemColor;
                     heroItem.m_nItemCount = notifyUpdate.m_nItemCount;
                     heroItem.m_iDeltaTime = notifyUpdate.m_iDeltaTime;
                     cardAttr = this.transformHeroItemToCards(heroItem);
                     if(m_dictDesc != null && m_dictDesc[cardAttr.CardID] != null)
                     {
                        cardAttr.UseNumber = m_dictDesc[cardAttr.CardID].Use;
                     }
                     StorageBagConfig.GetInstance().getStorageBag(i).m_arrCardInfos.push(cardAttr);
                  }
                  a_1825.e.onNotifyStoreBoxChange(StorageBagConfig.GetInstance().getStorageBag(i).m_arrCardInfos,i);
               }
            }
         }
      }
      
      public function updateNotifyPackageByStore(arrCardItem:Array) : void
      {
         var notifyUpdate:CHeroItem = null;
         var CardID:int = 0;
         var CardSeq:int = 0;
         var ID:String = null;
         if(arrCardItem.length == 0)
         {
            return;
         }
         var dictDefNotify:Dictionary = null;
         var dictPropsNotify:Dictionary = null;
         var dictOtherNotify:Dictionary = null;
         var dictHeroNotify:Dictionary = null;
         for each(notifyUpdate in arrCardItem)
         {
            CardID = notifyUpdate.m_iItemID;
            CardSeq = notifyUpdate.m_iItemSeq;
            ID = CardID + "-" + CardSeq;
            if((CardID & 0xFF000000) == 285212672)
            {
               if(dictDefNotify == null)
               {
                  dictDefNotify = new Dictionary();
               }
               dictDefNotify[ID] = notifyUpdate;
            }
            else if((CardID & 0xFF000000) == 301989888)
            {
               if(dictPropsNotify == null)
               {
                  dictPropsNotify = new Dictionary();
               }
               dictPropsNotify[ID] = notifyUpdate;
            }
            else if((CardID & 0xFF000000) == 318767104)
            {
               if(dictOtherNotify == null)
               {
                  dictOtherNotify = new Dictionary();
               }
               dictOtherNotify[ID] = notifyUpdate;
            }
            else if((CardID & 0xFF000000) == 335544320)
            {
               if(dictHeroNotify == null)
               {
                  dictHeroNotify = new Dictionary();
               }
               dictHeroNotify[ID] = notifyUpdate;
            }
         }
         this.processCardUpdates(this.a_806[0],dictDefNotify,0);
         this.processCardUpdates(this.a_806[1],dictPropsNotify,1);
         this.processCardUpdates(this.a_806[2],dictOtherNotify,2,Boolean(dictHeroNotify == null));
         if(dictHeroNotify)
         {
            this.processHeroCardUpdates(dictHeroNotify);
         }
      }
      
      private function processCardUpdates(arrCards:Array, dictUpdates:Dictionary, notificationType:int, isNotify:Boolean = true) : void
      {
         var card:a_3228 = null;
         var idsToRemove:Array = null;
         var update:CHeroItem = null;
         var removedIds:Object = null;
         var id:String = null;
         var i:* = 0;
         var ID:String = null;
         var newCard:a_3228 = null;
         if(dictUpdates == null)
         {
            return;
         }
         var cardMap:Object = {};
         var m_dictDesc:Dictionary = a_2027.getInstance().m_dictDesc;
         for each(card in arrCards.concat())
         {
            cardMap[card.ID] = card;
         }
         idsToRemove = [];
         for each(update in dictUpdates)
         {
            ID = update.m_iItemID + "-" + update.m_iItemSeq;
            card = cardMap[ID];
            if(card)
            {
               card.CardCount = update.m_nItemCount;
               card.CardPositionID = update.m_nItemPosition;
               if(card.CardCount == 0)
               {
                  idsToRemove.push(card.ID);
               }
               delete dictUpdates[ID];
            }
         }
         removedIds = {};
         for each(id in idsToRemove)
         {
            removedIds[id] = true;
         }
         for(i = int(arrCards.length - 1); i >= 0; i--)
         {
            if(removedIds[arrCards[i].ID])
            {
               arrCards.splice(i,1);
            }
         }
         for each(update in dictUpdates)
         {
            newCard = this.transformHeroItemToCards(this.createHeroItem(update));
            if(m_dictDesc != null && m_dictDesc[newCard.CardID] != null && notificationType == 0)
            {
               newCard.UseNumber = m_dictDesc[newCard.CardID].Use;
            }
            arrCards.push(newCard);
         }
         switch(notificationType)
         {
            case 0:
               a_1825.e.onNotifyDefCardsChange(arrCards);
               break;
            case 1:
               a_1825.e.onNotifyPropsCardsChange(arrCards);
               break;
            case 2:
               if(isNotify)
               {
                  this.dealEquipmentCards(true,true);
               }
         }
      }
      
      private function processHeroCardUpdates(dictUpdates:Dictionary) : void
      {
         var update:CHeroItem = null;
         var ID:String = null;
         var heroItem:a_4461 = null;
         var item:a_4461 = null;
         var role:a_4463 = this.GetCurrentRole() as a_4463;
         var dictHeroDetail:Dictionary = role.m_dictHeroDetail;
         var a_951:Array = role.a_951;
         var m_arrHeroCards:Array = role.m_arrHeroItemID;
         var index:int = 0;
         for each(update in dictUpdates)
         {
            ID = update.m_iItemID + "-" + update.m_iItemSeq;
            heroItem = dictHeroDetail[ID];
            if(heroItem)
            {
               heroItem.m_nItemCount = update.m_nItemCount;
               heroItem.m_nItemPosition = update.m_nItemPosition;
               if(heroItem.m_nItemCount == 0)
               {
                  delete dictHeroDetail[heroItem.ID];
               }
               this.updateCardAttributes(a_951,heroItem);
               index = 0;
               for each(item in m_arrHeroCards)
               {
                  if(item.ID == heroItem.ID)
                  {
                     if(heroItem.m_nItemCount == 0)
                     {
                        m_arrHeroCards.splice(index,1);
                     }
                     else
                     {
                        item.m_nItemCount = heroItem.m_nItemCount;
                        item.m_iItemID = heroItem.m_iItemID;
                        item.m_nItemPosition = heroItem.m_nItemPosition;
                        item.m_iItemSeq = heroItem.m_iItemSeq;
                        item.m_cIsBind = heroItem.m_cIsBind;
                        item.m_iUsedTime = heroItem.m_iUsedTime;
                        item.m_iDeltaTime = heroItem.m_iDeltaTime;
                        item.m_iType = heroItem.m_iType;
                        item.m_iTypeValue = heroItem.m_iTypeValue;
                     }
                     break;
                  }
                  index++;
               }
               delete dictUpdates[ID];
            }
         }
         for each(update in dictUpdates)
         {
            heroItem = this.createHeroItem(update);
            dictHeroDetail[heroItem.ID] = heroItem;
            a_951.push(this.transformHeroItemToCards(heroItem));
         }
         this.dealEquipmentCards(true,true);
      }
      
      private function createHeroItem(update:CHeroItem) : a_4461
      {
         var heroItem:a_4461 = new a_4461();
         if(update.m_arrExtraAttr != null && update.m_arrExtraAttr.length > 0)
         {
            this.updateStoreHeroItemAttr(heroItem,update.m_arrExtraAttr);
         }
         this.updateHeroItem(heroItem,update);
         return heroItem;
      }
      
      private function updateHeroItem(heroItem:a_4461, update:CHeroItem) : void
      {
         heroItem.m_iUsedTime = update.m_iUsedTime;
         heroItem.m_iItemID = update.m_iItemID;
         heroItem.m_iItemSeq = update.m_iItemSeq;
         heroItem.m_nItemPosition = update.m_nItemPosition;
         heroItem.m_nItemUsedCount = update.m_nItemUsedCount;
         heroItem.m_nItemSlotNum = update.m_nItemSlotNum;
         heroItem.m_cIsBind = update.m_cIsBind;
         heroItem.m_cItemColor = update.m_cItemColor;
         heroItem.m_nItemCount = update.m_nItemCount;
         heroItem.m_iDeltaTime = update.m_iDeltaTime;
      }
      
      private function updateCardAttributes(arrCards:Array, heroItem:a_4461) : void
      {
         var attr:a_3228 = null;
         var index:int = 0;
         for each(attr in arrCards)
         {
            if(attr.ID == heroItem.ID)
            {
               if(heroItem.m_nItemCount == 0)
               {
                  arrCards.splice(index,1);
               }
               else
               {
                  attr.CardCount = heroItem.m_nItemCount;
                  attr.CardID = heroItem.m_iItemID;
                  attr.CardPositionID = heroItem.m_nItemPosition;
                  attr.CardSeq = heroItem.m_iItemSeq;
                  attr.IsBind = heroItem.m_cIsBind;
                  attr.ExpiredTime = heroItem.m_iUsedTime;
                  attr.DeltaTime = heroItem.m_iDeltaTime;
                  attr.Type = heroItem.m_iType;
                  attr.TypeValue = heroItem.m_iTypeValue;
                  attr.DictExtraAttr = heroItem.m_dictExtraAttr;
                  attr.m_arrExtraAttr = heroItem.m_arrExtraAttr;
               }
               break;
            }
            index++;
         }
      }
      
      private function updateStoreHeroItemAttr(heroItem:a_4461, arrExtraAttr:Array) : void
      {
         var itemExtra:Object = null;
         var itemType:int = 0;
         var itemTypeValue:int = 0;
         var dictExtraAttr:Dictionary = heroItem.m_dictExtraAttr;
         for each(itemExtra in arrExtraAttr)
         {
            itemType = int(itemExtra.m_cItemType);
            itemTypeValue = int(itemExtra.m_iItemAdd);
            if(itemType != 7)
            {
               heroItem.m_iType = itemType;
               heroItem.m_iTypeValue = itemTypeValue;
            }
            dictExtraAttr[itemType] = itemTypeValue;
         }
         heroItem.m_arrExtraAttr = Tool.a_4653(arrExtraAttr) as Array;
      }
      
      public function updateUserRoleItem(iRoleUin:int, szHeroItemString:String) : void
      {
         var arrHeroItemID:Array = null;
         var dictHeroItem:Dictionary = null;
         var iHero:a_4461 = null;
         var heroItem:a_4461 = null;
         var avatarItem:a_4461 = null;
         var cardAttr:a_3228 = null;
         var iHeroItem:a_4461 = null;
         var systemTime:int = 0;
         var attr:a_3228 = null;
         var role:a_4463 = this.a_809[iRoleUin];
         if(role != null)
         {
            role.m_szHeroItemString = szHeroItemString;
            arrHeroItemID = [];
            if(role.m_szHeroItemString != null)
            {
               arrHeroItemID = role.formatItems(role.m_szHeroItemString);
            }
            if(role.m_arrHeroItemID != null)
            {
               role.m_arrHeroItemID.splice(0);
            }
            dictHeroItem = new Dictionary();
            for each(iHero in arrHeroItemID)
            {
               dictHeroItem[iHero.ID] = iHero;
            }
            if(role.a_951 != null)
            {
               role.a_951.splice(0);
            }
            for each(heroItem in role.m_dictHeroDetail)
            {
               if(dictHeroItem[heroItem.ID] == null)
               {
                  cardAttr = this.transformHeroItemToCards(heroItem);
                  role.a_951.push(cardAttr);
               }
            }
            for each(avatarItem in arrHeroItemID)
            {
               iHeroItem = role.m_dictHeroDetail[avatarItem.ID];
               systemTime = a_1767.getInstance().SystemTime;
               if(iHeroItem != null)
               {
                  if(iHeroItem.m_iUsedTime != -2 && iHeroItem.m_iUsedTime != -1 && iHeroItem.m_iUsedTime < systemTime)
                  {
                     attr = this.transformHeroItemToCards(iHeroItem);
                     role.a_951.push(attr);
                  }
                  else
                  {
                     role.m_arrHeroItemID.push(iHeroItem);
                  }
               }
            }
            role.m_szHeroItemString = role.toAvatarContent();
         }
         this.dealEquipmentCards(false);
         a_1825.e.onNotifyRoleItemChange(role);
      }
      
      public function updateCurrentShowCard(iShowCard:int) : void
      {
         var role:a_4463 = this.GetCurrentRole() as a_4463;
         role.m_byShowCard = iShowCard;
      }
      
      private function transformHeroItemToCards(iHeroItem:a_4461) : a_3228
      {
         var i:int = 0;
         var attr:a_3228 = new a_3228();
         attr.CardCount = iHeroItem.m_nItemCount;
         attr.CardID = iHeroItem.m_iItemID;
         attr.CardPositionID = iHeroItem.m_nItemPosition;
         attr.CardSeq = iHeroItem.m_iItemSeq;
         attr.IsBind = iHeroItem.m_cIsBind;
         attr.ExpiredTime = iHeroItem.m_iUsedTime;
         attr.Type = iHeroItem.m_iType;
         attr.TypeValue = iHeroItem.m_iTypeValue;
         if(iHeroItem.m_arrExtraAttr != null)
         {
            for(i = 0; i < iHeroItem.m_arrExtraAttr.length; i++)
            {
               if(iHeroItem.m_arrExtraAttr[i].m_cItemType == 7)
               {
                  attr.GradeLevel = iHeroItem.m_arrExtraAttr[i].m_iItemAdd;
                  break;
               }
            }
         }
         attr.DictExtraAttr = Tool.a_4653(iHeroItem.m_dictExtraAttr) as Dictionary;
         attr.m_arrExtraAttr = Tool.a_4653(iHeroItem.m_arrExtraAttr) as Array;
         attr.DeltaTime = iHeroItem.m_iDeltaTime;
         attr.m_nItemSlotNum = iHeroItem.m_nItemSlotNum;
         var m_dictDesc:Dictionary = a_2027.getInstance().m_dictDesc;
         if(m_dictDesc != null && m_dictDesc[attr.CardID] != null)
         {
            attr.Name = m_dictDesc[attr.CardID].Name;
         }
         return attr;
      }
      
      public function addCreateUserRole(createRoleResponse:Object) : void
      {
         var arrHeroItemID:Array = null;
         var upHeroItem:Object = null;
         var avatarItem:a_4461 = null;
         var heroItem:a_4461 = null;
         var iHeroItem:a_4461 = null;
         var systemTime:int = 0;
         var attr:a_3228 = null;
         if(this.a_809 == null)
         {
            this.a_809 = new Dictionary();
         }
         this.m_currentRoleUin = createRoleResponse.m_iRoleUin;
         var role:a_4463 = this.a_809[this.m_currentRoleUin];
         if(role == null)
         {
            role = new a_4463();
            role.m_dictHeroDetail = new Dictionary();
            role.m_szHeroItemString = createRoleResponse.m_szItemString;
            role.m_iUserSex = createRoleResponse.m_cHeroSex;
            role.m_byShowCard = 1;
            role.m_iGamePoint = 0;
            role.m_iGameScore = 0;
            arrHeroItemID = [];
            if(role.m_szHeroItemString != null)
            {
               arrHeroItemID = role.formatItems(role.m_szHeroItemString);
            }
            for each(upHeroItem in createRoleResponse.m_arrUpdateHeroInfo)
            {
               heroItem = new a_4461();
               heroItem.m_iType = upHeroItem.m_iType;
               heroItem.m_iTypeValue = upHeroItem.m_iTypeValue;
               heroItem.m_iUsedTime = upHeroItem.m_iUsedTime;
               heroItem.m_iItemID = upHeroItem.m_iItemID;
               heroItem.m_iItemSeq = upHeroItem.m_iItemSeq;
               heroItem.m_nItemPosition = -1;
               heroItem.m_nItemUsedCount = upHeroItem.m_nItemUsedCount;
               heroItem.m_cIsBind = upHeroItem.m_cIsBind;
               heroItem.m_cItemColor = upHeroItem.m_cItemColor;
               role.m_dictHeroDetail[heroItem.ID] = heroItem;
            }
            for each(avatarItem in arrHeroItemID)
            {
               iHeroItem = role.m_dictHeroDetail[avatarItem.ID];
               systemTime = a_1767.getInstance().SystemTime;
               if(iHeroItem != null)
               {
                  if(iHeroItem.m_iUsedTime != -2 && iHeroItem.m_iUsedTime != -1 && iHeroItem.m_iUsedTime < systemTime)
                  {
                     attr = this.transformHeroItemToCards(iHeroItem);
                     role.a_951.push(attr);
                  }
                  else
                  {
                     role.m_arrHeroItemID.push(iHeroItem);
                  }
               }
            }
            role.m_szHeroItemString = role.toAvatarContent();
            role.m_iRoleUin = createRoleResponse.m_iRoleUin;
            role.m_szRoleName = createRoleResponse.m_szRoleName;
            role.m_iRoleScore = createRoleResponse.m_iHeroScore;
            role.m_iRoleAttack = createRoleResponse.m_iHeroAttack;
            role.m_iRoleDefense = createRoleResponse.m_iHeroDefense;
            this.a_809[this.m_currentRoleUin] = role;
         }
      }
      
      public function getUserRole(roleUin:int) : Object
      {
         return this.a_809[roleUin];
      }
      
      public function GetCurrentRole() : Object
      {
         return this.a_809[this.m_currentRoleUin];
      }
      
      public function setLobbyRoomUser(arrRoomUser:Array) : void
      {
         var arrMembers:Array = null;
         var roomPlayer:Object = null;
         var iPlayerID:* = undefined;
         var playerInfo:Object = null;
         var friendData:Object = null;
         var member:Object = null;
         if(this.a_811 == null)
         {
            this.a_811 = new Dictionary();
         }
         else
         {
            for(iPlayerID in this.a_811)
            {
               delete this.a_811[iPlayerID];
            }
         }
         arrMembers = this.getConsortiaMembers();
         for each(roomPlayer in arrRoomUser)
         {
            playerInfo = {};
            playerInfo.m_iRoleUin = roomPlayer.m_iUin;
            playerInfo.m_szRoleName = roomPlayer.m_szPlayerName;
            playerInfo.m_iUserSex = roomPlayer.m_nFlag & 3;
            playerInfo.m_iIdentity = roomPlayer.m_iIdentity;
            playerInfo.m_iPlayerID = roomPlayer.m_iPlayerID;
            playerInfo.m_iTableID = roomPlayer.m_iTableID;
            playerInfo.m_bySeat = roomPlayer.m_bySeat;
            playerInfo.m_byStatus = roomPlayer.m_byStatus;
            playerInfo.m_iVsExp = roomPlayer.m_iExperiencePoint;
            playerInfo.m_iVsScore = roomPlayer.m_iAchievement;
            playerInfo.m_iGamePoint = roomPlayer.m_iPoint;
            playerInfo.m_iWinRound = roomPlayer.m_iWinRound;
            playerInfo.m_iLoseRound = roomPlayer.m_iLoseRound;
            playerInfo.m_iDrawRound = roomPlayer.m_iDrawRound;
            playerInfo.m_iConsortiaID = roomPlayer.m_iConsortiaID;
            playerInfo.m_aryServiceTime = roomPlayer.m_aryServiceTime;
            playerInfo.m_iVipLevel = this.getVipLevel(roomPlayer.m_iVipScore);
            this.a_811[playerInfo.m_iPlayerID] = playerInfo;
            if(this.a_808 == null)
            {
               this.a_808 = new Dictionary();
            }
            friendData = this.a_808[roomPlayer.m_iUin];
            if(friendData != null)
            {
               friendData.m_iRoleUin = playerInfo.m_iRoleUin;
               friendData.m_szRoleName = playerInfo.m_szRoleName;
               friendData.m_iUserSex = playerInfo.m_iUserSex;
               friendData.m_iGamePoint = playerInfo.m_iGamePoint;
               friendData.m_iVsExp = playerInfo.m_iVsExp;
               friendData.m_iVsScore = playerInfo.m_iVsScore;
               friendData.m_aryServiceTime = playerInfo.m_aryServiceTime;
               friendData.m_iVipLevel = playerInfo.m_iVipLevel;
               a_2608.getInstance().setPlayerCommonData(friendData.m_iRoleUin,friendData);
            }
            for each(member in arrMembers)
            {
               if(member.m_iUIN == playerInfo.m_iUin)
               {
                  member.m_aryServiceTime = playerInfo.m_aryServiceTime;
                  member.m_iPoint = playerInfo.m_iGamePoint;
                  member.m_iVsExp = playerInfo.m_iVsExp;
                  member.m_iVipLevel = playerInfo.m_iVipLevel;
               }
            }
         }
      }
      
      public function addEnterRoomUser(enterPlayer:Object) : void
      {
         var playerInfo:Object = null;
         var arrMembers:Array = null;
         var friendData:Object = null;
         var member:Object = null;
         if(this.a_811 != null && enterPlayer != null)
         {
            playerInfo = this.a_811[enterPlayer.m_iPlayerID];
            arrMembers = this.getConsortiaMembers();
            if(playerInfo == null)
            {
               playerInfo = {};
               playerInfo.m_iRoleUin = enterPlayer.m_iUin;
               playerInfo.m_szRoleName = enterPlayer.m_szPlayerName;
               playerInfo.m_iUserSex = enterPlayer.m_nFlag & 3;
               playerInfo.m_iIdentity = enterPlayer.m_iIdentity;
               playerInfo.m_iPlayerID = enterPlayer.m_iPlayerID;
               playerInfo.m_iTableID = enterPlayer.m_iTableID;
               playerInfo.m_bySeat = enterPlayer.m_bySeat;
               playerInfo.m_byStatus = enterPlayer.m_byStatus;
               playerInfo.m_iVsExp = enterPlayer.m_iExperiencePoint;
               playerInfo.m_iVsScore = enterPlayer.m_iAchievement;
               playerInfo.m_iGamePoint = enterPlayer.m_iPoint;
               playerInfo.m_iWinRound = enterPlayer.m_iWinRound;
               playerInfo.m_iLoseRound = enterPlayer.m_iLoseRound;
               playerInfo.m_iDrawRound = enterPlayer.m_iDrawRound;
               playerInfo.m_iConsortiaID = enterPlayer.m_iConsortiaID;
               playerInfo.m_aryServiceTime = enterPlayer.m_i51VIPScore;
               playerInfo.m_iVipLevel = this.getVipLevel(enterPlayer.m_iGameVIPLevel);
               this.a_811[playerInfo.m_iPlayerID] = playerInfo;
               friendData = this.a_808[enterPlayer.m_iUin];
               if(friendData != null)
               {
                  friendData.m_iRoleUin = playerInfo.m_iRoleUin;
                  friendData.m_szRoleName = playerInfo.m_szRoleName;
                  friendData.m_iUserSex = playerInfo.m_iUserSex;
                  friendData.m_iGamePoint = playerInfo.m_iGamePoint;
                  friendData.m_iVsExp = playerInfo.m_iVsExp;
                  friendData.m_iVsScore = playerInfo.m_iVsScore;
                  friendData.m_aryServiceTime = playerInfo.m_aryServiceTime;
                  friendData.m_iVipLevel = playerInfo.m_iVipLevel;
                  a_2608.getInstance().setPlayerCommonData(friendData.m_iRoleUin,friendData);
               }
               for each(member in arrMembers)
               {
                  if(member.m_iUIN == playerInfo.m_iUin)
                  {
                     member.m_aryServiceTime = playerInfo.m_aryServiceTime;
                     member.m_iPoint = playerInfo.m_iGamePoint;
                     member.m_iVsExp = playerInfo.m_iVsExp;
                     member.m_iVipLevel = playerInfo.m_iVipLevel;
                  }
               }
            }
         }
      }
      
      public function removeExitRoomUser(iPlayerID:int) : void
      {
         if(this.a_811 != null)
         {
            delete this.a_811[iPlayerID];
         }
      }
      
      public function updateRoomUser(iPlayerID:int, iTableID:int, iStauts:int) : void
      {
         var playerInfo:Object = null;
         if(this.a_811 != null)
         {
            playerInfo = this.a_811[iPlayerID];
            if(playerInfo != null)
            {
               if(iStauts == EnmRoomEventID.room_event_sitdown)
               {
                  playerInfo.m_iTableID = iTableID;
               }
               else
               {
                  playerInfo.m_iTableID = -1;
               }
            }
         }
      }
      
      public function getRoomUserList() : Dictionary
      {
         return this.a_811;
      }
      
      public function updateActiveService(arrUseService:Array) : void
      {
         this.a_815 = arrUseService;
         a_1825.e.onNotifyUseService(this.a_815);
      }
      
      public function GetUseService() : Array
      {
         return this.a_815;
      }
      
      public function updateSkillPoint(arrUpdateSkillPoint:Array) : void
      {
         var dict:Dictionary = null;
         var arrSkillBooks:Array = null;
         var update:CUpdateSkillPoint = null;
         var skill:a_2855 = null;
         var up:CUpdateSkillPoint = null;
         if(this.a_806 != null)
         {
            dict = new Dictionary();
            arrSkillBooks = this.a_806[4];
            for each(update in arrUpdateSkillPoint)
            {
               dict[update.m_iSkillID] = update;
            }
            for each(skill in arrSkillBooks)
            {
               up = dict[skill.m_iSkillID];
               if(up != null)
               {
                  skill.m_iSkillUsed = up.m_iPoint;
               }
            }
         }
      }
      
      public function updateSkillLevel(notify:a_2909) : void
      {
         var arrSkillBooks:Array = null;
         var isUpdate:Boolean = false;
         var skill:a_2855 = null;
         var updateSkill:a_2855 = null;
         if(this.a_806 != null)
         {
            arrSkillBooks = this.a_806[4];
            isUpdate = false;
            for each(skill in arrSkillBooks)
            {
               if(skill.m_iSkillID == notify.m_iSkillID)
               {
                  skill.m_iSkillOpened = notify.m_iOpened;
                  skill.m_nSkillLevel = notify.m_nSkillLevel;
                  skill.m_iSkillUsed = 0;
                  isUpdate = true;
               }
            }
            if(!isUpdate)
            {
               updateSkill = new a_2855();
               updateSkill.m_iSkillID = notify.m_iSkillID;
               updateSkill.m_iSkillOpened = notify.m_iOpened;
               updateSkill.m_nSkillLevel = notify.m_nSkillLevel;
               updateSkill.m_iSkillUsed = 0;
               arrSkillBooks.push(updateSkill);
            }
         }
      }
      
      public function updatePlayerHealthData(notify:Object) : void
      {
         this.a_818 = notify;
         a_4657.getInstance().execute("onNotifyPlayerHealthData",this,this.a_818.a_1233,this.a_818.m_iCumulativeOffLine,this.a_818.m_iTimestamp);
      }
      
      public function getPlayerEnthralmentData() : Object
      {
         return this.a_818;
      }
      
      public function setHeroMapOpen(iMapId:int) : void
      {
         if(null == this.m_arrHeroOpen)
         {
            this.m_arrHeroOpen = [];
         }
         if(!this.getHeroMapOpen(iMapId))
         {
            this.m_arrHeroOpen.push(iMapId);
         }
      }
      
      public function getHeroMapOpen(iMapId:int) : Boolean
      {
         var mapId:int = 0;
         if(null == this.m_arrHeroOpen)
         {
            this.m_arrHeroOpen = [];
         }
         for(var i:int = 0; i < this.m_arrHeroOpen.length; i++)
         {
            mapId = int(this.m_arrHeroOpen[i]);
            if(mapId == iMapId)
            {
               break;
            }
         }
         if(i == this.m_arrHeroOpen.length)
         {
            return false;
         }
         return true;
      }
      
      private function getVipLevel(iScore:int) : int
      {
         var level:Number = 0;
         if(iScore >= 20000000)
         {
            level = 16;
         }
         else if(iScore >= 14000000)
         {
            level = 15 + (iScore - 14000000) / 6000000;
         }
         else if(iScore >= 9500000)
         {
            level = 14 + (iScore - 9500000) / 4500000;
         }
         else if(iScore >= 6000000)
         {
            level = 13 + (iScore - 6000000) / 3500000;
         }
         else if(iScore >= 3500000)
         {
            level = 12 + (iScore - 3500000) / 2500000;
         }
         else if(iScore >= 2000000)
         {
            level = 11 + (iScore - 2000000) / 1500000;
         }
         else if(iScore >= 1000000)
         {
            level = 10 + (iScore - 1000000) / 1000000;
         }
         else if(iScore >= 500000)
         {
            level = 9 + (iScore - 500000) / 500000;
         }
         else if(iScore >= 200000)
         {
            level = 8 + (iScore - 200000) / 300000;
         }
         else if(iScore >= 100000)
         {
            level = 7 + (iScore - 100000) / 100000;
         }
         else if(iScore >= 50000)
         {
            level = 6 + (iScore - 50000) / 50000;
         }
         else if(iScore >= 20000)
         {
            level = 5 + (iScore - 20000) / 30000;
         }
         else if(iScore >= 10000)
         {
            level = 4 + (iScore - 10000) / 10000;
         }
         else if(iScore >= 5000)
         {
            level = 3 + (iScore - 5000) / 5000;
         }
         else if(iScore >= 2000)
         {
            level = 2 + (iScore - 2000) / 3000;
         }
         else if(iScore >= 500)
         {
            level = 1 + (iScore - 500) / 1500;
         }
         else
         {
            level = iScore / 500;
         }
         return int(level);
      }
      
      public function GetMiShiUseNum(iMiShiType:int) : Object
      {
         var aryGameData:Array = null;
         var dbGameData:a_2745 = null;
         if(this.a_812)
         {
            aryGameData = this.a_812.m_arrGameData;
            if(Boolean(aryGameData) && aryGameData.length > 0)
            {
               dbGameData = aryGameData[0];
               if(dbGameData)
               {
                  return dbGameData.GetMiShiUseNum(iMiShiType);
               }
            }
         }
         return null;
      }
      
      public function GetGuideData() : Object
      {
         return this.m_guideData;
      }
      
      public function GetDepthSeaUseNum() : Object
      {
         var aryGameData:Array = null;
         var dbGameData:a_2745 = null;
         if(this.a_812)
         {
            aryGameData = this.a_812.m_arrGameData;
            if(Boolean(aryGameData) && aryGameData.length > 0)
            {
               dbGameData = aryGameData[0];
               if(dbGameData)
               {
                  return dbGameData.GetDepthSeaUseNum();
               }
            }
         }
         return null;
      }
      
      public function GetHeroProcess() : int
      {
         if(this.a_812)
         {
            return this.a_812.m_iWarriorProgress;
         }
         return -1;
      }
      
      public function GetRechargeActivityInfo(strProperty:String) : *
      {
         if(null != this.m_stPlayerRechargeActivityInfo && this.m_stPlayerRechargeActivityInfo.hasOwnProperty(strProperty))
         {
            return this.m_stPlayerRechargeActivityInfo[strProperty];
         }
         return 0;
      }
      
      public function SetRechargeActivityInfo(strProperty:String, iValue:int) : void
      {
         if(null != this.m_stPlayerRechargeActivityInfo && this.m_stPlayerRechargeActivityInfo.hasOwnProperty(strProperty))
         {
            this.m_stPlayerRechargeActivityInfo[strProperty] = iValue;
            return;
         }
         throw Error("SetRechargeActivityInfo::strProperty = " + strProperty + "  iValue = " + iValue);
      }
      
      public function SetVerifyInGame(data:Object) : void
      {
         this.m_stVerifyInGame = data;
      }
      
      public function SetVerifyNumInGame(num:int) : void
      {
         if(this.m_stVerifyInGame)
         {
            this.m_stVerifyInGame.m_iNum = num;
         }
      }
      
      public function GetVerifyInGame() : Object
      {
         return this.m_stVerifyInGame;
      }
      
      public function GetMarriageInfo(strProperty:String) : *
      {
         if(null != this.m_stPlayerMarriageInfo && this.m_stPlayerMarriageInfo.hasOwnProperty(strProperty))
         {
            return this.m_stPlayerMarriageInfo[strProperty];
         }
         return 0;
      }
      
      public function SetMarriageInfo(strProperty:String, iValue:*) : void
      {
         if(null != this.m_stPlayerMarriageInfo && this.m_stPlayerMarriageInfo.hasOwnProperty(strProperty))
         {
            this.m_stPlayerMarriageInfo[strProperty] = iValue;
            return;
         }
         throw Error("CResponsePlayerMarriageInfo::strProperty = " + strProperty + "  iValue = " + iValue);
      }
      
      public function setRealTimeWorldBossDuanweiQuailty(value:Object) : void
      {
         this.realTimeDuanweiQualityCfg = value;
      }
      
      public function getCurDuanweiQualityCfg() : Object
      {
         return this.realTimeDuanweiQualityCfg;
      }
      
      public function setWorldBossBuffId(value:int) : void
      {
         this.worldBossBuffId = value;
      }
      
      public function getWorldBossBuffId() : int
      {
         return this.worldBossBuffId;
      }
      
      public function checkInWorldbossPKState() : Boolean
      {
         return WorldBossModel.GetInstance().getIsPKState();
      }
      
      public function getNewYearCostMoney() : int
      {
         return this.newYearTurnCostMoney;
      }
      
      public function setNewYearCostMoney(value:int) : void
      {
         this.newYearTurnCostMoney = value;
      }
      
      public function setBirthdayActivityAutoOpen(value:Boolean) : void
      {
         this.autoOpenBirthdayActivity = value;
      }
      
      public function getBirthdayActivityAutoOpen() : Boolean
      {
         return this.autoOpenBirthdayActivity;
      }
      
      public function getPlat(platId:int) : String
      {
         var platName:String = EnmPlatform.PLAT_JOYYOU;
         if(platId == 3)
         {
            platName = EnmPlatform.PLAT_4399;
         }
         else if(platId == 4)
         {
            platName = EnmPlatform.PLAT_QQ;
         }
         else if(platId == 5)
         {
            platName = EnmPlatform.PLAT_3366;
         }
         else if(platId == 6)
         {
            platName = EnmPlatform.PLAT_7K7K;
         }
         else if(platId == 11)
         {
            platName = EnmPlatform.PLAT_QQGAME;
         }
         return platName;
      }
   }
}

