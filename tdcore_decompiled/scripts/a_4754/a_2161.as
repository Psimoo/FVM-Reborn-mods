package a_4754
{
   import a_4739.a_1828;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesStructComposeInfo;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesStructRecipesActive;
   
   public class a_2161 extends a_1828
   {
      
      public static var instanceNumber:int;
      
      public static var e:a_2161 = new a_2161();
      
      public function a_2161()
      {
         super();
         ++instanceNumber;
         if(instanceNumber > 1)
         {
            throw new Error("ServerDataNotify can only instance once!");
         }
      }
      
      public function GetCurrentRole() : Object
      {
         return notifyData("GetCurrentRole");
      }
      
      public function GetPositiveFriends() : Object
      {
         return notifyData("GetPositiveFriends");
      }
      
      public function getCurDuanweiQualityCfg() : Object
      {
         return notifyData("getCurDuanweiQualityCfg");
      }
      
      public function GetBeFriends() : Object
      {
         return notifyData("GetBeFriends");
      }
      
      public function a_2162() : Object
      {
         return notifyData("getRoomUserList");
      }
      
      public function GetTDCardsInfo() : Object
      {
         return notifyData("GetTDCardsInfo");
      }
      
      public function GetCardsByType(type:int) : Object
      {
         return notifyData("GetCardsByType",type);
      }
      
      public function GetPackageOpenedNumByType(type:int) : Object
      {
         return notifyData("GetPackageOpenedNumByType",type);
      }
      
      public function getEnterRoom() : Object
      {
         return notifyData("getEnterRoom");
      }
      
      public function GetTasks() : Object
      {
         return notifyData("GetTasks");
      }
      
      public function GetSitDown() : Object
      {
         return notifyData("GetSitDown");
      }
      
      public function GetGameMode() : Object
      {
         return notifyData("GetGameMode");
      }
      
      public function GetPlayerCommon() : Object
      {
         return notifyData("GetPlayerCommon");
      }
      
      public function GetRoleAchievements() : Object
      {
         return notifyData("GetRoleAchievements");
      }
      
      public function GetUseService() : Object
      {
         return notifyData("GetUseService");
      }
      
      public function GetDictTDTables() : Object
      {
         return notifyData("GetDictTDTables");
      }
      
      public function a_2163() : Object
      {
         return notifyData("getConsortiaInfo");
      }
      
      public function a_2164() : Object
      {
         return notifyData("getMyConsortiaContribute");
      }
      
      public function getConsortiaMembers() : Object
      {
         return notifyData("getConsortiaMembers");
      }
      
      public function a_2165() : Object
      {
         return notifyData("getConsortiaCurrentSkill");
      }
      
      public function GetConsortiaCurrentCompose() : Object
      {
         return notifyData("getConsortiaCurrentCompose");
      }
      
      public function a_2166() : Object
      {
         return notifyData("getMarginInfo");
      }
      
      public function a_2167() : Object
      {
         return notifyData("getMarginPoint");
      }
      
      public function getHeroMapOpen(iMapId:int) : Boolean
      {
         return notifyData("getHeroMapOpen",iMapId);
      }
      
      public function updateHeroOpen() : void
      {
         notifyData("updateHeroOpen");
      }
      
      public function GetMiShiUseNum(iMiShiType:int) : Object
      {
         return notifyData("GetMiShiUseNum",iMiShiType);
      }
      
      public function GetGuideData() : Object
      {
         return notifyData("GetGuideData");
      }
      
      public function GetDepthSeaUseNum() : Object
      {
         return notifyData("GetDepthSeaUseNum");
      }
      
      public function GetHeroProcess() : int
      {
         return notifyData("GetHeroProcess") as int;
      }
      
      public function RequestRecipesCompose(stComposeInfo:RecipesStructComposeInfo) : Boolean
      {
         return notifyData("RequestRecipesCompose",stComposeInfo);
      }
      
      public function RequestRecipesGetInfo(m_iUin:int) : Boolean
      {
         return notifyData("RequestRecipesGetInfo",m_iUin);
      }
      
      public function RequestRecipesActive(stRecipesActiv:RecipesStructRecipesActive) : Boolean
      {
         return notifyData("RequestRecipesActive",stRecipesActiv);
      }
      
      public function RequestVowRank() : Boolean
      {
         return notifyData("RequestVowRank");
      }
      
      public function onRequestMatchRank(m_iRoleUin:int, i:int) : Boolean
      {
         return notifyData("onRequestMatchRank",m_iRoleUin,i);
      }
      
      public function onRequestMatchAward(m_isrc_uin:int, m_iflag:int, m_itype:int, m_ilevel:int) : Boolean
      {
         return notifyData("onRequestMatchAward",m_isrc_uin,m_iflag,m_itype,m_ilevel);
      }
      
      public function onRequestIslandAward(m_iUin:int, m_iMapID:int, m_iConsortiaID:int, m_iType:int) : Boolean
      {
         return notifyData("onRequestIslandAward",m_iUin,m_iMapID,m_iConsortiaID,m_iType);
      }
      
      public function onRequestDistributeIslandAward(m_iUin:int, m_iMapID:int, m_iConsortiaID:int, m_iDesUin:int, m_iCount:int, m_arrAwardInfo:Array) : Boolean
      {
         return notifyData("onRequestDistributeIslandAward",m_iUin,m_iMapID,m_iConsortiaID,m_iDesUin,m_iCount,m_arrAwardInfo);
      }
      
      public function BuyChallengeCount(uin:int, coin:int, count:int) : Boolean
      {
         return notifyData("BuyChallengeCount",uin,coin,count);
      }
      
      public function GetPetSoltCount(uin:int) : Boolean
      {
         return notifyData("GetPetSoltCount",uin);
      }
      
      public function onRequestIslandRank(iUin:int) : Boolean
      {
         return notifyData("onRequestIslandRank",iUin);
      }
      
      public function GetPetSwallow(iRoleUin:int) : Boolean
      {
         return notifyData("GetPetSwallow",iRoleUin);
      }
      
      public function OpenPetSolt(iRoleUin:int, money:int, m_iCurrentPetSlotCount:int) : Boolean
      {
         return notifyData("OpenPetSolt",iRoleUin,money,m_iCurrentPetSlotCount);
      }
      
      public function GetChangePetStatus(iUin:int, id:int, seq:int, Current:int) : Boolean
      {
         return notifyData("GetChangePetStatus",iUin,id,seq,Current);
      }
      
      public function GetPetEatAnother(iUin:int, iItemID1:int, iItemSeq1:int, iItemID2:int, iItemSeq2:int) : Boolean
      {
         return notifyData("GetPetEatAnother",iUin,iItemID1,iItemSeq1,iItemID2,iItemSeq2);
      }
      
      public function CheckNewServerTask(iUin:int, iAdd:int) : Boolean
      {
         return notifyData("OnCRequestCheckNewServerTask",iUin,iAdd);
      }
      
      public function CheckNewSvrGiftLogin(iUin:int) : Boolean
      {
         return notifyData("OnCRequestNewSvrGiftLogin",iUin);
      }
      
      public function ReceieveNewSvrGift(iUin:int, iID:int) : Boolean
      {
         return notifyData("OnCCSRequestNewsvrGiftReceieve",iUin,iID);
      }
      
      public function GetNewConsortiaTaskList(iUin:int, iType:*) : Boolean
      {
         return notifyData("OnCRequestGetNewConsortiaTaskList",iUin,iType);
      }
      
      public function GetPopularityInfo(iUin:int) : Boolean
      {
         return notifyData("onRequestGetPopularityInfo",iUin);
      }
      
      public function GetPopularityAward(iUin:int, m_iLevel:*, m_iYearExp:*) : Boolean
      {
         return notifyData("onCRequstePopularityAward",iUin,m_iLevel,m_iYearExp);
      }
      
      public function GetMeiShiMatchTaskList(iUin:int, iType:*) : Boolean
      {
         return notifyData("OnCRequestFoodContestTaskList",iUin,iType);
      }
      
      public function GetFoodContestAward(data:Object) : Boolean
      {
         return notifyData("OnCRequestFoodContestAward",data);
      }
      
      public function ActivateCookerGod(iUin:int, iType:int, iPrice:int) : Boolean
      {
         return notifyData("OnCRequestFoodContestCookerGod",iUin,iType,iPrice);
      }
      
      public function BuyFoodExp(data:Object) : Boolean
      {
         return notifyData("OnCRequestFoodBuyExp",data);
      }
      
      public function OnCRequestExploreCampTaskList(iUin:int, iType:*) : Boolean
      {
         return notifyData("OnCRequestExploreCampTaskList",iUin,iType);
      }
      
      public function OnCRequestExploreCampAward(data:Object) : Boolean
      {
         return notifyData("OnCRequestExploreCampAward",data);
      }
      
      public function CompleteConsortiaTask(iUin:int, iUniqueID:int) : Boolean
      {
         return notifyData("OnCRequestCompleteNewConsortiaTask",iUin,iUniqueID);
      }
      
      public function PublishConsortiaTask(iUin:int) : Boolean
      {
         return notifyData("OnCRequestPublishNewConsortiaTask",iUin);
      }
      
      public function CheckNewConsortiaTask(iUin:int) : Boolean
      {
         return notifyData("OnCRequestCheckNewConsortiaTask",iUin);
      }
      
      public function GetLoverAward(iUin:int, iLevel:int) : Boolean
      {
         return notifyData("OnCRequestGetLoverAward",iUin,iLevel);
      }
      
      public function GetLoverInfo(iUin:int) : Boolean
      {
         return notifyData("OnCRequestGetLoverInfo",iUin);
      }
      
      public function GetProtectorInfo(iUin:int) : Boolean
      {
         return notifyData("OnCRequestGetProtectorInfo",iUin);
      }
      
      public function GetMonthCardInfo(iUin:int) : Boolean
      {
         return notifyData("OnCRequestGetMonthCardInfo",iUin);
      }
      
      public function BuyMonthCard(iUin:int, iType:int) : Boolean
      {
         return notifyData("OnCRequestBuyMonthCard",iUin,iType);
      }
      
      public function GetMonthAward(iUin:int) : Boolean
      {
         return notifyData("OnCRequestGetMonthAward",iUin);
      }
      
      public function GetMonthCardShopInfo(iUin:int) : Boolean
      {
         return notifyData("OnCRequestGetMonthCardShopInfo",iUin);
      }
      
      public function BuyMonthCardShopItem(iUin:int, iID:int) : Boolean
      {
         return notifyData("OnCRequestBuyMonthCardItem",iUin,iID);
      }
      
      public function RefreshMonthShopItem(iUin:int) : Boolean
      {
         return notifyData("OnCRequestRefreshMonthCardShop",iUin);
      }
      
      public function GetNewYearLoginGiftInfo(iUin:int) : Boolean
      {
         return notifyData("OnCRequestGetNewYearLoginGiftInfo",iUin);
      }
      
      public function NewYearLoginGift(iUin:int, iType:int, iKey:int) : Boolean
      {
         return notifyData("OnCRequestNewYearLoginGift",iUin,iType,iKey);
      }
      
      public function GetNewYearLuckyMoneyInfo(iUin:int) : Boolean
      {
         return notifyData("OnCRequestGetNewYearLuckyMoneyInfo",iUin);
      }
      
      public function NewYearLuckyMoney(iUin:int) : Boolean
      {
         return notifyData("OnCRequestNewYearLuckyMoney",iUin);
      }
      
      public function GetNewYearTurnTableInfo(iUin:int) : Boolean
      {
         return notifyData("OnCRequestGetNewYearTurnTableInfo",iUin);
      }
      
      public function NewYearTurnTable(iUin:int, iCount:int) : Boolean
      {
         return notifyData("OnCRequestNewYearTurnTable",iUin,iCount);
      }
      
      public function RequestGardenInfo(iUin:int, iConsID:int) : Boolean
      {
         return notifyData("OnCRequestGardenInfo",iUin,iConsID);
      }
      
      public function RequestGardenList(iUin:int, iConsID:int, iFrom:int, iNum:int) : Boolean
      {
         return notifyData("OnCRequestGardenList",iUin,iConsID,iFrom,iNum);
      }
      
      public function RequestGardenSow(iUin:int, iConsID:int, iTreeType:int) : Boolean
      {
         return notifyData("OnCRequestGardenSow",iUin,iConsID,iTreeType);
      }
      
      public function RequestGardenOptInfo(iUin:int, iConsID:int, iFrom:int, iNum:int) : Boolean
      {
         return notifyData("OnCRequestGardenOptInfo",iUin,iConsID,iFrom,iNum);
      }
      
      public function RequestGardenWater(iUin:int, iConsID:int) : Boolean
      {
         return notifyData("OnCRequestGardenWater",iUin,iConsID);
      }
      
      public function RequestGardenManure(iUin:int, iConsID:int) : Boolean
      {
         return notifyData("OnCRequestGardenManure",iUin,iConsID);
      }
      
      public function RequestGardenPick(iUin:int, iConsID:int) : Boolean
      {
         return notifyData("OnCRequestGardenPick",iUin,iConsID);
      }
      
      public function RequestAnimalsCoinGet(iUin:int) : Boolean
      {
         return notifyData("OnCRequestAnimalsCoinGet",iUin);
      }
      
      public function RequestAnimalsDecompose(iUin:int, iItemID:int, iCardSeq:int) : Boolean
      {
         return notifyData("OnCRequestAnimalsDecompose",iUin,iItemID,iCardSeq);
      }
      
      public function RequestAnimalsExchange(iUin:int, iItemID:int) : Boolean
      {
         return notifyData("OnCRequestAnimalsExchange",iUin,iItemID);
      }
      
      public function RequestAnimalsSummonRecordGet(iUin:int, iGroup:int) : Boolean
      {
         return notifyData("OnCRequestAnimalsSummonRecordGet",iUin,iGroup);
      }
      
      public function RequestAnimalsCall(iUin:int, iSetID:int, iCallID:int) : Boolean
      {
         return notifyData("OnCRequestAnimalsCall",iUin,iSetID,iCallID);
      }
      
      public function RequestBuyLimitItem(iUin:int, iType:int, iItemID:int) : Boolean
      {
         return notifyData("OnCRequestLimitStore",iUin,iType,iItemID);
      }
      
      public function RequestQueryLimitItem(iUin:int) : Boolean
      {
         return notifyData("OnCRequestLimitStoreCount",iUin);
      }
      
      public function RequestExploreStoreCount(iUin:int) : Boolean
      {
         return notifyData("OnCRequestExploreStoreCount",iUin);
      }
      
      public function RequestExploreStoreShop(iUin:int, iItemID:int, iCount:int) : Boolean
      {
         return notifyData("OnCRequestExploreStoreShop",iUin,iItemID,iCount);
      }
      
      public function RequestExploreDiaryInfo(iUin:int) : Boolean
      {
         return notifyData("OnCRequestExploreDiaryInfo",iUin);
      }
      
      public function RequestUpdateDiaryState(iUin:int, iType:int, iItemID:int) : Boolean
      {
         return notifyData("OnCRequestUpdateDiaryState",iUin,iType,iItemID);
      }
      
      public function RequestConsbenGet(iUin:int, iConsID:int) : Boolean
      {
         return notifyData("OnCRequestConsbenGet",iUin,iConsID);
      }
      
      public function RequestConsbenUpdate(iUin:int, iItemID:int, iNum:int) : Boolean
      {
         return notifyData("OnCRequestConsbenUpdate",iUin,iItemID,iNum);
      }
      
      public function RequestConsbenPlayerRank(iUin:int, iConsID:int, m_iBenID:int, m_iFrom:int, m_iNum:int) : Boolean
      {
         return notifyData("OnCRequestConsbenPlayerRank",iUin,iConsID,m_iBenID,m_iFrom,m_iNum);
      }
      
      public function RequestConsbenConsRank(iUin:int, iConsID:int, m_iFrom:int, m_iNum:int) : Boolean
      {
         return notifyData("OnCRequestConsbenConsRank",iUin,iConsID,m_iFrom,m_iNum);
      }
      
      public function RequestLimitReward(iUin:int, iID:int) : Boolean
      {
         return notifyData("RequestLimitReward",iUin,iID);
      }
      
      public function RequestLimitRewardInfo(iUin:int) : Boolean
      {
         return notifyData("RequestLimitRewardInfo",iUin);
      }
      
      public function RequestTarot(iUin:int, iType:int, iBox:int) : Boolean
      {
         return notifyData("onRequestTarotGet",iUin,iType,iBox);
      }
      
      public function RequestTarotInfo(iUin:int) : Boolean
      {
         return notifyData("onRequestTarotInfo",iUin);
      }
      
      public function RequestTarotAward(iUin:int, iAwardID:int) : Boolean
      {
         return notifyData("onRequestTarotAward",iUin,iAwardID);
      }
      
      public function RequestGetCrystoneSlot(iUin:int) : Boolean
      {
         return notifyData("onRequestCrystoneSlotGet",iUin);
      }
      
      public function RequestAddCrystoneSlot(iUin:int, page:int) : Boolean
      {
         return notifyData("onRequestCrystoneSlotAdd",iUin,page);
      }
      
      public function RequestSupperLuckStarExchange(iUin:int, m_iItemID:int) : Boolean
      {
         return notifyData("onRequestSupperChouJiangExchange",iUin,m_iItemID);
      }
      
      public function RequestOnePiece(iUin:int, iType:int, iBox:int, iFree:int) : Boolean
      {
         return notifyData("onRequestPrizedraw",iUin,iType,iBox,iFree);
      }
      
      public function RequestOnePieceInfo(iUin:int, iType:int) : Boolean
      {
         return notifyData("onRequestPrizeDrawInfo",iUin,iType);
      }
      
      public function RequestOnePieceAward(iUin:int, iType:int, iID:int) : Boolean
      {
         return notifyData("onRequestPrizeDrawAward",iUin,iType,iID);
      }
      
      public function RequestOnePieceBuff(iUin:int, iType:int) : Boolean
      {
         return notifyData("onRequestPrizedrawBuffInfo",iUin,iType);
      }
      
      public function RequestOnePieceChangeBuff(iUin:int, iType:int) : Boolean
      {
         return notifyData("onRequestPrizedrawChangeBuff",iUin,iType);
      }
      
      public function RequestOnePieceDecompose(iUin:int, iType:int, iID:int, iSeq:int) : Boolean
      {
         return notifyData("onRequestPrizedrawDecompose",iUin,iType,iID,iSeq);
      }
      
      public function RequestEvolution(iTabID:int, iUin:int, iCardID:int, arrItems:Array) : Boolean
      {
         return notifyData("onRequestEvolutionCard",iTabID,iUin,iCardID,arrItems);
      }
      
      public function RequestFusionCard(itype:int, iUin:int, arrCard:Array, arrAssMaterial:Array, iBuyInsuranceFlag:int = 1) : Boolean
      {
         return notifyData("onRequestFusionCard",itype,iUin,arrCard,arrAssMaterial,iBuyInsuranceFlag);
      }
      
      public function RequestFusionCardUpGrade(itype:int, iUin:int, arrCard:Array, arrAssMaterial:Array, iBuyInsuranceFlag:int = 1) : Boolean
      {
         return notifyData("onRequestFusionCardUpGrade",itype,iUin,arrCard,arrAssMaterial,iBuyInsuranceFlag);
      }
      
      public function RequestHasSecpwd(iUin:int) : Boolean
      {
         return notifyData("onRequestHasSecpwd",iUin);
      }
      
      public function RequestUpdateSecpwd(iUin:int, stOlePwd:String, stNewPwd:String) : Boolean
      {
         return notifyData("onRequestUpdateSecpwd",iUin,stOlePwd,stNewPwd);
      }
      
      public function RequestInputSecpwd(iUin:int, iSecpwd:*) : Boolean
      {
         return notifyData("onRequestInputSecpwd",iUin,iSecpwd);
      }
      
      public function RequestMonopolyInfo(iUin:int) : Boolean
      {
         return notifyData("onRequestMonopolyInfo",iUin);
      }
      
      public function RequestMonopolyPlay(iUin:int, iNumber:int) : Boolean
      {
         return notifyData("onRequestMonopolyPlay",iUin,iNumber);
      }
      
      public function RequestMonopolyRankInfo(iUin:int) : Boolean
      {
         return notifyData("onRequestMonopolyRankInfo",iUin);
      }
      
      public function RequestMonopolyRankAward(iUin:int) : Boolean
      {
         return notifyData("onRequestMonopolyRankAward",iUin);
      }
      
      public function RequestHandbookTypeData(iUin:int, type:int, platform:int, group:int, targetUin:int) : Boolean
      {
         return notifyData("onRequestHandbookTypeInfo",iUin,type,platform,group,targetUin);
      }
      
      public function RequestHandbookLightOrReceive(iUin:int, opt:int, type:int, awardType:int, awardLevel:int, activeCards:Array) : Boolean
      {
         return notifyData("onRequestHandbookLightOrReceive",iUin,opt,type,awardType,awardLevel,activeCards);
      }
      
      public function RequestHandbookAward(iUin:int, iOptType:int, iType:int) : Boolean
      {
         return notifyData("onRequestHandbookInfo",iUin,iOptType,iType);
      }
      
      public function RequestDailyPayAward(m_iUin:int, m_iID:int) : Boolean
      {
         return notifyData("onRequestDailyPayAward",m_iUin,m_iID);
      }
      
      public function RequestDailyPayInfo(m_iUin:int) : Boolean
      {
         return notifyData("onRequestDailyPayInfo",m_iUin);
      }
      
      public function RequestStoreBoxInfo(m_iUin:int) : Boolean
      {
         return notifyData("onRequestStoreBoxInfo",m_iUin);
      }
      
      public function RequesExpandStoreBox(iUin:int, iCount:int, iOpt:int, iRuleID:int, iBoxIndex:int, iBoxName:String = "") : Boolean
      {
         return notifyData("onRequesExpandStoreBox",iUin,iCount,iOpt,iRuleID,iBoxIndex,iBoxName);
      }
      
      public function RequestUpdateStoreBox(iUin:int, iBoxIndex:int, arrCards:Array) : Boolean
      {
         return notifyData("onRequestUpdateStoreBox",iUin,iBoxIndex,arrCards);
      }
      
      public function RequestGetTwoPataAward(iUin:int) : Boolean
      {
         return notifyData("onRequestGetTwoPataAward",iUin);
      }
      
      public function RequestGetSmallRoomInfo(iUin:int) : Boolean
      {
         return notifyData("onRequestGetSmallRoomInfo",iUin);
      }
      
      public function RequestBuySmallRoomGoods(iUin:int, itemID:int, type:int) : Boolean
      {
         return notifyData("onRequestBuySmallRoomGoods",iUin,itemID,type);
      }
      
      public function RequestSaveSmallRoomInfo(iUin:int, info:Array) : Boolean
      {
         return notifyData("onRequestSaveSmallRoomInfo",iUin,info);
      }
      
      public function RequestGetCrmInfo(m_iUin:int, m_iType:int) : Boolean
      {
         return notifyData("onRequestGetCrmInfo",m_iUin,m_iType);
      }
      
      public function RequestWorldBossAward(m_iUin:int, m_iID:int) : Boolean
      {
         return notifyData("onRequestWorldBossAward",m_iUin,m_iID);
      }
      
      public function RequestGetWorldBossShopInfo(m_iUin:int) : Boolean
      {
         return notifyData("onRequestGetWorldBossShop",m_iUin);
      }
      
      public function RequestWorldBossShopBuy(m_iUin:int, m_nCount:int, m_iItemID:int) : Boolean
      {
         return notifyData("onRequestBuyWorldBossShop",m_iUin,m_nCount,m_iItemID);
      }
      
      public function RequestGetSpecialActivityInfo(m_iUin:int) : Boolean
      {
         return notifyData("onRequestGetSpecialActivityInfo",m_iUin);
      }
      
      public function RequestGetSpecialActAward(m_iUin:int, m_cOpt:int, m_cCount:int, m_cAwardID:Array) : Boolean
      {
         return notifyData("onRequestGetSpecialActAward",m_iUin,m_cOpt,m_cCount,m_cAwardID);
      }
      
      public function RequestWorldBossDivideAwardMain(m_iUin:int) : Boolean
      {
         return notifyData("onRequestWorldBossDivideAwardMain",m_iUin);
      }
      
      public function RequestWorldBossDivideAward(m_iUin:int, playerAry:Array) : Boolean
      {
         return notifyData("onRequestWorldBossDivideAward",m_iUin,playerAry);
      }
      
      public function RequestWorldBossReceiveDivideAward(m_iUin:int) : Boolean
      {
         return notifyData("onRequestWorldBossReceiveDivideAward",m_iUin);
      }
   }
}

