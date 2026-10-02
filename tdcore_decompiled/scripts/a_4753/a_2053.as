package a_4753
{
   import a_4717.EnmSendToGameDataType;
   import a_4718.b_102;
   import a_4722.a_1771;
   import a_4728.a_1778;
   import a_4729.a_1789;
   import a_4754.a_2161;
   import a_4759.b_153;
   import a_4781.b_212;
   import a_4788.a_4648;
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.game.maogoutd.CCardIDInfo;
   import com.aurora.protocol.game.maogoutd.CNotifyAddGameEnery;
   import com.aurora.protocol.game.maogoutd.CNotifyEntityStateChange;
   import com.aurora.protocol.game.maogoutd.CNotifyGameMapLimit;
   import com.aurora.protocol.game.maogoutd.CNotifyGameStep;
   import com.aurora.protocol.game.maogoutd.CNotifyPlayerEnergyValue;
   import com.aurora.protocol.game.maogoutd.CNotifyPlayerUseSkill;
   import com.aurora.protocol.game.maogoutd.CNotifySecrityCode;
   import com.aurora.protocol.game.maogoutd.CNotifySecrityCodeResult;
   import com.aurora.protocol.game.maogoutd.CRequestPosBOSSDamage;
   import com.aurora.protocol.game.maogoutd.CRequestPostDamageValidate;
   import com.aurora.protocol.game.maogoutd.CRequestPostEntityStateChange;
   import com.aurora.protocol.game.maogoutd.CRequestPostUseSkill;
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
   import com.aurora.protocol.game.maogoutd.a_2710;
   import com.aurora.protocol.game.maogoutd.a_2712;
   import com.aurora.protocol.game.maogoutd.a_2713;
   import com.aurora.protocol.game.maogoutd.a_2714;
   import com.aurora.protocol.game.maogoutd.a_2715;
   import com.aurora.protocol.game.maogoutd.a_2716;
   import com.aurora.protocol.game.maogoutd.a_2718;
   import com.aurora.protocol.game.maogoutd.a_2719;
   import com.aurora.protocol.game.maogoutd.a_2720;
   import com.aurora.protocol.game.maogoutd.a_2721;
   import com.aurora.protocol.game.maogoutd.a_2722;
   import com.aurora.protocol.game.maogoutd.a_2723;
   import com.aurora.protocol.game.maogoutd.a_2724;
   import com.aurora.protocol.game.maogoutd.a_2725;
   import com.aurora.protocol.game.maogoutd.a_2726;
   import com.aurora.protocol.game.maogoutd.a_2727;
   import com.aurora.protocol.logicserver.CNotifyDIYNextEnmeyWave;
   import com.aurora.ui.maogoutd.ClientLog.MessageTipHandler;
   import com.aurora.ui.maogoutd.role.a_4461;
   import com.aurora.ui.maogoutd.role.a_4463;
   import flash.utils.ByteArray;
   
   public class a_2053
   {
      
      private static var a_750:a_2053;
      
      private var a_748:a_1771 = new a_1771();
      
      private var m_stTDLobby:b_153;
      
      private var a_749:a_2179;
      
      public function a_2053()
      {
         super();
         this.a_2054(b_102.b_103,this.a_2078);
         this.a_2054(b_102.b_125,this.a_2087);
         this.a_2054(b_102.b_126,this.a_2088);
         this.a_2054(b_102.enmGameDataCmd_SC_StepSync,this.OnGameStepLock);
         this.a_2054(b_102.b_127,this.a_2089);
         this.a_2054(b_102.b_128,this.a_2090);
         this.a_2054(b_102.b_129,this.a_2091);
         this.a_2054(b_102.b_130,this.a_2092);
         this.a_2054(b_102.b_131,this.a_2093);
         this.a_2054(b_102.enmGameDataCmd_SC_EntityStateChange,this.OnEntityStateChange);
         this.a_2054(b_102.b_132,this.a_2094);
         this.a_2054(b_102.b_133,this.a_2095);
         this.a_2054(b_102.b_134,this.a_2096);
         this.a_2054(b_102.b_135,this.a_2097);
         this.a_2054(b_102.b_136,this.a_2098);
         this.a_2054(b_102.b_137,this.a_2099);
         this.a_2054(b_102.b_138,this.a_2101);
         this.a_2054(b_102.b_139,this.a_2102);
         this.a_2054(b_102.b_140,this.a_2103);
         this.a_2054(b_102.b_141,this.a_2100);
         this.a_2054(b_102.b_142,this.a_2104);
         this.a_2054(b_102.b_143,this.a_2105);
         this.a_2054(b_102.b_144,this.a_2106);
         this.a_2054(b_102.b_145,this.a_2107);
         this.a_2054(b_102.b_146,this.a_2108);
         this.a_2054(b_102.enmGameDataCmd_SC_PlayerLaunchSkill,this.OnPlayerLaunchSkillNotify);
         this.a_2054(b_102.enmGameDataCmd_SC_AddGameEnergy,this.OnAddGameEnergyNotify);
         this.a_2054(b_102.enmGameDataCmd_SC_SecrityCode,this.OnSecrityCodeNotify);
         this.a_2054(b_102.enmGameDataCmd_SC_SendSecrityCode,this.OnSendSecrityCodeNotify);
         this.a_2054(b_102.enmGameDataCmd_SC_SecrityCodeResult,this.OnSendSecrityCodeResultNotify);
         this.a_2054(b_102.enmGameDataCmd_SC_NotifyPlayerEnergyValue,this.OnPlayerEnergyValueNotify);
         this.a_2054(b_102.enmGameDataCmd_SC_GameMapLimit,this.OnGameMapLimitNotify);
         this.a_2054(b_102.enmGameDataCmd_SC_ConsbenLimit,this.OnConsbenLimitNotify);
         this.a_2054(b_102.enmGameDataCmd_SC_DIYNextEnmeyWave,this.OnDIYNextEnmeyWaveNotify);
      }
      
      public static function getInstance() : a_2053
      {
         if(null == a_750)
         {
            a_750 = new a_2053();
         }
         return a_750;
      }
      
      public function a_1797() : void
      {
         this.m_stTDLobby = a_2179.a_761;
         this.a_749 = a_2179.getInstance();
      }
      
      private function a_2054(glMessageID:uint, fnRoutine:Function) : void
      {
         if(!this.a_748.insert(glMessageID,fnRoutine))
         {
            trace("GLMessageId:" + glMessageID + " has been binded GL routine, insert failed");
         }
      }
      
      public function a_2055(protocolBuffer:ByteArray) : void
      {
         if(!protocolBuffer is ByteArray)
         {
            trace("protocolBuffer is not ByteArray, OnRecieveGameDataPackage  failed");
            return;
         }
         var iMessageID:int = int(a_2664.decode_uint8(protocolBuffer));
         if(null != this.a_748[iMessageID])
         {
            this.a_748[iMessageID](protocolBuffer);
         }
         else
         {
            trace("Can\'t find the GameDecodeRoutine for MessageID:" + iMessageID);
         }
         protocolBuffer = null;
      }
      
      public function a_2056(arrSelectCards:Array, arrAdditionValue:Array) : Boolean
      {
         var i:int = 0;
         var stCardIDInfo:CCardIDInfo = null;
         var encodeLengh:int = 0;
         if(!(arrSelectCards[0] is Array) || !(arrSelectCards[1] is Array))
         {
            trace("PostSelectedCards failed, arrSelectCards[0] is not Array or arrSelectCards[1] is not Array");
            return false;
         }
         var arrSelectCardIDInfos:Array = [];
         for(i = 0; i < arrSelectCards[0].length; i++)
         {
            stCardIDInfo = new CCardIDInfo();
            stCardIDInfo.m_iCardID = arrSelectCards[0][i].m_iCardID;
            stCardIDInfo.m_iCardSequence = arrSelectCards[0][i].m_iCardSeq;
            arrSelectCardIDInfos.push(stCardIDInfo);
         }
         var arrSelectPropIDInfos:Array = [];
         for(i = 0; i < arrSelectCards[1].length; i++)
         {
            stCardIDInfo = new CCardIDInfo();
            stCardIDInfo.m_iCardID = arrSelectCards[1][i].m_iCardID;
            stCardIDInfo.m_iCardSequence = arrSelectCards[1][i].m_iCardSeq;
            arrSelectPropIDInfos.push(stCardIDInfo);
         }
         var encodeBuffer:ByteArray = new ByteArray();
         a_2664.encode_int8(encodeBuffer,b_102.b_104);
         var stPostSelectedCardsRequest:a_2726 = new a_2726();
         stPostSelectedCardsRequest.m_byCardsCount = arrSelectCardIDInfos.length;
         stPostSelectedCardsRequest.m_arrCardIDInfos = arrSelectCardIDInfos;
         stPostSelectedCardsRequest.m_nPropCount = arrSelectPropIDInfos.length;
         stPostSelectedCardsRequest.m_arrSelectProp = arrSelectPropIDInfos;
         if(null != arrSelectCards[3])
         {
            stPostSelectedCardsRequest.m_nAvatarInfoSize = (arrSelectCards[3] as ByteArray).length;
            stPostSelectedCardsRequest.m_stAvatarInfoByteArray = arrSelectCards[3] as ByteArray;
         }
         stPostSelectedCardsRequest.m_nAvaterDefenseValue = arrAdditionValue[0];
         stPostSelectedCardsRequest.m_nExpirenceAddition = arrAdditionValue[1];
         stPostSelectedCardsRequest.m_nDropPropAddition = arrAdditionValue[2];
         stPostSelectedCardsRequest.m_nSkillAddition = arrAdditionValue[3];
         stPostSelectedCardsRequest.m_nGoldCoinAddition = arrAdditionValue[4];
         stPostSelectedCardsRequest.m_iConistraID = arrAdditionValue[5];
         stPostSelectedCardsRequest.m_iGunType = arrAdditionValue[6];
         stPostSelectedCardsRequest.m_iGunSequence = arrAdditionValue[7];
         stPostSelectedCardsRequest.m_iShieldType = arrAdditionValue[8];
         stPostSelectedCardsRequest.m_iSuperGunType = arrAdditionValue[9];
         stPostSelectedCardsRequest.m_iPetCount = arrAdditionValue[10];
         stPostSelectedCardsRequest.m_iPetCheckInfo = arrAdditionValue[11];
         stPostSelectedCardsRequest.encode(encodeBuffer,encodeLengh);
         stPostSelectedCardsRequest = null;
         return this.m_stTDLobby.a_2240(encodeBuffer);
      }
      
      public function a_2057(byTeamID:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         a_2664.encode_int8(encodeBuffer,b_102.b_105);
         var changeTeamRequest:a_2710 = new a_2710();
         changeTeamRequest.m_byTeamID = byTeamID;
         changeTeamRequest.encode(encodeBuffer,encodeLengh);
         changeTeamRequest = null;
         return this.m_stTDLobby.a_2240(encodeBuffer);
      }
      
      public function a_2058(iProgress:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         a_2664.encode_int8(encodeBuffer,b_102.b_106);
         var postLoadingProgressRequest:a_2719 = new a_2719();
         postLoadingProgressRequest.m_byLoadingProgress = iProgress;
         postLoadingProgressRequest.encode(encodeBuffer,encodeLengh);
         postLoadingProgressRequest = null;
         return this.m_stTDLobby.a_2240(encodeBuffer);
      }
      
      public function a_2059(postPlaceDefenderRequest:a_2723) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         a_2664.encode_int8(encodeBuffer,b_102.b_107);
         postPlaceDefenderRequest.encode(encodeBuffer,encodeLengh);
         postPlaceDefenderRequest = null;
         return this.m_stTDLobby.a_2240(encodeBuffer);
      }
      
      public function PostBOSSDamage(nDamageValue:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         a_2664.encode_int8(encodeBuffer,b_102.enmGameDataCmd_CS_BOSSDamage);
         var postDamageValidateRequest:CRequestPosBOSSDamage = new CRequestPosBOSSDamage();
         postDamageValidateRequest.m_nDamageValue = nDamageValue;
         postDamageValidateRequest.encode(encodeBuffer,encodeLengh);
         postDamageValidateRequest = null;
         return this.m_stTDLobby.a_2240(encodeBuffer);
      }
      
      public function PostDamageValidate(nDamageValue:int) : Boolean
      {
         var stHeroItem:a_4461 = null;
         var encodeBuffer:ByteArray = null;
         var encodeLengh:int = 0;
         var postDamageValidateRequest:CRequestPostDamageValidate = null;
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         var arrItemInfo:Array = [336658688,0,0,0,0,0];
         for each(stHeroItem in role.m_arrHeroItemID)
         {
            if(stHeroItem.CardEquipmentType == 1)
            {
               arrItemInfo[0] = stHeroItem.m_iItemID;
               arrItemInfo[1] = stHeroItem.m_iItemSeq;
            }
            else if(stHeroItem.CardEquipmentType == 10)
            {
               arrItemInfo[2] = stHeroItem.m_iItemID;
               arrItemInfo[3] = stHeroItem.m_iItemSeq;
            }
            else if(stHeroItem.CardEquipmentType == 14)
            {
               arrItemInfo[4] = stHeroItem.m_iItemID;
               arrItemInfo[5] = stHeroItem.m_iItemSeq;
            }
         }
         encodeBuffer = new ByteArray();
         a_2664.encode_int8(encodeBuffer,b_102.enmGameDataCmd_CS_DamageValidate);
         postDamageValidateRequest = new CRequestPostDamageValidate();
         postDamageValidateRequest.m_nDamageValue = nDamageValue;
         postDamageValidateRequest.m_arrItemInfo = arrItemInfo;
         postDamageValidateRequest.encode(encodeBuffer,encodeLengh);
         postDamageValidateRequest = null;
         return this.m_stTDLobby.a_2240(encodeBuffer);
      }
      
      public function a_2060(iTimeNum:int, byTeamNo:int, arrVanishDefender:Array) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         a_2664.encode_int8(encodeBuffer,b_102.b_108);
         var postDefenderVanishRequest:a_2715 = new a_2715();
         postDefenderVanishRequest.m_iTimeNum = iTimeNum;
         postDefenderVanishRequest.m_byTeamNo = byTeamNo;
         postDefenderVanishRequest.m_byDefenderCount = arrVanishDefender.length;
         postDefenderVanishRequest.m_arrVanishDefender = arrVanishDefender;
         postDefenderVanishRequest.encode(encodeBuffer,encodeLengh);
         postDefenderVanishRequest = null;
         return this.m_stTDLobby.a_2240(encodeBuffer);
      }
      
      public function PostEntityStateChange(iTimeNum:int, byTeamNo:int, arrChange:Array) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         a_2664.encode_int8(encodeBuffer,b_102.enmGameDataCmd_CS_EntityStateChange);
         var postEntityStateChange:CRequestPostEntityStateChange = new CRequestPostEntityStateChange();
         postEntityStateChange.m_iTimeNum = iTimeNum;
         postEntityStateChange.m_byTeamNo = byTeamNo;
         postEntityStateChange.m_byChangeCount = arrChange.length;
         postEntityStateChange.m_arrChange = arrChange;
         postEntityStateChange.encode(encodeBuffer,encodeLengh);
         postEntityStateChange = null;
         return this.m_stTDLobby.a_2240(encodeBuffer);
      }
      
      public function a_2061(iTimeNum:int, byTeamNo:int, arrVanishEnemy:Array) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         a_2664.encode_int8(encodeBuffer,b_102.b_109);
         var postEnemyVanishRequest:a_2716 = new a_2716();
         postEnemyVanishRequest.m_iTimeNum = iTimeNum;
         postEnemyVanishRequest.m_byTeamNo = byTeamNo;
         postEnemyVanishRequest.m_byEnemyCount = arrVanishEnemy.length;
         postEnemyVanishRequest.m_arrVanishEnemy = arrVanishEnemy;
         postEnemyVanishRequest.encode(encodeBuffer,encodeLengh);
         postEnemyVanishRequest = null;
         return this.m_stTDLobby.a_2240(encodeBuffer);
      }
      
      public function a_2062(iTimeNum:int, byBreakDownRow:int, byIsOpponentBattleField:int = 0) : Boolean
      {
         var encodeLengh:int = 0;
         a_1789.getInstance().dispatchEvent(new a_1778("a_2062"));
         var encodeBuffer:ByteArray = new ByteArray();
         a_2664.encode_int8(encodeBuffer,b_102.b_110);
         var postRowBreakDownRequest:a_2725 = new a_2725();
         postRowBreakDownRequest.m_uiTickCount = iTimeNum;
         postRowBreakDownRequest.m_byYGridNo = byBreakDownRow;
         postRowBreakDownRequest.m_byIsOpponentBattleField = byIsOpponentBattleField;
         postRowBreakDownRequest.encode(encodeBuffer,encodeLengh);
         postRowBreakDownRequest = null;
         return this.m_stTDLobby.a_2240(encodeBuffer);
      }
      
      public function a_2063(iTimeNum:int, byAvatarXGridNo:int, byAvatarYGridNo:int) : Boolean
      {
         var encodeLengh:int = 0;
         a_1789.getInstance().dispatchEvent(new a_1778("a_2063"));
         var encodeBuffer:ByteArray = new ByteArray();
         a_2664.encode_int8(encodeBuffer,b_102.b_111);
         var postAvatarBreakDownRequest:a_2712 = new a_2712();
         postAvatarBreakDownRequest.m_uiTickCount = iTimeNum;
         postAvatarBreakDownRequest.m_byAvatarXGridNo = byAvatarXGridNo;
         postAvatarBreakDownRequest.m_byAvatarYGridNo = byAvatarYGridNo;
         postAvatarBreakDownRequest.encode(encodeBuffer,encodeLengh);
         postAvatarBreakDownRequest = null;
         return this.m_stTDLobby.a_2240(encodeBuffer);
      }
      
      public function a_2064() : Boolean
      {
         var encodeBuffer:ByteArray = new ByteArray();
         a_2664.encode_int8(encodeBuffer,b_102.b_112);
         return this.m_stTDLobby.a_2240(encodeBuffer);
      }
      
      public function a_2065(nEnergyValue:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         a_2664.encode_int8(encodeBuffer,b_102.b_113);
         var postPickUpEnergyRequest:a_2720 = new a_2720();
         postPickUpEnergyRequest.m_nEnergyValue = nEnergyValue;
         postPickUpEnergyRequest.encode(encodeBuffer,encodeLengh);
         postPickUpEnergyRequest = null;
         var dataEvent:a_1778 = new a_1778("AddEnergyValue");
         dataEvent.dataObject = nEnergyValue;
         a_1789.getInstance().dispatchEvent(dataEvent);
         return this.m_stTDLobby.a_2240(encodeBuffer);
      }
      
      public function a_2066(nGoldCoinsValue:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         a_2664.encode_int8(encodeBuffer,b_102.b_114);
         var stPostPickUpGoldCoinsRequest:a_2721 = new a_2721();
         stPostPickUpGoldCoinsRequest.m_nGoldCoinsValue = nGoldCoinsValue;
         stPostPickUpGoldCoinsRequest.encode(encodeBuffer,encodeLengh);
         stPostPickUpGoldCoinsRequest = null;
         return this.m_stTDLobby.a_2240(encodeBuffer);
      }
      
      public function a_2067(nPropOrStuffSequece:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         a_2664.encode_int8(encodeBuffer,b_102.enmGameDataCmd_CS_PickupProps);
         var postPickUpPropStuffRequest:a_2722 = new a_2722();
         postPickUpPropStuffRequest.m_nPropStuffSequence = nPropOrStuffSequece;
         postPickUpPropStuffRequest.encode(encodeBuffer,encodeLengh);
         postPickUpPropStuffRequest = null;
         return this.m_stTDLobby.a_2240(encodeBuffer);
      }
      
      public function a_2068(byarrAvatarInfoByteArray:ByteArray) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         a_2664.encode_int8(encodeBuffer,b_102.b_115);
         var postAvatarInfoRequest:a_2713 = new a_2713();
         postAvatarInfoRequest.m_nMemorySize = byarrAvatarInfoByteArray.length;
         postAvatarInfoRequest.m_byarrPlayerAvatarInfoByteArray = byarrAvatarInfoByteArray;
         postAvatarInfoRequest.encode(encodeBuffer,encodeLengh);
         postAvatarInfoRequest = null;
         return this.m_stTDLobby.a_2240(encodeBuffer);
      }
      
      public function a_2069(byarrDataInfo:ByteArray) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         a_2664.encode_int8(encodeBuffer,b_102.b_121);
         var stPostDataToOtherPlayers:a_2714 = new a_2714();
         stPostDataToOtherPlayers.m_nMemorySize = byarrDataInfo.length;
         stPostDataToOtherPlayers.m_byarrOtherPlayerDataByteArray = byarrDataInfo;
         stPostDataToOtherPlayers.encode(encodeBuffer,encodeLengh);
         stPostDataToOtherPlayers = null;
         return this.m_stTDLobby.a_2240(encodeBuffer);
      }
      
      public function a_2070(arrSelectAward:Array) : Boolean
      {
         var encodeBuffer:ByteArray = new ByteArray();
         a_2664.encode_int8(encodeBuffer,b_102.b_117);
         a_2664.encode_int8(encodeBuffer,arrSelectAward[0]);
         a_2664.encode_int32(encodeBuffer,arrSelectAward[1]);
         a_2664.encode_int32(encodeBuffer,arrSelectAward[2]);
         a_2664.encode_int32(encodeBuffer,b_212.b_211());
         return this.m_stTDLobby.a_2240(encodeBuffer);
      }
      
      public function a_2071(arrAward:Array) : Boolean
      {
         var iIndex:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         a_2664.encode_int8(encodeBuffer,b_102.b_118);
         a_2664.encode_int16(encodeBuffer,arrAward.length);
         for each(iIndex in arrAward)
         {
            a_2664.encode_int16(encodeBuffer,iIndex);
         }
         return this.m_stTDLobby.a_2240(encodeBuffer);
      }
      
      public function a_2072(iTimeNum:int, iGamePropID:int, byXGridNo:int, byYGridNo:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         a_2664.encode_int8(encodeBuffer,b_102.b_116);
         var postUsePropRequest:a_2727 = new a_2727();
         postUsePropRequest.m_uiUseTimeCount = iTimeNum;
         postUsePropRequest.m_iGamePropID = iGamePropID;
         postUsePropRequest.m_byXGridNo = byXGridNo;
         postUsePropRequest.m_byYGridNo = byYGridNo;
         postUsePropRequest.encode(encodeBuffer,encodeLengh);
         postUsePropRequest = null;
         return this.m_stTDLobby.a_2240(encodeBuffer);
      }
      
      public function a_2073(byIsEnter:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         a_2664.encode_int8(encodeBuffer,b_102.b_119);
         var postEnterExtraStageRequest:a_2718 = new a_2718();
         postEnterExtraStageRequest.m_byIsEnterExtraStage = byIsEnter;
         postEnterExtraStageRequest.encode(encodeBuffer,encodeLengh);
         postEnterExtraStageRequest = null;
         return this.m_stTDLobby.a_2240(encodeBuffer);
      }
      
      public function a_2074(byStartYGrideNo:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         a_2664.encode_int8(encodeBuffer,b_102.b_120);
         var postProduceBossIntruderTeamRequest:a_2724 = new a_2724();
         postProduceBossIntruderTeamRequest.m_byStartYGrideNo = byStartYGrideNo;
         postProduceBossIntruderTeamRequest.encode(encodeBuffer,encodeLengh);
         postProduceBossIntruderTeamRequest = null;
         return this.m_stTDLobby.a_2240(encodeBuffer);
      }
      
      public function a_2075() : Boolean
      {
         var encodeBuffer:ByteArray = new ByteArray();
         a_2664.encode_int8(encodeBuffer,b_102.b_122);
         return this.m_stTDLobby.a_2240(encodeBuffer);
      }
      
      public function a_2076(byIsAccepted:int) : Boolean
      {
         var encodeBuffer:ByteArray = new ByteArray();
         a_2664.encode_int8(encodeBuffer,b_102.b_123);
         a_2664.encode_int8(encodeBuffer,byIsAccepted);
         return this.m_stTDLobby.a_2240(encodeBuffer);
      }
      
      public function a_2077() : Boolean
      {
         var encodeBuffer:ByteArray = new ByteArray();
         a_2664.encode_int8(encodeBuffer,b_102.b_124);
         return this.m_stTDLobby.a_2240(encodeBuffer);
      }
      
      public function PostRequestUseWeaponSkill(uiSkillID:uint, iUseTimeNum:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         a_2664.encode_int8(encodeBuffer,b_102.enmGameDataCmd_CS_RequestLaunchSkill);
         var stRequestPostUseSkill:CRequestPostUseSkill = new CRequestPostUseSkill();
         stRequestPostUseSkill.m_uiSkillID = uiSkillID;
         stRequestPostUseSkill.m_iUseTimeNum = iUseTimeNum;
         stRequestPostUseSkill.encode(encodeBuffer,encodeLengh);
         stRequestPostUseSkill = null;
         return this.m_stTDLobby.a_2240(encodeBuffer);
      }
      
      public function PostSecrityCode(secrityCode:int) : Boolean
      {
         var encodeBuffer:ByteArray = new ByteArray();
         a_2664.encode_int8(encodeBuffer,b_102.enmGameDataCmd_CS_InputSecrityCode);
         a_2664.encode_int32(encodeBuffer,secrityCode);
         return this.m_stTDLobby.a_2240(encodeBuffer);
      }
      
      public function PostChangeSecrityCode() : Boolean
      {
         var encodeBuffer:ByteArray = new ByteArray();
         a_2664.encode_int8(encodeBuffer,b_102.enmGameDataCmd_CS_ChangeSecrityCode);
         return this.m_stTDLobby.a_2240(encodeBuffer);
      }
      
      public function PostPlayerEnergyValueOld(iEnergyValue:int) : Boolean
      {
         var encodeBuffer:ByteArray = new ByteArray();
         a_2664.encode_int8(encodeBuffer,b_102.enmGameDataCmd_CS_PostPlayerEnergyValue);
         a_2664.encode_int32(encodeBuffer,iEnergyValue);
         return this.m_stTDLobby.a_2240(encodeBuffer);
      }
      
      public function PostPlayerEnergyValue(iEnergyValue:int, arrSelectCardIDInfos:Array) : Boolean
      {
         if(!arrSelectCardIDInfos is Array)
         {
            arrSelectCardIDInfos = [0,0];
         }
         var encodeBuffer:ByteArray = new ByteArray();
         a_2664.encode_int8(encodeBuffer,b_102.enmGameDataCmd_CS_PostPlayerEnergyValue);
         a_2664.encode_int32(encodeBuffer,iEnergyValue);
         a_2664.encode_int32(encodeBuffer,arrSelectCardIDInfos[0]);
         a_2664.encode_int32(encodeBuffer,arrSelectCardIDInfos[1]);
         return this.m_stTDLobby.a_2240(encodeBuffer);
      }
      
      private function a_2078(protocolBuffer:ByteArray) : Boolean
      {
         if(protocolBuffer == null || protocolBuffer.length <= 0)
         {
            trace("protocolBuffer is null or protocolBuffer.length <= 0");
            return false;
         }
         var byDataType:int = int(a_2664.decode_uint32(protocolBuffer));
         switch(byDataType)
         {
            case EnmSendToGameDataType.enm_td_game_cards_info:
               this.a_2079(protocolBuffer);
               break;
            case EnmSendToGameDataType.enm_td_game_get_currentrole:
               this.a_2080(protocolBuffer);
               break;
            case EnmSendToGameDataType.enm_td_game_favorite_cards_info:
               this.a_2081(protocolBuffer);
               break;
            case EnmSendToGameDataType.enm_td_game_set_seat_status:
               this.a_2082(protocolBuffer);
               break;
            case EnmSendToGameDataType.enm_td_game_current_game_data:
               this.a_2083(protocolBuffer);
               break;
            case EnmSendToGameDataType.enm_player_standup:
               this.m_stTDLobby.a_1794();
               break;
            case EnmSendToGameDataType.enm_td_game_talk_on_table:
               this.a_2084(protocolBuffer);
               break;
            case EnmSendToGameDataType.enm_td_game_talk_on_table_transfer:
               this.a_2085(protocolBuffer);
               break;
            case EnmSendToGameDataType.enm_td_rightclick_notify:
               this.a_2086(protocolBuffer);
               break;
            default:
               trace("Error EnmSendToGameDataType:[" + byDataType + "]");
               return false;
         }
         return true;
      }
      
      private function a_2079(pbyDataBuffer:ByteArray) : Boolean
      {
         var arrTDCardsInfo:Array = pbyDataBuffer.readObject() as Array;
         return this.a_749.a_2184(arrTDCardsInfo);
      }
      
      private function a_2080(pbyDataBuffer:ByteArray) : Boolean
      {
         var currentRole:Object = pbyDataBuffer.readObject();
         return this.a_749.a_2185(currentRole);
      }
      
      private function a_2081(pbyDataBuffer:ByteArray) : Boolean
      {
         var arrTDFavoriteCardsInfo:Array = pbyDataBuffer.readObject() as Array;
         return this.a_749.a_2081(arrTDFavoriteCardsInfo);
      }
      
      private function a_2082(pbyDataBuffer:ByteArray) : Boolean
      {
         var iSeatID:int = pbyDataBuffer.readByte();
         var iStatus:int = pbyDataBuffer.readByte();
         return this.a_749.a_2082(iSeatID,iStatus);
      }
      
      private function a_2083(pbyDataBuffer:ByteArray) : Boolean
      {
         var arrGameData:Array = new Array();
         var sitDown:Object = pbyDataBuffer.readObject();
         arrGameData["iMapID"] = sitDown.m_iGameMapID;
         arrGameData["byGameMode"] = sitDown.m_iGameMode;
         arrGameData["iSeatMask"] = sitDown.m_iSeatMask;
         arrGameData["iTableID"] = sitDown.m_iTableID;
         arrGameData["szTableName"] = sitDown.m_szTableName;
         arrGameData["szRoomName"] = sitDown.a_820;
         arrGameData["arrMouse"] = sitDown.m_arrMouse;
         arrGameData["byLevel"] = sitDown.m_byLevel;
         arrGameData["TDGameReadyUI"] = sitDown.TDGameReadyUI;
         arrGameData["TDGameReadyUILoader"] = sitDown.TDGameReadyUILoader;
         if(sitDown.m_iGameMapID == 0)
         {
            MessageTipHandler.Get().a_3146("下发了错误的地图ID");
         }
         return this.a_749.a_2083(arrGameData);
      }
      
      private function a_2084(pbyDataBuffer:ByteArray) : Boolean
      {
         var message:String = a_2664.decode_string(pbyDataBuffer,1024);
         return this.a_749.a_2084(message);
      }
      
      private function a_2085(pbyDataBuffer:ByteArray) : Boolean
      {
         var message:String = pbyDataBuffer.readObject();
         return this.a_749.a_2084(message);
      }
      
      private function a_2086(pbyDataBuffer:ByteArray) : Boolean
      {
         return this.a_749.a_2086();
      }
      
      private function a_2087(protocolBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         a_4648.a_4649("Game: Decode stLoadStartNotify Begin.");
         var stLoadStartNotify:a_2698 = new a_2698();
         if(!stLoadStartNotify.decode(protocolBuffer,decode_length))
         {
            trace("Error: Decode stLoadStartNotify failed.");
            a_4648.a_4649("Error: Decode stLoadStartNotify failed.");
            return;
         }
         this.a_749.a_2087(stLoadStartNotify);
      }
      
      private function a_2088(protocolBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         a_4648.a_4649("Game: Decode stGameStartNotify Begin.");
         var stGameStartNotify:a_2695 = new a_2695();
         if(!stGameStartNotify.decode(protocolBuffer,decode_length))
         {
            trace("Error: Decode stGameStartNotify failed.");
            a_4648.a_4649("Game: Error Decode stGameStartNotify failed.");
            return;
         }
         this.a_749.a_2088(stGameStartNotify);
         b_212.b_210();
      }
      
      private function OnGameStepLock(protocolBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var stGameStepNotify:CNotifyGameStep = new CNotifyGameStep();
         if(!stGameStepNotify.decode(protocolBuffer,decode_length))
         {
            a_4648.a_4649("Game: Error Decode stGameStartNotify failed.");
            return;
         }
         this.a_749.OnGameStepLock(stGameStepNotify);
      }
      
      private function a_2089(protocolBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var sittedPlayerStatusNotify:a_2709 = new a_2709();
         if(!sittedPlayerStatusNotify.decode(protocolBuffer,decode_length))
         {
            trace("Error: Decode sittedPlayerStatusNotify failed.");
            return;
         }
         this.a_749.a_2089(sittedPlayerStatusNotify);
      }
      
      private function a_2090(protocolBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var nextEnmeyWaveNotify:a_2699 = new a_2699();
         if(!nextEnmeyWaveNotify.decode(protocolBuffer,decode_length))
         {
            trace("Error: Decode nextEnmeyWaveNotify failed.");
            return;
         }
         this.a_749.a_2181(nextEnmeyWaveNotify);
      }
      
      private function OnDIYNextEnmeyWaveNotify(protocolBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var DIYnextEnmeyWaveNotify:CNotifyDIYNextEnmeyWave = new CNotifyDIYNextEnmeyWave();
         if(!DIYnextEnmeyWaveNotify.decode(protocolBuffer,decode_length))
         {
            trace("Error: Decode DIYnextEnmeyWaveNotify failed.");
            return;
         }
         this.a_749.OnAddDIYNextEnmeyWave(DIYnextEnmeyWaveNotify);
      }
      
      private function a_2091(protocolBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var stPlayerPlaceDefenderNotify:a_2704 = new a_2704();
         if(!stPlayerPlaceDefenderNotify.decode(protocolBuffer,decode_length))
         {
            trace("Error: Decode stPlayerPlaceDefenderNotify failed.");
            return;
         }
         this.a_749.a_2091(stPlayerPlaceDefenderNotify);
      }
      
      private function a_2092(protocolBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var stPlayerDefenderVanishNotify:a_2702 = new a_2702();
         if(!stPlayerDefenderVanishNotify.decode(protocolBuffer,decode_length))
         {
            trace("Error: Decode stPlayerDefenderVanishNotify failed.");
            return;
         }
         this.a_749.a_2092(stPlayerDefenderVanishNotify);
      }
      
      private function OnEntityStateChange(protocolBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var stPlayerEntityStateChangeNotify:CNotifyEntityStateChange = new CNotifyEntityStateChange();
         if(!stPlayerEntityStateChangeNotify.decode(protocolBuffer,decode_length))
         {
            trace("Error: Decode stPlayerEntityStateChangeNotify failed.");
            return;
         }
         this.a_749.OnEntityStateChange(stPlayerEntityStateChangeNotify);
      }
      
      private function a_2093(protocolBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var stPlayerEnemyVanishNotify:a_2703 = new a_2703();
         if(!stPlayerEnemyVanishNotify.decode(protocolBuffer,decode_length))
         {
            trace("Error: Decode stPlayerEnemyVanishNotify failed.");
            return;
         }
         this.a_749.a_2093(stPlayerEnemyVanishNotify);
      }
      
      private function a_2094(protocolBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var stLoadingProgressNotify:a_2697 = new a_2697();
         if(!stLoadingProgressNotify.decode(protocolBuffer,decode_length))
         {
            trace("Error: Decode stLoadingProgressNotify failed.");
            return;
         }
         this.a_749.a_2094(stLoadingProgressNotify);
      }
      
      private function a_2095(protocolBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var stRefusePlaceDefenderNotify:a_2708 = new a_2708();
         if(!stRefusePlaceDefenderNotify.decode(protocolBuffer,decode_length))
         {
            trace("Error: Decode stRefusePlaceDefenderNotify failed.");
            return;
         }
         this.a_749.a_2095(stRefusePlaceDefenderNotify);
      }
      
      private function a_2096(protocolBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var stPlayerRowBreakDownNotify:a_2705 = new a_2705();
         if(!stPlayerRowBreakDownNotify.decode(protocolBuffer,decode_length))
         {
            trace("Error: Decode stPlayerRowBreakDownNotify failed.");
            return;
         }
         this.a_749.a_2096(stPlayerRowBreakDownNotify);
      }
      
      private function a_2097(protocolBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var stPlayerAvatarBreakDownNotify:a_2700 = new a_2700();
         if(!stPlayerAvatarBreakDownNotify.decode(protocolBuffer,decode_length))
         {
            trace("Error: Decode stPlayerAvatarBreakDownNotify failed.");
            return;
         }
         this.a_749.a_2097(stPlayerAvatarBreakDownNotify);
      }
      
      private function a_2098(protocolBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var stGameEndNotify:a_2694 = new a_2694();
         if(!stGameEndNotify.decode(protocolBuffer,decode_length))
         {
            trace("Error: Decode stGameEndNotify failed.");
            return;
         }
         this.a_749.a_2098(stGameEndNotify);
      }
      
      private function a_2099(protocolBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var stPlayerAvatarInfoNotify:a_2701 = new a_2701();
         if(!stPlayerAvatarInfoNotify.decode(protocolBuffer,decode_length))
         {
            trace("Error: Decode stPlayerAvatarInfoNotify failed.");
            return;
         }
         this.a_749.a_2099(stPlayerAvatarInfoNotify);
      }
      
      private function a_2100(protocolBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var notify:a_2706 = new a_2706();
         if(!notify.decode(protocolBuffer,decode_length))
         {
            trace("Error: Decode CNotifyPlayerSelectAwards failed.");
            return;
         }
         this.a_749.a_2100(notify);
      }
      
      private function a_2101(protocolBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var stIntruderDropGoldOrPropNotify:a_2696 = new a_2696();
         if(!stIntruderDropGoldOrPropNotify.decode(protocolBuffer,decode_length))
         {
            trace("Error: Decode stIntruderDropGoldOrPropNotify failed.");
            return;
         }
         this.a_749.a_2182(stIntruderDropGoldOrPropNotify);
      }
      
      private function a_2102(protocolBuffer:ByteArray) : void
      {
      }
      
      private function a_2103(protocolBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var stPlayerUsePropNotify:a_2707 = new a_2707();
         if(!stPlayerUsePropNotify.decode(protocolBuffer,decode_length))
         {
            trace("Error: Decode stPlayerUsePropNotify failed.");
            return;
         }
         this.a_749.a_2183(stPlayerUsePropNotify);
      }
      
      private function a_2104(protocolBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var stGameBattleScoreNotify:a_2693 = new a_2693();
         if(!stGameBattleScoreNotify.decode(protocolBuffer,decode_length))
         {
            trace("Error: Decode stGameBattleScoreNotify failed.");
            return;
         }
         this.a_749.a_2104(stGameBattleScoreNotify);
      }
      
      private function a_2105(protocolBuffer:ByteArray) : void
      {
         var byEnterType:int = a_2664.decode_int8(protocolBuffer);
         this.a_749.a_2105(byEnterType);
      }
      
      private function a_2106(protocolBuffer:ByteArray) : void
      {
         this.a_749.a_2106();
      }
      
      private function a_2107(protocolBuffer:ByteArray) : void
      {
         var bySeatID:int = a_2664.decode_int8(protocolBuffer);
         this.a_749.a_2107(bySeatID);
      }
      
      private function a_2108(protocolBuffer:ByteArray) : void
      {
         this.a_749.a_2108();
      }
      
      private function OnPlayerLaunchSkillNotify(protocolBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var stCNotifyPlayerUseSkill:CNotifyPlayerUseSkill = new CNotifyPlayerUseSkill();
         if(!stCNotifyPlayerUseSkill.decode(protocolBuffer,decode_length))
         {
            trace("Error: Decode stCNotifyPlayerUseSkill failed.");
            return;
         }
         this.a_749.OnPlayerLaunchSkillNotify(stCNotifyPlayerUseSkill);
      }
      
      private function OnSecrityCodeNotify(protocolBuffer:ByteArray) : void
      {
         var stNotify:CNotifySecrityCode = new CNotifySecrityCode();
         stNotify.decode(protocolBuffer,0);
         this.a_749.OnSecrityCodeNotify(stNotify.m_cCode);
      }
      
      private function OnSendSecrityCodeNotify(protocolBuffer:ByteArray) : void
      {
         var stNotify:CNotifySecrityCode = new CNotifySecrityCode();
         stNotify.decode(protocolBuffer,0);
         this.a_749.OnSendSecrityCodeNotify(stNotify.m_cCode);
      }
      
      private function OnSendSecrityCodeResultNotify(protocolBuffer:ByteArray) : void
      {
         var stNotify:CNotifySecrityCodeResult = new CNotifySecrityCodeResult();
         stNotify.decode(protocolBuffer,0);
         this.a_749.OnSecrityCodeResultNotify(stNotify.m_iResultID,stNotify.m_iTime);
      }
      
      private function OnAddGameEnergyNotify(protocolBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var stCNotifyAddGameEnery:CNotifyAddGameEnery = new CNotifyAddGameEnery();
         if(!stCNotifyAddGameEnery.decode(protocolBuffer,decode_length))
         {
            trace("Error: Decode stCNotifyAddGameEnery failed.");
            return;
         }
         this.a_749.OnAddGameEnergyNotify(stCNotifyAddGameEnery);
      }
      
      private function OnPlayerEnergyValueNotify(protocolBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var stCNotifyPlayerEnergyValue:CNotifyPlayerEnergyValue = new CNotifyPlayerEnergyValue();
         if(!stCNotifyPlayerEnergyValue.decode(protocolBuffer,decode_length))
         {
            trace("Error: Decode stCNotifyAddGameEnery failed.");
            return;
         }
         this.a_749.OnPlayerEnergyValueNotify(stCNotifyPlayerEnergyValue);
      }
      
      private function OnGameMapLimitNotify(protocolBuffer:ByteArray) : void
      {
         var stNotify:CNotifyGameMapLimit = new CNotifyGameMapLimit();
         stNotify.decode(protocolBuffer,0);
         this.a_749.OnGameMapLimitNotify(stNotify);
      }
      
      private function OnConsbenLimitNotify(protocolBuffer:ByteArray) : void
      {
         this.a_749.OnConsbenLimitNotify();
      }
   }
}

