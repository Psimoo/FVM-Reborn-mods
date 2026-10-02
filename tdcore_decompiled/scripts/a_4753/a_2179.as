package a_4753
{
   import a_4716.b_101;
   import a_4719.EnmLoaderType;
   import a_4724.AvatarDetailInfo;
   import a_4724.PlayerDetailInfo;
   import a_4725.AurLoadTask;
   import a_4728.a_1778;
   import a_4729.EventType;
   import a_4752.GameStringManager;
   import a_4754.a_2161;
   import a_4759.b_153;
   import a_4774.a_3004;
   import a_4788.a_4648;
   import a_4789.a_4657;
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.game.CPlayerDetail;
   import com.aurora.protocol.game.maogoutd.CAvatarInfo;
   import com.aurora.protocol.game.maogoutd.CGameResult;
   import com.aurora.protocol.game.maogoutd.CNotifyAddGameEnery;
   import com.aurora.protocol.game.maogoutd.CNotifyEntityStateChange;
   import com.aurora.protocol.game.maogoutd.CNotifyGameMapLimit;
   import com.aurora.protocol.game.maogoutd.CNotifyGameStep;
   import com.aurora.protocol.game.maogoutd.CNotifyPlayerEnergyValue;
   import com.aurora.protocol.game.maogoutd.CNotifyPlayerUseSkill;
   import com.aurora.protocol.game.maogoutd.CPendingDIYEnemy;
   import com.aurora.protocol.game.maogoutd.CPendingEnemy;
   import com.aurora.protocol.game.maogoutd.a_2693;
   import com.aurora.protocol.game.maogoutd.a_2694;
   import com.aurora.protocol.game.maogoutd.a_2695;
   import com.aurora.protocol.game.maogoutd.a_2696;
   import com.aurora.protocol.game.maogoutd.a_2697;
   import com.aurora.protocol.game.maogoutd.a_2698;
   import com.aurora.protocol.game.maogoutd.a_2699;
   import com.aurora.protocol.game.maogoutd.a_2700;
   import com.aurora.protocol.game.maogoutd.a_2701;
   import com.aurora.protocol.game.maogoutd.a_2702;
   import com.aurora.protocol.game.maogoutd.a_2703;
   import com.aurora.protocol.game.maogoutd.a_2704;
   import com.aurora.protocol.game.maogoutd.a_2705;
   import com.aurora.protocol.game.maogoutd.a_2706;
   import com.aurora.protocol.game.maogoutd.a_2707;
   import com.aurora.protocol.game.maogoutd.a_2708;
   import com.aurora.protocol.game.maogoutd.a_2709;
   import com.aurora.protocol.game.maogoutd.a_2723;
   import com.aurora.protocol.logicserver.CNotifyDIYNextEnmeyWave;
   import com.aurora.ui.maogoutd.ClientLog.MessageTipHandler;
   import com.aurora.ui.maogoutd.TDGameCoreUI;
   import com.aurora.ui.maogoutd.b_147;
   import com.aurora.ui.maogoutd.b_148;
   import com.aurora.ui.maogoutd.compositemap.CompositeMapHandler;
   import com.aurora.ui.maogoutd.crossserver.CrossXml;
   import com.aurora.ui.maogoutd.crossserver.data.MapItemData;
   import com.aurora.ui.maogoutd.diy.xml.DIYConfigData;
   import com.aurora.ui.maogoutd.game.Util.BitMapManager;
   import com.aurora.ui.maogoutd.game.Util.PreLoadManager;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4269;
   import com.aurora.ui.maogoutd.version.VersionMD5;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.net.URLLoader;
   import flash.system.ApplicationDomain;
   import flash.utils.ByteArray;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class a_2179 implements b_150
   {
      
      private static var a_760:a_2179;
      
      public static var a_761:b_153;
      
      public var a_1675:Array = [];
      
      public var m_stMyPlayerDetail:CPlayerDetail;
      
      public var m_stSittedPlayerStatusNotify:a_2709;
      
      public var m_arrPlayerAvatarDetailInfo:Array = [];
      
      public var m_arrSelectedCards:Array = [];
      
      public var a_1183:Array = [];
      
      public var a_1185:Array = [];
      
      public var a_1184:Array = [];
      
      public var m_currentRole:Object;
      
      public var m_arrGameData:Array = [];
      
      public var m_iDIYInfo:Object;
      
      private var a_762:a_2197;
      
      private var a_759:a_2053;
      
      private var a_763:int = 0;
      
      private var a_764:int = 0;
      
      private var a_765:int = 0;
      
      private var a_766:int = 0;
      
      private var a_767:Boolean = false;
      
      private var a_768:Boolean = false;
      
      private var a_769:ApplicationDomain;
      
      private var m_arrVersionData:Array = [];
      
      private var m_bIsLoadComplete:Boolean = false;
      
      private var a_771:a_2698;
      
      private var a_772:Array;
      
      private const m_strVersion:String = "0000201601010101";
      
      private var a_1596:int = -1;
      
      private var m_isGaming:Boolean;
      
      private var m_bHasLoaded:Boolean = false;
      
      public function a_2179()
      {
         super();
      }
      
      public static function getInstance() : a_2179
      {
         if(null == a_760)
         {
            a_760 = new a_2179();
            a_4657.getInstance().addListener(a_760);
            CompositeMapHandler.Get();
         }
         return a_760;
      }
      
      public function a_1797(stLobbyInstace:b_153) : Boolean
      {
         a_761 = stLobbyInstace;
         a_2197.getInstance().a_1797(this);
         a_2053.getInstance().a_1797();
         this.a_762 = a_2197.getInstance();
         this.a_759 = a_2053.getInstance();
         if(TDGameCoreUI.a_1666 == null)
         {
            this.m_arrVersionData["Version.data"] = VersionMD5.Get().GetVersion("Version.data");
            this.CreateLoadTask("Version","Version.data",null,EnmLoaderType.a_501,false,null,false);
            a_3004.getInstance().addEventListener(EventType.a_648,this.a_2188);
            a_3004.getInstance().addEventListener(EventType.a_653,this.a_2189);
            a_3004.startLoad();
         }
         else
         {
            TDGameCoreUI.a_921.a_4540();
            if(this.GetVersionByKey("TDGame2V2BattleUI.swf") != null)
            {
               this.BeginPreLoad();
            }
         }
         return true;
      }
      
      private function a_2180() : int
      {
         return this.a_763++;
      }
      
      public function a_2109() : Boolean
      {
         var protocolBuffer:ByteArray = new ByteArray();
         a_2664.encode_int16(protocolBuffer,b_101.a_492);
         return a_761.a_2241(protocolBuffer);
      }
      
      public function GetCurrentRole() : Boolean
      {
         var protocolBuffer:ByteArray = new ByteArray();
         a_2664.encode_int16(protocolBuffer,b_101.a_496);
         return a_761.a_2241(protocolBuffer);
      }
      
      public function a_2110() : Boolean
      {
         var protocolBuffer:ByteArray = new ByteArray();
         a_2664.encode_int16(protocolBuffer,b_101.a_493);
         return a_761.a_2241(protocolBuffer);
      }
      
      public function a_2111(iFavoriteID:int, szFavoriteName:String, favitemsContent:String) : Boolean
      {
         var protocolBuffer:ByteArray = new ByteArray();
         a_2664.encode_int16(protocolBuffer,b_101.a_494);
         a_2664.encode_int32(protocolBuffer,this.m_stMyPlayerDetail.m_iUin);
         a_2664.encode_int32(protocolBuffer,iFavoriteID);
         a_2664.encode_string(protocolBuffer,szFavoriteName,32);
         a_2664.encode_string(protocolBuffer,favitemsContent,512);
         return a_761.a_2241(protocolBuffer);
      }
      
      public function a_2113(iSeatID:int, isClose:Boolean) : Boolean
      {
         var protocolBuffer:ByteArray = new ByteArray();
         a_2664.encode_int16(protocolBuffer,b_101.a_495);
         a_2664.encode_int8(protocolBuffer,iSeatID);
         a_2664.encode_int8(protocolBuffer,isClose ? 0 : 1);
         return a_761.a_2241(protocolBuffer);
      }
      
      public function a_2112(arrTDCardsSequence:Array) : Boolean
      {
         return true;
      }
      
      public function a_2056(arrSelectCards:Array) : Boolean
      {
         var iAvatarDefenseValue:int;
         var arrAdditionValue:Array;
         var pushIfValid:Function;
         var stAvatarDetailInfo:AvatarDetailInfo = null;
         var szMouseIntruderID:String = null;
         var stFighterCard:Object = null;
         var stPropCard:Object = null;
         var checkPetInfo:int = 0;
         var arr:Array = null;
         var packedFlat:Array = null;
         var arrLoadResIDArray:Array = null;
         var iAvatarResourceID:int = 0;
         var stAvatarByteArray:ByteArray = null;
         var iMouseID:int = 0;
         var szMouseResourceName:String = null;
         var iCardID:int = 0;
         var szResourceName:String = null;
         var iPropID:int = 0;
         var szGamePropID:String = null;
         var stCardEffectAdd:Object = null;
         var attrInfos:Array = null;
         var stCardAddInfo:Object = null;
         var attrType:int = 0;
         var valueAny:* = undefined;
         var valueInt:int = 0;
         var cardIds:Array = null;
         var szCardID:String = null;
         var cardId:int = 0;
         var szAvatarResourceID:String = null;
         if(arrSelectCards[0].length > 24)
         {
            return false;
         }
         this.m_arrSelectedCards = arrSelectCards;
         this.a_772 = arrSelectCards;
         if(this.GetVersionByKey("TDGame2V2BattleUI.swf") == null)
         {
            return true;
         }
         this.a_772 = null;
         iAvatarDefenseValue = 0;
         arrAdditionValue = [0,0,0,0,0];
         if(arrSelectCards[0].length > 0)
         {
            pushIfValid = function(id:int):void
            {
               if(id > 0)
               {
                  arrLoadResIDArray.push(id);
               }
            };
            for each(szMouseIntruderID in this.m_arrGameData["arrMouse"])
            {
               iMouseID = 8388608 + parseInt(szMouseIntruderID,16);
               if(iMouseID > 8388608)
               {
                  szMouseResourceName = "0x" + iMouseID.toString(16).toLocaleUpperCase();
                  if(-1 == this.a_1183.indexOf(szMouseResourceName))
                  {
                     this.a_1183.push(szMouseResourceName);
                  }
               }
            }
            for each(stFighterCard in arrSelectCards[0])
            {
               iCardID = int(stFighterCard.m_iCardID);
               szResourceName = "0x" + iCardID.toString(16).toLocaleUpperCase();
               if(-1 == this.a_1183.indexOf(szResourceName))
               {
                  this.a_1183.push(szResourceName);
               }
            }
            if(this.a_1185.length == 0)
            {
               this.a_1185 = ["0x121F0805","0x121F0807","0x121F0808","0x121F080D","0x121F080E"];
            }
            for each(stPropCard in arrSelectCards[1])
            {
               iPropID = int(stPropCard.m_iCardID);
               szGamePropID = "0x" + iPropID.toString(16).toLocaleUpperCase();
               if(-1 == this.a_1185.indexOf(szGamePropID))
               {
                  this.a_1185.push(szGamePropID);
               }
            }
            stAvatarDetailInfo = arrSelectCards[2] as AvatarDetailInfo;
            stAvatarDetailInfo.m_arrCardInfoArray = arrSelectCards[0];
            this.m_arrPlayerAvatarDetailInfo = [];
            this.m_arrPlayerAvatarDetailInfo[this.m_stMyPlayerDetail.m_bySeat] = stAvatarDetailInfo;
            stAvatarDetailInfo.m_arrPetInfoArray[3] = [this.m_arrGameData["iMapID"],this.m_stMyPlayerDetail.m_bySeat];
            iAvatarDefenseValue = stAvatarDetailInfo.m_numDefenseForce;
            arrAdditionValue[0] = stAvatarDetailInfo.m_numDefenseForce;
            arrAdditionValue[1] = stAvatarDetailInfo.m_numAddExperience;
            arrAdditionValue[2] = stAvatarDetailInfo.m_numAddProps;
            arrAdditionValue[3] = stAvatarDetailInfo.m_numAddSkill;
            arrAdditionValue[4] = stAvatarDetailInfo.m_numAddGold;
            arrAdditionValue[5] = arrSelectCards[3];
            arrAdditionValue[6] = stAvatarDetailInfo.m_iGunType;
            arrAdditionValue[7] = stAvatarDetailInfo.m_iGunSequence;
            arrAdditionValue[8] = stAvatarDetailInfo.m_iShieldType;
            arrAdditionValue[9] = stAvatarDetailInfo.m_iSuperGunType;
            arrAdditionValue[10] = stAvatarDetailInfo.m_arrPetInfoArray[0].length;
            checkPetInfo = 0;
            for each(arr in stAvatarDetailInfo.m_arrPetInfoArray[0])
            {
               checkPetInfo ^= arr[0];
            }
            arrAdditionValue[11] = checkPetInfo;
            if(this.a_1184.length == 0)
            {
            }
            packedFlat = [];
            if(arrSelectCards[5] is Array)
            {
               for each(stCardEffectAdd in arrSelectCards[5] as Array)
               {
                  if(stCardEffectAdd != null)
                  {
                     attrInfos = stCardEffectAdd.m_aryAttrInfo;
                     if(attrInfos)
                     {
                        for each(stCardAddInfo in attrInfos)
                        {
                           if(stCardAddInfo != null)
                           {
                              attrType = int(stCardAddInfo.m_iAttrType);
                              valueAny = stCardAddInfo.m_iValue;
                              if(valueAny is Number && valueAny % 1 != 0)
                              {
                                 throw new Error("m_iValue is not an integer: " + valueAny);
                              }
                              valueInt = int(valueAny);
                              cardIds = stCardAddInfo.m_aryCardId;
                              if(cardIds)
                              {
                                 for each(szCardID in cardIds)
                                 {
                                    cardId = parseInt(szCardID,16);
                                    packedFlat.push(cardId,attrType,valueInt);
                                 }
                              }
                           }
                        }
                     }
                  }
               }
            }
            stAvatarDetailInfo.m_arrCardEffectAddArray = packedFlat;
            arrLoadResIDArray = [];
            pushIfValid(stAvatarDetailInfo.m_iAureolaType);
            pushIfValid(stAvatarDetailInfo.m_iWingType);
            pushIfValid(stAvatarDetailInfo.m_iSuperGunType);
            if(stAvatarDetailInfo.m_iCoverallType > 0)
            {
               arrLoadResIDArray.push(stAvatarDetailInfo.m_iCoverallType);
            }
            else
            {
               pushIfValid(stAvatarDetailInfo.m_iHatType);
               pushIfValid(stAvatarDetailInfo.m_iEyeGlassesType);
               pushIfValid(stAvatarDetailInfo.m_iFaceType);
               pushIfValid(stAvatarDetailInfo.m_iFaceDecorationType);
               pushIfValid(stAvatarDetailInfo.m_iEyeType);
               pushIfValid(stAvatarDetailInfo.m_iHairType);
               pushIfValid(stAvatarDetailInfo.m_iBodyType);
            }
            pushIfValid(stAvatarDetailInfo.m_iGunType);
            pushIfValid(stAvatarDetailInfo.m_iShieldType);
            for each(iAvatarResourceID in arrLoadResIDArray)
            {
               szAvatarResourceID = "0x" + iAvatarResourceID.toString(16).toLocaleUpperCase();
               if(-1 == this.a_1184.indexOf(szAvatarResourceID))
               {
                  this.a_1184.push(szAvatarResourceID);
               }
            }
            stAvatarByteArray = new ByteArray();
            stAvatarByteArray.position = 0;
            stAvatarByteArray.writeObject(stAvatarDetailInfo);
            stAvatarByteArray.position = 0;
            arrSelectCards[3] = stAvatarByteArray;
            this.a_2115();
         }
         return this.a_759.a_2056(arrSelectCards,arrAdditionValue);
      }
      
      public function a_2057(byTeamID:int) : Boolean
      {
         if(byTeamID < 0 || byTeamID > 1)
         {
            return false;
         }
         return this.a_759.a_2057(byTeamID);
      }
      
      public function a_2058(iProgress:int) : Boolean
      {
         if(-1 == iProgress)
         {
            ++this.a_765;
            this.a_759.a_2058(this.a_765 + int((100 - this.a_765) * this.a_766 / 100));
            if(this.a_765 < 50 && this.a_764 < 70)
            {
               setTimeout(this.a_2058,300,-1);
            }
            return true;
         }
         if(iProgress < 0 || iProgress > 100)
         {
            return false;
         }
         if(iProgress < 1)
         {
            iProgress = 1;
         }
         this.a_766 = iProgress;
         iProgress = this.a_765 + int((100 - this.a_765) * iProgress / 100);
         if(this.a_764 != iProgress)
         {
            this.a_764 = iProgress;
            this.a_759.a_2058(iProgress);
            a_4648.a_4649("Game: m_stGameDataProtocol.PostLoadingProgress iProgress:" + iProgress.toString());
            trace("PostLoadingProgress:" + iProgress);
         }
         return true;
      }
      
      public function a_2059(iDefenderGlobalID:int, iDefenderTypeID:int, byXGridNo:int, byYGridNo:int, byIsTool:int = 0, IsCaclueCoolDown:int = 0, iStarDegree:int = 20, iCost:int = 0, tickTime:int = 0, origSeatID:int = -1, protectBuffTime:int = 0) : Boolean
      {
         var stDefenderInfo:a_2723 = new a_2723();
         stDefenderInfo.m_iDefenderID = iDefenderGlobalID;
         stDefenderInfo.m_iDefenderTypeID = iDefenderTypeID;
         stDefenderInfo.m_byXGridNo = byXGridNo;
         stDefenderInfo.m_byYGridNo = byYGridNo;
         stDefenderInfo.m_byIsTool = byIsTool;
         stDefenderInfo.m_IsCaclueCoolDown = IsCaclueCoolDown;
         stDefenderInfo.a_1094 = iStarDegree;
         stDefenderInfo.m_iCost = iCost;
         stDefenderInfo.m_iTickTime = tickTime;
         stDefenderInfo.m_iOrigSeatID = origSeatID;
         stDefenderInfo.m_iProtectBuffTime = protectBuffTime;
         if(TDGameCoreUI.ms_arrCardAndEnergyInfoArray)
         {
            stDefenderInfo.m_iCurrentMoney = TDGameCoreUI.ms_arrCardAndEnergyInfoArray[0];
            stDefenderInfo.m_iDefenseAttackHurt = TDGameCoreUI.ms_arrCardAndEnergyInfoArray[1];
            TDGameCoreUI.ms_arrCardAndEnergyInfoArray = null;
         }
         var iPlaceTimeNum:int = int(TDGameCoreUI.a_757.a_3601());
         stDefenderInfo.m_iPlaceTimeNum = iPlaceTimeNum;
         return this.a_759.a_2059(stDefenderInfo);
      }
      
      public function PostDamageValidate(nDamageValue:int) : Boolean
      {
         return this.a_759.PostDamageValidate(nDamageValue);
      }
      
      public function PostBOSSDamage(nDamageValue:int) : Boolean
      {
         return this.a_759.PostBOSSDamage(nDamageValue);
      }
      
      public function a_2060(iTimeNum:int, byTeamNo:int, arrVanishDefender:Array) : Boolean
      {
         return this.a_759.a_2060(iTimeNum,byTeamNo,arrVanishDefender);
      }
      
      public function PostEntityStateChange(iTimeNum:int, byTeamNo:int, arrChange:Array) : Boolean
      {
         return this.a_759.PostEntityStateChange(iTimeNum,byTeamNo,arrChange);
      }
      
      public function a_2061(iTimeNum:int, byTeamNo:int, arrVanishEnemy:Array) : Boolean
      {
         return this.a_759.a_2061(iTimeNum,byTeamNo,arrVanishEnemy);
      }
      
      public function a_2062(iTimeNum:int, byBreakDownRow:int, byIsOpponentBattleFiled:int = 0) : Boolean
      {
         return this.a_759.a_2062(iTimeNum,byBreakDownRow,byIsOpponentBattleFiled);
      }
      
      public function a_2063(iTimeNum:int, byAvatarXGridNo:int, byAvatarYGridNo:int) : Boolean
      {
         return this.a_759.a_2063(iTimeNum,byAvatarXGridNo,byAvatarYGridNo);
      }
      
      public function a_2064() : Boolean
      {
         return this.a_759.a_2064();
      }
      
      public function a_2065(nEnergyValue:int) : Boolean
      {
         return this.a_759.a_2065(nEnergyValue);
      }
      
      public function a_2066(nGoldCoinsValue:int) : Boolean
      {
         return this.a_759.a_2066(nGoldCoinsValue);
      }
      
      public function a_2067(iPropOrStuffSequece:int) : Boolean
      {
         return this.a_759.a_2067(iPropOrStuffSequece);
      }
      
      public function a_2114(byarrMyPlayerAvatarInfo:ByteArray) : Boolean
      {
         if(null == byarrMyPlayerAvatarInfo)
         {
            return false;
         }
         return this.a_759.a_2068(byarrMyPlayerAvatarInfo);
      }
      
      public function a_2069(byarrDataInfo:ByteArray) : Boolean
      {
         if(null == byarrDataInfo)
         {
            return false;
         }
         return this.a_759.a_2069(byarrDataInfo);
      }
      
      public function a_2070(arrSelectAward:Array) : Boolean
      {
         return this.a_759.a_2070(arrSelectAward);
      }
      
      public function a_2071(arrAward:Array) : Boolean
      {
         return this.a_759.a_2071(arrAward);
      }
      
      public function a_2072(stGamePropInfo:Object) : Boolean
      {
         return this.a_759.a_2072(stGamePropInfo[0],stGamePropInfo[1],stGamePropInfo[2],stGamePropInfo[3]);
      }
      
      public function a_2075(stResponseData:Object) : Boolean
      {
         return this.a_759.a_2075();
      }
      
      public function a_2076(stResponseData:Object) : Boolean
      {
         var byIsAccepted:int = stResponseData as int;
         return this.a_759.a_2076(byIsAccepted);
      }
      
      public function a_2116(eStandUpMode:int) : Boolean
      {
         a_761.a_2116(eStandUpMode);
         this.a_2196();
         this.m_stMyPlayerDetail = null;
         this.a_1675 = [];
         return a_761.a_1794();
      }
      
      public function a_2117(iDstUin:int, message:String) : Boolean
      {
         return a_761.a_2243(message);
      }
      
      public function a_2118(iDstUin:int, iAct:int, nCommandID:int, message:String) : Boolean
      {
         var protocolBuffer:ByteArray = new ByteArray();
         a_2664.encode_int16(protocolBuffer,b_101.a_497);
         a_2664.encode_int32(protocolBuffer,iDstUin);
         a_2664.encode_int16(protocolBuffer,iAct);
         a_2664.encode_int32(protocolBuffer,nCommandID);
         a_2664.encode_string(protocolBuffer,message,2048);
         return a_761.a_2241(protocolBuffer);
      }
      
      public function a_2073(stData:Object) : Boolean
      {
         var byIsEnter:int = stData as int;
         return this.a_759.a_2073(byIsEnter);
      }
      
      public function a_2074(stData:Object) : Boolean
      {
         var byStartYGridNo:int = stData as int;
         return this.a_759.a_2074(byStartYGridNo);
      }
      
      public function a_2077() : Boolean
      {
         return this.a_759.a_2077();
      }
      
      public function PostRequestUseWeaponSkill(uiSkillID:uint, iUseTimeNum:int) : Boolean
      {
         return this.a_759.PostRequestUseWeaponSkill(uiSkillID,iUseTimeNum);
      }
      
      public function PostPlayerEnergyValue(iCardInfo:int, arrCardInfo:Array) : Boolean
      {
         return this.a_759.PostPlayerEnergyValue(iCardInfo,arrCardInfo);
      }
      
      public function a_2087(stLoadStartNotify:a_2698) : void
      {
         var stAvatarInfo:CAvatarInfo = null;
         var arrPendingAvatarLoadingRes:Array = null;
         var iAvatarResourceID:int = 0;
         var arrPendingLoadingRes:Array = null;
         var iCardID:int = 0;
         var stReadObject:Object = null;
         var stAvatarDetailInfo:AvatarDetailInfo = null;
         var i:int = 0;
         var data:MapItemData = null;
         var szAvatarResourceID:String = null;
         var szCardIndex:String = null;
         var loadTask:AurLoadTask = null;
         var szOtherCardID:String = null;
         var szAvatarResourcekey:String = null;
         var stLoadingTaskLoader:* = undefined;
         var stLoadingTemp1Task:AurLoadTask = null;
         var stLoadingTempTask:AurLoadTask = null;
         a_4648.a_4649("Game: OnLoadStart Start.");
         this.a_771 = stLoadStartNotify;
         if(this.GetVersionByKey("TDGame2V2BattleUI.swf") == null)
         {
            return;
         }
         this.a_771 = null;
         this.a_765 = 0;
         this.a_764 = 0;
         this.a_766 = 0;
         if(null == this.a_769)
         {
            this.a_769 = new ApplicationDomain(ApplicationDomain.currentDomain);
         }
         this.a_767 = true;
         this.m_arrGameData["byGameMode"] = stLoadStartNotify.m_nGameMode;
         var enterRoom:Object = a_2161.e.getEnterRoom();
         enterRoom.m_RandomSeed = stLoadStartNotify.m_RandomSeed;
         var arrLoadResIDArray:Array = [];
         trace("MySeatID:[" + this.m_stMyPlayerDetail.m_bySeat + "]");
         for each(stAvatarInfo in stLoadStartNotify.m_arrAvatarInfoArray)
         {
            stAvatarInfo.m_bySeatID;
            stAvatarInfo.m_byarrPlayerAvatarInfoByteArray.position = 0;
            stReadObject = stAvatarInfo.m_byarrPlayerAvatarInfoByteArray.readObject();
            stAvatarDetailInfo = new AvatarDetailInfo();
            stAvatarDetailInfo.m_iCoverallType = stReadObject.m_iCoverallType;
            stAvatarDetailInfo.m_iGunType = stReadObject.m_iGunType;
            stAvatarDetailInfo.m_iSuperGunType = stReadObject.m_iSuperGunType;
            stAvatarDetailInfo.m_iShieldType = stReadObject.m_iShieldType;
            stAvatarDetailInfo.m_iHatType = stReadObject.m_iHatType;
            stAvatarDetailInfo.m_iEyeGlassesType = stReadObject.m_iEyeGlassesType;
            stAvatarDetailInfo.m_iFaceType = stReadObject.m_iFaceType;
            stAvatarDetailInfo.m_iFaceDecorationType = stReadObject.m_iFaceDecorationType;
            stAvatarDetailInfo.m_iEyeType = stReadObject.m_iEyeType;
            stAvatarDetailInfo.m_iHairType = stReadObject.m_iHairType;
            stAvatarDetailInfo.m_iBodyType = stReadObject.m_iBodyType;
            stAvatarDetailInfo.m_iAureolaType = stReadObject.m_iAureolaType;
            stAvatarDetailInfo.m_iWingType = stReadObject.m_iWingType;
            stAvatarDetailInfo.m_iLandInsuranceType = stReadObject.m_iLandInsuranceType;
            stAvatarDetailInfo.m_iWaterInsuranceType = stReadObject.m_iWaterInsuranceType;
            stAvatarDetailInfo.m_numAttackForce = stReadObject.m_numAttackForce;
            stAvatarDetailInfo.m_numDefenseForce = stReadObject.m_numDefenseForce;
            stAvatarDetailInfo.m_byShovelType = stReadObject.m_byShovelType;
            stAvatarDetailInfo.m_isAutoPickUpEnergy = stAvatarInfo.m_isAutoPickUpEnergy;
            stAvatarDetailInfo.m_isAutoPickUpProps = stAvatarInfo.m_isAutoPickUpProps;
            stAvatarDetailInfo.m_arrCardInfoArray = stAvatarInfo.m_arrGameCardInfoArray;
            stAvatarDetailInfo.m_arrGenInfoArray = stReadObject.m_arrGenInfoArray;
            stAvatarDetailInfo.m_arrCardEffectAddArray = stReadObject.m_arrCardEffectAddArray;
            stAvatarDetailInfo.m_arrPetInfoArray = stReadObject.m_arrPetInfoArray;
            trace("SeatID:[" + stAvatarInfo.m_bySeatID + "] {m_iCoverallType:" + stAvatarDetailInfo.m_iCoverallType + ", m_iGunType:" + stAvatarDetailInfo.m_iGunType + ", m_iShieldType:" + stAvatarDetailInfo.m_iShieldType + ", m_iHatType:" + stAvatarDetailInfo.m_iHatType + ", m_iEyeGlassesType:" + stAvatarDetailInfo.m_iEyeGlassesType + ", m_iFaceType:" + stAvatarDetailInfo.m_iFaceType + ", m_iFaceDecorationType:" + stAvatarDetailInfo.m_iFaceDecorationType + ", m_iEyeType:" + stAvatarDetailInfo.m_iEyeType + ", m_iHairType:" + stAvatarDetailInfo.m_iHairType + ", m_iBodyType:" + stAvatarDetailInfo.m_iBodyType + ", m_iAureolaType:" + stAvatarDetailInfo.m_iAureolaType + ", m_iWingType:" + stAvatarDetailInfo.m_iWingType + ", m_iLandInsuranceType:" + stAvatarDetailInfo.m_iLandInsuranceType + ", m_iWaterInsuranceType:" + stAvatarDetailInfo.m_iWaterInsuranceType + "};");
            if(this.m_stMyPlayerDetail.m_bySeat != stAvatarInfo.m_bySeatID)
            {
               this.m_arrPlayerAvatarDetailInfo[stAvatarInfo.m_bySeatID] = stAvatarDetailInfo;
               if(stAvatarDetailInfo.m_iAureolaType > 0)
               {
                  arrLoadResIDArray.push(stAvatarDetailInfo.m_iAureolaType);
               }
               if(stAvatarDetailInfo.m_iWingType > 0)
               {
                  arrLoadResIDArray.push(stAvatarDetailInfo.m_iWingType);
               }
               if(stAvatarDetailInfo.m_iSuperGunType > 0)
               {
                  arrLoadResIDArray.push(stAvatarDetailInfo.m_iSuperGunType);
               }
               if(stAvatarDetailInfo.m_iCoverallType > 0)
               {
                  arrLoadResIDArray.push(stAvatarDetailInfo.m_iCoverallType);
               }
               else
               {
                  if(stAvatarDetailInfo.m_iHatType > 0)
                  {
                     arrLoadResIDArray.push(stAvatarDetailInfo.m_iHatType);
                  }
                  if(stAvatarDetailInfo.m_iEyeGlassesType > 0)
                  {
                     arrLoadResIDArray.push(stAvatarDetailInfo.m_iEyeGlassesType);
                  }
                  if(stAvatarDetailInfo.m_iFaceType > 0)
                  {
                     arrLoadResIDArray.push(stAvatarDetailInfo.m_iFaceType);
                  }
                  if(stAvatarDetailInfo.m_iEyeType > 0)
                  {
                     arrLoadResIDArray.push(stAvatarDetailInfo.m_iEyeType);
                  }
                  if(stAvatarDetailInfo.m_iHairType > 0)
                  {
                     arrLoadResIDArray.push(stAvatarDetailInfo.m_iHairType);
                  }
                  if(stAvatarDetailInfo.m_iBodyType > 0)
                  {
                     arrLoadResIDArray.push(stAvatarDetailInfo.m_iBodyType);
                  }
               }
               if(stAvatarDetailInfo.m_iGunType > 0)
               {
                  arrLoadResIDArray.push(stAvatarDetailInfo.m_iGunType);
               }
               if(stAvatarDetailInfo.m_iShieldType > 0)
               {
                  arrLoadResIDArray.push(stAvatarDetailInfo.m_iShieldType);
               }
            }
            else
            {
               (this.m_arrPlayerAvatarDetailInfo[stAvatarInfo.m_bySeatID] as AvatarDetailInfo).m_arrCardInfoArray = stAvatarDetailInfo.m_arrCardInfoArray;
               this.m_arrSelectedCards = this.m_arrSelectedCards.slice();
               this.m_arrSelectedCards[0] = stAvatarDetailInfo.m_arrCardInfoArray;
               (this.m_arrPlayerAvatarDetailInfo[stAvatarInfo.m_bySeatID] as AvatarDetailInfo).m_isAutoPickUpEnergy = stAvatarDetailInfo.m_isAutoPickUpEnergy;
               (this.m_arrPlayerAvatarDetailInfo[stAvatarInfo.m_bySeatID] as AvatarDetailInfo).m_isAutoPickUpProps = stAvatarDetailInfo.m_isAutoPickUpProps;
            }
            if(Boolean(stAvatarDetailInfo && stAvatarDetailInfo.m_arrCardInfoArray) && Boolean(stAvatarDetailInfo.m_arrCardInfoArray.length > 0) && Boolean(this.m_iDIYInfo))
            {
               if((this.m_arrGameData["iMapID"] & 0xF0000000) == 1610612736)
               {
                  for(i = 0; i < stAvatarDetailInfo.m_arrCardInfoArray.length; i++)
                  {
                     if(stAvatarDetailInfo.m_arrCardInfoArray[i].m_byCardDegreeLevel > this.m_iDIYInfo.m_iMaxCardStar)
                     {
                        stAvatarDetailInfo.m_arrCardInfoArray[i].m_byCardDegreeLevel = this.m_iDIYInfo.m_iMaxCardStar;
                     }
                  }
               }
            }
            if(Boolean(stAvatarDetailInfo) && Boolean(stAvatarDetailInfo.m_arrCardInfoArray) && stAvatarDetailInfo.m_arrCardInfoArray.length > 0)
            {
               data = CrossXml.Get().GetMapDataByMapID(CompositeMapHandler.Get().BattleMapID);
               if((this.m_arrGameData["iMapID"] & 0xFF000000) == 1358954496 && Boolean(data))
               {
                  for(i = 0; i < stAvatarDetailInfo.m_arrCardInfoArray.length; i++)
                  {
                     if(stAvatarDetailInfo.m_arrCardInfoArray[i].m_byCardDegreeLevel > data.m_iMinDefStar)
                     {
                        stAvatarDetailInfo.m_arrCardInfoArray[i].m_byCardDegreeLevel = data.m_iMinDefStar;
                     }
                  }
               }
            }
         }
         arrPendingAvatarLoadingRes = [];
         for each(iAvatarResourceID in arrLoadResIDArray)
         {
            szAvatarResourceID = "0x" + iAvatarResourceID.toString(16).toLocaleUpperCase();
            if(-1 == arrPendingAvatarLoadingRes.indexOf(szAvatarResourceID))
            {
               arrPendingAvatarLoadingRes.push(szAvatarResourceID);
            }
         }
         arrPendingLoadingRes = [];
         for each(iCardID in stLoadStartNotify.m_arrSelectCardIDs)
         {
            szCardIndex = "0x" + iCardID.toString(16).toLocaleUpperCase();
            if(this.a_1183.indexOf(szCardIndex) == -1)
            {
               arrPendingLoadingRes.push(szCardIndex);
            }
         }
         a_4648.a_4649("Game: arrPendingLoadingRes.length:" + arrPendingLoadingRes.length.toString() + " arrPendingAvatarLoadingRes.length:" + arrPendingAvatarLoadingRes.length.toString()," m_isMyResourceLoaded:" + this.a_768.toString() + " AurLoader.isLoading:" + a_3004.isLoading.toString());
         if(arrPendingLoadingRes.length > 0 || arrPendingAvatarLoadingRes.length > 0)
         {
            for each(szOtherCardID in arrPendingLoadingRes)
            {
               if(null == TDGameCoreUI.GetItemsResourceByKey(szOtherCardID))
               {
                  TDGameCoreUI.SetItemsResourceByKey(szOtherCardID,new Loader());
                  this.CreateLoadTask(szOtherCardID,"resource/" + szOtherCardID + ".swf",TDGameCoreUI.GetItemsResourceByKey(szOtherCardID));
               }
            }
            if(arrPendingAvatarLoadingRes != null)
            {
               arrPendingAvatarLoadingRes.push("0x14110100");
            }
            for each(szAvatarResourcekey in arrPendingAvatarLoadingRes)
            {
               if(null == TDGameCoreUI.a_1671[szAvatarResourcekey])
               {
                  TDGameCoreUI.a_1671[szAvatarResourcekey] = new Loader();
                  this.CreateLoadTask(szAvatarResourcekey,"resource/avatar/" + szAvatarResourcekey + ".swf",TDGameCoreUI.a_1671[szAvatarResourcekey]);
               }
            }
            a_3004.getInstance().addEventListener(EventType.a_648,this.a_2188);
            a_3004.getInstance().addEventListener(EventType.a_650,this.a_2191);
            a_3004.getInstance().addEventListener(EventType.a_649,this.a_2193);
            a_3004.startLoad();
            if(null != loadTask)
            {
               this.a_2058(-1);
            }
            else if(this.a_768 && !a_3004.isLoading)
            {
               this.a_2193(null);
            }
            else
            {
               a_4648.a_4649("Game: Come Here 1....");
            }
         }
         else if(this.a_768 && !a_3004.isLoading)
         {
            this.a_2193(null);
         }
         else
         {
            a_4648.a_4649("Game: AurLoader is Loading..");
            for each(stLoadingTaskLoader in a_3004.arrLoadingTaskLoader)
            {
               if(stLoadingTaskLoader is Loader)
               {
                  a_4648.a_4649("Game: AurLoader Loading Loader Url:" + (stLoadingTaskLoader as Loader).contentLoaderInfo.loaderURL);
               }
               else if(stLoadingTaskLoader is URLLoader)
               {
                  a_4648.a_4649("Game: AurLoader Loading URLLoader dataFormat:" + (stLoadingTaskLoader as URLLoader).dataFormat);
                  for each(stLoadingTempTask in a_3004.arrLoadingTask)
                  {
                     if(stLoadingTempTask.stUrlLoader == stLoadingTaskLoader)
                     {
                        a_4648.a_4649("Game: AurLoader Loading URLLoader Url:" + stLoadingTempTask.url);
                        break;
                     }
                  }
               }
            }
            for each(stLoadingTemp1Task in a_3004.arrLoadingTask)
            {
               a_4648.a_4649("Game: AurLoader Current LoadingTask Url:" + stLoadingTemp1Task.url);
            }
         }
         if(null != TDGameCoreUI.a_1666 && Boolean(this.m_stMyPlayerDetail))
         {
            TDGameCoreUI.a_1666.a_3730(this.m_stMyPlayerDetail.m_bySeat,0);
         }
         a_4648.a_4649("Game: OnLoadStart End.");
      }
      
      public function a_2088(stGameStartNotify:a_2695) : void
      {
         this.m_isGaming = true;
         TDGameCoreUI.a_921.a_4541();
         TDGameCoreUI.a_757.a_3435(stGameStartNotify);
      }
      
      public function OnGameStepLock(stGameStepNotify:CNotifyGameStep) : void
      {
         if(this.m_isGaming)
         {
            TDGameCoreUI.a_757.OnGameStepLock(stGameStepNotify);
         }
      }
      
      public function a_2089(sittedPlayerStatusNotify:a_2709) : void
      {
         this.m_stSittedPlayerStatusNotify = sittedPlayerStatusNotify;
         if(null != TDGameCoreUI.a_1666)
         {
            TDGameCoreUI.a_1666.a_2089(sittedPlayerStatusNotify);
         }
      }
      
      public function a_2181(stNextEnmeyWave:a_2699) : Boolean
      {
         var stEnmeyInfo:CPendingEnemy = null;
         var pendingIntruder:a_4269 = null;
         if(null == stNextEnmeyWave)
         {
            return false;
         }
         var pendingAddMoveIntruderVector:Vector.<a_4269> = new Vector.<a_4269>();
         for each(stEnmeyInfo in stNextEnmeyWave.m_arrEnmeyInfo)
         {
            pendingIntruder = new a_4269();
            pendingIntruder.m_iAppearTime = stEnmeyInfo.m_uiTimeTickCount;
            pendingIntruder.m_iIntruderGlobalNo = stEnmeyInfo.m_nEnemySequence;
            pendingIntruder.m_iIntruderType = 8388608 + stEnmeyInfo.m_uiEnemyTypeID;
            pendingIntruder.m_iIntruderXGridNo = TDGameCoreUI.a_757.a_3602() - 1;
            pendingIntruder.m_iIntruderYGridNo = stEnmeyInfo.m_byRow;
            pendingIntruder.m_iApearFlag = stEnmeyInfo.m_byAppearFlag;
            pendingIntruder.m_byAppearType = stEnmeyInfo.m_byAppearType;
            pendingAddMoveIntruderVector.push(pendingIntruder);
         }
         if(TDGameCoreUI.a_757 is b_147)
         {
            return TDGameCoreUI.a_757.a_3608(pendingAddMoveIntruderVector,stNextEnmeyWave.m_byWaveProgress,stNextEnmeyWave.m_byWaveStatus,stNextEnmeyWave.m_byAppearRatHoleCount,stNextEnmeyWave.m_byAppearRatHole);
         }
         trace("TDGameCoreUI.m_stTDGameBattleUI is null, OnAddNextEnmeyWave failed.");
         return false;
      }
      
      public function OnAddDIYNextEnmeyWave(stDIYNextEnmeyWave:CNotifyDIYNextEnmeyWave) : Boolean
      {
         var stEnmeyInfo:CPendingDIYEnemy = null;
         var pendingIntruder:a_4269 = null;
         if(null == stDIYNextEnmeyWave)
         {
            return false;
         }
         var pendingAddMoveIntruderVector:Vector.<a_4269> = new Vector.<a_4269>();
         for each(stEnmeyInfo in stDIYNextEnmeyWave.m_arrEnmeyInfo)
         {
            pendingIntruder = new a_4269();
            pendingIntruder.m_iAppearTime = stEnmeyInfo.m_uiTimeTickCount;
            pendingIntruder.m_iIntruderGlobalNo = stEnmeyInfo.m_nEnemySequence;
            pendingIntruder.m_iIntruderType = 8388608 + stEnmeyInfo.m_uiEnemyTypeID;
            pendingIntruder.m_iIntruderXGridNo = TDGameCoreUI.a_757.a_3602() - 1;
            pendingIntruder.m_iIntruderYGridNo = stEnmeyInfo.m_byRow;
            pendingIntruder.m_iLife = stEnmeyInfo.m_iLife;
            pendingAddMoveIntruderVector.push(pendingIntruder);
         }
         if(TDGameCoreUI.a_757 is b_147)
         {
            return TDGameCoreUI.a_757.a_3608(pendingAddMoveIntruderVector,stDIYNextEnmeyWave.m_byWaveProgress,stDIYNextEnmeyWave.m_byWaveStatus,-1,-1,stDIYNextEnmeyWave.m_stMouseLines);
         }
         trace("TDGameCoreUI.m_stTDGameBattleUI is null, OnAddNextEnmeyWave failed.");
         return false;
      }
      
      public function a_2091(stPlayerPlaceDefenderNotify:a_2704) : void
      {
         if(!TDGameCoreUI.a_757.a_555(stPlayerPlaceDefenderNotify))
         {
            trace("OnPlayerPlaceDefender failed");
         }
      }
      
      public function a_2092(stPlayerDefenderVanishNotify:a_2702) : void
      {
         if(null == TDGameCoreUI.a_757 || !TDGameCoreUI.a_757.a_558(stPlayerDefenderVanishNotify))
         {
            trace("OnPlayerDefenderVanish failed");
         }
      }
      
      public function a_2093(stPlayerEnemyVanishNotify:a_2703) : void
      {
         if(null == TDGameCoreUI.a_757 || !TDGameCoreUI.a_757.a_3610(stPlayerEnemyVanishNotify))
         {
            trace("OnPlayerEnemyVanish failed");
         }
      }
      
      public function OnEntityStateChange(stPlayerEnemyVanishNotify:CNotifyEntityStateChange) : void
      {
         if(null == TDGameCoreUI.a_757 || !TDGameCoreUI.a_757.PlayerEntityStateChange(stPlayerEnemyVanishNotify))
         {
            trace("OnEntityStateChange failed");
         }
      }
      
      public function a_2094(stLoadingProgressNotify:a_2697) : void
      {
         if(null != TDGameCoreUI.a_1666)
         {
            TDGameCoreUI.a_1666.a_3730(stLoadingProgressNotify.m_bySeatID,stLoadingProgressNotify.m_byLoadingProgress);
         }
      }
      
      public function a_2095(stRefusePlaceDefenderNotify:a_2708) : void
      {
         if(null == TDGameCoreUI.a_757 || !TDGameCoreUI.a_757.a_3436(stRefusePlaceDefenderNotify))
         {
            trace("OnRefusePlaceDefender failed");
         }
      }
      
      public function a_2096(stPlayerRowBreakDownNotify:a_2705) : void
      {
      }
      
      public function a_2097(stPlayerAvatarBreakDownNotify:a_2700) : void
      {
         var stDataEvent:a_1778 = null;
         if(null != TDGameCoreUI.a_1668)
         {
            stDataEvent = new a_1778("AvatarBreakDown");
            stDataEvent.dataObject = stPlayerAvatarBreakDownNotify.m_bySeatID;
            TDGameCoreUI.a_1668.dispatchEvent(stDataEvent);
         }
      }
      
      public function a_2098(stGameEndNotify:a_2694) : void
      {
         var i:int = 0;
         this.m_isGaming = false;
         var arrPlayerGameResults:Array = stGameEndNotify.m_arrPlayerGameResults;
         for(i = 0; i < arrPlayerGameResults.length; i++)
         {
            if(515 == stGameEndNotify.m_iMapID && (arrPlayerGameResults[i] as CGameResult).m_nGrade >= 3 && (arrPlayerGameResults[i] as CGameResult).m_nGrade <= 5)
            {
               (arrPlayerGameResults[i] as CGameResult).m_nGrade -= 3;
            }
         }
         if(this.a_1596 > 0)
         {
            clearTimeout(this.a_1596);
            this.a_1596 = -1;
         }
         this.a_1596 = setTimeout(this.a_2196,8000);
         TDGameCoreUI.a_757.a_1847(stGameEndNotify);
         TDGameCoreUI.a_1666.a_2098([stGameEndNotify]);
         var iMySitID:int = this.m_stMyPlayerDetail.m_bySeat;
         var iTeamSitID:int = 0;
         var iMyTeamId:int = int(this.m_stSittedPlayerStatusNotify.m_arrPlayerStatusInfo[iMySitID].m_byTeamNo);
         var iTeamMateSex:int = -1;
         var arrPlayerStatusInfo:Array = this.m_stSittedPlayerStatusNotify.m_arrPlayerStatusInfo;
         var iTeamLevel:int = 1;
         var iOppLevel:int = 1;
         var iMyLevel:int = 1;
         for(i = 0; i < arrPlayerStatusInfo.length; i++)
         {
            if(Boolean(arrPlayerStatusInfo[i]) && Boolean(arrPlayerStatusInfo[i].m_byTeamNo == iMyTeamId) && i != iMySitID)
            {
               if(this.a_1675[i] is CPlayerDetail)
               {
                  iTeamSitID = (this.a_1675[i] as CPlayerDetail).m_bySeat;
                  iTeamMateSex = (this.a_1675[i] as CPlayerDetail).stUserBaseInfo.eGender;
                  iTeamLevel = (this.a_1675[i] as CPlayerDetail).m_byLevel;
               }
            }
            if(Boolean(arrPlayerStatusInfo[i]) && arrPlayerStatusInfo[i].m_byTeamNo != iMyTeamId)
            {
               if(this.a_1675[i] is CPlayerDetail)
               {
                  iOppLevel = (this.a_1675[i] as CPlayerDetail).m_byLevel;
               }
            }
            if(Boolean(arrPlayerStatusInfo[i]) && i == iMySitID)
            {
               if(this.a_1675[i] is CPlayerDetail)
               {
                  iMyLevel = (this.a_1675[i] as CPlayerDetail).m_byLevel;
               }
            }
         }
         var stMyGameResult:CGameResult = null;
         var stTeamGameResult:CGameResult = null;
         for(i = 0; i < arrPlayerGameResults.length; i++)
         {
            if((arrPlayerGameResults[i] as CGameResult).m_bySeatID == iMySitID)
            {
               stMyGameResult = arrPlayerGameResults[i];
            }
            if((arrPlayerGameResults[i] as CGameResult).m_bySeatID == iTeamSitID)
            {
               stTeamGameResult = arrPlayerGameResults[i];
            }
         }
         var protocolBuffer:ByteArray = new ByteArray();
         a_2664.encode_int16(protocolBuffer,b_101.a_498);
         a_2664.encode_int8(protocolBuffer,stGameEndNotify.m_byGameMode);
         a_2664.encode_int32(protocolBuffer,stGameEndNotify.m_iMapID);
         a_2664.encode_int32(protocolBuffer,iMyLevel);
         a_2664.encode_int32(protocolBuffer,iOppLevel);
         a_2664.encode_int8(protocolBuffer,iTeamMateSex);
         a_2664.encode_int32(protocolBuffer,iTeamLevel);
         a_2664.encode_int32(protocolBuffer,stGameEndNotify.m_iRoundTime);
         a_2664.encode_int8(protocolBuffer,stGameEndNotify.m_byRoundStep);
         a_2664.encode_int32(protocolBuffer,stGameEndNotify.m_iBossID);
         a_2664.encode_int8(protocolBuffer,stGameEndNotify.m_byLoseTeamID);
         a_2664.encode_int32(protocolBuffer,stGameEndNotify.m_iRemainEnergy);
         protocolBuffer.writeObject(stMyGameResult);
         if(stTeamGameResult == null)
         {
            protocolBuffer.writeObject([]);
         }
         else
         {
            protocolBuffer.writeObject(stTeamGameResult.m_arrUseCardInfos);
         }
         a_761.a_2241(protocolBuffer);
      }
      
      public function a_2099(stPlayerAvatarsNotify:a_2701) : void
      {
         if(TDGameCoreUI.a_1666 is b_148)
         {
            TDGameCoreUI.a_1666.a_3733(stPlayerAvatarsNotify.m_arrAvatarInfoArray);
         }
      }
      
      public function a_2100(stSelectAwardsNotify:a_2706) : void
      {
         if(TDGameCoreUI.a_1666 is b_148)
         {
            TDGameCoreUI.a_1666.a_2100(stSelectAwardsNotify.m_bySeatID,stSelectAwardsNotify.m_bySelectedIndex,0,stSelectAwardsNotify.m_arrAwards);
         }
      }
      
      public function a_2182(stIntruderDropGoldOrPropNotify:a_2696) : void
      {
         if(null == TDGameCoreUI.a_757 || !TDGameCoreUI.a_757.a_3613(stIntruderDropGoldOrPropNotify))
         {
            trace("OnIntruderDropGoldOrProp failed");
         }
      }
      
      public function a_2183(stPlayerUsePropNotify:a_2707) : void
      {
         if(null == TDGameCoreUI.a_757 || !TDGameCoreUI.a_757.a_3612(stPlayerUsePropNotify))
         {
            trace("OnPlayerUseProp failed");
         }
      }
      
      public function a_2104(stGameBattleScoreNotify:a_2693) : void
      {
         var stDataEvent:a_1778 = null;
         if(null != TDGameCoreUI.a_1668)
         {
            stDataEvent = new a_1778("GameBattleScoreEvent");
            stDataEvent.dataObject = [stGameBattleScoreNotify.m_nTeam0BattleScore,stGameBattleScoreNotify.m_nTeam1BattleScore];
            TDGameCoreUI.a_1668.dispatchEvent(stDataEvent);
         }
      }
      
      public function a_2105(byEnterType:int) : void
      {
         var stDataEvent:a_1778 = null;
         if(null != TDGameCoreUI.a_1668)
         {
            stDataEvent = new a_1778("AurGameEnterExtraStage");
            stDataEvent.dataObject = byEnterType;
            TDGameCoreUI.a_1668.dispatchEvent(stDataEvent);
         }
      }
      
      public function a_2106() : void
      {
         var stTempLoader:Loader = null;
         var szResourceKey:String = null;
         if(null != TDGameCoreUI.a_1666 && Boolean(this.m_stMyPlayerDetail))
         {
            TDGameCoreUI.a_1666.a_3730(this.m_stMyPlayerDetail.m_bySeat,-1);
         }
         stTempLoader = TDGameCoreUI.a_1668;
         if(Boolean(stTempLoader) && (null == stTempLoader.contentLoaderInfo || 0 == stTempLoader.contentLoaderInfo.bytesLoaded || stTempLoader.contentLoaderInfo.bytesLoaded != stTempLoader.contentLoaderInfo.bytesTotal))
         {
            stTempLoader.unloadAndStop(true);
            TDGameCoreUI.a_1668 = null;
         }
         for(szResourceKey in TDGameCoreUI.TDGameItemsResourceLoaderArray)
         {
            stTempLoader = TDGameCoreUI.GetItemsResourceByKey(szResourceKey);
            if(Boolean(stTempLoader) && (null == stTempLoader.contentLoaderInfo || 0 == stTempLoader.contentLoaderInfo.bytesLoaded || stTempLoader.contentLoaderInfo.bytesLoaded != stTempLoader.contentLoaderInfo.bytesTotal))
            {
               stTempLoader.unloadAndStop(true);
               TDGameCoreUI.SetItemsResourceByKey(szResourceKey,null);
            }
         }
         for(szResourceKey in TDGameCoreUI.a_1670)
         {
            stTempLoader = TDGameCoreUI.a_1670[szResourceKey];
            if(Boolean(stTempLoader) && (null == stTempLoader.contentLoaderInfo || 0 == stTempLoader.contentLoaderInfo.bytesLoaded || stTempLoader.contentLoaderInfo.bytesLoaded != stTempLoader.contentLoaderInfo.bytesTotal))
            {
               stTempLoader.unloadAndStop(true);
               TDGameCoreUI.a_1670[szResourceKey] = null;
            }
         }
         for(szResourceKey in TDGameCoreUI.a_1671)
         {
            stTempLoader = TDGameCoreUI.a_1671[szResourceKey];
            if(Boolean(stTempLoader) && (null == stTempLoader.contentLoaderInfo || 0 == stTempLoader.contentLoaderInfo.bytesLoaded || stTempLoader.contentLoaderInfo.bytesLoaded != stTempLoader.contentLoaderInfo.bytesTotal))
            {
               stTempLoader.unloadAndStop(true);
               TDGameCoreUI.a_1671[szResourceKey] = null;
            }
         }
      }
      
      public function a_2107(bySeatID:int) : void
      {
         if(TDGameCoreUI.a_1666 is b_148)
         {
            TDGameCoreUI.a_1666.a_2107(bySeatID);
         }
      }
      
      public function a_2108() : Boolean
      {
         var protocolBuffer:ByteArray = new ByteArray();
         a_2664.encode_int16(protocolBuffer,b_101.a_499);
         return a_761.a_2241(protocolBuffer);
      }
      
      public function OnPlayerLaunchSkillNotify(stCNotifyPlayerUseSkill:CNotifyPlayerUseSkill) : Boolean
      {
         var stDataEvent:a_1778 = null;
         if(null != TDGameCoreUI.a_1668)
         {
            stDataEvent = new a_1778("AurPlayerLaunchSkillNotify");
            stDataEvent.dataObject = stCNotifyPlayerUseSkill;
            TDGameCoreUI.a_1668.dispatchEvent(stDataEvent);
         }
         return true;
      }
      
      public function OnAddGameEnergyNotify(stCNotifyAddGameEnergy:CNotifyAddGameEnery) : Boolean
      {
         var stDataEvent:a_1778 = null;
         if(null != TDGameCoreUI.a_1668)
         {
            stDataEvent = new a_1778("AurAddGameEneryNotify");
            stDataEvent.dataObject = stCNotifyAddGameEnergy;
            TDGameCoreUI.a_1668.dispatchEvent(stDataEvent);
         }
         return true;
      }
      
      public function OnPlayerEnergyValueNotify(stCNotifyPlayerEnergyValue:CNotifyPlayerEnergyValue) : Boolean
      {
         var stDataEvent:a_1778 = null;
         if(null != TDGameCoreUI.a_1668)
         {
            stDataEvent = new a_1778("AurPlayerEnergyVlaueNotify");
            stDataEvent.dataObject = stCNotifyPlayerEnergyValue;
            TDGameCoreUI.a_1668.dispatchEvent(stDataEvent);
         }
         return true;
      }
      
      public function OnGameMapLimitNotify(stNotify:CNotifyGameMapLimit) : Boolean
      {
         MessageTipHandler.Get().a_3146(stNotify.m_cReason);
         return true;
      }
      
      public function OnConsbenLimitNotify() : Boolean
      {
         MessageTipHandler.Get().a_3146("从本次开始，今日该副本将不再获得道具奖励");
         return true;
      }
      
      public function a_2184(arrTDCardsInfo:Array) : Boolean
      {
         if(TDGameCoreUI.a_1666 is b_148)
         {
            return TDGameCoreUI.a_1666.a_3727(arrTDCardsInfo);
         }
         return false;
      }
      
      public function a_2185(currentRole:Object) : Boolean
      {
         this.m_currentRole = currentRole;
         if(TDGameCoreUI.a_1666 is b_148)
         {
            return TDGameCoreUI.a_1666.a_3731(currentRole);
         }
         return false;
      }
      
      public function a_2081(arrTDFavoriteCardsInfo:Array) : Boolean
      {
         if(TDGameCoreUI.a_1666 is b_148)
         {
            return TDGameCoreUI.a_1666.a_3728(arrTDFavoriteCardsInfo);
         }
         return false;
      }
      
      public function a_2082(iSeatID:int, iStatus:int) : Boolean
      {
         if(TDGameCoreUI.a_1666 is b_148)
         {
            return TDGameCoreUI.a_1666.a_3729(iSeatID,iStatus);
         }
         return false;
      }
      
      public function a_2083(arrGameData:Array) : Boolean
      {
         this.m_arrGameData = arrGameData;
         TDGameCoreUI.a_1667 = TDGameCoreUI.a_921.m_stTDGameReadyUILoader;
         this.a_2192(null);
         if(TDGameCoreUI.a_1666 is b_148)
         {
         }
         return false;
      }
      
      public function OnSetDIYMouseInfo(arrMouse:Array) : Boolean
      {
         var i:int = 0;
         var arr:Array = null;
         var j:int = 0;
         if(Boolean(arrMouse) && arrMouse.length > 0)
         {
            for(i = 0; i < arrMouse.length; i++)
            {
               arr = DIYConfigData.Get().m_dictMouseSummon[parseInt(arrMouse[i],16)];
               if(Boolean(arr) && arr.length > 0)
               {
                  for(j = 0; j < arr.length; j++)
                  {
                     arrMouse.push(int(arr[j]).toString(16));
                  }
               }
            }
         }
         this.m_arrGameData.arrMouse = arrMouse;
         return true;
      }
      
      public function OnSetDIYInfo(iDIYInfo:Object) : Boolean
      {
         this.m_iDIYInfo = iDIYInfo;
         return true;
      }
      
      public function a_2084(message:String) : Boolean
      {
         if(TDGameCoreUI.a_1666 is b_148)
         {
         }
         return false;
      }
      
      public function a_2086() : Boolean
      {
         if(null == TDGameCoreUI.a_757 || !TDGameCoreUI.a_757.a_3477(4294967295))
         {
            trace("OnLGTDRightClickNotify failed");
         }
         return true;
      }
      
      public function a_2186() : Boolean
      {
         var strURL:String = null;
         if(this.m_arrGameData["TDGameReadyUI"])
         {
            strURL = this.m_arrGameData["TDGameReadyUI"];
         }
         else
         {
            strURL = "TDGameReadyUI.swf?v=" + this.m_strVersion;
         }
         var loadTask:AurLoadTask = new AurLoadTask();
         loadTask.name = "TDGameReadyUI";
         loadTask.url = strURL;
         loadTask.type = EnmLoaderType.a_502;
         loadTask.isAddToCurrentAppDomain = false;
         loadTask.stUserDefineAppDoman = new ApplicationDomain(ApplicationDomain.currentDomain);
         loadTask.loader = TDGameCoreUI.a_1667;
         if(a_3004.isLoading)
         {
            if(!a_3004.addLoadTaskWhenLoadingByObject(loadTask))
            {
               trace("addLoadTaskWhenLoadingByObject failed! [url:" + loadTask.url + ", Type:" + loadTask.type + "].");
            }
         }
         else if(!a_3004.addLoadTaskByObject(loadTask))
         {
            trace("add loadtask failed! [url:" + loadTask.url + ", Type:" + loadTask.type + "].");
         }
         a_3004.getInstance().addEventListener(EventType.a_648,this.a_2188);
         a_3004.getInstance().addEventListener(EventType.a_649,this.a_2192);
         return a_3004.startLoad();
      }
      
      public function a_2187() : Boolean
      {
         var szMouseIntruderID:String = null;
         var loadTask:AurLoadTask = null;
         var szkey:String = null;
         var iMouseID:int = 0;
         var szMouseResourceName:String = null;
         var iMapID:int = 14680064 + (0xFFFF & this.m_arrGameData["iMapID"]);
         var szMapIDStr:String = "0x" + iMapID.toString(16).toUpperCase();
         this.a_2058(1);
         a_3004.a_886 = 1;
         if(this.m_bHasLoaded == false)
         {
            this.m_bHasLoaded = true;
            this.a_1183 = this.a_1183.concat(PreLoadManager.getInstance().GetMustPreLoad());
         }
         for each(szMouseIntruderID in this.m_arrGameData["arrMouse"])
         {
            iMouseID = 8388608 + parseInt(szMouseIntruderID,16);
            if(iMouseID > 8388608)
            {
               szMouseResourceName = "0x" + iMouseID.toString(16).toLocaleUpperCase();
               if(-1 == this.a_1183.indexOf(szMouseResourceName))
               {
                  this.a_1183.push(szMouseResourceName);
               }
            }
         }
         if(null == this.a_769)
         {
            this.a_769 = new ApplicationDomain(ApplicationDomain.currentDomain);
         }
         if(null == TDGameCoreUI.a_1668)
         {
            TDGameCoreUI.a_1668 = new Loader();
            this.CreateLoadTask("TDGame2V2BattleUI","TDGame2V2BattleUI.swf",TDGameCoreUI.a_1668,EnmLoaderType.a_502,false,this.a_769,false);
         }
         if(CompositeMapHandler.Get().IsCompositeMap())
         {
            CompositeMapHandler.Get().InitComposite();
         }
         else if((this.m_arrGameData["iMapID"] & 0xF0000000) == 1610612736)
         {
            CompositeMapHandler.Get().InitComposite(this.m_iDIYInfo.m_iScenes);
         }
         else if(null == TDGameCoreUI.GetItemsResourceByKey(szMapIDStr) && szMapIDStr != "0xE00000")
         {
            TDGameCoreUI.SetItemsResourceByKey(szMapIDStr,new Loader());
            this.CreateLoadTask("BattleBackGroud","resource/" + szMapIDStr + ".swf",TDGameCoreUI.GetItemsResourceByKey(szMapIDStr));
         }
         var arr:Array = PreLoadManager.getInstance().GetAllPreLoad(this.a_1183,szMapIDStr);
         for each(szkey in arr)
         {
            if(null == TDGameCoreUI.GetItemsResourceByKey(szkey))
            {
               TDGameCoreUI.SetItemsResourceByKey(szkey,new Loader());
               this.CreateLoadTask(szkey,"resource/" + szkey + ".swf",TDGameCoreUI.GetItemsResourceByKey(szkey));
            }
         }
         a_3004.getInstance().addEventListener(EventType.a_648,this.a_2188);
         a_3004.getInstance().addEventListener(EventType.a_650,this.a_2191);
         a_3004.getInstance().addEventListener(EventType.a_652,this.a_2190);
         a_3004.getInstance().addEventListener(EventType.a_649,this.a_2193);
         a_3004.startLoad();
         return true;
      }
      
      public function a_2115() : Boolean
      {
         var loadTask:AurLoadTask = null;
         var szMouseIntruderID:String = null;
         var arr:Array = null;
         var szkey:String = null;
         var szPropkey:String = null;
         var szAvatarResourcekey:String = null;
         var iMouseID:int = 0;
         var szMouseResourceName:String = null;
         if(null == this.a_769)
         {
            this.a_769 = new ApplicationDomain(ApplicationDomain.currentDomain);
         }
         var iMapID:int = 14680064 + (0xFFFF & this.m_arrGameData["iMapID"]);
         var szMapIDStr:String = "0x" + iMapID.toString(16).toUpperCase();
         if(null == TDGameCoreUI.a_1668)
         {
            TDGameCoreUI.a_1668 = new Loader();
            this.CreateLoadTask("TDGame2V2BattleUI","TDGame2V2BattleUI.swf",TDGameCoreUI.a_1668,EnmLoaderType.a_502,false,this.a_769,false);
         }
         if(CompositeMapHandler.Get().IsCompositeMap())
         {
            CompositeMapHandler.Get().InitComposite();
         }
         else if((this.m_arrGameData["iMapID"] & 0xF0000000) == 1610612736)
         {
            CompositeMapHandler.Get().InitComposite(this.m_iDIYInfo.m_iScenes);
         }
         else if(null == TDGameCoreUI.GetItemsResourceByKey(szMapIDStr))
         {
            TDGameCoreUI.SetItemsResourceByKey(szMapIDStr,new Loader());
            this.CreateLoadTask("BattleBackGroud","resource/" + szMapIDStr + ".swf",TDGameCoreUI.GetItemsResourceByKey(szMapIDStr));
         }
         for each(szMouseIntruderID in this.m_arrGameData["arrMouse"])
         {
            iMouseID = 8388608 + parseInt(szMouseIntruderID,16);
            if(iMouseID > 8388608)
            {
               szMouseResourceName = "0x" + iMouseID.toString(16).toLocaleUpperCase();
               if(-1 == this.a_1183.indexOf(szMouseResourceName))
               {
                  this.a_1183.push(szMouseResourceName);
               }
            }
         }
         arr = PreLoadManager.getInstance().GetAllPreLoad(this.a_1183,szMapIDStr);
         for each(szkey in arr)
         {
            if(null == TDGameCoreUI.GetItemsResourceByKey(szkey))
            {
               TDGameCoreUI.SetItemsResourceByKey(szkey,new Loader());
               this.CreateLoadTask(szkey,"resource/" + szkey + ".swf",TDGameCoreUI.GetItemsResourceByKey(szkey));
            }
         }
         for each(szPropkey in this.a_1185)
         {
            if(null == TDGameCoreUI.a_1670[szPropkey])
            {
               TDGameCoreUI.a_1670[szPropkey] = new Loader();
               this.CreateLoadTask(szPropkey,"resource/props/" + szPropkey + ".swf",TDGameCoreUI.a_1670[szPropkey]);
            }
         }
         if(this.a_1184 != null)
         {
            this.a_1184.push("0x14110100");
         }
         for each(szAvatarResourcekey in this.a_1184)
         {
            if(null == TDGameCoreUI.a_1671[szAvatarResourcekey])
            {
               TDGameCoreUI.a_1671[szAvatarResourcekey] = new Loader();
               this.CreateLoadTask(szAvatarResourcekey,"resource/avatar/" + szAvatarResourcekey + ".swf",TDGameCoreUI.a_1671[szAvatarResourcekey]);
            }
         }
         a_3004.getInstance().addEventListener(EventType.a_648,this.a_2188);
         a_3004.getInstance().addEventListener(EventType.a_650,this.a_2191);
         a_3004.getInstance().addEventListener(EventType.a_649,this.a_2193);
         a_3004.startLoad();
         if(null == loadTask)
         {
            this.a_768 = true;
         }
         return true;
      }
      
      private function a_2188(a_4730:Event) : void
      {
         var loadNum:int = (a_4730 as a_1778).dataObject as int;
         trace("Loading start..");
      }
      
      private function a_2189(dataEvent:a_1778) : void
      {
         var byarrVersion:ByteArray = null;
         if("Version" == dataEvent.dataObject.name)
         {
            byarrVersion = dataEvent.dataObject.data as ByteArray;
            if(byarrVersion)
            {
               byarrVersion.uncompress();
               byarrVersion.position = 0;
               this.m_arrVersionData = byarrVersion.readObject();
               this.m_bIsLoadComplete = true;
            }
         }
         this.BeginPreLoad();
         if(this.a_772)
         {
            this.a_2056(this.a_772);
         }
         if(this.a_771)
         {
            this.a_2087(this.a_771);
         }
      }
      
      private function a_2190(a_4730:a_1778) : void
      {
         if(a_4730.dataObject == "TDGame2V2BattleUI")
         {
            a_3004.a_886 = 8;
         }
      }
      
      private function a_2191(a_4730:Event) : void
      {
         var dataObject:Object = (a_4730 as a_1778).dataObject;
         var iLoadGameResourceProgress:int = int(100 * ((dataObject.totalNum - dataObject.leftNum - 1) / dataObject.totalNum) + 100 / dataObject.totalNum * (dataObject.bytesLoaded / dataObject.bytesTotal));
         if(100 != iLoadGameResourceProgress)
         {
            this.a_2058(iLoadGameResourceProgress);
         }
      }
      
      private function a_2192(a_4730:Event) : void
      {
         trace("OnLoadGameReadyUIFinishedEvent Finished.");
         a_3004.getInstance().removeEventListener(EventType.a_648,this.a_2188);
         a_3004.getInstance().removeEventListener(EventType.a_649,this.a_2192);
         TDGameCoreUI.a_1666 = TDGameCoreUI.a_1667.content as b_148;
         if(null == TDGameCoreUI.a_1666)
         {
            trace("TDGameCoreUI.ms_stTDGameReadyUI is null");
         }
         TDGameCoreUI.a_921.a_4540();
         this.a_2194();
         if(this.GetVersionByKey("TDGame2V2BattleUI.swf") != null)
         {
            this.BeginPreLoad();
         }
      }
      
      public function BeginPreLoad() : void
      {
         var szMapIDStr:String = null;
         if((this.m_arrGameData["iMapID"] & 0xF0000000) == 1610612736)
         {
            this.a_2187();
         }
         else
         {
            szMapIDStr = "0x" + (14680064 + (0xFFFF & this.m_arrGameData["iMapID"])).toString(16).toUpperCase();
            BitMapManager.getInstance().LoadImages(BitMapManager.getInstance().GetMapPreLoadList(szMapIDStr),this.OnLoadImagesEnd);
         }
      }
      
      public function OnLoadImagesEnd() : void
      {
         this.a_2187();
      }
      
      private function a_2193(a_4730:Event) : void
      {
         this.LoadEndAndStartGame();
      }
      
      private function LoadEndAndStartGame() : void
      {
         a_4648.a_4649("Game: OnLoadGameResourceFinishedEvent  Start.");
         trace("Loading Finished.");
         a_3004.getInstance().removeEventListener(EventType.a_648,this.a_2188);
         a_3004.getInstance().removeEventListener(EventType.a_650,this.a_2191);
         a_3004.getInstance().removeEventListener(EventType.a_652,this.a_2190);
         a_3004.getInstance().removeEventListener(EventType.a_649,this.a_2193);
         TDGameCoreUI.a_757 = TDGameCoreUI.a_1668.content as b_147;
         TDGameCoreUI.a_757.SetDIYInfo(this.m_iDIYInfo,this.m_arrGameData["iMapID"]);
         if(null == TDGameCoreUI.a_757)
         {
            trace("TDGameCoreUI.ms_stTDGameBattleUI is null");
         }
         this.a_768 = true;
         if(!this.a_767)
         {
            trace("Loading Finished, not recieve game load start OnLoadGameResourceFinishedEvent return;");
            return;
         }
         if(null != TDGameCoreUI.a_1666 && Boolean(this.m_stMyPlayerDetail))
         {
            TDGameCoreUI.a_1666.a_3730(this.m_stMyPlayerDetail.m_bySeat,-2);
         }
         this.a_2195();
         this.a_759.a_2058(100);
         this.a_767 = false;
         this.a_768 = false;
         a_4648.a_4649("Game: OnLoadGameResourceFinishedEvent  End, InitialzeGameBattleUI() and PostLoadingProgress(100).");
      }
      
      private function a_2194() : Boolean
      {
         if(null == TDGameCoreUI.a_1666)
         {
            trace("TDGameCoreUI.ms_stTDGameReadyUI is null, InitialzeGameReadyUI failed");
            return false;
         }
         TDGameCoreUI.a_1666.a_3600(this);
         if(this.m_stMyPlayerDetail is CPlayerDetail)
         {
            TDGameCoreUI.a_1666.a_3721(this.m_stMyPlayerDetail);
         }
         if(this.a_1675 is Array)
         {
            TDGameCoreUI.a_1666.a_3723(this.a_1675);
         }
         if(this.m_arrGameData is Array)
         {
         }
         this.a_2064();
         return true;
      }
      
      private function a_2195() : Boolean
      {
         var i:int = 0;
         var stPlayerDetail:CPlayerDetail = null;
         var stGamePlayerDetailInfo:PlayerDetailInfo = null;
         a_4648.a_4649("Game: InitialzeGameBattleUI Start.");
         if(null == TDGameCoreUI.a_757)
         {
            trace("TDGameCoreUI.ms_stTDGameBattleUI is null, InitialzeGameBattleUI failed");
            return false;
         }
         TDGameCoreUI.a_757.a_3600(this);
         this.m_arrSelectedCards["VersionArray"] = this.m_arrVersionData;
         TDGameCoreUI.a_757.a_3604(TDGameCoreUI.TDGameItemsResourceLoaderArray,this.m_arrSelectedCards);
         TDGameCoreUI.a_757.a_3605(TDGameCoreUI.a_1670,this.m_arrSelectedCards);
         if((this.m_arrGameData["iMapID"] & 0xF0000000) == 1610612736 && this.m_iDIYInfo != null && this.m_iDIYInfo.m_bIsBanEquip == true || (this.m_arrGameData["iMapID"] & 0xFF000000) == 1358954496)
         {
            for(i = 0; i < this.m_arrPlayerAvatarDetailInfo.length; i++)
            {
               this.m_arrPlayerAvatarDetailInfo[i].m_iGunSequence = 0;
               this.m_arrPlayerAvatarDetailInfo[i].m_iGunType = 336658688;
               this.m_arrPlayerAvatarDetailInfo[i].m_iSuperGunType = 0;
               this.m_arrPlayerAvatarDetailInfo[i].m_iShieldType = 0;
            }
         }
         TDGameCoreUI.a_757.a_3606(TDGameCoreUI.a_1671,this.m_arrPlayerAvatarDetailInfo);
         TDGameCoreUI.a_757.a_3607(this.m_arrGameData);
         if(null == this.m_stSittedPlayerStatusNotify)
         {
            trace("m_stSittedPlayerStatusNotify is null, InitialzeGameBattleUI failed");
            return false;
         }
         var stSittedPlayersStatusInfo:Array = [this.m_stMyPlayerDetail.m_bySeat,this.m_stSittedPlayerStatusNotify];
         var arrGamePlayerDetailInfo:Array = [];
         for(i = 0; i < this.a_1675.length; i++)
         {
            arrGamePlayerDetailInfo[i] = null;
            if(this.a_1675[i] is CPlayerDetail)
            {
               stPlayerDetail = this.a_1675[i] as CPlayerDetail;
               stGamePlayerDetailInfo = new PlayerDetailInfo();
               stGamePlayerDetailInfo.m_iUin = stPlayerDetail.m_iUin;
               stGamePlayerDetailInfo.m_szAccount = stPlayerDetail.m_szAccount;
               stGamePlayerDetailInfo.m_szPlayerName = stPlayerDetail.m_szPlayerName;
               stGamePlayerDetailInfo.m_bySexType = stPlayerDetail.stUserBaseInfo.eGender;
               stGamePlayerDetailInfo.m_byLevel = stPlayerDetail.m_byLevel;
               stGamePlayerDetailInfo.m_iTableID = stPlayerDetail.m_iTableID;
               stGamePlayerDetailInfo.m_bySeatID = stPlayerDetail.m_bySeat;
               arrGamePlayerDetailInfo[i] = stGamePlayerDetailInfo;
            }
         }
         TDGameCoreUI.a_757.a_3603(stSittedPlayersStatusInfo,arrGamePlayerDetailInfo);
         a_4648.a_4649("Game: InitialzeGameBattleUI End.");
         return true;
      }
      
      private function a_2196() : void
      {
         if(this.a_1596 > 0)
         {
            clearTimeout(this.a_1596);
            this.a_1596 = -1;
         }
         if(TDGameCoreUI.a_1668)
         {
            TDGameCoreUI.a_1668.visible = false;
            if(TDGameCoreUI.a_921.contains(TDGameCoreUI.a_1668))
            {
               TDGameCoreUI.a_921.removeChild(TDGameCoreUI.a_1668);
            }
         }
         TDGameCoreUI.a_921.a_4540();
      }
      
      public function PostSecrityCode(iResult:int) : Boolean
      {
         a_4648.a_4649("Game: PostSecrityCode Start.");
         return this.a_759.PostSecrityCode(iResult);
      }
      
      public function PostChangeSecrityCode() : Boolean
      {
         a_4648.a_4649("Game: PostChangeSecrityCode Start.");
         return this.a_759.PostChangeSecrityCode();
      }
      
      public function OnSecrityCodeNotify(strSecrityCode:String) : void
      {
         a_4648.a_4649("Game: OnSecrityCodeNotify Start.");
         (TDGameCoreUI.a_1666 as Object).OnSecrityCodeNotify(strSecrityCode);
         a_4648.a_4649("Game: OnSecrityCodeNotify End.");
      }
      
      public function OnSendSecrityCodeNotify(strSecrityCode:String) : void
      {
         (TDGameCoreUI.a_1666 as Object).OnSendSecrityCodeNotify(strSecrityCode);
      }
      
      public function OnSecrityCodeResultNotify(resultID:int, time:int) : void
      {
         (TDGameCoreUI.a_1666 as Object).OnSecrityCodeResultNotify(resultID,time);
      }
      
      private function get CurrentDateVersion() : Date
      {
         return new Date();
      }
      
      private function CompletionPreZero(strSrc:String, iLen:int = 2) : String
      {
         for(var i:int = strSrc.length; i < iLen; i++)
         {
            strSrc = "0" + strSrc;
         }
         return strSrc;
      }
      
      private function GetTimeStringByDate(stDate:Date) : String
      {
         var strVersion:String = "";
         strVersion += stDate.getFullYear();
         strVersion += this.CompletionPreZero((stDate.getMonth() + 1).toString());
         strVersion += this.CompletionPreZero(stDate.getDate().toString());
         strVersion += this.CompletionPreZero(stDate.getHours().toString());
         strVersion += this.CompletionPreZero(stDate.getMinutes().toString());
         return strVersion + this.CompletionPreZero(stDate.getSeconds().toString());
      }
      
      private function GetVersionByKey(strUrl:String) : *
      {
         if(VersionMD5.Get().GetVersion(strUrl) != "")
         {
            return VersionMD5.Get().GetVersion(strUrl);
         }
         if(null == this.m_arrVersionData[strUrl])
         {
            if(this.m_bIsLoadComplete)
            {
               MessageTipHandler.Get().a_3146(GameStringManager.getInstance().getString(139895,[strUrl]));
            }
            return null;
         }
         return this.m_arrVersionData[strUrl];
      }
      
      private function CreateLoadTask(strName:String, strURL:String, stLoader:Loader, iType:int = 3, bIsAddToCurrentAppDomain:Boolean = false, stApplicationDomain:ApplicationDomain = null, bIsUseGameAppDomain:Boolean = true) : void
      {
         if(bIsUseGameAppDomain && null == stApplicationDomain)
         {
            stApplicationDomain = new ApplicationDomain(this.a_769);
         }
         var loadTask:AurLoadTask = new AurLoadTask();
         loadTask.name = strName;
         loadTask.url = strURL;
         loadTask.loader = stLoader;
         loadTask.type = iType;
         loadTask.isAddToCurrentAppDomain = bIsAddToCurrentAppDomain;
         loadTask.stUserDefineAppDoman = stApplicationDomain;
         var stVersion:* = this.GetVersionByKey(loadTask.url);
         if(null != stVersion)
         {
            if(stVersion is Date)
            {
               loadTask.url += "?v=" + this.GetTimeStringByDate(stVersion as Date);
            }
            else
            {
               loadTask.url += "?v=" + stVersion;
            }
         }
         else
         {
            loadTask.url += "?v=" + this.m_strVersion;
         }
         if(a_3004.isLoading)
         {
            if(!a_3004.addLoadTaskWhenLoadingByObject(loadTask))
            {
               trace("addLoadTaskWhenLoadingByObject failed! [url:" + loadTask.url + ", Type:" + loadTask.type + "].");
            }
         }
         else if(!a_3004.addLoadTaskByObject(loadTask))
         {
            trace("add loadtask failed! [url:" + loadTask.url + ", Type:" + loadTask.type + "].");
         }
      }
   }
}

