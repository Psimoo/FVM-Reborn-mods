package a_4765
{
   import a_4716.EnmClienType;
   import a_4716.EnmConnLoginStatus;
   import a_4716.EnmExchange;
   import a_4716.EnmInviteType;
   import a_4716.a_1731;
   import a_4716.a_1740;
   import a_4716.b_154;
   import a_4720.a_1746;
   import a_4720.a_1756;
   import a_4723.a_1767;
   import a_4728.a_1778;
   import a_4729.EventType;
   import a_4729.a_1789;
   import a_4731.CommonEvent;
   import a_4752.GameStringManager;
   import a_4752.a_2033;
   import a_4754.a_2158;
   import a_4754.a_2161;
   import a_4758.a_2208;
   import a_4759.b_167;
   import a_4760.a_2251;
   import a_4763.a_2439;
   import a_4763.a_2608;
   import a_4764.a_2307;
   import a_4764.a_2332;
   import a_4771.a_2650;
   import a_4788.a_4648;
   import a_4789.a_4657;
   import com.aurora.event.activity.ActivityEventManagerFactory;
   import com.aurora.event.activity.ActivityEventType;
   import com.aurora.event.auction.a_3192;
   import com.aurora.event.charm.CharmEvent;
   import com.aurora.event.mail.MailEvent;
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.a_2670;
   import com.aurora.protocol.friend.CPlayerStatusInfo;
   import com.aurora.protocol.friend.ClientProfile;
   import com.aurora.protocol.friend.a_2676;
   import com.aurora.protocol.friend.a_2677;
   import com.aurora.protocol.friend.a_2678;
   import com.aurora.protocol.friend.a_2679;
   import com.aurora.protocol.friend.a_2680;
   import com.aurora.protocol.friend.a_2684;
   import com.aurora.protocol.friend.a_2685;
   import com.aurora.protocol.friend.a_2686;
   import com.aurora.protocol.friend.a_2687;
   import com.aurora.protocol.hallserver.*;
   import com.aurora.protocol.hallserver.FoodMatchTask.CRequestFoodBuyExp;
   import com.aurora.protocol.hallserver.FoodMatchTask.CRequestFoodContestAward;
   import com.aurora.protocol.hallserver.FoodMatchTask.CRequestFoodContestCookerGod;
   import com.aurora.protocol.hallserver.FoodMatchTask.CRequestFoodContestTaskList;
   import com.aurora.protocol.hallserver.FoodMatchTask.CResponseFoodBuyExp;
   import com.aurora.protocol.hallserver.FoodMatchTask.CResponseFoodContestAward;
   import com.aurora.protocol.hallserver.FoodMatchTask.CResponseFoodContestCookerGod;
   import com.aurora.protocol.hallserver.FoodMatchTask.CResponseFoodContestTaskComplete;
   import com.aurora.protocol.hallserver.FoodMatchTask.CResponseGetFoodContestTaskList;
   import com.aurora.protocol.hallserver.auction.CCSRequestSearchTrade;
   import com.aurora.protocol.hallserver.auction.CCSResponseTradeOperation;
   import com.aurora.protocol.hallserver.auction.CRequestBuyTradeItem;
   import com.aurora.protocol.hallserver.auction.CRequestCancelTradeItem;
   import com.aurora.protocol.hallserver.auction.CRequestGetPlayerTradeItem;
   import com.aurora.protocol.hallserver.auction.CRequestGetTradeItemList;
   import com.aurora.protocol.hallserver.auction.CRequestInsertTradeItem;
   import com.aurora.protocol.hallserver.auction.CResponseGetPlayerTradeItem;
   import com.aurora.protocol.hallserver.auction.CResponseGetTradeItemList;
   import com.aurora.protocol.hallserver.auction.CResponseSearchItem;
   import com.aurora.protocol.hallserver.auction.CTradeItem;
   import com.aurora.protocol.hallserver.carnival.CRequestCheckNewServerTask;
   import com.aurora.protocol.hallserver.carnival.CResponseCheckNewServerTask;
   import com.aurora.protocol.hallserver.changename.a_2747;
   import com.aurora.protocol.hallserver.changename.a_2748;
   import com.aurora.protocol.hallserver.charmshop.CCSRequestWeddingCharmInfo;
   import com.aurora.protocol.hallserver.charmshop.CCSResponseWeddingCharmInfo;
   import com.aurora.protocol.hallserver.charmshop.CCSResponseWeddingCharmShop;
   import com.aurora.protocol.hallserver.charmshop.CCSReuestWeddingCharmShop;
   import com.aurora.protocol.hallserver.compose.CRequestEvolution;
   import com.aurora.protocol.hallserver.compose.CRequestEvolutionArtifact;
   import com.aurora.protocol.hallserver.compose.CResponseEvolution;
   import com.aurora.protocol.hallserver.compose.CResponseEvolutionArtifact;
   import com.aurora.protocol.hallserver.compose.DelItemInfo;
   import com.aurora.protocol.hallserver.consortiacarbon.CRequestConsbenConsRank;
   import com.aurora.protocol.hallserver.consortiacarbon.CRequestConsbenGet;
   import com.aurora.protocol.hallserver.consortiacarbon.CRequestConsbenPlayerRank;
   import com.aurora.protocol.hallserver.consortiacarbon.CRequestConsbenUpdate;
   import com.aurora.protocol.hallserver.consortiacarbon.CResponseConsbenConsRank;
   import com.aurora.protocol.hallserver.consortiacarbon.CResponseConsbenGet;
   import com.aurora.protocol.hallserver.consortiacarbon.CResponseConsbenPlayerRank;
   import com.aurora.protocol.hallserver.consortiacarbon.CResponseConsbenUpdate;
   import com.aurora.protocol.hallserver.consortiagarden.CRequestGardenInfo;
   import com.aurora.protocol.hallserver.consortiagarden.CRequestGardenList;
   import com.aurora.protocol.hallserver.consortiagarden.CRequestGardenOptInfo;
   import com.aurora.protocol.hallserver.consortiagarden.CRequestGardenSow;
   import com.aurora.protocol.hallserver.consortiagarden.CRequestGardenWater;
   import com.aurora.protocol.hallserver.consortiagarden.CResponseGardenInfo;
   import com.aurora.protocol.hallserver.consortiagarden.CResponseGardenList;
   import com.aurora.protocol.hallserver.consortiagarden.CResponseGardenOptInfo;
   import com.aurora.protocol.hallserver.consortiagarden.CResponseGardenPick;
   import com.aurora.protocol.hallserver.consortiagarden.CResponseGardenSow;
   import com.aurora.protocol.hallserver.consortiagarden.CResponseGardenWater;
   import com.aurora.protocol.hallserver.consortiatask.CRequestCheckNewConsortiaTask;
   import com.aurora.protocol.hallserver.consortiatask.CRequestCompleteNewConsortiaTask;
   import com.aurora.protocol.hallserver.consortiatask.CRequestGetNewConsortiaTaskList;
   import com.aurora.protocol.hallserver.consortiatask.CRequestPublishNewConsortiaTask;
   import com.aurora.protocol.hallserver.consortiatask.CResponseCompleteConsortiaTask;
   import com.aurora.protocol.hallserver.consortiatask.CResponseCompleteNewConsortiaTask;
   import com.aurora.protocol.hallserver.consortiatask.CResponseGetNewConsortiaTaskList;
   import com.aurora.protocol.hallserver.consortiatask.CResponsePublishNewConsortiaTask;
   import com.aurora.protocol.hallserver.crossserver.CCSRequestBuyCrossDropCount;
   import com.aurora.protocol.hallserver.crossserver.CCSResponseBuyCrossDropCount;
   import com.aurora.protocol.hallserver.crystal.CCSRequestCrystoneCompose;
   import com.aurora.protocol.hallserver.crystal.CCSRequestCrystoneDecompose;
   import com.aurora.protocol.hallserver.crystal.CCSRequestCrystoneEquip;
   import com.aurora.protocol.hallserver.crystal.CCSRequestCrystoneUpgrade;
   import com.aurora.protocol.hallserver.crystal.CCSResponseCrystoneCompose;
   import com.aurora.protocol.hallserver.crystal.CCSResponseCrystoneDecompose;
   import com.aurora.protocol.hallserver.crystal.CCSResponseCrystoneEquip;
   import com.aurora.protocol.hallserver.crystal.CCSResponseCrystoneUpgrade;
   import com.aurora.protocol.hallserver.dailyRecharge.CRequestDailyPayAward;
   import com.aurora.protocol.hallserver.dailyRecharge.CRequestDailyPayInfo;
   import com.aurora.protocol.hallserver.dailyRecharge.CResponseDailyPayAward;
   import com.aurora.protocol.hallserver.dailyRecharge.CResponseDailyPayInfo;
   import com.aurora.protocol.hallserver.exchangeshop.CRequestAnimalsCall;
   import com.aurora.protocol.hallserver.exchangeshop.CRequestAnimalsCoinGet;
   import com.aurora.protocol.hallserver.exchangeshop.CRequestAnimalsDecompose;
   import com.aurora.protocol.hallserver.exchangeshop.CRequestAnimalsExchange;
   import com.aurora.protocol.hallserver.exchangeshop.CRequestAnimalsSummonRecordGet;
   import com.aurora.protocol.hallserver.exchangeshop.CResponseAnimalsCall;
   import com.aurora.protocol.hallserver.exchangeshop.CResponseAnimalsCoinGet;
   import com.aurora.protocol.hallserver.exchangeshop.CResponseAnimalsDecompose;
   import com.aurora.protocol.hallserver.exchangeshop.CResponseAnimalsExchange;
   import com.aurora.protocol.hallserver.exchangeshop.CResponseAnimalsSummonRecordGet;
   import com.aurora.protocol.hallserver.handbook.CRequestHandbookInfo;
   import com.aurora.protocol.hallserver.handbook.CResponseHandbookInfo;
   import com.aurora.protocol.hallserver.limitreward.CCSRequestLimitRewardInfo;
   import com.aurora.protocol.hallserver.limitreward.CCSRequestZhencang;
   import com.aurora.protocol.hallserver.limitreward.CCSResponseZhencang;
   import com.aurora.protocol.hallserver.limitreward.CResponseGetAccCost;
   import com.aurora.protocol.hallserver.limitstore.CRequestBuyExploreStore;
   import com.aurora.protocol.hallserver.limitstore.CRequestBuyLimitItem;
   import com.aurora.protocol.hallserver.limitstore.CRequestQueryLimitItem;
   import com.aurora.protocol.hallserver.limitstore.CRequestUpdateDiaryState;
   import com.aurora.protocol.hallserver.limitstore.CResponseBuyLimitItem;
   import com.aurora.protocol.hallserver.limitstore.CResponseExploreDiaryInfo;
   import com.aurora.protocol.hallserver.limitstore.CResponseExploreStoreInfo;
   import com.aurora.protocol.hallserver.limitstore.CResponseQueryLimitItem;
   import com.aurora.protocol.hallserver.limitstore.CResponseUpdateDiaryState;
   import com.aurora.protocol.hallserver.loverTask.CRequestGetLoverAward;
   import com.aurora.protocol.hallserver.loverTask.CRequestGetLoverInfo;
   import com.aurora.protocol.hallserver.loverTask.CRequestGetProtectorInfo;
   import com.aurora.protocol.hallserver.loverTask.CResponseGetLoverAward;
   import com.aurora.protocol.hallserver.loverTask.CResponseGetLoverInfo;
   import com.aurora.protocol.hallserver.loverTask.CResponseGetProtectorInfo;
   import com.aurora.protocol.hallserver.loverrecipe.CRequestAddCrystoneSlot;
   import com.aurora.protocol.hallserver.loverrecipe.CRequestGetCrystoneSlot;
   import com.aurora.protocol.hallserver.loverrecipe.CResponseAddCrystoneSlot;
   import com.aurora.protocol.hallserver.loverrecipe.CResponseGetCrystoneSlot;
   import com.aurora.protocol.hallserver.mail.CCSResponseMailOperation;
   import com.aurora.protocol.hallserver.mail.CMail;
   import com.aurora.protocol.hallserver.mail.CRequestDeleteMail;
   import com.aurora.protocol.hallserver.mail.CRequestPlayerMailList;
   import com.aurora.protocol.hallserver.mail.CRequestSendMail;
   import com.aurora.protocol.hallserver.mail.CRequestUpdatePlayerMailList;
   import com.aurora.protocol.hallserver.mail.CResponsePlayerMailList;
   import com.aurora.protocol.hallserver.mail.CResponseUpdatePlayerMailList;
   import com.aurora.protocol.hallserver.margintree.a_2873;
   import com.aurora.protocol.hallserver.margintree.a_2874;
   import com.aurora.protocol.hallserver.margintree.a_2875;
   import com.aurora.protocol.hallserver.margintree.a_2876;
   import com.aurora.protocol.hallserver.margintree.a_2877;
   import com.aurora.protocol.hallserver.margintree.a_2878;
   import com.aurora.protocol.hallserver.margintree.a_2879;
   import com.aurora.protocol.hallserver.margintree.a_2880;
   import com.aurora.protocol.hallserver.margintree.a_2881;
   import com.aurora.protocol.hallserver.margintree.a_2882;
   import com.aurora.protocol.hallserver.margintree.a_2883;
   import com.aurora.protocol.hallserver.margintree.a_2884;
   import com.aurora.protocol.hallserver.margintree.a_2885;
   import com.aurora.protocol.hallserver.margintree.a_2886;
   import com.aurora.protocol.hallserver.margintree.a_2887;
   import com.aurora.protocol.hallserver.margintree.a_2888;
   import com.aurora.protocol.hallserver.marriage.CRequestChangeWeddingDescription;
   import com.aurora.protocol.hallserver.marriage.CRequestGetInWeddingRoom;
   import com.aurora.protocol.hallserver.marriage.CRequestGetWeddingList;
   import com.aurora.protocol.hallserver.marriage.CRequestMarriageCertificateOperation;
   import com.aurora.protocol.hallserver.marriage.CRequestOngoingWeddingCount;
   import com.aurora.protocol.hallserver.marriage.CRequestPlayerMarriageInfo;
   import com.aurora.protocol.hallserver.marriage.CRequestReserveWedding;
   import com.aurora.protocol.hallserver.marriage.CRequestWeddingRoomOperate;
   import com.aurora.protocol.hallserver.marriage.CResponseChangeWeddingDescription;
   import com.aurora.protocol.hallserver.marriage.CResponseGetWeddingList;
   import com.aurora.protocol.hallserver.marriage.CResponseGetWeddingRoomWelfare;
   import com.aurora.protocol.hallserver.marriage.CResponseMarriageCertificateOperation;
   import com.aurora.protocol.hallserver.marriage.CResponseOngoingWeddingCount;
   import com.aurora.protocol.hallserver.marriage.CResponsePlayerGetInWeddingRoom;
   import com.aurora.protocol.hallserver.marriage.CResponsePlayerMarriageInfo;
   import com.aurora.protocol.hallserver.marriage.CResponseReserveWedding;
   import com.aurora.protocol.hallserver.marriage.CResponseWeddingRoomInfo;
   import com.aurora.protocol.hallserver.marriage.CResponseWeddingRoomOperate;
   import com.aurora.protocol.hallserver.match.CRequestDistributeIslandAward;
   import com.aurora.protocol.hallserver.match.CRequestGetIslandAward;
   import com.aurora.protocol.hallserver.match.CRequestGetIslandRank;
   import com.aurora.protocol.hallserver.match.CRequestGetMatchAward;
   import com.aurora.protocol.hallserver.match.CRequestGetMatchRank;
   import com.aurora.protocol.hallserver.match.CResponseDistributeIslandAward;
   import com.aurora.protocol.hallserver.match.CResponseGetIslandAward;
   import com.aurora.protocol.hallserver.match.CResponseGetIslandRank;
   import com.aurora.protocol.hallserver.match.CResponseGetMatchAward;
   import com.aurora.protocol.hallserver.match.CResponseGetMatchRank;
   import com.aurora.protocol.hallserver.monopoly.CRequestMonopolyInfo;
   import com.aurora.protocol.hallserver.monopoly.CRequestMonopolyPlay;
   import com.aurora.protocol.hallserver.monopoly.CRequestMonopolyRankAward;
   import com.aurora.protocol.hallserver.monopoly.CRequestMonopolyRankInfo;
   import com.aurora.protocol.hallserver.monopoly.CResponseMonopolyInfo;
   import com.aurora.protocol.hallserver.monopoly.CResponseMonopolyPlay;
   import com.aurora.protocol.hallserver.monopoly.CResponseMonopolyRankAward;
   import com.aurora.protocol.hallserver.monopoly.CResponseMonopolyRankInfo;
   import com.aurora.protocol.hallserver.monthcard.CRequestGetMonthCardInfo;
   import com.aurora.protocol.hallserver.monthcard.CRequestMonShopBuy;
   import com.aurora.protocol.hallserver.monthcard.CRequestMonthCardShopInfo;
   import com.aurora.protocol.hallserver.monthcard.CRequestRefreshMonthCardShop;
   import com.aurora.protocol.hallserver.monthcard.CResponseGetMonthCardInfo;
   import com.aurora.protocol.hallserver.monthcard.CResponseMonShopBuy;
   import com.aurora.protocol.hallserver.monthcard.CResponseMonthCardShopInfo;
   import com.aurora.protocol.hallserver.mota.CRequestGetTwoPataCount;
   import com.aurora.protocol.hallserver.mota.CResponseGetTwoPataAward;
   import com.aurora.protocol.hallserver.newmargintree.CCSRequestCharmAward;
   import com.aurora.protocol.hallserver.newmargintree.CCSRequestCharmUpdateDeclaration;
   import com.aurora.protocol.hallserver.newmargintree.CCSRequestGetCharmInfo;
   import com.aurora.protocol.hallserver.newmargintree.CCSRequestGetCharmRank;
   import com.aurora.protocol.hallserver.newmargintree.CCSRequestGetSendFlowersInfo;
   import com.aurora.protocol.hallserver.newmargintree.CCSRequestGetSendFlowersRecord;
   import com.aurora.protocol.hallserver.newmargintree.CCSRequestSendFlowers;
   import com.aurora.protocol.hallserver.newmargintree.CCSResponseCharmAward;
   import com.aurora.protocol.hallserver.newmargintree.CCSResponseCharmUpdateDeclaration;
   import com.aurora.protocol.hallserver.newmargintree.CCSResponseGetCharmInfo;
   import com.aurora.protocol.hallserver.newmargintree.CCSResponseGetCharmRank;
   import com.aurora.protocol.hallserver.newmargintree.CCSResponseGetSendFlowersRecord;
   import com.aurora.protocol.hallserver.newmargintree.CCSResponseSendFlowers;
   import com.aurora.protocol.hallserver.newsvr_gift.CCSRequestNewsvrGiftReceieve;
   import com.aurora.protocol.hallserver.newsvr_gift.CRequestNewSvrGiftLogin;
   import com.aurora.protocol.hallserver.newsvr_gift.CResponseNewSvrGiftLogin;
   import com.aurora.protocol.hallserver.newsvr_gift.CSCResponseNewscrGiftReceieve;
   import com.aurora.protocol.hallserver.newyearactivity.CRequestGetNewYearLoginGiftInfo;
   import com.aurora.protocol.hallserver.newyearactivity.CRequestGetNewYearLuckyMoneyInfo;
   import com.aurora.protocol.hallserver.newyearactivity.CRequestGetNewYearTurnTableInfo;
   import com.aurora.protocol.hallserver.newyearactivity.CRequestNewYearLoginGift;
   import com.aurora.protocol.hallserver.newyearactivity.CRequestNewYearLuckyMoney;
   import com.aurora.protocol.hallserver.newyearactivity.CRequestNewYearTurnTable;
   import com.aurora.protocol.hallserver.newyearactivity.CResponseGetNewYearLoginGiftInfo;
   import com.aurora.protocol.hallserver.newyearactivity.CResponseGetNewYearLuckyMoneyInfo;
   import com.aurora.protocol.hallserver.newyearactivity.CResponseGetNewYearTurnTableInfo;
   import com.aurora.protocol.hallserver.newyearactivity.CResponseNewYearLoginGift;
   import com.aurora.protocol.hallserver.newyearactivity.CResponseNewYearLuckyMoney;
   import com.aurora.protocol.hallserver.newyearactivity.CResponseNewYearTurnTable;
   import com.aurora.protocol.hallserver.onepiece.CRequestOnePiece;
   import com.aurora.protocol.hallserver.onepiece.CRequestOnePieceAward;
   import com.aurora.protocol.hallserver.onepiece.CRequestOnePieceDecompose;
   import com.aurora.protocol.hallserver.onepiece.CRequestOnePieceInfo;
   import com.aurora.protocol.hallserver.onepiece.CResponseOnePiece;
   import com.aurora.protocol.hallserver.onepiece.CResponseOnePieceAward;
   import com.aurora.protocol.hallserver.onepiece.CResponseOnePieceBuff;
   import com.aurora.protocol.hallserver.onepiece.CResponseOnePieceDecompose;
   import com.aurora.protocol.hallserver.onepiece.CResponseOnePieceInfo;
   import com.aurora.protocol.hallserver.recipes.CSRequestRecipesActive;
   import com.aurora.protocol.hallserver.recipes.CSRequestRecipesCompose;
   import com.aurora.protocol.hallserver.recipes.CSRequestRecipesGetInfo;
   import com.aurora.protocol.hallserver.recipes.SCResponseRecipesActive;
   import com.aurora.protocol.hallserver.recipes.SCResponseRecipesCompose;
   import com.aurora.protocol.hallserver.recipes.SCResponseRecipesGetInfo;
   import com.aurora.protocol.hallserver.report.CCSRequestReportPlayer;
   import com.aurora.protocol.hallserver.report.CCSResponseReportPlayer;
   import com.aurora.protocol.hallserver.secpwd.CRequestHasSecpwd;
   import com.aurora.protocol.hallserver.secpwd.CRequestInputSecpwd;
   import com.aurora.protocol.hallserver.secpwd.CRequestSecPwdUpdate;
   import com.aurora.protocol.hallserver.secpwd.CResponseHasSecpwd;
   import com.aurora.protocol.hallserver.secpwd.CResponseInputSecpwd;
   import com.aurora.protocol.hallserver.secpwd.CResponseNeedSecpwd;
   import com.aurora.protocol.hallserver.secpwd.CResponseSecPwdUpdate;
   import com.aurora.protocol.hallserver.sweetLand.CCRequestSweetIslandOpen;
   import com.aurora.protocol.hallserver.sweetLand.CRequestSweetIslandInfo;
   import com.aurora.protocol.hallserver.sweetLand.CResponseSweetIslandInfo;
   import com.aurora.protocol.hallserver.sweetLand.CResponseSweetIslandOpen;
   import com.aurora.protocol.hallserver.tarot.CRequestTarot;
   import com.aurora.protocol.hallserver.tarot.CRequestTarotAward;
   import com.aurora.protocol.hallserver.tarot.CRequestTarotInfo;
   import com.aurora.protocol.hallserver.tarot.CResponseTarot;
   import com.aurora.protocol.hallserver.tarot.CResponseTarotAward;
   import com.aurora.protocol.hallserver.tarot.CResponseTarotInfo;
   import com.aurora.protocol.hallserver.vow.a_2889;
   import com.aurora.protocol.hallserver.vow.a_2890;
   import com.aurora.protocol.hallserver.vow.a_2891;
   import com.aurora.protocol.hallserver.vow.a_2892;
   import com.aurora.protocol.logicserver.CCardList;
   import com.aurora.protocol.logicserver.CCardUpdateInfo;
   import com.aurora.protocol.logicserver.CCardUpdatePosition;
   import com.aurora.protocol.logicserver.a_2918;
   import com.aurora.protocol.logicserver.a_2931;
   import com.aurora.protocol.logicserver.a_2932;
   import com.aurora.protocol.logicserver.a_2934;
   import com.aurora.protocol.logicserver.a_2943;
   import com.aurora.protocol.logicserver.a_2956;
   import com.aurora.protocol.logicserver.a_2957;
   import com.aurora.protocol.logicserver.a_2959;
   import com.aurora.protocol.mail.ItemBaseWithCount;
   import com.aurora.protocol.mail.UpdateMailInfo;
   import com.aurora.protocol.mail.a_2967;
   import com.aurora.protocol.mail.a_2968;
   import com.aurora.protocol.mail.a_2969;
   import com.aurora.protocol.mail.a_2970;
   import com.aurora.protocol.mail.a_2971;
   import com.aurora.protocol.mail.a_2972;
   import com.aurora.protocol.mail.a_2973;
   import com.aurora.protocol.mail.a_2974;
   import com.aurora.protocol.task.a_2990;
   import com.aurora.protocol.task.a_2991;
   import com.aurora.protocol.task.a_2992;
   import com.aurora.protocol.task.a_2993;
   import com.aurora.protocol.task.a_2994;
   import com.aurora.protocol.task.a_2995;
   import com.aurora.protocol.task.a_2996;
   import com.aurora.protocol.task.a_2997;
   import com.aurora.protocol.task.a_2998;
   import com.aurora.protocol.task.a_2999;
   import com.aurora.protocol.task.a_3000;
   import com.aurora.protocol.task.a_3001;
   import com.aurora.ui.maogoutd.ClientLog.MessageTipHandler;
   import com.aurora.ui.maogoutd.ClientLog.SendCountInfoHandle;
   import com.aurora.ui.maogoutd.component.a_3228;
   import com.aurora.ui.maogoutd.doctor.GameDoctor;
   import com.aurora.ui.maogoutd.exchange.ExchangeEvent;
   import com.aurora.ui.maogoutd.onepiece.xml.OnePieceConfig;
   import com.aurora.ui.maogoutd.recipes.RecipesAgreementHander;
   import com.aurora.ui.maogoutd.recipes.RecipesConfig;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesStructAvtiveResponse;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesStructComposeInfo;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesStructComposeResponse;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesStructGetInfoResponse;
   import com.aurora.ui.maogoutd.recipes.datatype.RecipesStructRecipesActive;
   import com.aurora.ui.maogoutd.scoreshop.ScoreShopEvent;
   import com.aurora.ui.maogoutd.starpieceshop.StarPieceShopEvent;
   import flash.events.Event;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   
   public class a_2333 extends b_167
   {
      
      private static var a_804:a_2333;
      
      private var currTime:int;
      
      private var m_iTabID:int = -1;
      
      public function a_2333()
      {
         super();
         a_2247(b_154.a_241,this.a_2407);
         a_2247(b_154.a_235,this.a_2339);
         a_2247(b_154.a_290,this.a_2340);
         a_2247(b_154.a_291,this.a_2341);
         a_2247(b_154.a_296,this.a_2342);
         a_2247(b_154.a_226,this.a_2347);
         a_2247(b_154.a_227,this.a_2350);
         a_2247(b_154.a_225,this.a_2348);
         a_2247(b_154.a_229,this.a_2349);
         a_2247(b_154.a_298,this.a_2352);
         a_2247(b_154.a_301,this.a_2353);
         a_2247(b_154.a_299,this.a_2355);
         a_2247(b_154.a_302,this.a_2360);
         a_2247(b_154.a_304,this.a_2362);
         a_2247(b_154.a_305,this.a_2364);
         a_2247(b_154.a_223,this.OnBuyGoodsResponse);
         a_2247(b_154.a_237,this.a_2336);
         a_2247(b_154.a_313,this.a_2367);
         a_2247(b_154.a_314,this.a_2368);
         a_2247(b_154.a_315,this.a_2369);
         a_2247(b_154.a_316,this.a_2370);
         a_2247(b_154.a_317,this.a_2371);
         a_2247(b_154.a_242,this.a_2373);
         a_2247(b_154.a_282,this.a_2376);
         a_2247(b_154.a_251,this.a_2375);
         a_2247(b_154.a_174,this.a_2378);
         a_2247(b_154.a_269,this.a_2380);
         a_2247(b_154.MSG_HALL_PET_SWALLOW,this.OnPetSwallow);
         a_2247(b_154.MSG_HALL_PET_EAT_ANOTHER,this.OnGetPetEatAnother);
         a_2247(b_154.MSG_HALL_CHANGE_PET_STATUS,this.OnGetChangePetStatus);
         a_2247(b_154.MSG_HALL_GET_PET_ACCOUNT,this.OnGetPetSoltCount);
         a_2247(b_154.MSG_HALL_PET_SLOT,this.OnOpenPetSolt);
         a_2247(b_154.a_319,this.a_2382);
         a_2247(b_154.a_318,this.a_2384);
         a_2247(b_154.a_320,this.a_2386);
         a_2247(b_154.a_321,this.a_2388);
         a_2247(b_154.a_224,this.a_2390);
         a_2247(b_154.a_230,this.a_2398);
         a_2247(b_154.a_168,this.a_2399);
         a_2247(b_154.a_334,this.a_2401);
         a_2247(b_154.a_306,this.a_2403);
         a_2247(b_154.a_307,this.a_2404);
         a_2247(b_154.a_308,this.a_2357);
         a_2247(b_154.a_309,this.a_2358);
         a_2247(b_154.a_245,this.a_2405);
         a_2247(b_154.a_310,this.a_2406);
         a_2247(b_154.a_311,this.a_2414);
         a_2247(b_154.a_312,this.a_2415);
         a_2247(b_154.a_327,this.a_2409);
         a_2247(b_154.a_328,this.a_2411);
         a_2247(b_154.a_329,this.a_2413);
         a_2247(b_154.a_210,this.onMarginListData);
         a_2247(b_154.a_206,this.onMarginRegisterFriend);
         a_2247(b_154.a_207,this.onMarginReverseRegister);
         a_2247(b_154.a_208,this.onMarginRegistAdvert);
         a_2247(b_154.a_212,this.onMarginModifyAdvert);
         a_2247(b_154.a_211,this.onMarginStar);
         a_2247(b_154.a_209,this.onMarginPlayerByUin);
         a_2247(b_154.a_213,this.onMarginSearch);
         a_2247(b_154.a_228,this.onChangeNameCard);
         a_2247(b_154.a_176,this.a_2417);
         a_2247(b_154.a_177,this.a_2416);
         a_2247(b_154.a_178,this.a_2416);
         a_2247(b_154.a_336,this.OnResponseSendVow);
         a_2247(b_154.a_337,this.OnResponseGetVowNews);
         a_2247(b_154.MSG_HALL_BUY_CLIMB_TOWER_COUNT,this.OnResponseBuyClimbTowerCount);
         a_2247(b_154.MSG_HALL_BUY_INSTANCE_COUNT,this.OnResponseBuyMiShiUseNum);
         a_2247(b_154.MSG_HALL_COOKERY_COMPOSE,this.OnResponseRecipesCompose);
         a_2247(b_154.MSG_HALL_COOKERY_INFO_GET,this.OnResponseRecipesGetInfo);
         a_2247(b_154.MSG_HALL_COOKERY_STATUS_SET,this.OnResponseRecipesActive);
         a_2247(b_154.MSG_HALL_GET_GUIDE_DATA,this.OnGetGuideData);
         a_2247(b_154.MSG_HALL_UPDATE_GUIDE_DATA,this.ChangeGuideData);
         a_2247(b_154.MSG_HALL_GET_VOW_RANK_INFO_LIST,this.onResponseVowRank);
         a_2247(b_154.MSG_HALL_BUY_CHALLENGE_COUNT,this.OnBuyChallengeCount);
         a_2247(b_154.MSG_HALL_NOTIFY_REFRESH_GAME_EXT_INFO,this.NotifyRefreshGameExtInfo);
         a_2247(b_154.MSG_HALL_CHOUJIANG,this.onResponseChoujiang);
         a_2247(b_154.MSG_HALL_GET_CHOUJIANG_INFO,this.onResponseChoujiangInfo);
         a_2247(b_154.MSG_HALL_GET_ZHENCANG,this.onResponseZhencang);
         a_2247(b_154.MSG_HALL_GET_EXCHANGE_INFO,this.onResponseExchangeInfo);
         a_2247(b_154.MSG_HALL_EXCHANGE,this.onResponseExchange);
         a_2247(b_154.MSG_HALL_FORTUNE,this.onResponseChangeFortune);
         a_2247(b_154.MSG_HALL_DECOMPOSE,this.onResponseDecompose);
         a_2247(b_154.MSG_HALL_GET_WEDDING_CHARM_INFO,this.OnCCSResponseWeddingCharmInfo);
         a_2247(b_154.MSG_HALL_BUY_WEDDING_CHARM_SHOP,this.OnCCSResponseWeddingCharmShop);
         a_2247(b_154.MSG_HALL_NOTIFY_CHARMCOIN_CHANGE,this.OnCCSResponseWeddingCharmInfo);
         a_2247(b_154.MSG_HALL_GET_CHARM_RANK,this.OnCCSResponseGetCharmRank);
         a_2247(b_154.MSG_HALL_GET_CHARM_INFO,this.OnCCSResponseGetCharmInfo);
         a_2247(b_154.MSG_HALL_GET_SEND_FLOWERS_RECORD,this.OnCCSResponseGetSendFlowersRecord);
         a_2247(b_154.MSG_HALL_SEND_FLOWERS,this.OnCCSResponseSendFlowers);
         a_2247(b_154.MSG_HALL_CHARM_AWARD,this.OnCCSResponseCharmAward);
         a_2247(b_154.MSG_HALL_CHRAM_UPDATE_DECLARATION,this.OnCCSResponseCharmUpdateDeclaration);
         a_2247(b_154.MSG_HALL_GET_SEND_FLOWERS_INFO,this.OnResponseGetSendFlowersInfo);
         a_2247(b_154.MSG_HALL_CRYSTONE_COMPOSE,this.OnCCSResponseCrystoneCompose);
         a_2247(b_154.MSG_HALL_CRYSTONE_DECOMPOSE,this.OnCCSResponseCrystoneDecompose);
         a_2247(b_154.MSG_HALL_CRYSTONE_UPGRADE,this.OnCCSResponseCrystoneUpgrade);
         a_2247(b_154.MSG_HALL_CRYSTONE_EQUIP,this.OnCCSResponseCrystoneEquip);
         a_2247(b_154.MSG_HALL_GET_MATCH_RANK,this.onResponseMatchRank);
         a_2247(b_154.MSG_HALL_GET_MATCH_AWARD,this.onResponseMatchAward);
         a_2247(b_154.MSG_HALL_GET_ISLAND_RANK,this.onResponseIslandRank);
         a_2247(b_154.MSG_HALL_GET_ISLAND_AWARD,this.onResponseIslandAward);
         a_2247(b_154.MSG_HALL_DISTRIBUTE_ISLAND_AWARD,this.onResponseDistributeIslandAward);
         a_2247(b_154.MSG_HALL_STARPIECESHOP,this.onResponseStarShopPieceBuy);
         a_2247(b_154.MSG_HALL_SCORESHOP,this.onResponseScoreShop);
         a_2247(b_154.MSG_HALL_SCORESHOP_INFO,this.onResponseScoreShopInfo);
         a_2247(b_154.MSG_HALL_GET_CHARGE_ACTIVITY_INFO,this.onResponseGetRechargeActivityInfo);
         a_2247(b_154.MSG_HALL_GET_CUMULATIVE_RECHARGE_AWARD,this.onResponseGetCumulativeRechargeActivityAward);
         a_2247(b_154.MSG_HALL_GET_FIRST_RECHARGE_AWARD,this.onResponseGetFirstRechargeActivityAward);
         a_2247(b_154.MSG_HALL_GET_HOLIDAY_ACCUMULATE_AWARD,this.onResponseGetHolidayAccumulativeDiscountAward);
         a_2247(b_154.MSG_HALL_GET_HOLIDAY_SINGLE_AWARD,this.onResponseGetHolidaySingleDiscountAward);
         a_2247(b_154.MSG_HALL_GET_HOLIDAY_EXCHANGE_INFO,this.onResponseGetHolidayExchangeInfo);
         a_2247(b_154.MSG_HALL_REQUEST_HOLIDAY_EXCHANGE,this.onResponseGetHolidayExchangeDiscountAward);
         a_2247(b_154.MSG_HALL_MAIL_LIST,this.OnCResponsePlayerMailList);
         a_2247(b_154.MSG_HALL_SEND_MAIL,this.OnCCSResponseMailOperation);
         a_2247(b_154.MSG_HALL_DELETE_MAIL,this.OnCCSResponseMailOperation);
         a_2247(b_154.MSG_HALL_READ_MAIL,this.OnCCSResponseMailOperation);
         a_2247(b_154.MSG_HALL_FETCH_MAIL_ITEM,this.OnCCSResponseMailOperation);
         a_2247(b_154.MSG_HALL_UPDATE_MAIL_LIST,this.OnCResponseUpdatePlayerMailList);
         a_2247(b_154.MSG_HALL_NOTIFY_NEW_MAIL,this.OnCCSNotifyNewMail);
         a_2247(b_154.MSG_HALL_GET_TRADE_LIST,this.OnCResponseGetTradeItemList);
         a_2247(b_154.MSG_HALL_GET_PLAYER_TRADE_ITEM,this.OnCResponseGetPlayerTradeItem);
         a_2247(b_154.MSG_HALL_BUY_TRADE_ITEM,this.OnCCSResponseTradeOperation);
         a_2247(b_154.MSG_HALL_CANCEL_TRADE,this.OnCCSResponseTradeOperation);
         a_2247(b_154.MSG_HALL_INSERT_TRADE_ITEM,this.OnCCSResponseTradeOperation);
         a_2247(b_154.MSG_HALL_SEARCH_TRADE,this.OnCResponseSearchItem);
         a_2247(b_154.MSG_HALL_GET_PLAYER_MARRIAGE_INFO,this.OnResponseGetPlayerMarriageInfo);
         a_2247(b_154.MSG_HALL_MARRIAGE_CERTIFICATE_OPERATION,this.OnResponseMarriageCertificateOperation);
         a_2247(b_154.MSG_HALL_CHANGE_WEDDING_DECLARATION,this.OnResponseChangeWeddingDeclaration);
         a_2247(b_154.MSG_HALL_GET_ONGOING_WEDDING_COUNT,this.OnResponseOngoingWeddingCount);
         a_2247(b_154.MSG_HALL_GET_WEDDING_LIST,this.OnResponseGetWeddingList);
         a_2247(b_154.MSG_HALL_RESERVE_WEDDING,this.OnResponseReserveWedding);
         a_2247(b_154.MSG_HALL_WEDDING_ROOM_OPERATION,this.OnResponseWeddingRoomOperate);
         a_2247(b_154.MSG_HALL_WEDDING_GET_IN_ROOM,this.OnResponseGetInWeddingRoom);
         a_2247(b_154.MSG_HALL_GET_IN_WEDDING_PLAYER_INFO,this.OnResponsePlayerGetInWeddingRoom);
         a_2247(b_154.MSG_HALL_GET_WEDDING_WELFARE,this.OnResponseGetWeddingRoomWelfare);
         a_2247(b_154.MSG_HALL_CHECK_NEW_SVR_TASK,this.OnResponseCheckNewServerTask);
         a_2247(b_154.MSG_HALL_GET_NEW_TASK_LIST,this.OnResponseGetNewConsortiaTaskList);
         a_2247(b_154.MSG_HALL_COMPLETE_NEW_TASK,this.OnResponseCompleteNewConsortiaTask);
         a_2247(b_154.MSG_HALL_PUBLISH_CONSORTIA_MASTER_TASK,this.OnResponsePublishNewConsortiaTask);
         a_2247(b_154.MSG_NOTIFY_NEW_TASK_COMPLETE,this.OnResponseCompleteConsortiaTask);
         a_2247(b_154.MSG_HALL_REQUEST_REPORT_PLAYER,this.OnCCSResponseReportPlayer);
         a_2247(b_154.MSG_HALL_GET_SWEET_INFO,this.OnResponseGetLoverInfo);
         a_2247(b_154.MSG_HALL_GET_SWEET_AWARD,this.OnResponseGetLoverAward);
         a_2247(b_154.MSG_HALL_GET_LOVE_BUFF_INFO,this.OnResponseGetProtectorInfo);
         a_2247(b_154.MSG_HALL_GET_FOOD_CONTEST_LIST,this.OnCResponseGetFoodContestTaskList);
         a_2247(b_154.MSG_HALL_NOTIFY_FOOD_CONTEST_TASK_COMPLETE,this.OnCResponseFoodContestTaskComplete);
         a_2247(b_154.MSG_HALL_GET_FOOD_CONTEST_AWARD,this.OnCResponseFoodContestAward);
         a_2247(b_154.MSG_HALL_ACTIVATING_COOKER_GOD_AWARD,this.OnCResponseFoodContestCookerGod);
         a_2247(b_154.MSG_HALL_BUY_FOOD_EXP,this.OnCResponseFoodBuyExp);
         a_2247(b_154.MSG_HALL_GET_CAMP_LIST,this.OnCResponseExploreCampTaskList);
         a_2247(b_154.MSG_HALL_NOTIFY_CAMP_TASK_COMPLETE,this.OnCResponseExploreCampTaskComplete);
         a_2247(b_154.MSG_HALL_GET_CAMP_AWARD,this.OnCResponseExploreCampAward);
         a_2247(b_154.MSG_HALL_GET_POPULARITY_INFO,this.onResponseGetPopularityInfo);
         a_2247(b_154.MSG_HALL_NOTIFY_POPULARITY_TASK_COMPLETE,this.onCNotifyPopularityTaskComplete);
         a_2247(b_154.MSG_HALL_AWARD_POPULARITY,this.onCResponsePopularityAward);
         a_2247(b_154.MSG_HALL_GET_MONTH_CARD_INFO,this.OnResponseGetMonthCardInfo);
         a_2247(b_154.MSG_HALL_BUY_MONTH_CARD,this.OnResponseBuyMonthCard);
         a_2247(b_154.MSG_HALL_GET_MONTH_CARD_AWARD,this.OnResponseGetMonthAward);
         a_2247(b_154.MSG_HALL_MONTHCARD_SHOP_REFRESH,this.OnResponseRefreshMonthCardShop);
         a_2247(b_154.MSG_HALL_MONTHCARD_SHOP_BUY,this.OnResponseBuyMonthCardItem);
         a_2247(b_154.MSG_HALL_MONTHCARD_INFO,this.OnResponseGetMonthCardShopInfo);
         a_2247(b_154.MSG_HALL_NEW_YEAR_LOGIN_GIFT_INFO,this.OnResponseGetNewYearLoginGiftInfo);
         a_2247(b_154.MSG_HALL_GET_NEW_YEAR_LOGIN_GIFT,this.OnResponseNewYearLoginGift);
         a_2247(b_154.MSG_HALL_NEW_YEAR_LUCKY_MONEY_INFO,this.OnResponseGetNewYearLuckyMoneyInfo);
         a_2247(b_154.MSG_HALL_NEW_YEAR_LUCKY_MONEY_GET,this.OnResponseNewYearLuckyMoney);
         a_2247(b_154.MSG_HALL_GET_TURNTABLE_INFO,this.OnResponseGetNewYearTurnTableInfo);
         a_2247(b_154.MSG_HALL_PLAY_TURNTABLE,this.OnResponseNewYearTurnTable);
         a_2247(b_154.MSG_HALL_GARDEN_INFO,this.OnCResponseGardenInfo);
         a_2247(b_154.MSG_HALL_GARDEN_LIST,this.OnCResponseGardenList);
         a_2247(b_154.MSG_HALL_GARDEN_SOW,this.OnCResponseGardenSow);
         a_2247(b_154.MSG_HALL_GARDEN_OPT_INFO,this.OnCResponseGardenOptInfo);
         a_2247(b_154.MSG_HALL_GARDEN_WATER,this.OnCResponseGardenWater);
         a_2247(b_154.MSG_HALL_GARDEN_MANURE,this.OnCResponseGardenManure);
         a_2247(b_154.MSG_HALL_GARDEN_PICK,this.OnCResponseGardenPick);
         a_2247(b_154.MSG_HALL_SWEET_ISLAND_INFO,this.OnCResponseSweetIslandInfo);
         a_2247(b_154.MSG_HALL_SWEET_ISLAND_OPEN,this.OnCResponseSweetIslandOpen);
         a_2247(b_154.MSG_HALL_GET_ANIMALS_COIN,this.OnCResponseAnimalsCoin);
         a_2247(b_154.MSG_HALL_ANIMALS_CARD_DECOMPOSE,this.OnCResponseAnimalsDecompose);
         a_2247(b_154.MSG_HALL_ANIMALS_CARD_EXCHANGE,this.OnCResponseAnimalsExchange);
         a_2247(b_154.MSG_HALL_ANIMALS_CARD_CALL_INFO,this.OnCResponseAnimalsSummonRecord);
         a_2247(b_154.MSG_HALL_ANIMALS_CALL,this.OnCResponseAnimalsCall);
         a_2247(b_154.MSG_HALL_LIMIT_SHOP,this.OnCResponseLimitStore);
         a_2247(b_154.MSG_HALL_LIMIT_SHOP_COUNT,this.OnCResponseLimitStoreCount);
         a_2247(b_154.MSG_HALL_GET_CAMP_SHOP,this.OnCResponseExploreStoreCount);
         a_2247(b_154.MSG_HALL_LIMIT_CAMP_SHOP,this.OnCResponseExploreStoreShop);
         a_2247(b_154.MSG_HALL_GET_CAMP_RECORD,this.OnCResponseExploreDiaryInfo);
         a_2247(b_154.MSG_HALL_UPDATE_DIAR_SATE,this.OnCResponseUpdateDiaryState);
         a_2247(b_154.MSG_HALL_CONSBEN_INFO,this.OnCResponseConsbenGet);
         a_2247(b_154.MSG_HALL_DONATE_CONSBEN_PIECE,this.OnCResponseConsbenUpdate);
         a_2247(b_154.MSG_HALL_CONSBEN_PLAYER_RANK,this.OnCResponseConsbenPlayerRank);
         a_2247(b_154.MSG_HALL_CONSBEN_CONS_RANK,this.OnCResponseConsbenConsRank);
         a_2247(b_154.MSG_HALL_LIMIT_REWARD_INFO,this.OnCResponseGetAccCost);
         a_2247(b_154.MSG_HALL_LIMIT_REWARD,this.onCCSResponseZhencang);
         a_2247(b_154.MSG_HALL_PLAY_TAROT,this.onResponseTarotGet);
         a_2247(b_154.MSG_HALL_TAROT_INFO,this.onResponseTarotInfo);
         a_2247(b_154.MSG_HALL_TAROT_AWARD,this.onResponseTarotAward);
         a_2247(b_154.MSG_HALL_CRYSTONE_SLOT_GET,this.onResponseCrystoneSlotGet);
         a_2247(b_154.MSG_HALL_CRYSTONE_SLOT_ADD,this.onResponseCrystoneSlotAdd);
         a_2247(b_154.MSG_HALL_BUY_CROSS_DROP_COUNT,this.OnResponseBuyCrossDropCount);
         a_2247(b_154.MSG_HALL_PRIZE_DRAW,this.onResponsePrizedraw);
         a_2247(b_154.MSG_HALL_PRIZE_DRAW_INFO,this.onResponsePrizedrawInfo);
         a_2247(b_154.MSG_HALL_PRIZE_DRAW_AWARD,this.onResponsePrizedrawAward);
         a_2247(b_154.MSG_HALL_PRIZE_DRAW_BUFF_INFO,this.onResponsePrizedrawBuffInfo);
         a_2247(b_154.MSG_HALL_PRIZE_DRAW_CHANGE_BUFF,this.onResponsePrizedrawChangeBuff);
         a_2247(b_154.MSG_HALL_PRIZE_DRAW_DECOMPOSE,this.onResponsePrizedrawDecompose);
         a_2247(b_154.MSG_HALL_EVOLUTION,this.onResponseEvolutionCard);
         a_2247(b_154.MSG_HALL_ITEM_EVOLUTION,this.onResponseEvolutionArtifact);
         a_2247(b_154.MSG_HALL_UPDATE_SECPWD,this.onResponseUpdateSecpwd);
         a_2247(b_154.MSG_HALL_NEED_SECPWD,this.onResponseNeedSecpwd);
         a_2247(b_154.MSG_HALL_INPUT_SECPWD,this.onResponseInputSecpwd);
         a_2247(b_154.MSG_HALL_HAS_SECPWD,this.onResponseHasSecpwd);
         a_2247(b_154.MSG_NEW_SVR_GIFT_LOGIN,this.OnCResponseNewSvrGiftLogin);
         a_2247(b_154.MSG_NEW_SVR_GIFT_RECEIEVE,this.OnCSCResponseNewscrGiftReceieve);
         a_2247(b_154.MSG_HALL_MONOPOLY_INFO,this.OnResponseMonopolyInfo);
         a_2247(b_154.MSG_HALL_MONOPOLY_PLAY,this.OnResponseMonopolyPlay);
         a_2247(b_154.MSG_HALL_MONOPOLY_RANK_INFO,this.OnResponseMonopolyRankInfo);
         a_2247(b_154.MSG_HALL_MONOPOLY_RANK_AWARD,this.OnResponseMonopolyRankAward);
         a_2247(b_154.MSG_HALL_HANDBOOK,this.OnResponseHandbookAward);
         a_2247(b_154.MSG_GET_TWO_PATA_AWARD,this.OnResponseGetTwoPataAward);
         a_2247(b_154.MSG_HALL_DAILY_PAY_INFO,this.onResponseDailyPayInfo);
         a_2247(b_154.MSG_HALL_DAILY_PAY_AWARD,this.onResponseDailyPayAward);
         a_2247(b_154.MSG_HALL_GET_SMALL_ROOM_INFO,this.onResponseGetSmallRoomInfo);
         a_2247(b_154.MSG_HALL_SAVE_SMALL_ROOM_INFO,this.onResponseSaveSmallRoomInfo);
         a_2247(b_154.MSG_HALL_SMALL_ROOM_BUY,this.onResponseBuySmallRoomGoods);
         a_2247(b_154.MSG_HALL_DEAL_CRM_DATA,this.onResponseGetCrmInfo);
         a_2161.e.register(this);
      }
      
      public static function getInstance() : a_2333
      {
         if(null == a_804)
         {
            a_804 = new a_2333();
         }
         return a_804;
      }
      
      public function a_2334() : Boolean
      {
         var encodeLengh:int = 0;
         var enterRoom:Object = a_2161.e.getEnterRoom();
         a_4648.a_4649("LoginHallServer.time=" + getTimer());
         var encodeBuffer:ByteArray = new ByteArray();
         var loginHallRequest:a_2822 = new a_2822();
         loginHallRequest.m_iLobbyVersion = 10000;
         loginHallRequest.m_szAccount = a_2208.getInstance().getAccount();
         loginHallRequest.m_cClientType = EnmClienType.client_type_web_client;
         loginHallRequest.m_nFlag = 0;
         loginHallRequest.m_lMacAddr = 0;
         loginHallRequest.m_iLoginDuration = int(enterRoom.m_iLoginDuration);
         loginHallRequest.m_szCurrentTime = a_2439.getInstance().m_szCurrentTime;
         loginHallRequest.m_szExtSign = a_2439.getInstance().m_szExtSign;
         loginHallRequest.encode(encodeBuffer,encodeLengh);
         loginHallRequest = null;
         var hallServerConn:a_2650 = a_2251.getInstance().a_2253();
         a_4648.a_4649("LoginHallServer.ip=" + hallServerConn.host + ",time=" + getTimer() + ", enterRoom.m_iLoginDuration = " + int(enterRoom.m_iLoginDuration));
         GameDoctor.instance.pushInCache({"type":"cc"},GameStringManager.getInstance().getString(132624),GameStringManager.getInstance().getString(132625) + hallServerConn.host,{});
         if(pBaseProtocol.a_2201(hallServerConn,b_154.a_235,encodeBuffer))
         {
            hallServerConn.m_iLoginStatus = EnmConnLoginStatus.enmLogining;
            return true;
         }
         return false;
      }
      
      public function a_2335(iRoleUin:int, iClientIP:int = 0) : Boolean
      {
         var encodeLengh:int = 0;
         if(iRoleUin < 0)
         {
            trace("iRoleUin < 0 ");
            return false;
         }
         var encodeBuffer:ByteArray = new ByteArray();
         var roleLoginHallRequest:a_2823 = new a_2823();
         roleLoginHallRequest.m_iRoleUin = iRoleUin;
         roleLoginHallRequest.m_iClientIP = iClientIP;
         roleLoginHallRequest.encode(encodeBuffer,encodeLengh);
         roleLoginHallRequest = null;
         GameDoctor.instance.pushInCache({"type":"cc"},GameStringManager.getInstance().getString(132626),"",{});
         var hallServerConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallServerConn,b_154.a_237,encodeBuffer);
      }
      
      private function a_2336(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2843 = new a_2843();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CResponseRoleLogin failed.");
            GameDoctor.instance.pushInCache({"type":"ce"},GameStringManager.getInstance().getString(132627),"ResultID:" + response.m_nResultID,{"cpShow":true});
            return;
         }
         GameDoctor.instance.pushInCache({"type":"cc"},GameStringManager.getInstance().getString(132628),"",{});
         var dataEvent:a_1778 = new a_1778(EventType.a_592);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
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
      
      public function a_2337(arrUins:Array) : Boolean
      {
         var encodeLengh:int = 0;
         if(!arrUins is Array || arrUins.length <= 0)
         {
            trace("arrUins is null or arrUins.length <= 0");
            return false;
         }
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2821 = new a_2821();
         request.m_nUserCount = arrUins.length;
         request.m_arrUin = arrUins;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallServerConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallServerConn,b_154.a_291,encodeBuffer);
      }
      
      public function a_2338(iUin:int) : Boolean
      {
         var encodeLengh:int = 0;
         if(iUin < 1)
         {
            trace("iUin is null or iUin <= 0");
            return false;
         }
         var encodeBuffer:ByteArray = new ByteArray();
         var getPlayerAllMatchBestScoreRequest:a_2816 = new a_2816();
         getPlayerAllMatchBestScoreRequest.m_iUin = iUin;
         getPlayerAllMatchBestScoreRequest.m_nGameID = 8192;
         getPlayerAllMatchBestScoreRequest.encode(encodeBuffer,encodeLengh);
         getPlayerAllMatchBestScoreRequest = null;
         var hallServerConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallServerConn,b_154.a_296,encodeBuffer);
      }
      
      private function a_2339(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var loginHallResponse:a_2842 = new a_2842();
         if(!loginHallResponse.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode loginHallResponse failed.");
            a_4648.a_4649("Error: Decode loginHallResponse failed.");
            GameDoctor.instance.pushInCache({"type":"ce"},GameStringManager.getInstance().getString(132629),"ResultID:" + loginHallResponse.m_nResultID,{"cpShow":true});
            return;
         }
         a_4648.a_4649("OnHallLogin.m_iPlayerID=" + loginHallResponse.m_iPlayerID + ",time=" + getTimer());
         a_1767.getInstance().SystemTime = loginHallResponse.m_iTime;
         var dataEvent:a_1778 = new a_1778(EventType.a_580);
         dataEvent.dataObject = loginHallResponse;
         if(0 == loginHallResponse.m_nResultID)
         {
            GameDoctor.instance.pushInCache({"type":"cc"},GameStringManager.getInstance().getString(132630),"",{});
            a_2251.getInstance().a_2253().m_iPlayerID = loginHallResponse.m_iPlayerID;
            a_2251.getInstance().a_2253().m_iLoginStatus = EnmConnLoginStatus.enmLogined;
         }
         else
         {
            GameDoctor.instance.pushInCache({"type":"cc"},GameStringManager.getInstance().getString(132631),"ResultID=" + loginHallResponse.m_nResultID,{"cpShow":true});
         }
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2340(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var getPlayerCommonInfoResponse:a_2835 = new a_2835();
         if(!getPlayerCommonInfoResponse.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode getPlayerCommonInfoResponse failed.");
            return;
         }
         if(0 != getPlayerCommonInfoResponse.m_nResultID)
         {
            trace("获取用户游戏数据失败:" + getPlayerCommonInfoResponse.m_szReasonMsg);
            a_1789.getInstance().dispatchEvent(new Event(EventType.a_593));
         }
      }
      
      private function a_2341(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2839 = new a_2839();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode getUserBaseInfoResponse failed.");
            return;
         }
         if(0 != response.m_nResultID)
         {
            trace("获取用户基本数据失败:" + response.m_szReasonMsg);
            a_1789.getInstance().dispatchEvent(new Event(EventType.a_594));
         }
      }
      
      private function a_2342(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var getPlayerAllMatchBestScoreResponse:a_2834 = new a_2834();
         if(!getPlayerAllMatchBestScoreResponse.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode getPlayerAllMatchBestScoreResponse failed.");
            return;
         }
         if(0 == getPlayerAllMatchBestScoreResponse.m_nResultID)
         {
            trace(getPlayerAllMatchBestScoreResponse);
            dataEvent = new a_1778(EventType.a_585);
            dataEvent.dataObject = getPlayerAllMatchBestScoreResponse;
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
         else
         {
            trace("获取用户比赛最好成绩失败:" + getPlayerAllMatchBestScoreResponse.m_szReasonMsg);
            a_1789.getInstance().dispatchEvent(new Event(EventType.a_599));
         }
      }
      
      public function a_2343(uin:int) : Boolean
      {
         var encodeLengh:int = 0;
         if(uin <= 0)
         {
            trace("uin <= 0");
            return false;
         }
         var encodeBuffer:ByteArray = new ByteArray();
         var getRoleList:a_2820 = new a_2820();
         var m_iGroupID:int = int(a_2439.getInstance().a_2483.m_iGroupID);
         getRoleList.m_iMyUIN = uin;
         getRoleList.m_iGroupID = m_iGroupID;
         getRoleList.encode(encodeBuffer,encodeLengh);
         getRoleList = null;
         a_4648.a_4649("GetPlayerRoleList.uin=" + uin);
         GameDoctor.instance.pushInCache({"type":"cc"},GameStringManager.getInstance().getString(132632) + uin + GameStringManager.getInstance().getString(132633),"",{});
         var hallServerConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallServerConn,b_154.a_225,encodeBuffer);
      }
      
      public function a_2344(roleName:String) : Boolean
      {
         var encodeLengh:int = 0;
         if(roleName == null || roleName.length < 0)
         {
            trace("roleName ==null || roleName.length < 0");
            return false;
         }
         var encodeBuffer:ByteArray = new ByteArray();
         var checkRoleName:a_2813 = new a_2813();
         checkRoleName.m_szRoleName = roleName;
         checkRoleName.encode(encodeBuffer,encodeLengh);
         checkRoleName = null;
         var hallServerConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallServerConn,b_154.a_227,encodeBuffer);
      }
      
      public function a_2345(roleName:String, iUserSex:int) : Boolean
      {
         var encodeLengh:int = 0;
         GameDoctor.instance.pushInCache({"type":"cc"},GameStringManager.getInstance().getString(132634),"",{});
         var encodeBuffer:ByteArray = new ByteArray();
         var createRole:a_2814 = new a_2814();
         var m_iGroupID:int = int(a_2439.getInstance().a_2483.m_iGroupID);
         createRole.m_szRoleName = roleName;
         createRole.m_iGroupID = m_iGroupID;
         createRole.m_iUserSex = iUserSex;
         createRole.encode(encodeBuffer,encodeLengh);
         createRole = null;
         var hallServerConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallServerConn,b_154.a_226,encodeBuffer);
      }
      
      public function a_2346(roleUin:int) : Boolean
      {
         var encodeLengh:int = 0;
         if(roleUin <= 0)
         {
            trace("roleUin <= 0");
            return false;
         }
         GameDoctor.instance.pushInCache({"type":"cc"},GameStringManager.getInstance().getString(132635),"",{});
         var encodeBuffer:ByteArray = new ByteArray();
         var getRoleInfoRequest:a_2819 = new a_2819();
         getRoleInfoRequest.m_iRoleUin = roleUin;
         getRoleInfoRequest.encode(encodeBuffer,encodeLengh);
         getRoleInfoRequest = null;
         var hallServerConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallServerConn,b_154.a_229,encodeBuffer);
      }
      
      private function a_2347(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var createRoleResponse:a_2832 = new a_2832();
         if(!createRoleResponse.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode createRoleResponse failed.");
            GameDoctor.instance.pushInCache({"type":"ce"},GameStringManager.getInstance().getString(132636),"ResultID:" + createRoleResponse.m_nResultID,{"cpShow":true});
            return;
         }
         GameDoctor.instance.pushInCache({"type":"cc"},GameStringManager.getInstance().getString(132637),"",{});
         if(0 == createRoleResponse.m_nResultID)
         {
            a_2439.getInstance().addCreateUserRole(createRoleResponse);
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_627);
         dataEvent.dataObject = createRoleResponse;
         a_1789.getInstance().dispatchEvent(dataEvent);
         SendCountInfoHandle.Get().SendLog(2004);
      }
      
      private function a_2348(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var arrRoleLists:Array = null;
         var role:CRole = null;
         var response:a_2838 = new a_2838();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode logoutRoleResponse failed.");
            GameDoctor.instance.pushInCache({"type":"ce"},GameStringManager.getInstance().getString(132638),"ResultID:" + response.m_nResultID,{"cpShow":true});
            return;
         }
         a_4648.a_4649("OnGetRoleList.m_nResultID=" + response.m_nResultID + "," + response.m_iMyUIN);
         if(response.m_nResultID == 0)
         {
            GameDoctor.instance.pushInCache({"type":"cc"},GameStringManager.getInstance().getString(132640),"",{});
            arrRoleLists = response.m_arrRoleInfo;
            if(arrRoleLists.length > 0)
            {
               role = arrRoleLists[0];
               this.a_2346(role.m_iRoleUin);
            }
            else if(this.currTime != response.m_iMyUIN)
            {
               this.currTime = response.m_iMyUIN;
               this.RequestTransferClientLog(4,response.m_iMyUIN + "," + response.m_nResultID);
            }
            a_2439.getInstance().setUserRoleList(arrRoleLists);
         }
         else
         {
            GameDoctor.instance.pushInCache({"type":"cc"},GameStringManager.getInstance().getString(132641),"ResultID:" + response.m_nResultID,{"cpShow":true});
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_626);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2349(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var response:a_2837 = new a_2837();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode getRoleInfoResponse failed.");
            GameDoctor.instance.pushInCache({"type":"ce"},GameStringManager.getInstance().getString(132642),"ResultID:" + response.m_nResultID,{"cpShow":true});
            return;
         }
         a_4648.a_4649("OnGetRoleInfo.m_nResultID=" + response.m_nResultID + "," + response.m_szRoleName + "," + response.m_iRoleUin + "," + response.m_iRoleScore);
         if(0 == response.m_nResultID)
         {
            GameDoctor.instance.pushInCache({"type":"cc"},GameStringManager.getInstance().getString(132643) + "<font color=\'#ee1111\'>" + response.m_szRoleName + "</font>" + GameStringManager.getInstance().getString(132644),"",{});
            a_2439.getInstance().setUserRole(response);
            dataEvent = new a_1778(EventType.a_629);
            dataEvent.dataObject = response;
            a_1789.getInstance().dispatchEvent(dataEvent);
            RecipesAgreementHander.GetInstance().RecipesGetInfo();
            RecipesConfig.GetInstance().LoaderRecipesXml();
            this.onRequestGetRechargeActivityInfo(response.m_iRoleUin);
            this.onRequestGetPlayerMarriageInfo(response.m_iRoleUin);
         }
         else
         {
            GameDoctor.instance.pushInCache({"type":"cc"},GameStringManager.getInstance().getString(132643) + "<font color=\'#ee1111\'>" + response.m_szRoleName + "</font>" + GameStringManager.getInstance().getString(132645),"ResultID=" + response.m_nResultID,{"cpShow":true});
         }
      }
      
      private function a_2350(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var checkRoleNameResponse:a_2831 = new a_2831();
         if(!checkRoleNameResponse.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode logoutRoleResponse failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_628);
         dataEvent.dataObject = checkRoleNameResponse;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function RequestTDCardsInfo() : Boolean
      {
         var encodeLengh:int = 0;
         GameDoctor.instance.pushInCache({"type":"cc"},GameStringManager.getInstance().getString(132646),"",{});
         var encodeBuffer:ByteArray = new ByteArray();
         var getTDCardsInfoRequest:a_2918 = new a_2918();
         getTDCardsInfoRequest.m_iRoomID = 1;
         getTDCardsInfoRequest.encode(encodeBuffer,encodeLengh);
         getTDCardsInfoRequest = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_298,encodeBuffer);
      }
      
      public function a_2351(iUin:int, iFavoriteID:int, szFavoriteName:String, arrFavoriteCards:String) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var requestUpdateCardList:a_2931 = new a_2931();
         requestUpdateCardList.m_iRoomID = 1;
         requestUpdateCardList.m_iSrcUin = iUin;
         requestUpdateCardList.m_nCardListCount = 1;
         var arrCardList:Array = new Array();
         var stCardList:CCardList = new CCardList();
         stCardList.m_nCardListID = iFavoriteID;
         stCardList.m_szCardListName = szFavoriteName;
         stCardList.m_szCardListContent = arrFavoriteCards;
         arrCardList.push(stCardList);
         requestUpdateCardList.m_aryCardList = arrCardList;
         requestUpdateCardList.encode(encodeBuffer,encodeLengh);
         requestUpdateCardList = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_301,encodeBuffer);
      }
      
      private function a_2352(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2943 = new a_2943();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode getTDCardsResponse failed.");
            GameDoctor.instance.pushInCache({"type":"ce"},GameStringManager.getInstance().getString(132647),"ResultID:" + response.m_nResultID,{"cpShow":true});
            return;
         }
         if(0 == response.m_nResultID)
         {
            GameDoctor.instance.pushInCache({"type":"cc"},GameStringManager.getInstance().getString(132648),"",{"cpShow":true});
            a_2439.getInstance().setTDCardsInfo(response);
         }
         else
         {
            a_4648.a_4649("GetTDCardsResponse failed:" + response.m_nResultID);
            GameDoctor.instance.pushInCache({"type":"ce"},GameStringManager.getInstance().getString(132649),"ResultID：" + response.m_nResultID,{"cpShow":true});
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_587);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2353(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var responseUpdateCardList:a_2956 = new a_2956();
         if(!responseUpdateCardList.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode getTDCardsResponse failed.");
            return;
         }
         if(0 == responseUpdateCardList.m_nResultID)
         {
            dataEvent = new a_1778(EventType.a_588);
            a_2439.getInstance().setTDFavouriteCardInfo(responseUpdateCardList.m_aryCardList);
            dataEvent.dataObject = responseUpdateCardList.m_aryCardList;
            a_1789.getInstance().dispatchEvent(dataEvent);
            trace("OnUpdateTDFavoriteCardsResponse success:" + responseUpdateCardList.m_nResultID);
         }
         else
         {
            dataEvent = new a_1778(EventType.a_589);
            a_1789.getInstance().dispatchEvent(dataEvent);
            trace("OnUpdateTDFavoriteCardsResponse failed:" + responseUpdateCardList.m_nResultID);
         }
      }
      
      public function a_2354(iUin:int, arrCards:Array) : Boolean
      {
         var tempCard:Object = null;
         var encodeBuffer:ByteArray = null;
         var encodeLengh:int = 0;
         var requestUpdateCardPosition:a_2932 = null;
         var hallConn:a_2650 = null;
         var updateCardPosition:CCardUpdatePosition = null;
         var arrUpdateCards:Array = [];
         for each(tempCard in arrCards)
         {
            updateCardPosition = new CCardUpdatePosition();
            updateCardPosition.m_iCardID = tempCard.CardID;
            updateCardPosition.m_iCardSeq = tempCard.CardSeq;
            updateCardPosition.m_nCardPostion = tempCard.CardPositionID;
            arrUpdateCards.push(updateCardPosition);
         }
         encodeBuffer = new ByteArray();
         requestUpdateCardPosition = new a_2932();
         requestUpdateCardPosition.m_iRoomID = 1;
         requestUpdateCardPosition.m_iSrcUin = iUin;
         requestUpdateCardPosition.m_arrCardUpdatePosition = arrUpdateCards;
         requestUpdateCardPosition.m_nCardCount = arrUpdateCards.length;
         requestUpdateCardPosition.encode(encodeBuffer,encodeLengh);
         requestUpdateCardPosition = null;
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_299,encodeBuffer);
      }
      
      private function a_2355(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var responseUpdateCardPosition:a_2957 = new a_2957();
         if(!responseUpdateCardPosition.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CResponseUpdateCardPosition failed.");
            return;
         }
         if(0 == responseUpdateCardPosition.m_nResultID)
         {
            trace("OnUpdateCardPositionResponse success:" + responseUpdateCardPosition.m_nResultID);
         }
         else
         {
            trace("OnUpdateCardPositionResponse failed:" + responseUpdateCardPosition.m_nResultID);
         }
      }
      
      public function a_2356(iCardID:int, iCardSeq:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2829 = new a_2829();
         request.m_iID = iCardID;
         request.m_iSeq = iCardSeq;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_308,encodeBuffer);
      }
      
      public function RequestUseService(iCardID:int, iCardSeq:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2829 = new a_2829();
         request.m_iID = iCardID;
         request.m_iSeq = iCardSeq;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_309,encodeBuffer);
      }
      
      private function a_2357(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var response:a_2849 = new a_2849();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CResponseUseAddGridItem failed.");
            return;
         }
         if(0 == response.m_nResultID)
         {
            a_2439.getInstance().updateTDCardsStore(response.m_nStoreCount);
         }
         dataEvent = new a_1778(EventType.a_590);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2358(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2852 = new a_2852();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CResponseUseServiceItem failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_605);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function a_2359(iUin:int, arrCards:Array, updateMode:int) : Boolean
      {
         var attr:a_3228 = null;
         var encodeBuffer:ByteArray = null;
         var encodeLengh:int = 0;
         var requestUpdateCardData:a_2934 = null;
         var hallConn:a_2650 = null;
         var updateCardData:CCardUpdateInfo = null;
         var arrUpdateCardDatas:Array = [];
         for each(attr in arrCards)
         {
            updateCardData = new CCardUpdateInfo();
            updateCardData.m_iCardID = attr.CardID;
            updateCardData.m_iCardSeq = attr.CardSeq;
            if(attr.CardCount > 0)
            {
               if(attr.IsBind == 2)
               {
                  updateCardData.m_cIsBind = 1;
                  updateCardData.m_cTimeFlag = 3;
               }
               if(attr.ExpiredTime == -2)
               {
                  updateCardData.m_cTimeFlag = 3;
               }
            }
            else
            {
               updateCardData.m_nCardCount = attr.CardCount;
            }
            updateCardData.m_nUpdateMode = updateMode;
            arrUpdateCardDatas.push(updateCardData);
         }
         encodeBuffer = new ByteArray();
         requestUpdateCardData = new a_2934();
         requestUpdateCardData.m_iRoomID = 1;
         requestUpdateCardData.m_iSrcUin = iUin;
         requestUpdateCardData.m_iDstUin = iUin;
         requestUpdateCardData.m_arrUpdateCardInfo = arrUpdateCardDatas;
         requestUpdateCardData.m_nCardCount = arrUpdateCardDatas.length;
         requestUpdateCardData.encode(encodeBuffer,encodeLengh);
         requestUpdateCardData = null;
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_302,encodeBuffer);
      }
      
      private function a_2360(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var responseUpdatePlayerCardData:a_2959 = new a_2959();
         if(!responseUpdatePlayerCardData.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CResponseUpdatePlayerCardData failed.");
            return;
         }
         if(0 == responseUpdatePlayerCardData.m_nResultID)
         {
            trace("OnUpdateCardDataResponse success:" + responseUpdatePlayerCardData.m_nResultID);
         }
         else
         {
            trace("OnUpdateCardDataResponse failed:" + responseUpdatePlayerCardData.m_nResultID);
         }
      }
      
      public function a_2361(iUin:int, arrCards:Array) : Boolean
      {
         var tempCard:Object = null;
         var encodeBuffer:ByteArray = null;
         var encodeLengh:int = 0;
         var request:a_2825 = null;
         var hallConn:a_2650 = null;
         var updateCardPosition:CCardUpdatePosition = null;
         var arrUpdateCards:Array = [];
         for each(tempCard in arrCards)
         {
            updateCardPosition = new CCardUpdatePosition();
            updateCardPosition.m_iCardID = tempCard.CardID;
            updateCardPosition.m_iCardSeq = tempCard.CardSeq;
            updateCardPosition.m_nCardPostion = tempCard.CardPositionID;
            arrUpdateCards.push(updateCardPosition);
         }
         encodeBuffer = new ByteArray();
         request = new a_2825();
         request.m_iSrcUin = iUin;
         request.m_arrCardUpdatePosition = arrUpdateCards;
         request.m_nItemCount = arrUpdateCards.length;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_304,encodeBuffer);
      }
      
      private function a_2362(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var responseUpdatePlayerCardData:a_2845 = new a_2845();
         if(!responseUpdatePlayerCardData.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode responseUpdatePlayerCardData failed.");
            return;
         }
         if(0 == responseUpdatePlayerCardData.m_nResultID)
         {
            trace("responseUpdatePlayerCardData success:" + responseUpdatePlayerCardData.m_nResultID);
         }
         else
         {
            trace("responseUpdatePlayerCardData failed:" + responseUpdatePlayerCardData.m_nResultID);
         }
      }
      
      public function a_2363(iUin:int, dictUpdate:Dictionary) : Boolean
      {
         var encodeLengh:int = 0;
         if(dictUpdate == null)
         {
            return false;
         }
         var encodeBuffer:ByteArray = new ByteArray();
         var requestUpdateHeroInfo:a_2827 = new a_2827();
         requestUpdateHeroInfo.m_iSrcUin = iUin;
         requestUpdateHeroInfo.m_iDstUin = iUin;
         requestUpdateHeroInfo.m_cHeroSexFlag = dictUpdate["cHeroSexFlag"] == null ? 0 : int(dictUpdate["cHeroSexFlag"]);
         requestUpdateHeroInfo.m_cHeroSex = dictUpdate["m_cHeroSex"] == null ? 0 : int(dictUpdate["m_cHeroSex"]);
         requestUpdateHeroInfo.m_cHeroAttackFlag = dictUpdate["cHeroAttackFlag"] == null ? 0 : int(dictUpdate["cHeroAttackFlag"]);
         requestUpdateHeroInfo.m_iHeroAttack = dictUpdate["iHeroAttack"] == null ? 0 : int(dictUpdate["iHeroAttack"]);
         requestUpdateHeroInfo.m_cHeroDefenseFlag = dictUpdate["cHeroDefenseFlag"] == null ? 0 : int(dictUpdate["cHeroDefenseFlag"]);
         requestUpdateHeroInfo.m_iHeroDefense = dictUpdate["iHeroDefense"] == null ? 0 : int(dictUpdate["iHeroDefense"]);
         requestUpdateHeroInfo.m_cHeroScoreFlag = dictUpdate["cHeroScoreFlag"] == null ? 0 : int(dictUpdate["cHeroScoreFlag"]);
         requestUpdateHeroInfo.m_iHeroScore = dictUpdate["iHeroScore"] == null ? 0 : int(dictUpdate["iHeroScore"]);
         requestUpdateHeroInfo.m_cHeroUserIDFlag = dictUpdate["cHeroUserIDFlag"] == null ? 0 : int(dictUpdate["cHeroUserIDFlag"]);
         requestUpdateHeroInfo.m_iHeroUserID = dictUpdate["iHeroUserID"] == null ? 0 : int(dictUpdate["iHeroUserID"]);
         requestUpdateHeroInfo.m_arrUpdateHeroInfo = dictUpdate["arrUpdateHeroInfo"] == null ? [] : dictUpdate["arrUpdateHeroInfo"];
         requestUpdateHeroInfo.m_nHeroItemCount = requestUpdateHeroInfo.m_arrUpdateHeroInfo.length;
         requestUpdateHeroInfo.m_arrCardSlotInfo = dictUpdate["arrCardSlotInfo"] == null ? [] : dictUpdate["arrCardSlotInfo"];
         requestUpdateHeroInfo.m_nHeroSlotCount = requestUpdateHeroInfo.m_arrCardSlotInfo.length;
         requestUpdateHeroInfo.m_cHeroNameFlag = dictUpdate["cHeroNameFlag"] == null ? 0 : int(dictUpdate["cHeroNameFlag"]);
         requestUpdateHeroInfo.m_szHeroName = dictUpdate["m_szHeroName"] == null ? "" : dictUpdate["m_szHeroName"];
         requestUpdateHeroInfo.m_cHeroItemFlag = dictUpdate["cHeroItemFlag"] == null ? 0 : int(dictUpdate["cHeroItemFlag"]);
         requestUpdateHeroInfo.m_szHeroItem = dictUpdate["szHeroItem"] == null ? "" : dictUpdate["szHeroItem"];
         requestUpdateHeroInfo.encode(encodeBuffer,encodeLengh);
         requestUpdateHeroInfo = null;
         a_4648.a_4649("szHeroItem=" + dictUpdate["szHeroItem"] + ",cHeroItemFlag=" + dictUpdate["cHeroItemFlag"]);
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_305,encodeBuffer);
      }
      
      private function a_2364(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var responseUpdateHeroData:a_2847 = new a_2847();
         if(!responseUpdateHeroData.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode responseUpdateHeroData failed.");
            return;
         }
         if(0 == responseUpdateHeroData.m_nResultID)
         {
            if(responseUpdateHeroData.m_cHeroScoreFlag == 1)
            {
               dataEvent = new a_1778(EventType.a_631);
               dataEvent.dataObject = responseUpdateHeroData.m_iHeroScore;
               a_1789.getInstance().dispatchEvent(dataEvent);
            }
            if(responseUpdateHeroData.m_cHeroItemFlag == 1)
            {
               a_2439.getInstance().updateUserRoleItem(responseUpdateHeroData.m_iSrcUin,responseUpdateHeroData.m_szHeroItem);
            }
            trace("OnUpdateCardDataResponse success:" + responseUpdateHeroData.m_nResultID);
         }
         else
         {
            trace("OnUpdateCardDataResponse failed:" + responseUpdateHeroData.m_nResultID);
         }
      }
      
      public function a_2365(currentRole:Object, dstRole:Object, arrBuyGoods:Array) : Boolean
      {
         var encodeLengh:int = 0;
         var goods:Object = null;
         var hallConn:a_2650 = null;
         var commodityData:CSCommodityData = null;
         var arrUpdateCards:Array = [];
         var encodeBuffer:ByteArray = new ByteArray();
         var requestBuy:a_2812 = new a_2812();
         if(dstRole != null)
         {
            requestBuy.m_iDstRoleUin = dstRole.m_iRoleUin;
            requestBuy.m_szDstRoleName = dstRole.m_szRoleName;
         }
         else
         {
            requestBuy.m_iDstRoleUin = currentRole.m_iRoleUin;
            requestBuy.m_szDstRoleName = currentRole.m_szRoleName;
         }
         requestBuy.m_iSrcRoleUin = currentRole.m_iRoleUin;
         requestBuy.m_szSrcRoleName = currentRole.m_szRoleName;
         requestBuy.m_cVipLevel = 0;
         requestBuy.m_iClientIP = 0;
         requestBuy.m_iCommodityCharmPrice = 0;
         requestBuy.m_iCommodityCoinPrice = 0;
         requestBuy.m_iCommodityHappyBeanPrice = 0;
         requestBuy.m_iCommodityLotteryPrice = 0;
         requestBuy.m_nPaymentMode = 0;
         requestBuy.m_nCommodityCount = arrBuyGoods.length;
         requestBuy.m_aryCommodityData = [];
         for each(goods in arrBuyGoods)
         {
            commodityData = new CSCommodityData();
            commodityData.m_iID = goods.g_goodsID;
            commodityData.m_iUsedCount = goods.g_used_count;
            commodityData.m_shCount = 1;
            commodityData.m_iExpiryDate = goods.g_expirydate;
            commodityData.m_cBuyType = goods.g_buy_type;
            commodityData.m_iCurrencytype = goods.g_comm_currency_type;
            requestBuy.m_aryCommodityData.push(commodityData);
         }
         requestBuy.encode(encodeBuffer,encodeLengh);
         requestBuy = null;
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_223,encodeBuffer);
      }
      
      private function OnBuyGoodsResponse(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var responseBuy:a_2830 = new a_2830();
         if(!responseBuy.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode responseBuy failed.");
            return;
         }
         trace("OnBuyGoodsResponse success:" + responseBuy.m_nResultID);
         if(responseBuy.m_nResultID == 0)
         {
            a_2439.getInstance().updatePlayerCommonCoin(responseBuy.m_iCurrentCoin,responseBuy.m_lCurrentHappyBean,responseBuy.m_iCurrentLottery,responseBuy.m_iCurrentCharm);
         }
         dataEvent = new a_1778(EventType.a_645);
         dataEvent.dataObject = responseBuy;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function a_2366(roleUin:int) : Boolean
      {
         var encodeLengh:int = 0;
         GameDoctor.instance.pushInCache({"type":"cc"},GameStringManager.getInstance().getString(132650) + roleUin + GameStringManager.getInstance().getString(132651),"",{});
         var encodeBuffer:ByteArray = new ByteArray();
         var requestGetUserTaskInfo:a_2990 = new a_2990();
         requestGetUserTaskInfo.m_iUin = roleUin;
         requestGetUserTaskInfo.encode(encodeBuffer,encodeLengh);
         requestGetUserTaskInfo = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_313,encodeBuffer);
      }
      
      private function a_2367(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var arrTaskInfos:Array = null;
         var a_1660:Object = null;
         var complete:Object = null;
         var level:int = 0;
         var size:int = 0;
         var index:int = 0;
         var iRoleUin:int = 0;
         var iSelect:int = 0;
         var isYellowGem:Boolean = false;
         var enterRoom:Object = null;
         var responseGetUserTaskInfo:a_2995 = new a_2995();
         if(!responseGetUserTaskInfo.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode responseGetUserTaskInfo failed.");
            GameDoctor.instance.pushInCache({"type":"ce"},GameStringManager.getInstance().getString(132652),"ResultID:" + responseGetUserTaskInfo.m_nResultID,{"cpShow":true});
            return;
         }
         var systemMsg:String = "";
         var isTaskStatus:Boolean = false;
         var iFirstTaskID:int = 0;
         if(0 == responseGetUserTaskInfo.m_nResultID)
         {
            arrTaskInfos = responseGetUserTaskInfo.m_arrTaskInfoSets;
            a_2439.getInstance().setTaskInfo(arrTaskInfos);
            a_1660 = a_2439.getInstance().GetCurrentRole();
            for each(complete in arrTaskInfos)
            {
               if(complete.m_iTaskID == 285212672)
               {
                  level = Number(a_2033.getInstance().getGameLevel(a_1660.m_iGamePoint).iLevel);
                  size = level - complete.m_iAccomplishedDate;
                  if(complete.m_iTaskStatus != 3)
                  {
                     isTaskStatus = true;
                  }
                  if(size > 0)
                  {
                     for(index = 0; index < size; index++)
                     {
                        this.RequestPlayerGetTaskAward(a_1660.m_iRoleUin,285212672,1 + index + complete.m_iAccomplishedDate);
                     }
                  }
                  iFirstTaskID = 285212672;
               }
               if(complete.m_iTaskID == 88080386)
               {
                  if(complete.m_iTaskStatus != a_1756.enm_TaskOverdateStatus)
                  {
                     systemMsg = GameStringManager.getInstance().getString(132653);
                  }
               }
            }
            if(arrTaskInfos.length > 0 && isTaskStatus || iFirstTaskID == 0)
            {
               iRoleUin = int(a_1660.m_iRoleUin);
               this.RequestPlayerAcceptTask(iRoleUin,285212672);
               this.RequestPlayerAccomplishTask(iRoleUin,285212672);
               iSelect = 0;
               isYellowGem = false;
               enterRoom = a_2439.getInstance().getEnterRoom();
               isYellowGem = Boolean(enterRoom.m_isYellowGem);
               iSelect = a_1660.m_iUserSex == 1 ? -1 : 0;
               if(isYellowGem)
               {
                  iSelect = a_1660.m_iUserSex == 1 ? -3 : -2;
               }
               this.RequestPlayerGetTaskAward(iRoleUin,285212672,iSelect);
            }
            dataEvent = new a_1778(EventType.a_640);
            dataEvent.dataObject = {"systemMsg":systemMsg};
            a_1789.getInstance().dispatchEvent(dataEvent);
            GameDoctor.instance.pushInCache({"type":"cc"},GameStringManager.getInstance().getString(132654),"",{"cpShow":true});
            trace("responseGetUserTaskInfo success:" + responseGetUserTaskInfo.m_nResultID);
         }
         else
         {
            GameDoctor.instance.pushInCache({"type":"ce"},GameStringManager.getInstance().getString(132656),"ResultID:" + responseGetUserTaskInfo.m_nResultID,{"cpShow":true});
            trace("responseGetUserTaskInfo failed:" + responseGetUserTaskInfo.m_nResultID);
         }
      }
      
      public function RequestPlayerAcceptTask(roleUin:int, taskID:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var requestPlayerAcceptTask:a_2991 = new a_2991();
         requestPlayerAcceptTask.m_iUin = roleUin;
         requestPlayerAcceptTask.m_iTaskID = taskID;
         requestPlayerAcceptTask.encode(encodeBuffer,encodeLengh);
         requestPlayerAcceptTask = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_314,encodeBuffer);
      }
      
      private function a_2368(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var responsePlayerAcceptTask:a_2996 = new a_2996();
         if(!responsePlayerAcceptTask.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode responsePlayerAcceptTask failed.");
            return;
         }
         if(0 == responsePlayerAcceptTask.m_nResultID)
         {
            dataEvent = new a_1778(EventType.a_641);
            dataEvent.dataObject = responsePlayerAcceptTask;
            a_1789.getInstance().dispatchEvent(dataEvent);
            trace("responsePlayerAcceptTask success:" + responsePlayerAcceptTask.m_nResultID);
         }
         else
         {
            trace("responsePlayerAcceptTask failed:" + responsePlayerAcceptTask.m_nResultID);
         }
      }
      
      public function RequestPlayerAccomplishTask(roleUin:int, taskID:int, byType:int = 0) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var requestPlayerAccomplishTask:a_2992 = new a_2992();
         requestPlayerAccomplishTask.m_iTaskID = taskID;
         requestPlayerAccomplishTask.m_iUin = roleUin;
         requestPlayerAccomplishTask.m_byType = byType;
         requestPlayerAccomplishTask.encode(encodeBuffer,encodeLengh);
         requestPlayerAccomplishTask = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_315,encodeBuffer);
      }
      
      private function a_2369(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var response:a_2998 = new a_2998();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CResponsePlayerAccomplishTask failed.");
            return;
         }
         if(0 == response.m_nResultID)
         {
            dataEvent = new a_1778(EventType.a_642);
            dataEvent.dataObject = response;
            a_1789.getInstance().dispatchEvent(dataEvent);
            trace("CResponsePlayerAccomplishTask success:" + response.m_nResultID);
         }
         else
         {
            trace("CResponsePlayerAccomplishTask failed:" + response.m_nResultID + "," + response.m_iTaskID + "," + response.m_iUin);
         }
      }
      
      public function RequestPlayerGetTaskAward(roleUin:int, taskID:int, select:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var requestPlayerGetTaskAward:a_2993 = new a_2993();
         requestPlayerGetTaskAward.m_iTaskID = taskID;
         requestPlayerGetTaskAward.m_iUin = roleUin;
         requestPlayerGetTaskAward.m_cSelect = select;
         requestPlayerGetTaskAward.encode(encodeBuffer,encodeLengh);
         requestPlayerGetTaskAward = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_316,encodeBuffer);
      }
      
      private function a_2370(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2999 = new a_2999();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode responsePlayerGetTaskAward failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_643);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
         trace("responsePlayerGetTaskAward success:" + response.m_nResultID);
      }
      
      public function RequestPlayerSaveTask(roleUin:int, taskInfo:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var requestPlayerSaveTask:a_2994 = new a_2994();
         requestPlayerSaveTask.m_iUin = roleUin;
         requestPlayerSaveTask.m_stSaveTask = new a_3001();
         requestPlayerSaveTask.m_stSaveTask.m_iTaskID = taskInfo.m_iTaskID;
         requestPlayerSaveTask.m_stSaveTask.m_iAcceptDate = taskInfo.m_iAcceptDate;
         requestPlayerSaveTask.m_stSaveTask.m_iAccomplishedDate = taskInfo.m_iAccomplishedDate;
         requestPlayerSaveTask.m_stSaveTask.m_iTaskStatus = taskInfo.m_iTaskStatus;
         requestPlayerSaveTask.m_stSaveTask.m_iUserDef1 = taskInfo.m_iUserDef1;
         requestPlayerSaveTask.encode(encodeBuffer,encodeLengh);
         requestPlayerSaveTask = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_317,encodeBuffer);
      }
      
      private function a_2371(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var responsePlayerSaveTask:a_3000 = new a_3000();
         if(!responsePlayerSaveTask.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode responsePlayerSaveTask failed.");
            return;
         }
         if(0 == responsePlayerSaveTask.m_nResultID)
         {
            dataEvent = new a_1778(EventType.a_644);
            dataEvent.dataObject = responsePlayerSaveTask;
            a_1789.getInstance().dispatchEvent(dataEvent);
            trace("responsePlayerSaveTask success:" + responsePlayerSaveTask.m_nResultID);
         }
         else
         {
            trace("responsePlayerSaveTask failed:" + responsePlayerSaveTask.m_nResultID);
         }
      }
      
      public function a_2372(roleUin:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var requestPositiveFriendList:a_2680 = new a_2680();
         requestPositiveFriendList.m_iMyUIN = roleUin;
         requestPositiveFriendList.encode(encodeBuffer,encodeLengh);
         requestPositiveFriendList = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_242,encodeBuffer);
      }
      
      private function a_2373(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var arrFriends:Array = null;
         var responsePositiveFriendList:a_2687 = new a_2687();
         if(!responsePositiveFriendList.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode responsePositiveFriendList failed.");
            return;
         }
         if(0 == responsePositiveFriendList.m_nResultID)
         {
            arrFriends = responsePositiveFriendList.m_astFriendInfo;
            a_2439.getInstance().setPositiveFriends(arrFriends);
            dataEvent = new a_1778(EventType.a_612);
            dataEvent.dataObject = responsePositiveFriendList;
            a_1789.getInstance().dispatchEvent(dataEvent);
            trace("responsePositiveFriendList success:" + responsePositiveFriendList.m_nResultID);
         }
         else
         {
            trace("responsePositiveFriendList failed:" + responsePositiveFriendList.m_nResultID);
         }
      }
      
      public function a_2374(roleUin:int, arrAiUin:Array) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var requestGetPlayerStatus:a_2679 = new a_2679();
         requestGetPlayerStatus.m_iMyUin = roleUin;
         requestGetPlayerStatus.m_nCount = arrAiUin.length;
         requestGetPlayerStatus.m_aiUin = arrAiUin;
         requestGetPlayerStatus.encode(encodeBuffer,encodeLengh);
         requestGetPlayerStatus = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_251,encodeBuffer);
      }
      
      private function a_2375(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var arrPlayerStatusInfo:Array = null;
         var currentRoleUin:int = 0;
         var consortia:Object = null;
         var m_iChairmanUIN:int = 0;
         var stPlayerStatus:CPlayerStatusInfo = null;
         var iUin:int = 0;
         var classCount:int = 0;
         var member:Object = null;
         var iGameStatus:int = 0;
         var dataEvent:a_1778 = null;
         var responseGetPlayerStatus:a_2686 = new a_2686();
         if(!responseGetPlayerStatus.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode responseGetPlayerStatus failed.");
            return;
         }
         var consortiaMemberChanged:Boolean = false;
         if(0 == responseGetPlayerStatus.m_nResultID)
         {
            arrPlayerStatusInfo = responseGetPlayerStatus.m_astPlayerStatus;
            a_2439.getInstance().updateFriendStatus(arrPlayerStatusInfo);
            currentRoleUin = a_2439.getInstance().m_currentRoleUin;
            consortia = a_2439.getInstance().getConsortiaInfo();
            m_iChairmanUIN = 0;
            if(consortia != null && consortia.m_stConsortiaInfo != null)
            {
               m_iChairmanUIN = int(consortia.m_stConsortiaInfo.m_iChairmanUIN);
            }
            for each(stPlayerStatus in arrPlayerStatusInfo)
            {
               iUin = stPlayerStatus.m_nUin;
               classCount = stPlayerStatus.m_byClassCount;
               member = a_2307.getInstance().getConsortiaMember(iUin);
               if(stPlayerStatus.m_szAccount != null && m_iChairmanUIN == iUin)
               {
                  consortia.m_stConsortiaInfo.m_czChairmanName = stPlayerStatus.m_szAccount;
               }
               if(iUin != currentRoleUin)
               {
                  iGameStatus = a_2439.getInstance().getGameStatusFromPlayerStatus(stPlayerStatus);
                  if(null != member)
                  {
                     trace("stPlayerStatus.m_szAccount=" + stPlayerStatus.m_szAccount);
                     if(stPlayerStatus.m_szAccount != null)
                     {
                        member.m_czName = stPlayerStatus.m_szAccount;
                     }
                     a_2307.getInstance().changeConsortiaMemberStatue(stPlayerStatus);
                     consortiaMemberChanged = true;
                  }
               }
               else if(null != member && stPlayerStatus.m_szAccount != null)
               {
                  member.m_czName = stPlayerStatus.m_szAccount;
               }
            }
            if(consortiaMemberChanged)
            {
               dataEvent = new a_1778(EventType.a_622);
               a_1789.getInstance().dispatchEvent(dataEvent);
            }
         }
         else
         {
            trace("responseGetPlayerStatus failed:" + responseGetPlayerStatus.m_nResultID);
         }
      }
      
      public function RequestAddFriend(friendData:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var iUin:int = int(friendData.m_iRoleUin);
         var friend:Object = a_2439.getInstance().getFriendByUin(iUin);
         if(friend != null)
         {
            return false;
         }
         var encodeBuffer:ByteArray = new ByteArray();
         var requestAddFriend:a_2677 = new a_2677();
         var clientProfile:ClientProfile = new ClientProfile();
         clientProfile.m_iUIN = friendData.m_iRoleUin;
         clientProfile.m_cGender = friendData.m_iUserSex;
         clientProfile.m_szAccount = friendData.m_szRoleName;
         clientProfile.m_szNick = friendData.m_szRoleName;
         requestAddFriend.m_nFriendCount = 1;
         requestAddFriend.m_astFriendInfo = [clientProfile];
         requestAddFriend.m_iGroupFlag = a_1746.a_503;
         requestAddFriend.m_iGameID = 0;
         requestAddFriend.m_iTagID = 0;
         requestAddFriend.m_szRemarks = "朋友";
         requestAddFriend.m_szTagName = "朋友";
         requestAddFriend.encode(encodeBuffer,encodeLengh);
         requestAddFriend = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_282,encodeBuffer);
      }
      
      private function a_2376(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var responseAddFriend:a_2684 = new a_2684();
         if(!responseAddFriend.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode responseAddFriend failed.");
            return;
         }
         if(0 == responseAddFriend.m_nResultID)
         {
            a_2439.getInstance().addNewFriend(responseAddFriend);
            dataEvent = new a_1778(EventType.a_614);
            dataEvent.dataObject = responseAddFriend;
            trace("responseAddFriend success:" + responseAddFriend.m_nResultID);
            this.a_2310([responseAddFriend.m_stFriendInfo.m_iUIN]);
            this.a_2309([responseAddFriend.m_stFriendInfo.m_iUIN],a_1731.FLAG_GAME | a_1731.a_340 | a_1731.FLAG_VIP);
         }
         else
         {
            dataEvent = new a_1778(EventType.a_615);
            dataEvent.dataObject = responseAddFriend.m_szReasonMessage;
            trace("responseAddFriend failed:" + responseAddFriend.m_nResultID);
         }
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function a_2377(roleUin:int, nickName:String, arrStateDatas:Array) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var reportGamestat:a_2676 = new a_2676();
         reportGamestat.m_nUin = roleUin;
         reportGamestat.m_byClassCount = arrStateDatas.length;
         reportGamestat.m_arrStateData = arrStateDatas;
         reportGamestat.m_szAccount = nickName;
         reportGamestat.encode(encodeBuffer,encodeLengh);
         reportGamestat = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_256,encodeBuffer);
      }
      
      public function a_2118(iDestUIN:int, message:String) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2742 = new a_2742();
         request.m_nControlCMD = 100;
         request.m_iDestUIN = iDestUIN;
         request.m_szMessage = message;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_174,encodeBuffer);
      }
      
      private function a_2378(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var responseTransfer:a_2743 = new a_2743();
         if(!responseTransfer.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode responseTransfer failed.");
            return;
         }
         if(0 == responseTransfer.m_nResultID)
         {
            trace("responseAddFriend success:" + responseTransfer.m_nResultID);
         }
      }
      
      public function a_2379(p_commandID:int, p_commandData:Object) : Boolean
      {
         var encodeBuffer:ByteArray = null;
         var MSG_ID:uint = 0;
         if(p_commandID == a_1740.a_393)
         {
            encodeBuffer = this.requestPlayWith(p_commandID,p_commandData);
            MSG_ID = b_154.a_269;
         }
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,MSG_ID,encodeBuffer);
      }
      
      private function a_2380(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var responseTransfer:a_2844 = new a_2844();
         if(!responseTransfer.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode OnTransferClientCommandResponse failed.");
            return;
         }
         if(0 == responseTransfer.m_nResultID)
         {
            trace("responseAddFriend success:m_nCommandID=" + responseTransfer.m_nCommandID);
         }
      }
      
      private function requestPlayWith(p_commandID:int, p_commandData:Object) : ByteArray
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2683 = new a_2683();
         request.m_iDestUIN = p_commandData.m_iACT == EnmInviteType.REQUEST ? int(p_commandData.m_getUin) : int(p_commandData.m_sendUin);
         request.m_nCommandID = p_commandID;
         request.m_iACT = 1;
         var commandData:ByteArray = new ByteArray();
         var encodeObj:a_2739 = new a_2739();
         encodeObj.m_iACT = p_commandData.m_iACT;
         encodeObj.m_sendUin = p_commandData.m_sendUin;
         encodeObj.m_sendNick = p_commandData.m_sendNick;
         encodeObj.m_getUin = p_commandData.m_getUin;
         encodeObj.m_getNick = p_commandData.m_getNick;
         encodeObj.m_mapID = p_commandData.m_mapID;
         encodeObj.m_gameMode = p_commandData.m_gameMode;
         encodeObj.m_iServerID = p_commandData.m_iServerID;
         encodeObj.m_iRoomID = p_commandData.m_iRoomID;
         encodeObj.m_iTableID = p_commandData.m_iTableID;
         encodeObj.m_szPassword = p_commandData.m_szPassword;
         encodeObj.m_iUnionID = p_commandData.m_iUnionID;
         encodeObj.encode(commandData,0);
         encodeObj = null;
         request.m_nCommandLength = commandData.length;
         request.m_szCommandData = commandData;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         return encodeBuffer;
      }
      
      public function a_2381(iRoleUin:int, enmGetMailType:int = 3) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2968 = new a_2968();
         request.m_iSrcUin = iRoleUin;
         request.m_cGetMailType = enmGetMailType;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_319,encodeBuffer);
      }
      
      private function a_2382(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var response:a_2972 = new a_2972();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CResponseGetPlayerMail failed.");
            return;
         }
         dataEvent = new a_1778(EventType.a_633);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function a_2383(iSrcUin:int, szSrcAccount:String, sendMail:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var item:ItemBaseWithCount = null;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2970 = new a_2970();
         request.m_iSrcUin = iSrcUin;
         request.m_szSrcAccount = szSrcAccount;
         request.m_iDstUin = sendMail.iDstUin;
         request.m_szDstAccount = sendMail.szDstAccount;
         request.m_cExpiredType = sendMail.byExpiredType;
         request.m_cExtraFeeFlag = sendMail.byExtraFeeFlag;
         request.m_nExtraFee = sendMail.iExtraFee;
         request.m_arrMailExtraInfo = [];
         if(sendMail.attr != null)
         {
            item = new ItemBaseWithCount();
            item.m_iItemID = sendMail.attr.CardID;
            item.m_iItemSeq = sendMail.attr.CardSeq;
            item.m_nItemCount = sendMail.attr.CardCount;
            request.m_arrMailExtraInfo = [item];
         }
         request.m_nExtraCount = request.m_arrMailExtraInfo.length;
         request.m_szMailContent = sendMail.szMailContent;
         request.m_szMailTitle = sendMail.szMailTitle;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_318,encodeBuffer);
      }
      
      private function a_2384(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2974 = new a_2974();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CResponseGetPlayerMail failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_634);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function a_2385(arrUpdateMail:Array) : Boolean
      {
         var encodeLengh:int = 0;
         var updateMail:Object = null;
         var hallConn:a_2650 = null;
         var update:UpdateMailInfo = null;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2969 = new a_2969();
         request.m_nUpdateCount = arrUpdateMail.length;
         request.m_arrUpdateInfo = [];
         for each(updateMail in arrUpdateMail)
         {
            update = new UpdateMailInfo();
            update.m_cUpdateFlag = updateMail.m_cUpdateFlag;
            update.m_iMailID = updateMail.m_iMailID;
            update.m_iSrcUin = updateMail.m_iSrcUin;
            update.m_iDstUin = updateMail.m_iDstUin;
            update.m_cProcessType = updateMail.m_cProcessType;
            request.m_arrUpdateInfo.push(update);
         }
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_320,encodeBuffer);
      }
      
      private function a_2386(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var response:a_2973 = new a_2973();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CResponseGetPlayerMail failed.");
            return;
         }
         if(response.m_nResultID == 0)
         {
            dataEvent = new a_1778(EventType.a_635);
            dataEvent.dataObject = response.m_arrUpdateInfo;
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
      }
      
      public function a_2387(iSrcUin:int, iDstUin:int, iMailID:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2967 = new a_2967();
         request.m_iDstUin = iSrcUin;
         request.m_iSrcUin = iDstUin;
         request.m_iMailID = iMailID;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_321,encodeBuffer);
      }
      
      private function a_2388(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2971 = new a_2971();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CResponseGetPlayerMail failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_636);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function a_2389(iSrcUin:int, szRoleName:String, iItemID:int, iItemSeq:int, iCoinPrice:int, iDays:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2861 = new a_2861();
         request.m_iSrcRoleUin = iSrcUin;
         request.m_szSrcRoleName = szRoleName;
         request.m_iRenewCoinPrice = iCoinPrice;
         request.m_iRenewDays = iDays;
         request.m_iItemID = iItemID;
         request.m_iItemSeq = iItemSeq;
         request.m_nPaymentMode = 0;
         request.m_cVipLevel = 0;
         request.m_iClientIP = 0;
         request.m_iRenewCharmPrice = 0;
         request.m_iRenewLotteryPrice = 0;
         request.m_lRenewHappyBeanPrice = 0;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_224,encodeBuffer);
      }
      
      private function a_2390(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2865 = new a_2865();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CSResponeRenewItem failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_647);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function a_2397(iUin:int, iRoleUin:int, iServerID:int, iRoomID:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2826 = new a_2826();
         request.m_iUin = iUin;
         request.m_iRoleUin = iRoleUin;
         request.m_iLogicServerId = iServerID;
         request.m_iRoomId = iRoomID;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_230,encodeBuffer);
      }
      
      private function a_2398(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2846 = new a_2846();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CSResponseUpgrade failed.");
            return;
         }
      }
      
      public function RequestUseSpeaker(szSpeakerMessage:String, nGameID:int = 0) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2864 = new a_2864();
         request.m_szSpeakerMessage = szSpeakerMessage;
         request.m_nGameID = nGameID;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_168,encodeBuffer);
      }
      
      private function a_2399(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2871 = new a_2871();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CSResponseUpgrade failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_624);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
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
            throw new Error(GameStringManager.getInstance().getString(132658));
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
      
      public function onRequestBuySmallRoomGoods(iUin:int, itemID:int, type:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CRequestBuySmallRoomGoods = new CRequestBuySmallRoomGoods();
         request.m_RoleUin = iUin;
         request.m_ItemID = itemID;
         request.m_ItemType = type;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_SMALL_ROOM_BUY,encodeBuffer);
      }
      
      public function onResponseBuySmallRoomGoods(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:CResponseBuySmallRoomGoods = new CResponseBuySmallRoomGoods();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode onBuySmallRoomGoodsResponse failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.BUY_BACK_SMALLROOM);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onRequestSaveSmallRoomInfo(iUin:int, info:Array) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CRequestSaveRoleSmallRoomInfo = new CRequestSaveRoleSmallRoomInfo();
         request.m_iRoleUin = iUin;
         request.m_nItemCount = info.length;
         request.m_arrInfo = info;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_SAVE_SMALL_ROOM_INFO,encodeBuffer);
      }
      
      public function onResponseSaveSmallRoomInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:CResponseSaveRoleSmallRoom = new CResponseSaveRoleSmallRoom();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode onResponseSaveSmallRoomInfo failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.SAVE_BACK_SMALLROOMINFO);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onRequestGetSmallRoomInfo(iUin:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CRequestGetRoleSmallRoomInfo = new CRequestGetRoleSmallRoomInfo();
         request.m_iRoleUin = iUin;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GET_SMALL_ROOM_INFO,encodeBuffer);
      }
      
      public function onResponseGetSmallRoomInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:CResponseGetRoleSmallRoom = new CResponseGetRoleSmallRoom();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode onGetSmallRoomInfoResponse failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.GET_BACK_SMALLROOMINFO);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onRequestGetCrmInfo(iUin:int, iType:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CRequestGetCrmInfo = new CRequestGetCrmInfo();
         request.m_iUIN = iUin;
         request.m_iTyoe = iType;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_DEAL_CRM_DATA,encodeBuffer);
      }
      
      public function onResponseGetCrmInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:CResponseGetCrmInfo = new CResponseGetCrmInfo();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode onGetSmallRoomInfoResponse failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.GET_BACK_CRM_INFO);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function a_2400(iUin:int, iGameID:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2815 = new a_2815();
         request.m_iUin = iUin;
         request.m_nGameID = iGameID;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_334,encodeBuffer);
      }
      
      private function a_2401(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var response:a_2833 = new a_2833();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode OnGetAchievementsResponse failed.");
            return;
         }
         if(response.m_nResultID == 0)
         {
            if(a_2439.getInstance().m_currentRoleUin == response.m_iUin)
            {
               a_2439.getInstance().updateRoleAchievements(response.m_stAchievements);
               dataEvent = new a_1778(EventType.a_655);
            }
            else
            {
               dataEvent = new a_1778(EventType.a_656);
            }
            dataEvent.dataObject = response.m_stAchievements;
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
      }
      
      public function RequestTransferClientLog(iType:int, log:String) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2824 = new a_2824();
         request.m_nType = iType;
         request.m_czComment = log;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_322,encodeBuffer);
      }
      
      public function a_2402(iRoleUin:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2818 = new a_2818();
         request.m_iRoleUin = iRoleUin;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_306,encodeBuffer);
      }
      
      private function a_2403(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var response:a_2836 = new a_2836();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CResponseGetPlayerDefendCard failed.");
            return;
         }
         if(response.m_nResultID == 0)
         {
            dataEvent = new a_1778(EventType.a_657);
            dataEvent.dataObject = response;
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
      }
      
      public function RequestUpdateShowCardSetUp(iShowCard:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2828 = new a_2828();
         request.m_byShowCardFlag = 1;
         request.m_byShowCard = iShowCard;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_307,encodeBuffer);
      }
      
      private function a_2404(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2848 = new a_2848();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CResponseGetPlayerDefendCard failed.");
            return;
         }
         if(response.m_nResultID == 0)
         {
            a_2439.getInstance().updateCurrentShowCard(response.m_byShowCard);
         }
      }
      
      public function RequestDelFriend(iUin:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2678 = new a_2678();
         request.m_aiFriendUIN = [iUin];
         request.m_nCount = 1;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_245,encodeBuffer);
      }
      
      private function a_2405(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2685 = new a_2685();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CResponseGetPlayerDefendCard failed.");
            return;
         }
         a_2439.getInstance().updateFriendByDel(response);
      }
      
      public function RequestUseSkillBook(iCardID:int, iCardSeq:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2829 = new a_2829();
         request.m_iID = iCardID;
         request.m_iSeq = iCardSeq;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_310,encodeBuffer);
      }
      
      private function a_2406(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2853 = new a_2853();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CResponseUseSkillbookItem failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.UseSkillBook);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2407(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2840 = new a_2840();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CResponseHeartBeatToRole failed.");
            return;
         }
         a_1767.getInstance().SystemTime = response.m_iSysteTime;
         a_4657.getInstance().execute("onHallHeartBeat",this,response.m_iSysteTime);
      }
      
      public function a_2408(roleUin:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var requestGetUserTaskInfo:a_2990 = new a_2990();
         requestGetUserTaskInfo.m_iUin = roleUin;
         requestGetUserTaskInfo.encode(encodeBuffer,encodeLengh);
         requestGetUserTaskInfo = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_327,encodeBuffer);
      }
      
      private function a_2409(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var achievementArr:Array = null;
         var i:int = 0;
         var achievementInfo:Object = null;
         var response:a_2995 = new a_2995();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CResponseGetUserTaskInfo failed.");
            return;
         }
         if(response.m_nResultID == 0)
         {
            dataEvent = new a_1778(EventType.a_658);
            achievementArr = response.m_arrTaskInfoSets;
            dataEvent.dataObject = achievementArr;
            a_1789.getInstance().dispatchEvent(dataEvent);
            for(i = 0; i < achievementArr.length; i++)
            {
               achievementInfo = achievementArr[i];
               if(Boolean(achievementInfo) && 4 == achievementInfo.m_iTaskStatus)
               {
                  this.setHeroMapOen(achievementInfo.m_iTaskID);
               }
            }
            a_2161.e.updateHeroOpen();
         }
      }
      
      private function setHeroMapOen(iTaskID:int) : void
      {
         var iMapId:int = 0;
         switch(iTaskID)
         {
            case 320143413:
               iMapId = 2563;
               break;
            case 320143414:
               iMapId = 2306;
               break;
            case 322240563:
               iMapId = 2820;
               break;
            case 322240564:
               iMapId = 2055;
               break;
            case 322240565:
               iMapId = 2056;
         }
         if(0 != iMapId)
         {
            a_2439.getInstance().setHeroMapOpen(iMapId);
         }
      }
      
      public function a_2410(roleUin:int, taskInfo:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var requestPlayerSaveTask:a_2994 = new a_2994();
         requestPlayerSaveTask.m_iUin = roleUin;
         requestPlayerSaveTask.m_stSaveTask = new a_3001();
         requestPlayerSaveTask.m_stSaveTask.m_iTaskID = taskInfo.m_iTaskID;
         requestPlayerSaveTask.m_stSaveTask.m_iAcceptDate = taskInfo.m_iAcceptDate;
         requestPlayerSaveTask.m_stSaveTask.m_iAccomplishedDate = taskInfo.m_iAccomplishedDate;
         requestPlayerSaveTask.m_stSaveTask.m_iTaskStatus = taskInfo.m_iTaskStatus;
         requestPlayerSaveTask.m_stSaveTask.m_iUserDef1 = taskInfo.m_iUserDef1;
         requestPlayerSaveTask.encode(encodeBuffer,encodeLengh);
         requestPlayerSaveTask = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_328,encodeBuffer);
      }
      
      private function a_2411(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var response:a_3000 = new a_3000();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CResponsePlayerSaveTask failed.");
            return;
         }
         if(response.m_nResultID == 0)
         {
            dataEvent = new a_1778(EventType.a_660);
            dataEvent.dataObject = [response.m_stSaveTask];
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
      }
      
      public function a_2412(roleUin:int, taskID:int, byType:int = 0) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var requestPlayerAccomplishTask:a_2992 = new a_2992();
         requestPlayerAccomplishTask.m_iTaskID = taskID;
         requestPlayerAccomplishTask.m_iUin = roleUin;
         requestPlayerAccomplishTask.m_byType = byType;
         requestPlayerAccomplishTask.encode(encodeBuffer,encodeLengh);
         requestPlayerAccomplishTask = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_329,encodeBuffer);
      }
      
      private function a_2413(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var response:a_2997 = new a_2997();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CResponsePlayerAccomplishAchievement failed.");
            return;
         }
         if(response.m_nResultID == 0)
         {
            dataEvent = new a_1778(EventType.a_659);
            dataEvent.dataObject = [response.m_iTaskID];
            a_1789.getInstance().dispatchEvent(dataEvent);
            this.setHeroMapOen(response.m_iTaskID);
            a_2161.e.updateHeroOpen();
         }
      }
      
      public function RequestUseExchangeItem(iCardID:int, iCardSeq:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2829 = new a_2829();
         request.m_iID = iCardID;
         request.m_iSeq = iCardSeq;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         var iMsgID:int = int(b_154.a_311);
         if((iCardID & 0xFFF00000) == 330301440)
         {
            iMsgID = int(b_154.a_312);
         }
         return pBaseProtocol.a_2201(hallConn,iMsgID,encodeBuffer);
      }
      
      private function a_2414(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2850 = new a_2850();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CResponseUseExchangeItem failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_661);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2415(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2851 = new a_2851();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode OnUseBoxItemResponse failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_662);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function requestMarginListData(pData:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2873 = new a_2873();
         request.m_iStart = pData.m_iStart;
         request.m_iEnd = pData.m_iEnd;
         request.m_cSex = pData.m_cSex;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_210,encodeBuffer);
      }
      
      public function requestMarginRegisterFriend(pData:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2877 = new a_2877();
         request.m_czComment = pData.m_czComment;
         request.m_iUIN = pData.m_iUIN;
         request.m_iFlag = pData.m_iFlag;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_206,encodeBuffer);
      }
      
      public function requestMarginReverseRegister(pData:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2878 = new a_2878();
         request.m_iUIN = pData.m_iUIN;
         request.m_iFlag = pData.m_iFlag;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_207,encodeBuffer);
      }
      
      public function requestMarginRegistAdvert(pData:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2876 = new a_2876();
         request.m_iUIN = pData.m_iUIN;
         request.m_iMoney = pData.m_iMoney;
         request.m_czComment = pData.m_czComment;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_208,encodeBuffer);
      }
      
      public function requestMarginModifyAdvert(pData:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2874 = new a_2874();
         request.m_iUIN = pData.m_iUIN;
         request.m_iFlag = pData.m_iFlag;
         request.m_czComment = pData.m_czComment;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_212,encodeBuffer);
      }
      
      public function requestMarginStar(pData:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2880 = new a_2880();
         request.m_iStart = pData.m_iStart;
         request.m_iEnd = pData.m_iEnd;
         request.m_cSex = pData.m_cSex;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_211,encodeBuffer);
      }
      
      public function requestMarginSearch(pData:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2879 = new a_2879();
         request.m_szName = pData.m_szName;
         request.m_iStart = pData.m_iStart;
         request.m_iEnd = pData.m_iEnd;
         request.m_cSex = pData.m_cSex;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_213,encodeBuffer);
      }
      
      public function requestMarginPlayerByUin(pData:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2875 = new a_2875();
         request.m_nCount = pData.m_nCount;
         request.m_aryUin = pData.m_aryUin;
         request.m_cSex = pData.m_cSex;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_209,encodeBuffer);
      }
      
      private function onMarginListData(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2881 = new a_2881();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseKickConsortiaMember failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_694);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function onMarginRegisterFriend(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2885 = new a_2885();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseKickConsortiaMember failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_690);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function onMarginReverseRegister(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2886 = new a_2886();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseKickConsortiaMember failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_691);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function onMarginRegistAdvert(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2884 = new a_2884();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseKickConsortiaMember failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_692);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function onMarginModifyAdvert(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2882 = new a_2882();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseKickConsortiaMember failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_696);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function onMarginStar(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2888 = new a_2888();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseKickConsortiaMember failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_695);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function onMarginSearch(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2887 = new a_2887();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseKickConsortiaMember failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_213);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function onMarginPlayerByUin(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2883 = new a_2883();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseKickConsortiaMember failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_693);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function requestChangeName(pData:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2747 = new a_2747();
         request.m_iUin = pData.m_iUin;
         request.m_iRoleUin = pData.m_iRoleUin;
         request.m_szOldRoleName = pData.m_szOldRoleName;
         request.m_szNewRoleName = pData.m_szNewRoleName;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_228,encodeBuffer);
      }
      
      private function onChangeNameCard(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dict:Dictionary = null;
         var response:a_2748 = new a_2748();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseKickConsortiaMember failed.");
            return;
         }
         if(response.m_nResultID == 0)
         {
            dict = new Dictionary();
            a_2608.getInstance().setPlayerCommonData(response.m_iRoleUin,{
               "m_iRoleUin":response.m_iRoleUin,
               "m_szRoleName":response.m_szNewRoleName
            });
            dict[response.m_iRoleUin] = {
               "m_iRoleUin":response.m_iRoleUin,
               "m_szRoleName":response.m_szNewRoleName
            };
            a_2332.getInstance().onSetPlayersCommonData(dict);
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_228);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function RequestUseCardSlotPackage(data:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var msgID:uint = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2863 = new a_2863();
         request.m_iUin = a_2439.getInstance().m_currentRoleUin;
         request.m_cCardSlotType = data.m_cCardSlotType;
         request.m_cSlotPackPosi = data.m_cSlotPackPosi;
         request.m_iItemID = data.m_iItemID;
         request.m_iItemSeq = data.m_iItemSeq;
         if(data.m_iAct == 0)
         {
            msgID = b_154.a_177;
         }
         else
         {
            msgID = b_154.a_178;
         }
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,msgID,encodeBuffer);
      }
      
      private function a_2416(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var arrCardsInfo:Array = null;
         var stCardStore:Object = null;
         var objSlotInfo:Object = null;
         var response:a_2870 = new a_2870();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CSResponseUseCardSlotPackage failed.");
            return;
         }
         if(response.m_nResult == 0)
         {
            arrCardsInfo = a_2439.getInstance().GetTDCardsInfo()["CardStore"];
            for each(stCardStore in arrCardsInfo)
            {
               if(response.m_cCardSlotType == stCardStore.m_byCardStoreType)
               {
                  for each(objSlotInfo in stCardStore.m_astSlotInfo)
                  {
                     if(objSlotInfo.m_cPackagePosi == response.m_cSlotPackPosi)
                     {
                        if(response.m_iItemID == 0)
                        {
                           stCardStore.m_nCardStoreOpenedNum -= objSlotInfo.m_nPackAdd;
                           objSlotInfo.m_iItemID = 0;
                           objSlotInfo.m_nPackAdd = 0;
                        }
                        else
                        {
                           if(objSlotInfo.m_iItemID != 0)
                           {
                              stCardStore.m_nCardStoreOpenedNum -= objSlotInfo.m_nPackAdd;
                           }
                           objSlotInfo.m_nPackAdd = response.m_nSlotAdd;
                           objSlotInfo.m_iItemID = response.m_iItemID;
                           stCardStore.m_nCardStoreOpenedNum += objSlotInfo.m_nPackAdd;
                        }
                        a_2439.getInstance().updatePackageSize(response.m_cCardSlotType,stCardStore.m_nCardStoreOpenedNum);
                        break;
                     }
                  }
                  break;
               }
            }
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_700);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function RequestOpenCardSlotPackage(data:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2860 = new a_2860();
         request.m_iUin = a_2439.getInstance().m_currentRoleUin;
         request.m_cCardSlotType = data.m_cCardSlotType;
         request.m_cSlotPackPosi = data.m_cSlotPackPosi;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_176,encodeBuffer);
      }
      
      private function a_2417(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var arrCardsInfo:Array = null;
         var stCardStore:Object = null;
         var isNeedTochange:Boolean = false;
         var objSlotInfo:Object = null;
         var response:a_2867 = new a_2867();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CSResponseOpenCardSlotPackage failed.");
            return;
         }
         if(response.m_nResult == 0)
         {
            arrCardsInfo = a_2439.getInstance().GetTDCardsInfo()["CardStore"];
            for each(stCardStore in arrCardsInfo)
            {
               if(response.m_cCardSlotType == stCardStore.m_byCardStoreType)
               {
                  isNeedTochange = true;
                  for each(objSlotInfo in stCardStore.m_astSlotInfo)
                  {
                     if(objSlotInfo.m_cPackagePosi == response.m_cSlotPackPosi)
                     {
                        isNeedTochange = false;
                        break;
                     }
                  }
                  if(isNeedTochange)
                  {
                     ++stCardStore.m_nSlotPackCount;
                     objSlotInfo = {};
                     objSlotInfo.m_cPackagePosi = response.m_cSlotPackPosi;
                     objSlotInfo.m_nPackAdd = 0;
                     objSlotInfo.m_iItemID = 0;
                     stCardStore.m_astSlotInfo.push(objSlotInfo);
                  }
                  break;
               }
            }
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_701);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function RequestSendVow(data:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2890 = new a_2890();
         request.m_iUin = a_2439.getInstance().m_currentRoleUin;
         request.m_nCount = data.m_nCount;
         request.m_iBoxID = data.m_iBoxID;
         request.m_nLevel = data.m_nLevel;
         request.m_iSymbol = data.m_iSymbol;
         request.m_iItemID = data.m_iItemID;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_336,encodeBuffer);
      }
      
      public function RequestGetVowNews(data:Object) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2889 = new a_2889();
         var m_iRoleUIN:int = a_2439.getInstance().m_currentRoleUin;
         if(data != null)
         {
            m_iRoleUIN = int(data.m_iRoleUIN);
         }
         request.m_iRoleUIN = m_iRoleUIN;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.a_337,encodeBuffer);
      }
      
      private function OnResponseSendVow(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2892 = new a_2892();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseHallVow failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_702);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function OnResponseGetVowNews(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:a_2891 = new a_2891();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode SCResponseGetVowNews failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_703);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function RequestBuyClimbTowerCount(iType:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CRequestBuyClimbTowerCount = new CRequestBuyClimbTowerCount();
         var m_iRoleUin:int = a_2439.getInstance().m_currentRoleUin;
         request.m_iUin = m_iRoleUin;
         request.m_iType = iType;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_BUY_CLIMB_TOWER_COUNT,encodeBuffer);
      }
      
      private function OnResponseBuyClimbTowerCount(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:CResponseBuyClimbTowerCount = new CResponseBuyClimbTowerCount();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CResponseBuyClimbTowerCount failed.");
            return;
         }
      }
      
      private function OnResponseGetClimbTowerRank(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:CResponseGetClimbTowerRank = new CResponseGetClimbTowerRank();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CResponseBuyClimbTowerCount failed.");
            return;
         }
         a_4657.getInstance().execute("onGetClimbTowerRank",this,response);
      }
      
      public function RequestBuyMiShiUseNum(iInstanceType:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CMessageBuyMiShiUsdNum = new CMessageBuyMiShiUsdNum();
         var m_iRoleUin:int = a_2439.getInstance().m_currentRoleUin;
         request.m_iUin = m_iRoleUin;
         request.m_iInstanceType = iInstanceType;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_BUY_INSTANCE_COUNT,encodeBuffer);
      }
      
      private function OnResponseBuyMiShiUseNum(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:CResponseBuyMiShiUsdNum = new CResponseBuyMiShiUsdNum();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CResponseBuyClimbTowerCount failed.");
            return;
         }
         a_4657.getInstance().execute("onBuyMiShiUseNum",this,response);
      }
      
      public function RequestRecipesCompose(stComposeInfo:RecipesStructComposeInfo) : Boolean
      {
         var iLength:int = 0;
         var request:CSRequestRecipesCompose = new CSRequestRecipesCompose();
         request.m_iUIN = stComposeInfo.m_iUIN;
         request.m_iValue = stComposeInfo.m_iValue;
         request.m_iRuleID = stComposeInfo.m_iRuleID;
         request.m_iCookeryID = stComposeInfo.m_iCookeryID;
         request.m_iPropRecipesId = stComposeInfo.m_iPropRecipesId;
         request.m_aryMaterial = stComposeInfo.m_aryMaterial;
         var arybyte:ByteArray = new ByteArray();
         request.encode(arybyte,iLength);
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_COOKERY_COMPOSE,arybyte);
      }
      
      private function OnResponseRecipesCompose(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:SCResponseRecipesCompose = new SCResponseRecipesCompose();
         if(!response.decode(protocalBuffer,decode_length))
         {
            return;
         }
         var stRecipesCompose:RecipesStructComposeResponse = new RecipesStructComposeResponse();
         stRecipesCompose.m_nResult = response.m_nResult;
         stRecipesCompose.m_iUIN = response.m_iUIN;
         stRecipesCompose.m_iValue = response.m_iValue;
         stRecipesCompose.m_iCookeryID = response.m_iCookeryID;
         stRecipesCompose.m_iRuleID = response.m_iRuleID;
         stRecipesCompose.m_aryMaterial = response.m_aryMaterial;
         stRecipesCompose.m_strMessage = response.m_strMessage;
         a_4657.getInstance().execute("ResponseRecipesCompose",this,stRecipesCompose);
      }
      
      public function RequestRecipesGetInfo(m_iUin:int) : Boolean
      {
         var iLength:int = 0;
         var request:CSRequestRecipesGetInfo = new CSRequestRecipesGetInfo();
         request.m_iUIN = m_iUin;
         var aryByte:ByteArray = new ByteArray();
         request.encode(aryByte,iLength);
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_COOKERY_INFO_GET,aryByte);
      }
      
      private function OnResponseRecipesGetInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:SCResponseRecipesGetInfo = new SCResponseRecipesGetInfo();
         if(!response.decode(protocalBuffer,decode_length))
         {
            return;
         }
         var stRecipesInfo:RecipesStructGetInfoResponse = new RecipesStructGetInfoResponse();
         stRecipesInfo.m_nResult = response.m_nResult;
         stRecipesInfo.m_iUIN = response.m_iUIN;
         stRecipesInfo.m_iValue = response.m_iValue;
         stRecipesInfo.m_aryRecipesInfo = response.m_aryRecipesInfo;
         stRecipesInfo.strMessage = response.strMessage;
         a_4657.getInstance().execute("ResponseRecipesGetInfo",this,stRecipesInfo);
      }
      
      public function RequestRecipesActive(stRecipesActiv:RecipesStructRecipesActive) : Boolean
      {
         var iLength:int = 0;
         var request:CSRequestRecipesActive = new CSRequestRecipesActive();
         request.m_iUIN = stRecipesActiv.m_iUIN;
         request.m_iCookeryID = stRecipesActiv.m_iCookeryID;
         request.m_iStatus = stRecipesActiv.m_iStatus;
         var aryByte:ByteArray = new ByteArray();
         request.encode(aryByte,iLength);
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_COOKERY_STATUS_SET,aryByte);
      }
      
      private function OnResponseRecipesActive(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:SCResponseRecipesActive = new SCResponseRecipesActive();
         if(!response.decode(protocalBuffer,decode_length))
         {
            return;
         }
         var stRecipesActive:RecipesStructAvtiveResponse = new RecipesStructAvtiveResponse();
         stRecipesActive.m_nResult = response.m_nResult;
         stRecipesActive.m_iUIN = response.m_iUIN;
         stRecipesActive.m_iCookeryID = response.m_iCookeryID;
         stRecipesActive.m_iStatus = response.m_iStatus;
         stRecipesActive.m_strMessage = response.m_strMessage;
         a_4657.getInstance().execute("ResponseRecipesActive",this,stRecipesActive);
      }
      
      private function OnGetGuideData(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:CGuideDataMessage = new CGuideDataMessage();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CResponseBuyClimbTowerCount failed.");
            return;
         }
         a_2439.getInstance().updateGuideData(response.m_szExtData);
      }
      
      public function RequestVowRank() : Boolean
      {
         var aryByte:ByteArray = new ByteArray();
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GET_VOW_RANK_INFO_LIST,aryByte);
      }
      
      private function onResponseVowRank(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:CRequestVowRank = new CRequestVowRank();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CResponseBuyClimbTowerCount failed.");
            return;
         }
         a_4657.getInstance().execute("ResponseVowRank",null,response);
      }
      
      public function ChangeGuideData(guideData:String) : Boolean
      {
         var encodeLengh:int = 0;
         var date:Date = new Date();
         var data:String = String(date.time) + "," + guideData;
         a_2439.getInstance().updateGuideData(data);
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CGuideDataMessage = new CGuideDataMessage();
         var m_iRoleUin:int = a_2439.getInstance().m_currentRoleUin;
         request.m_iUIN = m_iRoleUin;
         var dataBuffer:ByteArray = new ByteArray();
         dataBuffer.writeUTFBytes(data);
         request.m_szExtDataByteArray = dataBuffer;
         request.m_nExtDataSize = dataBuffer.length;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_UPDATE_GUIDE_DATA,encodeBuffer);
      }
      
      public function GetPetSwallow(iRoleUin:int) : Boolean
      {
         var byteArr:ByteArray = new ByteArray();
         byteArr.writeInt(iRoleUin);
         var hallServerConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallServerConn,b_154.MSG_HALL_PET_SWALLOW,byteArr);
      }
      
      private function OnPetSwallow(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var dataEvent:a_1778 = null;
         var response:CResponsePetSwallow = new CResponsePetSwallow();
         response.decode(protocalBuffer);
         if(0 == response.m_nResultID)
         {
            dataEvent = new a_1778(EventType.PET_SWALLOW);
            dataEvent.dataObject = response;
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
      }
      
      public function GetPetEatAnother(iUin:int, iItemID1:int, iItemSeq1:int, iItemID2:int, iItemSeq2:int) : void
      {
         var byteArr:ByteArray = new ByteArray();
         var request:CRequestPetEatAnother = new CRequestPetEatAnother();
         request.m_iUIN = iUin;
         request.m_iItemID1 = iItemID1;
         request.m_iItemSeq1 = iItemSeq1;
         request.m_iItemID2 = iItemID2;
         request.m_iItemSeq2 = iItemSeq2;
         request.Encode(byteArr);
         var hallServerConn:a_2650 = a_2251.getInstance().a_2253();
         pBaseProtocol.a_2201(hallServerConn,b_154.MSG_HALL_PET_EAT_ANOTHER,byteArr);
      }
      
      public function OnGetPetEatAnother(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponsePetEatAnother = new CResponsePetEatAnother();
         response.Decode(protocalBuffer);
         var dataEvent:a_1778 = new a_1778(EventType.PET_EAT_ANOTHER);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function GetChangePetStatus(iUin:int, id:int, seq:int, Current:int) : void
      {
         var bytearr:ByteArray = new ByteArray();
         var request:CRequestChangePetStatus = new CRequestChangePetStatus();
         request.m_iUIN = iUin;
         request.m_iItemID = id;
         request.m_iItemSeq = seq;
         request.m_iPetCurrentStatus = Current;
         request.Encode(bytearr);
         var hallServerConn:a_2650 = a_2251.getInstance().a_2253();
         pBaseProtocol.a_2201(hallServerConn,b_154.MSG_HALL_CHANGE_PET_STATUS,bytearr);
      }
      
      private function OnGetChangePetStatus(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var dataEvent:a_1778 = null;
         var response:CResponseChangePetStatus = new CResponseChangePetStatus();
         response.Decode(protocalBuffer);
         if(0 == response.m_nResultID)
         {
            dataEvent = new a_1778(EventType.CHANGE_PET_STATUS);
            dataEvent.dataObject = response;
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
      }
      
      public function GetPetSoltCount(iRoleUin:int) : void
      {
         var byteArr:ByteArray = new ByteArray();
         a_2664.encode_int32(byteArr,iRoleUin);
         var hallServerConn:a_2650 = a_2251.getInstance().a_2253();
         pBaseProtocol.a_2201(hallServerConn,b_154.MSG_HALL_GET_PET_ACCOUNT,byteArr);
      }
      
      private function OnGetPetSoltCount(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var dataEvent:a_1778 = null;
         var response:CReponseGetPetAccount = new CReponseGetPetAccount();
         response.Decode(protocalBuffer);
         if(0 == response.m_nResultID)
         {
            dataEvent = new a_1778(EventType.GET_PET_ACCOUNT);
            dataEvent.dataObject = response;
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
      }
      
      public function OpenPetSolt(iRoleUin:int, money:int, m_iCurrentPetSlotCount:int) : void
      {
         var byteArr:ByteArray = new ByteArray();
         byteArr.writeInt(iRoleUin);
         byteArr.writeInt(money);
         byteArr.writeInt(m_iCurrentPetSlotCount);
         var hallServerConn:a_2650 = a_2251.getInstance().a_2253();
         pBaseProtocol.a_2201(hallServerConn,b_154.MSG_HALL_PET_SLOT,byteArr);
      }
      
      private function OnOpenPetSolt(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var dataEvent:a_1778 = null;
         var response:CReponseOpenPetSolt = new CReponseOpenPetSolt();
         response.Decode(protocalBuffer);
         if(0 == response.m_nResultID)
         {
            dataEvent = new a_1778(EventType.OPEN_SOLT);
            dataEvent.dataObject = response;
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
      }
      
      public function BuyChallengeCount(uin:int, coin:int, count:int) : void
      {
         var byteArr:ByteArray = new ByteArray();
         var request:CRequestBuyChallengeCount = new CRequestBuyChallengeCount();
         request.m_iUin = uin;
         request.m_iDeltaCoin = coin;
         request.m_iPurchaseCount = count;
         request.Encode(byteArr);
         var hallServerConn:a_2650 = a_2251.getInstance().a_2253();
         pBaseProtocol.a_2201(hallServerConn,b_154.MSG_HALL_BUY_CHALLENGE_COUNT,byteArr);
      }
      
      private function OnBuyChallengeCount(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseBuyChallengeCount = new CResponseBuyChallengeCount();
         response.Decode(protocalBuffer);
         var dataEvent:a_1778 = new a_1778(EventType.BUY_CHALLENGE_COUNT);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function NotifyRefreshGameExtInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CNotifyRefreshGameExtInfoToClient = new CNotifyRefreshGameExtInfoToClient();
         response.Decode(protocalBuffer);
         var dataEvent:a_1778 = new a_1778(EventType.NOTIFY_PET_INFO);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onRequestChoujiang(iUin:int, iType:int, iBox:int) : Boolean
      {
         var iLength:int = 0;
         var request:CRequestChoujiang = new CRequestChoujiang();
         request.m_iUIN = iUin;
         request.m_iType = iType;
         request.m_iBox = iBox;
         var aryByte:ByteArray = new ByteArray();
         request.encode(aryByte,iLength);
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_CHOUJIANG,aryByte);
      }
      
      public function onRequestChoujiangInfo(iUin:int) : Boolean
      {
         var iLength:int = 0;
         var request:CRequestChoujiangInfo = new CRequestChoujiangInfo();
         request.m_iUin = iUin;
         var aryByte:ByteArray = new ByteArray();
         request.encode(aryByte,iLength);
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GET_CHOUJIANG_INFO,aryByte);
      }
      
      public function onResponseChoujiang(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseChoujiang = new CResponseChoujiang();
         response.decode(protocalBuffer);
         var dataEvent:a_1778 = new a_1778(EventType.CHOUJIANG_AWAED);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onResponseChoujiangInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseChoujiangInfo = new CResponseChoujiangInfo();
         response.decode(protocalBuffer);
         var dataEvent:a_1778 = new a_1778(EventType.CHOUJIANG_INFO);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onRequestZhencang(iUin:int, awardid:int) : Boolean
      {
         var iLength:int = 0;
         var request:CRequestZhencang = new CRequestZhencang();
         request.m_iUin = iUin;
         request.awardid = awardid;
         var aryByte:ByteArray = new ByteArray();
         request.encode(aryByte,iLength);
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GET_ZHENCANG,aryByte);
      }
      
      public function onResponseZhencang(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseZhencang = new CResponseZhencang();
         response.decode(protocalBuffer);
         var dataEvent:a_1778 = new a_1778(EventType.ZHENCANG_RESULT);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onRequestExchange(iUin:int, cardid:int) : Boolean
      {
         var iLength:int = 0;
         var request:CRequestExchange = new CRequestExchange();
         request.m_iUIN = iUin;
         request.m_iCardID = cardid;
         var aryByte:ByteArray = new ByteArray();
         request.encode(aryByte,iLength);
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_EXCHANGE,aryByte);
      }
      
      public function onResponseExchange(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseExchange = new CResponseExchange();
         response.decode(protocalBuffer);
         var dataEvent:ExchangeEvent = new ExchangeEvent(EventType.EXCHANGE_RESPONSE);
         dataEvent.m_stResponseExchange = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onRequestExchangeInfo(iUin:int) : Boolean
      {
         var iLength:int = 0;
         var request:CRequestExchangeInfo = new CRequestExchangeInfo();
         request.m_iUIN = iUin;
         var aryByte:ByteArray = new ByteArray();
         request.encode(aryByte,iLength);
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GET_EXCHANGE_INFO,aryByte);
      }
      
      public function onResponseExchangeInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseExchangeInfo = new CResponseExchangeInfo();
         response.decode(protocalBuffer);
         var dataEvent:ExchangeEvent = new ExchangeEvent(EventType.EXCHANGE_INFO);
         dataEvent.m_stResponseExchangeInfo = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onRequestChangeFortune(iUin:int) : Boolean
      {
         var iLength:int = 0;
         var request:CRequestFortune = new CRequestFortune();
         request.m_iUIN = iUin;
         var aryByte:ByteArray = new ByteArray();
         request.encode(aryByte,iLength);
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_FORTUNE,aryByte);
      }
      
      public function onResponseChangeFortune(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseFortune = new CResponseFortune();
         response.decode(protocalBuffer);
         var dataEvent:ExchangeEvent = new ExchangeEvent(EventType.FORTUNE_RESULT);
         dataEvent.m_stResponseFortune = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onResponseDecompose(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseDecompose = new CResponseDecompose();
         response.decode(protocalBuffer);
         var stExchangeEvent:ExchangeEvent = new ExchangeEvent(EventType.DECOMPOSE_RESPONSE);
         stExchangeEvent.m_stResponseDecompose = response;
         a_1789.getInstance().dispatchEvent(stExchangeEvent);
      }
      
      public function onRequestDecompose(iUin:int, iCardID:int, iCardSeq:int) : Boolean
      {
         var iLength:int = 0;
         var request:CRequestDecompose = new CRequestDecompose();
         request.m_iUIN = iUin;
         request.m_iCardID = iCardID;
         request.m_iCardSeq = iCardSeq;
         var aryByte:ByteArray = new ByteArray();
         request.encode(aryByte,iLength);
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_DECOMPOSE,aryByte);
      }
      
      public function OnCCSRequestWeddingCharmInfo(iUin:int) : Boolean
      {
         var request:CCSRequestWeddingCharmInfo = new CCSRequestWeddingCharmInfo();
         request.m_iUin = iUin;
         var aryByte:ByteArray = new ByteArray();
         request.encode(aryByte,0);
         var hallConn:a_2650 = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GET_WEDDING_CHARM_INFO,aryByte);
      }
      
      public function OnCCSReuestWeddingCharmShop(iUin:int, iItemID:int) : Boolean
      {
         var hallConn:a_2650 = null;
         var request:CCSReuestWeddingCharmShop = new CCSReuestWeddingCharmShop();
         request.m_iUin = iUin;
         request.m_iItemID = iItemID;
         var aryByte:ByteArray = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_BUY_WEDDING_CHARM_SHOP,aryByte);
      }
      
      public function OnCCSResponseWeddingCharmInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CCSResponseWeddingCharmInfo = null;
         var stCharmEvent:CharmEvent = null;
         response = new CCSResponseWeddingCharmInfo();
         response.decode(protocalBuffer,0);
         stCharmEvent = new CharmEvent(EventType.CHARM_SHOP_INFO);
         stCharmEvent.Data = response;
         a_1789.getInstance().dispatchEvent(stCharmEvent);
      }
      
      public function OnCCSResponseWeddingCharmShop(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CCSResponseWeddingCharmShop = null;
         var dataEvent:CharmEvent = null;
         response = new CCSResponseWeddingCharmShop();
         response.decode(protocalBuffer,0);
         dataEvent = new CharmEvent(EventType.CHARM_SHOP_BUY);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCCSRequestGetCharmRank(iUin:int, iType:int, iStartIndex:int, iCount:int, strSearch:* = "") : Boolean
      {
         var request:CCSRequestGetCharmRank = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CCSRequestGetCharmRank();
         request.m_iUin = iUin;
         request.m_iType = iType;
         request.m_iStartIndex = iStartIndex;
         request.m_iCount = iCount;
         request.m_szSearch = strSearch;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GET_CHARM_RANK,aryByte);
      }
      
      public function OnCCSRequestGetCharmInfo(iUin:int, iDstUin:int) : Boolean
      {
         var request:CCSRequestGetCharmInfo = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CCSRequestGetCharmInfo();
         request.m_iUin = iUin;
         request.m_iDstUin = iDstUin;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GET_CHARM_INFO,aryByte);
      }
      
      public function OnCCSRequestGetSendFlowersRecord(iUin:int) : Boolean
      {
         var request:CCSRequestGetSendFlowersRecord = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CCSRequestGetSendFlowersRecord();
         request.m_iUin = iUin;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GET_SEND_FLOWERS_RECORD,aryByte);
      }
      
      public function OnCCSRequestSendFlowers(iUin:int, iDstUin:int, iType:int) : Boolean
      {
         var request:CCSRequestSendFlowers = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CCSRequestSendFlowers();
         request.m_iUin = iUin;
         request.m_iDstUin = iDstUin;
         request.m_iType = iType;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_SEND_FLOWERS,aryByte);
      }
      
      public function OnCCSRequestCharmAward(iUin:int) : Boolean
      {
         var request:CCSRequestCharmAward = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CCSRequestCharmAward();
         request.m_iUin = iUin;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_CHARM_AWARD,aryByte);
      }
      
      public function OnCCSRequestCharmUpdateDeclaration(iUin:int, strDeclaration:String) : Boolean
      {
         var request:CCSRequestCharmUpdateDeclaration = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CCSRequestCharmUpdateDeclaration();
         request.m_iUin = iUin;
         request.m_szDeclaration = strDeclaration;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_CHRAM_UPDATE_DECLARATION,aryByte);
      }
      
      public function OnCCSRequestGetSendFlowersInfo(iUin:int, iDstUin:int) : Boolean
      {
         var request:CCSRequestGetSendFlowersInfo = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CCSRequestGetSendFlowersInfo();
         request.m_iUin = iUin;
         request.m_iDstUin = iDstUin;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GET_SEND_FLOWERS_INFO,aryByte);
      }
      
      public function OnCCSResponseGetCharmRank(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CCSResponseGetCharmRank = null;
         var stCharmEvent:CharmEvent = null;
         response = new CCSResponseGetCharmRank();
         response.decode(protocalBuffer,0);
         stCharmEvent = new CharmEvent(EventType.NEW_MARGIN_CHARM_RANK);
         stCharmEvent.Data = response;
         a_1789.getInstance().dispatchEvent(stCharmEvent);
      }
      
      public function OnCCSResponseGetCharmInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CCSResponseGetCharmInfo = null;
         var stCharmEvent:CharmEvent = null;
         response = new CCSResponseGetCharmInfo();
         response.decode(protocalBuffer,0);
         stCharmEvent = new CharmEvent(EventType.NEW_MARGIN_CHARM_INFO);
         stCharmEvent.Data = response;
         a_1789.getInstance().dispatchEvent(stCharmEvent);
      }
      
      public function OnCCSResponseGetSendFlowersRecord(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CCSResponseGetSendFlowersRecord = null;
         var stCharmEvent:CharmEvent = null;
         response = new CCSResponseGetSendFlowersRecord();
         response.decode(protocalBuffer,0);
         stCharmEvent = new CharmEvent(EventType.NEW_MARGIN_SEND_FLOWER_RECORD);
         stCharmEvent.Data = response;
         a_1789.getInstance().dispatchEvent(stCharmEvent);
      }
      
      public function OnResponseGetSendFlowersInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CCSResponseSendFlowers = null;
         var stCharmEvent:CharmEvent = null;
         response = new CCSResponseSendFlowers();
         response.decode(protocalBuffer,0);
         stCharmEvent = new CharmEvent(EventType.NEW_MARGIN_GET_SEND_FLOWER);
         stCharmEvent.Data = response;
         a_1789.getInstance().dispatchEvent(stCharmEvent);
      }
      
      public function OnCCSResponseSendFlowers(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CCSResponseSendFlowers = null;
         var stCharmEvent:CharmEvent = null;
         response = new CCSResponseSendFlowers();
         response.decode(protocalBuffer,0);
         stCharmEvent = new CharmEvent(EventType.NEW_MARGIN_SEND_FLOWER);
         stCharmEvent.Data = response;
         a_1789.getInstance().dispatchEvent(stCharmEvent);
      }
      
      public function OnCCSResponseCharmAward(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CCSResponseCharmAward = null;
         var stCharmEvent:CharmEvent = null;
         response = new CCSResponseCharmAward();
         response.decode(protocalBuffer,0);
         stCharmEvent = new CharmEvent(EventType.NEW_MARGIN_CHARM_AWARD);
         stCharmEvent.Data = response;
         a_1789.getInstance().dispatchEvent(stCharmEvent);
      }
      
      public function OnCCSResponseCharmUpdateDeclaration(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CCSResponseCharmUpdateDeclaration = null;
         var stCharmEvent:CharmEvent = null;
         response = new CCSResponseCharmUpdateDeclaration();
         response.decode(protocalBuffer,0);
         stCharmEvent = new CharmEvent(EventType.NEW_MARGIN_CHARM_UPDATE_DECLARATION);
         stCharmEvent.Data = response;
         a_1789.getInstance().dispatchEvent(stCharmEvent);
      }
      
      public function OnCCSRequestCrystoneCompose(iUin:int, iRecipeID:int) : Boolean
      {
         var request:CCSRequestCrystoneCompose = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CCSRequestCrystoneCompose();
         request.m_iUin = iUin;
         request.m_iRecipeID = iRecipeID;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_CRYSTONE_COMPOSE,aryByte);
      }
      
      public function OnCCSRequestCrystoneDecompose(iUin:int, iCrystoneID:int, iSeq:int) : Boolean
      {
         var request:CCSRequestCrystoneDecompose = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CCSRequestCrystoneDecompose();
         request.m_iUin = iUin;
         request.m_iCrystoneID = iCrystoneID;
         request.m_iSeq = iSeq;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_CRYSTONE_DECOMPOSE,aryByte);
      }
      
      public function OnCCSRequestCrystoneUpgrade(iUin:int, iCrystoneID:int, iSeq:int, iSafe:int) : Boolean
      {
         var request:CCSRequestCrystoneUpgrade = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CCSRequestCrystoneUpgrade();
         request.m_iUin = iUin;
         request.m_iCrystoneID = iCrystoneID;
         request.m_iSeq = iSeq;
         request.m_iSafe = iSafe;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_CRYSTONE_UPGRADE,aryByte);
      }
      
      public function OnCCSRequestCrystoneEquip(iUin:int, iCrystoneID:int, iType:int) : Boolean
      {
         var request:CCSRequestCrystoneEquip = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CCSRequestCrystoneEquip();
         request.m_iUin = iUin;
         request.m_iCrystoneID = iCrystoneID;
         request.m_iType = iType;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_CRYSTONE_EQUIP,aryByte);
      }
      
      public function OnCCSResponseCrystoneCompose(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CCSResponseCrystoneCompose = null;
         var stCharmEvent:CharmEvent = null;
         response = new CCSResponseCrystoneCompose();
         response.decode(protocalBuffer,0);
         stCharmEvent = new CharmEvent(EventType.CHARM_CRYSTAL_COMPOSE);
         stCharmEvent.Data = response;
         a_1789.getInstance().dispatchEvent(stCharmEvent);
      }
      
      public function OnCCSResponseCrystoneDecompose(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CCSResponseCrystoneDecompose = null;
         var stCharmEvent:CharmEvent = null;
         response = new CCSResponseCrystoneDecompose();
         response.decode(protocalBuffer,0);
         stCharmEvent = new CharmEvent(EventType.CHARM_CRYSTAL_DECOMPOSE);
         stCharmEvent.Data = response;
         a_1789.getInstance().dispatchEvent(stCharmEvent);
      }
      
      public function OnCCSResponseCrystoneUpgrade(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CCSResponseCrystoneUpgrade = null;
         var stCharmEvent:CharmEvent = null;
         response = new CCSResponseCrystoneUpgrade();
         response.decode(protocalBuffer,0);
         stCharmEvent = new CharmEvent(EventType.CHARM_CRYSTAL_UPGRADE);
         stCharmEvent.Data = response;
         a_1789.getInstance().dispatchEvent(stCharmEvent);
      }
      
      public function OnCCSResponseCrystoneEquip(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CCSResponseCrystoneEquip = null;
         var stCharmEvent:CharmEvent = null;
         response = new CCSResponseCrystoneEquip();
         response.decode(protocalBuffer,0);
         stCharmEvent = new CharmEvent(EventType.CHARM_CRYSTAL_EQUIP);
         stCharmEvent.Data = response;
         a_1789.getInstance().dispatchEvent(stCharmEvent);
      }
      
      public function onRequestMatchRank(iUin:int, iType:int) : Boolean
      {
         var request:CRequestGetMatchRank = null;
         var aryByte:ByteArray = null;
         var iLength:int = 0;
         var hallConn:a_2650 = null;
         request = new CRequestGetMatchRank();
         request.m_iUin = iUin;
         request.m_iType = iType;
         aryByte = new ByteArray();
         request.encode(aryByte,iLength);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GET_MATCH_RANK,aryByte);
      }
      
      public function onResponseMatchRank(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseGetMatchRank = null;
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         response = new CResponseGetMatchRank();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CResponseGetMatchRank failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GETMATCHRANK_RESULT);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onRequestMatchAward(iUin:int, iFlag:int, iType:int, iLevel:int) : Boolean
      {
         var request:CRequestGetMatchAward = null;
         var aryByte:ByteArray = null;
         var iLength:int = 0;
         var hallConn:a_2650 = null;
         request = new CRequestGetMatchAward();
         request.m_iUin = iUin;
         request.m_iFlag = iFlag;
         request.m_iType = iType;
         request.m_iLevel = iLevel;
         aryByte = new ByteArray();
         request.encode(aryByte,iLength);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GET_MATCH_AWARD,aryByte);
      }
      
      public function onResponseMatchAward(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseGetMatchAward = null;
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         response = new CResponseGetMatchAward();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CResponseGetMatchAward failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GETMATCHAWARD_RESULT);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onRequestIslandRank(iUin:int) : Boolean
      {
         var request:CRequestGetIslandRank = null;
         var aryByte:ByteArray = null;
         var iLength:int = 0;
         var hallConn:a_2650 = null;
         request = new CRequestGetIslandRank();
         request.m_iUin = iUin;
         aryByte = new ByteArray();
         request.encode(aryByte,iLength);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GET_ISLAND_RANK,aryByte);
      }
      
      public function onResponseIslandRank(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseGetIslandRank = null;
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         response = new CResponseGetIslandRank();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CResponseGetIslandRank failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GETISLANDRANK_RESULT);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onRequestIslandAward(iUin:int, iMapID:int, iConsortiaID:int, iType:int) : Boolean
      {
         var request:CRequestGetIslandAward = null;
         var aryByte:ByteArray = null;
         var iLength:int = 0;
         var hallConn:a_2650 = null;
         request = new CRequestGetIslandAward();
         request.m_iUin = iUin;
         request.m_iMapID = iMapID;
         request.m_iConsortiaID = iConsortiaID;
         request.m_iType = iType;
         aryByte = new ByteArray();
         request.encode(aryByte,iLength);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GET_ISLAND_AWARD,aryByte);
      }
      
      public function onResponseIslandAward(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseGetIslandAward = null;
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         response = new CResponseGetIslandAward();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CResponseGetIslandAward failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GETISLANDAWARD_RESULT);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onRequestDistributeIslandAward(iUin:int, iMapID:int, iConsortiaID:int, iDesUin:int, iCount:int, iAwardInfo:Array) : Boolean
      {
         var request:CRequestDistributeIslandAward = null;
         var aryByte:ByteArray = null;
         var iLength:int = 0;
         var hallConn:a_2650 = null;
         request = new CRequestDistributeIslandAward();
         request.m_iUin = iUin;
         request.m_iMapID = iMapID;
         request.m_iConsortiaID = iConsortiaID;
         request.m_iDesUin = iDesUin;
         request.m_iCount = iCount;
         request.m_arrAwardInfo = iAwardInfo;
         aryByte = new ByteArray();
         request.encode(aryByte,iLength);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_DISTRIBUTE_ISLAND_AWARD,aryByte);
      }
      
      public function onResponseDistributeIslandAward(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseDistributeIslandAward = null;
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         response = new CResponseDistributeIslandAward();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CResponseDistributeIslandAward failed.");
            return;
         }
         dataEvent = new a_1778(EventType.DISTRIBUTEISLANDAWARD_RESULT);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onRequestStarPieceShopBuy(iUin:int, cardid:int) : Boolean
      {
         var request:CRequestStarPieceShopBuy = null;
         var aryByte:ByteArray = null;
         var iLength:int = 0;
         var hallConn:a_2650 = null;
         request = new CRequestStarPieceShopBuy();
         request.m_iUIN = iUin;
         request.m_iCardID = cardid;
         aryByte = new ByteArray();
         request.encode(aryByte,iLength);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_STARPIECESHOP,aryByte);
      }
      
      public function onResponseStarShopPieceBuy(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseStarPieceShopBuy = null;
         var dataEvent:StarPieceShopEvent = null;
         response = new CResponseStarPieceShopBuy();
         response.decode(protocalBuffer);
         dataEvent = new StarPieceShopEvent(EventType.STARPIECESHOP_RESPONSE);
         dataEvent.m_stResponseBuy = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onRequestScoreShop(iUin:int, itemid:int, shoptype:int, group:int) : Boolean
      {
         var request:CRequestScoreShop = null;
         var aryByte:ByteArray = null;
         var iLength:int = 0;
         var hallConn:a_2650 = null;
         request = new CRequestScoreShop();
         request.m_iUin = iUin;
         request.m_iItemID = itemid;
         request.m_iShopType = shoptype;
         request.m_iGroup = group;
         aryByte = new ByteArray();
         request.encode(aryByte,iLength);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_SCORESHOP,aryByte);
      }
      
      private function onResponseScoreShop(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseScoreShop = null;
         var dataEvent:ScoreShopEvent = null;
         response = new CResponseScoreShop();
         response.decode(protocalBuffer);
         dataEvent = new ScoreShopEvent(EventType.SCORESHOP_RESPONSE);
         dataEvent.m_stRepScoreShop = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onRequestScoreShopInfo(iUin:int) : Boolean
      {
         var request:CRequestScoreShopInfo = null;
         var aryByte:ByteArray = null;
         var iLength:int = 0;
         var hallConn:a_2650 = null;
         request = new CRequestScoreShopInfo();
         request.m_iUin = iUin;
         aryByte = new ByteArray();
         request.encode(aryByte,iLength);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_SCORESHOP_INFO,aryByte);
      }
      
      private function onResponseScoreShopInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseScoreShopInfo = null;
         var dataEvent:ScoreShopEvent = null;
         response = new CResponseScoreShopInfo();
         response.decode(protocalBuffer);
         dataEvent = new ScoreShopEvent(EventType.SCORESHOP_INFO_RESPONSE);
         dataEvent.m_stRspScoreShopInfo = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function get hallConnection() : a_2650
      {
         return a_2251.getInstance().a_2253();
      }
      
      private function TraceErrorInfo(msg:*, iResultID:int) : void
      {
         a_4657.getInstance().execute("OnShowResultIDInfo",this,iResultID);
         a_4648.a_4649(msg,"ErrorResultID = " + iResultID);
      }
      
      private function dispatchAurDataEvent(strEvent:String, oInfo:Object = null) : void
      {
         var dataEvent:a_1778 = null;
         dataEvent = new a_1778(strEvent);
         dataEvent.dataObject = oInfo;
         ActivityEventManagerFactory.getInstance().dispatchEvent(dataEvent);
      }
      
      private function onResponseGetRechargeActivityInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseGetPlayerRechargeActivityInfo = null;
         cResponseInfo = new CResponseGetPlayerRechargeActivityInfo();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseGetPlayerRechargeActivityInfo failed.");
            return;
         }
         if(0 == cResponseInfo.m_nResultID)
         {
            a_1767.getInstance().SystemTime = cResponseInfo.m_iSystemTimeStamp;
            a_2439.getInstance().RechargeActivityInfo = cResponseInfo;
            this.dispatchAurDataEvent(ActivityEventType.GET_RECHARGE_ACTIVITY_INFO);
         }
         else
         {
            this.TraceErrorInfo(csPackageHeader.shMessageID.toString(16),cResponseInfo.m_nResultID);
         }
      }
      
      public function onRequestGetRechargeActivityInfo(iUin:int) : Boolean
      {
         var cRequestInfo:CRequestGetPlayerRechargeActivityInfo = null;
         var iLength:int = 0;
         var arrByte:ByteArray = null;
         cRequestInfo = new CRequestGetPlayerRechargeActivityInfo();
         cRequestInfo.m_iUin = iUin;
         arrByte = new ByteArray();
         cRequestInfo.encode(arrByte,iLength);
         return pBaseProtocol.a_2201(this.hallConnection,b_154.MSG_HALL_GET_CHARGE_ACTIVITY_INFO,arrByte);
      }
      
      private function onResponseGetCumulativeRechargeActivityAward(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseCumulativeRechargeActivityGetAward = null;
         var strProperty:String = null;
         var iValue:int = 0;
         cResponseInfo = new CResponseCumulativeRechargeActivityGetAward();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseCumulativeRechargeActivityGetAward failed.");
            return;
         }
         if(0 == cResponseInfo.m_nResultID)
         {
            strProperty = "m_iFlagAccumulate";
            iValue = a_2439.getInstance().GetRechargeActivityInfo(strProperty);
            iValue |= 1 << cResponseInfo.m_iAwardID - 1;
            a_2439.getInstance().SetRechargeActivityInfo(strProperty,iValue);
            this.dispatchAurDataEvent(ActivityEventType.GET_CUMULATIVE_RECHARGE_ACTIVITY_AWARD,cResponseInfo.m_iAwardID);
         }
         else
         {
            this.TraceErrorInfo(csPackageHeader.shMessageID.toString(16),cResponseInfo.m_nResultID);
         }
      }
      
      public function onRequestGetCumulativeRechargeActivityAward(iUin:int, iPosID:int) : Boolean
      {
         var cRequestInfo:CRequestCumulativeRechargeActivityGetAward = null;
         var iLength:int = 0;
         var arrByte:ByteArray = null;
         cRequestInfo = new CRequestCumulativeRechargeActivityGetAward();
         cRequestInfo.m_iUin = iUin;
         cRequestInfo.m_iAwardID = iPosID;
         arrByte = new ByteArray();
         cRequestInfo.encode(arrByte,iLength);
         return pBaseProtocol.a_2201(this.hallConnection,b_154.MSG_HALL_GET_CUMULATIVE_RECHARGE_AWARD,arrByte);
      }
      
      private function onResponseGetFirstRechargeActivityAward(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseFirstRechargeActivityGetAward = null;
         var strProperty:String = null;
         var iValue:int = 0;
         cResponseInfo = new CResponseFirstRechargeActivityGetAward();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseFirstRechargeActivityGetAward failed.");
            return;
         }
         if(0 == cResponseInfo.m_nResultID)
         {
            strProperty = "m_iFlagFirst";
            iValue = a_2439.getInstance().GetRechargeActivityInfo(strProperty);
            iValue |= 1 << cResponseInfo.m_iAwardID - 1;
            a_2439.getInstance().SetRechargeActivityInfo(strProperty,iValue);
            this.dispatchAurDataEvent(ActivityEventType.GET_FIRST_RECHARGE_ACTIVITY_AWARD,cResponseInfo.m_iAwardID);
         }
         else
         {
            this.TraceErrorInfo(csPackageHeader.shMessageID.toString(16),cResponseInfo.m_nResultID);
         }
      }
      
      public function onRequestGetFirstRechargeActivityAward(iUin:int, iPosID:int) : Boolean
      {
         var cRequestInfo:CRequestFirstRechargeActivityGetAward = null;
         var iLength:int = 0;
         var arrByte:ByteArray = null;
         cRequestInfo = new CRequestFirstRechargeActivityGetAward();
         cRequestInfo.m_iUin = iUin;
         cRequestInfo.m_iAwardID = iPosID;
         arrByte = new ByteArray();
         cRequestInfo.encode(arrByte,iLength);
         return pBaseProtocol.a_2201(this.hallConnection,b_154.MSG_HALL_GET_FIRST_RECHARGE_AWARD,arrByte);
      }
      
      private function onResponseGetHolidayAccumulativeDiscountAward(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseHolidayAccumulativeGetAward = null;
         var strProperty:String = null;
         var iValue:int = 0;
         cResponseInfo = new CResponseHolidayAccumulativeGetAward();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseHolidayAccumulativeGetAward failed.");
            return;
         }
         if(0 == cResponseInfo.m_nResultID)
         {
            strProperty = "m_iHolidayMask";
            iValue = a_2439.getInstance().GetRechargeActivityInfo(strProperty);
            iValue |= 1 << cResponseInfo.m_iAwardID - 1;
            a_2439.getInstance().SetRechargeActivityInfo(strProperty,iValue);
            this.dispatchAurDataEvent(ActivityEventType.GET_HOLIDAY_ACCUMULATIVE_AWARD,cResponseInfo.m_iAwardID);
         }
         else
         {
            this.TraceErrorInfo(csPackageHeader.shMessageID.toString(16),cResponseInfo.m_nResultID);
         }
      }
      
      public function onRequestGetHolidayCumulativeDiscountAward(iUin:int, iPosID:int) : Boolean
      {
         var cRequestInfo:CRequestHolidayCumulativeDiscountGetAward = null;
         var iLength:int = 0;
         var arrByte:ByteArray = null;
         cRequestInfo = new CRequestHolidayCumulativeDiscountGetAward();
         cRequestInfo.m_iUin = iUin;
         cRequestInfo.m_iAwardID = iPosID;
         arrByte = new ByteArray();
         cRequestInfo.encode(arrByte,iLength);
         return pBaseProtocol.a_2201(this.hallConnection,b_154.MSG_HALL_GET_HOLIDAY_ACCUMULATE_AWARD,arrByte);
      }
      
      private function onResponseGetHolidaySingleDiscountAward(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseHolidaySingleGetAward = null;
         var strProperty:String = null;
         var vHolidaySingleReceieveNum:Vector.<int> = null;
         cResponseInfo = new CResponseHolidaySingleGetAward();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseHolidaySingleGetAward failed.");
            return;
         }
         if(0 == cResponseInfo.m_nResultID)
         {
            strProperty = "m_iHolidayMask";
            vHolidaySingleReceieveNum = a_2161.e.notifyData("GetRechargeActivityInfo","m_vHolidaySingleReceieveNum") as Vector.<int>;
            --vHolidaySingleReceieveNum[cResponseInfo.m_iAwardID - 1];
            this.dispatchAurDataEvent(ActivityEventType.GET_HOLIDAY_SINGLE_AWARD,cResponseInfo.m_iAwardID);
         }
         else
         {
            this.TraceErrorInfo(csPackageHeader.shMessageID.toString(16),cResponseInfo.m_nResultID);
         }
      }
      
      public function onRequestGetHolidaySingleDiscountAward(iUin:int, iPosID:int) : Boolean
      {
         var cRequestInfo:CRequestHolidaySingleDisountGetAward = null;
         var iLength:int = 0;
         var arrByte:ByteArray = null;
         cRequestInfo = new CRequestHolidaySingleDisountGetAward();
         cRequestInfo.m_iUin = iUin;
         cRequestInfo.m_iAwardID = iPosID;
         arrByte = new ByteArray();
         cRequestInfo.encode(arrByte,iLength);
         return pBaseProtocol.a_2201(this.hallConnection,b_154.MSG_HALL_GET_HOLIDAY_SINGLE_AWARD,arrByte);
      }
      
      public function onRequestGetHolidayExchangeInfo(iUin:int) : Boolean
      {
         var cRequestInfo:CRequestHolidayExchangeDisountInfo = null;
         var iLength:int = 0;
         var arrByte:ByteArray = null;
         cRequestInfo = new CRequestHolidayExchangeDisountInfo();
         cRequestInfo.m_iUin = iUin;
         arrByte = new ByteArray();
         cRequestInfo.encode(arrByte,iLength);
         return pBaseProtocol.a_2201(this.hallConnection,b_154.MSG_HALL_GET_HOLIDAY_EXCHANGE_INFO,arrByte);
      }
      
      public function onResponseGetHolidayExchangeInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseGetHolidayExchangeInfo = null;
         cResponseInfo = new CResponseGetHolidayExchangeInfo();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseGetHolidayExchangeInfo failed.");
            return;
         }
         if(0 == cResponseInfo.m_nResultID)
         {
            this.dispatchAurDataEvent(ActivityEventType.GET_HOLIDAY_EXCHANGE_INFO,cResponseInfo);
         }
         else
         {
            this.TraceErrorInfo(csPackageHeader.shMessageID.toString(16),cResponseInfo.m_nResultID);
            MessageTipHandler.Get().a_3146(cResponseInfo.m_nResultID.toString());
         }
      }
      
      public function onRequestGetHolidayExchangeDiscountAward(iUin:int, iPosID:int) : Boolean
      {
         var cRequestInfo:CRequestHolidayExchangeDisountGetAward = null;
         var iLength:int = 0;
         var arrByte:ByteArray = null;
         cRequestInfo = new CRequestHolidayExchangeDisountGetAward();
         cRequestInfo.m_iUin = iUin;
         cRequestInfo.m_iID = iPosID;
         arrByte = new ByteArray();
         cRequestInfo.encode(arrByte,iLength);
         return pBaseProtocol.a_2201(this.hallConnection,b_154.MSG_HALL_REQUEST_HOLIDAY_EXCHANGE,arrByte);
      }
      
      public function onResponseGetHolidayExchangeDiscountAward(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseHolidayExchangeDiscountAward = null;
         cResponseInfo = new CResponseHolidayExchangeDiscountAward();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseHolidayExchangeDiscountAward failed.");
            return;
         }
         if(0 == cResponseInfo.m_nResult)
         {
            this.dispatchAurDataEvent(ActivityEventType.GET_HOLIDAY_EXCHANGE_AWARD,cResponseInfo.m_iID);
         }
         else
         {
            this.TraceErrorInfo(csPackageHeader.shMessageID.toString(16),cResponseInfo.m_nResult);
            if(cResponseInfo.m_nResult == EnmExchange.result_id_holiday_exchange_not_found)
            {
               MessageTipHandler.Get().a_3146(GameStringManager.getInstance().getString(139908));
            }
            else if(cResponseInfo.m_nResult == EnmExchange.result_id_holiday_exchange_not_in_time)
            {
               MessageTipHandler.Get().a_3146(GameStringManager.getInstance().getString(139909));
            }
            else if(cResponseInfo.m_nResult == EnmExchange.result_id_holiday_exchange_check_count_fail)
            {
               MessageTipHandler.Get().a_3146(GameStringManager.getInstance().getString(139910));
            }
            else if(cResponseInfo.m_nResult == EnmExchange.result_id_holiday_exchange_count_error)
            {
               MessageTipHandler.Get().a_3146(GameStringManager.getInstance().getString(139911));
            }
            else if(cResponseInfo.m_nResult == EnmExchange.result_id_holiday_exchange_item_error)
            {
               MessageTipHandler.Get().a_3146(GameStringManager.getInstance().getString(139912));
            }
            else if(cResponseInfo.m_nResult == EnmExchange.result_id_holiday_deduct_money_error)
            {
               MessageTipHandler.Get().a_3146(GameStringManager.getInstance().getString(139913));
            }
         }
      }
      
      public function OnCRequestPlayerMailList(iUin:int) : Boolean
      {
         var aryByte:ByteArray = null;
         var request:CRequestPlayerMailList = null;
         var hallConn:a_2650 = null;
         aryByte = new ByteArray();
         request = new CRequestPlayerMailList();
         request.m_iUin = iUin;
         request.m_iGroupID = 0;
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_MAIL_LIST,aryByte);
      }
      
      public function OnCResponsePlayerMailList(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponsePlayerMailList = null;
         var stMailEvent:MailEvent = null;
         response = new CResponsePlayerMailList();
         response.decode(protocalBuffer,0);
         stMailEvent = new MailEvent(EventType.MAIL_LIST_RESPONSE);
         stMailEvent.data = response;
         a_1789.getInstance().dispatchEvent(stMailEvent);
      }
      
      public function OnCRequestSendMail(iUin:int, stMail:CMail) : Boolean
      {
         var aryByte:ByteArray = null;
         var request:CRequestSendMail = null;
         var hallConn:a_2650 = null;
         aryByte = new ByteArray();
         request = new CRequestSendMail();
         request.m_iUin = iUin;
         request.m_iGroupID = 0;
         request.m_stMail = stMail;
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_SEND_MAIL,aryByte);
      }
      
      public function OnCRequestDeleteMail(iUin:int, iMailIDHigh:int, iMailIDLow:int) : Boolean
      {
         var aryByte:ByteArray = null;
         var request:CRequestDeleteMail = null;
         var hallConn:a_2650 = null;
         aryByte = new ByteArray();
         request = new CRequestDeleteMail();
         request.m_iUin = iUin;
         request.m_iGroupID = 0;
         request.m_iMailIDHigh = iMailIDHigh;
         request.m_iMailIDLow = iMailIDLow;
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_DELETE_MAIL,aryByte);
      }
      
      public function OnCRequestReadMail(iUin:int, iMailIDHigh:int, iMailIDLow:int) : Boolean
      {
         var aryByte:ByteArray = null;
         var request:CRequestDeleteMail = null;
         var hallConn:a_2650 = null;
         aryByte = new ByteArray();
         request = new CRequestDeleteMail();
         request.m_iUin = iUin;
         request.m_iGroupID = 0;
         request.m_iMailIDHigh = iMailIDHigh;
         request.m_iMailIDLow = iMailIDLow;
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_READ_MAIL,aryByte);
      }
      
      public function OnCRequestFetchMailItem(iUin:int, iMailIDHigh:int, iMailIDLow:int) : Boolean
      {
         var aryByte:ByteArray = null;
         var request:CRequestDeleteMail = null;
         var hallConn:a_2650 = null;
         aryByte = new ByteArray();
         request = new CRequestDeleteMail();
         request.m_iUin = iUin;
         request.m_iGroupID = 0;
         request.m_iMailIDHigh = iMailIDHigh;
         request.m_iMailIDLow = iMailIDLow;
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_FETCH_MAIL_ITEM,aryByte);
      }
      
      public function OnCCSResponseMailOperation(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CCSResponseMailOperation = null;
         var stMailEvent:MailEvent = null;
         response = new CCSResponseMailOperation();
         response.decode(protocalBuffer,0);
         stMailEvent = new MailEvent(EventType.MAIL_OPERATE_RESPONSE);
         stMailEvent.data = response;
         a_1789.getInstance().dispatchEvent(stMailEvent);
      }
      
      private function OnCCSNotifyNewMail(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         a_2158.e.notifyMailTip(true);
      }
      
      public function OnCRequestUpdatePlayerMailList(iUin:int) : Boolean
      {
         var aryByte:ByteArray = null;
         var request:CRequestUpdatePlayerMailList = null;
         var hallConn:a_2650 = null;
         aryByte = new ByteArray();
         request = new CRequestUpdatePlayerMailList();
         request.m_iUin = iUin;
         request.m_iGroupID = 0;
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_UPDATE_MAIL_LIST,aryByte);
      }
      
      private function OnCResponseUpdatePlayerMailList(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseUpdatePlayerMailList = null;
         response = new CResponseUpdatePlayerMailList();
         response.decode(protocalBuffer,0);
         if(0 == response.m_iResultID && response.m_iUnRead > 0)
         {
            a_2158.e.notifyMailTip(true);
         }
      }
      
      public function OnCRequestBuyTradeItem(iUin:int, iTradeIDHigh:int, iTradeIDLow:int) : Boolean
      {
         var request:CRequestBuyTradeItem = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestBuyTradeItem();
         request.m_iUin = iUin;
         request.m_iTradeIDHigh = iTradeIDHigh;
         request.m_iTradeIDLow = iTradeIDLow;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_BUY_TRADE_ITEM,aryByte);
      }
      
      public function OnCRequestCancelTradeItem(iUin:int, iTradeIDHigh:int, iTradeIDLow:int) : Boolean
      {
         var request:CRequestCancelTradeItem = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestCancelTradeItem();
         request.m_iUin = iUin;
         request.m_iTradeIDHigh = iTradeIDHigh;
         request.m_iTradeIDLow = iTradeIDLow;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_CANCEL_TRADE,aryByte);
      }
      
      public function OnCRequestGetPlayerTradeItem(iUin:int, iType:int, iStartIndex:int, iEndIndex:int) : Boolean
      {
         var request:CRequestGetPlayerTradeItem = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestGetPlayerTradeItem();
         request.m_iUin = iUin;
         request.m_iType = iType;
         request.m_iStartIndex = iStartIndex;
         request.m_iEndIndex = iEndIndex;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GET_PLAYER_TRADE_ITEM,aryByte);
      }
      
      public function OnCRequestGetTradeItemList(iUin:int, iType:int, iStartIndex:int, iEndIndex:int) : Boolean
      {
         var request:CRequestGetTradeItemList = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestGetTradeItemList();
         request.m_iUin = iUin;
         request.m_iType = iType;
         request.m_iStartIndex = iStartIndex;
         request.m_iEndIndex = iEndIndex;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GET_TRADE_LIST,aryByte);
      }
      
      public function OnCCSRequestSearchTrade(iUin:int, iType:int, strItemName:String, iStartIndex:int, iEndIndex:int) : Boolean
      {
         var request:CCSRequestSearchTrade = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CCSRequestSearchTrade();
         request.m_iUin = iUin;
         request.m_iType = iType;
         request.m_iStartIndex = iStartIndex;
         request.m_iEndIndex = iEndIndex;
         request.m_szItemName = strItemName;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_SEARCH_TRADE,aryByte);
      }
      
      public function OnCRequestInsertTradeItem(iUin:int, stItem:CTradeItem) : Boolean
      {
         var request:CRequestInsertTradeItem = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestInsertTradeItem();
         request.m_iUin = iUin;
         request.m_stItem = stItem;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_INSERT_TRADE_ITEM,aryByte);
      }
      
      private function OnCResponseGetPlayerTradeItem(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseGetPlayerTradeItem = null;
         var stAuctionEvent:a_3192 = null;
         response = new CResponseGetPlayerTradeItem();
         response.decode(protocalBuffer,0);
         stAuctionEvent = new a_3192(EventType.AUCTION_GET_PLAYER_TRADE_ITEM_LIST);
         stAuctionEvent.data = response;
         a_1789.getInstance().dispatchEvent(stAuctionEvent);
      }
      
      private function OnCResponseGetTradeItemList(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseGetTradeItemList = null;
         var stAuctionEvent:a_3192 = null;
         response = new CResponseGetTradeItemList();
         response.decode(protocalBuffer,0);
         stAuctionEvent = new a_3192(EventType.AUCTION_GET_TRADE_ITEM_LIST);
         stAuctionEvent.data = response;
         a_1789.getInstance().dispatchEvent(stAuctionEvent);
      }
      
      private function OnCResponseSearchItem(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseSearchItem = null;
         var stAuctionEvent:a_3192 = null;
         response = new CResponseSearchItem();
         response.decode(protocalBuffer,0);
         stAuctionEvent = new a_3192(EventType.AUCTION_GET_TRADE_ITEM_LIST);
         stAuctionEvent.data = response;
         a_1789.getInstance().dispatchEvent(stAuctionEvent);
      }
      
      private function OnCCSResponseTradeOperation(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CCSResponseTradeOperation = null;
         var stAuctionEvent:a_3192 = null;
         response = new CCSResponseTradeOperation();
         response.decode(protocalBuffer,0);
         stAuctionEvent = new a_3192(EventType.AUCTION_OPERATE_RESPONSE);
         stAuctionEvent.data = response;
         a_1789.getInstance().dispatchEvent(stAuctionEvent);
      }
      
      public function onRequestGetPlayerMarriageInfo(iUin:int) : Boolean
      {
         var cRequestInfo:CRequestPlayerMarriageInfo = null;
         var iLength:int = 0;
         var arrByte:ByteArray = null;
         cRequestInfo = new CRequestPlayerMarriageInfo();
         cRequestInfo.m_iUin = iUin;
         arrByte = new ByteArray();
         cRequestInfo.encode(arrByte,iLength);
         return pBaseProtocol.a_2201(this.hallConnection,b_154.MSG_HALL_GET_PLAYER_MARRIAGE_INFO,arrByte);
      }
      
      private function OnResponseGetPlayerMarriageInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponsePlayerMarriageInfo = null;
         cResponseInfo = new CResponsePlayerMarriageInfo();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponsePlayerMarriageInfo failed.");
            return;
         }
         if(0 == cResponseInfo.m_nResultID)
         {
            a_2439.getInstance().MarriageInfo = cResponseInfo;
            this.dispatchAurDataEvent(ActivityEventType.GET_PLAYER_MARRIAGE_INFO);
         }
         else
         {
            this.TraceErrorInfo(csPackageHeader.shMessageID.toString(16),cResponseInfo.m_nResultID);
         }
      }
      
      public function onRequestMarriageCertificateOperation(iUin:int, iOperateType:int, arrValue:Array = null, strInfo:String = "") : Boolean
      {
         var cRequestInfo:CRequestMarriageCertificateOperation = null;
         var iLength:int = 0;
         var arrByte:ByteArray = null;
         if(null == arrValue)
         {
            arrValue = [];
         }
         cRequestInfo = new CRequestMarriageCertificateOperation();
         cRequestInfo.m_iUin = iUin;
         cRequestInfo.m_iOperateType = iOperateType;
         cRequestInfo.m_arrValue = arrValue;
         cRequestInfo.m_strInfo = strInfo;
         arrByte = new ByteArray();
         cRequestInfo.encode(arrByte,iLength);
         return pBaseProtocol.a_2201(this.hallConnection,b_154.MSG_HALL_MARRIAGE_CERTIFICATE_OPERATION,arrByte);
      }
      
      private function OnResponseMarriageCertificateOperation(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseMarriageCertificateOperation = null;
         cResponseInfo = new CResponseMarriageCertificateOperation();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseMarriageCertificateOperation failed.");
            return;
         }
         if(0 == cResponseInfo.m_nResultID)
         {
            a_4657.getInstance().execute("OnMarriageCertificateOperationHandle",this,cResponseInfo.SerializationInfo);
            this.dispatchAurDataEvent(ActivityEventType.MARRIAGE_CERTIFICATE_OPERATION,cResponseInfo.SerializationInfo);
         }
         else
         {
            this.TraceErrorInfo(csPackageHeader.shMessageID.toString(16),cResponseInfo.m_nResultID);
         }
      }
      
      public function onRequestGetWeddingList(iUin:int, iStartPos:int, iRequestNum:int) : Boolean
      {
         var cRequestInfo:CRequestGetWeddingList = null;
         var iLength:int = 0;
         var arrByte:ByteArray = null;
         cRequestInfo = new CRequestGetWeddingList();
         cRequestInfo.m_iUin = iUin;
         cRequestInfo.m_iStartPos = iStartPos;
         cRequestInfo.m_iRequestNum = iRequestNum;
         arrByte = new ByteArray();
         cRequestInfo.encode(arrByte,iLength);
         return pBaseProtocol.a_2201(this.hallConnection,b_154.MSG_HALL_GET_WEDDING_LIST,arrByte);
      }
      
      private function OnResponseGetWeddingList(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseGetWeddingList = null;
         cResponseInfo = new CResponseGetWeddingList();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseGetWeddingList failed.");
            return;
         }
         if(0 == cResponseInfo.m_nResultID)
         {
            this.dispatchAurDataEvent(ActivityEventType.RESPONSE_GET_WEDDING_LIST,cResponseInfo);
         }
         else
         {
            this.TraceErrorInfo(csPackageHeader.shMessageID.toString(16),cResponseInfo.m_nResultID);
         }
      }
      
      public function onRequestReserveWedding(iUin:int, iStartTimeStamp:int, iWeddingLevel:int, iDressType:int, iIsHasPassword:int, strPassword:String, strDeclaration:String) : Boolean
      {
         var cRequestInfo:CRequestReserveWedding = null;
         var iLength:int = 0;
         var arrByte:ByteArray = null;
         cRequestInfo = new CRequestReserveWedding();
         cRequestInfo.m_iUin = iUin;
         cRequestInfo.m_iStartTimeStamp = iStartTimeStamp;
         cRequestInfo.m_iWeddingLevel = iWeddingLevel;
         cRequestInfo.m_iDressType = iDressType;
         cRequestInfo.m_iIsHasPassword = iIsHasPassword;
         cRequestInfo.m_strPassword = strPassword;
         cRequestInfo.m_strDeclaration = strDeclaration;
         arrByte = new ByteArray();
         cRequestInfo.encode(arrByte,iLength);
         return pBaseProtocol.a_2201(this.hallConnection,b_154.MSG_HALL_RESERVE_WEDDING,arrByte);
      }
      
      private function OnResponseReserveWedding(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseReserveWedding = null;
         cResponseInfo = new CResponseReserveWedding();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseReserveWedding failed.");
            return;
         }
         if(0 == cResponseInfo.m_nResultID)
         {
            this.dispatchAurDataEvent(ActivityEventType.RESPONSE_RESERVE_WEDDING);
         }
         else
         {
            this.TraceErrorInfo(csPackageHeader.shMessageID.toString(16),cResponseInfo.m_nResultID);
         }
      }
      
      public function OnRequestChangeWeddingDescription(iUin:int, strDeclaration:String) : Boolean
      {
         var cRequestInfo:CRequestChangeWeddingDescription = null;
         var iLength:int = 0;
         var arrByte:ByteArray = null;
         cRequestInfo = new CRequestChangeWeddingDescription();
         cRequestInfo.m_iUin = iUin;
         cRequestInfo.m_strDeclaration = strDeclaration;
         arrByte = new ByteArray();
         cRequestInfo.encode(arrByte,iLength);
         return pBaseProtocol.a_2201(this.hallConnection,b_154.MSG_HALL_CHANGE_WEDDING_DECLARATION,arrByte);
      }
      
      private function OnResponseChangeWeddingDeclaration(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseChangeWeddingDescription = null;
         cResponseInfo = new CResponseChangeWeddingDescription();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseChangeWeddingDescription failed.");
            return;
         }
         if(0 == cResponseInfo.m_nResultID)
         {
            this.dispatchAurDataEvent(ActivityEventType.RESPONSE_CHANGE_WEDDING_DECLARATION);
         }
         else
         {
            this.TraceErrorInfo(csPackageHeader.shMessageID.toString(16),cResponseInfo.m_nResultID);
         }
      }
      
      public function OnRequestOngoingWeddingCount(iUin:int) : Boolean
      {
         var cRequestInfo:CRequestOngoingWeddingCount = null;
         var iLength:int = 0;
         var arrByte:ByteArray = null;
         cRequestInfo = new CRequestOngoingWeddingCount();
         cRequestInfo.m_iUin = iUin;
         arrByte = new ByteArray();
         cRequestInfo.encode(arrByte,iLength);
         return pBaseProtocol.a_2201(this.hallConnection,b_154.MSG_HALL_GET_ONGOING_WEDDING_COUNT,arrByte);
      }
      
      private function OnResponseOngoingWeddingCount(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseOngoingWeddingCount = null;
         cResponseInfo = new CResponseOngoingWeddingCount();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseOngoingWeddingCount failed.");
            return;
         }
         if(0 == cResponseInfo.m_nResultID)
         {
            a_4657.getInstance().execute("OnUpdateGoingWeddingCount",this,cResponseInfo.m_iWeddingCnt);
         }
         else
         {
            this.TraceErrorInfo(csPackageHeader.shMessageID.toString(16),cResponseInfo.m_nResultID);
         }
      }
      
      public function OnRequestWeddingRoomOperate(iUin:int, iOperateType:int, arrValue:Array = null, strInfo:String = "") : Boolean
      {
         var cRequestInfo:CRequestWeddingRoomOperate = null;
         var iLength:int = 0;
         var arrByte:ByteArray = null;
         if(null == arrValue)
         {
            arrValue = [];
         }
         cRequestInfo = new CRequestWeddingRoomOperate();
         cRequestInfo.m_iUin = iUin;
         cRequestInfo.m_iOperateType = iOperateType;
         cRequestInfo.m_arrValue = arrValue;
         cRequestInfo.m_strInfo = strInfo;
         arrByte = new ByteArray();
         cRequestInfo.encode(arrByte,iLength);
         return pBaseProtocol.a_2201(this.hallConnection,b_154.MSG_HALL_WEDDING_ROOM_OPERATION,arrByte);
      }
      
      private function OnResponseWeddingRoomOperate(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseWeddingRoomOperate = null;
         cResponseInfo = new CResponseWeddingRoomOperate();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseWeddingRoomOperate failed.");
            return;
         }
         if(0 == cResponseInfo.m_nResultID)
         {
            a_4657.getInstance().execute("OnWeddingRoomOperationHandle",this,cResponseInfo.SerializationInfo);
            this.dispatchAurDataEvent(ActivityEventType.WEDDING_ROOM_OPERATION,cResponseInfo.SerializationInfo);
         }
         else
         {
            this.TraceErrorInfo(csPackageHeader.shMessageID.toString(16),cResponseInfo.m_nResultID);
         }
      }
      
      public function OnRequestGetInWeddingRoom(iUin:int, iRoomID:int, strPassword:String = "") : Boolean
      {
         var cRequestInfo:CRequestGetInWeddingRoom = null;
         var iLength:int = 0;
         var arrByte:ByteArray = null;
         cRequestInfo = new CRequestGetInWeddingRoom();
         cRequestInfo.m_iUin = iUin;
         cRequestInfo.m_iRoomID = iRoomID;
         cRequestInfo.m_strPassword = strPassword;
         arrByte = new ByteArray();
         cRequestInfo.encode(arrByte,iLength);
         return pBaseProtocol.a_2201(this.hallConnection,b_154.MSG_HALL_WEDDING_GET_IN_ROOM,arrByte);
      }
      
      private function OnResponseGetInWeddingRoom(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseWeddingRoomInfo = null;
         cResponseInfo = new CResponseWeddingRoomInfo();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseWeddingRoomInfo failed.");
            return;
         }
         if(0 == cResponseInfo.m_nResultID)
         {
            a_4657.getInstance().execute("OnGetInWeddingRoomHandle",this,cResponseInfo);
         }
         else
         {
            this.TraceErrorInfo(csPackageHeader.shMessageID.toString(16),cResponseInfo.m_nResultID);
         }
      }
      
      private function OnResponsePlayerGetInWeddingRoom(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponsePlayerGetInWeddingRoom = null;
         cResponseInfo = new CResponsePlayerGetInWeddingRoom();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponsePlayerGetInWeddingRoom failed.");
            return;
         }
         if(0 == cResponseInfo.m_nResultID)
         {
            this.dispatchAurDataEvent(ActivityEventType.GET_IN_WEDDING_ROOM_PLAYER_INFO,cResponseInfo.m_stPlayer);
         }
         else
         {
            this.TraceErrorInfo(csPackageHeader.shMessageID.toString(16),cResponseInfo.m_nResultID);
         }
      }
      
      private function OnResponseGetWeddingRoomWelfare(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseGetWeddingRoomWelfare = null;
         cResponseInfo = new CResponseGetWeddingRoomWelfare();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseGetWeddingRoomWelfare failed.");
            return;
         }
         if(0 == cResponseInfo.m_nResultID)
         {
            this.dispatchAurDataEvent(ActivityEventType.GET_WEDDING_ROOM_WELFARE,cResponseInfo);
         }
         else
         {
            this.TraceErrorInfo(csPackageHeader.shMessageID.toString(16),cResponseInfo.m_nResultID);
         }
      }
      
      public function OnCRequestNewSvrGiftLogin(iUin:int) : Boolean
      {
         var request:CRequestNewSvrGiftLogin = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestNewSvrGiftLogin();
         request.m_iUin = iUin;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_NEW_SVR_GIFT_LOGIN,aryByte);
      }
      
      public function OnCResponseNewSvrGiftLogin(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseNewSvrGiftLogin = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseNewSvrGiftLogin();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseNewSvrGiftLogin failed.");
            return;
         }
         dataEvent = new a_1778(EventType.CHECK_NEW_SVR_GIFT);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCCSRequestNewsvrGiftReceieve(iUin:int, iID:int) : Boolean
      {
         var request:CCSRequestNewsvrGiftReceieve = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CCSRequestNewsvrGiftReceieve();
         request.m_iUin = iUin;
         request.m_iID = iID;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_NEW_SVR_GIFT_RECEIEVE,aryByte);
      }
      
      public function OnCSCResponseNewscrGiftReceieve(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CSCResponseNewscrGiftReceieve = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CSCResponseNewscrGiftReceieve();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CSCResponseNewscrGiftReceieve failed.");
            return;
         }
         dataEvent = new a_1778(EventType.RECEIEVE_NEW_SVR_GIFT);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestCheckNewServerTask(iUin:int, iAdd:int) : Boolean
      {
         var request:CRequestCheckNewServerTask = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestCheckNewServerTask();
         request.m_iUin = iUin;
         request.m_iAdd = iAdd;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_CHECK_NEW_SVR_TASK,aryByte);
      }
      
      private function OnResponseCheckNewServerTask(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseCheckNewServerTask = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseCheckNewServerTask();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseCheckNewServerTask failed.");
            return;
         }
         dataEvent = new a_1778(EventType.CHECK_NEW_SVR_TASK);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestGetNewConsortiaTaskList(iUin:int, iType:int) : Boolean
      {
         var request:CRequestGetNewConsortiaTaskList = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestGetNewConsortiaTaskList();
         request.m_iUin = iUin;
         request.m_iType = iType;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GET_NEW_TASK_LIST,aryByte);
      }
      
      public function OnCRequestCompleteNewConsortiaTask(iUin:int, iUniqueID:int) : Boolean
      {
         var request:CRequestCompleteNewConsortiaTask = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestCompleteNewConsortiaTask();
         request.m_iUin = iUin;
         request.m_iUniqueID = iUniqueID;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_COMPLETE_NEW_TASK,aryByte);
      }
      
      public function OnCRequestPublishNewConsortiaTask(iUin:int) : Boolean
      {
         var request:CRequestPublishNewConsortiaTask = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestPublishNewConsortiaTask();
         request.m_iUin = iUin;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_PUBLISH_CONSORTIA_MASTER_TASK,aryByte);
      }
      
      public function OnCRequestCheckNewConsortiaTask(iUin:int) : Boolean
      {
         var request:CRequestCheckNewConsortiaTask = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestCheckNewConsortiaTask();
         request.m_iUin = iUin;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_CHECK_NEW_TASK,aryByte);
      }
      
      private function OnResponseGetNewConsortiaTaskList(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseGetNewConsortiaTaskList = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseGetNewConsortiaTaskList();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseGetNewConsortiaTaskList failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GET_NEW_CONSORTIA_TASK_LIST);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function OnResponsePublishNewConsortiaTask(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponsePublishNewConsortiaTask = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponsePublishNewConsortiaTask();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode OnResponsePublishNewConsortiaTask failed.");
            return;
         }
         dataEvent = new a_1778(EventType.RANK_AND_PUBLISH_CONSORTIA_TASK);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function OnResponseCompleteNewConsortiaTask(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseCompleteNewConsortiaTask = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseCompleteNewConsortiaTask();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseCompleteNewConsortiaTask failed.");
            return;
         }
         dataEvent = new a_1778(EventType.COMPLETE_NEW_CONSORTIA_TASK);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function OnResponseCompleteConsortiaTask(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseCompleteConsortiaTask = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseCompleteConsortiaTask();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseCompleteConsortiaTask failed.");
            return;
         }
         dataEvent = new a_1778(EventType.COMPLETE_CONSORTIA_TASK);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onRequestGetPopularityInfo(iUin:int) : Boolean
      {
         var cRequestInfo:CRequestGetPlayerRechargeActivityInfo = null;
         var iLength:int = 0;
         var arrByte:ByteArray = null;
         cRequestInfo = new CRequestGetPlayerRechargeActivityInfo();
         cRequestInfo.m_iUin = iUin;
         arrByte = new ByteArray();
         cRequestInfo.encode(arrByte,iLength);
         return pBaseProtocol.a_2201(this.hallConnection,b_154.MSG_HALL_GET_POPULARITY_INFO,arrByte);
      }
      
      public function onResponseGetPopularityInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponsePopularityInfo = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponsePopularityInfo();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseGetPlayerRechargeActivityInfo failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GET_POPULARITY_INFO);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onCRequstePopularityAward(iUin:int, m_iLevel:*, m_iYearExp:*) : Boolean
      {
         var cRequestInfo:CRequstePopularityAward = null;
         var arrByte:ByteArray = null;
         cRequestInfo = new CRequstePopularityAward();
         cRequestInfo.m_iUin = iUin;
         cRequestInfo.m_iLevel = m_iLevel;
         cRequestInfo.m_iYearExp = m_iYearExp;
         arrByte = new ByteArray();
         cRequestInfo.encode(arrByte,0);
         return pBaseProtocol.a_2201(this.hallConnection,b_154.MSG_HALL_AWARD_POPULARITY,arrByte);
      }
      
      public function onCResponsePopularityAward(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponsePopularityAward = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponsePopularityAward();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseGetPlayerRechargeActivityInfo failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GET_POPULARITY_AWARD_BACK);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onCNotifyPopularityTaskComplete(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CNotifyPopularityTaskComplete = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CNotifyPopularityTaskComplete();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseGetPlayerRechargeActivityInfo failed.");
            return;
         }
         dataEvent = new a_1778(EventType.NOTIFY_POPULARITY_TASK_COMPLETE);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestFoodContestTaskList(iUin:int, iType:int) : Boolean
      {
         var request:CRequestFoodContestTaskList = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestFoodContestTaskList();
         request.m_iUin = iUin;
         request.m_iType = iType;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GET_FOOD_CONTEST_LIST,aryByte);
      }
      
      private function OnCResponseGetFoodContestTaskList(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseGetFoodContestTaskList = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseGetFoodContestTaskList();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseGetFoodContestTaskList failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GET_MEISHI_MATCH_TASK_LIST);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCResponseFoodContestTaskComplete(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseFoodContestTaskComplete = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseFoodContestTaskComplete();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseFoodContestTaskComplete failed.");
            return;
         }
         dataEvent = new a_1778(EventType.COMPLETE_MEISHI_MATCH_TASK);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestFoodContestAward(data:Object) : Boolean
      {
         var request:CRequestFoodContestAward = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestFoodContestAward();
         request.m_iUin = data.m_iUin;
         request.m_iType = data.m_iType;
         request.m_iExp = data.m_iExp;
         request.m_iItemID = data.m_iItemID;
         request.m_iID = data.m_iID;
         request.m_iUniqueID = data.m_iUniqueID;
         request.m_iAddExp = data.m_iAddExp;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GET_FOOD_CONTEST_AWARD,aryByte);
      }
      
      public function OnCResponseFoodContestAward(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseFoodContestAward = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseFoodContestAward();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseFoodContestTaskComplete failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GET_MATCH_TASK_AWARD_BACK);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestFoodContestCookerGod(iUin:int, iType:int, iPrice:int) : Boolean
      {
         var request:CRequestFoodContestCookerGod = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestFoodContestCookerGod();
         request.m_iUin = iUin;
         request.m_iType = iType;
         request.m_iPrice = iPrice;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_ACTIVATING_COOKER_GOD_AWARD,aryByte);
      }
      
      public function OnCResponseFoodContestCookerGod(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseFoodContestCookerGod = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseFoodContestCookerGod();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseFoodContestTaskComplete failed.");
            return;
         }
         dataEvent = new a_1778(EventType.ACTIVE_COOKERGOD_BACK);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestFoodBuyExp(data:Object) : Boolean
      {
         var request:CRequestFoodBuyExp = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestFoodBuyExp();
         request.m_iUin = data.m_iUin;
         request.m_iCurLevel = data.m_iCurLevel;
         request.m_iTargetLevel = data.m_iTargetLevel;
         request.m_iAddExp = data.m_iAddExp;
         request.m_iPrice = data.m_iPrice;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_BUY_FOOD_EXP,aryByte);
      }
      
      public function OnCResponseFoodBuyExp(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseFoodBuyExp = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseFoodBuyExp();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseFoodContestTaskComplete failed.");
            return;
         }
         dataEvent = new a_1778(EventType.BUY_FOOD_EXP_BACK);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestExploreCampTaskList(iUin:int, iType:int) : Boolean
      {
         var request:CRequestFoodContestTaskList = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestFoodContestTaskList();
         request.m_iUin = iUin;
         request.m_iType = iType;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GET_CAMP_LIST,aryByte);
      }
      
      private function OnCResponseExploreCampTaskList(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseGetFoodContestTaskList = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseGetFoodContestTaskList();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseGetFoodContestTaskList failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GET_CAMP_TASK_LIST);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCResponseExploreCampTaskComplete(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseFoodContestTaskComplete = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseFoodContestTaskComplete();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseFoodContestTaskComplete failed.");
            return;
         }
         dataEvent = new a_1778(EventType.NOTIFY_CAMP_TASK_COMPLETE);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestExploreCampAward(data:Object) : Boolean
      {
         var request:CRequestFoodContestAward = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestFoodContestAward();
         request.m_iUin = data.m_iUin;
         request.m_iType = data.m_iType;
         request.m_iExp = data.m_iExp;
         request.m_iItemID = data.m_iItemID;
         request.m_iID = data.m_iID;
         request.m_iUniqueID = data.m_iUniqueID;
         request.m_iAddExp = data.m_iAddExp;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GET_CAMP_AWARD,aryByte);
      }
      
      public function OnCResponseExploreCampAward(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseFoodContestAward = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseFoodContestAward();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseFoodContestTaskComplete failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GET_CAMP_AWARD_BACK);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestGetLoverInfo(iUin:int) : Boolean
      {
         var request:CRequestGetLoverInfo = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestGetLoverInfo();
         request.m_iUin = iUin;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GET_SWEET_INFO,aryByte);
      }
      
      private function OnResponseGetLoverInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseGetLoverInfo = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseGetLoverInfo();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseGetLoverInfo failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GET_LOVER_INFO);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestGetLoverAward(iUin:int, m_iLevel:int) : Boolean
      {
         var request:CRequestGetLoverAward = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestGetLoverAward();
         request.m_iUin = iUin;
         request.m_iLevel = m_iLevel;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GET_SWEET_AWARD,aryByte);
      }
      
      private function OnResponseGetLoverAward(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseGetLoverAward = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseGetLoverAward();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseGetLoverAward failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GET_LOVER_AWARD);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestGetProtectorInfo(iUin:int) : Boolean
      {
         var request:CRequestGetProtectorInfo = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestGetProtectorInfo();
         request.m_iUin = iUin;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GET_LOVE_BUFF_INFO,aryByte);
      }
      
      private function OnResponseGetProtectorInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseGetProtectorInfo = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseGetProtectorInfo();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseGetProtectorInfo failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GET_PROTECTOR_INFO);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCCSRequestReportPlayer(iUin:int, iOpponentUin:int, iType:int) : Boolean
      {
         var request:CCSRequestReportPlayer = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CCSRequestReportPlayer();
         request.m_iUin = iUin;
         request.m_iOpponentUin = iOpponentUin;
         request.m_iType = iType;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_REQUEST_REPORT_PLAYER,aryByte);
      }
      
      private function OnCCSResponseReportPlayer(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var stResponse:CCSResponseReportPlayer = null;
         var dataEvent:CommonEvent = null;
         stResponse = new CCSResponseReportPlayer();
         if(stResponse.decode(protocalBuffer,iDecodeLength))
         {
         }
         dataEvent = new CommonEvent(EventType.REPORT_PLAYER);
         dataEvent.Data = stResponse;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestGetMonthCardInfo(iUin:int) : Boolean
      {
         var request:CRequestGetMonthCardInfo = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestGetMonthCardInfo();
         request.m_iUin = iUin;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GET_MONTH_CARD_INFO,aryByte);
      }
      
      private function OnResponseGetMonthCardInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseGetMonthCardInfo = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseGetMonthCardInfo();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseGetMonthCardInfo failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GET_MONTH_CARD_INFO);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestBuyMonthCard(iUin:int, iType:*) : Boolean
      {
         var request:CRequestGetMonthCardInfo = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestGetMonthCardInfo();
         request.m_iUin = iUin;
         request.m_iType = iType;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_BUY_MONTH_CARD,aryByte);
      }
      
      private function OnResponseBuyMonthCard(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseGetMonthCardInfo = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseGetMonthCardInfo();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseGetMonthCardInfo failed.");
            return;
         }
         dataEvent = new a_1778(EventType.BUY_MONTH_CARD);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestGetMonthAward(iUin:int) : Boolean
      {
         var request:CRequestGetMonthCardInfo = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestGetMonthCardInfo();
         request.m_iUin = iUin;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GET_MONTH_CARD_AWARD,aryByte);
      }
      
      private function OnResponseGetMonthAward(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseGetMonthCardInfo = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseGetMonthCardInfo();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseGetMonthCardInfo failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GET_MONTH_CARD_AWARD);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestGetMonthCardShopInfo(iUin:int) : Boolean
      {
         var request:CRequestMonthCardShopInfo = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestMonthCardShopInfo();
         request.m_iUin = iUin;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_MONTHCARD_INFO,aryByte);
      }
      
      private function OnResponseGetMonthCardShopInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseMonthCardShopInfo = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseMonthCardShopInfo();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseGetMonthCardInfo failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GET_MONTH_CARD_SHOP_INFO);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestRefreshMonthCardShop(iUin:int) : Boolean
      {
         var request:CRequestRefreshMonthCardShop = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestRefreshMonthCardShop();
         request.m_iUin = iUin;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_MONTHCARD_SHOP_REFRESH,aryByte);
      }
      
      private function OnResponseRefreshMonthCardShop(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseMonthCardShopInfo = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseMonthCardShopInfo();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseGetMonthCardInfo failed.");
            return;
         }
         dataEvent = new a_1778(EventType.REFRESH_MONTH_CARD_SHOP);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestBuyMonthCardItem(iUin:int, iID:int) : Boolean
      {
         var request:CRequestMonShopBuy = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestMonShopBuy();
         request.m_iUin = iUin;
         request.m_iID = iID;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_MONTHCARD_SHOP_BUY,aryByte);
      }
      
      private function OnResponseBuyMonthCardItem(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseMonShopBuy = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseMonShopBuy();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseGetMonthCardInfo failed.");
            return;
         }
         dataEvent = new a_1778(EventType.BUY_MONTH_CARD_SHOP_ITEM);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestGetNewYearLoginGiftInfo(iUin:int) : Boolean
      {
         var request:CRequestGetNewYearLoginGiftInfo = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestGetNewYearLoginGiftInfo();
         request.m_iUin = iUin;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_NEW_YEAR_LOGIN_GIFT_INFO,aryByte);
      }
      
      private function OnResponseGetNewYearLoginGiftInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseGetNewYearLoginGiftInfo = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseGetNewYearLoginGiftInfo();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseGetNewYearLoginGiftInfo failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GET_NEW_YEAR_GIFT_INFO);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestNewYearLoginGift(iUin:int, iType:int, iKey:int) : Boolean
      {
         var request:CRequestNewYearLoginGift = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestNewYearLoginGift();
         request.m_iUin = iUin;
         request.m_iType = iType;
         request.m_iKey = iKey;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GET_NEW_YEAR_LOGIN_GIFT,aryByte);
      }
      
      private function OnResponseNewYearLoginGift(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseNewYearLoginGift = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseNewYearLoginGift();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseNewYearLoginGift failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GET_NEW_YEAR_GIFT);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestGetNewYearLuckyMoneyInfo(iUin:int) : Boolean
      {
         var request:CRequestGetNewYearLuckyMoneyInfo = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestGetNewYearLuckyMoneyInfo();
         request.m_iUin = iUin;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_NEW_YEAR_LUCKY_MONEY_INFO,aryByte);
      }
      
      private function OnResponseGetNewYearLuckyMoneyInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseGetNewYearLuckyMoneyInfo = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseGetNewYearLuckyMoneyInfo();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseGetNewYearLuckyMoneyInfo failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GET_NEW_YEAR_RED_INFO);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestNewYearLuckyMoney(iUin:int) : Boolean
      {
         var request:CRequestNewYearLuckyMoney = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestNewYearLuckyMoney();
         request.m_iUin = iUin;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_NEW_YEAR_LUCKY_MONEY_GET,aryByte);
      }
      
      private function OnResponseNewYearLuckyMoney(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseNewYearLuckyMoney = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseNewYearLuckyMoney();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseNewYearLuckyMoney failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GET_NEW_YEAR_RED);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestGetNewYearTurnTableInfo(iUin:int) : Boolean
      {
         var request:CRequestGetNewYearTurnTableInfo = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestGetNewYearTurnTableInfo();
         request.m_iUin = iUin;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GET_TURNTABLE_INFO,aryByte);
      }
      
      private function OnResponseGetNewYearTurnTableInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseGetNewYearTurnTableInfo = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseGetNewYearTurnTableInfo();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseGetNewYearTurnTableInfo failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GET_NEW_YEAR_TURN_TABLE_INFO);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestNewYearTurnTable(iUin:int, iCount:int) : Boolean
      {
         var request:CRequestNewYearTurnTable = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestNewYearTurnTable();
         request.m_iUin = iUin;
         request.m_iCount = iCount;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_PLAY_TURNTABLE,aryByte);
      }
      
      private function OnResponseNewYearTurnTable(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseNewYearTurnTable = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseNewYearTurnTable();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseNewYearTurnTable failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GET_NEW_YEAR_TURN_TABLE);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestGardenInfo(iUin:int, iConsID:int) : Boolean
      {
         var request:CRequestGardenInfo = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestGardenInfo();
         request.m_iUin = iUin;
         request.m_iConsID = iConsID;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GARDEN_INFO,aryByte);
      }
      
      private function OnCResponseGardenInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseGardenInfo = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseGardenInfo();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseGardenInfo failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GET_GARDEN_INFO);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestGardenList(iUin:int, iConsID:int, iFrom:int, iNum:int) : Boolean
      {
         var request:CRequestGardenList = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestGardenList();
         request.m_iUin = iUin;
         request.m_iSelfConsID = iConsID;
         request.m_iFrom = iFrom;
         request.m_iNum = iNum;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GARDEN_LIST,aryByte);
      }
      
      private function OnCResponseGardenList(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseGardenList = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseGardenList();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseGardenList failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GET_GARDEN_LIST);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestGardenSow(iUin:int, iConsID:int, iTreeType:int) : Boolean
      {
         var request:CRequestGardenSow = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestGardenSow();
         request.m_iUin = iUin;
         request.m_iConsID = iConsID;
         request.m_iTreeType = iTreeType;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GARDEN_SOW,aryByte);
      }
      
      private function OnCResponseGardenSow(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseGardenSow = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseGardenSow();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseGardenSow failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GET_GARDEN_SOW);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestGardenOptInfo(iUin:int, iConsID:int, iFrom:int, iNum:int) : Boolean
      {
         var request:CRequestGardenOptInfo = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestGardenOptInfo();
         request.m_iUin = iUin;
         request.m_iConsID = iConsID;
         request.m_iFrom = iFrom;
         request.m_iNum = iNum;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GARDEN_OPT_INFO,aryByte);
      }
      
      private function OnCResponseGardenOptInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseGardenOptInfo = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseGardenOptInfo();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseGardenOptInfo failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GET_GARDEN_OPT_INFO);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestGardenWater(iUin:int, iConsID:int) : Boolean
      {
         var request:CRequestGardenWater = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestGardenWater();
         request.m_iUin = iUin;
         request.m_iConsID = iConsID;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GARDEN_WATER,aryByte);
      }
      
      private function OnCResponseGardenWater(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseGardenWater = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseGardenWater();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseGardenWater failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GET_GARDEN_WATER);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestGardenManure(iUin:int, iConsID:int) : Boolean
      {
         var request:CRequestGardenWater = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestGardenWater();
         request.m_iUin = iUin;
         request.m_iConsID = iConsID;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GARDEN_MANURE,aryByte);
      }
      
      private function OnCResponseGardenManure(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseGardenWater = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseGardenWater();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseGardenWater failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GET_GARDEN_FERTILIZE);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestGardenPick(iUin:int, iConsID:int) : Boolean
      {
         var request:CRequestGardenWater = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestGardenWater();
         request.m_iUin = iUin;
         request.m_iConsID = iConsID;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GARDEN_PICK,aryByte);
      }
      
      private function OnCResponseGardenPick(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseGardenPick = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseGardenPick();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseGardenPick failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GET_GARDEN_PICK);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestSweetIslandInfo(iUin:int) : Boolean
      {
         var request:CRequestSweetIslandInfo = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestSweetIslandInfo();
         request.m_iUin = iUin;
         aryByte = new ByteArray();
         request.encode(aryByte);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_SWEET_ISLAND_INFO,aryByte);
      }
      
      public function OnCCRequestSweetIslandOpen(iUin:int) : Boolean
      {
         var request:CCRequestSweetIslandOpen = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CCRequestSweetIslandOpen();
         request.m_iUin = iUin;
         aryByte = new ByteArray();
         request.encode(aryByte);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_SWEET_ISLAND_OPEN,aryByte);
      }
      
      private function OnCResponseSweetIslandInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var stResponse:CResponseSweetIslandInfo = null;
         var dataEvent:CommonEvent = null;
         stResponse = new CResponseSweetIslandInfo();
         if(!stResponse.decode(protocalBuffer))
         {
            trace("Error: Decode CResponseNewYearTurnTable failed.");
            return;
         }
         dataEvent = new CommonEvent(EventType.SWEET_ISLAND_INFO);
         dataEvent.Data = stResponse;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function OnCResponseSweetIslandOpen(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var stResponse:CResponseSweetIslandOpen = null;
         var dataEvent:CommonEvent = null;
         stResponse = new CResponseSweetIslandOpen();
         if(!stResponse.decode(protocalBuffer))
         {
            trace("Error: Decode CResponseNewYearTurnTable failed.");
            return;
         }
         dataEvent = new CommonEvent(EventType.SWEET_ISLAND_OPEN);
         dataEvent.Data = stResponse;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCResponseAnimalsCall(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseAnimalsCall = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseAnimalsCall();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseAnimalsCall failed.");
            return;
         }
         dataEvent = new a_1778(EventType.ANIMALS_CALL);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCResponseAnimalsSummonRecord(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseAnimalsSummonRecordGet = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseAnimalsSummonRecordGet();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseAnimalsSummonRecordGet failed.");
            return;
         }
         dataEvent = new a_1778(EventType.ANIMALS_CARD_CALL_INFO);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCResponseAnimalsExchange(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseAnimalsExchange = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseAnimalsExchange();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseAnimalsExchange failed.");
            return;
         }
         dataEvent = new a_1778(EventType.ANIMALS_CARD_EXCHANGE);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCResponseAnimalsDecompose(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseAnimalsDecompose = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseAnimalsDecompose();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseAnimalsDecompose failed.");
            return;
         }
         dataEvent = new a_1778(EventType.ANIMALS_CARD_DECOMPOSE);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCResponseAnimalsCoin(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseAnimalsCoinGet = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseAnimalsCoinGet();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseAnimalsCoinGet failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GET_ANIMALS_COIN);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestAnimalsCoinGet(iUin:int) : Boolean
      {
         var request:CRequestAnimalsCoinGet = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestAnimalsCoinGet();
         request.m_iUin = iUin;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GET_ANIMALS_COIN,aryByte);
      }
      
      public function OnCRequestAnimalsDecompose(iUin:int, iItemID:int, iCardSeq:int) : Boolean
      {
         var request:CRequestAnimalsDecompose = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestAnimalsDecompose();
         request.m_iUin = iUin;
         request.m_iItemID = iItemID;
         request.m_iCardSeq = iCardSeq;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_ANIMALS_CARD_DECOMPOSE,aryByte);
      }
      
      public function OnCRequestAnimalsExchange(iUin:int, iItemID:int) : Boolean
      {
         var request:CRequestAnimalsExchange = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestAnimalsExchange();
         request.m_iUin = iUin;
         request.m_iItemID = iItemID;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_ANIMALS_CARD_EXCHANGE,aryByte);
      }
      
      public function OnCRequestAnimalsSummonRecordGet(iUin:int, iGroup:int) : Boolean
      {
         var request:CRequestAnimalsSummonRecordGet = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestAnimalsSummonRecordGet();
         request.m_iUin = iUin;
         request.m_iGroup = iGroup;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_ANIMALS_CARD_CALL_INFO,aryByte);
      }
      
      public function OnCRequestAnimalsCall(iUin:int, iSetID:int, iCallID:int) : Boolean
      {
         var request:CRequestAnimalsCall = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestAnimalsCall();
         request.m_iUin = iUin;
         request.m_iSetID = iSetID;
         request.m_iCallID = iCallID;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_ANIMALS_CALL,aryByte);
      }
      
      public function OnCResponseLimitStore(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseBuyLimitItem = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseBuyLimitItem();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseBuyLimitItem failed.");
            return;
         }
         dataEvent = new a_1778(EventType.BUY_LIMIT_ITEM);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCResponseLimitStoreCount(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseQueryLimitItem = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseQueryLimitItem();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseQueryLimitItem failed.");
            return;
         }
         dataEvent = new a_1778(EventType.QUERY_LIMIT_ITEM);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestLimitStore(iUin:int, iType:int, iItemID:int) : Boolean
      {
         var request:CRequestBuyLimitItem = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestBuyLimitItem();
         request.m_iUin = iUin;
         request.m_iType = iType;
         request.m_iItemID = iItemID;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_LIMIT_SHOP,aryByte);
      }
      
      public function OnCRequestLimitStoreCount(iUin:int) : Boolean
      {
         var request:CRequestQueryLimitItem = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestQueryLimitItem();
         request.m_iUin = iUin;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_LIMIT_SHOP_COUNT,aryByte);
      }
      
      public function OnCRequestExploreStoreCount(iUin:int) : Boolean
      {
         var request:CRequestQueryLimitItem = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestQueryLimitItem();
         request.m_iUin = iUin;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GET_CAMP_SHOP,aryByte);
      }
      
      public function OnCResponseExploreStoreCount(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseExploreStoreInfo = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseExploreStoreInfo();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseQueryLimitItem failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GET_EXPLORESTORE_INFO);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestExploreStoreShop(iUin:int, iItemID:int, iCount:int) : Boolean
      {
         var request:CRequestBuyExploreStore = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestBuyExploreStore();
         request.m_iUin = iUin;
         request.m_iItemID = iItemID;
         request.m_iCount = iCount;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_LIMIT_CAMP_SHOP,aryByte);
      }
      
      public function OnCResponseExploreStoreShop(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseBuyLimitItem = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseBuyLimitItem();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseBuyLimitItem failed.");
            return;
         }
         dataEvent = new a_1778(EventType.BUY_EXPLORESTORE_BACK);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestExploreDiaryInfo(iUin:int) : Boolean
      {
         var request:CRequestQueryLimitItem = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestQueryLimitItem();
         request.m_iUin = iUin;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_GET_CAMP_RECORD,aryByte);
      }
      
      public function OnCResponseExploreDiaryInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseExploreDiaryInfo = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseExploreDiaryInfo();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseBuyLimitItem failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GET_EXPLOREDIARY_INFO);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestUpdateDiaryState(iUin:int, iType:int, iItemID:int) : Boolean
      {
         var request:CRequestUpdateDiaryState = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestUpdateDiaryState();
         request.m_iUin = iUin;
         request.m_iType = iType;
         request.m_iItemID = iItemID;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_UPDATE_DIAR_SATE,aryByte);
      }
      
      public function OnCResponseUpdateDiaryState(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseUpdateDiaryState = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseUpdateDiaryState();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseBuyLimitItem failed.");
            return;
         }
         dataEvent = new a_1778(EventType.UPDATE_DIARY_STATE);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestConsbenGet(iUin:int, m_iConsID:int) : Boolean
      {
         var request:CRequestConsbenGet = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestConsbenGet();
         request.m_iUin = iUin;
         request.m_iConsID = m_iConsID;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_CONSBEN_INFO,aryByte);
      }
      
      public function OnCResponseConsbenGet(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseConsbenGet = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseConsbenGet();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseConsbenGet failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GET_CARBEN_INFO);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestConsbenUpdate(iUin:int, iItemID:int, iNum:int) : Boolean
      {
         var request:CRequestConsbenUpdate = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestConsbenUpdate();
         request.m_iUin = iUin;
         request.m_iItemID = iItemID;
         request.m_iNum = iNum;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_DONATE_CONSBEN_PIECE,aryByte);
      }
      
      public function OnCResponseConsbenUpdate(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseConsbenUpdate = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseConsbenUpdate();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseConsbenUpdate failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GET_SUBMIT_PIECE_INFO);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestConsbenPlayerRank(iUin:int, m_iConsID:int, m_iBenID:int, m_iFrom:int, m_iNum:int) : Boolean
      {
         var request:CRequestConsbenPlayerRank = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestConsbenPlayerRank();
         request.m_iUin = iUin;
         request.m_iConsID = m_iConsID;
         request.m_iBenID = m_iBenID;
         request.m_iFrom = m_iFrom;
         request.m_iNum = m_iNum;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_CONSBEN_PLAYER_RANK,aryByte);
      }
      
      public function OnCResponseConsbenPlayerRank(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseConsbenPlayerRank = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseConsbenPlayerRank();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseConsbenPlayerRank failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GET_CARBEN_PLAYER_RANK_INFO);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestConsbenConsRank(iUin:int, m_iBenID:int, m_iFrom:int, m_iNum:int) : Boolean
      {
         var request:CRequestConsbenConsRank = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestConsbenConsRank();
         request.m_iUin = iUin;
         request.m_iBenID = m_iBenID;
         request.m_iFrom = m_iFrom;
         request.m_iNum = m_iNum;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_CONSBEN_CONS_RANK,aryByte);
      }
      
      public function OnCResponseConsbenConsRank(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseConsbenConsRank = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseConsbenConsRank();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseConsbenConsRank failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GET_CARBEN_CONSORTIA_RANK_INFO);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function RequestLimitRewardInfo(iUin:int) : Boolean
      {
         var request:CCSRequestLimitRewardInfo = null;
         var aryByte:ByteArray = null;
         var iLength:int = 0;
         var hallConn:a_2650 = null;
         request = new CCSRequestLimitRewardInfo();
         request.m_iUin = iUin;
         aryByte = new ByteArray();
         request.encode(aryByte,iLength);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_LIMIT_REWARD_INFO,aryByte);
      }
      
      public function RequestLimitReward(iUin:int, iID:int) : Boolean
      {
         var request:CCSRequestZhencang = null;
         var aryByte:ByteArray = null;
         var iLength:int = 0;
         var hallConn:a_2650 = null;
         request = new CCSRequestZhencang();
         request.m_iUin = iUin;
         request.m_iAwardID = iID;
         aryByte = new ByteArray();
         request.encode(aryByte,iLength);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_LIMIT_REWARD,aryByte);
      }
      
      private function OnCResponseGetAccCost(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseGetAccCost = null;
         var dataEvent:CommonEvent = null;
         response = new CResponseGetAccCost();
         response.decode(protocalBuffer,0);
         dataEvent = new CommonEvent(EventType.LIMIT_REWARD_INFO);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function onCCSResponseZhencang(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CCSResponseZhencang = null;
         var dataEvent:CommonEvent = null;
         response = new CCSResponseZhencang();
         response.decode(protocalBuffer,0);
         dataEvent = new CommonEvent(EventType.LIMIT_REWARD_REQUEST);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onRequestTarotGet(iUin:int, iType:int, iBox:int) : Boolean
      {
         var request:CRequestTarot = null;
         var aryByte:ByteArray = null;
         var iLength:int = 0;
         var hallConn:a_2650 = null;
         request = new CRequestTarot();
         request.m_iUIN = iUin;
         request.m_iType = iType;
         request.m_iBox = iBox;
         aryByte = new ByteArray();
         request.encode(aryByte,iLength);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_PLAY_TAROT,aryByte);
      }
      
      public function onRequestTarotInfo(iUin:int) : Boolean
      {
         var request:CRequestTarotInfo = null;
         var aryByte:ByteArray = null;
         var iLength:int = 0;
         var hallConn:a_2650 = null;
         request = new CRequestTarotInfo();
         request.m_iUin = iUin;
         aryByte = new ByteArray();
         request.encode(aryByte,iLength);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_TAROT_INFO,aryByte);
      }
      
      public function onRequestTarotAward(iUin:int, awardid:int) : Boolean
      {
         var request:CRequestTarotAward = null;
         var aryByte:ByteArray = null;
         var iLength:int = 0;
         var hallConn:a_2650 = null;
         request = new CRequestTarotAward();
         request.m_iUin = iUin;
         request.awardid = awardid;
         aryByte = new ByteArray();
         request.encode(aryByte,iLength);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_TAROT_AWARD,aryByte);
      }
      
      public function onResponseTarotGet(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseTarot = null;
         var dataEvent:a_1778 = null;
         response = new CResponseTarot();
         response.decode(protocalBuffer);
         dataEvent = new a_1778(EventType.GET_TAROT);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onResponseTarotInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseTarotInfo = null;
         var dataEvent:a_1778 = null;
         response = new CResponseTarotInfo();
         response.decode(protocalBuffer);
         dataEvent = new a_1778(EventType.GET_TAROT_INFO);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onResponseTarotAward(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseTarotAward = null;
         var dataEvent:a_1778 = null;
         response = new CResponseTarotAward();
         response.decode(protocalBuffer);
         dataEvent = new a_1778(EventType.GET_TAROT_AWARD);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onRequestCrystoneSlotGet(iUin:int) : Boolean
      {
         var request:CRequestGetCrystoneSlot = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestGetCrystoneSlot();
         request.m_iUin = iUin;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_CRYSTONE_SLOT_GET,aryByte);
      }
      
      public function onResponseCrystoneSlotGet(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseGetCrystoneSlot = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseGetCrystoneSlot();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseGetCrystoneSlot failed.");
            return;
         }
         dataEvent = new a_1778(EventType.GET_LOVER_RECIPE_SLOT);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onRequestCrystoneSlotAdd(iUin:int) : Boolean
      {
         var request:CRequestAddCrystoneSlot = null;
         var aryByte:ByteArray = null;
         var hallConn:a_2650 = null;
         request = new CRequestAddCrystoneSlot();
         request.m_iUin = iUin;
         aryByte = new ByteArray();
         request.encode(aryByte,0);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_CRYSTONE_SLOT_ADD,aryByte);
      }
      
      public function onResponseCrystoneSlotAdd(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iDecodeLength:int = 0;
         var cResponseInfo:CResponseAddCrystoneSlot = null;
         var dataEvent:a_1778 = null;
         cResponseInfo = new CResponseAddCrystoneSlot();
         if(!cResponseInfo.decode(protocalBuffer,iDecodeLength))
         {
            trace("Error: Decode CResponseAddCrystoneSlot failed.");
            return;
         }
         dataEvent = new a_1778(EventType.ADD_LOVER_RECIPE_SLOT);
         dataEvent.dataObject = cResponseInfo;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnRequestBuyCrossDropCount(iUin:int) : Boolean
      {
         var request:CCSRequestBuyCrossDropCount = null;
         var aryByte:ByteArray = null;
         var iLength:int = 0;
         var hallConn:a_2650 = null;
         request = new CCSRequestBuyCrossDropCount();
         request.m_iUin = iUin;
         aryByte = new ByteArray();
         request.encode(aryByte,iLength);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_BUY_CROSS_DROP_COUNT,aryByte);
      }
      
      private function OnResponseBuyCrossDropCount(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CCSResponseBuyCrossDropCount = null;
         var dataEvent:CommonEvent = null;
         response = new CCSResponseBuyCrossDropCount();
         response.decode(protocalBuffer,0);
         dataEvent = new CommonEvent(EventType.CROSS_BUY_DROP_COUNT);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onRequestPrizedraw(iUin:int, iType:int, iBox:int, iFree:int) : Boolean
      {
         var request:CRequestOnePiece = null;
         var aryByte:ByteArray = null;
         var iLength:int = 0;
         var hallConn:a_2650 = null;
         request = new CRequestOnePiece();
         request.m_iUin = iUin;
         request.m_iDrawType = iType;
         request.m_iBox = iBox;
         request.m_iFree = iFree;
         aryByte = new ByteArray();
         request.encode(aryByte,iLength);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_PRIZE_DRAW,aryByte);
      }
      
      public function onRequestPrizeDrawInfo(iUin:int, iType:int) : Boolean
      {
         var request:CRequestOnePieceInfo = null;
         var aryByte:ByteArray = null;
         var iLength:int = 0;
         var hallConn:a_2650 = null;
         request = new CRequestOnePieceInfo();
         request.m_iUin = iUin;
         request.m_iType = iType;
         aryByte = new ByteArray();
         request.encode(aryByte,iLength);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_PRIZE_DRAW_INFO,aryByte);
      }
      
      public function onRequestPrizeDrawAward(iUin:int, iType:int, iID:int) : Boolean
      {
         var request:CRequestOnePieceAward = null;
         var aryByte:ByteArray = null;
         var iLength:int = 0;
         var hallConn:a_2650 = null;
         request = new CRequestOnePieceAward();
         request.m_iUin = iUin;
         request.m_iType = iType;
         request.m_iID = iID;
         aryByte = new ByteArray();
         request.encode(aryByte,iLength);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_PRIZE_DRAW_AWARD,aryByte);
      }
      
      public function onRequestPrizedrawBuffInfo(iUin:int, iType:int) : Boolean
      {
         var request:CRequestOnePieceInfo = null;
         var aryByte:ByteArray = null;
         var iLength:int = 0;
         var hallConn:a_2650 = null;
         request = new CRequestOnePieceInfo();
         request.m_iUin = iUin;
         request.m_iType = iType;
         aryByte = new ByteArray();
         request.encode(aryByte,iLength);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_PRIZE_DRAW_BUFF_INFO,aryByte);
      }
      
      public function onRequestPrizedrawDecompose(iUin:int, iType:int, iID:int, iSeq:*) : Boolean
      {
         var request:CRequestOnePieceDecompose = null;
         var aryByte:ByteArray = null;
         var iLength:int = 0;
         var hallConn:a_2650 = null;
         request = new CRequestOnePieceDecompose();
         request.m_iUin = iUin;
         request.m_iType = iType;
         request.m_iID = iID;
         request.m_iSeq = iSeq;
         aryByte = new ByteArray();
         request.encode(aryByte,iLength);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_PRIZE_DRAW_DECOMPOSE,aryByte);
      }
      
      public function onRequestPrizedrawChangeBuff(iUin:int, iType:int) : Boolean
      {
         var request:CRequestOnePieceInfo = null;
         var aryByte:ByteArray = null;
         var iLength:int = 0;
         var hallConn:a_2650 = null;
         request = new CRequestOnePieceInfo();
         request.m_iUin = iUin;
         request.m_iType = iType;
         aryByte = new ByteArray();
         request.encode(aryByte,iLength);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_PRIZE_DRAW_CHANGE_BUFF,aryByte);
      }
      
      public function onResponsePrizedraw(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseOnePiece = null;
         var dataEvent:a_1778 = null;
         response = new CResponseOnePiece();
         response.decode(protocalBuffer);
         dataEvent = new a_1778(EventType.GET_ONEPIECE);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onResponsePrizedrawInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseOnePieceInfo = null;
         var dataEvent:a_1778 = null;
         response = new CResponseOnePieceInfo();
         response.decode(protocalBuffer);
         dataEvent = new a_1778(EventType.GET_ONEPIECE_INFO);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onResponsePrizedrawAward(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseOnePieceAward = null;
         var dataEvent:a_1778 = null;
         response = new CResponseOnePieceAward();
         response.decode(protocalBuffer);
         dataEvent = new a_1778(EventType.GET_ONEPIECE_AWARD);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onResponsePrizedrawBuffInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseOnePieceBuff = null;
         var dataEvent:a_1778 = null;
         response = new CResponseOnePieceBuff();
         response.decode(protocalBuffer);
         dataEvent = new a_1778(EventType.GET_ONEPIECE_BUFF_INFO);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onResponsePrizedrawChangeBuff(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseOnePieceBuff = null;
         var dataEvent:a_1778 = null;
         response = new CResponseOnePieceBuff();
         response.decode(protocalBuffer);
         dataEvent = new a_1778(EventType.GET_ONEPIECE_CHANGE_BUFF);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onResponsePrizedrawDecompose(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseOnePieceDecompose = null;
         var dataEvent:a_1778 = null;
         response = new CResponseOnePieceDecompose();
         response.decode(protocalBuffer);
         dataEvent = new a_1778(EventType.GET_ONEPIECE_DECOMPOSE);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onRequestEvolutionCard(iTabID:int, iUin:int, iCardID:int, arrItems:Array) : Boolean
      {
         var rst:Boolean = false;
         var iCostGemLv:int = 0;
         rst = false;
         this.m_iTabID = iTabID;
         switch(iTabID)
         {
            case OnePieceConfig.COMPOSE_TAB_GOLDCARD:
               rst = this.onRequestEvolutionGoldCard(iUin,iCardID,arrItems);
               break;
            case OnePieceConfig.COMPOSE_TAB_ARTIFACT:
               rst = this.onRequestEvolutionArtifact(iUin,iCardID,arrItems);
               break;
            case OnePieceConfig.COMPOSE_TAB_GEM:
               iCostGemLv = arrItems.shift();
               rst = this.onRequestEvolutionGem(iUin,iCardID,arrItems,iCostGemLv);
         }
         return rst;
      }
      
      private function onRequestEvolutionGoldCard(iUin:int, iCardID:int, arrItems:Array) : Boolean
      {
         var request:CRequestEvolution = null;
         var i:int = 0;
         var aryByte:ByteArray = null;
         var iLength:int = 0;
         var hallConn:a_2650 = null;
         var obj:Object = null;
         request = new CRequestEvolution();
         request.m_iUin = iUin;
         request.m_iCardID = iCardID;
         request.m_iItemCount = arrItems.length;
         for(i = 0; i < request.m_iItemCount; i++)
         {
            obj = {};
            obj.m_iItemID = arrItems[i].m_iItemID;
            obj.m_iItemSeq = arrItems[i].m_iItemSeq;
            request.m_arrItems.push(obj);
         }
         aryByte = new ByteArray();
         request.encode(aryByte,iLength);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_EVOLUTION,aryByte);
      }
      
      public function onResponseEvolutionCard(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseEvolution = null;
         var dataEvent:a_1778 = null;
         response = new CResponseEvolution();
         response.decode(protocalBuffer);
         dataEvent = new a_1778(EventType.GET_GOLD_CARD_EVOLUTION == null ? "0x7800" : EventType.GET_GOLD_CARD_EVOLUTION);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function onRequestEvolutionArtifact(iUin:int, iCardID:int, arrItems:Array) : Boolean
      {
         var request:CRequestEvolutionArtifact = null;
         var i:int = 0;
         var aryByte:ByteArray = null;
         var iLength:int = 0;
         var hallConn:a_2650 = null;
         request = new CRequestEvolutionArtifact();
         request.m_iUin = iUin;
         request.m_iItemID = iCardID;
         request.m_iCostGemLv = -1;
         request.m_nDelCount = arrItems.length;
         request.m_vDelInfo.length = 0;
         for(i = 0; i < request.m_nDelCount; i++)
         {
            request.m_vDelInfo[i] = new DelItemInfo();
            request.m_vDelInfo[i].m_iDelID = arrItems[i].m_iItemID;
            request.m_vDelInfo[i].m_iDelSeq = arrItems[i].m_iItemSeq;
            request.m_vDelInfo[i].m_nDelCount = 1;
         }
         aryByte = new ByteArray();
         request.encode(aryByte,iLength);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_ITEM_EVOLUTION,aryByte);
      }
      
      private function onResponseEvolutionArtifact(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseEvolutionArtifact = null;
         var dataEvent:a_1778 = null;
         response = new CResponseEvolutionArtifact();
         response.decode(protocalBuffer);
         if(this.m_iTabID == OnePieceConfig.COMPOSE_TAB_ARTIFACT)
         {
            dataEvent = new a_1778(EventType.GET_ARTIFACT_EVOLUTION == null ? "0x7801" : EventType.GET_ARTIFACT_EVOLUTION);
            dataEvent.dataObject = response;
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
         else if(this.m_iTabID == OnePieceConfig.COMPOSE_TAB_GEM)
         {
            dataEvent = new a_1778(EventType.GET_GEM_EVOLUTION == null ? "0x7802" : EventType.GET_ARTIFACT_EVOLUTION);
            dataEvent.dataObject = response;
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
      }
      
      private function onRequestEvolutionGem(iUin:int, iCardID:int, arrItems:Array, CostGemLv:int) : Boolean
      {
         var request:CRequestEvolutionArtifact = null;
         var i:int = 0;
         var aryByte:ByteArray = null;
         var iLength:int = 0;
         var hallConn:a_2650 = null;
         request = new CRequestEvolutionArtifact();
         request.m_iUin = iUin;
         request.m_iItemID = iCardID;
         request.m_iCostGemLv = CostGemLv;
         request.m_nDelCount = arrItems.length;
         request.m_vDelInfo.length = 0;
         for(i = 0; i < request.m_nDelCount; i++)
         {
            request.m_vDelInfo[i] = new DelItemInfo();
            request.m_vDelInfo[i].m_iDelID = arrItems[i].m_iItemID;
            request.m_vDelInfo[i].m_iDelSeq = arrItems[i].m_iItemSeq;
            request.m_vDelInfo[i].m_nDelCount = 1;
         }
         aryByte = new ByteArray();
         request.encode(aryByte,iLength);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_ITEM_EVOLUTION,aryByte);
      }
      
      private function onResponseEvolutionGem(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
      }
      
      public function onRequestHasSecpwd(iUin:int) : Boolean
      {
         var request:CRequestHasSecpwd = null;
         var aryByte:ByteArray = null;
         var iLength:int = 0;
         var hallConn:a_2650 = null;
         request = new CRequestHasSecpwd();
         request.m_iUin = iUin;
         aryByte = new ByteArray();
         request.encode(aryByte,iLength);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_HAS_SECPWD,aryByte);
      }
      
      public function onResponseHasSecpwd(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseHasSecpwd = null;
         var dataEvent:a_1778 = null;
         response = new CResponseHasSecpwd();
         response.decode(protocalBuffer);
         dataEvent = new a_1778(EventType.HAS_SECPWD);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onRequestUpdateSecpwd(iUin:int, stOlePwd:String, stNewPwd:String) : Boolean
      {
         var request:CRequestSecPwdUpdate = null;
         var aryByte:ByteArray = null;
         var iLength:int = 0;
         var hallConn:a_2650 = null;
         request = new CRequestSecPwdUpdate();
         request.m_iUin = iUin;
         request.m_stOldSecPwd = stOlePwd;
         request.m_stNewSecPwd = stNewPwd;
         aryByte = new ByteArray();
         request.encode(aryByte,iLength);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_UPDATE_SECPWD,aryByte);
      }
      
      public function onResponseUpdateSecpwd(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseSecPwdUpdate = null;
         var dataEvent:a_1778 = null;
         response = new CResponseSecPwdUpdate();
         response.decode(protocalBuffer);
         dataEvent = new a_1778(EventType.UPDATE_SECPWD);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onResponseNeedSecpwd(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseNeedSecpwd = null;
         var dataEvent:a_1778 = null;
         response = new CResponseNeedSecpwd();
         response.decode(protocalBuffer);
         dataEvent = new a_1778(EventType.UNEED_SECPWD);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onRequestInputSecpwd(iUin:int, stSecpwd:String) : Boolean
      {
         var request:CRequestInputSecpwd = null;
         var aryByte:ByteArray = null;
         var iLength:int = 0;
         var hallConn:a_2650 = null;
         request = new CRequestInputSecpwd();
         request.m_iUin = iUin;
         request.m_stSecPwd = stSecpwd;
         aryByte = new ByteArray();
         request.encode(aryByte,iLength);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_INPUT_SECPWD,aryByte);
      }
      
      public function onResponseInputSecpwd(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseInputSecpwd = null;
         var dataEvent:a_1778 = null;
         response = new CResponseInputSecpwd();
         response.decode(protocalBuffer);
         dataEvent = new a_1778(EventType.INPUT_SECPWD);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onRequestMonopolyInfo(iUin:int) : Boolean
      {
         var request:CRequestMonopolyInfo = null;
         var aryByte:ByteArray = null;
         var iLength:int = 0;
         var hallConn:a_2650 = null;
         request = new CRequestMonopolyInfo();
         request.m_iUin = iUin;
         aryByte = new ByteArray();
         request.encode(aryByte,iLength);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_MONOPOLY_INFO,aryByte);
      }
      
      public function onRequestMonopolyPlay(iUin:int, iNumber:int) : Boolean
      {
         var request:CRequestMonopolyPlay = null;
         var aryByte:ByteArray = null;
         var iLength:int = 0;
         var hallConn:a_2650 = null;
         request = new CRequestMonopolyPlay();
         request.m_iUin = iUin;
         request.m_iNumber = iNumber;
         aryByte = new ByteArray();
         request.encode(aryByte,iLength);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_MONOPOLY_PLAY,aryByte);
      }
      
      public function onRequestMonopolyRankInfo(iUin:int) : Boolean
      {
         var request:CRequestMonopolyRankInfo = null;
         var aryByte:ByteArray = null;
         var iLength:int = 0;
         var hallConn:a_2650 = null;
         request = new CRequestMonopolyRankInfo();
         request.m_iUin = iUin;
         aryByte = new ByteArray();
         request.encode(aryByte,iLength);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_MONOPOLY_RANK_INFO,aryByte);
      }
      
      public function onRequestMonopolyRankAward(iUin:int) : Boolean
      {
         var request:CRequestMonopolyRankAward = null;
         var aryByte:ByteArray = null;
         var iLength:int = 0;
         var hallConn:a_2650 = null;
         request = new CRequestMonopolyRankAward();
         request.m_iUin = iUin;
         aryByte = new ByteArray();
         request.encode(aryByte,iLength);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_MONOPOLY_RANK_AWARD,aryByte);
      }
      
      public function OnResponseMonopolyInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseMonopolyInfo = null;
         var dataEvent:a_1778 = null;
         response = new CResponseMonopolyInfo();
         response.decode(protocalBuffer,0);
         dataEvent = new a_1778(EventType.MONOPOLY_INFO);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnResponseMonopolyPlay(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseMonopolyPlay = null;
         var dataEvent:a_1778 = null;
         response = new CResponseMonopolyPlay();
         response.decode(protocalBuffer,0);
         dataEvent = new a_1778(EventType.MONOPOLY_PLAY);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnResponseMonopolyRankInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseMonopolyRankInfo = null;
         var dataEvent:a_1778 = null;
         response = new CResponseMonopolyRankInfo();
         response.decode(protocalBuffer,0);
         dataEvent = new a_1778(EventType.MONOPOLY_RANK_INFO);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnResponseMonopolyRankAward(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseMonopolyRankAward = null;
         var dataEvent:a_1778 = null;
         response = new CResponseMonopolyRankAward();
         response.decode(protocalBuffer,0);
         dataEvent = new a_1778(EventType.MONOPOLY_RANK_AWARD);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onRequestHandbookInfo(iUin:int, iOptType:int, iType:int) : Boolean
      {
         var request:CRequestHandbookInfo = null;
         var aryByte:ByteArray = null;
         var iLength:int = 0;
         var hallConn:a_2650 = null;
         request = new CRequestHandbookInfo();
         request.m_iUin = iUin;
         request.m_iOperateType = iOptType;
         request.m_iType = iType;
         aryByte = new ByteArray();
         request.encode(aryByte,iLength);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_HANDBOOK,aryByte);
      }
      
      public function OnResponseHandbookAward(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseHandbookInfo = null;
         var dataEvent:a_1778 = null;
         response = new CResponseHandbookInfo();
         response.decode(protocalBuffer,0);
         dataEvent = new a_1778(EventType.HANDBOOK_AWARD);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onRequestGetTwoPataAward(iUin:int) : Boolean
      {
         var request:CRequestGetTwoPataCount = null;
         var aryByte:ByteArray = null;
         var iLength:int = 0;
         var hallConn:a_2650 = null;
         request = new CRequestGetTwoPataCount();
         request.m_iUin = iUin;
         aryByte = new ByteArray();
         request.encode(aryByte,iLength);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_GET_TWO_PATA_AWARD,aryByte);
      }
      
      public function OnResponseGetTwoPataAward(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseGetTwoPataAward = null;
         var dataEvent:a_1778 = null;
         response = new CResponseGetTwoPataAward();
         response.decode(protocalBuffer,0);
         dataEvent = new a_1778(EventType.GET_TWO_PATA_AWARD);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onRequestDailyPayAward(m_iUin:int, m_iID:int) : Boolean
      {
         var request:CRequestDailyPayAward = null;
         var aryByte:ByteArray = null;
         var iLength:int = 0;
         var hallConn:a_2650 = null;
         request = new CRequestDailyPayAward();
         request.m_iUin = m_iUin;
         request.m_iID = m_iID;
         aryByte = new ByteArray();
         request.encode(aryByte,iLength);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_DAILY_PAY_AWARD,aryByte);
      }
      
      public function onResponseDailyPayAward(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseDailyPayAward = null;
         var dataEvent:a_1778 = null;
         response = new CResponseDailyPayAward();
         response.decode(protocalBuffer,0);
         dataEvent = new a_1778(EventType.DAILYPAYAWARD);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onRequestDailyPayInfo(m_iUin:int) : Boolean
      {
         var request:CRequestDailyPayInfo = null;
         var aryByte:ByteArray = null;
         var iLength:int = 0;
         var hallConn:a_2650 = null;
         request = new CRequestDailyPayInfo();
         request.m_iUin = m_iUin;
         aryByte = new ByteArray();
         request.encode(aryByte,iLength);
         hallConn = a_2251.getInstance().a_2253();
         return pBaseProtocol.a_2201(hallConn,b_154.MSG_HALL_DAILY_PAY_INFO,aryByte);
      }
      
      public function onResponseDailyPayInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseDailyPayInfo = null;
         var dataEvent:a_1778 = null;
         response = new CResponseDailyPayInfo();
         response.decode(protocalBuffer,0);
         dataEvent = new a_1778(EventType.DAILYPAYINFO);
         dataEvent.dataObject = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
   }
}

