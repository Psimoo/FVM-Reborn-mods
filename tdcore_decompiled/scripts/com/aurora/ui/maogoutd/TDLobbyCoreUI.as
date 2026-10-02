package com.aurora.ui.maogoutd
{
   import a_4714.AssetType;
   import a_4714.AssetsItemData;
   import a_4714.AssetsLoadMode;
   import a_4714.AssetsLoader;
   import a_4716.EnmConsortia;
   import a_4716.EnmInviteType;
   import a_4716.EnmMessageResultID;
   import a_4716.EnmServerEntity;
   import a_4716.a_1730;
   import a_4716.a_1733;
   import a_4716.a_1739;
   import a_4716.a_1740;
   import a_4716.a_1764;
   import a_4720.EnmGameIM;
   import a_4720.a_1748;
   import a_4720.a_1749;
   import a_4720.a_1750;
   import a_4720.a_1752;
   import a_4720.a_1756;
   import a_4723.a_1767;
   import a_4728.a_1778;
   import a_4729.EventType;
   import a_4729.a_1789;
   import a_4731.AchievementsUpdateEvent;
   import a_4731.CommonEvent;
   import a_4731.ComposeSystemEvent;
   import a_4731.FriendSystemEvent;
   import a_4731.GameResultEvent;
   import a_4731.LevelUpEvent;
   import a_4731.LobbyEventManager;
   import a_4731.LocalTaskEvents;
   import a_4731.PlayerConsumeEvent;
   import a_4731.SendDalabaEvent;
   import a_4731.TaskShortcutEvent;
   import a_4731.TaskUpdateEvent;
   import a_4731.a_1790;
   import a_4731.a_1791;
   import a_4752.AnalyzeModeOpen;
   import a_4752.GameStringManager;
   import a_4752.GlobalVariables;
   import a_4752.IGameStringManager;
   import a_4752.MarriageConfig;
   import a_4752.ScoreShopAnalyze;
   import a_4752.SuperAwardAnalyze;
   import a_4752.WhiteListConfig;
   import a_4752.ZhencangAnalyze;
   import a_4752.a_2018;
   import a_4752.a_2020;
   import a_4752.a_2027;
   import a_4752.a_2033;
   import a_4752.a_2036;
   import a_4752.a_2037;
   import a_4752.a_2041;
   import a_4752.a_2044;
   import a_4752.a_2047;
   import a_4752.a_2048;
   import a_4752.a_2050;
   import a_4754.a_1825;
   import a_4754.a_2143;
   import a_4754.a_2144;
   import a_4754.a_2145;
   import a_4754.a_2150;
   import a_4754.a_2155;
   import a_4754.a_2156;
   import a_4754.a_2157;
   import a_4754.a_2158;
   import a_4754.a_2159;
   import a_4754.a_2160;
   import a_4754.a_2161;
   import a_4754.a_2169;
   import a_4754.a_2170;
   import a_4754.a_2171;
   import a_4754.a_2172;
   import a_4755.a_2175;
   import a_4763.a_2439;
   import a_4767.b_176;
   import a_4781.PhpTokenData;
   import a_4781.TimeoutManager;
   import a_4781.b_214;
   import a_4783.a_4643;
   import a_4784.SWFProfiler;
   import a_4788.LocalData;
   import a_4788.a_4648;
   import a_4788.a_4650;
   import a_4789.IModulesBridge;
   import a_4789.a_4657;
   import a_4797.a_4687;
   import com.adobe.crypto.MD5;
   import com.adobe.serialization.json.JSONDecoder;
   import com.aurora.event.activity.ActivityEventManagerFactory;
   import com.aurora.event.activity.ActivityEventType;
   import com.aurora.game.maogoutd.common.SystemMessage.AnalysisBattleBGXml;
   import com.aurora.game.maogoutd.common.SystemMessage.AnalysisSystemNoticeXml;
   import com.aurora.ui.common.animate.CommonAnimateManager;
   import com.aurora.ui.common.tips.CommonTipsTextManager;
   import com.aurora.ui.maogoutd.ClientLog.CheckIDHandler;
   import com.aurora.ui.maogoutd.ClientLog.MessageTipHandler;
   import com.aurora.ui.maogoutd.ClientLog.ReportHandler;
   import com.aurora.ui.maogoutd.ClientLog.SendCountInfoHandle;
   import com.aurora.ui.maogoutd.ClientLog.a_4807;
   import com.aurora.ui.maogoutd.ClientLog.a_4814;
   import com.aurora.ui.maogoutd.MeishiMatch.Data.AnalysisMeiShiMatchXml;
   import com.aurora.ui.maogoutd.MeishiMatch.Data.AnalysisSystemXml;
   import com.aurora.ui.maogoutd.PayAward.NewSvrGiftConfig;
   import com.aurora.ui.maogoutd.PayAward.PayAwardConfig;
   import com.aurora.ui.maogoutd.PayAward.RechargeActivityConfig;
   import com.aurora.ui.maogoutd.SummerExploreCamp.Control.AnalysisExplorelandXml;
   import com.aurora.ui.maogoutd.SummerExploreCamp.Control.ExploreDiaryConfig;
   import com.aurora.ui.maogoutd.SummerExploreCamp.Control.ExploreStoreConfig;
   import com.aurora.ui.maogoutd.ThunderCity.ThunderCityConfig;
   import com.aurora.ui.maogoutd.achievement.a_3168;
   import com.aurora.ui.maogoutd.actions.ActionNewActivityConfigXml;
   import com.aurora.ui.maogoutd.actions.MenuIconStruct;
   import com.aurora.ui.maogoutd.actions.a_3182;
   import com.aurora.ui.maogoutd.actions.a_3191;
   import com.aurora.ui.maogoutd.activityentrance.ActivityEntranceModel;
   import com.aurora.ui.maogoutd.birthdayActivity.AnalysisBirthdayActivityXml;
   import com.aurora.ui.maogoutd.bluediamond.BlueDiamondInfo;
   import com.aurora.ui.maogoutd.charmshop.CharmShopConfig;
   import com.aurora.ui.maogoutd.component.a_3228;
   import com.aurora.ui.maogoutd.component.a_3306;
   import com.aurora.ui.maogoutd.component.dialog.BuySureDialog;
   import com.aurora.ui.maogoutd.component.dialog.Dialog;
   import com.aurora.ui.maogoutd.component.dialog.ExplainDialogManager;
   import com.aurora.ui.maogoutd.component.dialog.IDialog;
   import com.aurora.ui.maogoutd.component.dialog.a_3251;
   import com.aurora.ui.maogoutd.component.tip.BuffTip;
   import com.aurora.ui.maogoutd.component.tip.CardTip;
   import com.aurora.ui.maogoutd.component.tip.ConsortiaEstablishmentPowerPanel;
   import com.aurora.ui.maogoutd.component.tip.DefCardTip;
   import com.aurora.ui.maogoutd.component.tip.DuanweiTip;
   import com.aurora.ui.maogoutd.component.tip.ExploreTaskTip;
   import com.aurora.ui.maogoutd.component.tip.ISendFlowerDialog;
   import com.aurora.ui.maogoutd.component.tip.IVsLevelTip;
   import com.aurora.ui.maogoutd.component.tip.IVsModeTip;
   import com.aurora.ui.maogoutd.component.tip.MouseTip;
   import com.aurora.ui.maogoutd.component.tip.UserAvatarTip;
   import com.aurora.ui.maogoutd.component.tip.a_3291;
   import com.aurora.ui.maogoutd.compose.ComposeConfig;
   import com.aurora.ui.maogoutd.compose.Fusion.CardFusionConfig;
   import com.aurora.ui.maogoutd.compose.crystal.CrystalHandler;
   import com.aurora.ui.maogoutd.compose.crystal.CrystalXML;
   import com.aurora.ui.maogoutd.compositemap.CompositeMapXML;
   import com.aurora.ui.maogoutd.consortia.a_3340;
   import com.aurora.ui.maogoutd.consortiatask.xml.ConsortiaTaskConfig;
   import com.aurora.ui.maogoutd.consortiaxml.ConsortiaActivityConfig;
   import com.aurora.ui.maogoutd.crossserver.CrossServerHandler;
   import com.aurora.ui.maogoutd.diy.DiyHandler;
   import com.aurora.ui.maogoutd.exchangeshop.xml.ExchangeShopConfig;
   import com.aurora.ui.maogoutd.feed.ConstFeed;
   import com.aurora.ui.maogoutd.game.CardUpgradeXML;
   import com.aurora.ui.maogoutd.handbook.controller.HandbookController;
   import com.aurora.ui.maogoutd.handbook.model.HandbookConfigData;
   import com.aurora.ui.maogoutd.iface.IBuyCardDialog;
   import com.aurora.ui.maogoutd.iface.IGameGiftBoxDialog;
   import com.aurora.ui.maogoutd.iface.IMenuOpen;
   import com.aurora.ui.maogoutd.iface.INotEnoughMoneyContent;
   import com.aurora.ui.maogoutd.iface.IRenewTipDialog;
   import com.aurora.ui.maogoutd.iface.ITDActionsUI;
   import com.aurora.ui.maogoutd.iface.ITDLoadDialog;
   import com.aurora.ui.maogoutd.iface.ITDMessageTip;
   import com.aurora.ui.maogoutd.iface.ITDServerList;
   import com.aurora.ui.maogoutd.iface.ITDVSMatchUI;
   import com.aurora.ui.maogoutd.iface.IUpAwardsDialog;
   import com.aurora.ui.maogoutd.im.IMUtil;
   import com.aurora.ui.maogoutd.inviteCommon.IInviteCommonUI;
   import com.aurora.ui.maogoutd.lobby.WorldRoamingXML;
   import com.aurora.ui.maogoutd.mail.MailHandler;
   import com.aurora.ui.maogoutd.marriage.DefineMarriageCertificateOperation;
   import com.aurora.ui.maogoutd.marriage.DefineMarriageInfo;
   import com.aurora.ui.maogoutd.mota.MiShiProtocal;
   import com.aurora.ui.maogoutd.mouse.a_3855;
   import com.aurora.ui.maogoutd.newguide.MeishiGuide;
   import com.aurora.ui.maogoutd.newguide.NewGuideConfig;
   import com.aurora.ui.maogoutd.newyearactivity.limit.LimitRewardXML;
   import com.aurora.ui.maogoutd.newyearactivity.xml.NewYearActivityConfig;
   import com.aurora.ui.maogoutd.onepiece.xml.OnePieceConfig;
   import com.aurora.ui.maogoutd.pag.CryAdditionXML;
   import com.aurora.ui.maogoutd.pag.RecipeXMLParser;
   import com.aurora.ui.maogoutd.pag.RecommandCardConfig;
   import com.aurora.ui.maogoutd.pag.StorageRoom.StorageBagConfig;
   import com.aurora.ui.maogoutd.pag.VerifyPackageSize;
   import com.aurora.ui.maogoutd.pag.a_3886;
   import com.aurora.ui.maogoutd.pet.PetConfig;
   import com.aurora.ui.maogoutd.pet.PetDataHandler;
   import com.aurora.ui.maogoutd.role.RoleWallow;
   import com.aurora.ui.maogoutd.role.a_4463;
   import com.aurora.ui.maogoutd.store.limit.xml.LimitStoreConfig;
   import com.aurora.ui.maogoutd.tarot.TarotConfig;
   import com.aurora.ui.maogoutd.task.a_4482;
   import com.aurora.ui.maogoutd.task.a_4514;
   import com.aurora.ui.maogoutd.task.a_4517;
   import com.aurora.ui.maogoutd.task.a_4524;
   import com.aurora.ui.maogoutd.town.ChannelItem;
   import com.aurora.ui.maogoutd.town.LoginEvent;
   import com.aurora.ui.maogoutd.verifyInGame.TDVerifyInGameUI;
   import com.aurora.ui.maogoutd.version.VersionMD5;
   import com.aurora.ui.maogoutd.viliant.ViliantData;
   import com.aurora.ui.maogoutd.vip.VipConfig;
   import com.aurora.ui.maogoutd.vow.VowConfig;
   import com.aurora.ui.maogoutd.weddingRoom.DefineWeddingRoomInfo;
   import com.aurora.ui.maogoutd.weddingRoom.DefineWeddingRoomOperation;
   import com.aurora.ui.maogoutd.weddingRoom.sweetLand.SweetIslandXml;
   import com.aurora.ui.maogoutd.worldBossLevel.AnalysisWorldBossXml;
   import com.aurora.ui.maogoutd.worldBossLevel.ITDWorldBossLevelUI;
   import com.aurora.ui.maogoutd.xiaowu.SmallRoomCardTip;
   import com.aurora.ui.maogoutd.xiaowu.SmallRoomConfig;
   import com.aurora.ui.maogoutd.xiaowu.SnowMountainConfig;
   import com.aurora.ui.maogoutd.xiaowu.TDSmallHouseUI;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.display.StageDisplayState;
   import flash.display.StageScaleMode;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.net.navigateToURL;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.system.Security;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   import flash.utils.setTimeout;
   
   public class TDLobbyCoreUI extends Sprite implements ITDLobbyUI, ITDLobbyService
   {
      
      private static const ROOM_ID_MEI_SHI:int = 0;
      
      private static const ROOM_ID_HUO_SHAN:int = 1;
      
      private static const ROOM_ID_SKY_CASTLE:int = 4;
      
      private static const ROOM_ID_CROSS_SERVER:int = 5;
      
      private static const ROOM_ID_DIY_SERVER:int = 6;
      
      private static const ROOM_ID_SEAFLOOR_WHIRLPOOL:int = 7;
      
      private static const ROOM_ID_SHUJIA_DESERT:int = 8;
      
      private static const ROOM_ID_EXPLORE_CAM:int = 9;
      
      private static const ROOM_ID_SNOW_THUNDERCITY:int = 16;
      
      private static const ROOM_ID_DESERT:int = 17;
      
      private static const ROOM_ID_OUTERSPACETAVEL:int = 18;
      
      private static const ROOM_ID_WORLD_BOSS_LEVEL:int = 19;
      
      private static const ROOM_ID_WORLD_BOSS_TRAIN:int = 20;
      
      private static const ROOM_ID_EARTHCORE_EXPEDITION:int = 21;
      
      private static var intervalId:uint = 0;
      
      private static const TOKEN_KEY:String = "83a182a1ffe683efe035dd1517591adc";
      
      private static const PROVE_KEY:String = "cf2678867b85fe2438017327530ef221";
      
      public var stTDEnterUI:ITDEnterUI;
      
      public var stTDLobbyRoomUI:ITDLobbyRoomUI;
      
      public var stTDStoreUI:ITDStoreUI;
      
      public var stTDNewGuideUI:Object;
      
      public var stTDComponentUI:ITDComponentUI;
      
      public var stTDLoaderUI:DisplayObject;
      
      public var stTDTownUI:DisplayObject;
      
      public var stTDPackageUI:DisplayObject;
      
      public var stTDMailUI:DisplayObject;
      
      public var stTDTaskUI:DisplayObject;
      
      public var stTDFriendUI:DisplayObject;
      
      public var stTDMenuUI:Object;
      
      public var stTDRightMenuUI:DisplayObject;
      
      public var stTDGuide3366UI:DisplayObject;
      
      public var stTDTurnToUI:DisplayObject;
      
      public var stTDGameIMUI:DisplayObject;
      
      public var stTDRankUI:DisplayObject;
      
      public var stTDSetupUI:DisplayObject;
      
      public var stTDComposeUI:DisplayObject;
      
      public var stTDAuctionUI:DisplayObject;
      
      private var m_stTDWeddingRoomUI:DisplayObject;
      
      public var stTDCharmShopUI:DisplayObject;
      
      public var stTDNewActionUI:DisplayObject;
      
      public var stTDHuangZuanWelfareUI:DisplayObject;
      
      public var stTDMeiShiUI:DisplayObject;
      
      public var stTDHuoShanUI:DisplayObject;
      
      public var stTDSkyCastleUI:DisplayObject;
      
      public var stTDSeafloorWhirlpoolUI:DisplayObject;
      
      public var stTDShuQiDesertUI:DisplayObject;
      
      public var stTDExploreCampLandUI:DisplayObject;
      
      public var stTDDesertLandUI:DisplayObject;
      
      public var stTDOuterSpaceTavelLandUI:DisplayObject;
      
      public var stTDEarthcoreExpeditionLandUI:DisplayObject;
      
      public var stTDSnowDesertLandUI:DisplayObject;
      
      public var stTDWonderlandUI:DisplayObject;
      
      public var stTDDeepSeaRemainsUI:DisplayObject;
      
      public var stTDVSUI:DisplayObject;
      
      public var stTDVSMatchUI:DisplayObject;
      
      public var stTDGameReadyUI:Sprite;
      
      public var stTableReadyUI:Sprite;
      
      public var stTDVSGuideUI:DisplayObject;
      
      public var stTDInfoUI:DisplayObject;
      
      public var stTDChooseChannelUI:DisplayObject;
      
      public var stTDRoomUserUI:DisplayObject;
      
      private var stTDConsortiaUI:DisplayObject;
      
      private var stTDAchievementUI:DisplayObject;
      
      private var stUserRoleDetail:DisplayObject;
      
      private var stTDNewMarginTreeUI:DisplayObject;
      
      private var stTDHomeUI:DisplayObject;
      
      private var stTDVowUI:DisplayObject;
      
      private var stTDChangeNameCardUI:DisplayObject;
      
      private var stTDWarRewardUI:DisplayObject;
      
      public var stTDTipDialog:IDialog;
      
      public var stBuySureDialog:IDialog;
      
      public var stTDLoadDialog:DisplayObject;
      
      public var stServerList:DisplayObject;
      
      public var levelAwardDialog:DisplayObject;
      
      private var stTDFeedUI:Sprite;
      
      private var stTDFriendInviteUI:Sprite;
      
      private var stTDTreasureHouseUI:DisplayObject;
      
      private var stTDVipUI:DisplayObject;
      
      private var stTDViliantUI:ITDLobbyRoomUI;
      
      private var stTDActivityEntranceUI:ITDLobbyRoomUI;
      
      private var TDActivityEntranceUI:DisplayObject;
      
      public var stTDSmallHouseUI:DisplayObject;
      
      public var stTDSnowMountainExploreUI:DisplayObject;
      
      public var stTDThunderCityExploreUI:DisplayObject;
      
      public var stTDExploreRoomPopUI:DisplayObject;
      
      public var stTDDentityCardUI:DisplayObject;
      
      public var stTDVerifyInGameUI:TDVerifyInGameUI;
      
      public var stTDMicroClientUI:DisplayObject;
      
      public var stTDGoHeadMapUI:DisplayObject;
      
      public var stTDMobileGameUI:DisplayObject;
      
      public var stTDReportUI:DisplayObject;
      
      public var stTDMeiShiMatchUI:DisplayObject;
      
      public var stTDExploreDiaryUI:DisplayObject;
      
      public var stTDExploreStoreUI:DisplayObject;
      
      public var stTDExploreTaskUI:DisplayObject;
      
      private var stTDWorldMapUI:DisplayObject;
      
      private var stTDMiSuUI:DisplayObject;
      
      private var stTDMoTaUI:DisplayObject;
      
      private var stTDRecipesUI:DisplayObject;
      
      private var stTDGuideResource:DisplayObject;
      
      private var stTDFirstRechargeActivityUI:DisplayObject;
      
      private var m_stTDMarriageRegistrationUI:DisplayObject;
      
      private var stTDNActionUI:DisplayObject;
      
      public var upAwardDialog:DisplayObject;
      
      public var renewTipDailog:DisplayObject;
      
      public var buyTipDailog:DisplayObject;
      
      public var giftBoxDialog:DisplayObject;
      
      private var a_1206:b_176;
      
      private var a_832:ByteArray = new ByteArray();
      
      private var gameLoader:Loader;
      
      private var m_stSendFlowerDialog:DisplayObject;
      
      private var m_stCompleteTip:DisplayObject;
      
      private var m_stCompleteLoverTip:DisplayObject;
      
      private var m_stCompleteAllTip:DisplayObject;
      
      private var m_stCompleteMatchTip:DisplayObject;
      
      private var m_stCompleteExploreTip:DisplayObject;
      
      private var m_stSecpwdTip:DisplayObject;
      
      public var stTDChoujiangUI:DisplayObject;
      
      public var stTDZhencangUI:DisplayObject;
      
      public var stTDExchangeUI:DisplayObject;
      
      public var stTDExchangeShopUI:DisplayObject;
      
      public var stTDDarkCrystalShopUI:DisplayObject;
      
      public var stTDCrossShopUI:DisplayObject;
      
      public var stTDBlueDiamondPrivilegeUI:DisplayObject;
      
      public var stTDGameLobbyUI:DisplayObject;
      
      public var stTDSpecialPayUI:DisplayObject;
      
      public var stTDStarPieceShopUI:DisplayObject;
      
      public var stTDScoreShopUI:DisplayObject;
      
      public var stTDConsortiaTaskUI:DisplayObject;
      
      public var stTDConsortiaGardenUI:DisplayObject;
      
      public var stTDConsortiaCardUI:DisplayObject;
      
      public var stTDConsortiaCarbonUI:DisplayObject;
      
      public var stTDLoverTaskUI:DisplayObject;
      
      public var stTDMonthCardUI:DisplayObject;
      
      public var stTDTarotUI:DisplayObject;
      
      public var stTDOnePieceUI:DisplayObject;
      
      public var stTDOnePieceShopUI:DisplayObject;
      
      public var stTDNewYearActivityUI:DisplayObject;
      
      private var stTDDesktopIconUI:Sprite;
      
      private var stTDActivityDayPayUI:Sprite;
      
      private var stTDPetUI:Sprite;
      
      private var stTDPetEntranceUI:Sprite;
      
      private var m_stTDDailyRechargeUI:Sprite;
      
      private var m_stTDWorldBossLevel:Sprite;
      
      private var m_stTDBirthdayActivity:Sprite;
      
      private var m_stTDTotalPayUI:Sprite;
      
      public var m_stTDEveryDaySeeYouUI:DisplayObject;
      
      public var m_iNewYearBossPosition:int;
      
      public var m_iEnterInfo:Object;
      
      private var m_stTDCumulativeRechargeActivityUI:DisplayObject;
      
      private var m_stTDHolidayRechargeActivityUI:DisplayObject;
      
      private var m_stTDQQInviteUI:DisplayObject;
      
      private var m_stTDCrossServerUI:DisplayObject;
      
      private var m_stTDServiceOpenCarnivalUI:DisplayObject;
      
      private var m_stTDMonopolyUI:DisplayObject;
      
      private var m_stTDHandbookUI:DisplayObject;
      
      private var m_stTDEditorUI:DisplayObject;
      
      private var m_stTDMyChapterUI:DisplayObject;
      
      private var m_stTDDiyLaboratoryUI:DisplayObject;
      
      private var m_stTDServiceOpenBagsUI:DisplayObject;
      
      private var m_stTDContactGMUI:DisplayObject;
      
      private var stTDWeiXinGiftUI:DisplayObject;
      
      private var m_iRoleScore:int;
      
      private var m_newGuide:Boolean;
      
      private var defCardTip:Sprite;
      
      private var propsCardTip:Sprite;
      
      private var armCardTip:Sprite;
      
      private var equipCardTip:Sprite;
      
      private var achiCardTip:Sprite;
      
      private var gemTip:Sprite;
      
      private var buffTip:Sprite;
      
      private var duanweiTip:Sprite;
      
      private var giftCardTip:Sprite;
      
      private var extraAttrTip:Sprite;
      
      private var attrUpTip:Sprite;
      
      private var samllRoomCardTip:Sprite;
      
      private var stModeTip:Sprite;
      
      private var stVsLevelTip:Sprite;
      
      private var mouseTip:MouseTip;
      
      private var exploreTaskTip:DisplayObject;
      
      private var userAvatarTip:UserAvatarTip;
      
      private var achiItemTip:Object;
      
      private var textTip:ITDMessageTip;
      
      private var stTDInviteUI:ITDInviteUI;
      
      private var stTDInviteCommonUI:IInviteCommonUI;
      
      private var invitedPanel:Sprite;
      
      private var taskServer:a_4524;
      
      private var loader:AssetsLoader;
      
      private var levelData:Object;
      
      private var m_defCards:Object;
      
      private var a_1679:Object;
      
      private var a_1203:Dictionary;
      
      private var m_isGaming:Boolean;
      
      private var m_killClose:Boolean = false;
      
      private var fullScreenMask:Shape;
      
      private var consortiaIsOpen:Boolean = true;
      
      private var m_iStoreType:int = 0;
      
      private var notifyJoinRequestAbled:Boolean = false;
      
      private var tempConsoritaProposer:Object;
      
      private var m_iCardID:int = -1;
      
      private var m_iCardSeq:int = -1;
      
      private var m_iIslandId:int;
      
      public var currentPosition:int = 0;
      
      private var tempSysTip:String;
      
      private var gsManager:IGameStringManager;
      
      private var mBridge:IModulesBridge;
      
      private var m_szTiShi:String;
      
      private var m_szError:String;
      
      private var b_213:Boolean;
      
      private var m_oGuideData:Object;
      
      private var autoPopWinAry:Array;
      
      private var hasAutoPopWinAry:Array;
      
      private var autoPopWinTimerHandler:uint;
      
      private var autoTickPopWinNum:int = 0;
      
      private var storyGuideCondition:Object = {
         "n_load":false,
         "n_play":false,
         "n_jump":false,
         "n_fight":false,
         "n_meishi":false,
         "n_huoshan":false,
         "n_skycastle":false,
         "n_seafloorWhirlpool":false,
         "n_town":false,
         "n_sitdown":false,
         "n_click":false,
         "n_game":false
      };
      
      private var menuOpenCondition:Object = {
         "town":false,
         "meishi":false,
         "huoshan":false,
         "skycastle":false,
         "seafloorWhirlpool":false,
         "shuQiDesert":false,
         "ExploreLand":false,
         "SnowLand":false,
         "DesertLand":false,
         "OuterSpaceTavelLand":false,
         "EarthcoreExpeditionLand":false
      };
      
      private var LevelUpCondition:Object = {
         "town":false,
         "meishi":false,
         "huoshan":false,
         "skycastle":false,
         "seafloorWhirlpool":false,
         "shuQiDesert":false,
         "ExploreLand":false,
         "SnowLand":false,
         "DesertLand":false,
         "OuterSpaceTavelLand":false,
         "EarthcoreExpeditionLand":false
      };
      
      private var animationQuence:Array;
      
      private var animationIsPlay:Boolean = false;
      
      private var isPlaying:Boolean = false;
      
      private var isStoryGuide:Boolean = false;
      
      private var m_iSensitiveDemoId:int;
      
      private var m_iSensitiveWordType:int;
      
      private var m_bSendMailDirect:Boolean = false;
      
      private var m_oSendToRole:Object = null;
      
      private var timer:Timer;
      
      private var m_stOpenEvent:a_1778;
      
      private var m_iBeInvitedWeddingRoomUin:int;
      
      private var m_bIsRequestWeddingRoomAgree:Boolean = false;
      
      private var m_iMarriageCertificatePartnerUin:int;
      
      private var m_bIsRequestMarriageCertificateAgree:Boolean = false;
      
      private var m_bIsCloseGame:Boolean;
      
      private var last_login_time:int = 0;
      
      private var m_isReceive:Boolean = false;
      
      private var m_dictZhuanZhiID:Dictionary;
      
      private var m_matchTimer:Timer;
      
      private var m_ExploreTimer:Timer;
      
      private var MeishiTarget:Object = new Object();
      
      private const needAutoPopWin:Array = ["TDHolidayRechargeActivityUI","TDBirthdayActivityUI"];
      
      public function TDLobbyCoreUI()
      {
         super();
         this.m_iNewYearBossPosition = 0;
         this.addEventListener(Event.ADDED_TO_STAGE,this.onStageEvent);
         this.loader = new AssetsLoader();
         a_1825.e.register(this);
         a_2155.e.onlyRegister(this,true);
         a_2150.e.register(this);
         a_2169.e.register(this);
         a_2160.e.register(this);
         a_2145.e.register(this);
         a_2157.e.register(this);
         a_2156.e.register(this);
         a_2143.e.register(this);
         a_2171.e.register(this);
         a_2172.e.register(this);
         this.mBridge = a_4657.getInstance();
         this.mBridge.addListener(this);
         HandbookController.Get().InitEvent();
         this.addEventListener(MouseEvent.CLICK,this.onClickEvent);
         a_1789.getInstance().addEventListener(EventType.COMPLETE_CONSORTIA_TASK,this.onNotifyConsortiaTask);
         a_1789.getInstance().addEventListener(EventType.COMPLETE_MEISHI_MATCH_TASK,this.onNotifyMatchTask);
         a_1789.getInstance().addEventListener(EventType.NOTIFY_CAMP_TASK_COMPLETE,this.onNotifyExploreCampTask);
         a_1789.getInstance().addEventListener(EventType.UNEED_SECPWD,this.onNotifySecpwd);
         a_1789.getInstance().addEventListener(EventType.NEED_VERIFY_IN_GAME,this.onVerifyInGame);
         a_1789.getInstance().addEventListener(EventType.AUTO_OPEN_HANDBOOK,this.onAutoOpenHandbook);
         a_1789.getInstance().addEventListener(EventType.VERIFY_IN_GAME_INPUT,this.onVerifyInGameResult);
         a_1789.getInstance().addEventListener(EventType.GET_MONTH_CARD_INFO,this.onGetMonthCard);
         a_1789.getInstance().addEventListener(EventType.QQGAME_POST_CONSUME,this.onRoleCunsume);
         a_1789.getInstance().addEventListener(EventType.a_580,this.a_2541);
         a_1789.getInstance().addEventListener(EventType.DIY_CREATE_MAP,this.onCreateMap);
         a_1789.getInstance().addEventListener("MeishiMatchGoHead",this.onMeishiMatchGoHead);
         a_1789.getInstance().addEventListener("ThunderCityGoHead",this.onThunderCityGoHead);
         a_1789.getInstance().addEventListener("TestMapGoHead",this.onTestMapGoHead);
         a_1789.getInstance().addEventListener(EventType.WORLD_BOSS_ENTER_TRAIN_ROOM,this.onEnterWorldBossTrainRoom);
         a_1789.getInstance().addEventListener(EventType.CHECK_NEW_SVR_TASK,this.OnResiveCheckCarnival);
         this.m_newGuide = false;
         this.m_isGaming = false;
      }
      
      private function OnResiveCheckCarnival(e:a_1778) : void
      {
         var response:Object = e.dataObject;
         var needAutoOpen:Boolean = response.m_cSPActCloseState == 0;
         a_2439.getInstance().setBirthdayActivityAutoOpen(needAutoOpen);
         if(!this.m_newGuide && needAutoOpen)
         {
            this.putAutoPopWinAry({
               "sortId":1,
               "target":this.m_stTDBirthdayActivity,
               "id":"TDBirthdayActivityUI",
               "showName":"福利打卡",
               "loadedHandler":this.InitialzeTDBirthdayActivityUI,
               "visibleLoadDialog":true
            });
         }
      }
      
      public function MoveToPos(arrObjs:Array, pTargetPos:Point, stContainer:DisplayObjectContainer = null, fMoveTime:Number = 2, fDisappearTime:Number = 0.5) : void
      {
         if(null == stContainer)
         {
            stContainer = stage;
         }
         CommonAnimateManager.Instance.MoveTo(arrObjs,pTargetPos,stContainer,fMoveTime,fDisappearTime);
      }
      
      public function ShowAwardTip(arrTip:Array, fRate:Number = 1, bIsAddPrefix:Boolean = true) : void
      {
         CommonTipsTextManager.Instance.SetContainerSp(stage);
         CommonTipsTextManager.Instance.ShowAwardTip(arrTip,fRate,bIsAddPrefix);
      }
      
      public function OnGetInWeddingRoomHandle(stData:Object) : void
      {
         DefineWeddingRoomInfo.SetWeddingRoomInfo(stData);
         this.LoadWeddingRoomUI(true);
      }
      
      public function OnWeddingRoomOperationHandle(arrDatas:Array) : void
      {
         if(this.m_bIsRequestWeddingRoomAgree)
         {
            return;
         }
         if(this.RefuseMarriageInvite())
         {
            return;
         }
         var iOperateType:int = int(arrDatas[0]);
         var arrValues:Array = arrDatas[1];
         switch(iOperateType)
         {
            case DefineWeddingRoomOperation.SC_BE_INVITED:
               this.BeInviteToWeddingRoom(arrValues);
         }
      }
      
      private function BeInviteToWeddingRoom(arrValues:Array) : void
      {
         this.m_iBeInvitedWeddingRoomUin = arrValues[0];
         var strInvitePlayerName:String = arrValues[1];
         var strMessageContent:String = this.gsManager.getString(139803,[strInvitePlayerName]);
         this.a_3744(strMessageContent,this.gsManager.getString(139623),true,true,true,true,10000);
         this.stTDTipDialog.addEventListener(a_3251.SURE,this.OnAgreeWeddingRoomInvitedHandle);
         this.stTDTipDialog.addEventListener(a_3251.CLOSE,this.OnConfuseWeddingRoomInvitedHandle);
         this.stTDTipDialog.addEventListener(a_3251.CANCEL,this.OnConfuseWeddingRoomInvitedHandle);
      }
      
      private function OnAgreeWeddingRoomInvitedHandle(e:a_3251) : void
      {
         if(null == this.m_stTDWeddingRoomUI)
         {
            this.m_bIsRequestWeddingRoomAgree = true;
            this.LoadWeddingRoomUI(false);
         }
         else
         {
            this.WeddingRoomInvitedResultHandle(DefineWeddingRoomOperation.REPLY_AGREE);
         }
      }
      
      private function OnConfuseWeddingRoomInvitedHandle(e:a_3251) : void
      {
         this.WeddingRoomInvitedResultHandle(DefineWeddingRoomOperation.REPLY_REFUSE);
      }
      
      private function WeddingRoomInvitedResultHandle(iIsAgree:int) : void
      {
         var stMyselfRoleInfo:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         a_2161.e.notify("OnRequestWeddingRoomOperate",stMyselfRoleInfo.m_iRoleUin,DefineWeddingRoomOperation.CS_REPLY_INVITE,[this.m_iBeInvitedWeddingRoomUin,iIsAgree]);
         this.stTDTipDialog.removeEventListener(a_3251.SURE,this.OnAgreeWeddingRoomInvitedHandle);
         this.stTDTipDialog.removeEventListener(a_3251.CANCEL,this.OnConfuseWeddingRoomInvitedHandle);
         this.stTDTipDialog.removeEventListener(a_3251.CLOSE,this.OnConfuseWeddingRoomInvitedHandle);
         this.m_iBeInvitedWeddingRoomUin = -1;
      }
      
      public function OnMarriageCertificateOperationHandle(arrDatas:Array) : void
      {
         if(this.m_bIsRequestMarriageCertificateAgree)
         {
            return;
         }
         if(this.RefuseMarriageInvite())
         {
            return;
         }
         var iOperateType:int = int(arrDatas[0]);
         var arrValues:Array = arrDatas[1];
         switch(iOperateType)
         {
            case DefineMarriageCertificateOperation.SC_BE_INVITED:
               this.BeInviteToMarriageRegistration(arrValues);
         }
      }
      
      private function BeInviteToMarriageRegistration(arrValues:Array) : void
      {
         this.m_iMarriageCertificatePartnerUin = arrValues[0];
         var strPartnerName:String = arrValues[1];
         var iMarriageState:int = a_2161.e.notifyData("GetMarriageInfo","m_iMarriageState") as int;
         var iStringID:int = DefineMarriageInfo.MARRIAGE_STATE_UNMARRIED == iMarriageState ? 139624 : 139893;
         var strMessageContent:String = this.gsManager.getString(iStringID,[strPartnerName]);
         this.a_3744(strMessageContent,this.gsManager.getString(139623),true,true,true,true,10000);
         this.stTDTipDialog.addEventListener(a_3251.SURE,this.OnAgreeMarriageCertificateInvitedHandle);
         this.stTDTipDialog.addEventListener(a_3251.CLOSE,this.OnConfuseMarriageCertificateInvitedHandle);
         this.stTDTipDialog.addEventListener(a_3251.CANCEL,this.OnConfuseMarriageCertificateInvitedHandle);
      }
      
      private function ShowMarriageRegistrationUI() : void
      {
         this.showCilckedTarget(this.m_stTDMarriageRegistrationUI,"TDMarriageRegistrationUI",this.gsManager.getString(4417),this.InitialzeTDMarriageRegistrationUI);
         this.mBridge.execute("showTownBtnTipAnimation",this,"m_stWeddingTipMc",false);
      }
      
      private function OnAgreeMarriageCertificateInvitedHandle(e:a_3251) : void
      {
         if(null == this.m_stTDMarriageRegistrationUI)
         {
            this.m_bIsRequestMarriageCertificateAgree = true;
            this.ShowMarriageRegistrationUI();
         }
         else
         {
            if(null == this.m_stTDMarriageRegistrationUI.parent)
            {
               this.ShowMarriageRegistrationUI();
            }
            this.MarriageCertificateInvitedResultHandle(DefineMarriageCertificateOperation.REPLY_AGREE);
         }
      }
      
      private function OnConfuseMarriageCertificateInvitedHandle(e:a_3251) : void
      {
         this.MarriageCertificateInvitedResultHandle(DefineMarriageCertificateOperation.REPLY_REFUSE);
      }
      
      private function MarriageCertificateInvitedResultHandle(iIsAgree:int) : void
      {
         var stMyselfRoleInfo:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         a_2161.e.notify("onRequestMarriageCertificateOperation",stMyselfRoleInfo.m_iRoleUin,DefineMarriageCertificateOperation.CS_REPLY_INVITE,[this.m_iMarriageCertificatePartnerUin,iIsAgree]);
         this.stTDTipDialog.removeEventListener(a_3251.SURE,this.OnAgreeMarriageCertificateInvitedHandle);
         this.stTDTipDialog.removeEventListener(a_3251.CANCEL,this.OnConfuseMarriageCertificateInvitedHandle);
         this.stTDTipDialog.removeEventListener(a_3251.CLOSE,this.OnConfuseMarriageCertificateInvitedHandle);
         this.m_iMarriageCertificatePartnerUin = -1;
      }
      
      public function CheckSensitiveWord(szWords:String, iDemoId:int, iType:int = -1) : void
      {
         var variables:URLVariables = new URLVariables();
         var parameters:Object = stage.loaderInfo.parameters;
         this.m_iSensitiveDemoId = iDemoId;
         this.m_iSensitiveWordType = iType;
         if(!parameters)
         {
            return;
         }
         var szSite:String = parameters.sitetype;
         if("qq" == szSite)
         {
            variables.isqzone = "true";
         }
         else
         {
            variables.isqzone = "false";
         }
         variables.content = szWords;
         variables.URLType = 19;
         if(-1 != iType)
         {
            variables.URLType = 20;
            variables.ctype = iType;
         }
         variables.myopenid = parameters.sig_user;
         variables.myopenkey = parameters.myopenkey;
         variables.pf = parameters.pf;
         a_3191.getInstance().sendRequest(this,variables,this.onResponseSensitiveWord);
      }
      
      private function onResponseSensitiveWord(oData:Object) : void
      {
         if(0 != oData.data.ret)
         {
            return;
         }
         if(-1 == this.m_iSensitiveWordType)
         {
            a_4657.getInstance().execute("OnWordFilter",this,oData.data,this.m_iSensitiveDemoId);
         }
         else
         {
            if(0 != oData.data.result)
            {
               this.showTip("发送的内容中还有非法字符");
               return;
            }
            a_4657.getInstance().execute("OnCheckSpam",this,oData.data,this.m_iSensitiveDemoId);
         }
      }
      
      public function showTip(msg:String) : void
      {
         var textTip:ITDMessageTip = a_2155.e.GetMessageTip() as ITDMessageTip;
         textTip.showTextTip(stage,msg,new Rectangle());
      }
      
      private function onStageEvent(a_4730:Event) : void
      {
         VerifyPackageSize.getInstance().init();
         TimeoutManager.getInstance().init();
         SWFProfiler.init(stage,this);
         stage.frameRate = 12;
         stage.stageFocusRect = false;
         stage.addEventListener(Event.RESIZE,this.onResize);
         if(this.stTDMiSuUI != null)
         {
            stage.addChild(this.stTDMiSuUI);
         }
         if(this.stTDTipDialog == null)
         {
            this.stTDTipDialog = Dialog.getInstance();
         }
         if(this.stBuySureDialog == null)
         {
            this.stBuySureDialog = BuySureDialog.getInstance();
         }
         a_4650.getInstance().detect(stage.loaderInfo.parameters.sitetype);
         a_4650.getInstance().addEventListener(a_4650.KICK_OUT,this.onBeKickedOut);
         var openid:String = stage.loaderInfo.parameters.sig_user;
         var openkey:String = stage.loaderInfo.parameters.myopenkey;
         var enterRoom:Object = a_2161.e.getEnterRoom();
         enterRoom.m_szOpenKey = openkey;
         enterRoom.m_szOpenId = openid;
         enterRoom.m_iSiteType = stage.loaderInfo.parameters.sitetype;
         MeishiGuide.Instance.a_3014(stage,this,this.stTDGuideResource.loaderInfo.applicationDomain);
         MessageTipHandler.Get().RegisterStage(this.stage);
         a_4807.Get().RegisterStage(this.stage);
         CheckIDHandler.Get().CheckStart();
         ReportHandler.Get().a_3014(stage);
         Security.allowDomain("*");
         Security.allowInsecureDomain("*");
         ExternalInterface.addCallback("openBlueDiamondBack",this.openBlueDiamondBack);
         this.autoPopWinAry = new Array();
         this.hasAutoPopWinAry = new Array();
         this.autoPopWinTimerHandler = setInterval(this.onTickAutoPopWin,6000);
      }
      
      private function requestBlueDiamondInfo() : void
      {
         var params:Object = null;
         var enterRoom:Object = a_2161.e.getEnterRoom();
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         if(Boolean(stage) && stage.loaderInfo.parameters.sitetype == "qqgame")
         {
            params = {};
            params.openid = stage.loaderInfo.parameters.sig_user;
            params.openkey = stage.loaderInfo.parameters.myopenkey;
            params.src_uin = role.m_iRoleUin;
            params.URLType = 25;
            a_3191.getInstance().sendRequest(this,params,this.updateBlueInfo);
         }
      }
      
      public function updateBlueInfo(back_obj:Object) : void
      {
         (this.stTDRoomUserUI as Object).roomAvatar.requestInfo();
      }
      
      public function openBlueDiamondBack() : void
      {
         var enterRoom:Object = a_2161.e.getEnterRoom();
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         var params:Object = {};
         if(Boolean(stage) && stage.loaderInfo.parameters.sitetype == "qqgame")
         {
            params.openid = stage.loaderInfo.parameters.sig_user;
            params.openkey = stage.loaderInfo.parameters.myopenkey;
            params.src_uin = role.m_iRoleUin;
            params.URLType = 25;
            a_3191.getInstance().sendRequest(this,params,this.updateInfo);
         }
      }
      
      public function updateInfo(back_obj:Object) : void
      {
         (this.stTDRoomUserUI as Object).roomAvatar.requestInfo();
         if(Boolean(this.stTDBlueDiamondPrivilegeUI) && this.stTDBlueDiamondPrivilegeUI.visible == true)
         {
            (this.stTDBlueDiamondPrivilegeUI as Object).blueDiamondPrivilege.requestGiftInfo();
         }
      }
      
      public function GetTDLobbyLogic() : b_176
      {
         return this.a_1206;
      }
      
      private function onBeKickedOut(a_4730:Event) : void
      {
         this.a_3744(GameStringManager.getInstance().getString(24581),this.m_szTiShi,true,true,false,false,5000);
         this.stTDTipDialog.addEventListener(a_3251.CLOSE,this.a_4550);
      }
      
      private function onResize(a_4730:Event) : void
      {
         if(StageDisplayState.FULL_SCREEN == stage.displayState)
         {
            if(null == this.fullScreenMask)
            {
               this.fullScreenMask = new Shape();
               this.fullScreenMask.graphics.beginFill(16711680,1);
               this.fullScreenMask.graphics.drawRect(0,0,950,600);
               this.fullScreenMask.graphics.endFill();
            }
            this.parent.addChild(this.fullScreenMask);
            this.mask = this.fullScreenMask;
         }
         else
         {
            if(null != this.fullScreenMask)
            {
               if(this.parent == this.fullScreenMask.parent)
               {
                  this.parent.removeChild(this.fullScreenMask);
               }
            }
            this.mask = null;
         }
      }
      
      public function a_2120(lobbyLogic:b_176, arrLobbyChildUI:Array) : Boolean
      {
         var enterRoom:Object = null;
         enterRoom = a_2161.e.getEnterRoom();
         if(null == lobbyLogic)
         {
            return false;
         }
         this.a_1206 = lobbyLogic;
         this.stTDLoaderUI = arrLobbyChildUI["TDLoaderUI"];
         this.stTDEnterUI = arrLobbyChildUI["TDEnterUI"] as ITDEnterUI;
         this.stTDComponentUI = arrLobbyChildUI["TDComponentUI"] as ITDComponentUI;
         this.stTDInviteUI = arrLobbyChildUI["TDInviteUI"] as ITDInviteUI;
         this.stTDInviteCommonUI = arrLobbyChildUI["TDInviteCommonUI"] as IInviteCommonUI;
         this.stTDTownUI = arrLobbyChildUI["TDTownUI"];
         this.stTDGameIMUI = arrLobbyChildUI["TDGameIMUI"];
         this.stTDMenuUI = arrLobbyChildUI["TDMenuUI"].menu;
         this.stTDRightMenuUI = arrLobbyChildUI["TDMenuUI"].rightMenu;
         this.stTDGuide3366UI = arrLobbyChildUI["TDMenuUI"].Guide3366;
         this.stTDTurnToUI = arrLobbyChildUI["TDMenuUI"].turnToPanel;
         this.stTDPackageUI = arrLobbyChildUI["TDPackageUI"];
         this.stUserRoleDetail = arrLobbyChildUI["TDPackageUI"].userRoleDetail;
         this.stTDHomeUI = arrLobbyChildUI["TDHomeUI"];
         this.stTDGameReadyUI = arrLobbyChildUI["TDGameReadyUI"];
         this.stTableReadyUI = arrLobbyChildUI["TDGameReadyUI"].stTableReadyUI;
         this.stTDRoomUserUI = arrLobbyChildUI["TDRoomUserUI"];
         this.stTDTreasureHouseUI = arrLobbyChildUI["TDTreasureHouseUI"];
         this.stTDVipUI = arrLobbyChildUI["TDVipUI"];
         this.stTDViliantUI = arrLobbyChildUI["TDViliantUI"];
         this.stTDActivityEntranceUI = arrLobbyChildUI["TDActivityEntranceUI"];
         this.stTDSmallHouseUI = arrLobbyChildUI["TDSmallHouseUI"];
         this.stTDSnowMountainExploreUI = arrLobbyChildUI["TDSnowMountainExploreUI"];
         this.stTDThunderCityExploreUI = arrLobbyChildUI["TDThunderCityExploreUI"];
         this.stTDExploreRoomPopUI = arrLobbyChildUI["TDExploreRoomPopUI"];
         this.stTDDentityCardUI = arrLobbyChildUI["TDDentityCardUI"];
         this.stTDMicroClientUI = arrLobbyChildUI["TDMicroClientUI"];
         this.stTDGoHeadMapUI = arrLobbyChildUI["TDGoHeadMapUI"];
         this.stTDMobileGameUI = arrLobbyChildUI["TDMobileGameUI"];
         this.stTDReportUI = arrLobbyChildUI["TDReportUI"];
         this.stTDMeiShiMatchUI = arrLobbyChildUI["TDMeiShiMatchUI"];
         this.stTDExploreDiaryUI = arrLobbyChildUI["TDExploreDiaryUI"];
         this.stTDExploreStoreUI = arrLobbyChildUI["TDExploreStoreUI"];
         this.stTDExploreTaskUI = arrLobbyChildUI["TDExploreTaskUI"];
         this.stTDChoujiangUI = arrLobbyChildUI["TDChoujiangUI"];
         this.stTDZhencangUI = arrLobbyChildUI["TDZhencangUI"];
         this.stTDExchangeUI = arrLobbyChildUI["TDExchangeUI"];
         this.stTDExchangeShopUI = arrLobbyChildUI["TDExchangeShopUI"];
         this.stTDDarkCrystalShopUI = arrLobbyChildUI["TDDarkCrystalShopUI"];
         this.stTDCrossShopUI = arrLobbyChildUI["TDCrossShopUI"];
         this.stTDBlueDiamondPrivilegeUI = arrLobbyChildUI["TDBlueDiamondPrivilegeUI"];
         this.stTDGameLobbyUI = arrLobbyChildUI["TDGameLobbyUI"];
         this.stTDSpecialPayUI = arrLobbyChildUI["TDSpecialPayUI"];
         this.stTDStarPieceShopUI = arrLobbyChildUI["TDStarPieceShopUI"];
         this.stTDScoreShopUI = arrLobbyChildUI["TDScoreShopUI"];
         this.stTDWorldMapUI = arrLobbyChildUI["TDWorldMapUI"];
         this.stTDGuideResource = arrLobbyChildUI["TDGuideResource"];
         this.stTDConsortiaTaskUI = arrLobbyChildUI["TDConsortiaTaskUI"];
         this.stTDConsortiaGardenUI = arrLobbyChildUI["TDConsortiaGardenUI"];
         this.stTDConsortiaCardUI = arrLobbyChildUI["TDConsortiaCardUI"];
         this.stTDConsortiaCarbonUI = arrLobbyChildUI["TDConsortiaCarbonUI"];
         this.stTDLoverTaskUI = arrLobbyChildUI["TDLoverTaskUI"];
         this.stTDMonthCardUI = arrLobbyChildUI["TDMonthCardUI"];
         this.stTDTarotUI = arrLobbyChildUI["TDTarotUI"];
         this.stTDOnePieceUI = arrLobbyChildUI["TDOnePieceUI"];
         this.stTDOnePieceShopUI = arrLobbyChildUI["TDOnePieceShopUI"];
         this.stTDNewYearActivityUI = arrLobbyChildUI["TDNewYearActivityUI"];
         this.stTDWeiXinGiftUI = arrLobbyChildUI["TDWeiXinGiftUI"];
         this.m_stTDDiyLaboratoryUI = arrLobbyChildUI["TDDiyLaboratoryUI"];
         this.m_stTDEveryDaySeeYouUI = arrLobbyChildUI["TDEveryDaySeeYouUI"];
         WhiteListConfig.setWhiteList(arrLobbyChildUI["whitelist"]);
         this.gsManager = GameStringManager.getInstance();
         this.gsManager.setString(arrLobbyChildUI["zh_CN.xml"]);
         this.tempSysTip = this.gsManager.getString(24577);
         AnalysisSystemNoticeXml.GetInstance().AnalysisSystemMessageXML(arrLobbyChildUI["playernews.xml"]);
         this.a_1203 = arrLobbyChildUI["version"];
         this.stTDLobbyRoomUI = arrLobbyChildUI["TDLobbyRoomUI"];
         this.stTDMiSuUI = arrLobbyChildUI["TDMiSuUI"];
         a_2018.getInstance().a_2019(arrLobbyChildUI["HotGameList.xml"]);
         a_2020.getInstance().a_2021(arrLobbyChildUI["match_game_list.xml"]);
         AnalyzeModeOpen.GetInstance().AnalyzeModeOpenXml(arrLobbyChildUI["open_mode"]);
         a_2027.getInstance().a_2028(arrLobbyChildUI["card_desc.xml"]);
         a_2027.getInstance().a_2029(arrLobbyChildUI["mouse_desc.xml"]);
         a_2044.getInstance().a_2046(arrLobbyChildUI["store.xml"]);
         a_2044.getInstance().a_2045(arrLobbyChildUI["market_goods.xml"]);
         a_2027.getInstance().a_2032(arrLobbyChildUI["market_item.xml"]);
         a_2027.getInstance().a_2030(arrLobbyChildUI["compose.xml"]);
         ComposeConfig.getInstance().setConfigData(a_2027.getInstance().m_xmlComposeConfig);
         a_2027.getInstance().a_2031(arrLobbyChildUI["tiny_market_goods.xml"]);
         a_2041.getInstance().a_2042(arrLobbyChildUI["skill.xml"]);
         a_2033.getInstance().a_2034(arrLobbyChildUI["game_level.xml"]);
         a_3340.setConfig(arrLobbyChildUI["consortia.xml"]);
         VowConfig.setConfig(arrLobbyChildUI["vow_box.xml"],arrLobbyChildUI["precious_box.xml"]);
         NewSvrGiftConfig.GetInstance().AnalysisXML(arrLobbyChildUI["newsvr_gift.xml"]);
         ActionNewActivityConfigXml.getInstance().getXmlData(arrLobbyChildUI["NewActivityConfigXml.xml"]);
         CrystalXML.Get().a_2040(arrLobbyChildUI["crystone.xml"]);
         CryAdditionXML.Get().a_2040(arrLobbyChildUI["crystone_addition.xml"]);
         ConsortiaTaskConfig.Get().a_2040(arrLobbyChildUI["newtask.xml"]);
         AnalysisBirthdayActivityXml.GetInstance().parseTaskXml(arrLobbyChildUI["newtask.xml"]);
         AnalysisBirthdayActivityXml.GetInstance().parseXml(arrLobbyChildUI["birthdayActivity.xml"]);
         AnalysisWorldBossXml.GetInstance().AnalysisXML(arrLobbyChildUI["worldBoss.xml"]);
         AnalysisWorldBossXml.GetInstance().AnalysisShopXML(arrLobbyChildUI["worldBossShop.xml"]);
         AnalysisMeiShiMatchXml.GetInstance().AnalysisTaskListXML(arrLobbyChildUI["newtask.xml"]);
         AnalysisMeiShiMatchXml.GetInstance().AnalysisTaskAwardXML(arrLobbyChildUI["food_contest.xml"]);
         AnalysisExplorelandXml.GetInstance().AnalysisTaskListXML(arrLobbyChildUI["newtask.xml"]);
         AnalysisExplorelandXml.GetInstance().AnalysisCampXML(arrLobbyChildUI["advcamp.xml"]);
         ExploreStoreConfig.Get().a_2040(arrLobbyChildUI["advcamp.xml"]);
         ExploreDiaryConfig.Get().a_2040(arrLobbyChildUI["advcamp.xml"]);
         NewYearActivityConfig.Get().a_2040(arrLobbyChildUI["new_year.xml"]);
         NewYearActivityConfig.Get().ParseLotteryXML(arrLobbyChildUI["dog_card.xml"]);
         LimitRewardXML.Get().a_2040(arrLobbyChildUI["new_year.xml"]);
         ConsortiaActivityConfig.Get().a_2040(arrLobbyChildUI["consortia_activity.xml"]);
         SmallRoomConfig.Get().a_2040(arrLobbyChildUI["smallRoom.xml"]);
         LimitStoreConfig.Get().a_2040(arrLobbyChildUI["limit_shop.xml"]);
         ExchangeShopConfig.Get().a_2040(arrLobbyChildUI["animals_card.xml"]);
         TarotConfig.Get().a_2040(arrLobbyChildUI["tarot.xml"]);
         OnePieceConfig.Get().init();
         PetConfig.GetInstance().AnalyConfig(arrLobbyChildUI["PetConfig.xml"]);
         PayAwardConfig.Get().AnalyConfig(arrLobbyChildUI["pay_award.xml"]);
         RechargeActivityConfig.GetInstance().AnalysisXML(arrLobbyChildUI["rechargeActivity.xml"]);
         ZhencangAnalyze.getInstance().ParseZhencangXML(arrLobbyChildUI["zhencang.xml"]);
         SuperAwardAnalyze.getinstance().ParseSuperAwardXML(arrLobbyChildUI["superAward.xml"]);
         ScoreShopAnalyze.getinstance().ParseScoreShopXML(arrLobbyChildUI["scoreshop.xml"]);
         a_3291.getInstance().setData(arrLobbyChildUI["tip_message.xml"]);
         var myXml:XML = arrLobbyChildUI["data.xml"];
         this.b_213 = b_214.Check(arrLobbyChildUI["achi_desc.xml"],arrLobbyChildUI["task_desc.xml"],myXml.@version);
         a_3168.getInstance().isLegal = this.b_213;
         a_2048.getInstance().isLegal = this.b_213;
         a_3168.getInstance().a_3169(new XML(arrLobbyChildUI["achi_desc.xml"]));
         a_3191.getInstance().getURLs(new XML(arrLobbyChildUI["misc_name.xml"]));
         ExplainDialogManager.instance.initExplainDialogData(new XML(arrLobbyChildUI["explain.xml"]));
         CharmShopConfig.Get().AnalysisXML(arrLobbyChildUI["wedding.xml"]);
         MarriageConfig.GetInstance().AnalysisXML(arrLobbyChildUI["wedding.xml"]);
         SweetIslandXml.Get().a_2040(arrLobbyChildUI["sweetisland.xml"]);
         SnowMountainConfig.Get().a_2040(arrLobbyChildUI["sweetisland.xml"]);
         ThunderCityConfig.Get().a_2040(arrLobbyChildUI["sweetisland.xml"]);
         CompositeMapXML.Get().a_2040(arrLobbyChildUI["composite_map.xml"]);
         OnePieceConfig.Get().a_2040(arrLobbyChildUI["god_card.xml"]);
         AnalysisBattleBGXml.Get().a_2040(arrLobbyChildUI["mapBG.xml"]);
         ViliantData.Get().a_2040(arrLobbyChildUI["viliant_challenge.xml"]);
         CardUpgradeXML.Get().a_2040(arrLobbyChildUI["CardUpgrade.xml"]);
         RecipeXMLParser.instance().parse(arrLobbyChildUI["crystallizeAddCard.xml"]);
         CardFusionConfig.Get().a_2040(arrLobbyChildUI["CardFusion.xml"]);
         a_2047.parseConfig(arrLobbyChildUI["tagger"]);
         a_2048.getInstance().a_2049(new XML(arrLobbyChildUI["task_desc.xml"]));
         a_2037.getInstance().a_2038(arrLobbyChildUI["map_mouse.xml"],arrLobbyChildUI);
         a_2037.getInstance().ParseDongMapMouseXML2(arrLobbyChildUI["map_mouse4.xml"]);
         a_2037.getInstance().ParseSweetislandXML(arrLobbyChildUI["sweetisland.xml"]);
         a_3182.getInstance().a_3183(arrLobbyChildUI["activity.xml"]);
         a_3182.getInstance().a_3185(arrLobbyChildUI["activity_award.xml"]);
         VipConfig.Instance.parseConfig(arrLobbyChildUI["activity_award.xml"]);
         RecommandCardConfig.Instance.parseRecomCardConfig(arrLobbyChildUI["recommandCard.xml"]);
         NewGuideConfig.Instance.parseGuideXML(arrLobbyChildUI["guide.xml"]);
         VersionMD5.Get().a_2040(arrLobbyChildUI["versionMD5.xml"]);
         WorldRoamingXML.Get().a_2040(arrLobbyChildUI["world_roaming.xml"]);
         HandbookConfigData.Get().a_2040(arrLobbyChildUI["handbook.xml"]);
         DiyHandler.GetInstance().m_ConfigData.a_2040(arrLobbyChildUI["diy.xml"]);
         StorageBagConfig.GetInstance().a_2040(arrLobbyChildUI["extraBag.xml"]);
         CrossServerHandler.Get();
         this.stTDLoadDialog = this.stTDComponentUI.GetTDLoadDialog();
         this.taskServer = new a_4524();
         a_4514.Get().a_3895(this.taskServer);
         this.taskServer.setLobbyLogic(this.a_1206);
         this.m_defCards = arrLobbyChildUI["DefCardsPackage"];
         this.a_1679 = arrLobbyChildUI["PreviewMousePackage"];
         this.stTDNewGuideUI = arrLobbyChildUI["TDNewGuideUI"];
         this.stTDNewGuideUI.a_3639(this.a_1206);
         this.stServerList = this.stTDComponentUI.a_3709();
         this.stServerList.x = 800;
         this.stServerList.y = 0;
         enterRoom.m_iGroupID = arrLobbyChildUI["iGroupID"];
         enterRoom.m_szBaseUrl = arrLobbyChildUI["szBaseUrl"];
         enterRoom.m_isYellowGem = arrLobbyChildUI["m_isYellowGem"];
         enterRoom.m_isYearYellowGem = arrLobbyChildUI["m_isYearYellowGem"];
         enterRoom.m_iDemo = arrLobbyChildUI["m_iDemo"];
         enterRoom.m_iYellowGemLevel = arrLobbyChildUI["m_iYellowGemLevel"];
         enterRoom.m_iFm = arrLobbyChildUI["m_iFm"];
         enterRoom.m_szFigureurl = arrLobbyChildUI["m_szFigureurl"];
         enterRoom.m_szNickname = arrLobbyChildUI["m_szNickname"];
         enterRoom.m_szTxZone = arrLobbyChildUI["m_szTxZone"];
         enterRoom.m_iFcm = arrLobbyChildUI["m_iFcm"];
         enterRoom.m_prove_gift = arrLobbyChildUI["m_prove_gift"];
         enterRoom.pfkey = arrLobbyChildUI["pfkey"];
         enterRoom.pf = arrLobbyChildUI["pf"];
         enterRoom.m_iClientIP = arrLobbyChildUI["m_iClientIP"];
         enterRoom.m_iLoginDuration = arrLobbyChildUI["m_iLoginDuration"];
         enterRoom.m_iMicroClient = arrLobbyChildUI["m_iMicroClient"];
         enterRoom.m_MicroGift = arrLobbyChildUI["m_MicroGift"];
         enterRoom.TDGameReadyUILoader = this.stTDGameReadyUI.loaderInfo.loader;
         LobbyEventManager.Get().addEventListener(TaskShortcutEvent.NAME,this.onTaskShortcutEvent);
         setTimeout(this.initFeed,2000);
         var effect:a_2050 = new a_2050();
         (this.stTDMiSuUI as Object).a_2023(arrLobbyChildUI["tiny_cat.xml"]);
         this.m_szTiShi = GameStringManager.getInstance().getString(132426);
         this.m_szError = GameStringManager.getInstance().getString(24578);
         AnalysisMeiShiMatchXml.GetInstance().AnalysisTalkXML(new XML(arrLobbyChildUI["talk_time.xml"]));
         AnalysisSystemXml.GetInstance().AnalysisTalkXML(new XML(arrLobbyChildUI["talk_time.xml"]));
         trace("TDLobbyCoreUI SetTDLobbyLogic");
         return true;
      }
      
      private function initFeed() : void
      {
         if(stage.loaderInfo.parameters.sitetype == "qq" || stage.loaderInfo.parameters.sitetype == "weibo" || stage.loaderInfo.parameters.sitetype == "123u" || stage.loaderInfo.parameters.sitetype == "3366")
         {
            if(this.stTDFeedUI)
            {
               a_4657.getInstance().addListener(this.stTDFeedUI);
               this.mBridge.execute("setStage",this,this.stage);
            }
         }
      }
      
      public function a_3742(gameUIByteArray:ByteArray) : Boolean
      {
         if(null == gameUIByteArray || gameUIByteArray.length != 410)
         {
            trace("null == gameUIByteArray || gameUIByteArray.length != 410, failed");
            return false;
         }
         this.a_832 = gameUIByteArray;
         this.gameLoader = new Loader();
         this.gameLoader.cacheAsBitmap = false;
         this.gameLoader.visible = false;
         this.gameLoader.loadBytes(this.a_832,new LoaderContext(false,ApplicationDomain.currentDomain));
         return true;
      }
      
      public function a_2236(iServerID:int, iRoomID:int) : Loader
      {
         return this.gameLoader;
      }
      
      public function a_2237(iServerID:int, iRoomID:int) : Boolean
      {
         if(null == this.gameLoader)
         {
            trace("m_stGameLoaderArray[gameLoaderIndex] is null DisplayGameUI failed");
            return false;
         }
         this.gameLoader.scale9Grid = this.scale9Grid;
         this.gameLoader.visible = true;
         this.stTDTipDialog.content = GameStringManager.getInstance().getString(24633);
         this.stTDTipDialog.showTip(this,"",true,false,false,false);
         this.addChild(this.gameLoader);
         this.gameLoader.visible = true;
         return true;
      }
      
      public function a_2238(iServerID:int, iRoomID:int) : Boolean
      {
         var roomList:Array = null;
         var room:Object = null;
         this.isPlaying = false;
         stage.frameRate = 12;
         Mouse.cursor = MouseCursor.AUTO;
         var enterRoom:Object = a_2161.e.getEnterRoom();
         if(enterRoom != null)
         {
            enterRoom.m_szPassword = "";
         }
         if(enterRoom.m_isEnterMatch == 1 && this.stTDVSMatchUI != null)
         {
            (this.stTDVSMatchUI as ITDVSMatchUI).a_2238();
         }
         else if(enterRoom.m_isEnterMatch == 2 && this.stTDMoTaUI != null)
         {
            if(this.stTDMoTaUI != null && this.contains(this.stTDMoTaUI))
            {
               this.addChild(this.stTDMoTaUI);
               this.mBridge.execute("onDealGameReslut",this,null);
            }
         }
         else if(enterRoom.m_index == ROOM_ID_WORLD_BOSS_TRAIN)
         {
            roomList = a_2018.getInstance().a_791[19];
            room = roomList[0];
            if(room != null && room.index == 19)
            {
               enterRoom.m_index = ROOM_ID_WORLD_BOSS_LEVEL;
               this.a_2483(enterRoom.m_iServerID,room.iRoomID);
            }
         }
         else
         {
            this.InitialzeTDLobbyRoomUI();
         }
         if(this.stTDViliantUI != null && this.contains(this.stTDViliantUI as DisplayObject))
         {
            this.addChild(this.stTDViliantUI as DisplayObject);
         }
         if(this.stTDPetEntranceUI != null && this.contains(this.stTDPetEntranceUI))
         {
            this.addChild(this.stTDPetEntranceUI);
         }
         if(this.contains(this.gameLoader) && this.gameLoader.visible)
         {
            this.gameLoader.visible = false;
            this.removeChild(this.gameLoader);
         }
         this.a_3745();
         if(this.stTDPackageUI != null && this.contains(this.stTDPackageUI))
         {
            this.removeChild(this.stTDPackageUI);
         }
         if(this.storyGuideCondition != null && Boolean(this.storyGuideCondition["n_game"]))
         {
            this.storyGuideCondition["n_game"] = false;
            MeishiGuide.Instance.showStoryGuide(this.hasStoryGuide());
         }
         else if(!this.isStoryGuide)
         {
            this.storyGuideAnimationHandler();
         }
         this.showLevelAwardDialog();
         return true;
      }
      
      public function a_3762(data:Object) : void
      {
         var enterRoom:Object = null;
         if(data as Array)
         {
            if(!this.m_killClose)
            {
               enterRoom = a_2161.e.getEnterRoom();
               if(data[1] == EnmServerEntity.server_entity_logic)
               {
                  if(enterRoom.m_iLeaveRoom == false)
                  {
                     a_2036.getInstance().ConnectCloseType = 1;
                     this.a_3744(this.gsManager.getString(24737,[this.gsManager.getString(20481)]),this.m_szTiShi,true,true);
                     this.stTDTipDialog.addEventListener(a_3251.CLOSE,this.a_4550);
                  }
               }
               else if(data[1] == EnmServerEntity.server_entity_hall)
               {
                  a_2036.getInstance().ConnectCloseType = 2;
                  this.a_3744(this.gsManager.getString(24737,[this.gsManager.getString(20482)]),this.m_szTiShi,true,true);
                  this.stTDTipDialog.addEventListener(a_3251.CLOSE,this.a_4550);
               }
               else
               {
                  a_2036.getInstance().ConnectCloseType = 3;
                  this.a_3744(this.gsManager.getString(24737,[this.gsManager.getString(20482)]),this.m_szTiShi,true,true);
                  this.stTDTipDialog.addEventListener(a_3251.CLOSE,this.a_4550);
               }
            }
         }
         if(!(data as Array))
         {
            this.m_killClose = true;
            this.a_3744(data.toString(),this.m_szTiShi,true,false);
            this.stTDTipDialog.addEventListener(a_3251.CLOSE,this.a_4550);
         }
      }
      
      private function a_4550(a_4730:Event) : void
      {
         this.stTDTipDialog.removeEventListener(a_3251.CLOSE,this.a_4550);
         var objRefresh:Object = a_2047.getConfigData("Refresh");
         if(objRefresh == null)
         {
            return;
         }
         var refreshUrl:String = objRefresh.url;
         if(refreshUrl != null)
         {
            navigateToURL(new URLRequest("javascript:location.reload();"),"_self");
         }
      }
      
      public function a_3138(iServerID:int, iRoomID:int, iHeadTableID:int, iTailTableID:int) : Boolean
      {
         var szRoomName:String = null;
         var a_791:Array = null;
         var arrChannel:Array = null;
         var roomItem:Object = null;
         var trainDataEvent:a_1778 = null;
         var matchItem:Object = a_2020.getInstance().getMatchItemByID(iServerID,iRoomID);
         this.a_3745();
         var enterRoom:Object = a_2161.e.getEnterRoom();
         var sitDown:Object = a_2161.e.GetSitDown();
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         a_2161.e.GetMonthCardInfo(role.m_iRoleUin);
         if(enterRoom.m_index == ROOM_ID_MEI_SHI)
         {
            if((this.currentPosition & 0xF0) != 16)
            {
               this.currentPosition = 1;
            }
         }
         else if(enterRoom.m_index == ROOM_ID_HUO_SHAN)
         {
            this.currentPosition = 2;
         }
         else if(enterRoom.m_index == 2)
         {
            this.currentPosition = 3;
         }
         else if(enterRoom.m_index == 3)
         {
            this.currentPosition = 4;
         }
         else if(ROOM_ID_SKY_CASTLE == enterRoom.m_index)
         {
            this.currentPosition = 6;
         }
         else if(ROOM_ID_CROSS_SERVER == enterRoom.m_index)
         {
            this.currentPosition = 7;
         }
         else if(ROOM_ID_SEAFLOOR_WHIRLPOOL == enterRoom.m_index)
         {
            this.currentPosition = 8;
         }
         else if(ROOM_ID_SHUJIA_DESERT == enterRoom.m_index || ROOM_ID_EXPLORE_CAM == enterRoom.m_index || ROOM_ID_SNOW_THUNDERCITY == enterRoom.m_index || ROOM_ID_DESERT == enterRoom.m_index)
         {
            this.currentPosition = 9;
         }
         else if(ROOM_ID_OUTERSPACETAVEL == enterRoom.m_index)
         {
            this.currentPosition = 10;
         }
         else if(ROOM_ID_DIY_SERVER == enterRoom.m_index)
         {
            this.currentPosition = 20;
         }
         else if(ROOM_ID_WORLD_BOSS_LEVEL == enterRoom.m_index)
         {
            this.currentPosition == 21;
         }
         else if(ROOM_ID_WORLD_BOSS_TRAIN == enterRoom.m_index)
         {
            this.currentPosition == 22;
         }
         else if(ROOM_ID_EARTHCORE_EXPEDITION == enterRoom.m_index)
         {
            this.currentPosition = 23;
         }
         if(matchItem == null)
         {
            enterRoom.m_isEnterMatch = 0;
            this.a_1206.a_2397(iServerID,iRoomID);
            szRoomName = "";
            a_791 = a_2018.getInstance().a_791;
            for each(arrChannel in a_791)
            {
               for each(roomItem in arrChannel)
               {
                  if(roomItem.iServerID == iServerID && roomItem.iRoomID == iRoomID)
                  {
                     if(roomItem.index == ROOM_ID_MEI_SHI || roomItem.index == ROOM_ID_HUO_SHAN || roomItem.index == ROOM_ID_SKY_CASTLE || roomItem.index == ROOM_ID_SEAFLOOR_WHIRLPOOL || roomItem.index == ROOM_ID_SHUJIA_DESERT || roomItem.index == ROOM_ID_EXPLORE_CAM || roomItem.index == ROOM_ID_SNOW_THUNDERCITY || roomItem.index == ROOM_ID_DESERT || roomItem.index == ROOM_ID_OUTERSPACETAVEL || roomItem.index == ROOM_ID_EARTHCORE_EXPEDITION || roomItem.index == 3 || roomItem.index == ROOM_ID_CROSS_SERVER || roomItem.index == ROOM_ID_DIY_SERVER || roomItem.index == ROOM_ID_WORLD_BOSS_LEVEL || roomItem.index == ROOM_ID_WORLD_BOSS_TRAIN)
                     {
                        if(roomItem.iRoomID == 26)
                        {
                           enterRoom.m_iGameMode = a_1748.enmGameMode_vs;
                        }
                        else
                        {
                           enterRoom.m_iGameMode = a_1748.enmGameMode_vComputer;
                        }
                     }
                     else
                     {
                        enterRoom.m_iGameMode = a_1748.enmGameMode_vs;
                     }
                     szRoomName = roomItem.Text;
                     break;
                  }
               }
            }
            sitDown.a_820 = szRoomName;
            this.InitialzeTDLobbyRoomUI();
            enterRoom.m_iLeaveRoom = false;
            this.a_1206.a_2509(a_1750.enm_EnterRoomStatus);
            this.a_1206.a_2508();
            (this.stServerList as ITDServerList).setGameChannelList(a_791,iServerID,iRoomID,false);
            if(Boolean(this.m_stTDWorldBossLevel) && enterRoom.m_index == ROOM_ID_WORLD_BOSS_TRAIN)
            {
               trainDataEvent = new a_1778(EventType.REQUEST_WORLD_BOSS_GET_MAP_ID);
               a_1789.getInstance().dispatchEvent(trainDataEvent);
               this.removeChild(this.m_stTDWorldBossLevel);
               this.currentPosition = 1;
               a_2159.e.onPlayLobbyBgSound();
            }
            if(this.contains(this.stTDTownUI))
            {
               this.removeChild(this.stTDTownUI);
            }
            if(this.stTDVSMatchUI != null && this.contains(this.stTDVSMatchUI))
            {
               this.removeChild(this.stTDVSMatchUI);
            }
            if(this.stTDWorldMapUI != null && contains(this.stTDWorldMapUI))
            {
               this.removeChild(this.stTDWorldMapUI);
            }
            if(enterRoom.m_index == ROOM_ID_MEI_SHI && this.storyGuideCondition != null && Boolean(this.storyGuideCondition["n_meishi"]))
            {
               this.storyGuideCondition["n_meishi"] = false;
               MeishiGuide.Instance.showStoryGuide(this.hasStoryGuide());
            }
            else if(enterRoom.m_index == ROOM_ID_HUO_SHAN && this.storyGuideCondition != null && Boolean(this.storyGuideCondition["n_huoshan"]))
            {
               this.storyGuideCondition["n_huoshan"] = false;
               MeishiGuide.Instance.showStoryGuide(this.hasStoryGuide());
            }
            else if(enterRoom.m_index == ROOM_ID_SKY_CASTLE && this.storyGuideCondition != null && Boolean(this.storyGuideCondition["n_skycastle"]))
            {
               this.storyGuideCondition["n_skycastle"] = false;
               MeishiGuide.Instance.showStoryGuide(this.hasStoryGuide());
            }
            else if(enterRoom.m_index == ROOM_ID_SEAFLOOR_WHIRLPOOL && this.storyGuideCondition != null && Boolean(this.storyGuideCondition["n_seafloorWhirlpool"]))
            {
               this.storyGuideCondition["n_seafloorWhirlpool"] = false;
               MeishiGuide.Instance.showStoryGuide(this.hasStoryGuide());
            }
            if(enterRoom.m_index == ROOM_ID_MEI_SHI && this.menuOpenCondition != null && Boolean(this.menuOpenCondition["meishi"]))
            {
               this.menuOpenCondition["meishi"] = false;
               MeishiGuide.Instance.showMenuOpenAnimation(this.menuOpenCondition["id"]);
            }
            else if(enterRoom.m_index == ROOM_ID_HUO_SHAN && this.menuOpenCondition != null && Boolean(this.menuOpenCondition["huoshan"]))
            {
               this.menuOpenCondition["huoshan"] = false;
               MeishiGuide.Instance.showMenuOpenAnimation(this.menuOpenCondition["id"]);
            }
            else if(enterRoom.m_index == ROOM_ID_SKY_CASTLE && this.menuOpenCondition != null && Boolean(this.menuOpenCondition["skycastle"]))
            {
               this.menuOpenCondition["skycastle"] = false;
               MeishiGuide.Instance.showMenuOpenAnimation(this.menuOpenCondition["id"]);
            }
            else if(enterRoom.m_index == ROOM_ID_SEAFLOOR_WHIRLPOOL && this.menuOpenCondition != null && Boolean(this.menuOpenCondition["seafloorWhirlpool"]))
            {
               this.menuOpenCondition["seafloorWhirlpool"] = false;
               MeishiGuide.Instance.showMenuOpenAnimation(this.menuOpenCondition["id"]);
            }
            if(enterRoom.m_index == ROOM_ID_MEI_SHI && this.LevelUpCondition != null && Boolean(this.LevelUpCondition["meishi"]))
            {
               this.LevelUpCondition["meishi"] = false;
               MeishiGuide.Instance.showLevelUpAnimation(this.LevelUpCondition["id"]);
            }
            else if(enterRoom.m_index == ROOM_ID_HUO_SHAN && this.LevelUpCondition != null && Boolean(this.LevelUpCondition["huoshan"]))
            {
               this.LevelUpCondition["huoshan"] = false;
               MeishiGuide.Instance.showLevelUpAnimation(this.LevelUpCondition["id"]);
            }
            else if(enterRoom.m_index == ROOM_ID_SKY_CASTLE && this.LevelUpCondition != null && Boolean(this.LevelUpCondition["skycastle"]))
            {
               this.LevelUpCondition["skycastle"] = false;
               MeishiGuide.Instance.showLevelUpAnimation(this.LevelUpCondition["id"]);
            }
            else if(enterRoom.m_index == ROOM_ID_SEAFLOOR_WHIRLPOOL && this.LevelUpCondition != null && Boolean(this.LevelUpCondition["seafloorWhirlpool"]))
            {
               this.LevelUpCondition["seafloorWhirlpool"] = false;
               MeishiGuide.Instance.showLevelUpAnimation(this.LevelUpCondition["id"]);
            }
         }
         else
         {
            enterRoom.m_isEnterMatch = 1;
            enterRoom.m_iGameMode = a_1748.enmGameMode_vs;
            (this.stTDVSMatchUI as ITDVSMatchUI).a_3641(this.stTableReadyUI,iServerID,iRoomID);
         }
         if(Boolean(this.currentPosition == 7 && this.m_stTDCrossServerUI) && Boolean(this.m_stTDCrossServerUI.parent) && this.m_stTDCrossServerUI.parent != this)
         {
            addChild(this.m_stTDCrossServerUI);
         }
         return true;
      }
      
      public function a_3139() : Boolean
      {
         return true;
      }
      
      public function a_3743() : Boolean
      {
         this.stTDLobbyRoomUI.a_3735();
         if(this.stTDViliantUI)
         {
            this.stTDViliantUI.a_3735();
         }
         if(this.stTDActivityEntranceUI)
         {
            this.stTDActivityEntranceUI.a_3735();
         }
         if(this.m_stTDCrossServerUI)
         {
            (this.m_stTDCrossServerUI as ITDLobbyRoomUI).a_3735();
         }
         return true;
      }
      
      public function a_3744(szMessageContent:String, szTitleMessage:String = null, useMask:Boolean = true, showCloseBtn:Boolean = false, showSureBtn:Boolean = false, showCancelBtn:Boolean = false, autoHideDelay:int = -1) : Boolean
      {
         if(this.stTDTipDialog == null)
         {
            return false;
         }
         this.stTDTipDialog.removeEventListener(a_3251.CLOSE,this.a_4550);
         this.stTDTipDialog.content = szMessageContent;
         if(null != stage)
         {
            this.stTDTipDialog.showTip(stage,szTitleMessage,useMask,showCloseBtn,showSureBtn,showCancelBtn,autoHideDelay);
         }
         else
         {
            this.stTDTipDialog.showTip(this,szTitleMessage,useMask,showCloseBtn,showSureBtn,showCancelBtn,autoHideDelay);
         }
         return true;
      }
      
      public function a_3745() : void
      {
         if(this.stTDTipDialog == null)
         {
            return;
         }
         this.stTDTipDialog.hideTip();
      }
      
      public function a_3746() : Boolean
      {
         if(null != this.stTDEnterUI)
         {
            this.stTDEnterUI.a_3639(this);
            this.addChild(this.stTDEnterUI as DisplayObject);
         }
         return true;
      }
      
      public function a_3747(iServerID:int, iRoomID:int) : Boolean
      {
         var showDentityCard:Boolean = false;
         var dictDesc:Dictionary = null;
         var tip:Object = null;
         var szName:String = null;
         var currentRole:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         BlueDiamondInfo.getInstance().stageInfo = stage.loaderInfo.parameters;
         (this.stTDRoomUserUI as Object).roomAvatar.requestInfo();
         if(Boolean(stage) && stage.loaderInfo.parameters.sitetype == "qqgame")
         {
            this.requestBlueDiamondInfo();
         }
         if(this.b_213)
         {
            this.a_1206.RequestTransferClientLog(5,currentRole.m_szRoleName + "," + currentRole.m_iRoleUin);
         }
         if(stage != null && this.stTDLoaderUI != null && stage.contains(this.stTDLoaderUI))
         {
            stage.removeChild(this.stTDLoaderUI);
            if(stage.loaderInfo.parameters.sitetype == "3366")
            {
               dictDesc = a_2027.getInstance().m_dictDesc;
               for each(tip in dictDesc)
               {
                  szName = tip.Name;
                  tip.Name = szName.replace("黄钻","蓝钻");
               }
            }
         }
         this.addChild(this.stTDTownUI);
         var enterRoom:Object = a_2161.e.getEnterRoom();
         enterRoom.m_iLeaveRoom = true;
         enterRoom.m_iServerID = 1;
         enterRoom.m_iUpServerID = -1;
         enterRoom.m_iUpRoomeID = -1;
         iServerID = currentRole.m_iLogicServerID == 0 ? 1 : 1;
         iRoomID = currentRole.m_iRoomID;
         var item:Object = a_2018.getInstance().getRoomItem(iRoomID,iServerID);
         if(item != null)
         {
            iServerID = int(item.iServerID);
            iRoomID = int(item.iRoomID);
            enterRoom.m_iRoomID = iRoomID;
            enterRoom.m_index = item.index;
         }
         else
         {
            enterRoom.m_index = 0;
            enterRoom.m_iRoomID = 0;
         }
         this.a_1206.a_2488(1,0);
         this.m_killClose = false;
         if(this.contains(this.stTDLobbyRoomUI as DisplayObject))
         {
            this.removeChild(this.stTDLobbyRoomUI as DisplayObject);
         }
         if(this.contains(this.stTDRoomUserUI))
         {
            this.removeChild(this.stTDRoomUserUI);
         }
         if(this.stTDVSMatchUI != null && this.contains(this.stTDVSMatchUI))
         {
            this.removeChild(this.stTDVSMatchUI);
         }
         if(this.contains(this.stTDEnterUI as DisplayObject))
         {
            this.removeChild(this.stTDEnterUI as DisplayObject);
         }
         if(this.stTDChooseChannelUI != null && this.contains(this.stTDChooseChannelUI))
         {
            this.removeChild(this.stTDChooseChannelUI);
         }
         this.a_3745();
         (this.stServerList as ITDServerList).setGameChannelList(a_2018.getInstance().a_791,iServerID,iRoomID,true);
         this.addChild(this.stTDMenuUI as DisplayObject);
         this.addChild(this.stServerList);
         if(this.stTDRoomUserUI != null)
         {
            (this.stTDRoomUserUI as Object).showAvatarView(this,enterRoom.m_index);
         }
         this.addRightMenu();
         trace(stage.loaderInfo.parameters.guide_3366);
         if(stage.loaderInfo.parameters.guide_3366 == "3366")
         {
            this.AddGuide3366UI();
         }
         this.addChild(this.stTDGameIMUI);
         this.mBridge.execute("onInitialzeGameIMData",this,EnmGameIM.a_511);
         if(this.consortiaIsOpen)
         {
            this.RequestJoinConsortiaInfo();
         }
         this.a_1206.a_2509(a_1750.enm_OnlineStatus);
         PetDataHandler.GetInstance();
         if(currentRole.m_iGamePoint >= 6000)
         {
            MailHandler.Get().OnCRequestUpdatePlayerMailList();
         }
         var siteType:String = stage.loaderInfo.parameters.sitetype == null ? "" : stage.loaderInfo.parameters.sitetype;
         if(siteType == "4399")
         {
            if((stage.loaderInfo.parameters.fcm == 0 || stage.loaderInfo.parameters.fcm == 2) && stage.loaderInfo.parameters.prove_gift == 0)
            {
               showDentityCard = true;
            }
            else if(stage.loaderInfo.parameters.fcm == 1)
            {
               showDentityCard = true;
            }
            else
            {
               showDentityCard = false;
            }
         }
         else
         {
            showDentityCard = false;
         }
         if(showDentityCard)
         {
         }
         return true;
      }
      
      public function a_2350(objResult:Object) : Boolean
      {
         if(null != DisplayObject(this.stTDEnterUI).parent)
         {
            this.stTDEnterUI.a_3720(objResult);
         }
         if(null != this.stTDConsortiaUI && this == this.stTDConsortiaUI.parent)
         {
            this.mBridge.execute("OnResponseGetRoleUinByName",this,objResult);
         }
         if(null != this.stTDMailUI && this == this.stTDMailUI.parent)
         {
            a_2156.e.onCheckRoleName(objResult);
         }
         if(null != this.stTDFriendUI && this == this.stTDFriendUI.parent)
         {
            a_2156.e.onCheckRoleName(objResult);
         }
         return true;
      }
      
      public function a_2349(roleInfo:Object) : Boolean
      {
         return true;
      }
      
      public function a_2562(buyGoods:Object) : Boolean
      {
         var bAsPresent:Boolean = false;
         if(buyGoods.m_nResultID == 0)
         {
            bAsPresent = false;
            if(buyGoods.m_iDstRoleUin != buyGoods.m_iSrcRoleUin)
            {
               bAsPresent = true;
            }
            LobbyEventManager.Get().dispatchEvent(new PlayerConsumeEvent(buyGoods.m_iCommodityCoinPrice,buyGoods.m_iCommodityCharmPrice,bAsPresent));
            if(this.stTDStoreUI != null && (this.stTDStoreUI as DisplayObject).visible)
            {
               if(this.m_iStoreType == 1)
               {
                  LobbyEventManager.Get().dispatchEvent(new FriendSystemEvent(a_4514.a_708));
               }
            }
         }
         if(this.stTDStoreUI != null && (this.stTDStoreUI as DisplayObject).visible)
         {
            this.stTDStoreUI.a_3779(buyGoods);
            return true;
         }
         a_1825.e.OnBuyGoodsResponse(buyGoods);
         return true;
      }
      
      public function a_3748(status:int) : Boolean
      {
         var taskData:Vector.<a_4517> = a_2161.e.GetTasks() as Vector.<a_4517>;
         var a_4730:Event = new TaskUpdateEvent(taskData);
         LobbyEventManager.Get().dispatchEvent(a_4730);
         if(status == a_1756.enm_TaskCompleteStatus || status == a_1756.enm_TaskOpenedStatus)
         {
            if(this.stTDTaskUI == null || !this.contains(this.stTDTaskUI))
            {
               a_2158.e.notifyTaskTip(status);
            }
         }
         this.storyGuideAnimationHandler();
         LobbyEventManager.Get().dispatchEvent(new AchievementsUpdateEvent(a_2161.e.GetRoleAchievements() as Array));
         return true;
      }
      
      public function a_3749(iTaskID:int, iStatus:int) : Boolean
      {
         if(iStatus == a_1756.enm_TaskCompleteStatus)
         {
            a_2158.e.notifyTaskTip(iStatus);
            LobbyEventManager.Get().dispatchEvent(new LocalTaskEvents(LocalTaskEvents.a_716,iTaskID));
         }
         if(iStatus == a_1756.enm_TaskOpenedStatus)
         {
         }
         return true;
      }
      
      public function a_3750(getTaskAward:Object) : Boolean
      {
         if(getTaskAward.m_nResultID == 0 || getTaskAward.m_nResultID == 1)
         {
            this.GuideAnimationHandler(getTaskAward.m_iTaskID);
            a_2169.e.onGetTaskAwards(getTaskAward);
            if(getTaskAward.m_uiConistraPoint > 0)
            {
               LobbyEventManager.Get().dispatchEvent(new FriendSystemEvent(7,getTaskAward.m_uiConistraPoint));
            }
         }
         return true;
      }
      
      public function a_3751(beAddFriend:Object) : Boolean
      {
         a_2158.e.notifyFriendTip(true);
         return true;
      }
      
      public function a_2569(addFriend:Object) : void
      {
         LobbyEventManager.Get().dispatchEvent(new FriendSystemEvent(a_4514.a_704));
         this.textTip = this.GetMessageTip();
         this.textTip.showTextTip(this,this.gsManager.getString(65944),new Rectangle());
      }
      
      public function a_2570(msg:Object) : void
      {
         this.textTip = this.GetMessageTip();
         this.textTip.showTextTip(this,this.gsManager.getString(65945),new Rectangle());
      }
      
      public function a_3752(isUpdateSuccess:Boolean, updateFavourite:Object) : Boolean
      {
         return true;
      }
      
      public function a_2173(message:String, iType:int) : Boolean
      {
         return true;
      }
      
      public function OnBigSpeakerError(obj:Object) : void
      {
      }
      
      public function a_3753(obj:Object) : void
      {
         LobbyEventManager.Get().dispatchEvent(new SendDalabaEvent(1));
      }
      
      public function a_3755(result:Object) : void
      {
         var iItem:Object = null;
         var useCard:Object = null;
         if(this.stTDVSMatchUI != null && this.contains(this.stTDVSMatchUI))
         {
            (this.stTDVSMatchUI as ITDVSMatchUI).a_2132(result);
         }
         this.mBridge.execute("onDealGameReslut",this,result);
         var currentRole:Object = a_2161.e.GetCurrentRole();
         result.iMySex = currentRole.m_iUserSex;
         result.iZhenxingtu = 0;
         var arrUserCards:Array = result.arrUserCard;
         for each(iItem in currentRole.m_arrHeroItemID)
         {
            useCard = new Object();
            useCard.m_iPlayerCardID = iItem.m_iItemID;
            useCard.m_nUsedCount = iItem.m_nItemCount;
            arrUserCards.push(useCard);
         }
         LobbyEventManager.Get().dispatchEvent(new GameResultEvent(result));
         if(result.iWin == 1 && result.byRoundStep == 3)
         {
            if(this.stTDFeedUI)
            {
               this.send3366Feed(ConstFeed.KILLBOSS_SIN,currentRole.m_szRoleName);
               setTimeout(this.mBridge.execute,5000,"sendFeed",this,ConstFeed.TYPE_BOSS,result.iBossID,result.iTeamMateSex,result.iMySex,result.iMyLevel);
            }
         }
         if(result.iWin == 1)
         {
            a_4814.Get().a_3014(stage);
            a_4814.Get().a_2201(result.iMapID,result.nGradeScore);
         }
         if(result.iMapID == 3)
         {
            SendCountInfoHandle.Get().SendLog(5003);
         }
         else if(result.iMapID == 1)
         {
            SendCountInfoHandle.Get().SendLog(6001);
         }
         else if(result.iMapID == 257)
         {
            SendCountInfoHandle.Get().SendLog(6002);
         }
         else if(result.iMapID == 514)
         {
            SendCountInfoHandle.Get().SendLog(6003);
         }
         else if(result.iMapID == 513)
         {
            SendCountInfoHandle.Get().SendLog(6004);
         }
         else if(result.iMapID == 769)
         {
            SendCountInfoHandle.Get().SendLog(6005);
         }
         else if(result.iMapID == 2562)
         {
            SendCountInfoHandle.Get().SendLog(6006);
         }
         else if(result.iMapID == 2563)
         {
            SendCountInfoHandle.Get().SendLog(6007);
         }
         else if(result.iMapID == 2)
         {
            SendCountInfoHandle.Get().SendLog(6008);
         }
         else if(result.iMapID == 521)
         {
            SendCountInfoHandle.Get().SendLog(6009);
         }
      }
      
      public function a_3756() : void
      {
         this.stTDTipDialog.content = GameStringManager.getInstance().getString(132433);
         this.stTDTipDialog.showTip(stage,this.m_szTiShi,true,true);
      }
      
      public function a_2098() : void
      {
         this.m_isGaming = false;
      }
      
      public function a_2088() : void
      {
         this.m_isGaming = true;
         this.isPlaying = true;
      }
      
      private function compareLevel(iGamePoint:Number, iEndGamePoint:Number, iVsExp:int, iEndVsExp:int) : void
      {
         var iLevel:int = 0;
         var size:int = 0;
         var index:int = 0;
         var currentRole:Object = null;
         var level:int = 0;
         var myGender:int = 0;
         a_4648.a_4649("iGamePoint=" + iGamePoint + ",iEndGamePoint=" + iEndGamePoint + ",iVsExp=" + iVsExp + ",iEndVsExp=" + iEndVsExp);
         var vc:Object = a_2033.getInstance().getGameLevel(iGamePoint);
         var vcEnd:Object = a_2033.getInstance().getGameLevel(iEndGamePoint);
         var vs:Object = a_2033.getInstance().getVsLevel(iVsExp);
         var vsEnd:Object = a_2033.getInstance().getVsLevel(iEndVsExp);
         if(vc.iLevel != vcEnd.iLevel)
         {
            iLevel = int(vcEnd.iLevel);
            if(7 == iLevel || 15 == iLevel || 20 == iLevel || 25 == iLevel || 31 == iLevel)
            {
               this.send3366Feed(ConstFeed.AVATOR_LEVEL,iLevel.toString());
            }
            this.levelData = vcEnd;
            size = vcEnd.iLevel + 1;
            for(index = vc.iLevel + 1; index < size; index++)
            {
               this.a_1206.a_2503(285212672,index);
            }
            currentRole = a_2161.e.GetCurrentRole();
            a_1825.e.onNotifyRoleChange(currentRole as a_4463);
            this.a_1206.a_2500();
            LobbyEventManager.Get().dispatchEvent(new LevelUpEvent(vcEnd.iLevel,vsEnd.iLevel));
            a_1825.e.onRoleLevelChange(vcEnd.iLevel);
            if(this.stTDFeedUI)
            {
               level = parseInt(vcEnd.iLevel);
               myGender = int(a_2161.e.GetCurrentRole().m_iUserSex);
               setTimeout(this.mBridge.execute,3000,"sendFeed",this,ConstFeed.TYPE_LEVEL,level,myGender);
            }
            if(3 == iLevel || 5 == iLevel || 10 == iLevel)
            {
               this.send360Regidit(iLevel + 100);
            }
         }
         if(vs.iLevel != vsEnd.iLevel)
         {
            LobbyEventManager.Get().dispatchEvent(new LevelUpEvent(vcEnd.iLevel,vsEnd.iLevel));
            a_1825.e.onRoleLevelChange(vcEnd.iLevel);
         }
      }
      
      private function send360Regidit(type:int = 0) : Boolean
      {
         if(stage != null && stage.loaderInfo.parameters.sitetype == "360" && stage.loaderInfo.parameters.is_normal_login == 0)
         {
            if(ExternalInterface.available)
            {
               ExternalInterface.marshallExceptions = true;
               try
               {
                  ExternalInterface.call("register_360_account",stage.loaderInfo.parameters.sig_user,0,type);
                  return true;
               }
               catch(e:Error)
               {
               }
            }
         }
         return false;
      }
      
      public function a_3757(iRoleScore:int) : void
      {
         var currentRole:Object = a_2161.e.GetCurrentRole();
         currentRole.m_iRoleScore = iRoleScore;
         this.m_iRoleScore = iRoleScore;
      }
      
      public function a_3143(updateGameData:Object) : void
      {
         var currentRole:Object = null;
         var iGamePoint:Number = NaN;
         var iEndGamePoint:Number = NaN;
         var iVsExp:int = 0;
         var iEndVsExp:int = 0;
         var enterRoom:Object = null;
         if(updateGameData.m_nGameID != -1)
         {
            currentRole = a_2161.e.GetCurrentRole();
            iGamePoint = Number(currentRole.m_iGamePoint);
            iEndGamePoint = Number(updateGameData.m_iGamePoint);
            iVsExp = int(currentRole.m_iVsExp);
            iEndVsExp = int(updateGameData.m_iExperiencePoint);
            currentRole.m_iVsExp = iEndVsExp;
            currentRole.m_iGamePoint = iEndGamePoint;
            this.compareLevel(iGamePoint,iEndGamePoint,iVsExp,iEndVsExp);
            if(!this.m_isGaming && this.stTDRoomUserUI != null)
            {
               enterRoom = a_2161.e.getEnterRoom();
               (this.stTDRoomUserUI as Object).showAvatarView(null,enterRoom.m_index);
            }
         }
      }
      
      public function a_3758(responseGetPlayerMail:Object) : void
      {
      }
      
      public function a_3759(responseUpdatePlayerMail:Object) : void
      {
      }
      
      public function a_3760(arrUpdateMail:Array) : void
      {
      }
      
      public function a_3761(responseFetchMailAccessory:Object) : void
      {
      }
      
      public function a_2578(arrRoomUserView:Array) : void
      {
         if(this.stTDLobbyRoomUI != null && this.contains(this.stTDLobbyRoomUI as DisplayObject))
         {
            (this.stTDRoomUserUI as Object).a_3738();
         }
      }
      
      public function a_2579(playerCount:Object) : void
      {
         var roomItem:Object = null;
         if(this.stServerList != null)
         {
            (this.stServerList as ITDServerList).showChannelStatus(playerCount);
         }
         a_2018.getInstance().updateHotGameList(playerCount);
         var enterRoom:Object = a_2161.e.getEnterRoom();
         if(enterRoom.iGetPlayerNum == 1)
         {
            if(!a_2018.getInstance().compareRoomID(enterRoom.m_iRoomID,enterRoom.m_iServerID))
            {
               roomItem = a_2018.getInstance().getNewPlayerRoomID(0);
               enterRoom.m_iServerID = roomItem.iServerID;
               enterRoom.m_iRoomID = roomItem.iRoomID;
               enterRoom.m_index = 0;
            }
            a_4648.a_4649("serverid=" + enterRoom.m_iServerID + "," + enterRoom.m_iRoomID);
            enterRoom.iGetPlayerNum = 0;
            this.a_1206.a_2483(enterRoom.m_iServerID,enterRoom.m_iRoomID);
         }
      }
      
      public function a_3763(arrAchieves:Object) : void
      {
         if(arrAchieves != null && Boolean(arrAchieves as Array))
         {
            a_2170.e.showAchievements(arrAchieves as Array);
         }
      }
      
      public function a_2586(arrAchieves:Object) : void
      {
         LobbyEventManager.Get().dispatchEvent(new AchievementsUpdateEvent(arrAchieves as Array));
      }
      
      public function a_3764(data:Object) : void
      {
         a_4482.Get().a_3895(this.taskServer);
         a_3168.getInstance().update(data as Array);
         LobbyEventManager.Get().dispatchEvent(new a_1790());
      }
      
      public function a_2595(data:Object) : void
      {
         a_3168.getInstance().update(data as Array);
      }
      
      public function a_2596(data:Object) : void
      {
         a_3168.getInstance().accomplishItem(Number(data));
         LobbyEventManager.Get().dispatchEvent(new a_1790());
         if(this.m_newGuide)
         {
         }
         if(this.achiItemTip == null)
         {
            this.achiItemTip = this.stTDComponentUI.a_3719();
         }
         if(this.contains(this.gameLoader))
         {
            this.achiItemTip.y = 280;
         }
         else
         {
            this.achiItemTip.y = 180;
         }
         this.achiItemTip.x = 240;
         this.addChild(this.achiItemTip as DisplayObject);
         this.achiItemTip.update(Number(data));
         setTimeout(this.removeAchiTip,10000);
      }
      
      private function removeAchiTip() : void
      {
         if(this.achiItemTip != null && this.contains(this.achiItemTip as DisplayObject))
         {
            this.removeChild(this.achiItemTip as DisplayObject);
         }
      }
      
      public function a_3765(data:Object) : void
      {
         a_2170.e.showOtherAvatar(data);
         if((data.m_byShowCard & a_1749.enmGameRole_ShowCard) == a_1749.enmGameRole_ShowCard)
         {
            this.a_1206.a_2512(data.m_iSrcUin);
         }
         else
         {
            a_2170.e.showCardPackageCards([]);
         }
         a_2170.e.showSkillBookDataProvider([],false);
      }
      
      public function a_2588(iRoleUin:int, data:Object) : void
      {
         a_2170.e.showDefPackageDataProvider(iRoleUin,data.m_arrCardInfos);
         a_2170.e.showSkillBookDataProvider(data.m_arrSkillInfos,false);
      }
      
      public function a_3142(data:Object) : void
      {
         var enterRoom:Object = null;
         var currRole:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         if(currRole.m_iRoleUin != data.m_iUin)
         {
            a_2170.e.showWin(data);
         }
         if(!this.m_isGaming && this.stTDRoomUserUI != null)
         {
            enterRoom = a_2161.e.getEnterRoom();
            (this.stTDRoomUserUI as Object).showAvatarView(null,enterRoom.m_index);
         }
      }
      
      public function onNotifyUseService(arrUseService:Array) : void
      {
         var service:Object = null;
         var time:int = 0;
         var date:Date = null;
         var str:String = null;
         var tip:String = null;
         var msg:String = null;
         var systemTime:int = a_1767.getInstance().SystemTime;
         for each(service in arrUseService)
         {
            time = service.m_iExpireTime - systemTime;
            date = new Date();
            date.time = service.m_iExpireTime * 1000;
            str = date.fullYear.toString() + "-" + (date.month + 1).toString() + "-" + date.date.toString() + " " + date.hours.toString() + ":" + date.minutes;
            if(time > 0)
            {
               tip = this.gsManager.getString(131080,[this.gsManager.getString(service.m_iServiceID),str]);
               msg = IMUtil.sendMsgFormat({
                  "tag":EnmGameIM.a_509,
                  "msg":tip
               });
               this.mBridge.execute("onSystemMessageNotify",this,msg);
            }
         }
      }
      
      public function a_3766(data:Object) : void
      {
         var tip:String = null;
         var msg:String = null;
         if(data.m_nResultID == 0)
         {
            tip = this.gsManager.getString(131081,[this.gsManager.getString(data.m_iID)]);
            msg = IMUtil.sendMsgFormat({
               "tag":EnmGameIM.a_509,
               "msg":tip
            });
            this.mBridge.execute("onSystemMessageNotify",this,msg);
         }
      }
      
      public function a_3767(data:Object) : void
      {
         this.textTip = this.GetMessageTip();
         if(data.m_nResultID == 0)
         {
            this.textTip.showTextTip(stage,this.gsManager.getString(131083),new Rectangle());
            LobbyEventManager.Get().dispatchEvent(new LocalTaskEvents(LocalTaskEvents.a_714,data.m_iID));
         }
         else
         {
            this.textTip.showTextTip(stage,data.m_szReasonMessage,new Rectangle());
         }
      }
      
      public function a_3768(data:Object) : void
      {
         if(this.stTDPackageUI != null)
         {
            a_1825.e.onNotifyUseSkillBook(data);
         }
      }
      
      public function a_2599(data:Object) : void
      {
         if(data.m_nResultID == 0)
         {
            if(this.upAwardDialog == null)
            {
               this.upAwardDialog = this.stTDComponentUI.a_3718();
            }
            this.addChild(this.upAwardDialog);
            (this.upAwardDialog as IUpAwardsDialog).showPreciousBox(data);
            this.upAwardDialog.x = 100;
            this.upAwardDialog.y = 170;
         }
         this.m_stOpenEvent = new a_1778(EventType.OnceKeyOpen);
         this.m_stOpenEvent.dataObject = data;
         setTimeout(this.dispatch,1000);
      }
      
      public function a_2600(data:Object) : void
      {
         if(data.m_nResultID == 0)
         {
            if(data.m_iID == 324665360 || data.m_iID == 324665376 || data.m_iID == 324665392 || data.m_iID == 324665408)
            {
               MessageTipHandler.Get().a_3146("使用成功");
            }
            if(this.giftBoxDialog == null)
            {
               this.giftBoxDialog = this.stTDComponentUI.a_3716();
            }
            this.addChild(this.giftBoxDialog);
            (this.giftBoxDialog as IGameGiftBoxDialog).showGiftDetail(data);
         }
         else if(data.m_szReasonMessage != "")
         {
            MessageTipHandler.Get().a_3146(data.m_szReasonMessage);
         }
         this.m_stOpenEvent = new a_1778(EventType.OnceKeyOpen);
         this.m_stOpenEvent.dataObject = data;
         setTimeout(this.dispatch,1000);
      }
      
      private function dispatch() : void
      {
         a_1789.getInstance().dispatchEvent(this.m_stOpenEvent);
      }
      
      public function OnShowSendFlowerDialog(dst:Object) : void
      {
         if(!this.m_stSendFlowerDialog)
         {
            this.m_stSendFlowerDialog = this.stTDComponentUI.GetSendFlowersDialog();
            this.m_stSendFlowerDialog.x = 270;
            this.m_stSendFlowerDialog.y = 130;
         }
         (this.m_stSendFlowerDialog as ISendFlowerDialog).Recipient(dst);
         this.addChild(this.m_stSendFlowerDialog);
      }
      
      public function a_2593(data:Object) : void
      {
         if(this.stTDVSMatchUI != null && this.contains(this.stTDVSMatchUI))
         {
            (this.stTDVSMatchUI as ITDVSMatchUI).a_2593(data);
         }
      }
      
      public function OnMiBaoKuGameData(data:Object) : void
      {
         MiShiProtocal.getInstance().a_1842(data.m_iRoomID,data.m_szGameData);
      }
      
      public function a_3739(roleName:String, sex:int) : Boolean
      {
         this.a_3744(GameStringManager.getInstance().getString(24634),"",true);
         return this.a_1206.a_2492(roleName,sex);
      }
      
      public function RequestSelectUserRoleEnter(role:Object) : void
      {
         this.m_iRoleScore = role.m_iRoleScore;
         var currentRole:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         currentRole.m_iLogicServerID = role.m_iLogicServerID;
         currentRole.m_iRoomID = role.m_iRoomID;
         this.a_3747(role.m_iLogicServerID,role.m_iRoomID);
      }
      
      public function RequestCheckUserRoleName(roleName:String) : Boolean
      {
         return this.a_1206.a_2494(roleName);
      }
      
      public function a_3740(iUin:int) : void
      {
         this.a_1206.a_2495(iUin);
      }
      
      public function a_2365(dstRole:Object, arrGoods:Array) : void
      {
         this.a_1206.a_2499(dstRole,arrGoods);
      }
      
      public function RequestAddFriend(friendDatas:Object) : void
      {
         var iGamePoint:Number = NaN;
         var level:Object = null;
         var dict:Dictionary = a_2161.e.GetPositiveFriends() as Dictionary;
         var friend:Object = null;
         if(dict != null)
         {
            friend = dict[friendDatas.m_iRoleUin];
         }
         this.textTip = this.GetMessageTip();
         if(friend == null)
         {
            iGamePoint = Number(friendDatas.m_iGamePoint);
            level = a_2033.getInstance().getGameLevel(iGamePoint);
            if(Number(level.iLevel) == 1)
            {
               this.textTip.showTextTip(this,this.gsManager.getString(65946),new Rectangle());
            }
            else
            {
               this.a_1206.a_2505(friendDatas);
            }
         }
         else
         {
            this.textTip.showTextTip(this,this.gsManager.getString(65947,[friend.m_szRoleName]),new Rectangle());
         }
      }
      
      public function RequestPlayerGetTaskAward(taskID:int, select:int) : void
      {
         this.a_1206.a_2503(taskID,select);
      }
      
      public function onUpdateHeroInfo(dictUpdateInfo:Dictionary) : void
      {
         if(dictUpdateInfo != null)
         {
            this.a_1206.a_2507(dictUpdateInfo);
         }
      }
      
      public function RequestTransferClientLog(iType:int, log:String) : void
      {
         this.a_1206.RequestTransferClientLog(iType,log);
      }
      
      public function a_3741() : void
      {
         if(this.stTDStoreUI != null && this.contains(this.stTDStoreUI as DisplayObject))
         {
            this.removeChild(this.stTDStoreUI as DisplayObject);
            (this.stTDStoreUI as DisplayObject).visible = false;
            this.addChild(this.stTDMenuUI as DisplayObject);
         }
      }
      
      public function onGameReadyCardMove() : void
      {
      }
      
      public function onGameReadyAddStage() : void
      {
         if(this.contains(this.stTDLobbyRoomUI as DisplayObject))
         {
            this.removeChild(this.stTDLobbyRoomUI as DisplayObject);
         }
         if(this.contains(this.stTDRoomUserUI))
         {
            this.removeChild(this.stTDRoomUserUI);
         }
      }
      
      public function onGameAccountEnd() : void
      {
         this.isPlaying = false;
         this.showLevelAwardDialog();
         if(this.storyGuideCondition != null && Boolean(this.storyGuideCondition["n_game"]))
         {
            this.storyGuideCondition["n_game"] = false;
            MeishiGuide.Instance.showStoryGuide(this.hasStoryGuide());
         }
         else
         {
            this.storyGuideAnimationHandler();
         }
      }
      
      public function onStartNewGuideLoader() : void
      {
         if(this.m_newGuide)
         {
         }
      }
      
      public function onEndNewGuideLoader() : void
      {
         if(this.m_newGuide)
         {
         }
      }
      
      public function onClosePackageUI(arrUpdateCardPositions:Array, arrUpdateHeroCardPositions:Array, dictUpdateHero:Dictionary) : void
      {
         var groupSize:int = 0;
         var groupCont:int = 0;
         var postArr:Array = null;
         var lessArr:Array = null;
         var i:int = 0;
         var lessGrop:int = 0;
         if(arrUpdateCardPositions != null && arrUpdateCardPositions.length > 0)
         {
            groupSize = 400;
            groupCont = Math.floor(arrUpdateCardPositions.length / groupSize);
            for(i = 0; i < groupCont; i++)
            {
               postArr = arrUpdateCardPositions.slice(i * groupSize,(i + 1) * groupSize);
               this.a_1206.a_2354(postArr);
            }
            lessGrop = arrUpdateCardPositions.length % groupSize;
            lessArr = arrUpdateCardPositions.slice(arrUpdateCardPositions.length - lessGrop,arrUpdateCardPositions.length);
            this.a_1206.a_2354(lessArr);
         }
         if(arrUpdateHeroCardPositions != null && arrUpdateHeroCardPositions.length > 0)
         {
            this.a_1206.a_2497(arrUpdateHeroCardPositions);
         }
         if(dictUpdateHero != null)
         {
            this.a_1206.a_2507(dictUpdateHero);
         }
         if(this.contains(this.stTDPackageUI))
         {
            this.removeChild(this.stTDPackageUI);
         }
      }
      
      public function onUpdateCardData(arrUpdateTDCards:Array, iUpdateMode:int) : void
      {
         this.a_1206.a_2359(arrUpdateTDCards,iUpdateMode);
      }
      
      public function onGameGuideStart() : void
      {
         if(this.contains(this.stTDTownUI))
         {
            this.removeChild(this.stTDTownUI);
         }
      }
      
      public function onGuideBattleEnd() : void
      {
         var enterRoom:Object = a_2161.e.getEnterRoom();
         this.a_1206.a_2488(enterRoom.m_iServerID,0);
         var a_1660:Object = a_2161.e.GetCurrentRole();
         stage.frameRate = 12;
         Mouse.cursor = MouseCursor.AUTO;
         addChild(this.stTDTownUI);
         addChild(this.stTDMenuUI as DisplayObject);
         addChild(this.stTDGameIMUI);
         addChild(this.stServerList);
         if(this.stTDRoomUserUI != null)
         {
            (this.stTDRoomUserUI as Object).showAvatarView(this,enterRoom.m_index);
         }
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         this.a_1206.a_2501(285212672);
         this.a_1206.a_2502(285212672);
         var iSelect:int = 0;
         var isYellowGem:Boolean = false;
         isYellowGem = Boolean(enterRoom.m_isYellowGem);
         var select:int = a_1660.m_iUserSex == 1 ? -1 : 0;
         iSelect = a_1660.m_iUserSex == 1 ? -1 : 0;
         if(isYellowGem)
         {
            iSelect = a_1660.m_iUserSex == 1 ? -3 : -2;
         }
         this.a_1206.a_2503(285212672,iSelect);
         this.a_1206.RequestTransferClientLog(0,"x4-1,请求添加战斗新手引导后的卡片|" + select);
         a_2159.e.onPlayLobbyBgSound();
         if(stage.contains(this.stTDLoadDialog))
         {
            stage.removeChild(this.stTDLoadDialog);
         }
         if(stage != null)
         {
            if(stage.contains(this.stTDNewGuideUI as DisplayObject))
            {
               stage.removeChild(this.stTDNewGuideUI as DisplayObject);
            }
         }
         if(this.storyGuideCondition != null && Boolean(this.storyGuideCondition["n_fight"]))
         {
            this.storyGuideCondition["n_fight"] = false;
            MeishiGuide.Instance.showStoryGuide(this.hasStoryGuide());
         }
      }
      
      public function onSitDownMapID(iGameMapID:int) : void
      {
         this.a_1206.a_2485(-1,-1,-1,0,"新手战斗","",[iGameMapID],a_1748.enmGameMode_vComputer);
      }
      
      public function onNewGuideEnterRoom() : void
      {
         this.a_2483(-1,-1);
      }
      
      public function onNewGuideCloseTaskUI() : void
      {
         if(this.stTDTaskUI != null && this == this.stTDTaskUI.parent)
         {
            this.removeChild(this.stTDTaskUI);
         }
         if(this.levelAwardDialog != null && this.levelAwardDialog.parent != null)
         {
            this.levelAwardDialog.parent.removeChild(this.levelAwardDialog);
         }
      }
      
      public function DDmOpenTaskUI() : void
      {
         this.showCilckedTarget(this.stTDTaskUI,"TDTaskUI",this.gsManager.getString(4400),this.a_4563);
      }
      
      public function DDmOpenMarginTreeUI() : void
      {
         this.showCilckedTarget(this.stTDNewMarginTreeUI,"TDNewMarginTreeUI",this.gsManager.getString(4395),this.InitialzestTDNewMarginTreeUI);
      }
      
      public function onRennewCardPayTip(cardAttr:a_3228, image:Bitmap) : void
      {
         if(this.renewTipDailog == null)
         {
            this.renewTipDailog = this.stTDComponentUI.a_3714();
         }
         this.addChild(this.renewTipDailog);
         this.renewTipDailog.visible = true;
         var iCoinPrice:int = int(a_2161.e.GetPlayerCommon().m_iMoney);
         (this.renewTipDailog as IRenewTipDialog).showRenewCard(cardAttr,image,iCoinPrice);
      }
      
      public function onRenewPayCard(attr:a_3228, item:Object) : void
      {
         this.a_1206.RequsetRenewCard(attr.CardID,attr.CardSeq,item.i_comm_price,item.i_expiry_date);
      }
      
      public function onBuyCardPayTip(CardID:int) : void
      {
         if(this.buyTipDailog == null)
         {
            this.buyTipDailog = this.stTDComponentUI.a_3713();
         }
         addChild(this.buyTipDailog);
         var common:Object = a_2161.e.GetPlayerCommon();
         (this.buyTipDailog as IBuyCardDialog).showBuyCard([CardID],common);
      }
      
      public function onBuyPayCard(goods:Array) : void
      {
         var obj:Object = null;
         var arrIDS:Array = [];
         for each(obj in goods)
         {
            if(Boolean(obj) && Boolean(obj.CardID))
            {
               arrIDS.push(obj.CardID);
            }
         }
         if(!this.ValidateionBagState(arrIDS))
         {
            return;
         }
         this.a_1206.a_2499(null,goods);
      }
      
      public function ValidateionBagRestNum(iHeroNum:int, iDefNum:int, iPropNum:int) : Boolean
      {
         var i:int = 0;
         var arrItemID:Array = [];
         for(i = 0; i < iHeroNum; i++)
         {
            arrItemID.push(318767104);
         }
         for(i = 0; i < iDefNum; i++)
         {
            arrItemID.push(285212672);
         }
         for(i = 0; i < iPropNum; i++)
         {
            arrItemID.push(301989888);
         }
         if(arrItemID.length <= 0)
         {
            return true;
         }
         return this.ValidateionBagState(arrItemID);
      }
      
      public function ValidateionBagState(arrCardID:Array) : Boolean
      {
         var iMsgID:int = a_3886.getInstance().dealCards(arrCardID);
         if(iMsgID == a_1739.enmGame_DefaultID)
         {
            return true;
         }
         var szMsgID:String = this.gsManager.getString(iMsgID);
         var szNameID:String = this.gsManager.getString(iMsgID + 1);
         var msg:String = this.gsManager.getString(131076,[szMsgID,szNameID,szMsgID]);
         var textTip:ITDMessageTip = this.GetMessageTip();
         textTip.showTextTip(stage,msg,new Rectangle());
         return false;
      }
      
      public function ValidateionBagStateContainMaxNum(arrCardID:Array) : Boolean
      {
         return VerifyPackageSize.getInstance().checkCardList(arrCardID);
      }
      
      public function onShowRoleDetail(role:Object, isLocal:Boolean, isDetail:Boolean) : void
      {
         this.stUserRoleDetail.x = 225;
         this.stUserRoleDetail.y = 45;
         this.stUserRoleDetail.visible = true;
         a_2170.e.init(425,true);
         a_2170.e.onInitRoleDetail(role,isDetail);
         this.addChild(this.stUserRoleDetail);
         if(!isLocal)
         {
            this.a_1206.a_2510(role.m_iRoleUin);
            this.a_2511(role.m_iRoleUin);
            this.a_1206.a_2309([role.m_iRoleUin]);
            this.mBridge.execute("getConsortiaBriefRequest",this,[role.m_iRoleUin],1);
         }
      }
      
      public function a_2511(iRoleUin:int, iTypeByGetOtherHeroInfo:int = 1) : void
      {
         this.a_1206.a_2511(iRoleUin,iTypeByGetOtherHeroInfo);
      }
      
      public function onAuctionBuy() : void
      {
      }
      
      public function onShowNotEnoughMoneyTip(msg:String) : void
      {
         var notEnoughMoneyTip:Sprite = this.stTDComponentUI.a_3717();
         notEnoughMoneyTip.addEventListener("payMoney",this.onPayMoneyEvent);
         (notEnoughMoneyTip as INotEnoughMoneyContent).setContent(msg);
         this.stTDTipDialog.content = notEnoughMoneyTip;
         this.stTDTipDialog.showTip(stage,this.m_szTiShi,true,true,false,false);
      }
      
      public function onMiscInfoStrResponse(back_obj:Object) : void
      {
         var arrTotalConsume:Array = null;
         var iAwardType:int = 0;
         var isCanUse:int = 0;
         var tip:ITDMessageTip = null;
         var role:Object = null;
         var totalConsume:String = back_obj.data as String;
         if(totalConsume != null)
         {
            arrTotalConsume = totalConsume.split("|");
            iAwardType = int(arrTotalConsume[1]);
            if(iAwardType == 19)
            {
               isCanUse = int(arrTotalConsume[3]);
               tip = this.GetMessageTip();
               if(isCanUse == 1)
               {
                  this.a_1206.a_2514(this.m_iCardID,this.m_iCardSeq);
                  role = a_2161.e.GetCurrentRole();
                  this.a_1206.RequestTransferClientLog(3,role.m_szRoleName + ",打卡VIP礼包ID:" + this.m_iCardID.toString(16));
               }
               else if(this.m_iCardID == a_1733.enm_VipA)
               {
                  tip.showTextTip(this,this.gsManager.getString(133216,["2"]),new Rectangle());
               }
               else if(this.m_iCardID == a_1733.enm_VipB)
               {
                  tip.showTextTip(this,this.gsManager.getString(133216,["6"]),new Rectangle());
               }
            }
         }
      }
      
      public function onResponseTodayLogin(a_4730:LoginEvent) : void
      {
         var obj:Object = a_4730.data.data as XML;
         var result_id:int = int(obj..@result_id);
         if(stage.loaderInfo.parameters.platform_id == "3366")
         {
            (this.stTDRoomUserUI as Object).isNewDayLogin = true;
            this.showCilckedTarget(this.stTDNActionUI,"TDNActionUI",GameStringManager.getInstance().getString(139615),this.InitialzeTDNActionUI);
         }
         else if(!this.m_newGuide && 0 == result_id)
         {
            (this.stTDRoomUserUI as Object).isNewDayLogin = true;
            this.putAutoPopWinAry({
               "sortId":2,
               "target":this.m_stTDHolidayRechargeActivityUI,
               "id":"TDHolidayRechargeActivityUI",
               "showName":GameStringManager.getInstance().getString(139615),
               "loadedHandler":this.InitialzeTDHolidayRechargeActivityUI,
               "visibleLoadDialog":true
            });
         }
      }
      
      public function onNotifyPlayerHealthData(iCumulativeOnLine:int, iCumulativeOffLine:int, iTimestamp:int) : void
      {
         var enterRoom:Object = a_2161.e.getEnterRoom();
         RoleWallow.getInstance().fcmValue = enterRoom.m_iFcm;
         if(enterRoom.m_iFcm != 0)
         {
            RoleWallow.getInstance().setPlayerHealthData(iCumulativeOnLine,iCumulativeOffLine,iTimestamp);
         }
         else
         {
            RoleWallow.getInstance().dealWallow();
         }
      }
      
      public function onDealWallow(msgObj:Object) : void
      {
         var enterRoom:Object = null;
         var msg:String = null;
         if(this.showTipUnOpen("RoleWallow",false))
         {
            return;
         }
         if(msgObj != null)
         {
            this.m_bIsCloseGame = false;
            enterRoom = a_2161.e.getEnterRoom();
            if(5 <= msgObj.endTime)
            {
               if(1 == enterRoom.m_iFcm)
               {
                  this.a_3744(msgObj.msg,this.m_szTiShi,true,false,true,false);
                  this.addDialogEventListener();
               }
               else
               {
                  this.a_3744(msgObj.msg,this.m_szTiShi,true,false,false,false);
               }
            }
            else if(0 != enterRoom.m_iFcm && 2 != enterRoom.m_iFcm && msgObj.endTime >= 1)
            {
               this.a_3744("账号已纳入防沉迷系统，请尽快进行身份信息填写,并刷新游戏。","提示",true,true,true,true);
               this.addDialogEventListener();
            }
            else if(msgObj.startTime != 0 && msgObj.endTime != 0)
            {
               this.a_3744(msgObj.msg,this.m_szTiShi,true,true,true,true);
            }
            else
            {
               this.a_3744(msgObj.msg,this.m_szTiShi,true,true,true,true);
            }
            msg = IMUtil.sendMsgFormat({
               "tag":EnmGameIM.a_509,
               "msg":msgObj.msg
            });
            a_4657.getInstance().execute("onSystemMessageNotify",this,msg);
         }
      }
      
      public function showNotHealthTimeGetTaskAward() : void
      {
         this.a_3744("您已经进入疲劳游戏时间，不能领取奖励，为了您的健康，请尽快下线休息，直到您的累计下线时间满5小时后，才能领取奖励.",GameStringManager.getInstance().getString(132426),false,true,true,false,5000);
      }
      
      private function onCancel(e:a_3251) : void
      {
         this.removeDialogEventListener();
      }
      
      private function onSure(e:a_3251) : void
      {
         this.NavigateToAntiAddictionURL();
         this.removeDialogEventListener();
      }
      
      private function addDialogEventListener() : void
      {
         this.stTDTipDialog.addEventListener(a_3251.CANCEL,this.onCancel);
         this.stTDTipDialog.addEventListener(a_3251.CLOSE,this.onCancel);
         this.stTDTipDialog.addEventListener(a_3251.SURE,this.onSure);
      }
      
      private function removeDialogEventListener() : void
      {
         this.m_bIsCloseGame = false;
         this.stTDTipDialog.removeEventListener(a_3251.CANCEL,this.onCancel);
         this.stTDTipDialog.removeEventListener(a_3251.CLOSE,this.onCancel);
         this.stTDTipDialog.removeEventListener(a_3251.SURE,this.onSure);
      }
      
      private function NavigateToAntiAddictionURL() : void
      {
         var strShowType:String = null;
         var strURL:String = "";
         if(this.m_bIsCloseGame)
         {
            strShowType = "_self";
         }
         else
         {
            strShowType = "_blank";
         }
         var enterRoom:Object = a_2161.e.getEnterRoom();
         if("qq" == enterRoom.m_iSiteType || "3366" == enterRoom.m_iSiteType)
         {
            this.RefreshThisWeb(strShowType);
            return;
         }
         if("360" == enterRoom.m_iSiteType)
         {
            strURL = "http://wan.360.cn/vfatigue?dest_url=http://wan.360.cn/u/security";
         }
         else if("4399" == enterRoom.m_iSiteType)
         {
            strURL = "https://my.4399.com/cp.php?ac=profile#fcm";
         }
         else if("7k7k" == enterRoom.m_iSiteType)
         {
            strURL = "http://web.7k7k.com/user/index.php";
         }
         else
         {
            if("joyyou" != enterRoom.m_iSiteType)
            {
               return;
            }
            strURL = "https://passport.huanle.com/user/identity";
         }
         if(strURL.length > 0)
         {
            navigateToURL(new URLRequest(strURL),strShowType);
         }
      }
      
      private function RefreshThisWeb(strShowType:String) : void
      {
         var strKey:String = "meishifcm";
         var url:String = "http://app13057-qzone-qzoneapp.123u.com/fcm/fcm.php?";
         var parameters:Object = stage.loaderInfo.parameters;
         var strOpenid:String = parameters.sig_user;
         var strSign:String = MD5.hash(strOpenid + strKey);
         url += "openid=" + strOpenid + "&sign=" + strSign;
         var stRequest:URLRequest = new URLRequest(url);
         stRequest.method = URLRequestMethod.GET;
         navigateToURL(stRequest,strShowType);
      }
      
      private function onPayMoneyEvent(a_4730:Event) : void
      {
         this.RequestPayMoney();
         if(a_4730 != null)
         {
            this.stTDTipDialog.hideTip();
         }
      }
      
      private function showLevelAwardDialog() : void
      {
         var iLevel:int = 0;
         var arr:Array = null;
         var cardsArr:Array = null;
         var cardsAttArr:Array = null;
         var cardItem:Object = null;
         var obj:Object = null;
         var key:String = null;
         var levelArr:Array = null;
         var enterRoom:Object = null;
         var i:* = 0;
         var tmpArr:Array = null;
         if(this.levelData != null && !this.isPlaying)
         {
            iLevel = Number(this.levelData.iLevel);
            if(this.levelAwardDialog == null)
            {
               this.levelAwardDialog = this.stTDComponentUI.a_3715();
            }
            arr = this.levelData.arrLevelItem;
            cardsArr = [];
            cardsAttArr = [];
            if(arr != null && arr.length > 0)
            {
               for(i = 0; i < arr.length; i++)
               {
                  if((arr[i].iCardID & 0xFF000000) == 285212672)
                  {
                     cardItem = arr.splice(i,1)[0];
                     cardsAttArr.push(cardItem);
                     cardsArr.push(cardItem.iCardID);
                     i--;
                  }
               }
            }
            if(!MeishiGuide.Instance.hasLevelCardsAnimation(cardsArr))
            {
               cardsArr.splice(0);
               tmpArr = cardsAttArr.splice(0);
               this.levelData.arrLevelItem = (this.levelData.arrLevelItem as Array).concat(tmpArr);
            }
            obj = {};
            for(key in this.levelData)
            {
               obj[key] = this.levelData[key];
            }
            if(this.m_oGuideData == null)
            {
               this.m_oGuideData = {};
               this.m_oGuideData.guideData = [];
            }
            levelArr = this.m_oGuideData.guideData[7];
            if(levelArr == null)
            {
               levelArr = [];
               this.m_oGuideData.guideData[7] = levelArr;
            }
            if(levelArr[iLevel] == null || levelArr[iLevel] != 1)
            {
               levelArr[iLevel] = 1;
               MeishiGuide.Instance.pushAnimationToQuene({
                  "func":"showLevelUpAnimation",
                  "params":[obj]
               });
            }
            MeishiGuide.Instance.showMenuOpenByLevel(iLevel);
            MeishiGuide.Instance.showStoryGuideByLevel(iLevel);
            if(cardsArr.length > 0)
            {
               if(this.stTDTaskUI != null && this.stTDTaskUI.parent != null)
               {
                  this.stTDTaskUI.parent.removeChild(this.stTDTaskUI);
               }
               MeishiGuide.Instance.pushAnimationToQuene({
                  "func":"showNewCardAnimationByCards",
                  "params":[cardsArr]
               });
            }
            enterRoom = a_2161.e.getEnterRoom();
            this.a_1206.a_2509(enterRoom.m_iUserStatus);
            this.levelData = null;
         }
      }
      
      public function RequestPlayerAcceptTask(taskDesc:Object) : void
      {
         this.a_1206.a_2501(taskDesc.taskID);
         if(taskDesc.modeMapID != 0)
         {
         }
      }
      
      public function RequestPlayerSaveTask(taskInfo:a_4517) : void
      {
         a_4648.a_4649("RequestPlayerSaveTask.TaskID=" + taskInfo.m_iTaskID.toString(16) + "," + taskInfo.m_iUserDef1 + "," + taskInfo.m_iTaskStatus);
         this.a_1206.a_2504(taskInfo);
      }
      
      public function RequestSaveUpdateTDCardFavorite(iFavoriteID:int, szFavoriteName:String, favitemsContent:String) : Boolean
      {
         return this.a_1206.a_2351(iFavoriteID,szFavoriteName,favitemsContent);
      }
      
      public function RequestUpdateDefGridSize(iCardID:int, iCardSeq:int) : void
      {
         this.a_1206.a_2356(iCardID,iCardSeq);
      }
      
      public function RequestUpdateShowCardSetUp(iShowCard:int) : void
      {
         this.a_1206.RequestUpdateShowCardSetUp(iShowCard);
      }
      
      public function RequestUpdateGemoSuit() : void
      {
         if(this.stTDRoomUserUI != null && this.stTDRoomUserUI.parent != null)
         {
            (this.stTDRoomUserUI as Object).onSetRoomType(1);
         }
      }
      
      public function RequestUseService(iCardID:int, iCardSeq:int) : void
      {
         this.a_1206.a_2496(iCardID,iCardSeq);
      }
      
      public function RequestUseSkillBook(iCardID:int, iCardSeq:int) : void
      {
         this.a_1206.UseSkillBook(iCardID,iCardSeq);
      }
      
      public function RequestUseExchangeItem(iCardID:int, iCardSeq:int) : void
      {
         this.m_iCardID = -1;
         this.m_iCardSeq = -1;
         this.a_1206.a_2514(iCardID,iCardSeq);
      }
      
      public function GetGameIMUI() : Object
      {
         return this.stTDGameIMUI;
      }
      
      public function GetMenuUI() : Object
      {
         return this.stTDMenuUI;
      }
      
      public function GetInviteUI() : Object
      {
         return this.stTDInviteUI;
      }
      
      public function GetInviteCommonUI() : Object
      {
         return this.stTDInviteCommonUI;
      }
      
      public function GetServerListUI() : Object
      {
         return this.stServerList;
      }
      
      public function GetRightMenuUI() : Object
      {
         return this.stTDRightMenuUI;
      }
      
      public function GetDictVersion() : Object
      {
         return this.a_1203;
      }
      
      public function GetTDLoadDialog() : Object
      {
         return this.stTDLoadDialog;
      }
      
      public function GetTipDialog() : Object
      {
         return this.stTDTipDialog;
      }
      
      public function GetBuySureDialog() : Object
      {
         return this.stBuySureDialog;
      }
      
      public function GetMessageTip() : ITDMessageTip
      {
         if(this.textTip == null)
         {
            this.textTip = this.stTDComponentUI.GetMessageTip();
         }
         return this.textTip;
      }
      
      public function GetTableReadyUI() : Object
      {
         return this.stTableReadyUI;
      }
      
      public function GetValidationTip() : Object
      {
         return this.stTDComponentUI.GetValidationTip();
      }
      
      public function GetTDMiSuUI() : Object
      {
         return this.stTDMiSuUI;
      }
      
      public function GetStoreGoodsList() : Object
      {
         return a_2044.getInstance().m_dictGoods;
      }
      
      private function preloadOtherAssets() : void
      {
         var m_dictLoader:Dictionary = new Dictionary();
         if(this.m_defCards != null)
         {
            m_dictLoader["DefCardsPackage"] = new AssetsItemData(this.m_defCards.baseurl + this.m_defCards.url + "?v=" + this.m_defCards.version,AssetType.ZIP,"DefCardsPackage",this.m_defCards.version,"/");
         }
         if(this.a_1679 != null)
         {
            m_dictLoader["PreviewMousePackage"] = new AssetsItemData(this.a_1679.baseurl + this.a_1679.url + "?v=" + this.a_1679.version,AssetType.ZIP,"PreviewMousePackage",this.a_1679.version,"/",true,"utf-8",new LoaderContext(false,ApplicationDomain.currentDomain));
         }
         var prevLoader:AssetsLoader = new AssetsLoader();
         prevLoader.load(m_dictLoader,{
            "ids":["PreviewMousePackage","DefCardsPackage"],
            "onComplete":this.preloadOtherAssetsComplete,
            "onCompleteParms":[prevLoader]
         },AssetsLoadMode.SINGLE);
      }
      
      private function preloadOtherAssetsComplete(dict:Dictionary, loader:AssetsLoader) : void
      {
         var k:String = null;
         if(dict != null)
         {
            trace("TDLobbyCoreUI::preloadOtherAssetsComplete");
            for(k in dict)
            {
               if("DefCardsPackage" == k)
               {
                  if(dict["DefCardsPackage"] != null)
                  {
                     this.a_4551(dict["DefCardsPackage"].data);
                  }
               }
               else if("PreviewMousePackage" == k)
               {
                  if(dict["PreviewMousePackage"] != null)
                  {
                     this.a_4552(dict["PreviewMousePackage"].data);
                  }
               }
               delete dict[k];
            }
         }
         loader = null;
      }
      
      private function a_4551(dict:Dictionary) : void
      {
         var k:String = null;
         var obj:* = undefined;
         var id:String = null;
         var aid:AssetsItemData = null;
         var temp_dict:Dictionary = new Dictionary(true);
         var loader:AssetsLoader = new AssetsLoader();
         for(k in dict)
         {
            obj = dict[k];
            id = k.replace(".png","").replace("0x","");
            aid = new AssetsItemData(this.m_defCards.baseurl + k,AssetType.PNG,id);
            aid.data = obj;
            temp_dict[id] = aid;
            delete dict[k];
         }
         dict = null;
         loader.load(temp_dict);
      }
      
      private function a_4552(dict:Dictionary) : void
      {
         var k:String = null;
         var mm:a_3855 = null;
         var id:String = null;
         var temp_dict:Dictionary = new Dictionary(true);
         var mouses:Array = new Array();
         for(k in dict)
         {
            id = k.replace(".swf","");
            if(dict[k] != null)
            {
               mouses.push(new a_4687((dict[k] as MovieClip)["m"],id,"0-0"));
            }
            delete dict[k];
         }
         dict = null;
         mm = a_3855.getInstance();
         mm.frameRate = 10;
         mm.addMouses(mouses);
      }
      
      private function a_4553(data:Object, id:String) : void
      {
         var p:int = 0;
         if(this.stTDLoadDialog.parent == stage)
         {
            p = 100 * data.thisLoadedData.bytesLoaded / data.thisLoadedData.bytesTotal;
            (this.stTDLoadDialog as ITDLoadDialog).showLoadProgress(p);
         }
      }
      
      private function startNewGuide() : void
      {
      }
      
      private function a_4554(stRoomChild:DisplayObject) : void
      {
         this.stTDLobbyRoomUI.a_2120(this.a_1206);
         this.stTDLobbyRoomUI.a_3734(stRoomChild);
         this.stTDLobbyRoomUI.a_3735();
         if(this.stTDViliantUI)
         {
            this.stTDViliantUI.a_3735();
            this.stTDViliantUI.a_2120(this.a_1206);
         }
         if(this.stTDActivityEntranceUI)
         {
            this.stTDActivityEntranceUI.a_3735();
            this.stTDActivityEntranceUI.a_2120(this.a_1206);
         }
         if(this.m_stTDCrossServerUI)
         {
            (this.m_stTDCrossServerUI as ITDLobbyRoomUI).a_3735();
            (this.m_stTDCrossServerUI as ITDLobbyRoomUI).a_2120(this.a_1206);
         }
         if(this.m_stTDDiyLaboratoryUI)
         {
            (this.m_stTDDiyLaboratoryUI as ITDLobbyRoomUI).a_3735();
            (this.m_stTDDiyLaboratoryUI as ITDLobbyRoomUI).a_2120(this.a_1206);
         }
         var enterRoom:Object = a_2161.e.getEnterRoom();
         this.a_1206.a_2488(enterRoom.m_iServerID,0);
         enterRoom.iGetPlayerNum = 1;
      }
      
      private function a_4555(dict:Dictionary) : void
      {
         if(dict["TDMeiShiUI"] != null && dict["TDMeiShiUI"].data != null)
         {
            this.stTDMeiShiUI = dict["TDMeiShiUI"].data;
            this.a_4554(this.stTDMeiShiUI);
         }
      }
      
      private function a_4556(dict:Dictionary) : void
      {
         if(dict["TDHuoShanUI"] != null && dict["TDHuoShanUI"].data != null)
         {
            this.stTDHuoShanUI = dict["TDHuoShanUI"].data;
            this.a_4554(this.stTDHuoShanUI);
         }
      }
      
      private function InitialzeTDSkyCastleUI(dict:Dictionary) : void
      {
         if(dict["TDSkyCastleUI"] != null && dict["TDSkyCastleUI"].data != null)
         {
            this.stTDSkyCastleUI = dict["TDSkyCastleUI"].data;
            this.a_4554(this.stTDSkyCastleUI);
         }
      }
      
      private function InitialzeTDSeafloorWhirlpoolUI(dict:Dictionary) : void
      {
         if(dict["TDSeafloorWhirlpoolUI"] != null && dict["TDSeafloorWhirlpoolUI"].data != null)
         {
            this.stTDSeafloorWhirlpoolUI = dict["TDSeafloorWhirlpoolUI"].data;
            this.a_4554(this.stTDSeafloorWhirlpoolUI);
         }
      }
      
      private function InitialzeTDShuQiDesertUI(dict:Dictionary) : void
      {
         if(dict["TDShuQiDesertUI"] != null && dict["TDShuQiDesertUI"].data != null)
         {
            this.stTDShuQiDesertUI = dict["TDShuQiDesertUI"].data;
            this.a_4554(this.stTDShuQiDesertUI);
         }
      }
      
      private function InitialzeTDWonderlandUI(dict:Dictionary) : void
      {
         if(dict["TDWonderlandUI"] != null && dict["TDWonderlandUI"].data != null)
         {
            this.stTDWonderlandUI = dict["TDWonderlandUI"].data;
            this.a_4554(this.stTDWonderlandUI);
         }
      }
      
      private function InitialzeTDExploreCampLandUI(dict:Dictionary) : void
      {
         if(dict["TDExploreCampLandUI"] != null && dict["TDExploreCampLandUI"].data != null)
         {
            this.stTDExploreCampLandUI = dict["TDExploreCampLandUI"].data;
            this.a_4554(this.stTDExploreCampLandUI);
         }
      }
      
      private function InitialzeTDSnowDesertLandUI(dict:Dictionary) : void
      {
         if(dict["TDSnowDesertLandUI"] != null && dict["TDSnowDesertLandUI"].data != null)
         {
            this.stTDSnowDesertLandUI = dict["TDSnowDesertLandUI"].data;
            this.a_4554(this.stTDSnowDesertLandUI);
         }
      }
      
      private function InitialzeTDDesertLandUI(dict:Dictionary) : void
      {
         if(dict["TDDesertLandUI"] != null && dict["TDDesertLandUI"].data != null)
         {
            this.stTDDesertLandUI = dict["TDDesertLandUI"].data;
            this.a_4554(this.stTDDesertLandUI);
         }
      }
      
      private function InitialzeNewUI(dict:Dictionary) : void
      {
         var m_uiName:String = null;
         for(m_uiName in dict)
         {
            if(!(dict[m_uiName] != null && dict[m_uiName].data != null))
            {
               throw new Error("加载模块>>" + m_uiName + "出错");
            }
            this["st" + m_uiName] = dict[m_uiName].data;
            this.a_4554(this["st" + m_uiName]);
         }
      }
      
      private function InitailzeTDDeepSeaRemainsUI(dict:Dictionary) : void
      {
         if(dict["TDDeepSeaRemainsUI"] != null && dict["TDDeepSeaRemainsUI"].data != null)
         {
            this.stTDDeepSeaRemainsUI = dict["TDDeepSeaRemainsUI"].data;
            this.a_4554(this.stTDDeepSeaRemainsUI);
         }
      }
      
      private function a_4557(dict:Dictionary) : void
      {
         if(dict["TDVSUI"] != null && dict["TDVSUI"].data != null)
         {
            this.stTDVSUI = dict["TDVSUI"].data;
            this.a_4554(this.stTDVSUI);
         }
      }
      
      private function a_4558(dict:Dictionary) : void
      {
         if(dict["TDVSMatchUI"] != null && dict["TDVSMatchUI"].data != null)
         {
            this.stTDVSMatchUI = dict["TDVSMatchUI"].data;
            this.addChild(this.stTDVSMatchUI);
            (this.stTDVSMatchUI as ITDVSMatchUI).a_2120(this.a_1206);
            if(this.stTDVSMatchUI != null && this.contains(this.stTDLobbyRoomUI as DisplayObject))
            {
               this.removeChild(this.stTDLobbyRoomUI as DisplayObject);
            }
            if(this.stTDVSMatchUI != null && this.contains(this.stTDRoomUserUI))
            {
               this.removeChild(this.stTDRoomUserUI);
            }
            if(this.stTDLoadDialog.parent == stage)
            {
               stage.removeChild(this.stTDLoadDialog);
            }
         }
      }
      
      private function a_4559(dict:Dictionary) : void
      {
         if(dict["TDStoreUI"] != null && dict["TDStoreUI"].data != null)
         {
            this.stTDStoreUI = dict["TDStoreUI"].data as ITDStoreUI;
            this.addChild(this.stTDStoreUI as DisplayObject);
            (this.stTDStoreUI as DisplayObject).visible = true;
            this.stTDStoreUI.a_3639(this);
            this.stTDStoreUI.a_3777(this.m_iStoreType,null);
         }
         if(this.stTDLoadDialog.parent == stage)
         {
            stage.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function updateConsortiaEstablishmentPower() : void
      {
         if(null != this.stTDComposeUI)
         {
            if(null != this.stTDComposeUI.parent)
            {
               a_2145.e.onShowConsortiaSign(false,1);
            }
         }
         if(this.m_iStoreType == 1)
         {
            if(null != this.stTDStoreUI)
            {
               if(null != (this.stTDStoreUI as DisplayObject).parent)
               {
                  this.stTDStoreUI.a_3777(this.m_iStoreType,null);
               }
            }
         }
      }
      
      private function a_4560(dict:Dictionary) : void
      {
         if(dict["TDComposeUI"] != null && dict["TDComposeUI"].data != null)
         {
            this.stTDComposeUI = dict["TDComposeUI"].data;
            this.addChild(this.stTDComposeUI);
            if(this.consortiaIsOpen)
            {
               a_2145.e.onShowConsortiaSign(false,1);
            }
         }
         if(this.stTDLoadDialog.parent == stage)
         {
            stage.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDConsortiaTaskUI(dict:Dictionary) : void
      {
         if(dict["TDConsortiaTaskUI"] != null && dict["TDConsortiaTaskUI"].data != null)
         {
            this.stTDConsortiaTaskUI = dict["TDConsortiaTaskUI"].data;
            this.addChild(this.stTDConsortiaTaskUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDConsortiaCardUI(dict:Dictionary) : void
      {
         if(dict["TDConsortiaCardUI"] != null && dict["TDConsortiaCardUI"].data != null)
         {
            this.stTDConsortiaCardUI = dict["TDConsortiaCardUI"].data;
            this.addChild(this.stTDConsortiaCardUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDConsortiaCarbonUI(dict:Dictionary) : void
      {
         if(dict["TDConsortiaCarbonUI"] != null && dict["TDConsortiaCarbonUI"].data != null)
         {
            this.stTDConsortiaCarbonUI = dict["TDConsortiaCarbonUI"].data;
            this.addChild(this.stTDConsortiaCarbonUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDConsortiaGardenUI(dict:Dictionary) : void
      {
         if(dict["TDConsortiaGardenUI"] != null && dict["TDConsortiaGardenUI"].data != null)
         {
            this.stTDConsortiaGardenUI = dict["TDConsortiaGardenUI"].data;
            this.addChild(this.stTDConsortiaGardenUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDLoverTaskUI(dict:Dictionary) : void
      {
         if(dict["TDLoverTaskUI"] != null && dict["TDLoverTaskUI"].data != null)
         {
            this.stTDLoverTaskUI = dict["TDLoverTaskUI"].data;
            this.addChild(this.stTDLoverTaskUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDMonthCardUI(dict:Dictionary) : void
      {
         if(dict["TDMonthCardUI"] != null && dict["TDMonthCardUI"].data != null)
         {
            this.stTDMonthCardUI = dict["TDMonthCardUI"].data;
            this.addChild(this.stTDMonthCardUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDTarotUI(dict:Dictionary) : void
      {
         if(dict["TDTarotUI"] != null && dict["TDTarotUI"].data != null)
         {
            this.stTDTarotUI = dict["TDTarotUI"].data;
            this.addChild(this.stTDTarotUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDOnePieceUI(dict:Dictionary) : void
      {
         if(dict["TDOnePieceUI"] != null && dict["TDOnePieceUI"].data != null)
         {
            this.stTDOnePieceUI = dict["TDOnePieceUI"].data;
            this.addChild(this.stTDOnePieceUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDOnePieceShopUI(dict:Dictionary) : void
      {
         if(dict["TDOnePieceShopUI"] != null && dict["TDOnePieceShopUI"].data != null)
         {
            this.stTDOnePieceShopUI = dict["TDOnePieceShopUI"].data;
            this.addChild(this.stTDOnePieceShopUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDNewYearActivityUI(dict:Dictionary) : void
      {
         if(dict["TDNewYearActivityUI"] != null && dict["TDNewYearActivityUI"].data != null)
         {
            this.stTDNewYearActivityUI = dict["TDNewYearActivityUI"].data;
            this.addChild(this.stTDNewYearActivityUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDEveryDaySeeYouUI(dict:Dictionary) : void
      {
         if(dict["TDEveryDaySeeYouUI"] != null && dict["TDEveryDaySeeYouUI"].data != null)
         {
            this.m_stTDEveryDaySeeYouUI = dict["TDEveryDaySeeYouUI"].data;
            this.addChild(this.m_stTDEveryDaySeeYouUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDWeiXinGiftUI(dict:Dictionary) : void
      {
         if(dict["TDWeiXinGiftUI"] != null && dict["TDWeiXinGiftUI"].data != null)
         {
            this.stTDWeiXinGiftUI = dict["TDWeiXinGiftUI"].data;
            this.addChild(this.stTDWeiXinGiftUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function a_4561(dict:Dictionary) : void
      {
         if(dict["TDRankUI"] != null && dict["TDRankUI"].data != null)
         {
            this.stTDRankUI = dict["TDRankUI"].data;
            this.addChild(this.stTDRankUI);
            this.addChild(this.stTDMenuUI as DisplayObject);
         }
         if(this.stTDLoadDialog.parent == stage)
         {
            stage.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function a_4562(dict:Dictionary) : void
      {
         if(dict["TDMailUI"] != null && dict["TDMailUI"].data != null)
         {
            this.stTDMailUI = dict["TDMailUI"].data;
            this.addChild(this.stTDMailUI);
            if(this.stTDFriendUI != null && this == this.stTDFriendUI.parent)
            {
               this.removeChild(this.stTDFriendUI);
            }
            if(this.m_bSendMailDirect)
            {
               (this.stTDMailUI as Object).requsetNewMail(this.m_oSendToRole.m_szRoleName);
               this.m_bSendMailDirect = false;
               this.m_oSendToRole = null;
            }
         }
         if(this.stTDLoadDialog.parent == stage)
         {
            stage.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function a_4563(dict:Dictionary) : void
      {
         if(dict["TDTaskUI"] != null && dict["TDTaskUI"].data != null)
         {
            this.stTDTaskUI = dict["TDTaskUI"].data;
            this.addChild(this.stTDTaskUI);
            if(this.m_newGuide)
            {
            }
         }
         if(this.stTDLoadDialog.parent == stage)
         {
            stage.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function a_4564(dict:Dictionary) : void
      {
         if(dict["TDFriendUI"] != null && dict["TDFriendUI"].data != null)
         {
            this.stTDFriendUI = dict["TDFriendUI"].data;
            this.addChild(this.stTDFriendUI);
            if(this.stTDMailUI != null && this == this.stTDMailUI.parent)
            {
               this.removeChild(this.stTDMailUI);
            }
         }
         if(this.stTDLoadDialog.parent == stage)
         {
            stage.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function a_4565(dict:Dictionary) : void
      {
         if(dict["TDAuctionUI"] != null && dict["TDAuctionUI"].data != null)
         {
            this.stTDAuctionUI = dict["TDAuctionUI"].data;
            this.addChild(this.stTDAuctionUI);
            (this.stTDAuctionUI as DisplayObjectContainer).addChild(this.stTDMenuUI as DisplayObject);
         }
         if(this.stTDLoadDialog.parent == stage)
         {
            stage.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function LoadWeddingRoomCompelete() : void
      {
         var dataEvent:a_1778 = new a_1778(ActivityEventType.WEDDING_ROOM_LOAD_COMPELETE);
         ActivityEventManagerFactory.getInstance().dispatchEvent(dataEvent);
      }
      
      public function LoadWeddingRoomUI(bIsAddTostage:Boolean = true) : void
      {
         if(!bIsAddTostage && null != this.m_stTDWeddingRoomUI)
         {
            this.LoadWeddingRoomCompelete();
            return;
         }
         var funcCallBack:Function = bIsAddTostage ? this.InitialzeTDWeddingRoomUI : this.SetTDWeddingRoomUI;
         this.showCilckedTarget(this.m_stTDWeddingRoomUI,"TDWeddingRoomUI",this.gsManager.getString(139779),funcCallBack);
         this.mBridge.execute("showTownBtnTipAnimation",this,"m_stWeddingTipMc",false);
      }
      
      private function SetTDWeddingRoomUI(dict:Dictionary) : void
      {
         if(dict["TDWeddingRoomUI"] != null && dict["TDWeddingRoomUI"].data != null)
         {
            this.m_stTDWeddingRoomUI = dict["TDWeddingRoomUI"].data;
            if(this.m_bIsRequestWeddingRoomAgree)
            {
               this.WeddingRoomInvitedResultHandle(DefineWeddingRoomOperation.REPLY_AGREE);
            }
            else
            {
               this.LoadWeddingRoomCompelete();
            }
         }
         this.RemoveTDLoadDialog();
         this.m_bIsRequestWeddingRoomAgree = false;
      }
      
      private function InitialzeTDWeddingRoomUI(dict:Dictionary) : void
      {
         this.SetTDWeddingRoomUI(dict);
         if(null != this.m_stTDWeddingRoomUI)
         {
            this.addChild(this.m_stTDWeddingRoomUI);
         }
      }
      
      private function InitializeTDCharmShopUI(dict:Dictionary) : void
      {
         if(dict["TDCharmShopUI"] != null && dict["TDCharmShopUI"].data != null)
         {
            this.stTDCharmShopUI = dict["TDCharmShopUI"].data;
            this.addChild(this.stTDCharmShopUI);
         }
         if(this.stTDLoadDialog.parent == stage)
         {
            stage.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDNewActionUI(dict:Dictionary) : void
      {
         if(dict["TDNewActionUI"] != null && dict["TDNewActionUI"].data != null)
         {
            this.stTDNewActionUI = dict["TDNewActionUI"].data;
            ITDActionsUI(this.stTDNewActionUI).showActionUI(0);
            addChild(this.stTDNewActionUI);
         }
         if(this.stTDLoadDialog.parent == stage)
         {
            stage.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDHuangZuanWelfareUI(dict:Dictionary) : void
      {
         if(dict["TDHuangZuanWelfareUI"] != null && dict["TDHuangZuanWelfareUI"].data != null)
         {
            this.stTDHuangZuanWelfareUI = dict["TDHuangZuanWelfareUI"].data;
            ITDActionsUI(this.stTDHuangZuanWelfareUI).showActionUI(0);
            this.addChild(this.stTDHuangZuanWelfareUI);
         }
         if(this.stTDLoadDialog.parent == stage)
         {
            stage.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function a_4567(dict:Dictionary) : void
      {
         if(dict["TDVSGuideUI"] != null && dict["TDVSGuideUI"].data != null)
         {
            this.stTDVSGuideUI = dict["TDVSGuideUI"].data;
            this.addChild(this.stTDVSGuideUI);
            this.stTDVSGuideUI.addEventListener(Event.REMOVED_FROM_STAGE,this.a_4576);
         }
         if(this.stTDLoadDialog.parent == stage)
         {
            stage.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function a_4568(dict:Dictionary) : void
      {
         if(dict["TDInfoUI"] != null && dict["TDInfoUI"].data != null)
         {
            this.stTDInfoUI = dict["TDInfoUI"].data;
            this.addChild(this.stTDInfoUI);
         }
         if(this.stTDLoadDialog.parent == stage)
         {
            stage.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function a_4569(dict:Dictionary) : void
      {
         if(dict["TDConsortiaUI"] != null && dict["TDConsortiaUI"].data != null)
         {
            this.stTDConsortiaUI = dict["TDConsortiaUI"].data;
            this.addChild(this.stTDConsortiaUI);
            this.notifyStaticConsortiaTask();
         }
         if(this.stTDLoadDialog.parent == stage)
         {
            stage.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzestTDNewMarginTreeUI(dict:Dictionary) : void
      {
         if(dict["TDNewMarginTreeUI"] != null && dict["TDNewMarginTreeUI"].data != null)
         {
            this.stTDNewMarginTreeUI = dict["TDNewMarginTreeUI"].data;
            this.addChild(this.stTDNewMarginTreeUI);
         }
         if(this.stTDLoadDialog.parent == stage)
         {
            stage.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function a_4571(dict:Dictionary) : void
      {
         if(dict["TDVowUI"] != null && dict["TDVowUI"].data != null)
         {
            this.stTDVowUI = dict["TDVowUI"].data;
            this.addChild(this.stTDVowUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function a_4572(dict:Dictionary) : void
      {
         if(dict["TDChangeNameCardUI"] != null && dict["TDChangeNameCardUI"].data != null)
         {
            this.stTDChangeNameCardUI = dict["TDChangeNameCardUI"].data;
            this.addChild(this.stTDChangeNameCardUI);
         }
         if(this.stTDLoadDialog.parent == stage)
         {
            stage.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDHomeUI(dict:Dictionary) : void
      {
         if(dict["TDHomeUI"] != null && dict["TDHomeUI"].data != null)
         {
            this.stTDHomeUI = dict["TDHomeUI"].data;
            this.addChild(this.stTDHomeUI);
            (this.stTDRoomUserUI as Object).onSetRoomType(2);
            addChild(this.stTDRoomUserUI);
            addChild(this.stServerList);
         }
         if(this.stTDLoadDialog.parent == stage)
         {
            stage.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function a_4573(dict:Dictionary) : void
      {
         if(dict["TDWarRewardUI"] != null && dict["TDWarRewardUI"].data != null)
         {
            this.stTDWarRewardUI = dict["TDWarRewardUI"].data;
            stage.addChild(this.stTDWarRewardUI);
            a_2172.e.setData(this.m_iIslandId);
         }
         if(this.stTDLoadDialog.parent == stage)
         {
            stage.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function a_4574(dict:Dictionary) : void
      {
         if(dict["TDAchievementUI"] != null && dict["TDAchievementUI"].data != null)
         {
            this.stTDAchievementUI = dict["TDAchievementUI"].data;
            this.addChild(this.stTDAchievementUI);
         }
         if(this.stTDLoadDialog.parent == stage)
         {
            stage.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function a_4575(dict:Dictionary) : void
      {
         if(dict["TDChooseChannelUI"] != null && dict["TDChooseChannelUI"].data != null)
         {
            this.stTDChooseChannelUI = dict["TDChooseChannelUI"].data;
            this.addChild(this.stTDChooseChannelUI);
            this.setChooseChannelData();
         }
         if(this.stTDLoadDialog.parent == stage)
         {
            stage.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDMoTaUI(dict:Dictionary) : void
      {
         if(dict["TDMoTaUI"] != null && dict["TDMoTaUI"].data != null)
         {
            this.stTDMoTaUI = dict["TDMoTaUI"].data;
            this.addChild(this.stTDMoTaUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDRecipesUI(dict:Dictionary) : void
      {
         if(dict["TDRecipesUI"] != null && dict["TDRecipesUI"].data != null)
         {
            this.stTDRecipesUI = dict["TDRecipesUI"].data;
            this.addChild(this.stTDRecipesUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDTreasureHouseUI(dict:Dictionary) : void
      {
         if(dict["TDTreasureHouseUI"] != null && dict["TDTreasureHouseUI"].data != null)
         {
            this.stTDTreasureHouseUI = dict["TDTreasureHouseUI"].data;
            this.addChild(this.stTDTreasureHouseUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDVipUI(dict:Dictionary) : void
      {
         if(dict["TDVipUI"] != null && dict["TDVipUI"].data != null)
         {
            this.stTDVipUI = dict["TDVipUI"].data;
            this.addChild(this.stTDVipUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitializeTDChoujiangUI(dict:Dictionary) : void
      {
         if(dict["TDChoujiangUI"] != null && dict["TDChoujiangUI"].data != null)
         {
            this.stTDChoujiangUI = dict["TDChoujiangUI"].data;
            this.addChild(this.stTDChoujiangUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitializeTDZhencangUI(dict:Dictionary) : void
      {
         if(dict["TDZhencangUI"] != null && dict["TDZhencangUI"].data != null)
         {
            this.stTDZhencangUI = dict["TDZhencangUI"].data;
            this.addChild(this.stTDZhencangUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitializeTDExchangeUI(dict:Dictionary) : void
      {
         if(dict["TDExchangeUI"] != null && dict["TDExchangeUI"].data != null)
         {
            this.stTDExchangeUI = dict["TDExchangeUI"].data;
            this.addChild(this.stTDExchangeUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitializeTDDarkCrystalShopUI(dict:Dictionary) : void
      {
         if(dict["TDDarkCrystalShopUI"] != null && dict["TDDarkCrystalShopUI"].data != null)
         {
            this.stTDDarkCrystalShopUI = dict["TDDarkCrystalShopUI"].data;
            this.addChild(this.stTDDarkCrystalShopUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitializeTDCrossShopUI(dict:Dictionary) : void
      {
         if(dict["TDCrossShopUI"] != null && dict["TDCrossShopUI"].data != null)
         {
            this.stTDCrossShopUI = dict["TDCrossShopUI"].data;
            this.addChild(this.stTDCrossShopUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitializeTDBlueDiamondPrivilegeUI(dict:Dictionary) : void
      {
         if(dict["TDBlueDiamondPrivilegeUI"] != null && dict["TDBlueDiamondPrivilegeUI"].data != null)
         {
            this.stTDBlueDiamondPrivilegeUI = dict["TDBlueDiamondPrivilegeUI"].data;
            this.addChild(this.stTDBlueDiamondPrivilegeUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitializeTDGameLobbyUI(dict:Dictionary) : void
      {
         if(dict["TDGameLobbyUI"] != null && dict["TDGameLobbyUI"].data != null)
         {
            this.stTDGameLobbyUI = dict["TDGameLobbyUI"].data;
            this.addChild(this.stTDGameLobbyUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitializeTDSpecialPayUI(dict:Dictionary) : void
      {
         if(dict["TDSpecialPayUI"] != null && dict["TDSpecialPayUI"].data != null)
         {
            this.stTDSpecialPayUI = dict["TDSpecialPayUI"].data;
            this.addChild(this.stTDSpecialPayUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitializeTDExchangeShopUI(dict:Dictionary) : void
      {
         if(dict["TDExchangeShopUI"] != null && dict["TDExchangeShopUI"].data != null)
         {
            this.stTDExchangeShopUI = dict["TDExchangeShopUI"].data;
            this.addChild(this.stTDExchangeShopUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitializeTDStarPieceShopUI(dict:Dictionary) : void
      {
         if(dict["TDStarPieceShopUI"] != null && dict["TDStarPieceShopUI"].data != null)
         {
            this.stTDStarPieceShopUI = dict["TDStarPieceShopUI"].data;
            this.addChild(this.stTDStarPieceShopUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitializeTDScoreShopUI(dict:Dictionary) : void
      {
         if(dict["TDScoreShopUI"] != null && dict["TDScoreShopUI"].data != null)
         {
            this.stTDScoreShopUI = dict["TDScoreShopUI"].data;
            this.addChild(this.stTDScoreShopUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDViliantUI(dict:Dictionary) : void
      {
         if(dict["TDViliantUI"] != null && dict["TDViliantUI"].data != null)
         {
            this.stTDViliantUI = dict["TDViliantUI"].data;
            this.addChild(this.stTDViliantUI as DisplayObject);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDActivityEntranceUI(dict:Dictionary) : void
      {
         if(dict["TDActivityEntranceUI"] != null && dict["TDActivityEntranceUI"].data != null)
         {
            this.stTDActivityEntranceUI = dict["TDActivityEntranceUI"].data;
            this.addChild(this.stTDActivityEntranceUI as DisplayObject);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDSmallHouseUI(dict:Dictionary) : void
      {
         if(dict["TDSmallHouseUI"] != null && dict["TDSmallHouseUI"].data != null)
         {
            this.stTDSmallHouseUI = dict["TDSmallHouseUI"].data;
            this.addChild(this.stTDSmallHouseUI as DisplayObject);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDSnowMountainExploreUI(dict:Dictionary) : void
      {
         if(dict["TDSnowMountainExploreUI"] != null && dict["TDSnowMountainExploreUI"].data != null)
         {
            this.stTDSnowMountainExploreUI = dict["TDSnowMountainExploreUI"].data;
            this.addChild(this.stTDSnowMountainExploreUI as DisplayObject);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDThunderCityExploreUI(dict:Dictionary) : void
      {
         if(dict["TDThunderCityExploreUI"] != null && dict["TDThunderCityExploreUI"].data != null)
         {
            this.stTDThunderCityExploreUI = dict["TDThunderCityExploreUI"].data;
            this.addChild(this.stTDThunderCityExploreUI as DisplayObject);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDExploreRoomPopUI(dict:Dictionary) : void
      {
         if(dict["TDExploreRoomPopUI"] != null && dict["TDExploreRoomPopUI"].data != null)
         {
            this.stTDExploreRoomPopUI = dict["TDExploreRoomPopUI"].data;
            this.addChild(this.stTDExploreRoomPopUI as DisplayObject);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDDentityCardUI(dict:Dictionary) : void
      {
         if(dict["TDDentityCardUI"] != null && dict["TDDentityCardUI"].data != null)
         {
            this.stTDDentityCardUI = dict["TDDentityCardUI"].data;
            this.addChild(this.stTDDentityCardUI as DisplayObject);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDVerifyInGameUI(dict:Dictionary) : void
      {
         if(this.stTDVerifyInGameUI == null)
         {
            this.stTDVerifyInGameUI = new TDVerifyInGameUI();
         }
         if(this.stTDVerifyInGameUI != null)
         {
            this.addChild(this.stTDVerifyInGameUI);
            this.stTDVerifyInGameUI.x = 475;
            this.stTDVerifyInGameUI.y = 300;
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDMicroClientUI(dict:Dictionary) : void
      {
         if(dict["TDMicroClientUI"] != null && dict["TDMicroClientUI"].data != null)
         {
            this.stTDMicroClientUI = dict["TDMicroClientUI"].data;
            this.addChild(this.stTDMicroClientUI as DisplayObject);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDGoHeadMapUI(dict:Dictionary) : void
      {
         if(dict["TDGoHeadMapUI"] != null && dict["TDGoHeadMapUI"].data != null)
         {
            this.stTDGoHeadMapUI = dict["TDGoHeadMapUI"].data;
            this.addChild(this.stTDGoHeadMapUI as DisplayObject);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDMobileGameUI(dict:Dictionary) : void
      {
         if(dict["TDMobileGameUI"] != null && dict["TDMobileGameUI"].data != null)
         {
            this.stTDMobileGameUI = dict["TDMobileGameUI"].data;
            this.addChild(this.stTDMobileGameUI as DisplayObject);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDReportUI(dict:Dictionary) : void
      {
         if(dict["TDReportUI"] != null && dict["TDReportUI"].data != null)
         {
            this.stTDReportUI = dict["TDReportUI"].data;
            this.addChild(this.stTDReportUI as DisplayObject);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDMeiShiMatchUI(dict:Dictionary) : void
      {
         if(dict["TDMeiShiMatchUI"] != null && dict["TDMeiShiMatchUI"].data != null)
         {
            this.stTDMeiShiMatchUI = dict["TDMeiShiMatchUI"].data;
            this.addChild(this.stTDMeiShiMatchUI as DisplayObject);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDExploreDiaryUI(dict:Dictionary) : void
      {
         if(dict["TDExploreDiaryUI"] != null && dict["TDExploreDiaryUI"].data != null)
         {
            this.stTDExploreDiaryUI = dict["TDExploreDiaryUI"].data;
            this.addChild(this.stTDExploreDiaryUI as DisplayObject);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDExploreStoreUI(dict:Dictionary) : void
      {
         if(dict["TDExploreStoreUI"] != null && dict["TDExploreStoreUI"].data != null)
         {
            this.stTDExploreStoreUI = dict["TDExploreStoreUI"].data;
            this.addChild(this.stTDExploreStoreUI as DisplayObject);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDExploreTaskUI(dict:Dictionary) : void
      {
         if(dict["TDExploreTaskUI"] != null && dict["TDExploreTaskUI"].data != null)
         {
            this.stTDExploreTaskUI = dict["TDExploreTaskUI"].data;
            this.addChild(this.stTDExploreTaskUI as DisplayObject);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDDesktopIconUI(dict:Dictionary) : void
      {
         if(dict["TDDesktopIconUI"] != null && dict["TDDesktopIconUI"].data != null)
         {
            this.stTDDesktopIconUI = dict["TDDesktopIconUI"].data;
            addChild(this.stTDDesktopIconUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDActivityDayPayUI(dict:Dictionary) : void
      {
         if(dict["TDActivityDayPayUI"] != null && dict["TDActivityDayPayUI"].data != null)
         {
            this.stTDActivityDayPayUI = dict["TDActivityDayPayUI"].data;
            addChild(this.stTDActivityDayPayUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDPetUI(dict:Dictionary) : void
      {
         if(dict["TDPetUI"] != null && dict["TDPetUI"].data != null)
         {
            this.stTDPetUI = dict["TDPetUI"].data;
            addChild(this.stTDPetUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDDailyRechargeUI(dict:Dictionary) : void
      {
         if(dict["TDDailyRechargeUI"] != null && dict["TDDailyRechargeUI"].data != null)
         {
            this.m_stTDDailyRechargeUI = dict["TDDailyRechargeUI"].data;
            addChild(this.m_stTDDailyRechargeUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDBirthdayActivityUI(dict:Dictionary) : void
      {
         if(dict["TDBirthdayActivityUI"] != null && dict["TDBirthdayActivityUI"].data != null)
         {
            this.m_stTDBirthdayActivity = dict["TDBirthdayActivityUI"].data;
            this.addChild(this.m_stTDBirthdayActivity);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDCumulativeRechargeActivityUI(dict:Dictionary) : void
      {
         if(dict["TDCumulativeRechargeActivityUI"] != null && dict["TDCumulativeRechargeActivityUI"].data != null)
         {
            this.m_stTDCumulativeRechargeActivityUI = dict["TDCumulativeRechargeActivityUI"].data;
            addChild(this.m_stTDCumulativeRechargeActivityUI);
         }
         this.RemoveTDLoadDialog();
      }
      
      private function InitialzeTDHolidayRechargeActivityUI(dict:Dictionary) : void
      {
         if(dict["TDHolidayRechargeActivityUI"] != null && dict["TDHolidayRechargeActivityUI"].data != null)
         {
            this.m_stTDHolidayRechargeActivityUI = dict["TDHolidayRechargeActivityUI"].data;
            addChild(this.m_stTDHolidayRechargeActivityUI);
         }
         this.RemoveTDLoadDialog();
      }
      
      private function InitialzeTDServiceOpenCarnivalUI(dict:Dictionary) : void
      {
         if(dict["TDServiceOpenCarnivalUI"] != null && dict["TDServiceOpenCarnivalUI"].data != null)
         {
            this.m_stTDServiceOpenCarnivalUI = dict["TDServiceOpenCarnivalUI"].data;
            addChild(this.m_stTDServiceOpenCarnivalUI);
         }
         this.RemoveTDLoadDialog();
      }
      
      private function InitialzeTDMonopolyUI(dict:Dictionary) : void
      {
         if(dict["TDMonopolyUI"] != null && dict["TDMonopolyUI"].data != null)
         {
            this.m_stTDMonopolyUI = dict["TDMonopolyUI"].data;
            addChild(this.m_stTDMonopolyUI);
         }
         this.RemoveTDLoadDialog();
      }
      
      private function InitialzeTDHandbookUI(dict:Dictionary) : void
      {
         if(dict["TDHandbookUI"] != null && dict["TDHandbookUI"].data != null)
         {
            this.m_stTDHandbookUI = dict["TDHandbookUI"].data;
            addChild(this.m_stTDHandbookUI);
         }
         this.RemoveTDLoadDialog();
      }
      
      private function InitialzeTDEditorUI(dict:Dictionary) : void
      {
         this.showCilckedTarget(this.m_stTDDiyLaboratoryUI,"TDDiyLaboratoryUI","猫博士的实验室",this.InitialzeTDDiyLaboratoryUI);
         this.showCilckedTarget(this.m_stTDMyChapterUI,"TDMyChapterUI","我的关卡",this.InitialzeTDMyChapterUI);
         if(dict["TDEditorUI"] != null && dict["TDEditorUI"].data != null)
         {
            this.m_stTDEditorUI = dict["TDEditorUI"].data;
            addChild(this.m_stTDEditorUI);
         }
         this.RemoveTDLoadDialog();
      }
      
      private function InitialzeTDDiyLaboratoryUI(dict:Dictionary) : void
      {
         if(dict["TDDiyLaboratoryUI"] != null && dict["TDDiyLaboratoryUI"].data != null)
         {
            this.m_stTDDiyLaboratoryUI = dict["TDDiyLaboratoryUI"].data;
            this.a_4554(this.m_stTDDiyLaboratoryUI);
            ITDLobbyRoomUI(this.m_stTDDiyLaboratoryUI).a_2120(this.a_1206);
            addChild(this.m_stTDDiyLaboratoryUI);
         }
         this.RemoveTDLoadDialog();
      }
      
      private function InitialzeTDMyChapterUI(dict:Dictionary) : void
      {
         if(dict["TDMyChapterUI"] != null && dict["TDMyChapterUI"].data != null)
         {
            this.m_stTDMyChapterUI = dict["TDMyChapterUI"].data;
            addChild(this.m_stTDMyChapterUI);
         }
         this.RemoveTDLoadDialog();
      }
      
      private function InitialzeTDServiceOpenBagsUI(dict:Dictionary) : void
      {
         if(dict["TDServiceOpenBagsUI"] != null && dict["TDServiceOpenBagsUI"].data != null)
         {
            this.m_stTDServiceOpenBagsUI = dict["TDServiceOpenBagsUI"].data;
            addChild(this.m_stTDServiceOpenBagsUI);
         }
         this.RemoveTDLoadDialog();
      }
      
      private function InitialzeTDContactGMUI(dict:Dictionary) : void
      {
         if(dict["TDContactGMUI"] != null && dict["TDContactGMUI"].data != null)
         {
            this.m_stTDContactGMUI = dict["TDContactGMUI"].data;
            addChild(this.m_stTDContactGMUI);
         }
         this.RemoveTDLoadDialog();
      }
      
      private function InitialzeTDQQInviteUI(dict:Dictionary) : void
      {
         if(dict["TDQQInviteUI"] != null && dict["TDQQInviteUI"].data != null)
         {
            this.m_stTDQQInviteUI = dict["TDQQInviteUI"].data;
            addChild(this.m_stTDQQInviteUI);
         }
         this.RemoveTDLoadDialog();
      }
      
      private function InitialzeTDCrossServerUI(dict:Dictionary) : void
      {
         if(dict["TDCrossServerUI"] != null && dict["TDCrossServerUI"].data != null)
         {
            this.m_stTDCrossServerUI = dict["TDCrossServerUI"].data;
            this.a_4554(this.m_stTDCrossServerUI);
            ITDLobbyRoomUI(this.m_stTDCrossServerUI).a_2120(this.a_1206);
            addChild(this.m_stTDCrossServerUI);
         }
         this.RemoveTDLoadDialog();
      }
      
      private function InitialzeTDWorldBossLevelUI(dict:Dictionary) : void
      {
         if(dict["TDWorldBossLevelUI"] != null && dict["TDWorldBossLevelUI"].data != null)
         {
            this.m_stTDWorldBossLevel = dict["TDWorldBossLevelUI"].data;
            this.a_4554(this.m_stTDWorldBossLevel);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function RemoveTDLoadDialog() : void
      {
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDTotalPayUI(dict:Dictionary) : void
      {
         if(dict["TDTotalPayUI"] != null && dict["TDTotalPayUI"].data != null)
         {
            this.m_stTDTotalPayUI = dict["TDTotalPayUI"].data;
            addChild(this.m_stTDTotalPayUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDPetEntranceUI(dict:Dictionary) : void
      {
         if(dict["TDPetEntranceUI"] != null && dict["TDPetEntranceUI"].data != null)
         {
            this.stTDPetEntranceUI = dict["TDPetEntranceUI"].data;
            addChild(this.stTDPetEntranceUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDWorldMapUI(dict:Dictionary) : void
      {
         if(dict["TDWorldMapUI"] != null && dict["TDWorldMapUI"].data != null)
         {
            this.stTDWorldMapUI = dict["TDWorldMapUI"].data;
            addChild(this.stTDWorldMapUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDFirstRechargeActivityUI(dict:Dictionary) : void
      {
         if(dict["TDFirstRechargeActivityUI"] != null && dict["TDFirstRechargeActivityUI"].data != null)
         {
            this.stTDFirstRechargeActivityUI = dict["TDFirstRechargeActivityUI"].data;
            addChild(this.stTDFirstRechargeActivityUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDFriendInviteUI(dict:Dictionary) : void
      {
         if(dict["TDFriendInviteUI"] != null && dict["TDFriendInviteUI"].data != null)
         {
            this.stTDFriendInviteUI = dict["TDFriendInviteUI"].data;
            addChild(this.stTDFriendInviteUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDMarriageRegistrationUI(dict:Dictionary) : void
      {
         if(dict["TDMarriageRegistrationUI"] != null && dict["TDMarriageRegistrationUI"].data != null)
         {
            this.m_stTDMarriageRegistrationUI = dict["TDMarriageRegistrationUI"].data;
            addChild(this.m_stTDMarriageRegistrationUI);
            if(this.m_bIsRequestMarriageCertificateAgree)
            {
               this.MarriageCertificateInvitedResultHandle(DefineMarriageCertificateOperation.REPLY_AGREE);
               this.m_bIsRequestMarriageCertificateAgree = false;
            }
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function InitialzeTDNActionUI(dict:Dictionary) : void
      {
         if(dict["TDNActionUI"] != null && dict["TDNActionUI"].data != null)
         {
            this.stTDNActionUI = dict["TDNActionUI"].data;
            addChild(this.stTDNActionUI);
         }
         if(this.stTDLoadDialog.parent != null)
         {
            this.stTDLoadDialog.parent.removeChild(this.stTDLoadDialog);
         }
      }
      
      private function setChooseChannelData() : void
      {
         this.m_killClose = true;
         var enterRoom:Object = a_2161.e.getEnterRoom();
         this.addChild(this.stTDChooseChannelUI);
         a_2144.e.initUserRoleDetail(this.stUserRoleDetail,a_2018.getInstance().a_791);
         a_2144.e.setSelectedChange(enterRoom.m_index,enterRoom.m_iRoomID);
         if(this.contains(this.stTDTownUI))
         {
            this.removeChild(this.stTDTownUI);
         }
         this.a_1206.a_2509(a_1750.enm_DefaultStatus);
      }
      
      private function a_4576(a_4730:Event) : void
      {
         this.stTDVSGuideUI.removeEventListener(Event.REMOVED_FROM_STAGE,this.a_4576);
      }
      
      private function InitialzeTDLobbyRoomUI() : void
      {
         var mapID:String = null;
         var dataEvent:a_1778 = null;
         var obj:Object = null;
         var enterRoom:Object = a_2161.e.getEnterRoom();
         this.addChild(this.stTDLobbyRoomUI as DisplayObject);
         this.stTDLobbyRoomUI.a_2120(this.a_1206);
         this.stTDViliantUI.a_2120(this.a_1206);
         (this.stTDLobbyRoomUI as Object).SetReturnType(this.currentPosition);
         a_2158.e.onShowAllButtonStatus(true);
         this.mBridge.execute("onInitialzeGameIMData",this,EnmGameIM.a_512);
         this.addChild(this.stTDRoomUserUI);
         (this.stTDRoomUserUI as Object).showAvatarView(this.stTDLobbyRoomUI,enterRoom.m_index);
         addChild(this.stServerList);
         this.addChild(this.stTDMenuUI as DisplayObject);
         (this.stTDRoomUserUI as Object).onSetRoomType(1);
         a_2159.e.onPlayLobbyBgSound();
         if(this.m_stTDCrossServerUI)
         {
            ITDLobbyRoomUI(this.m_stTDCrossServerUI).a_2120(this.a_1206);
            if(5 == enterRoom.m_index)
            {
               addChild(this.m_stTDCrossServerUI);
            }
         }
         if(this.m_stTDDiyLaboratoryUI)
         {
            ITDLobbyRoomUI(this.m_stTDDiyLaboratoryUI).a_2120(this.a_1206);
            if(6 == enterRoom.m_index)
            {
               addChild(this.m_stTDDiyLaboratoryUI);
            }
         }
         if(Boolean(this.m_stTDWorldBossLevel) && enterRoom.m_index == ROOM_ID_WORLD_BOSS_LEVEL)
         {
            this.addChild(this.m_stTDWorldBossLevel);
            this.currentPosition = 1;
            a_2159.e.onPlayWorldBossSound();
         }
         if(this.currentPosition == 16)
         {
            this.currentPosition = 1;
            if(this.stTDWorldMapUI != null && contains(this.stTDWorldMapUI))
            {
               ITDActionsUI(this.stTDWorldMapUI).showActionUI(this.currentPosition);
               removeChild(this.stTDWorldMapUI);
            }
            enterRoom.m_isEnterMatch = 0;
            this.showCilckedTarget(this.stTDMoTaUI,"TDMoTaUI",this.gsManager.getString(4415),this.InitialzeTDMoTaUI);
         }
         if(this.currentPosition == 17)
         {
            this.currentPosition = 1;
            if(this.stTDWorldMapUI != null && contains(this.stTDWorldMapUI))
            {
               ITDActionsUI(this.stTDWorldMapUI).showActionUI(this.currentPosition);
               removeChild(this.stTDWorldMapUI);
            }
            this.showCilckedTarget(this.stTDViliantUI as DisplayObject,"TDViliantUI",this.gsManager.getString(135497),this.InitialzeTDViliantUI);
         }
         if(this.currentPosition == 18)
         {
            this.currentPosition = 1;
            if(this.stTDWorldMapUI != null && contains(this.stTDWorldMapUI))
            {
               ITDActionsUI(this.stTDWorldMapUI).showActionUI(this.currentPosition);
               removeChild(this.stTDWorldMapUI);
            }
            mapID = ThunderCityConfig.Get().getHappyHolidayMapID();
            ActivityEntranceModel.Instance.gotoGame(mapID);
         }
         if(this.currentPosition == 19)
         {
            this.currentPosition = 1;
            if(this.stTDWorldMapUI != null && contains(this.stTDWorldMapUI))
            {
               ITDActionsUI(this.stTDWorldMapUI).showActionUI(this.currentPosition);
               removeChild(this.stTDWorldMapUI);
            }
            ActivityEntranceModel.Instance.gotoGame("0x0203");
         }
         if(this.m_iNewYearBossPosition == 1)
         {
            this.currentPosition = 1;
            this.m_iNewYearBossPosition = 0;
            if(this.stTDWorldMapUI != null && contains(this.stTDWorldMapUI))
            {
               ITDActionsUI(this.stTDWorldMapUI).showActionUI(this.currentPosition);
               removeChild(this.stTDWorldMapUI);
            }
            dataEvent = new a_1778(EventType.SHORT_CUT_NEW_YEAR_BOSS);
            obj = {};
            obj.m_iType = ConsortiaTaskConfig.Get().GetNianMapID(1);
            dataEvent.dataObject = obj;
            LobbyEventManager.Get().dispatchEvent(dataEvent);
         }
         else if(this.m_iNewYearBossPosition == 2)
         {
            this.currentPosition = 2;
            this.m_iNewYearBossPosition = 0;
            if(this.stTDWorldMapUI != null && contains(this.stTDWorldMapUI))
            {
               ITDActionsUI(this.stTDWorldMapUI).showActionUI(this.currentPosition);
               removeChild(this.stTDWorldMapUI);
            }
            dataEvent = new a_1778(EventType.SHORT_CUT_NEW_YEAR_BOSS);
            obj = {};
            obj.m_iType = ConsortiaTaskConfig.Get().GetNianMapID(2);
            dataEvent.dataObject = obj;
            LobbyEventManager.Get().dispatchEvent(dataEvent);
         }
         else if(this.m_iNewYearBossPosition == 3)
         {
            this.currentPosition = 6;
            this.m_iNewYearBossPosition = 0;
            if(this.stTDWorldMapUI != null && contains(this.stTDWorldMapUI))
            {
               ITDActionsUI(this.stTDWorldMapUI).showActionUI(this.currentPosition);
               removeChild(this.stTDWorldMapUI);
            }
            dataEvent = new a_1778(EventType.SHORT_CUT_NEW_YEAR_BOSS);
            obj = {};
            obj.m_iType = ConsortiaTaskConfig.Get().GetNianMapID(3);
            dataEvent.dataObject = obj;
            LobbyEventManager.Get().dispatchEvent(dataEvent);
         }
         else if(this.m_iNewYearBossPosition == 4)
         {
            this.currentPosition = 1;
            this.m_iNewYearBossPosition = 0;
            if(this.stTDWorldMapUI != null && contains(this.stTDWorldMapUI))
            {
               ITDActionsUI(this.stTDWorldMapUI).showActionUI(this.currentPosition);
               removeChild(this.stTDWorldMapUI);
            }
            dataEvent = new a_1778(EventType.SHORT_CUT_NEW_YEAR_BOSS);
            obj = {};
            obj.m_iType = GlobalVariables.getInstance().m_iMoonMapID;
            dataEvent.dataObject = obj;
            LobbyEventManager.Get().dispatchEvent(dataEvent);
         }
         else if(this.m_iNewYearBossPosition == 5)
         {
            this.currentPosition = 1;
            this.m_iNewYearBossPosition = 0;
            if(this.stTDWorldMapUI != null && contains(this.stTDWorldMapUI))
            {
               ITDActionsUI(this.stTDWorldMapUI).showActionUI(this.currentPosition);
               removeChild(this.stTDWorldMapUI);
            }
            dataEvent = new a_1778(EventType.SHORT_CUT_NEW_YEAR_BOSS);
            obj = {};
            obj.m_iType = GlobalVariables.getInstance().m_iGodownMapID;
            dataEvent.dataObject = obj;
            LobbyEventManager.Get().dispatchEvent(dataEvent);
         }
         else if(this.m_iNewYearBossPosition == 6)
         {
            this.currentPosition = 1;
            this.m_iNewYearBossPosition = 0;
            if(this.stTDWorldMapUI != null && contains(this.stTDWorldMapUI))
            {
               ITDActionsUI(this.stTDWorldMapUI).showActionUI(this.currentPosition);
               removeChild(this.stTDWorldMapUI);
            }
            dataEvent = new a_1778(EventType.SHORT_CUT_NEW_YEAR_BOSS);
            obj = {};
            obj.m_iType = GlobalVariables.getInstance().m_iDieMapID;
            dataEvent.dataObject = obj;
            LobbyEventManager.Get().dispatchEvent(dataEvent);
         }
         else if(this.m_iNewYearBossPosition == 7)
         {
            this.currentPosition = 1;
            this.m_iNewYearBossPosition = 0;
            this.a_1206.a_2485(this.m_iEnterInfo.m_iServerID,this.m_iEnterInfo.m_iRoomID,this.m_iEnterInfo.m_iTableID,-1,"",this.m_iEnterInfo.m_szPassword,[this.m_iEnterInfo.m_mapID],this.m_iEnterInfo.m_gameMode,-1);
         }
         else if(this.m_iNewYearBossPosition == 8)
         {
            this.currentPosition = 1;
            this.m_iNewYearBossPosition = 0;
            if(this.stTDWorldMapUI != null && contains(this.stTDWorldMapUI))
            {
               ITDActionsUI(this.stTDWorldMapUI).showActionUI(this.currentPosition);
               removeChild(this.stTDWorldMapUI);
            }
            dataEvent = new a_1778(EventType.SHORT_CUT_NEW_YEAR_BOSS);
            obj = {};
            obj.m_iType = SnowMountainConfig.Get().GetNianMapID(1);
            dataEvent.dataObject = obj;
            LobbyEventManager.Get().dispatchEvent(dataEvent);
         }
         else if(this.m_iNewYearBossPosition == 9)
         {
            this.currentPosition = 2;
            this.m_iNewYearBossPosition = 0;
            if(this.stTDWorldMapUI != null && contains(this.stTDWorldMapUI))
            {
               ITDActionsUI(this.stTDWorldMapUI).showActionUI(this.currentPosition);
               removeChild(this.stTDWorldMapUI);
            }
            dataEvent = new a_1778(EventType.SHORT_CUT_NEW_YEAR_BOSS);
            obj = {};
            obj.m_iType = SnowMountainConfig.Get().GetNianMapID(2);
            dataEvent.dataObject = obj;
            LobbyEventManager.Get().dispatchEvent(dataEvent);
         }
         else if(this.m_iNewYearBossPosition == 10)
         {
            this.currentPosition = 2;
            this.m_iNewYearBossPosition = 0;
            if(this.stTDWorldMapUI != null && contains(this.stTDWorldMapUI))
            {
               ITDActionsUI(this.stTDWorldMapUI).showActionUI(this.currentPosition);
               removeChild(this.stTDWorldMapUI);
            }
            dataEvent = new a_1778(EventType.SHORT_CUT_NEW_YEAR_BOSS);
            obj = {};
            obj.m_iType = SnowMountainConfig.Get().GetNianMapID(3);
            dataEvent.dataObject = obj;
            LobbyEventManager.Get().dispatchEvent(dataEvent);
         }
         else if(this.m_iNewYearBossPosition == 11)
         {
            this.currentPosition = 2;
            this.m_iNewYearBossPosition = 0;
            if(this.stTDWorldMapUI != null && contains(this.stTDWorldMapUI))
            {
               ITDActionsUI(this.stTDWorldMapUI).showActionUI(this.currentPosition);
               removeChild(this.stTDWorldMapUI);
            }
            dataEvent = new a_1778(EventType.SHORT_CUT_NEW_YEAR_BOSS);
            obj = {};
            obj.m_iType = SnowMountainConfig.Get().GetNianMapID(4);
            dataEvent.dataObject = obj;
            LobbyEventManager.Get().dispatchEvent(dataEvent);
         }
         else if(this.m_iNewYearBossPosition == 12)
         {
            this.currentPosition = 6;
            this.m_iNewYearBossPosition = 0;
            if(this.stTDWorldMapUI != null && contains(this.stTDWorldMapUI))
            {
               ITDActionsUI(this.stTDWorldMapUI).showActionUI(this.currentPosition);
               removeChild(this.stTDWorldMapUI);
            }
            dataEvent = new a_1778(EventType.SHORT_CUT_NEW_YEAR_BOSS);
            obj = {};
            obj.m_iType = SnowMountainConfig.Get().GetNianMapID(5);
            dataEvent.dataObject = obj;
            LobbyEventManager.Get().dispatchEvent(dataEvent);
         }
         else if(this.m_iNewYearBossPosition == 13)
         {
            this.m_iNewYearBossPosition = 0;
            if(this.stTDWorldMapUI != null && contains(this.stTDWorldMapUI))
            {
               ITDActionsUI(this.stTDWorldMapUI).showActionUI(this.currentPosition);
               removeChild(this.stTDWorldMapUI);
            }
            this.showCilckedTarget(this.stTDMeiShiMatchUI as DisplayObject,"TDMeiShiMatchUI",this.gsManager.getString(139616),this.InitialzeTDMeiShiMatchUI);
            dataEvent = new a_1778(EventType.SHORT_CUT_NEW_YEAR_BOSS);
            obj = {};
            obj.m_iType = this.MeishiTarget.m_iMapID;
            dataEvent.dataObject = obj;
            LobbyEventManager.Get().dispatchEvent(dataEvent);
         }
         else if(this.m_iNewYearBossPosition == 14)
         {
            this.currentPosition = this.MeishiTarget.m_land + 1;
            this.m_iNewYearBossPosition = 0;
            if(this.stTDWorldMapUI != null && contains(this.stTDWorldMapUI))
            {
               ITDActionsUI(this.stTDWorldMapUI).showActionUI(this.currentPosition);
               removeChild(this.stTDWorldMapUI);
            }
            this.showCilckedTarget(this.stTDThunderCityExploreUI as DisplayObject,"TDThunderCityExploreUI",this.gsManager.getString(139616),this.InitialzeTDThunderCityExploreUI);
            dataEvent = new a_1778(EventType.SHORT_CUT_NEW_YEAR_BOSS);
            obj = {};
            obj.m_iType = this.MeishiTarget.m_iMapID;
            dataEvent.dataObject = obj;
            LobbyEventManager.Get().dispatchEvent(dataEvent);
         }
         else if(this.m_iNewYearBossPosition == 15)
         {
            this.currentPosition = this.MeishiTarget.m_land + 1;
            this.m_iNewYearBossPosition = 0;
            if(this.stTDWorldMapUI != null && contains(this.stTDWorldMapUI))
            {
               ITDActionsUI(this.stTDWorldMapUI).showActionUI(this.currentPosition);
               removeChild(this.stTDWorldMapUI);
            }
            this.showCilckedTarget(this.stTDGoHeadMapUI as DisplayObject,"TDGoHeadMapUI",this.gsManager.getString(139616),this.InitialzeTDGoHeadMapUI);
            dataEvent = new a_1778(EventType.SHORT_CUT_NEW_YEAR_BOSS);
            obj = {};
            obj.m_iType = this.MeishiTarget.m_iMapID;
            dataEvent.dataObject = obj;
            LobbyEventManager.Get().dispatchEvent(dataEvent);
         }
         else if(this.m_iNewYearBossPosition == 16)
         {
            this.currentPosition = 10;
            this.m_iNewYearBossPosition = 0;
            if(this.stTDWorldMapUI != null && contains(this.stTDWorldMapUI))
            {
               ITDActionsUI(this.stTDWorldMapUI).showActionUI(this.currentPosition);
               removeChild(this.stTDWorldMapUI);
            }
            dataEvent = new a_1778(EventType.SHORT_CUT_NEW_YEAR_BOSS);
            obj = {};
            obj.m_iType = ConsortiaTaskConfig.Get().GetNianMapID(4);
            dataEvent.dataObject = obj;
            LobbyEventManager.Get().dispatchEvent(dataEvent);
         }
      }
      
      private function loaderClickedTarget(target:DisplayObject, id:String, showName:String, loadedHandler:Function, visibleLoadDialog:Boolean = true) : void
      {
         var dict:Dictionary = new Dictionary();
         dict[id] = new AssetsItemData(this.a_1203[id],AssetType.SWF,id);
         stage.addChild(this.stTDLoadDialog);
         this.stTDLoadDialog.visible = visibleLoadDialog;
         (this.stTDLoadDialog as ITDLoadDialog).showLoadContentMsg("\"" + showName + "\"" + GameStringManager.getInstance().getString(24635));
         (this.stTDLoadDialog as ITDLoadDialog).showLoadProgress(0);
         this.loader.load(dict,{
            "onComplete":loadedHandler,
            "onProgress":this.a_4553,
            "onProgressParms":[id]
         });
      }
      
      private function showCilckedTarget(target:DisplayObject, id:String, showName:String, loadedHandler:Function, visibleLoadDialog:Boolean = true) : void
      {
         if(this.showTipUnOpen(id))
         {
            return;
         }
         if(null == target)
         {
            this.loaderClickedTarget(target,id,showName,loadedHandler,visibleLoadDialog);
         }
         else if(target.parent == this)
         {
            removeChild(target);
            target.visible = false;
            this.checkOpenAutoPopWin(id);
            if(this.stTDStoreUI == target && (null == this.stTDConsortiaUI || this != this.stTDConsortiaUI.parent))
            {
               addChild(this.stTDMenuUI as DisplayObject);
            }
            if(this.stTDMoTaUI != null && this.contains(this.stTDMoTaUI) && !this.contains(this.gameLoader))
            {
               this.addChild(this.stTDMoTaUI);
            }
            if(this.stTDMoTaUI != null && target == this.stTDMoTaUI)
            {
               this.InitialzeTDLobbyRoomUI();
            }
         }
         else
         {
            target.visible = true;
            addChild(target);
            if(this.stTDComposeUI == target)
            {
               if(this.consortiaIsOpen)
               {
                  a_2145.e.onShowConsortiaSign(false,1);
               }
            }
            if(this.stTDStoreUI == target)
            {
               this.stTDStoreUI.a_3777(this.m_iStoreType,null);
            }
            if(target == this.stTDConsortiaUI)
            {
               this.notifyStaticConsortiaTask();
            }
            if(this.stTDNewActionUI == target)
            {
               ITDActionsUI(this.stTDNewActionUI).showActionUI(0);
            }
            if(this.stTDHuangZuanWelfareUI == target)
            {
               ITDActionsUI(this.stTDHuangZuanWelfareUI).showActionUI(0);
            }
         }
      }
      
      private function notifyStaticConsortiaTask() : void
      {
         var objConsortiaInfo:Object = a_2161.e.a_2163();
         if(null == objConsortiaInfo)
         {
            return;
         }
         if(null == objConsortiaInfo.m_stJoinInfo)
         {
            return;
         }
         if(0 == objConsortiaInfo.m_stJoinInfo.m_iID)
         {
            return;
         }
         LobbyEventManager.Get().dispatchEvent(new FriendSystemEvent(a_4514.a_705));
         var objEvent:FriendSystemEvent = new FriendSystemEvent(a_4514.a_707);
         objEvent.m_pExtraObject = {};
         objEvent.m_pExtraObject.iLevel = objConsortiaInfo.m_stConsortiaInfo.m_iLevel;
         objEvent.m_pExtraObject.iShopLevel = objConsortiaInfo.m_stConsortiaInfo.m_stEstablishment[EnmConsortia.a_379].m_iLevel;
         objEvent.m_pExtraObject.iSkillLevel = objConsortiaInfo.m_stConsortiaInfo.m_stEstablishment[EnmConsortia.a_381].m_iLevel;
         objEvent.m_pExtraObject.iComposeLevel = objConsortiaInfo.m_stConsortiaInfo.m_stEstablishment[EnmConsortia.a_380].m_iLevel;
         LobbyEventManager.Get().dispatchEvent(objEvent);
      }
      
      private function a_2483(iServerID:int, iRoomID:int) : void
      {
         var mitem1:Object = null;
         var roomItem:Object = null;
         var isCrossServer:Boolean = false;
         var enterRoom:Object = a_2161.e.getEnterRoom();
         if(Boolean(enterRoom.m_iLeaveRoom) || Boolean(enterRoom.m_iServerID != iServerID) || enterRoom.m_iRoomID != iRoomID)
         {
            this.a_3744(GameStringManager.getInstance().getString(24636),"",true,true,false,false);
            if(iServerID == -1)
            {
               roomItem = a_2018.getInstance().getNewPlayerRoomID(enterRoom.m_index);
               iServerID = int(roomItem.iServerID);
               iRoomID = int(roomItem.iRoomID);
            }
            if(iServerID != -1)
            {
               enterRoom.m_iUpServerID = enterRoom.m_iServerID;
               enterRoom.m_iUpRoomeID = enterRoom.m_iRoomID;
               enterRoom.m_iServerID = iServerID;
               enterRoom.m_iRoomID = iRoomID;
            }
            if(enterRoom.m_iUpServerID != enterRoom.m_iServerID || enterRoom.m_iUpRoomeID != enterRoom.m_iRoomID)
            {
               isCrossServer = a_2018.SetCrossServerState(enterRoom.m_iUpRoomeID);
               if(isCrossServer)
               {
                  CrossServerHandler.Get().ClearUpChat();
               }
            }
            if(ROOM_ID_MEI_SHI == enterRoom.m_index)
            {
               if(this.stTDMeiShiUI == null)
               {
                  SendCountInfoHandle.Get().SendLog(4001);
                  this.showCilckedTarget(this.stTDMeiShiUI,"TDMeiShiUI","",this.a_4555,false);
               }
               else
               {
                  this.a_4554(this.stTDMeiShiUI);
               }
            }
            else if(ROOM_ID_WORLD_BOSS_LEVEL == enterRoom.m_index)
            {
               if(this.m_stTDWorldBossLevel == null)
               {
                  this.showCilckedTarget(this.m_stTDWorldBossLevel,"TDWorldBossLevelUI","世界boss副本",this.InitialzeTDWorldBossLevelUI);
               }
               else
               {
                  this.a_4554(this.m_stTDWorldBossLevel);
               }
            }
            else if(ROOM_ID_WORLD_BOSS_TRAIN == enterRoom.m_index)
            {
               this.a_4554(this.m_stTDWorldBossLevel);
            }
            else if(ROOM_ID_HUO_SHAN == enterRoom.m_index)
            {
               if(this.stTDHuoShanUI == null)
               {
                  this.showCilckedTarget(this.stTDHuoShanUI,"TDHuoShanUI","",this.a_4556,false);
               }
               else
               {
                  this.a_4554(this.stTDHuoShanUI);
               }
            }
            else if(ROOM_ID_SKY_CASTLE == enterRoom.m_index)
            {
               if(this.stTDSkyCastleUI == null)
               {
                  this.showCilckedTarget(this.stTDSkyCastleUI,"TDSkyCastleUI","",this.InitialzeTDSkyCastleUI,false);
               }
               else
               {
                  this.a_4554(this.stTDSkyCastleUI);
               }
            }
            else if(ROOM_ID_SEAFLOOR_WHIRLPOOL == enterRoom.m_index)
            {
               if(this.stTDSeafloorWhirlpoolUI == null)
               {
                  this.showCilckedTarget(this.stTDSeafloorWhirlpoolUI,"TDSeafloorWhirlpoolUI","",this.InitialzeTDSeafloorWhirlpoolUI,false);
               }
               else
               {
                  this.a_4554(this.stTDSeafloorWhirlpoolUI);
               }
            }
            else if(ROOM_ID_SHUJIA_DESERT == enterRoom.m_index)
            {
               if(this.stTDWonderlandUI == null)
               {
                  this.showCilckedTarget(this.stTDWonderlandUI,"TDWonderlandUI","",this.InitialzeTDWonderlandUI,false);
               }
               else
               {
                  this.a_4554(this.stTDWonderlandUI);
               }
            }
            else if(ROOM_ID_EXPLORE_CAM == enterRoom.m_index)
            {
               if(this.stTDExploreCampLandUI == null)
               {
                  this.showCilckedTarget(this.stTDExploreCampLandUI,"TDExploreCampLandUI","",this.InitialzeTDExploreCampLandUI,false);
               }
               else
               {
                  this.a_4554(this.stTDExploreCampLandUI);
               }
            }
            else if(ROOM_ID_SNOW_THUNDERCITY == enterRoom.m_index)
            {
               if(this.stTDSnowDesertLandUI == null)
               {
                  this.showCilckedTarget(this.stTDSnowDesertLandUI,"TDSnowDesertLandUI","",this.InitialzeTDSnowDesertLandUI,false);
               }
               else
               {
                  this.a_4554(this.stTDSnowDesertLandUI);
               }
            }
            else if(ROOM_ID_DESERT == enterRoom.m_index)
            {
               if(this.stTDDesertLandUI == null)
               {
                  this.showCilckedTarget(this.stTDDesertLandUI,"TDDesertLandUI","",this.InitialzeTDDesertLandUI,false);
               }
               else
               {
                  this.a_4554(this.stTDDesertLandUI);
               }
            }
            else if(ROOM_ID_OUTERSPACETAVEL == enterRoom.m_index)
            {
               if(this.stTDOuterSpaceTavelLandUI == null)
               {
                  this.showCilckedTarget(this.stTDOuterSpaceTavelLandUI,"TDOuterSpaceTavelLandUI","",this.InitialzeNewUI,false);
               }
               else
               {
                  this.a_4554(this.stTDOuterSpaceTavelLandUI);
               }
            }
            else if(ROOM_ID_EARTHCORE_EXPEDITION == enterRoom.m_index)
            {
               if(this.stTDEarthcoreExpeditionLandUI == null)
               {
                  this.showCilckedTarget(this.stTDEarthcoreExpeditionLandUI,"TDEarthcoreExpeditionLandUI","",this.InitialzeNewUI,false);
               }
               else
               {
                  this.a_4554(this.stTDEarthcoreExpeditionLandUI);
               }
            }
            else if(ROOM_ID_CROSS_SERVER == enterRoom.m_index)
            {
               if(this.m_stTDCrossServerUI == null)
               {
                  this.showCilckedTarget(this.m_stTDCrossServerUI,"TDCrossServerUI","跨服副本",this.InitialzeTDCrossServerUI);
               }
               else
               {
                  this.a_4554(this.m_stTDCrossServerUI);
               }
            }
            else if(ROOM_ID_DIY_SERVER == enterRoom.m_index)
            {
               if(this.m_stTDDiyLaboratoryUI == null)
               {
                  this.showCilckedTarget(this.m_stTDDiyLaboratoryUI,"TDDiyLaboratoryUI","猫博士的实验室",this.InitialzeTDDiyLaboratoryUI);
               }
               else
               {
                  this.a_4554(this.m_stTDDiyLaboratoryUI);
               }
            }
            else if(3 == enterRoom.m_index)
            {
               if(this.stTDDeepSeaRemainsUI == null)
               {
                  this.showCilckedTarget(this.stTDDeepSeaRemainsUI,"TDDeepSeaRemainsUI","",this.InitailzeTDDeepSeaRemainsUI,false);
               }
               else
               {
                  this.a_4554(this.stTDDeepSeaRemainsUI);
               }
            }
            else if(enterRoom.m_index == 2)
            {
               if(this.stTDVSUI == null)
               {
                  this.showCilckedTarget(this.stTDVSUI,"TDVSUI","",this.a_4557,false);
               }
               else
               {
                  this.a_4554(this.stTDVSUI);
               }
            }
         }
         else
         {
            if(enterRoom.m_index == ROOM_ID_MEI_SHI && this.storyGuideCondition != null && Boolean(this.storyGuideCondition["n_meishi"]))
            {
               this.storyGuideCondition["n_meishi"] = false;
               MeishiGuide.Instance.showStoryGuide(this.hasStoryGuide());
            }
            else if(enterRoom.m_index == ROOM_ID_HUO_SHAN && this.storyGuideCondition != null && Boolean(this.storyGuideCondition["n_huoshan"]))
            {
               this.storyGuideCondition["n_huoshan"] = false;
               MeishiGuide.Instance.showStoryGuide(this.hasStoryGuide());
            }
            else if(enterRoom.m_index == ROOM_ID_SKY_CASTLE && this.storyGuideCondition != null && Boolean(this.storyGuideCondition["n_skycastle"]))
            {
               this.storyGuideCondition["n_skycastle"] = false;
               MeishiGuide.Instance.showStoryGuide(this.hasStoryGuide());
            }
            else if(enterRoom.m_index == ROOM_ID_SEAFLOOR_WHIRLPOOL && this.storyGuideCondition != null && Boolean(this.storyGuideCondition["n_seafloorWhirlpool"]))
            {
               this.storyGuideCondition["n_seafloorWhirlpool"] = false;
               MeishiGuide.Instance.showStoryGuide(this.hasStoryGuide());
            }
            if(enterRoom.m_index == ROOM_ID_MEI_SHI && this.menuOpenCondition != null && Boolean(this.menuOpenCondition["meishi"]))
            {
               this.menuOpenCondition["meishi"] = false;
               MeishiGuide.Instance.showMenuOpenAnimation(this.menuOpenCondition["id"]);
            }
            else if(enterRoom.m_index == ROOM_ID_HUO_SHAN && this.menuOpenCondition != null && Boolean(this.menuOpenCondition["huoshan"]))
            {
               this.menuOpenCondition["huoshan"] = false;
               MeishiGuide.Instance.showMenuOpenAnimation(this.menuOpenCondition["id"]);
            }
            else if(enterRoom.m_index == ROOM_ID_SKY_CASTLE && this.menuOpenCondition != null && Boolean(this.menuOpenCondition["skycastle"]))
            {
               this.menuOpenCondition["skycastle"] = false;
               MeishiGuide.Instance.showMenuOpenAnimation(this.menuOpenCondition["id"]);
            }
            else if(enterRoom.m_index == ROOM_ID_SEAFLOOR_WHIRLPOOL && this.menuOpenCondition != null && Boolean(this.menuOpenCondition["seafloorWhirlpool"]))
            {
               this.menuOpenCondition["seafloorWhirlpool"] = false;
               MeishiGuide.Instance.showMenuOpenAnimation(this.menuOpenCondition["id"]);
            }
            if(enterRoom.m_index == ROOM_ID_MEI_SHI && this.LevelUpCondition != null && Boolean(this.LevelUpCondition["meishi"]))
            {
               this.LevelUpCondition["meishi"] = false;
               MeishiGuide.Instance.showLevelUpAnimation(this.LevelUpCondition["id"]);
            }
            else if(enterRoom.m_index == ROOM_ID_HUO_SHAN && this.LevelUpCondition != null && Boolean(this.LevelUpCondition["huoshan"]))
            {
               this.LevelUpCondition["huoshan"] = false;
               MeishiGuide.Instance.showLevelUpAnimation(this.LevelUpCondition["id"]);
            }
            else if(enterRoom.m_index == ROOM_ID_SKY_CASTLE && this.LevelUpCondition != null && Boolean(this.LevelUpCondition["skycastle"]))
            {
               this.LevelUpCondition["skycastle"] = false;
               MeishiGuide.Instance.showLevelUpAnimation(this.LevelUpCondition["id"]);
            }
            else if(enterRoom.m_index == ROOM_ID_SEAFLOOR_WHIRLPOOL && this.LevelUpCondition != null && Boolean(this.LevelUpCondition["seafloorWhirlpool"]))
            {
               this.LevelUpCondition["seafloorWhirlpool"] = false;
               MeishiGuide.Instance.showLevelUpAnimation(this.LevelUpCondition["id"]);
            }
         }
      }
      
      private function onClickEvent(a_4730:MouseEvent) : void
      {
         var mitem1:Object = null;
         var currentRole:Object = null;
         var enterRoom:Object = null;
         var obj:Object = null;
         var iLevel:int = 0;
         var channelItem:ChannelItem = null;
         var roomItem:Object = null;
         var meiweiItem:Object = null;
         var dataEvent:a_1778 = null;
         var objs:Object = null;
         var siteType:String = null;
         var url:URLRequest = null;
         var download:a_4643 = null;
         var sitetype:String = null;
         var mitem0:Object = null;
         var openRoleLevel:int = 0;
         var roomList:Array = null;
         var roomList2:Array = null;
         var iconList:Array = null;
         var icon:MenuIconStruct = null;
         var stime:Date = null;
         var etime:Date = null;
         var times:Array = null;
         var platfrom:String = null;
         var nowtime:Number = NaN;
         var mapID:String = null;
         var arrRoomList:Array = null;
         var urlStrProve:String = null;
         var reqProve:URLRequest = null;
         var ade:a_1778 = null;
         var dob:Object = null;
         var urlStr:String = null;
         var req:URLRequest = null;
         var xx:MouseEvent = a_4730;
         if(this.m_isGaming)
         {
            return;
         }
         if(a_4730.target.name == "send_btn" || a_4730.target.name == "vip_everyBtn" || a_4730.target.name == "buy_btn" || a_4730.target.name == "search_btn" || a_4730.target.name == "sell_btn")
         {
            if(this.send360Regidit())
            {
               return;
            }
         }
         if(Boolean(this.stServerList) && "m_ChangeLineBtn" != a_4730.target.name)
         {
            (this.stServerList as ITDServerList).hideChannelList();
         }
         var m_iGroupID:int = int(a_2161.e.getEnterRoom().m_iGroupID);
         if(a_4730.target.name == "standUpBtn" && Boolean(a_4730.target.enabled))
         {
            this.a_1206.a_2508();
         }
         if(a_4730.target as ChannelItem)
         {
            channelItem = ChannelItem(a_4730.target);
            roomItem = channelItem.roomItem;
            enterRoom = a_2161.e.getEnterRoom();
            enterRoom.m_iUpServerID = enterRoom.m_iServerID;
            enterRoom.m_iUpRoomeID = enterRoom.m_iRoomID;
            enterRoom.m_index = roomItem.index;
            this.a_2483(roomItem.iServerID,roomItem.iRoomID);
         }
         if(a_4730.target.name == "boat" || a_4730.target.name == "enter")
         {
            enterRoom = a_2161.e.getEnterRoom();
            if(enterRoom.m_index == 2 || enterRoom.m_index == ROOM_ID_CROSS_SERVER || enterRoom.m_index == ROOM_ID_DIY_SERVER || enterRoom.m_index == ROOM_ID_SHUJIA_DESERT || enterRoom.m_index == ROOM_ID_WORLD_BOSS_LEVEL)
            {
               meiweiItem = a_2018.getInstance().getNewPlayerRoomID(0);
               enterRoom.m_iRoomID = meiweiItem.iRoomID;
               enterRoom.m_iServerID = meiweiItem.iServerID;
               enterRoom.m_index = 0;
               this.a_2483(-1,-1);
            }
            else if(enterRoom.m_index == 3)
            {
               meiweiItem = a_2018.getInstance().getNewPlayerRoomID(1);
               enterRoom.m_iRoomID = meiweiItem.iRoomID;
               enterRoom.m_iServerID = meiweiItem.iServerID;
               enterRoom.m_index = 1;
               this.a_2483(-1,-1);
            }
            else
            {
               this.a_2483(-1,-1);
            }
         }
         if(a_4730.target.name == "meishiBtn" || a_4730.target.name == "turnMenuMeiShiBtn")
         {
            this.setTurnToPanel(true);
            enterRoom = a_2161.e.getEnterRoom();
            enterRoom.m_index = ROOM_ID_MEI_SHI;
            this.a_2483(-1,-1);
         }
         if(a_4730.target.name == "huoshanBtn" || a_4730.target.name == "turnMenuHuoShanBtn")
         {
            this.setTurnToPanel(true);
            enterRoom = a_2161.e.getEnterRoom();
            enterRoom.m_index = ROOM_ID_HUO_SHAN;
            this.a_2483(-1,-1);
         }
         if(a_4730.target.name == "skycastleBtn" || a_4730.target.name == "turnMenuSkyCastleBtn")
         {
            this.setTurnToPanel(true);
            enterRoom = a_2161.e.getEnterRoom();
            enterRoom.m_index = ROOM_ID_SKY_CASTLE;
            this.a_2483(-1,-1);
         }
         if(a_4730.target.name == "seafloorWhirlpoolBtn")
         {
            this.setTurnToPanel(true);
            enterRoom = a_2161.e.getEnterRoom();
            enterRoom.m_index = ROOM_ID_SEAFLOOR_WHIRLPOOL;
            this.a_2483(-1,-1);
         }
         if(a_4730.target.name == "WonderlandBtn")
         {
            this.showCilckedTarget(this.stTDExploreRoomPopUI as DisplayObject,"TDExploreRoomPopUI","",this.InitialzeTDExploreRoomPopUI);
            this.setTurnToPanel(true);
            enterRoom = a_2161.e.getEnterRoom();
            enterRoom.m_index = ROOM_ID_SHUJIA_DESERT;
            this.a_2483(-1,-1);
         }
         if(a_4730.target.name == "ExploreLandBtn")
         {
            currentRole = a_2161.e.GetCurrentRole() as a_4463;
            obj = a_2033.getInstance().getGameLevel(currentRole.m_iGamePoint);
            iLevel = int(obj.iLevel);
            if(iLevel < 21)
            {
               this.a_3744("21级以上玩家才能进入",this.m_szTiShi,false,true,false,false,2000);
               return;
            }
            this.setTurnToPanel(true);
            enterRoom = a_2161.e.getEnterRoom();
            enterRoom.m_index = ROOM_ID_EXPLORE_CAM;
            this.a_2483(-1,-1);
         }
         if(a_4730.target.name == "OuterSpaceTavelLandBtn")
         {
            currentRole = a_2161.e.GetCurrentRole() as a_4463;
            obj = a_2033.getInstance().getGameLevel(currentRole.m_iGamePoint);
            iLevel = int(obj.iLevel);
            if(iLevel < 10)
            {
               this.a_3744("10级以上玩家才能进入",this.m_szTiShi,false,true,false,false,2000);
               return;
            }
            this.setTurnToPanel(true);
            enterRoom = a_2161.e.getEnterRoom();
            enterRoom.m_index = ROOM_ID_OUTERSPACETAVEL;
            this.a_2483(-1,-1);
         }
         if(a_4730.target.name == "EarthcoreExpeditionLandBtn")
         {
            currentRole = a_2161.e.GetCurrentRole() as a_4463;
            obj = a_2033.getInstance().getGameLevel(currentRole.m_iGamePoint);
            iLevel = int(obj.iLevel);
            if(iLevel < 10)
            {
               this.a_3744("10级以上玩家才能进入",this.m_szTiShi,false,true,false,false,2000);
               return;
            }
            this.setTurnToPanel(true);
            enterRoom = a_2161.e.getEnterRoom();
            enterRoom.m_index = ROOM_ID_EARTHCORE_EXPEDITION;
            this.a_2483(-1,-1);
         }
         if(a_4730.target.name == "SnowLandBtn" || a_4730.target.name == "ThunderCityBtn")
         {
            this.showCilckedTarget(this.stTDExploreRoomPopUI as DisplayObject,"TDExploreRoomPopUI","",this.InitialzeTDExploreRoomPopUI);
            this.setTurnToPanel(true);
            enterRoom = a_2161.e.getEnterRoom();
            enterRoom.m_index = ROOM_ID_SNOW_THUNDERCITY;
            this.a_2483(-1,-1);
         }
         if(a_4730.target.name == "DesertLandBtn")
         {
            this.showCilckedTarget(this.stTDExploreRoomPopUI as DisplayObject,"TDExploreRoomPopUI","",this.InitialzeTDExploreRoomPopUI);
            this.setTurnToPanel(true);
            enterRoom = a_2161.e.getEnterRoom();
            enterRoom.m_index = ROOM_ID_DESERT;
            this.a_2483(-1,-1);
         }
         if(a_4730.target.name == "m_ShortCutBtn1")
         {
            if(this.currentPosition != 1)
            {
               this.m_iNewYearBossPosition = 1;
               this.setTurnToPanel(true);
               enterRoom = a_2161.e.getEnterRoom();
               enterRoom.m_index = ROOM_ID_MEI_SHI;
               this.a_2483(-1,-1);
            }
            else
            {
               dataEvent = new a_1778(EventType.SHORT_CUT_NEW_YEAR_BOSS);
               objs = {};
               objs.m_iType = ConsortiaTaskConfig.Get().GetNianMapID(1);
               dataEvent.dataObject = objs;
               LobbyEventManager.Get().dispatchEvent(dataEvent);
            }
         }
         if(a_4730.target.name == "m_ShortCutBtn2")
         {
            if(this.currentPosition != 2)
            {
               this.m_iNewYearBossPosition = 2;
               this.setTurnToPanel(true);
               enterRoom = a_2161.e.getEnterRoom();
               enterRoom.m_index = ROOM_ID_HUO_SHAN;
               this.a_2483(-1,-1);
            }
            else
            {
               dataEvent = new a_1778(EventType.SHORT_CUT_NEW_YEAR_BOSS);
               objs = {};
               objs.m_iType = ConsortiaTaskConfig.Get().GetNianMapID(2);
               dataEvent.dataObject = objs;
               LobbyEventManager.Get().dispatchEvent(dataEvent);
            }
         }
         if(a_4730.target.name == "m_ShortCutBtn3")
         {
            if(this.currentPosition != 6)
            {
               this.m_iNewYearBossPosition = 3;
               this.setTurnToPanel(true);
               enterRoom = a_2161.e.getEnterRoom();
               enterRoom.m_index = ROOM_ID_SKY_CASTLE;
               this.a_2483(-1,-1);
            }
            else
            {
               dataEvent = new a_1778(EventType.SHORT_CUT_NEW_YEAR_BOSS);
               objs = {};
               objs.m_iType = ConsortiaTaskConfig.Get().GetNianMapID(3);
               dataEvent.dataObject = objs;
               LobbyEventManager.Get().dispatchEvent(dataEvent);
            }
         }
         if(a_4730.target.name == "m_ShortCutBtn4")
         {
            if(this.currentPosition != 10)
            {
               this.m_iNewYearBossPosition = 16;
               this.setTurnToPanel(true);
               enterRoom = a_2161.e.getEnterRoom();
               enterRoom.m_index = ROOM_ID_OUTERSPACETAVEL;
               this.a_2483(-1,-1);
            }
            else
            {
               dataEvent = new a_1778(EventType.SHORT_CUT_NEW_YEAR_BOSS);
               objs = {};
               objs.m_iType = ConsortiaTaskConfig.Get().GetNianMapID(4);
               dataEvent.dataObject = objs;
               LobbyEventManager.Get().dispatchEvent(dataEvent);
            }
         }
         if(a_4730.target.name == "m_EnterBtn_01")
         {
            if(this.currentPosition != 1)
            {
               this.m_iNewYearBossPosition = 8;
               this.setTurnToPanel(true);
               enterRoom = a_2161.e.getEnterRoom();
               enterRoom.m_index = ROOM_ID_MEI_SHI;
               this.a_2483(-1,-1);
            }
            else
            {
               dataEvent = new a_1778(EventType.SHORT_CUT_NEW_YEAR_BOSS);
               objs = {};
               objs.m_iType = SnowMountainConfig.Get().GetNianMapID(1);
               dataEvent.dataObject = objs;
               LobbyEventManager.Get().dispatchEvent(dataEvent);
            }
         }
         if(a_4730.target.name == "m_EnterBtn_02")
         {
            if(this.currentPosition != 2)
            {
               this.m_iNewYearBossPosition = 9;
               this.setTurnToPanel(true);
               enterRoom = a_2161.e.getEnterRoom();
               enterRoom.m_index = ROOM_ID_HUO_SHAN;
               this.a_2483(-1,-1);
            }
            else
            {
               dataEvent = new a_1778(EventType.SHORT_CUT_NEW_YEAR_BOSS);
               objs = {};
               objs.m_iType = SnowMountainConfig.Get().GetNianMapID(2);
               dataEvent.dataObject = objs;
               LobbyEventManager.Get().dispatchEvent(dataEvent);
            }
         }
         if(a_4730.target.name == "m_EnterBtn_03")
         {
            if(this.currentPosition != 2)
            {
               this.m_iNewYearBossPosition = 10;
               this.setTurnToPanel(true);
               enterRoom = a_2161.e.getEnterRoom();
               enterRoom.m_index = ROOM_ID_HUO_SHAN;
               this.a_2483(-1,-1);
            }
            else
            {
               dataEvent = new a_1778(EventType.SHORT_CUT_NEW_YEAR_BOSS);
               objs = {};
               objs.m_iType = SnowMountainConfig.Get().GetNianMapID(3);
               dataEvent.dataObject = objs;
               LobbyEventManager.Get().dispatchEvent(dataEvent);
            }
         }
         if(a_4730.target.name == "m_EnterBtn_04")
         {
            if(this.currentPosition != 2)
            {
               this.m_iNewYearBossPosition = 11;
               this.setTurnToPanel(true);
               enterRoom = a_2161.e.getEnterRoom();
               enterRoom.m_index = ROOM_ID_HUO_SHAN;
               this.a_2483(-1,-1);
            }
            else
            {
               dataEvent = new a_1778(EventType.SHORT_CUT_NEW_YEAR_BOSS);
               objs = {};
               objs.m_iType = SnowMountainConfig.Get().GetNianMapID(4);
               dataEvent.dataObject = objs;
               LobbyEventManager.Get().dispatchEvent(dataEvent);
            }
         }
         if(a_4730.target.name == "m_EnterBtn_05")
         {
            if(this.currentPosition != 6)
            {
               this.m_iNewYearBossPosition = 12;
               this.setTurnToPanel(true);
               enterRoom = a_2161.e.getEnterRoom();
               enterRoom.m_index = ROOM_ID_SKY_CASTLE;
               this.a_2483(-1,-1);
            }
            else
            {
               dataEvent = new a_1778(EventType.SHORT_CUT_NEW_YEAR_BOSS);
               objs = {};
               objs.m_iType = SnowMountainConfig.Get().GetNianMapID(5);
               dataEvent.dataObject = objs;
               LobbyEventManager.Get().dispatchEvent(dataEvent);
            }
         }
         if(a_4730.target.name == "m_stGoSweetLandBtn")
         {
            if(this.currentPosition != 1)
            {
               this.currentPosition = 19;
               enterRoom = a_2161.e.getEnterRoom();
               mitem1 = a_2018.getInstance().getNewPlayerRoomID(0);
               if(mitem1 != null && mitem1.index == 0)
               {
                  enterRoom.m_index = 0;
                  this.a_2483(mitem1.iServerID,mitem1.iRoomID);
               }
            }
            else
            {
               ActivityEntranceModel.Instance.gotoGame("0x0203");
            }
         }
         if(a_4730.target.name == "deepSeaRemainsBtn" || a_4730.target.name == "turnMenuDeepSeaRemainsBtn")
         {
            this.setTurnToPanel(true);
            enterRoom = a_2161.e.getEnterRoom();
            enterRoom.m_index = 3;
            this.a_2483(-1,-1);
         }
         if(a_4730.target.name == "vsRoomBtn" || a_4730.target.name == "mapVsBtn" || a_4730.target.name == "turnMenuJingJiBtn")
         {
            this.setTurnToPanel(true);
            enterRoom = a_2161.e.getEnterRoom();
            enterRoom.m_index = 2;
            this.a_2483(-1,-1);
         }
         if(a_4730.target.name == "closeWorldBossLevel" || a_4730.target.name == "roomReturnBtn" || a_4730.target.name == "townBtn" || a_4730.target.name == "diyroomReturnBtn")
         {
            enterRoom = a_2161.e.getEnterRoom();
            if(enterRoom.m_index == ROOM_ID_SHUJIA_DESERT || enterRoom.m_index == ROOM_ID_SNOW_THUNDERCITY || enterRoom.m_index == ROOM_ID_DESERT)
            {
               currentRole = a_2161.e.GetCurrentRole() as a_4463;
               obj = a_2033.getInstance().getGameLevel(currentRole.m_iGamePoint);
               iLevel = int(obj.iLevel);
               if(iLevel < 21)
               {
                  this.a_3744("21级以上玩家才能进入",this.m_szTiShi,false,true,false,false,2000);
                  return;
               }
               this.setTurnToPanel(true);
               enterRoom = a_2161.e.getEnterRoom();
               enterRoom.m_index = ROOM_ID_EXPLORE_CAM;
               this.a_2483(-1,-1);
            }
            else
            {
               this.addChild(this.stTDTownUI);
               enterRoom = a_2161.e.getEnterRoom();
               enterRoom.m_iLeaveRoom = true;
               enterRoom.m_index = 0;
               if(Boolean(this.m_stTDWorldBossLevel) && Boolean(this.m_stTDWorldBossLevel.parent))
               {
                  (this.m_stTDWorldBossLevel as ITDWorldBossLevelUI).manualCloseMainUI();
                  this.m_stTDWorldBossLevel.parent.removeChild(this.m_stTDWorldBossLevel);
                  a_2159.e.onPlayLobbyBgSound();
               }
               if(this.contains(this.stTDLobbyRoomUI as DisplayObject))
               {
                  this.removeChild(this.stTDLobbyRoomUI as DisplayObject);
               }
               if(this.contains(this.stTDRoomUserUI))
               {
                  this.removeChild(this.stTDRoomUserUI);
               }
               if(this.stTDWorldMapUI != null && contains(this.stTDWorldMapUI))
               {
                  removeChild(this.stTDWorldMapUI);
               }
               if(Boolean(this.m_stTDCrossServerUI) && Boolean(this.m_stTDCrossServerUI.parent))
               {
                  this.m_stTDCrossServerUI.parent.removeChild(this.m_stTDCrossServerUI);
               }
               if(Boolean(this.m_stTDDiyLaboratoryUI) && Boolean(this.m_stTDDiyLaboratoryUI.parent))
               {
                  this.m_stTDDiyLaboratoryUI.parent.removeChild(this.m_stTDDiyLaboratoryUI);
               }
               this.addChild(this.stTDMenuUI as DisplayObject);
               this.addRightMenu();
               this.addChild(this.stTDGameIMUI);
               Object(this.stTDGameIMUI).imDefaultUI.trade_tip.visible = true;
               this.addChild(this.stServerList);
               if(this.stTDRoomUserUI != null)
               {
                  (this.stTDRoomUserUI as Object).showAvatarView(this,enterRoom.m_index);
               }
               this.mBridge.execute("onInitialzeGameIMData",this,EnmGameIM.a_511);
               this.a_1206.a_2509(a_1750.enm_EnterTownStatus);
               this.a_1206.a_2484();
               this.currentPosition = 0;
               (this.stServerList as ITDServerList).setGameChannelList(a_2018.getInstance().a_791,0,0,true);
               if(this.menuOpenCondition != null && Boolean(this.menuOpenCondition["town"]))
               {
                  this.menuOpenCondition["town"] = false;
                  MeishiGuide.Instance.showMenuOpenAnimation(this.menuOpenCondition["id"]);
               }
               if(this.storyGuideCondition != null && Boolean(this.storyGuideCondition["n_town"]))
               {
                  this.storyGuideCondition["n_town"] = false;
                  MeishiGuide.Instance.showStoryGuide(this.hasStoryGuide());
               }
            }
         }
         if(a_4730.target.name == "townReturnBtn")
         {
            if(this.stTDChooseChannelUI != null)
            {
               this.setChooseChannelData();
            }
            else
            {
               this.showCilckedTarget(this.stTDChooseChannelUI,"TDChooseChannelUI",this.gsManager.getString(4396),this.a_4575);
            }
         }
         if(a_4730.target.name == "vsGuideBtn")
         {
            this.showCilckedTarget(this.stTDVSGuideUI,"TDVSGuideUI",this.gsManager.getString(4397),this.a_4567);
            if(null != this.stTDVSGuideUI)
            {
               if(this.stTDVSGuideUI.parent == this)
               {
                  this.stTDVSGuideUI.addEventListener(Event.REMOVED_FROM_STAGE,this.a_4576);
               }
            }
         }
         if(a_4730.target.name == "menuJumpSp" || a_4730.target.name == "turnMenuCloseBtn")
         {
            this.setTurnToPanel(false);
         }
         if((a_4730.target.name == "townStoreBtn" || a_4730.target.name == "menuStoreSp" || a_4730.target.name == "storeRenturBtn" || a_4730.target.name == "closeStoreBtn" || a_4730.target.name == "town_StoreBtn") && Boolean(a_4730.target.enabled))
         {
            this.m_iStoreType = 0;
            this.showCilckedTarget(this.stTDStoreUI as DisplayObject,"TDStoreUI",this.gsManager.getString(4398),this.a_4559);
         }
         if(a_4730.target.name == "weiwangStoreBtn" && Boolean(a_4730.target.enabled))
         {
            this.m_iStoreType = 2;
            this.showCilckedTarget(this.stTDStoreUI as DisplayObject,"TDStoreUI",this.gsManager.getString(4398),this.a_4559);
         }
         if(Boolean(a_4730.target.name == "menuPackageSp") && Boolean(a_4730.target.enabled) || "homePackageBtnMc" == a_4730.target.name)
         {
            if(this.contains(this.stTDPackageUI))
            {
               this.removeChild(this.stTDPackageUI);
            }
            else
            {
               this.addChild(this.stTDPackageUI);
            }
         }
         if((a_4730.target.name == "menuMailSp" || a_4730.target.name == "closeMailBtn" || a_4730.target.name == "turnMenuMailBtn") && Boolean(a_4730.target.enabled))
         {
            if(this.stTDFriendUI != null && this == this.stTDFriendUI.parent)
            {
               this.removeChild(this.stTDFriendUI);
            }
            this.setTurnToPanel(true);
            this.showCilckedTarget(this.stTDMailUI,"TDMailUI",this.gsManager.getString(4399),this.a_4562);
         }
         if((a_4730.target.name == "menuTaskSp" || a_4730.target.name == "closeTaskBtn" || a_4730.target.name == "twon_TaskBtn" || a_4730.target.name == "twonTaskBtn") && Boolean(a_4730.target.enabled))
         {
            this.showCilckedTarget(this.stTDTaskUI,"TDTaskUI",this.gsManager.getString(4400),this.a_4563);
            if(this.m_newGuide && this.stTDTaskUI != null)
            {
            }
         }
         if((a_4730.target.name == "menuFriendSp" || a_4730.target.name == "closeFriendBtn" || a_4730.target.name == "turnMenuFriendBtn") && Boolean(a_4730.target.enabled))
         {
            if(this.stTDMailUI != null && this == this.stTDMailUI.parent)
            {
               this.removeChild(this.stTDMailUI);
            }
            this.setTurnToPanel(true);
            this.showCilckedTarget(this.stTDFriendUI,"TDFriendUI",this.gsManager.getString(4401),this.a_4564);
         }
         if(a_4730.target.name == "menuSetupBtn" || a_4730.target.name == "closeSetupBtn" || a_4730.target.name == "confirmSetupBtn" || a_4730.target.name == "newconfirmSetupBtn" || a_4730.target.name == "cancelSetupBtn" || a_4730.target.name == "newcancelSetupBtn")
         {
            if(null == this.stTDSetupUI)
            {
               this.stTDSetupUI = this.stTDComponentUI.a_3710();
            }
            if(this.contains(this.stTDSetupUI))
            {
               this.removeChild(this.stTDSetupUI);
            }
            else
            {
               this.addChild(this.stTDSetupUI);
            }
         }
         if(a_4730.target.name == "gmBtn" || a_4730.target.name == "m_stContactGMBtn")
         {
            siteType = stage.loaderInfo.parameters.sitetype == null ? "" : stage.loaderInfo.parameters.sitetype;
            if(siteType == "4399")
            {
               url = new URLRequest("https://u.4399.com/chat/im/4399yy/msdzls");
               navigateToURL(url,"_blank");
            }
            else if(siteType == "7k7k")
            {
               url = new URLRequest("http://web.7k7k.com/kf/");
               navigateToURL(url,"_blank");
            }
            else
            {
               this.showCilckedTarget(this.m_stTDContactGMUI,"TDContactGMUI","联系客服",this.InitialzeTDContactGMUI);
            }
         }
         if(a_4730.target.name == "twonComposeBtn" || a_4730.target.name == "closeComposeBtn" || a_4730.target.name == "twon_ComposeBtn" || a_4730.target.name == "menuComposeSp")
         {
            if(a_4730.target.parent.name == "realLoveCrystallization")
            {
               CrystalHandler.m_iShowType = CrystalHandler.TYPE_CRYSTAL;
            }
            this.showCilckedTarget(this.stTDComposeUI,"TDComposeUI",this.gsManager.getString(4402),this.a_4560);
         }
         if(a_4730.target.name == "taskItem" || a_4730.target.name == "closeConsortiaTaskBtn" || a_4730.target.name == "turnMenuConsortiaTaskBtn")
         {
            this.setTurnToPanel(true);
            this.showCilckedTarget(this.stTDConsortiaTaskUI,"TDConsortiaTaskUI","",this.InitialzeTDConsortiaTaskUI);
         }
         if(a_4730.target.name == "gardenItem" || a_4730.target.name == "closeConsortiaGardenBtn")
         {
            this.showCilckedTarget(this.stTDConsortiaGardenUI,"TDConsortiaGardenUI","",this.InitialzeTDConsortiaGardenUI);
         }
         if(a_4730.target.name == "cardItem" || a_4730.target.name == "closeConsortiaCardBtn")
         {
            this.showCilckedTarget(this.stTDConsortiaCardUI,"TDConsortiaCardUI","",this.InitialzeTDConsortiaCardUI);
         }
         if(a_4730.target.name == "carbonmapItem" || a_4730.target.name == "closeConsortiaCarbonmapItemBtn" || a_4730.target.name == "turnMenuConsortiaCarbonBtn")
         {
            this.setTurnToPanel(true);
            this.showCilckedTarget(this.stTDConsortiaCarbonUI,"TDConsortiaCarbonUI","",this.InitialzeTDConsortiaCarbonUI);
         }
         if(a_4730.target.name == "m_stLoverTaskBtn" || a_4730.target.name == "closeLoverTaskBtn" || a_4730.target.name == "turnMenuLoverTaskBtn")
         {
            this.setTurnToPanel(true);
            this.showCilckedTarget(this.stTDLoverTaskUI,"TDLoverTaskUI","",this.InitialzeTDLoverTaskUI);
         }
         if(a_4730.target.name == "menuMonthCardBtn" || a_4730.target.name == "closeMonthCardBtn")
         {
            this.showCilckedTarget(this.stTDMonthCardUI,"TDMonthCardUI","",this.InitialzeTDMonthCardUI);
         }
         if(a_4730.target.name == "menuTarotBtn" || a_4730.target.name == "m_CloseTarotBtn")
         {
            this.showCilckedTarget(this.stTDTarotUI,"TDTarotUI","",this.InitialzeTDTarotUI);
         }
         if(a_4730.target.name == "menuOnePieceBtn" || a_4730.target.name == "m_CloseOnePieceBtn")
         {
            this.showCilckedTarget(this.stTDOnePieceUI,"TDOnePieceUI","",this.InitialzeTDOnePieceUI);
         }
         if(a_4730.target.name == "m_OpenOnePieceShopBtn" || a_4730.target.name == "m_CloseOnePieceShopBtn")
         {
            this.showCilckedTarget(this.stTDOnePieceShopUI,"TDOnePieceShopUI","",this.InitialzeTDOnePieceShopUI);
         }
         if(a_4730.target.name == "menuNewYearActivityBtn" || a_4730.target.name == "m_closeNewYearActivityBtn" || a_4730.target.name == "m_GotoExchangeBtn" || a_4730.target.name == "m_ShortCutBtn1" || a_4730.target.name == "m_ShortCutBtn2" || a_4730.target.name == "m_ShortCutBtn3" || a_4730.target.name == "m_ShortCutBtn4")
         {
            this.showCilckedTarget(this.stTDNewYearActivityUI,"TDNewYearActivityUI","",this.InitialzeTDNewYearActivityUI);
         }
         if(a_4730.target.name == "turnMenuMarginTree")
         {
            this.setTurnToPanel(true);
            this.showCilckedTarget(this.stTDNewMarginTreeUI,"TDNewMarginTreeUI",this.gsManager.getString(4395),this.InitialzestTDNewMarginTreeUI);
         }
         if(a_4730.target.name == "m_CloseWeiXinGiftBtn" || a_4730.target.name == "menuWeiXinBtn")
         {
            this.showCilckedTarget(this.stTDWeiXinGiftUI,"TDWeiXinGiftUI",this.gsManager.getString(4395),this.InitialzeTDWeiXinGiftUI);
         }
         if(a_4730.target as SimpleButton)
         {
            a_2159.e.onButtonClick();
         }
         if(a_4730.target.name == "twonSortBtn" || a_4730.target.name == "twon_SortBtn" || a_4730.target.name == "rankRenturBtn")
         {
            this.showCilckedTarget(this.stTDRankUI,"TDRankUI",this.gsManager.getString(4403),this.a_4561);
            if(null != this.stTDRankUI)
            {
               if(this.stTDRankUI.parent == this)
               {
                  this.addChild(this.stTDMenuUI as DisplayObject);
               }
            }
         }
         if(a_4730.target.name == "twonAuctionBtn" || a_4730.target.name == "twon_AuctionBtn" || a_4730.target.name == "auctionReturnBtn" || a_4730.target.name == "closeAuctionBtn" || a_4730.target.name == "turnMenuJiaoYiBtn")
         {
            this.setTurnToPanel(true);
            this.showCilckedTarget(this.stTDAuctionUI,"TDAuctionUI",this.gsManager.getString(4404),this.a_4565);
            if(null != this.stTDAuctionUI)
            {
               if(this.stTDAuctionUI.parent == this)
               {
                  (this.stTDAuctionUI as DisplayObjectContainer).addChild(this.stTDMenuUI as DisplayObject);
               }
               else
               {
                  this.addChild(this.stTDMenuUI as DisplayObject);
               }
            }
         }
         if(a_4730.target.name == "menuInviteFriendBtn" || a_4730.target.name == "closeInviteFriendBtn")
         {
            if(this.stTDFeedUI)
            {
               this.mBridge.execute("sendFeed",this,ConstFeed.a_1006);
            }
            else
            {
               this.a_3744(GameStringManager.getInstance().getString(24738),this.m_szTiShi,false,true,false,false,2000);
            }
         }
         if(a_4730.target.name == "menuHuangZuanWelfare" || a_4730.target.name == "huangzuanWelfareCloseBtn" || a_4730.target.name == "menuLanZuanWelfare" || a_4730.target.name == "menu360Welfare")
         {
            if("3366" == stage.loaderInfo.parameters.sitetype)
            {
               this.showCilckedTarget(this.stTDHuangZuanWelfareUI,"TDHuangZuanWelfareUI",this.gsManager.getString(133273),this.InitialzeTDHuangZuanWelfareUI);
            }
            else if("qq" == stage.loaderInfo.parameters.sitetype)
            {
               this.showCilckedTarget(this.stTDHuangZuanWelfareUI,"TDHuangZuanWelfareUI",this.gsManager.getString(4407),this.InitialzeTDHuangZuanWelfareUI);
            }
            else if("360" == stage.loaderInfo.parameters.sitetype || "123u" == stage.loaderInfo.parameters.sitetype)
            {
               this.showCilckedTarget(this.stTDHuangZuanWelfareUI,"TDHuangZuanWelfareUI","360" + this.gsManager.getString(131892),this.InitialzeTDHuangZuanWelfareUI);
            }
         }
         if(a_4730.target.name == "menuActivity" || a_4730.target.name == "closeActivityCenterBtn")
         {
            this.showCilckedTarget(this.stTDNewActionUI,"TDNewActionUI",this.gsManager.getString(4413),this.InitialzeTDNewActionUI);
         }
         if(a_4730.target.name == "closeInfoUI_btn" || a_4730.target.name == "infoMapBtn")
         {
            this.showCilckedTarget(this.stTDInfoUI,"TDInfoUI",this.gsManager.getString(4408),this.a_4568);
         }
         if(a_4730.target.name == "twon_UnionBtn" || a_4730.target.name == "twonUnionBtn" || a_4730.target.name == "turnMenuGongHuiBtn" || a_4730.target.name == "menuGongHuiSp" || a_4730.target.name == "m_btMyShortcut")
         {
            if(a_4730.target.name == "m_btMyShortcut")
            {
               this.RequestCloseConsortiaPanel();
               return;
            }
            this.setTurnToPanel(true);
            if(this.consortiaIsOpen)
            {
               this.showCilckedTarget(this.stTDConsortiaUI,"TDConsortiaUI",this.gsManager.getString(4288),this.a_4569);
               this.mBridge.execute("showTownBtnTipAnimation",this,"mcUnionTip",false);
            }
            else
            {
               this.a_3744(this.gsManager.getString(24738),this.m_szTiShi,false,true,false,false,2000);
            }
         }
         if(a_4730.target.name == "pagAchieveBtn" || a_4730.target.name == "closeAchieveBtn" || a_4730.target.name == "turnMenuChengJiuBtn")
         {
            this.setTurnToPanel(true);
            this.showCilckedTarget(this.stTDAchievementUI,"TDAchievementUI",this.gsManager.getString(4409),this.a_4574);
         }
         if(a_4730.target.name == "twonMarryBtn" || a_4730.target.name == "twon_MarryBtn" || a_4730.target.name == "m_stFlMarriageRegistrationCloseBtn" || a_4730.target.name == "m_stLoverTaskBtn")
         {
            this.ShowMarriageRegistrationUI();
         }
         if(a_4730.target.name == "twonTreeBtn" || a_4730.target.name == "twon_TreeBtn" || a_4730.target.name == "closeMarginBtn" || a_4730.target.name == "marginRenturBtn")
         {
            this.DDmOpenMarginTreeUI();
         }
         if(a_4730.target.name == "saveUrlBtn")
         {
            download = new a_4643();
            download.init("./config/" + "meishiurl.url");
            download.startDownload("meishiurl.url");
            LobbyEventManager.Get().dispatchEvent(new LocalTaskEvents(LocalTaskEvents.a_720));
         }
         if(a_4730.target.name == "fullScreenBtn")
         {
            this.RequestChangeScreen();
         }
         if(a_4730.target.name == "closeCompAchiBtn")
         {
            this.removeAchiTip();
         }
         if(a_4730.target.name == "matchBtn" || a_4730.target.name == "turnMenuSaiShiBtn")
         {
            this.setTurnToPanel(true);
            sitetype = stage.loaderInfo.parameters.sitetype;
            if(sitetype != "sdo")
            {
               this.showCilckedTarget(this.stTDVSMatchUI,"TDVSMatchUI","",this.a_4558,true);
               if(this.stTDVSMatchUI != null)
               {
                  (this.stTDVSMatchUI as ITDVSMatchUI).a_2120(this.a_1206);
                  if(this.contains(this.stTDLobbyRoomUI as DisplayObject))
                  {
                     this.removeChild(this.stTDLobbyRoomUI as DisplayObject);
                  }
                  if(this.contains(this.stTDRoomUserUI))
                  {
                     this.removeChild(this.stTDRoomUserUI);
                  }
               }
            }
            else
            {
               this.a_3744(this.gsManager.getString(24738),this.m_szTiShi,false,true,false,false,2000);
            }
         }
         if(a_4730.target.name == "closeMatchBtn" || a_4730.target.name == "leaveMatchBtn")
         {
            this.addRightMenu();
            this.a_3747(-1,-1);
         }
         if(a_4730.target.name == "vowBtn" || a_4730.target.name == "twon_vowBtn" || a_4730.target.name == "closeVowBtn" || a_4730.target.name == "enterVowBtn" || a_4730.target.name == "menuVowBtn")
         {
            this.showCilckedTarget(this.stTDVowUI,"TDVowUI",this.gsManager.getString(4410),this.a_4571);
         }
         if("twonToHomeBtn" == a_4730.target.name || "goTwonBtn" == a_4730.target.name || "homeBoat" == a_4730.target.name)
         {
            siteType = stage.loaderInfo.parameters.sitetype;
            if("duowan" != siteType)
            {
               this.stTDTipDialog.content = "即将开启";
               this.stTDTipDialog.showTip(this,this.m_szTiShi,false,true,false,false,3000);
            }
            else
            {
               currentRole = a_2161.e.GetCurrentRole() as a_4463;
               obj = a_2033.getInstance().getGameLevel(currentRole.m_iGamePoint);
               iLevel = int(obj.iLevel);
               if(iLevel >= 10)
               {
                  this.showCilckedTarget(this.stTDHomeUI,"TDHomeUI",this.gsManager.getString(4414),this.InitialzeTDHomeUI);
                  if(this.stTDHomeUI != null)
                  {
                     (this.stTDRoomUserUI as Object).onSetRoomType(2);
                     addChild(this.stTDRoomUserUI);
                     addChild(this.stServerList);
                  }
               }
               else
               {
                  this.stTDTipDialog.content = this.gsManager.getString(132510);
                  this.stTDTipDialog.showTip(this,this.m_szTiShi,false,true,false,false,3000);
               }
               if("goTwonBtn" == a_4730.target.name)
               {
                  if(this.contains(this.stTDTownUI) && this.contains(this.stTDRoomUserUI))
                  {
                     this.removeChild(this.stTDRoomUserUI);
                  }
               }
            }
         }
         if(a_4730.target.name == "turnMenuJiNengBtn" || a_4730.target.name == "menuJinengSp")
         {
            this.setTurnToPanel(true);
            this.RequestOpenPackage(2);
         }
         if(a_4730.target.name == "turnMenuZhanJiBtn")
         {
            this.setTurnToPanel(true);
            this.RequestOpenPackage(1);
         }
         if(a_4730.target.name == "ddmBtn")
         {
            this.mBridge.execute("onDealDDmClick",this);
         }
         if((a_4730.target.name == "menuPaySp" || a_4730.target.name == "vip_vipSign1Mc" || a_4730.target.name == "m_stGotoRechargeBtn") && stage.loaderInfo.parameters.sitetype != "qqgame")
         {
            if(this.showTipUnOpen("menuPaySp"))
            {
               return;
            }
            this.RequestPayMoney();
         }
         if(a_4730.target.name == "dongBtn" || a_4730.target.name == "closeDongBtn")
         {
            enterRoom = a_2161.e.getEnterRoom();
            enterRoom.m_isEnterMatch = 0;
            enterRoom.m_EnterMBK = 0;
            enterRoom.m_EnterMS = 0;
            this.showCilckedTarget(this.stTDMoTaUI,"TDMoTaUI",this.gsManager.getString(4415),this.InitialzeTDMoTaUI);
         }
         if(a_4730.target.name == "motaBtn" || a_4730.target.name == "menuMBKBtn")
         {
            enterRoom = a_2161.e.getEnterRoom();
            enterRoom.m_isEnterMatch = 0;
            enterRoom.m_EnterMBK = 0;
            enterRoom.m_EnterMS = 0;
            if("menuMBKBtn" == a_4730.target.name)
            {
               currentRole = a_2161.e.GetCurrentRole() as a_4463;
               obj = a_2033.getInstance().getGameLevel(currentRole.m_iGamePoint);
               iLevel = int(obj.iLevel);
               if(iLevel < 16)
               {
                  this.stTDTipDialog.content = "等级未达到16级，不能进入秘宝窟";
                  this.stTDTipDialog.showTip(this,this.m_szTiShi,false,true,false,false,3000);
                  return;
               }
               enterRoom.m_EnterMS = 1;
               enterRoom.m_EnterMBK = 1;
            }
            if(this.currentPosition == 0)
            {
               this.currentPosition = 16;
               enterRoom = a_2161.e.getEnterRoom();
               mitem0 = a_2018.getInstance().getNewPlayerRoomID(0);
               if(mitem0 != null && mitem0.index == 0)
               {
                  enterRoom.m_index = ROOM_ID_MEI_SHI;
                  this.a_2483(mitem0.iServerID,mitem0.iRoomID);
               }
            }
            else
            {
               if(this.stTDWorldMapUI != null && contains(this.stTDWorldMapUI))
               {
                  removeChild(this.stTDWorldMapUI);
               }
               enterRoom = a_2161.e.getEnterRoom();
               enterRoom.m_isEnterMatch = 0;
               this.showCilckedTarget(this.stTDMoTaUI,"TDMoTaUI",this.gsManager.getString(4415),this.InitialzeTDMoTaUI);
            }
         }
         if(a_4730.target.name == "menuPopularLandBtn")
         {
            currentRole = a_2161.e.GetCurrentRole() as a_4463;
            obj = a_2033.getInstance().getGameLevel(currentRole.m_iGamePoint);
            iLevel = int(obj.iLevel);
            openRoleLevel = AnalysisWorldBossXml.GetInstance().getOpenRoleLevel();
            if(iLevel < openRoleLevel)
            {
               this.stTDTipDialog.content = GameStringManager.getInstance().getString(4181,[openRoleLevel]);
               this.stTDTipDialog.showTip(this,this.m_szTiShi,false,true,false,false,3000);
               return;
            }
            if(this.currentPosition != 21)
            {
               this.currentPosition = 21;
               enterRoom = a_2161.e.getEnterRoom();
               roomList = a_2018.getInstance().a_791[19];
               mitem1 = roomList[0];
               if(mitem1 != null && mitem1.index == 19)
               {
                  enterRoom.m_index = ROOM_ID_WORLD_BOSS_LEVEL;
                  this.a_2483(mitem1.iServerID,mitem1.iRoomID);
               }
            }
         }
         if(a_4730.target.name == "EarthcoreExpeditionLandBtn")
         {
            if(this.currentPosition != 23)
            {
               this.currentPosition = 23;
               enterRoom = a_2161.e.getEnterRoom();
               roomList2 = a_2018.getInstance().a_791[21];
               mitem1 = roomList2[0];
               if(mitem1 != null && mitem1.index == 21)
               {
                  enterRoom.m_index = ROOM_ID_EARTHCORE_EXPEDITION;
                  this.a_2483(mitem1.iServerID,mitem1.iRoomID);
               }
            }
         }
         if(a_4730.target.name == "menuViliant")
         {
            if(this.stTDWorldMapUI != null && contains(this.stTDWorldMapUI))
            {
               removeChild(this.stTDWorldMapUI);
            }
            if(this.currentPosition == 0)
            {
               this.currentPosition = 17;
               enterRoom = a_2161.e.getEnterRoom();
               mitem1 = a_2018.getInstance().getNewPlayerRoomID(0);
               if(mitem1 != null && mitem1.index == 0)
               {
                  enterRoom.m_index = 0;
                  this.a_2483(mitem1.iServerID,mitem1.iRoomID);
               }
            }
            else
            {
               this.showCilckedTarget(this.stTDViliantUI as DisplayObject,"TDViliantUI",this.gsManager.getString(135497),this.InitialzeTDViliantUI);
            }
         }
         if(a_4730.target.name == "menuActivityEntrance" || a_4730.target.name == "m_ActivityEntranceMc")
         {
            currentRole = a_2161.e.GetCurrentRole() as a_4463;
            obj = a_2033.getInstance().getGameLevel(currentRole.m_iGamePoint);
            iLevel = int(obj.iLevel);
            if(iLevel < 15)
            {
               this.a_3744("等级达到15级才能进入欢乐假期",this.m_szTiShi,false,true,false,false,2000);
               return;
            }
            iconList = new Array();
            if(Boolean(stage) && stage.loaderInfo.parameters.sitetype == "qqgame")
            {
               iconList = ActionNewActivityConfigXml.getInstance().m_configXmlIcomListQQgame.slice();
            }
            else
            {
               iconList = ActionNewActivityConfigXml.getInstance().m_configXmlIconList.slice();
            }
            platfrom = stage.loaderInfo.parameters.sitetype;
            for each(icon in iconList)
            {
               if(icon.m_szName == "menuActivityEntrance")
               {
                  times = icon.m_szTime.split("-");
                  nowtime = a_1767.getInstance().SystemTime * 1000;
                  stime = new Date(times[0]);
                  etime = new Date(times[1]);
                  if(nowtime < stime.getTime())
                  {
                     this.a_3744("该活动暂未开放，敬请期待！",this.m_szTiShi,false,true,false,false,2000);
                  }
                  else if(nowtime > etime.getTime())
                  {
                     this.a_3744("该活动已结束！",this.m_szTiShi,false,true,false,false,2000);
                  }
                  else
                  {
                     this.showCilckedTarget(this.stTDActivityEntranceUI as DisplayObject,"TDActivityEntranceUI",this.gsManager.getString(139616),this.InitialzeTDActivityEntranceUI);
                  }
               }
            }
         }
         if(a_4730.target.name == "m_ActivityEntranceReceiveBtn")
         {
            if(this.stTDActivityEntranceUI != null && contains(this.stTDActivityEntranceUI as DisplayObject))
            {
               removeChild(this.stTDActivityEntranceUI as DisplayObject);
            }
            this.showCilckedTarget(this.m_stTDHolidayRechargeActivityUI,"TDHolidayRechargeActivityUI","假期特惠",this.InitialzeTDHolidayRechargeActivityUI);
         }
         if(a_4730.target.name == "m_ActivityEntranceGameBtn")
         {
            if(this.stTDActivityEntranceUI != null && contains(this.stTDActivityEntranceUI as DisplayObject))
            {
               removeChild(this.stTDActivityEntranceUI as DisplayObject);
            }
            if(this.currentPosition == 0)
            {
               this.currentPosition = 18;
               enterRoom = a_2161.e.getEnterRoom();
               mitem1 = a_2018.getInstance().getNewPlayerRoomID(0);
               if(mitem1 != null && mitem1.index == 0)
               {
                  enterRoom.m_index = 0;
                  this.a_2483(mitem1.iServerID,mitem1.iRoomID);
               }
            }
            else
            {
               mapID = ThunderCityConfig.Get().getHappyHolidayMapID();
               ActivityEntranceModel.Instance.gotoGame(mapID);
            }
         }
         if(a_4730.target.name == "m_ShortCutMapBtn")
         {
            this.RequestCloseConsortiaPanel();
            if(this.stTDConsortiaCarbonUI != null && contains(this.stTDConsortiaCarbonUI as DisplayObject))
            {
               removeChild(this.stTDConsortiaCarbonUI as DisplayObject);
            }
            if(this.stTDConsortiaUI != null && contains(this.stTDConsortiaUI as DisplayObject))
            {
               removeChild(this.stTDConsortiaUI as DisplayObject);
            }
            if(a_4730.target.parent.name == "m_MoonCarben")
            {
               this.m_iNewYearBossPosition = 4;
               this.setTurnToPanel(true);
               enterRoom = a_2161.e.getEnterRoom();
               enterRoom.m_index = ROOM_ID_MEI_SHI;
               this.a_2483(-1,-1);
            }
            else if(a_4730.target.parent.name == "m_GoDownCarben")
            {
               this.m_iNewYearBossPosition = 5;
               this.setTurnToPanel(true);
               enterRoom = a_2161.e.getEnterRoom();
               enterRoom.m_index = ROOM_ID_MEI_SHI;
               this.a_2483(-1,-1);
            }
            else if(a_4730.target.parent.name == "m_DieCarben")
            {
               this.m_iNewYearBossPosition = 6;
               this.setTurnToPanel(true);
               enterRoom = a_2161.e.getEnterRoom();
               enterRoom.m_index = ROOM_ID_MEI_SHI;
               this.a_2483(-1,-1);
            }
         }
         if("menuSSPSp" == a_4730.target.name || "m_RecipesCloseBtn" == a_4730.target.name)
         {
            currentRole = a_2161.e.GetCurrentRole() as a_4463;
            obj = a_2033.getInstance().getGameLevel(currentRole.m_iGamePoint);
            iLevel = int(obj.iLevel);
            if(iLevel < 23)
            {
               this.a_3744("等级未达到23级",this.m_szTiShi,false,true,false,false,2000);
            }
            else
            {
               this.showCilckedTarget(this.stTDRecipesUI,"TDRecipesUI",this.gsManager.getString(139265),this.InitialzeTDRecipesUI);
            }
         }
         if(a_4730.target.name == "treasureBtn" || a_4730.target.name == "closeTreasureBtn")
         {
            this.showCilckedTarget(this.stTDTreasureHouseUI,"TDTreasureHouseUI",this.gsManager.getString(135472),this.InitialzeTDTreasureHouseUI);
         }
         if(a_4730.target.name == "vipBtn" || a_4730.target.name == "vipCloseBtn")
         {
            this.showCilckedTarget(this.stTDVipUI,"TDVipUI",this.gsManager.getString(135682),this.InitialzeTDVipUI);
         }
         if(a_4730.target.name == "viliantCloseBtn" || a_4730.target.name == "viliantGameBtn")
         {
            this.showCilckedTarget(this.stTDViliantUI as DisplayObject,"TDViliantUI",this.gsManager.getString(135497),this.InitialzeTDViliantUI);
         }
         if(a_4730.target.name == "m_WorldMap" || a_4730.target.name == "worldmapCloseBtn")
         {
            this.showCilckedTarget(this.stTDWorldMapUI,"TDWorldMapUI",this.gsManager.getString(135937),this.InitialzeTDWorldMapUI);
         }
         if(a_4730.target.name == "menuFirstRechargeBtn" || a_4730.target.name == "m_stCloseFirstRechargeActivityBtn")
         {
            this.showCilckedTarget(this.stTDFirstRechargeActivityUI,"TDFirstRechargeActivityUI","",this.InitialzeTDFirstRechargeActivityUI);
         }
         if(a_4730.target.name == "menuJingCaiBtn" || a_4730.target.name == "closeNActionUIBtn")
         {
            this.showCilckedTarget(this.stTDNActionUI,"TDNActionUI",GameStringManager.getInstance().getString(139615),this.InitialzeTDNActionUI);
         }
         if(a_4730.target.name == "menuBaozang" || a_4730.target.name == "closebaozangbtn" || a_4730.target.name == "zhencangbtn" || a_4730.target.name == "backchoujiangbtn")
         {
            this.showCilckedTarget(this.stTDChoujiangUI,"TDChoujiangUI","",this.InitializeTDChoujiangUI);
         }
         if(a_4730.target.name == "zhencangbtn" || a_4730.target.name == "closezhencangbtn" || a_4730.target.name == "backchoujiangbtn")
         {
            this.showCilckedTarget(this.stTDZhencangUI,"TDZhencangUI","",this.InitializeTDZhencangUI);
         }
         if(a_4730.target.name == "exchangebtn" || a_4730.target.name == "closeExchangebtn")
         {
            this.showCilckedTarget(this.stTDExchangeUI,"TDExchangeUI","",this.InitializeTDExchangeUI);
         }
         if(a_4730.target.name == "exchangeShopBtn" || a_4730.target.name == "closeExchangeShopBtn")
         {
            this.showCilckedTarget(this.stTDExchangeShopUI,"TDExchangeShopUI","",this.InitializeTDExchangeShopUI);
         }
         if(a_4730.target.name == "darkCrystalShopBtn" || a_4730.target.name == "closeDarkCrystalShopBtn")
         {
            this.showCilckedTarget(this.stTDDarkCrystalShopUI,"TDDarkCrystalShopUI","",this.InitializeTDDarkCrystalShopUI);
         }
         if(a_4730.target.name == "m_stShopBtn" || a_4730.target.name == "m_ClosCrossServerShopBtn")
         {
            this.showCilckedTarget(this.stTDCrossShopUI,"TDCrossShopUI","",this.InitializeTDCrossShopUI);
         }
         if(a_4730.target.name == "menuBlueDiamondPrivilegeBtn" || a_4730.target.name == "buleDiamondPrivilegeCloseBtn")
         {
            this.showCilckedTarget(this.stTDBlueDiamondPrivilegeUI,"TDBlueDiamondPrivilegeUI","",this.InitializeTDBlueDiamondPrivilegeUI);
         }
         if((Boolean(a_4730.target.name == "vip_vipSign1Mc" || a_4730.target.name == "m_stGotoRechargeBtn" || a_4730.target.name == "menuPaySp" || a_4730.target.name == "closeSpecialPayBtn")) && Boolean(stage) && stage.loaderInfo.parameters.sitetype == "qqgame")
         {
            this.showCilckedTarget(this.stTDSpecialPayUI,"TDSpecialPayUI","",this.InitializeTDSpecialPayUI);
         }
         if(a_4730.target.name == "menuGameLobbyBtn" || a_4730.target.name == "gameLobbyCloseBtn")
         {
            this.showCilckedTarget(this.stTDGameLobbyUI,"TDGameLobbyUI","",this.InitializeTDGameLobbyUI);
         }
         if(a_4730.target.name == "starPieceShopBtn" || a_4730.target.name == "closeStarPicecShopBtn")
         {
            this.showCilckedTarget(this.stTDStarPieceShopUI,"TDStarPieceShopUI","",this.InitializeTDStarPieceShopUI);
         }
         if(a_4730.target.name == "OpenTDCharmShopBtn" || a_4730.target.name == "CloseTDCharmShopBtn")
         {
            this.showCilckedTarget(this.stTDCharmShopUI,"TDCharmShopUI","",this.InitializeTDCharmShopUI);
         }
         if(a_4730.target.name == "scoreShopBtn" || a_4730.target.name == "closeScoreShopBtn")
         {
            this.showCilckedTarget(this.stTDScoreShopUI,"TDScoreShopUI","",this.InitializeTDScoreShopUI);
         }
         if(a_4730.target.name == "menuPetBtn" || a_4730.target.name == "m_PetCloseBtn")
         {
            this.showCilckedTarget(this.stTDPetUI,"TDPetUI","宠物系统",this.InitialzeTDPetUI);
         }
         if(a_4730.target.name == "menuActivityDayPayBtn" || a_4730.target.name == "m_FlDailyPayCloseBtn")
         {
            this.showCilckedTarget(this.m_stTDDailyRechargeUI,"TDDailyRechargeUI","每日充值",this.InitialzeTDDailyRechargeUI);
         }
         if(a_4730.target.name == "menuBirthdayActivityBtn" || a_4730.target.name == "closeBirthdayActivity")
         {
            this.showCilckedTarget(this.m_stTDBirthdayActivity,"TDBirthdayActivityUI","福利打卡",this.InitialzeTDBirthdayActivityUI);
         }
         if(a_4730.target.name == "SmalRoomBtn" || a_4730.target.name == "smallHouseRenturBtn")
         {
            this.showCilckedTarget(this.stTDSmallHouseUI as DisplayObject,"TDSmallHouseUI",this.gsManager.getString(139616),this.InitialzeTDSmallHouseUI);
         }
         if(a_4730.target.name == "SnowMountainBtn" || a_4730.target.name == "SnowMountainCloseBtn" || a_4730.target.name == "m_EnterBtn_01" || a_4730.target.name == "m_EnterBtn_02" || a_4730.target.name == "m_EnterBtn_03" || a_4730.target.name == "m_EnterBtn_04" || a_4730.target.name == "m_EnterBtn_05")
         {
            this.showCilckedTarget(this.stTDSnowMountainExploreUI as DisplayObject,"TDSnowMountainExploreUI",this.gsManager.getString(139616),this.InitialzeTDSnowMountainExploreUI);
         }
         if(a_4730.target.name == "ThunderCityExploreBtn" || a_4730.target.name == "ThunderCityExploreCloseBtn")
         {
            this.showCilckedTarget(this.stTDThunderCityExploreUI as DisplayObject,"TDThunderCityExploreUI",this.gsManager.getString(139616),this.InitialzeTDThunderCityExploreUI);
         }
         if(a_4730.target.name == "ExploreRoomPopBtn" || a_4730.target.name == "ExploreRoomPopCloseBtn")
         {
            this.showCilckedTarget(this.stTDExploreRoomPopUI as DisplayObject,"TDExploreRoomPopUI","探险港口",this.InitialzeTDExploreRoomPopUI);
         }
         if(a_4730.target.name == "GoHeadMapBtn" || a_4730.target.name == "m_GoHeadMapCloseBtn")
         {
            this.showCilckedTarget(this.stTDGoHeadMapUI as DisplayObject,"TDGoHeadMapUI",this.gsManager.getString(139616),this.InitialzeTDGoHeadMapUI);
         }
         if(a_4730.target.name == "menuDentityCardBtn")
         {
            this.showNewDentityURL();
         }
         if(a_4730.target.name == "menuMicroClientBtn" || a_4730.target.name == "m_MicroClientCloseBtn" || a_4730.target.name == "menuMicroClientGiftBtn" || a_4730.target.name == "m_MicroGiftCloseBtn")
         {
            this.showCilckedTarget(this.stTDMicroClientUI as DisplayObject,"TDMicroClientUI",this.gsManager.getString(139616),this.InitialzeTDMicroClientUI);
         }
         if(a_4730.target.name == "menuMobileGameBtn" || a_4730.target.name == "m_MobileGameCloseBtn")
         {
            this.showCilckedTarget(this.stTDMobileGameUI as DisplayObject,"TDMobileGameUI",this.gsManager.getString(139616),this.InitialzeTDMobileGameUI);
         }
         if(a_4730.target.name == "menuReportBtn" || a_4730.target.name == "m_ReportCloseBtn")
         {
            this.showCilckedTarget(this.stTDReportUI as DisplayObject,"TDReportUI",this.gsManager.getString(139616),this.InitialzeTDReportUI);
         }
         if(a_4730.target.name == "menuMeiShiMatchdBtn" || a_4730.target.name == "m_MeiShiMatchdBtnCloseBtn")
         {
            this.showCilckedTarget(this.stTDMeiShiMatchUI as DisplayObject,"TDMeiShiMatchUI","美食大赛",this.InitialzeTDMeiShiMatchUI);
         }
         if(a_4730.target.name == "ExploreStoreBtn" || a_4730.target.name == "ShowExploreStoreBtn" || a_4730.target.name == "m_ExploreStoreCloseBtn")
         {
            this.showCilckedTarget(this.stTDExploreStoreUI as DisplayObject,"TDExploreStoreUI","补给商店",this.InitialzeTDExploreStoreUI);
         }
         if(a_4730.target.name == "ExploreDiaryBtn" || a_4730.target.name == "m_ExploreDiaryCloseBtn")
         {
            this.showCilckedTarget(this.stTDExploreDiaryUI as DisplayObject,"TDExploreDiaryUI","探险日记",this.InitialzeTDExploreDiaryUI);
         }
         if(a_4730.target.name == "ExploreTaskBtn" || a_4730.target.name == "m_ExploreTaskBtnCloseBtn")
         {
            if(a_4730.target.name == "ExploreTaskBtn" && !AnalysisExplorelandXml.GetInstance().isOpenRoomPop())
            {
               this.a_3744("探险任务暂未开启!",this.m_szTiShi,false,true,false,false,2000);
               return;
            }
            this.showCilckedTarget(this.stTDExploreTaskUI as DisplayObject,"TDExploreTaskUI","探险任务",this.InitialzeTDExploreTaskUI);
         }
         if("menuCumulativeRechargeActivityBtn" == a_4730.target.name || "m_stCloseCumulativeRechargeActivityBtn" == a_4730.target.name)
         {
            this.showCilckedTarget(this.m_stTDCumulativeRechargeActivityUI,"TDCumulativeRechargeActivityUI","特惠套餐",this.InitialzeTDCumulativeRechargeActivityUI);
         }
         if("menuHolidayRechargeActivityBtn" == a_4730.target.name || "m_stCloseHolidayRechargeActivityBtn" == a_4730.target.name || a_4730.target.name == "m_GotoExchangeBtn")
         {
            this.showCilckedTarget(this.m_stTDHolidayRechargeActivityUI,"TDHolidayRechargeActivityUI","假期特惠",this.InitialzeTDHolidayRechargeActivityUI);
         }
         if("menuServiceOpenCarnivalBtn" == a_4730.target.name)
         {
            this.showCilckedTarget(this.m_stTDServiceOpenCarnivalUI,"TDServiceOpenCarnivalUI","开服狂欢",this.InitialzeTDServiceOpenCarnivalUI);
         }
         if("menuMonopolyBtn" == a_4730.target.name)
         {
            this.showCilckedTarget(this.m_stTDMonopolyUI,"TDMonopolyUI","大富翁",this.InitialzeTDMonopolyUI);
         }
         if("menuServiceOpenBagsBtn" == a_4730.target.name)
         {
            this.showCilckedTarget(this.m_stTDServiceOpenBagsUI,"TDServiceOpenBagsUI","登录有礼",this.InitialzeTDServiceOpenBagsUI);
         }
         if("menuFriendInviteBtn" == a_4730.target.name || "m_stCloseTDQQInviteUIBtn" == a_4730.target.name)
         {
            this.showCilckedTarget(this.m_stTDQQInviteUI,"TDQQInviteUI","好友邀请，老友召回",this.InitialzeTDQQInviteUI);
         }
         if("m_OpenHandbookBtn" == a_4730.target.name)
         {
            this.showCilckedTarget(this.m_stTDHandbookUI,"TDHandbookUI","图鉴",this.InitialzeTDHandbookUI);
         }
         if("editBtn" == a_4730.target.name || "m_CloseEditorBtn" == a_4730.target.name || "m_SaveAndExitBtn" == a_4730.target.name)
         {
            if(("editBtn" == a_4730.target.name || "m_CloseEditorBtn" == a_4730.target.name || "m_SaveAndExitBtn" == a_4730.target.name) && this.m_stTDEditorUI != null)
            {
               this.showCilckedTarget(this.m_stTDDiyLaboratoryUI,"TDDiyLaboratoryUI","猫博士的实验室",this.InitialzeTDDiyLaboratoryUI);
               this.showCilckedTarget(this.m_stTDMyChapterUI,"TDMyChapterUI","我的关卡",this.InitialzeTDMyChapterUI);
            }
            this.showCilckedTarget(this.m_stTDEditorUI,"TDEditorUI","关卡编辑",this.InitialzeTDEditorUI);
         }
         if("menuDiyLaboratoryBtn" == a_4730.target.name)
         {
            currentRole = a_2161.e.GetCurrentRole() as a_4463;
            obj = a_2033.getInstance().getGameLevel(currentRole.m_iGamePoint);
            iLevel = int(obj.iLevel);
            if(iLevel < 15)
            {
               this.a_3744("15级以上玩家才能进入",this.m_szTiShi,false,true,false,false,2000);
               return;
            }
            if(this.currentPosition != 20)
            {
               this.currentPosition = 20;
               enterRoom = a_2161.e.getEnterRoom();
               enterRoom.m_index = ROOM_ID_DIY_SERVER;
               this.a_2483(1,27);
            }
            else
            {
               this.showCilckedTarget(this.m_stTDDiyLaboratoryUI,"TDDiyLaboratoryUI","猫博士的实验室",this.InitialzeTDDiyLaboratoryUI);
            }
         }
         if("m_OpenMyChapterBtn" == a_4730.target.name)
         {
            currentRole = a_2161.e.GetCurrentRole() as a_4463;
            obj = a_2033.getInstance().getGameLevel(currentRole.m_iGamePoint);
            iLevel = int(obj.iLevel);
            if(iLevel < 40)
            {
               this.a_3744("40级以上玩家才能使用关卡编辑功能",this.m_szTiShi,false,true,false,false,2000);
               return;
            }
            this.showCilckedTarget(this.m_stTDMyChapterUI,"TDMyChapterUI","我的关卡",this.InitialzeTDMyChapterUI);
         }
         if("menuCrossServerBtn" == a_4730.target.name || "crossMapBtn" == a_4730.target.name)
         {
            currentRole = a_2161.e.GetCurrentRole() as a_4463;
            obj = a_2033.getInstance().getGameLevel(currentRole.m_iGamePoint);
            iLevel = int(obj.iLevel);
            if(iLevel < 15)
            {
               this.a_3744("15级以上玩家才能进入",this.m_szTiShi,false,true,false,false,2000);
               return;
            }
            if(this.currentPosition != 7)
            {
               this.currentPosition = 7;
               enterRoom = a_2161.e.getEnterRoom();
               arrRoomList = a_2018.getInstance().a_791[5];
               mitem1 = arrRoomList[0];
               if(mitem1 != null && mitem1.index == 5)
               {
                  enterRoom.m_index = ROOM_ID_CROSS_SERVER;
                  this.a_2483(mitem1.iServerID,mitem1.iRoomID);
               }
            }
            this.showCilckedTarget(this.m_stTDCrossServerUI,"TDCrossServerUI","跨服副本",this.InitialzeTDCrossServerUI);
         }
         if("menuExclusivePacksBtn" == a_4730.target.name)
         {
            this.ShowExclusivePacksPage();
         }
         if(a_4730.target.name == "menuEveryDayBtn" || a_4730.target.name == "m_CloseEveryDaySeeYouBtn")
         {
            this.showCilckedTarget(this.m_stTDEveryDaySeeYouUI,"TDEveryDaySeeYouUI","每日登陆",this.InitialzeTDEveryDaySeeYouUI);
         }
         if(a_4730.target.name == "menuTotalPayBtn" || a_4730.target.name == "m_fTotalPayCloseBtn")
         {
            this.showCilckedTarget(this.m_stTDTotalPayUI,"TDTotalPayUI","累计充值",this.InitialzeTDTotalPayUI);
         }
         if(a_4730.target.name == "menuPetEntranceBtn" || a_4730.target.name == "m_PetEntranceCloseBtn")
         {
            currentRole = a_2161.e.GetCurrentRole() as a_4463;
            obj = a_2033.getInstance().getGameLevel(currentRole.m_iGamePoint);
            iLevel = int(obj.iLevel);
            if(iLevel < 20)
            {
               this.a_3744("20级开启",this.m_szTiShi,false,true,false,false,2000);
            }
            else if(this.currentPosition == 0)
            {
               this.currentPosition = 1;
               enterRoom = a_2161.e.getEnterRoom();
               mitem1 = a_2018.getInstance().getNewPlayerRoomID(0);
               if(mitem1 != null && mitem1.index == 0)
               {
                  enterRoom.m_index = 0;
                  this.a_2483(mitem1.iServerID,mitem1.iRoomID);
               }
               this.a_3744("必须先出海",this.m_szTiShi,false,true,false,false,2000);
            }
            else
            {
               this.showCilckedTarget(this.stTDPetEntranceUI,"TDPetEntranceUI","萌宠神殿",this.InitialzeTDPetEntranceUI);
            }
         }
         if(a_4730.target.name == "m_WriteNowBtn")
         {
            urlStrProve = "https://u.4399.com/profile/realname.html";
            reqProve = new URLRequest(urlStrProve);
            navigateToURL(reqProve,"_blank");
         }
         if(a_4730.target.name == "m_ReceiveBtn")
         {
            ade = new a_1778(EventType.UPDATE_DENTITYCARDINFO);
            dob = {};
            dob.m_mouseEnble = false;
            ade.dataObject = dob;
            a_1789.getInstance().dispatchEvent(ade);
            this.receiveProve();
         }
         if(a_4730.target.name == "MenuViolationReportBtn")
         {
            urlStr = "https://my.4399.com/zhuanti/other/wgjb?app=msdzls";
            req = new URLRequest(urlStr);
            navigateToURL(req,"_blank");
         }
         ExplainDialogManager.instance.showDialog(this,a_4730.target.name);
      }
      
      private function ShowExclusivePacksPage() : void
      {
         var strURL:String = "https://my.4399.com/forums/thread-54404612";
         var strShowType:String = "_blank";
         navigateToURL(new URLRequest(strURL),strShowType);
      }
      
      private function showNewDentityURL() : void
      {
         var urlStrProve:String = null;
         var reqProve:URLRequest = null;
         var siteType:String = stage.loaderInfo.parameters.sitetype == null ? "" : stage.loaderInfo.parameters.sitetype;
         if(siteType == "4399")
         {
            urlStrProve = "http://my.4399.com/zhuanti/home/smrz-app-msdzls";
            reqProve = new URLRequest(urlStrProve);
            navigateToURL(reqProve,"_blank");
         }
      }
      
      private function setTurnToPanel(close:Boolean = false) : void
      {
         if(!close)
         {
            if(this.contains(this.stTDTurnToUI))
            {
               this.removeChild(this.stTDTurnToUI);
            }
            else
            {
               this.addChild(this.stTDTurnToUI);
            }
         }
         else if(this.contains(this.stTDTurnToUI))
         {
            this.removeChild(this.stTDTurnToUI);
         }
      }
      
      private function addRightMenu() : void
      {
         addChild(this.stTDRightMenuUI);
      }
      
      private function AddGuide3366UI() : void
      {
         addChild(this.stTDGuide3366UI);
      }
      
      public function onShowUserAvatarTip(role:Object) : void
      {
         if(this.userAvatarTip == null)
         {
            this.userAvatarTip = new UserAvatarTip();
         }
         addChild(this.userAvatarTip);
         this.userAvatarTip.addEventListener(MouseEvent.ROLL_OUT,this.onAvatarMouseOutEvent);
         var isLocal:Boolean = false;
         var currRole:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         var m_CurrentRoleUin:int = currRole.m_iRoleUin;
         if(m_CurrentRoleUin == role.m_iRoleUin)
         {
            isLocal = true;
         }
         this.userAvatarTip.showUser(role,isLocal);
         var _x:int = this.mouseX;
         var _y:int = this.mouseY;
         if(_x + this.userAvatarTip.width > 950)
         {
            _x = _x - this.userAvatarTip.width + 5;
         }
         else
         {
            _x -= 5;
         }
         if(_y + this.userAvatarTip.height > 600)
         {
            _y = _y - this.userAvatarTip.height + 5;
         }
         else
         {
            _y -= 5;
         }
         this.userAvatarTip.x = _x;
         this.userAvatarTip.y = _y;
         this.userAvatarTip.visible = true;
      }
      
      private function onAvatarMouseOutEvent(a_4730:MouseEvent) : void
      {
         if(Boolean(a_4730.currentTarget as UserAvatarTip) && Boolean(a_4730.target as UserAvatarTip))
         {
            this.userAvatarTip.visible = false;
         }
      }
      
      public function onShowMouseTip(objMouse:Object) : void
      {
         if(this.mouseTip == null)
         {
            this.mouseTip = new MouseTip();
         }
         addChild(this.mouseTip);
         this.mouseTip.visible = true;
         var m_dictDesc:Dictionary = a_2027.getInstance().m_dictMouseDesc;
         var mDesc:a_3306 = m_dictDesc[objMouse.m_id];
         if(mDesc != null)
         {
            this.mouseTip.setMouseTip(mDesc);
         }
         var _x:int = int(objMouse.m_x);
         var _y:int = int(objMouse.m_y);
         if(_x + this.mouseTip.width > 950)
         {
            _x -= this.mouseTip.width;
         }
         if(_y + this.mouseTip.height > 600)
         {
            _y = _y - this.mouseTip.height < 0 ? 0 : int(_y - this.mouseTip.height);
         }
         this.mouseTip.x = _x;
         this.mouseTip.y = _y;
         this.mouseTip.visible = true;
      }
      
      public function onShowExploreTaskTip(objTask:Object) : void
      {
         var _x:int = 0;
         var _y:int = 0;
         if(this.exploreTaskTip == null)
         {
            this.exploreTaskTip = this.stTDComponentUI.GetExploreTaskTip();
            this.stTDComponentUI.GetCompleteAllTaskTip();
         }
         addChild(this.exploreTaskTip);
         this.exploreTaskTip.visible = true;
         (this.exploreTaskTip as ExploreTaskTip).showTaskTip(objTask);
         _x = int(objTask.m_x);
         _y = int(objTask.m_y);
         if(_x + this.exploreTaskTip.width > 950)
         {
            _x -= this.exploreTaskTip.width;
         }
         if(_y + this.exploreTaskTip.height > 600)
         {
            _y = _y - this.exploreTaskTip.height < 0 ? 0 : int(_y - this.exploreTaskTip.height);
         }
         this.exploreTaskTip.x = _x;
         this.exploreTaskTip.y = _y;
         this.exploreTaskTip.visible = true;
      }
      
      public function onHideExploreTaskTip() : void
      {
         if(this.exploreTaskTip != null)
         {
            this.exploreTaskTip.visible = false;
         }
      }
      
      public function OnUsePropsCard(CardID:int) : void
      {
         var fakeTarget:Sprite = null;
         var fakeTargetName:String = null;
         if(CardID == a_1733.enm_WordBossDaLaBa)
         {
            fakeTargetName = "menuPopularLandBtn";
            if(!ActionNewActivityConfigXml.getInstance().m_OpenMenulist[fakeTargetName])
            {
               MessageTipHandler.Get().a_3146("巅峰对决未开启!");
            }
            else
            {
               fakeTarget = new Sprite();
               fakeTarget.name = fakeTargetName;
               this.addChild(fakeTarget);
               fakeTarget.addEventListener(MouseEvent.CLICK,this.onClickEvent);
               fakeTarget.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
               this.removeChild(fakeTarget);
            }
         }
      }
      
      public function onShowCardTip(CardID:int, point:Point, w:int, h:int, cardAttr:a_3228 = null) : void
      {
         var m_dictDesc:Dictionary = null;
         var iFFFID:int = 0;
         var cardID:int = 0;
         var cardDesc:a_3306 = null;
         var ID:int = 0;
         var giftDesc:a_3306 = null;
         var extraAttrDesc:a_3306 = null;
         var buffAttrDesc:a_3306 = null;
         var duanweiAttrDes:a_3306 = null;
         var ID2:int = 0;
         var aryAbleSlot:Array = null;
         var bArmShow:Boolean = false;
         var i:int = 0;
         var gemDesc:a_3306 = null;
         if(this.m_newGuide)
         {
         }
         if(CardID == 268435457)
         {
            if(this.attrUpTip == null)
            {
               this.attrUpTip = this.stTDComponentUI.a_3707();
            }
            stage.addChild(this.attrUpTip);
            this.attrUpTip.x = point.x;
            this.attrUpTip.y = point.y;
            this.attrUpTip.visible = true;
            (this.attrUpTip as CardTip).showCardTip(null,cardAttr);
            return;
         }
         if((Number(CardID) & 0xFF000000) == 352321536)
         {
            if(this.samllRoomCardTip == null)
            {
               this.samllRoomCardTip = TDSmallHouseUI(this.stTDSmallHouseUI).GetSmallRoomCardTip();
            }
            stage.addChild(this.samllRoomCardTip);
            this.samllRoomCardTip.x = point.x;
            this.samllRoomCardTip.y = point.y;
            this.samllRoomCardTip.visible = true;
            (this.samllRoomCardTip as SmallRoomCardTip).showCardTip(CardID,null);
            return;
         }
         m_dictDesc = a_2027.getInstance().m_dictDesc;
         iFFFID = CardID & 0xFFF00000;
         if((CardID & 0xFF000000) == 771751936 || iFFFID == 329252864 || iFFFID == 597688320 || iFFFID == 330301440 || iFFFID == 598736896)
         {
            if((CardID & 0xFF000000) != 771751936)
            {
               CardID = CardID & 0x0FFFFFFF | 0x10000000;
            }
            giftDesc = m_dictDesc[CardID];
            if(this.giftCardTip == null)
            {
               this.giftCardTip = this.stTDComponentUI.a_3706();
            }
            stage.addChild(this.giftCardTip);
            (this.giftCardTip as CardTip).showCardTip(giftDesc,cardAttr);
            this.showCardTip(w,point,this.giftCardTip);
            return;
         }
         if((CardID & 0xFFF00000) == 333447168)
         {
            extraAttrDesc = m_dictDesc[CardID];
            if(this.extraAttrTip == null)
            {
               this.extraAttrTip = this.stTDComponentUI.a_3708();
            }
            stage.addChild(this.extraAttrTip);
            (this.extraAttrTip as CardTip).showCardTip(extraAttrDesc,cardAttr);
            this.showCardTip(w,point,this.extraAttrTip);
            return;
         }
         if((CardID & 0xFFFF0000) == 320012288)
         {
            buffAttrDesc = m_dictDesc[CardID];
            if(this.buffTip == null)
            {
               this.buffTip = new BuffTip();
            }
            stage.addChild(this.buffTip);
            (this.buffTip as CardTip).showCardTip(buffAttrDesc,cardAttr);
            this.showCardTip(w,point,this.buffTip);
            return;
         }
         if((CardID & 0xFFFF0000) == 320077824)
         {
            duanweiAttrDes = m_dictDesc[CardID];
            if(duanweiAttrDes)
            {
               if(this.duanweiTip == null)
               {
                  this.duanweiTip = new DuanweiTip();
               }
               stage.addChild(this.duanweiTip);
               (this.duanweiTip as CardTip).showCardTip(duanweiAttrDes,cardAttr);
               this.showCardTip(w,point,this.duanweiTip);
               return;
            }
         }
         cardID = CardID & 0x0FFFFFFF | 0x10000000;
         cardDesc = m_dictDesc[cardID];
         if(cardDesc == null)
         {
            cardDesc = new a_3306();
         }
         ID = cardID & 0xFF000000;
         if(ID == 335544320)
         {
            ID2 = cardID & 0xFFF00000;
            aryAbleSlot = ComposeConfig.getInstance().GetCanSlotItem();
            bArmShow = false;
            for(i = 0; i < aryAbleSlot.length; i++)
            {
               if(ID2 == parseInt(aryAbleSlot[i]))
               {
                  bArmShow = true;
                  break;
               }
            }
            if(bArmShow)
            {
               if(this.armCardTip == null)
               {
                  this.armCardTip = this.stTDComponentUI.a_3703();
               }
               stage.addChild(this.armCardTip);
               (this.armCardTip as CardTip).showCardTip(cardDesc,cardAttr);
               this.showCardTip(w,point,this.armCardTip);
            }
            else if(ID2 == 348127232 || ID2 == 335544320)
            {
               if(this.achiCardTip == null)
               {
                  this.achiCardTip = this.stTDComponentUI.a_3705();
               }
               stage.addChild(this.achiCardTip);
               (this.achiCardTip as CardTip).showCardTip(cardDesc,cardAttr);
               this.showCardTip(w,point,this.achiCardTip);
            }
            else if(ID2 == 343932928)
            {
               gemDesc = m_dictDesc[cardID];
               if(this.gemTip == null)
               {
                  this.gemTip = this.stTDComponentUI.GetGemTip();
               }
               stage.addChild(this.gemTip);
               (this.gemTip as CardTip).showCardTip(gemDesc,cardAttr);
               this.showCardTip(w,point,this.gemTip);
            }
            else if(ID2 == 344981504)
            {
               if(this.gemTip == null)
               {
                  this.gemTip = this.stTDComponentUI.GetGemTip();
               }
               stage.addChild(this.gemTip);
               (this.gemTip as CardTip).showCardTip(cardDesc,cardAttr);
               this.showCardTip(w,point,this.gemTip);
            }
            else
            {
               if(this.equipCardTip == null)
               {
                  this.equipCardTip = this.stTDComponentUI.a_3704();
               }
               stage.addChild(this.equipCardTip);
               (this.equipCardTip as CardTip).showCardTip(cardDesc,cardAttr);
               this.showCardTip(w,point,this.equipCardTip);
            }
         }
         else if(ID == 301989888 || ID == 318767104)
         {
            if(this.propsCardTip == null)
            {
               this.propsCardTip = this.stTDComponentUI.a_3702();
            }
            stage.addChild(this.propsCardTip);
            (this.propsCardTip as CardTip).showCardTip(cardDesc,cardAttr);
            this.showCardTip(w,point,this.propsCardTip);
         }
         else if(ID == 285212672)
         {
            if(this.defCardTip == null)
            {
               this.defCardTip = this.stTDComponentUI.a_3701();
            }
            stage.addChild(this.defCardTip);
            (this.defCardTip as CardTip).showCardTip(cardDesc,cardAttr);
            this.showCardTip(w,point,this.defCardTip);
         }
      }
      
      public function onHideUserAvatatTip() : void
      {
      }
      
      public function onHideMouseTip() : void
      {
         if(this.mouseTip != null)
         {
            this.mouseTip.visible = false;
         }
      }
      
      public function onHideCardTip(CardID:int) : void
      {
         if(this.attrUpTip != null)
         {
            this.attrUpTip.visible = false;
         }
         if(this.propsCardTip != null)
         {
            this.propsCardTip.visible = false;
         }
         if(this.armCardTip != null)
         {
            this.armCardTip.visible = false;
         }
         if(this.equipCardTip != null)
         {
            this.equipCardTip.visible = false;
         }
         if(this.achiCardTip != null)
         {
            this.achiCardTip.visible = false;
         }
         if(null != this.gemTip)
         {
            this.gemTip.visible = false;
         }
         if(this.defCardTip != null)
         {
            this.defCardTip.visible = false;
            (this.defCardTip as DefCardTip).onHideCardTip();
         }
         if(this.giftCardTip != null)
         {
            this.giftCardTip.visible = false;
         }
         if(this.extraAttrTip != null)
         {
            this.extraAttrTip.visible = false;
         }
         if(this.samllRoomCardTip != null)
         {
            this.samllRoomCardTip.visible = false;
         }
         if(this.buffTip != null)
         {
            this.buffTip.visible = false;
         }
         if(this.duanweiTip != null)
         {
            this.duanweiTip.visible = false;
         }
      }
      
      private function showCardTip(w:int, point:Point, tip:Object) : void
      {
         if(point.x + tip.width > 950)
         {
            point.x = point.x - tip.width - w;
         }
         if(point.y + tip.height > 600)
         {
            point.y = point.y - tip.height < 0 ? 0 : point.y - tip.height;
         }
         tip.x = point.x;
         tip.y = point.y;
         tip.visible = true;
      }
      
      public function onShowVsModeTip(id:int) : void
      {
         var modeArr:Array = null;
         var item:Object = null;
         var _x:int = 0;
         var _y:int = 0;
         modeArr = a_2033.getInstance().m_arrVsMode;
         if(this.stModeTip == null)
         {
            this.stModeTip = this.stTDComponentUI.a_3711();
         }
         addChild(this.stModeTip);
         for each(item in modeArr)
         {
            if(item.iModelID == id)
            {
               (this.stModeTip as IVsModeTip).setVsModeTip(item);
            }
         }
         _x = this.mouseX;
         _y = this.mouseY;
         if(_x + this.stModeTip.width > 950)
         {
            _x -= this.stModeTip.width;
         }
         if(_y + this.stModeTip.height > 600)
         {
            _y = _y - this.stModeTip.height < 0 ? 0 : int(_y - this.stModeTip.height);
         }
         this.stModeTip.x = _x;
         this.stModeTip.y = _y;
         this.stModeTip.visible = true;
      }
      
      public function onShowVsLevelTip(id:int) : void
      {
         var m_dictVsInfo:Dictionary = null;
         var item:Object = null;
         var _x:int = 0;
         var _y:int = 0;
         m_dictVsInfo = a_2033.getInstance().m_dictVsInfo;
         if(this.stVsLevelTip == null)
         {
            this.stVsLevelTip = this.stTDComponentUI.a_3712();
         }
         addChild(this.stVsLevelTip);
         item = m_dictVsInfo[id];
         (this.stVsLevelTip as IVsLevelTip).setVsLevelTip(item);
         _x = this.mouseX;
         _y = this.mouseY;
         if(_x + this.stVsLevelTip.width > 950)
         {
            _x -= this.stVsLevelTip.width;
         }
         if(_y + this.stVsLevelTip.height > 600)
         {
            _y = _y - this.stVsLevelTip.height < 0 ? 0 : int(_y - this.stVsLevelTip.height);
         }
         this.stVsLevelTip.x = _x;
         this.stVsLevelTip.y = _y;
         this.stVsLevelTip.visible = true;
      }
      
      public function onHideVsModeTip() : void
      {
         if(this.stModeTip != null)
         {
            this.stModeTip.visible = false;
         }
         if(this.stVsLevelTip != null)
         {
            this.stVsLevelTip.visible = false;
         }
      }
      
      public function a_2581(response:Object) : void
      {
         var arrCards:Array = null;
         var attr:a_3228 = null;
         var params:Object = null;
         var role:a_4463 = null;
         if(response.m_nResult == 0)
         {
            LobbyEventManager.Get().dispatchEvent(new ComposeSystemEvent(response.m_stNewCardInfo.m_iCardID,a_4514.a_1645,response.m_cLevel));
            if(response.m_cLevel >= 2 && stage != null && (stage.loaderInfo.parameters.sitetype == "qq" || stage.loaderInfo.parameters.sitetype == "123u"))
            {
               arrCards = a_2161.e.GetCardsByType(a_1730.card_slot_package_hero_item) as Array;
               for each(attr in arrCards)
               {
                  if(attr.CardID == a_1733.enm_VipA)
                  {
                     params = new Object();
                     role = a_2161.e.GetCurrentRole() as a_4463;
                     params.src_uin = role.m_iRoleUin;
                     params.src_account = role.m_szRoleName;
                     params.award_type = 19;
                     params.award_id = attr.CardID;
                     params.URLType = 0;
                     a_3191.getInstance().sendRequest(this,params,this.onMiscInfoStrResponse);
                     break;
                  }
               }
            }
         }
      }
      
      public function a_2582(response:Object) : void
      {
         var dict:Dictionary = null;
         var Id:int = 0;
         var name:String = null;
         var arrCards:Array = null;
         var attr:a_3228 = null;
         var params:Object = null;
         var role:a_4463 = null;
         var myGender:int = 0;
         dict = a_2027.getInstance().m_dictDesc;
         if(response.m_nResult == 0)
         {
            if(response.m_iAct == 1)
            {
               LobbyEventManager.Get().dispatchEvent(new ComposeSystemEvent(response.m_stNewCardInfo.m_iID,a_4514.a_1646,response.m_cLevel));
               Id = int(response.m_stNewCardInfo.m_iID);
               name = dict[Id].Name;
               if(response.m_cLevel > 5 && stage != null && (stage.loaderInfo.parameters.sitetype == "qq" || stage.loaderInfo.parameters.sitetype == "123u"))
               {
                  arrCards = a_2161.e.GetCardsByType(a_1730.card_slot_package_hero_item) as Array;
                  for each(attr in arrCards)
                  {
                     if(attr.CardID == a_1733.enm_VipB)
                     {
                        params = new Object();
                        role = a_2161.e.GetCurrentRole() as a_4463;
                        params.src_uin = role.m_iRoleUin;
                        params.src_account = role.m_szRoleName;
                        params.award_type = 19;
                        params.award_id = attr.CardID;
                        params.URLType = 0;
                        a_3191.getInstance().sendRequest(this,params,this.onMiscInfoStrResponse);
                        break;
                     }
                  }
               }
               if(this.stTDFeedUI)
               {
                  myGender = int(a_2161.e.GetCurrentRole().m_iUserSex);
                  this.mBridge.execute("sendFeed",this,ConstFeed.a_536,response.m_cLevel,myGender);
                  if(response.m_cLevel > 4)
                  {
                     this.send3366Feed(ConstFeed.COMPOSE_CARD,response.m_cLevel,name);
                  }
               }
               if(this.m_iStoreType == 1)
               {
                  LobbyEventManager.Get().dispatchEvent(new FriendSystemEvent(a_4514.a_709));
               }
            }
            if(response.m_iAct == 4)
            {
               LobbyEventManager.Get().dispatchEvent(new ComposeSystemEvent(response.m_stNewCardInfo.m_iID,a_4514.TaskOperate_Gem_Strengthen,response.m_cLevel));
               LobbyEventManager.Get().dispatchEvent(new ComposeSystemEvent(response.m_stNewCardInfo.m_iID,a_4482.TaskOperate_Gem_Strengthen,response.m_cLevel));
               if(this.stTDFeedUI)
               {
                  if(response.m_cLevel > 5)
                  {
                     this.send3366Feed(ConstFeed.COMPOSE_CARD,response.m_cLevel,name);
                  }
               }
            }
         }
      }
      
      public function send3366Feed(type:int, param1:String = "", param2:String = "", param3:String = "", param4:String = "", param5:String = "") : void
      {
         var openid:String = null;
         var openkey:String = null;
         if("3366" != stage.loaderInfo.parameters.sitetype)
         {
            return;
         }
         if(null != stage)
         {
            openid = stage.loaderInfo.parameters.sig_user;
            openkey = stage.loaderInfo.parameters.myopenkey;
            this.mBridge.execute("sendFeed",this,type,openid,openkey,param1,param2,param3,param4,param5);
         }
      }
      
      public function OnSlotItemResponse(response:Object) : void
      {
         if(response.m_nResult == 0)
         {
            LobbyEventManager.Get().dispatchEvent(new ComposeSystemEvent(response.m_iItemID,a_4514.TaskOperate_Armys,response.m_nSlotCount));
            LobbyEventManager.Get().dispatchEvent(new ComposeSystemEvent(a_4482.TaskCard_Armys_Slot,a_4482.TaskOperate_Armys,response.m_nSlotCount));
         }
      }
      
      public function OnGenUnloadResponse(response:Object) : void
      {
      }
      
      public function OnGenInlayResponse(response:Object) : void
      {
         var level:int = 0;
         var m_astGemInlay:Array = null;
         var i:int = 0;
         var n:int = 0;
         var obj:Object = null;
         if(response.m_nResult == 0)
         {
            level = 0;
            m_astGemInlay = response.m_astGemInlay;
            if(Boolean(m_astGemInlay) && Boolean(m_astGemInlay.length))
            {
               i = 0;
               n = int(m_astGemInlay.length);
               while(i < n)
               {
                  obj = m_astGemInlay[i];
                  if(level < obj.m_iAttrLevel)
                  {
                     level = int(obj.m_iAttrLevel);
                  }
                  i++;
               }
            }
            LobbyEventManager.Get().dispatchEvent(new ComposeSystemEvent(response.m_iItemID,a_4514.TaskOperate_Gem_Strengthen,level));
            LobbyEventManager.Get().dispatchEvent(new ComposeSystemEvent(a_4482.TaskCard_Armys_Set,a_4482.TaskOperate_Armys,response.m_nGemCount));
         }
      }
      
      public function OnGenDecomposeResponse(response:Object) : void
      {
         if(response.m_nResult == 0)
         {
            LobbyEventManager.Get().dispatchEvent(new ComposeSystemEvent(response.m_iItemID,a_4482.TaskOperate_Gem_Decompose));
         }
      }
      
      public function a_2378(response:Object) : void
      {
         if(response.m_nResult == 0)
         {
         }
      }
      
      private function a_2541(a_4730:a_1778) : void
      {
         var parameters:Object = null;
         var data:Object = null;
         parameters = stage.loaderInfo.parameters;
         if(parameters.sitetype == "4399" || parameters.sitetype == "joyyou11")
         {
            data = a_4730.dataObject;
            this.last_login_time = data.m_iTime;
            if(intervalId == 0)
            {
               intervalId = setInterval(this.HttpRequest,5000 * 60);
            }
            else
            {
               clearInterval(intervalId);
               intervalId = setInterval(this.HttpRequest,5000 * 60);
            }
         }
      }
      
      public function HttpRequest() : void
      {
         var parameters:Object = null;
         var group_id:int = 0;
         var role:Object = null;
         var url:String = null;
         var _data:URLVariables = null;
         var vTokenInfo:Vector.<PhpTokenData> = null;
         var stTokenData:PhpTokenData = null;
         var strRet:String = null;
         var _request:URLRequest = null;
         var loader:URLLoader = null;
         parameters = stage.loaderInfo.parameters;
         group_id = int(a_2161.e.getEnterRoom().m_iGroupID);
         role = a_2161.e.GetCurrentRole();
         url = "http://miscbg-" + parameters.sitetype + ".123u.com/" + group_id + "/?c=misc&a=save_online_time";
         if(role == null)
         {
            return;
         }
         _data = new URLVariables();
         _data.Uin = role.m_iRoleUin;
         _data.Account = role.m_szRoleName;
         _data.LoginTime = this.last_login_time.toString();
         vTokenInfo = new Vector.<PhpTokenData>();
         stTokenData = new PhpTokenData();
         stTokenData.m_strTokenKey = "Uin";
         stTokenData.m_strTokenValue = String(role.m_iRoleUin);
         vTokenInfo.push(stTokenData);
         stTokenData = new PhpTokenData();
         stTokenData.m_strTokenKey = "Account";
         stTokenData.m_strTokenValue = role.m_szRoleName;
         vTokenInfo.push(stTokenData);
         stTokenData = new PhpTokenData();
         stTokenData.m_strTokenKey = "LoginTime";
         stTokenData.m_strTokenValue = this.last_login_time.toString();
         vTokenInfo.push(stTokenData);
         strRet = this.getToken(vTokenInfo);
         _data.token = strRet;
         _request = new URLRequest();
         _request.url = url;
         _request.method = URLRequestMethod.POST;
         _request.data = _data;
         loader = new URLLoader();
         loader.addEventListener(Event.COMPLETE,this.completeHandler);
         loader.load(_request);
      }
      
      private function OnSortToken(a:PhpTokenData, b:PhpTokenData) : int
      {
         if(a.m_strTokenKey < b.m_strTokenKey)
         {
            return -1;
         }
         if(a.m_strTokenKey > b.m_strTokenKey)
         {
            return 1;
         }
         return 0;
      }
      
      public function getToken(vTokenData:Vector.<PhpTokenData>) : String
      {
         var strRet:String = null;
         var i:int = 0;
         vTokenData.sort(this.OnSortToken);
         strRet = "";
         for(i = 0; i < vTokenData.length; i++)
         {
            if(i > 0)
            {
               strRet += "&";
            }
            strRet += vTokenData[i].m_strTokenKey + "=" + vTokenData[i].m_strTokenValue;
         }
         strRet += "&key=" + TOKEN_KEY;
         strRet = MD5.hash(strRet);
         return strRet.toUpperCase();
      }
      
      private function completeHandler(evt:Event) : void
      {
         var stJsonDecode:JSONDecoder = null;
         var jsonObj:Object = null;
         try
         {
            stJsonDecode = new JSONDecoder(evt.target.data as String);
            jsonObj = stJsonDecode.getValue();
            if(jsonObj.result_id == 0)
            {
               trace("submit success");
            }
            else
            {
               trace("submit failed");
            }
         }
         catch(error:Error)
         {
            trace(error);
         }
      }
      
      public function RequestPayMoney() : void
      {
         var objPay:Object = null;
         var parameters:Object = null;
         var role:Object = null;
         var params:Object = null;
         var payAbled:Boolean = false;
         var enterRoom:Object = null;
         if(stage == null)
         {
            return;
         }
         objPay = a_2047.getConfigData("Pay");
         if(objPay == null)
         {
            return;
         }
         parameters = stage.loaderInfo.parameters;
         role = a_2161.e.GetCurrentRole();
         params = {};
         payAbled = true;
         params.sitetype = stage.loaderInfo.parameters.sitetype;
         params.m_iDemo = stage.loaderInfo.parameters.is_normal_login;
         params.pay_cgi = objPay.url;
         params.signature = a_2036.getInstance().a_783;
         params.original_uin = a_2036.getInstance().m_iUin;
         params.role_uin = role.m_iRoleUin;
         params.group_id = a_2161.e.getEnterRoom().m_iGroupID;
         params.open_id = stage.loaderInfo.parameters.sig_user;
         if(stage.loaderInfo.parameters.hasOwnProperty("username"))
         {
            params.username = stage.loaderInfo.parameters.username;
         }
         else
         {
            params.username = "";
         }
         params.replaceValues = [];
         enterRoom = a_2161.e.getEnterRoom();
         switch(params.sitetype)
         {
            case "4399":
               if(ExternalInterface.available)
               {
                  ExternalInterface.marshallExceptions = true;
                  try
                  {
                     ExternalInterface.call("openRecharge",170,params.username,params.group_id,role.m_szRoleName);
                  }
                  catch(e:Error)
                  {
                     trace(e);
                  }
               }
               break;
            case "360":
               if(ExternalInterface.available)
               {
                  ExternalInterface.marshallExceptions = true;
                  try
                  {
                     ExternalInterface.call("show_pay_window",params.open_id,params.m_iDemo,6);
                  }
                  catch(e:Error)
                  {
                     trace(e);
                  }
               }
               break;
            case "joyyou":
               if(ExternalInterface.available)
               {
                  ExternalInterface.marshallExceptions = true;
                  try
                  {
                     ExternalInterface.call("openRecharge",170,params.username,params.group_id,role.m_szRoleName);
                  }
                  catch(e:Error)
                  {
                     trace(e);
                  }
               }
               break;
            case "7k7k":
               params.pay_cgi += "&uid=" + parameters.sig_user;
               break;
            case "qq":
            case "3366":
            case "qqgame":
               params.pfkey = enterRoom.pfkey;
               params.pf = enterRoom.pf;
            case "123u":
               if(!WhiteListConfig.isPayPermissible(params.open_id))
               {
                  payAbled = false;
               }
               else
               {
                  params.sitetype = "qq";
                  params.open_key = stage.loaderInfo.parameters.myopenkey;
                  params.usr_exp = role.m_iGamePoint;
                  params.listener = this;
                  params.callbackFunction = "qqpayCallBack";
               }
               break;
            case "shengda":
               params.replaceValues.push(encodeURIComponent(stage.loaderInfo.parameters.sig_session_key));
               params.replaceValues.push(params.open_id);
               params.replaceValues.push(a_2161.e.getEnterRoom().m_iUin);
               params.replaceValues.push(params.role_uin);
               break;
            case "duowan":
               params.replaceValues.push(params.open_id);
               params.replaceValues.push(params.group_id);
               break;
            default:
               trace("平台[" + params.sitetype + "]使用默认的支付方式！");
         }
         if(payAbled && "360" != params.sitetype && "joyyou" != params.sitetype && "4399" != params.sitetype)
         {
            a_2175.getInstance().payRequest(params);
         }
      }
      
      public function receiveProve() : void
      {
         var parameters:Object = null;
         var group_id:int = 0;
         var url:String = null;
         var _data:URLVariables = null;
         var strRet:String = null;
         var _request:URLRequest = null;
         var loader:URLLoader = null;
         if(this.m_isReceive)
         {
            this.showTip("您操作过于频繁，请稍后重试!");
            return;
         }
         parameters = stage.loaderInfo.parameters;
         if(stage.loaderInfo.parameters.hasOwnProperty("username"))
         {
            parameters.username = stage.loaderInfo.parameters.username;
         }
         else
         {
            parameters.username = "";
         }
         group_id = int(a_2161.e.getEnterRoom().m_iGroupID);
         var role:Object = a_2161.e.GetCurrentRole();
         url = "http://gameadm-4399.123u.com/gametool/send_card_for_4399_prove.php?";
         _data = new URLVariables();
         _data.username = parameters.sig_user;
         _data.serverid = group_id;
         _data.commit = 1;
         _data.time = Number(new Date().time / 1000).toFixed(0);
         strRet = "";
         strRet = _data.username + _data.serverid + _data.commit + _data.time + PROVE_KEY;
         strRet = MD5.hash(strRet);
         _data.flag = strRet;
         _request = new URLRequest();
         _request.url = url;
         _request.method = URLRequestMethod.POST;
         _request.data = _data;
         if(!this.m_isReceive)
         {
            loader = new URLLoader();
            loader.addEventListener(Event.COMPLETE,this.onReceiveProveBack);
            loader.load(_request);
            this.m_isReceive = true;
         }
      }
      
      private function onReceiveProveBack(evt:Event) : void
      {
         var dataEvent:a_1778 = null;
         var obj:Object = null;
         var returnE:Event = evt;
         switch(int(evt.target.data).toString())
         {
            case "1":
               this.showTip("领取成功!");
               break;
            case "2":
               this.showTip("领取失败,已经发放！");
               obj = new Object();
               obj.m_mouseEnble = false;
               dataEvent = new a_1778(EventType.UPDATE_DENTITYCARDINFO);
               dataEvent.dataObject = obj;
               a_1789.getInstance().dispatchEvent(dataEvent);
               break;
            default:
               this.showTip("领取失败,验证失败!");
               obj = new Object();
               obj.m_mouseEnble = true;
               dataEvent = new a_1778(EventType.UPDATE_DENTITYCARDINFO);
               dataEvent.dataObject = obj;
               a_1789.getInstance().dispatchEvent(dataEvent);
         }
         this.m_isReceive = false;
      }
      
      public function openProve() : void
      {
         var payAbled:Boolean;
         var parameters:Object = null;
         var role:Object = null;
         var params:Object = null;
         if(stage == null)
         {
            return;
         }
         parameters = stage.loaderInfo.parameters;
         role = a_2161.e.GetCurrentRole();
         params = {};
         payAbled = true;
         params.sitetype = stage.loaderInfo.parameters.sitetype;
         params.m_iDemo = stage.loaderInfo.parameters.is_normal_login;
         params.signature = a_2036.getInstance().a_783;
         params.original_uin = a_2036.getInstance().m_iUin;
         params.role_uin = role.m_iRoleUin;
         params.group_id = a_2161.e.getEnterRoom().m_iGroupID;
         params.open_id = stage.loaderInfo.parameters.sig_user;
         if(stage.loaderInfo.parameters.hasOwnProperty("username"))
         {
            params.username = stage.loaderInfo.parameters.username;
         }
         else
         {
            params.username = "";
         }
         if(ExternalInterface.available)
         {
            ExternalInterface.marshallExceptions = true;
            try
            {
               ExternalInterface.call("openProve",parameters.sig_user,params.group_id);
            }
            catch(e:Error)
            {
               trace(e);
            }
         }
      }
      
      public function qqpayCallBack(data:Object) : void
      {
         if(data == null)
         {
            return;
         }
         if(data.ret != 0)
         {
            this.textTip = this.GetMessageTip();
            this.textTip.showTextTip(this,data.msg,new Rectangle());
         }
      }
      
      public function a_2621(data:Object) : void
      {
         this.stTDLobbyRoomUI.a_2621(data);
         if(data.m_nResultID == 0)
         {
            if(this.storyGuideCondition != null && Boolean(this.storyGuideCondition["n_sitdown"]))
            {
               this.storyGuideCondition["n_sitdown"] = false;
               MeishiGuide.Instance.showStoryGuide(this.hasStoryGuide());
            }
         }
      }
      
      public function RequestInvite(iData:Object) : void
      {
         this.a_1206.a_2379(a_1740.a_393,iData);
      }
      
      public function RequestDelFriend(iUin:int) : void
      {
         this.a_1206.RequestDelFriend(iUin);
      }
      
      public function a_3754(data:Object) : void
      {
         if(this.autoToReject(data))
         {
            data.m_iACT = EnmInviteType.REJECT;
            this.RequestInvite(data);
            return;
         }
         if(this.invitedPanel == null)
         {
            this.invitedPanel = this.stTDInviteUI.getInviteRequestPanel();
            this.invitedPanel.x = 355;
            this.invitedPanel.y = 202;
            this.invitedPanel.addEventListener(a_1791.ACCEPT,this.inviteOnAccept);
            this.invitedPanel.addEventListener(a_1791.REJECT,this.inviteOnReject);
         }
         if(!this.contains(this.gameLoader))
         {
            this.stTDInviteUI.setInviteData(data);
            this.addChild(this.invitedPanel);
         }
      }
      
      private function RefuseMarriageInvite() : Boolean
      {
         if(this.m_isGaming)
         {
            return true;
         }
         if(this.stage == null)
         {
            return true;
         }
         if(this.IsStaging(this.stTDChooseChannelUI))
         {
            return true;
         }
         if(this.IsStaging(this.m_stTDWeddingRoomUI))
         {
            return true;
         }
         if(this.IsStaging(this.stTDAuctionUI))
         {
            return true;
         }
         if(this.IsStaging(this.stTDComposeUI))
         {
            return true;
         }
         if(this.IsStaging(this.stTDStoreUI))
         {
            return true;
         }
         if(this.IsStaging(this.stTDEnterUI))
         {
            return true;
         }
         if(this.IsStaging(this.stTDNewMarginTreeUI))
         {
            return true;
         }
         if(this.IsStaging(this.stTDConsortiaUI))
         {
            return true;
         }
         if(this.IsStaging(this.stTDGameReadyUI))
         {
            return true;
         }
         if(this.IsStaging(this.stTDRankUI))
         {
            return true;
         }
         if(this.IsStaging(this.stTDVowUI))
         {
            return true;
         }
         if(this.IsStaging(this.stTDMoTaUI))
         {
            return true;
         }
         if(this.IsStaging(this.stTDVSMatchUI))
         {
            return true;
         }
         return false;
      }
      
      private function IsStaging(stObj:Object) : Boolean
      {
         var stSp:DisplayObject = null;
         stSp = stObj as DisplayObject;
         return stSp != null && stSp.stage != null;
      }
      
      private function autoToReject(data:Object) : Boolean
      {
         var effectData:LocalData = null;
         var effectVolume:Object = null;
         var a_808:Dictionary = null;
         var consortia:Object = null;
         var iID:int = 0;
         var f:Object = null;
         var invited:Boolean = false;
         if(this.m_isGaming)
         {
            return true;
         }
         if(this.stage == null)
         {
            return true;
         }
         if(Sprite(this.stTDLobbyRoomUI).stage == null)
         {
            return true;
         }
         if(this.m_stTDWeddingRoomUI != null && Sprite(this.m_stTDWeddingRoomUI).stage != null)
         {
            return true;
         }
         if(this.stTDEnterUI != null && Sprite(this.stTDEnterUI).stage != null)
         {
            return true;
         }
         if(this.stTDChooseChannelUI != null && Sprite(this.stTDChooseChannelUI).stage != null)
         {
            return true;
         }
         if(this.invitedPanel != null && this.invitedPanel.stage != null)
         {
            return true;
         }
         if(this.stTDStoreUI != null && Sprite(this.stTDStoreUI).stage != null)
         {
            return true;
         }
         if(this.stTDComposeUI != null && this.stTDComposeUI.stage != null)
         {
            return true;
         }
         if(this.stTDAuctionUI != null && this.stTDAuctionUI.stage != null)
         {
            return true;
         }
         if(this.stTDNewMarginTreeUI != null && this.stTDNewMarginTreeUI.stage != null)
         {
            return true;
         }
         if(this.stTDTaskUI != null && this.stTDTaskUI.stage != null)
         {
            return true;
         }
         if(this.stTDInfoUI != null && this.stTDInfoUI.stage != null)
         {
            return true;
         }
         if(this.stTDConsortiaUI != null && this.stTDConsortiaUI.stage != null)
         {
            return true;
         }
         effectData = new LocalData();
         effectVolume = effectData.read("effectVolume","/");
         if(effectVolume == null || isNaN(effectVolume.m_vcall))
         {
            effectVolume = new Object();
            effectVolume.m_vcall = 0;
            effectVolume.m_vsall = 0;
            effectVolume.m_vcf = 0;
            effectVolume.m_vsf = 0;
            effectVolume.m_vcunion = 0;
            effectVolume.m_vsunion = 0;
         }
         a_808 = a_2161.e.GetPositiveFriends() as Dictionary;
         consortia = a_2161.e.a_2163();
         iID = -1;
         if(consortia != null)
         {
            iID = int(consortia.m_stJoinInfo.m_iID);
         }
         f = a_808[data.m_sendUin];
         invited = true;
         if(data.m_gameMode != a_1748.enmGameMode_vComputer)
         {
            if(Number(effectVolume.m_vsall) == 0)
            {
               invited = false;
            }
            if(Number(effectVolume.m_vsf) == 0 && f != null)
            {
               invited = false;
            }
            if(Number(effectVolume.m_vsunion) == 0 && data.m_iUnionID == iID)
            {
               invited = false;
            }
         }
         else
         {
            if(Number(effectVolume.m_vcall) == 0)
            {
               invited = false;
            }
            if(Number(effectVolume.m_vcf) == 0 && f != null)
            {
               invited = false;
            }
            if(Number(effectVolume.m_vcunion) == 0 && data.m_iUnionID == iID)
            {
               invited = false;
            }
         }
         return invited;
      }
      
      private function inviteOnAccept(a_4730:a_1791) : void
      {
         var data:Object = null;
         var enterRoom:Object = null;
         data = this.stTDInviteUI.getInviteData();
         if(data.m_mapID >= 531 && data.m_mapID <= 556)
         {
            this.m_iNewYearBossPosition = 7;
            this.setTurnToPanel(true);
            enterRoom = a_2161.e.getEnterRoom();
            enterRoom.m_index = ROOM_ID_MEI_SHI;
            this.a_2483(-1,-1);
            this.m_iEnterInfo = data;
         }
         else
         {
            this.a_1206.a_2485(data.m_iServerID,data.m_iRoomID,data.m_iTableID,-1,"",data.m_szPassword,[data.m_mapID],data.m_gameMode,-1);
            LobbyEventManager.Get().dispatchEvent(new LocalTaskEvents(LocalTaskEvents.a_718));
         }
      }
      
      private function inviteOnReject(a_4730:a_1791) : void
      {
         var data:Object = null;
         data = this.stTDInviteUI.getInviteData();
         data.m_iACT = EnmInviteType.REJECT;
         this.RequestInvite(data);
      }
      
      private function onTaskShortcutEvent(a_4730:TaskShortcutEvent) : void
      {
         switch(a_4730.m_eventData.m_uiType)
         {
            case a_1764.a_534:
               this.showCilckedTarget(this.stTDInfoUI,"TDInfoUI",this.gsManager.getString(4408),this.a_4568);
               break;
            case a_1764.a_533:
            case a_1764.a_537:
               this.a_1206.a_2485(-1,-1,-1,0,"","",[a_4730.m_eventData.m_iMapID],a_4730.m_eventData.m_iGameMode,-1);
               break;
            case a_1764.a_535:
               this.showCilckedTarget(this.stTDVSGuideUI,"TDVSGuideUI",this.gsManager.getString(4397),this.a_4567);
               if(null != this.stTDVSGuideUI)
               {
                  if(this.stTDVSGuideUI.parent == this)
                  {
                     this.stTDVSGuideUI.addEventListener(Event.REMOVED_FROM_STAGE,this.a_4576);
                  }
               }
               break;
            case a_1764.a_536:
               this.showCilckedTarget(this.stTDComposeUI,"TDComposeUI",this.gsManager.getString(4402),this.a_4560);
               break;
            case a_1764.TYPE_STORE:
               this.showCilckedTarget(this.stTDStoreUI as DisplayObject,"TDStoreUI",this.gsManager.getString(4398),this.a_4559);
               if(null != this.stTDStoreUI)
               {
                  if((this.stTDStoreUI as DisplayObject).parent == this)
                  {
                     this.stTDStoreUI.a_3777(null,null);
                     (this.stTDStoreUI as DisplayObject).visible = true;
                  }
                  else
                  {
                     (this.stTDStoreUI as DisplayObject).visible = false;
                     addChild(this.stTDMenuUI as DisplayObject);
                  }
               }
               break;
            case a_1764.a_538:
               if(this.contains(this.stTDPackageUI))
               {
                  this.removeChild(this.stTDPackageUI);
               }
               else
               {
                  this.addChild(this.stTDPackageUI);
                  (this.stTDPackageUI as Object).RequestOpenPanel(2,2);
               }
               break;
            case a_1764.a_539:
               this.showCilckedTarget(this.stTDNewMarginTreeUI,"TDNewMarginTreeUI",this.gsManager.getString(4395),this.InitialzestTDNewMarginTreeUI);
               if(null != this.stTDNewMarginTreeUI)
               {
               }
               break;
            default:
               trace("任务类型ID=" + a_4730.m_eventData.m_uiType + "没有开通，敬请关注！");
         }
      }
      
      public function RequestOpenPackage(leftTabIndex:int, rightTabIndex:int = 0) : void
      {
         if(3 == leftTabIndex)
         {
            this.showCilckedTarget(this.stTDAchievementUI,"TDAchievementUI",this.gsManager.getString(4409),this.a_4574);
         }
         else if(this.contains(this.stTDPackageUI))
         {
            this.removeChild(this.stTDPackageUI);
         }
         else
         {
            this.addChild(this.stTDPackageUI);
            (this.stTDPackageUI as Object).RequestOpenPanel(leftTabIndex,rightTabIndex);
         }
      }
      
      public function RequestClosePane(paneID:int) : void
      {
         switch(paneID)
         {
            case ConstantMGUI.PANE_COMPOSE:
               this.showCilckedTarget(this.stTDComposeUI,"TDComposeUI",this.gsManager.getString(4402),this.a_4560);
               break;
            case ConstantMGUI.PANE_CONSORTIA:
               this.RequestCloseConsortiaPanel();
               break;
            default:
               trace("TDLobbyCoreUI::RequestClosePane>>default>paneID=" + paneID);
         }
      }
      
      public function GetConsortiaTalkIsAvailable() : Boolean
      {
         var consortiaInfo:Object = null;
         if(!this.consortiaIsOpen)
         {
            return false;
         }
         consortiaInfo = a_2161.e.a_2163();
         if(null == consortiaInfo)
         {
            return false;
         }
         if(null == consortiaInfo.m_stConsortiaInfo)
         {
            return false;
         }
         return true;
      }
      
      public function RequestCloseConsortiaPanel() : void
      {
         var curRole:Object = null;
         if(null != this.stTDConsortiaUI)
         {
            if(this == this.stTDConsortiaUI.parent)
            {
               this.removeChild(this.stTDConsortiaUI);
               this.stTDGameIMUI.x = 0;
               this.stTDGameIMUI.y = 0;
               this.addChild(this.stTDGameIMUI);
               curRole = a_2161.e.getEnterRoom();
               if(curRole.m_iUserStatus == a_1750.enm_OnlineStatus || curRole.m_iUserStatus == a_1750.enm_EnterTownStatus)
               {
                  this.mBridge.execute("onInitialzeGameIMData",this,EnmGameIM.a_511);
               }
               else if(curRole.m_iUserStatus == a_1750.enm_EnterRoomStatus)
               {
                  this.mBridge.execute("onInitialzeGameIMData",this,EnmGameIM.a_512);
               }
               else if(curRole.m_iUserStatus == a_1750.enm_SitDownStatus)
               {
                  this.mBridge.execute("onInitialzeGameIMData",this,EnmGameIM.a_513);
               }
               else if(curRole.m_iUserStatus == a_1750.enm_GameStartStatus)
               {
                  this.mBridge.execute("onInitialzeGameIMData",this,EnmGameIM.a_514);
               }
               else
               {
                  this.mBridge.execute("onInitialzeGameIMData",this,EnmGameIM.a_513);
               }
               addChild(this.stTDMenuUI as DisplayObject);
            }
         }
      }
      
      public function RequestChangeScreen() : void
      {
         stage.scaleMode = StageScaleMode.NO_SCALE;
         stage.align = "";
         if(stage.displayState == null || stage.displayState == StageDisplayState.NORMAL)
         {
            stage.displayState = StageDisplayState.FULL_SCREEN;
         }
         else
         {
            stage.displayState = StageDisplayState.NORMAL;
         }
      }
      
      public function RequestShowConsortiaIM(ct:DisplayObjectContainer) : void
      {
         this.RequestShowIM(ct,EnmGameIM.a_510,new Point(-ct.x,-ct.y));
      }
      
      public function RequestShowIM(ct:DisplayObjectContainer, imUIType:int, pst:Point = null) : void
      {
         if(null == ct)
         {
            ct = this;
            imUIType = EnmGameIM.a_511;
         }
         if(null == pst)
         {
            pst = new Point(0,0);
         }
         this.stTDGameIMUI.x = pst.x;
         this.stTDGameIMUI.y = pst.y;
         ct.addChild(this.stTDGameIMUI);
         this.mBridge.execute("onInitialzeGameIMData",this,imUIType);
      }
      
      public function RequestViewConsortiaEstablishmentPower(id:int) : void
      {
         var arrSettings:Array = null;
         var arrNames:Array = null;
         var view:ConsortiaEstablishmentPowerPanel = null;
         arrSettings = a_2161.e.a_2163().m_stConsortiaInfo.m_stEstablishment[id].m_arySettings;
         arrNames = [id];
         arrNames.push(this.gsManager.getString(65656,[this.gsManager.getString(4288)]));
         arrNames.push(this.gsManager.getString(65656,[this.gsManager.getString(4290)]));
         arrNames.push(this.gsManager.getString(65656,[this.gsManager.getString(4289)]));
         arrNames.push(this.gsManager.getString(65656,[this.gsManager.getString(4291)]));
         arrNames.push(this.gsManager.getString(65656,[this.gsManager.getString(4292)]));
         view = ConsortiaEstablishmentPowerPanel.getInstance();
         view.setTitle(arrNames[id]);
         view.setContent(arrSettings);
         this.addChild(view);
      }
      
      public function RequestJoinConsortiaNotify(data:Object) : void
      {
         var objConsortiaInfo:Object = null;
         var m_iID:int = 0;
         var sendData:Object = null;
         if(data.m_iRoleUin == a_2161.e.GetCurrentRole().m_iRoleUin)
         {
            return;
         }
         objConsortiaInfo = a_2161.e.a_2163();
         m_iID = 0;
         if(null != objConsortiaInfo && null != objConsortiaInfo.m_stJoinInfo && 0 < objConsortiaInfo.m_stJoinInfo.m_iID)
         {
            m_iID = int(objConsortiaInfo.m_stJoinInfo.m_iID);
         }
         this.stTDTipDialog.content = this.gsManager.getString(24632);
         this.stTDTipDialog.showTip(this,this.m_szTiShi,true,false,false,false);
         sendData = {};
         if(m_iID > 0)
         {
            sendData.m_iConsortiaID = m_iID;
            sendData.m_iDstUIN = data.m_iRoleUin;
            this.RequestInviteJoinConsortia(sendData);
         }
         else
         {
            this.tempConsoritaProposer = data;
            this.mBridge.execute("getConsortiaBriefRequest",this,[this.tempConsoritaProposer.m_iRoleUin],1);
         }
      }
      
      public function RequestJoinConsortia(data:Object) : void
      {
         this.mBridge.execute("requestJoinConsortiaRequest",this,data);
      }
      
      public function RequestJoinConsortiaInfo() : void
      {
         var role:a_4463 = null;
         role = a_2161.e.GetCurrentRole() as a_4463;
         this.mBridge.execute("getJoinConsortiaInfoRequest",this,role.m_iRoleUin);
      }
      
      public function RequestUpgradeConsortiaEstablishment(data:Object) : void
      {
         var consortiaInfo:Object = null;
         var level:int = 0;
         var objConfig:Object = null;
         var objCost:Object = null;
         var playerCommon:Object = null;
         if(1 == data.flag)
         {
            consortiaInfo = a_2161.e.a_2163().m_stConsortiaInfo;
            if(EnmConsortia.a_351 != consortiaInfo.m_cTitle && EnmConsortia.a_350 != consortiaInfo.m_cTitle)
            {
               this.stTDTipDialog.content = this.gsManager.getString(65646);
               this.stTDTipDialog.showTip(this,this.m_szTiShi,false,true,false,false,2000);
               return;
            }
            level = int(consortiaInfo.m_stEstablishment[data.m_iEstablishment].m_iLevel);
            if(level == consortiaInfo.m_iLevel)
            {
               this.stTDTipDialog.content = this.gsManager.getString(65647,[level,level]);
               this.stTDTipDialog.showTip(this,this.m_szTiShi,false,true,true,false,2000);
               return;
            }
            objConfig = a_3340.getConfig();
            objCost = objConfig["upgrade"]["establishment"][data.m_iEstablishment][level + 1];
            playerCommon = a_2161.e.GetPlayerCommon();
            if(consortiaInfo.m_iMoney < objCost.point)
            {
               this.stTDTipDialog.content = this.gsManager.getString(65648,[level + 1,objCost.gold,objCost.point,this.gsManager.getString(4279)]);
               this.stTDTipDialog.showTip(this,this.m_szTiShi,false,true,false,false,2000);
               return;
            }
            if(consortiaInfo.m_iCoin < objCost.gold)
            {
               this.stTDTipDialog.content = this.gsManager.getString(65648,[level + 1,objCost.gold,objCost.point,this.gsManager.getString(132421)]);
               this.stTDTipDialog.showTip(this,this.m_szTiShi,false,true,false,false,2000);
               return;
            }
            data.m_iConsortiaID = consortiaInfo.m_iID;
            this.stTDTipDialog.g_tempValue = data;
            this.stTDTipDialog.content = this.gsManager.getString(65649,[level + 1,objCost.gold,objCost.point]);
            this.stTDTipDialog.showTip(this,this.m_szTiShi,true,false,true,true);
            this.stTDTipDialog.addEventListener(a_3251.SURE,this.onUpgradeEstablishmentConfirm);
            this.stTDTipDialog.addEventListener(a_3251.CANCEL,this.onUpgradeEstablishmentCancel);
         }
         else
         {
            this.mBridge.execute("upgradeConsortiaEstablishmentRequest",this,data);
         }
      }
      
      private function onUpgradeEstablishmentConfirm(a_4730:a_3251) : void
      {
         var sendData:Object = null;
         var dataEvent:a_1778 = null;
         if(GlobalVariables.getInstance().m_iSecpwd == false && GlobalVariables.getInstance().m_iHasSecpwd == true)
         {
            dataEvent = new a_1778(EventType.UNEED_SECPWD);
            dataEvent.dataObject = null;
            a_1789.getInstance().dispatchEvent(dataEvent);
            return;
         }
         sendData = {};
         sendData.m_iConsortiaID = this.stTDTipDialog.g_tempValue.m_iConsortiaID;
         sendData.m_iEstablishment = this.stTDTipDialog.g_tempValue.m_iEstablishment;
         this.stTDTipDialog.g_tempValue = null;
         this.stTDTipDialog.content = this.gsManager.getString(24632);
         this.stTDTipDialog.showTip(this,this.m_szTiShi,true,false,false,false);
         this.stTDTipDialog.removeEventListener(a_3251.SURE,this.onUpgradeEstablishmentConfirm);
         this.stTDTipDialog.removeEventListener(a_3251.CANCEL,this.onUpgradeEstablishmentCancel);
         this.mBridge.execute("upgradeConsortiaEstablishmentRequest",this,sendData);
      }
      
      private function onUpgradeEstablishmentCancel(a_4730:a_3251) : void
      {
         this.stTDTipDialog.g_tempValue = null;
         this.stTDTipDialog.removeEventListener(a_3251.SURE,this.onUpgradeEstablishmentConfirm);
         this.stTDTipDialog.removeEventListener(a_3251.CANCEL,this.onUpgradeEstablishmentCancel);
      }
      
      public function RequestInviteJoinConsortia(data:Object) : void
      {
         this.mBridge.execute("inviteJoinConsortiaRequest",this,data);
      }
      
      public function RequestShowConsortiaEstablishment(id:int, data:Object) : void
      {
         this.m_iStoreType = 1;
         switch(id)
         {
            case 0:
               this.showCilckedTarget(this.stTDComposeUI,"TDComposeUI",this.gsManager.getString(4402),this.a_4560);
               break;
            case 1:
               this.showCilckedTarget(this.stTDStoreUI as DisplayObject,"TDStoreUI",this.gsManager.getString(4398),this.a_4559);
         }
      }
      
      public function onCreateConsortiaResponse(data:Object) : void
      {
         var myGender:int = 0;
         if(0 == data.m_nResult)
         {
            LobbyEventManager.Get().dispatchEvent(new FriendSystemEvent(a_4514.a_706));
            if(this.stTDFeedUI)
            {
               myGender = int(a_2161.e.GetCurrentRole().m_iUserSex);
               setTimeout(this.mBridge.execute,3000,"sendFeed",this,ConstFeed.a_1004,myGender);
            }
         }
      }
      
      public function onDisengageConsortiaResponse(data:Object) : void
      {
         if(0 == data.m_nResult)
         {
            LobbyEventManager.Get().dispatchEvent(new FriendSystemEvent(a_4514.a_711));
         }
      }
      
      public function onRequestJoinConsortiaResponse(data:Object) : void
      {
         if(null == this.stTDConsortiaUI || null == this.stTDConsortiaUI.parent)
         {
            if(0 == data.m_nResult)
            {
               if(EnmConsortia.enm_request == data.m_cCmd)
               {
                  this.stTDTipDialog.content = this.gsManager.getString(65666);
               }
            }
            else
            {
               this.stTDTipDialog.content = data.m_szReasonMessage;
            }
            this.stTDTipDialog.showTip(this,this.m_szTiShi,true,true,false,false,3000);
         }
      }
      
      public function onGetConsortiaBriefResponse(data:Object) : void
      {
         var arrUnions:Array = null;
         var union:Object = null;
         a_2157.e.OnGetConsortiaBrief(data);
         if(!(data as Array) && data.m_nAdjust == 1)
         {
            if(0 != data.m_nResult)
            {
               if(null != this.tempConsoritaProposer)
               {
                  this.stTDTipDialog.content = data.m_szReasonMessage;
                  this.stTDTipDialog.showTip(this,this.m_szTiShi,true,true,false,false,3000);
                  this.tempConsoritaProposer = null;
               }
            }
            else if(null != this.tempConsoritaProposer)
            {
               arrUnions = data.m_aryConsortiaBrief;
               if(arrUnions.length > 0)
               {
                  for each(union in arrUnions)
                  {
                     if(union.m_iAdjust == this.tempConsoritaProposer.m_iRoleUin)
                     {
                        if(0 == union.m_iID)
                        {
                           this.stTDTipDialog.content = this.gsManager.getString(65742);
                           this.stTDTipDialog.showTip(this,this.m_szTiShi,true,true,false,false,3000);
                           this.tempConsoritaProposer = null;
                        }
                        else
                        {
                           this.RequestJoinConsortia({
                              "m_iID":union.m_iID,
                              "m_szComment":this.gsManager.getString(65743),
                              "m_cCmd":EnmConsortia.enm_request
                           });
                        }
                        break;
                     }
                  }
               }
            }
         }
      }
      
      public function onGetJoinConsortiaInfoResponse(data:Object) : void
      {
         var enterRoom:Object = null;
         this.notifyStaticConsortiaTask();
         if(!this.m_isGaming && this.stTDRoomUserUI != null)
         {
            enterRoom = a_2161.e.getEnterRoom();
            (this.stTDRoomUserUI as Object).showAvatarView(null,enterRoom.m_index);
         }
      }
      
      public function onUpgradeConsortiaEstablishmentResponse(data:Object) : void
      {
         var content:String = null;
         if(null == this.stTDConsortiaUI || null == this.stTDConsortiaUI.parent)
         {
            content = "";
            if(0 == data.m_nResult)
            {
               content = this.gsManager.getString(65652,[this.gsManager.getString(4293)]);
            }
            else
            {
               content = data.m_szReasonMessage;
            }
            this.stTDTipDialog.content = content;
            this.stTDTipDialog.showTip(this,this.m_szTiShi,false,true,false,false,2000);
            return;
         }
         this.mBridge.execute("onUpgradeConsortiaEstablishmentResponse",this,data);
      }
      
      public function onInviteJoinConsortiaResponse(data:Object) : void
      {
         var content:String = null;
         content = "";
         if(0 == data.m_nResult)
         {
            content = this.gsManager.getString(65744);
         }
         else
         {
            content = data.m_szReasonMessage;
         }
         this.stTDTipDialog.content = content;
         this.stTDTipDialog.showTip(this,this.m_szTiShi,false,true,false,false,3000);
      }
      
      public function onConsortiaContributeResponse(data:Object) : void
      {
         var offerPoint:int = 0;
         if(0 == data.m_nResult)
         {
            offerPoint = a_3340.getConfig()["contribute"].exchange * data.m_iMoney;
            LobbyEventManager.Get().dispatchEvent(new FriendSystemEvent(a_4514.a_710,offerPoint));
         }
      }
      
      public function onJoinRequestHandlerNotify(data:Object) : void
      {
         var myGender:int = 0;
         if(null == this.stTDConsortiaUI || null == this.stTDConsortiaUI.parent)
         {
            if(EnmConsortia.enm_accept == data.m_iRefuse)
            {
               if(this.stTDFeedUI)
               {
                  myGender = int(a_2161.e.GetCurrentRole().m_iUserSex);
                  setTimeout(this.mBridge.execute,3000,"sendFeed",this,ConstFeed.a_1005,myGender);
               }
               this.RequestJoinConsortiaInfo();
               return;
            }
         }
      }
      
      public function onBeKickedNotify(data:Object) : void
      {
         this.mBridge.execute("onUpdateConsortiaMemberInfo",this,null);
         if(null == this.stTDConsortiaUI || null == this.stTDConsortiaUI.parent)
         {
            this.RequestJoinConsortiaInfo();
            return;
         }
      }
      
      public function onDismissConsortiaNotify() : void
      {
         if(null == this.stTDConsortiaUI || null == this.stTDConsortiaUI.parent)
         {
            this.RequestJoinConsortiaInfo();
            return;
         }
      }
      
      public function onUpgradeEstablistmentNotify(data:Object) : void
      {
         var consortiaInfo:Object = null;
         var objEvent:FriendSystemEvent = null;
         consortiaInfo = a_2161.e.a_2163();
         objEvent = new FriendSystemEvent(a_4514.a_707);
         objEvent.m_pExtraObject = {};
         objEvent.m_pExtraObject.iLevel = consortiaInfo.m_stConsortiaInfo.m_iLevel;
         objEvent.m_pExtraObject.iShopLevel = consortiaInfo.m_stConsortiaInfo.m_stEstablishment[EnmConsortia.a_379].m_iLevel;
         objEvent.m_pExtraObject.iSkillLevel = consortiaInfo.m_stConsortiaInfo.m_stEstablishment[EnmConsortia.a_381].m_iLevel;
         objEvent.m_pExtraObject.iComposeLevel = consortiaInfo.m_stConsortiaInfo.m_stEstablishment[EnmConsortia.a_380].m_iLevel;
         LobbyEventManager.Get().dispatchEvent(objEvent);
         if(EnmConsortia.a_380 == data.m_iEstablisment || EnmConsortia.a_379 == data.m_iEstablisment)
         {
            this.updateConsortiaEstablishmentPower();
         }
         this.stTDTipDialog.content = this.gsManager.getString(65652,[this.gsManager.getString(4293)]);
         this.stTDTipDialog.showTip(this,this.m_szTiShi,false,true,false,false,3000);
      }
      
      public function onRefreshEstablishmentNotify(data:Object) : void
      {
         this.updateConsortiaEstablishmentPower();
      }
      
      public function onOnlineStateChangedNotify(data:Object) : void
      {
         this.mBridge.execute("onUpdateConsortiaMemberInfo",this,null);
      }
      
      public function onEndowChangedNotify(data:Object) : void
      {
         this.updateConsortiaEstablishmentPower();
      }
      
      public function onJoinConsortiaRequestNotify(isNewRequest:Boolean) : void
      {
         var msg:String = null;
         if(this.stTDConsortiaUI != null)
         {
            if(this.stTDConsortiaUI.parent != null)
            {
               return;
            }
         }
         msg = this.gsManager.getString(65745);
         msg = IMUtil.sendMsgFormat({
            "tag":EnmGameIM.a_507,
            "msg":msg
         });
         this.mBridge.execute("onSystemMessageNotify",this,msg);
         this.mBridge.execute("showTownBtnTipAnimation",this,"mcUnionTip",true);
         this.notifyJoinRequestAbled = true;
      }
      
      public function OnUpdateGoingWeddingCount(iWeddingCnt:int) : void
      {
         var bIsHasWedding:Boolean = false;
         if(null != this.m_stTDMarriageRegistrationUI && null != this.m_stTDMarriageRegistrationUI.parent)
         {
            return;
         }
         if(null != this.m_stTDWeddingRoomUI && null != this.m_stTDWeddingRoomUI.parent)
         {
            return;
         }
         bIsHasWedding = iWeddingCnt > 0;
         this.mBridge.execute("showTownBtnTipAnimation",this,"m_stWeddingTipMc",bIsHasWedding);
      }
      
      public function setNotifyJoinRequestAbled(value:Boolean) : void
      {
         this.notifyJoinRequestAbled = value;
      }
      
      public function getNotifyJoinRequestAbled() : Boolean
      {
         return this.notifyJoinRequestAbled;
      }
      
      public function onMarginListData(pData:Object) : void
      {
         a_2157.e.OnMarginListData(pData);
      }
      
      public function onMarginRegisterFriend(pData:Object) : void
      {
         a_2157.e.OnMarginRegisterFriend(pData);
         if(this.stTDFeedUI)
         {
            setTimeout(this.mBridge.execute,3000,"sendFeed",this,ConstFeed.a_1002);
         }
      }
      
      public function onMarginReverseRegister(pData:Object) : void
      {
         a_2157.e.OnMarginReverseRegister(pData);
      }
      
      public function onMarginRegistAdvert(pData:Object) : void
      {
         a_2157.e.OnMarginRegistAdvert(pData);
         if(this.stTDFeedUI)
         {
            setTimeout(this.mBridge.execute,3000,"sendFeed",this,ConstFeed.a_1003);
         }
      }
      
      public function onMarginModifyAdvert(pData:Object) : void
      {
         a_2157.e.OnMarginModifyAdvert(pData);
      }
      
      public function onMarginStar(pData:Object) : void
      {
         a_2157.e.OnMarginStar(pData);
      }
      
      public function onMarginPlayerByUin(pData:Object) : void
      {
         a_2157.e.OnMarginPlayerByUin(pData);
      }
      
      public function onMarginSearch(pData:Object) : void
      {
         a_2157.e.OnMarginSearch(pData);
      }
      
      public function RequestMarginListData(pData:Object) : void
      {
         this.a_1206.RequestMarginListData(pData);
      }
      
      public function RequestMarginReverseRegister(pData:Object) : void
      {
         this.a_1206.RequestMarginListData(pData);
      }
      
      public function RequestMarginRegisterFriend(pData:Object) : void
      {
         this.a_1206.RequestMarginRegisterFriend(pData);
      }
      
      public function RequestMarginPlayerByUin(pData:Object) : void
      {
         this.a_1206.RequestMarginPlayerByUin(pData);
      }
      
      public function RequestMarginRegistAdvert(pData:Object) : void
      {
         this.a_1206.RequestMarginRegistAdvert(pData);
      }
      
      public function RequestMarginModifyAdvert(pData:Object) : void
      {
         this.a_1206.RequestMarginModifyAdvert(pData);
      }
      
      public function RequestMarginStar(pData:Object) : void
      {
         this.a_1206.RequestMarginStar(pData);
      }
      
      public function RequestMarginSearch(pData:Object) : void
      {
         this.a_1206.RequestMarginSearch(pData);
      }
      
      public function RequestChangeName(pData:Object) : void
      {
         this.a_1206.RequestChangeName(pData);
      }
      
      public function onChangeName(pData:Object) : void
      {
         a_2143.e.OnChangeName(pData);
      }
      
      public function ShowChangeName() : void
      {
         var nowTime:int = 0;
         var strMsg:String = null;
         if(Boolean(stage) && Boolean(stage.loaderInfo.parameters.sitetype == "4399") || Boolean(stage) && Boolean(stage.loaderInfo.parameters.sitetype == "joyyou"))
         {
            nowTime = a_1767.getInstance().SystemTime;
            if(nowTime >= AnalysisMeiShiMatchXml.GetInstance().m_SuspendStartTime && nowTime < AnalysisMeiShiMatchXml.GetInstance().m_SuspendEndTime)
            {
               strMsg = "功能维护中";
               MessageTipHandler.Get().a_3146(strMsg);
               return;
            }
         }
         this.showCilckedTarget(this.stTDChangeNameCardUI,"TDChangeNameCardUI",this.gsManager.getString(4411),this.a_4572);
      }
      
      public function ShowWarReward(islandID:int) : void
      {
         this.m_iIslandId = islandID;
         this.showCilckedTarget(this.stTDWarRewardUI,"TDWarRewardUI",this.gsManager.getString(4412),this.a_4573);
         if(null != this.stTDWarRewardUI)
         {
            a_2172.e.setData(this.m_iIslandId);
         }
      }
      
      public function RequestUseCardSlotPackage(data:Object) : void
      {
         this.a_1206.RequestUseCardSlotPackage(data);
      }
      
      public function RequestOpenCardSlotPackage(data:Object) : void
      {
         this.a_1206.RequestOpenCardSlotPackage(data);
      }
      
      public function a_2416(data:Object) : void
      {
         a_2160.e.OnNotifyUseCardSlotPackage(data);
      }
      
      public function a_2417(data:Object) : void
      {
         a_2160.e.OnNotifyOpenCardSlotPackage(data);
      }
      
      public function a_2601(data:Object) : void
      {
         a_2171.e.OnResponseSendVow(data);
      }
      
      public function a_2602(data:Object) : void
      {
         a_2171.e.OnResponseGetVowNews(data);
      }
      
      public function RequestSendVow(data:Object) : void
      {
         this.a_1206.RequestSendVow(data);
      }
      
      public function RequestGetVowNews(data:Object) : void
      {
         this.a_1206.RequestGetVowNews(data);
      }
      
      public function onCreateRolePost(back_obj:Object) : void
      {
      }
      
      public function onCreateRoleSuccess() : void
      {
         var enterRoom:Object = null;
         var role:Object = null;
         var params:Object = null;
         if(stage != null && (stage.loaderInfo.parameters.sitetype == "3366" || stage.loaderInfo.parameters.sitetype == "qq"))
         {
            enterRoom = a_2161.e.getEnterRoom();
            role = a_2161.e.GetCurrentRole();
            params = new Object();
            params.URLType = 18;
            params.src_uin = role.m_iRoleUin;
            params.src_account = role.m_szRoleName;
            params.openid = enterRoom.m_szOpenId;
            params.openkey = enterRoom.m_szOpenKey;
            params.sitetype = stage.loaderInfo.parameters.sitetype;
            params.type = 2;
            a_3191.getInstance().sendRequest(this,params,this.onCreateRolePost);
         }
         if(stage != null && stage.loaderInfo.parameters.sitetype == "qqgame")
         {
            role = a_2161.e.GetCurrentRole();
            ExternalInterface.call("QQGameJs","http://tencentlog.com/stat/report_register.php?appid=13057&domain=10&opuid=" + int(role.m_iRoleUin).toString() + "&opopenid=" + stage.loaderInfo.parameters.sig_user);
         }
      }
      
      public function showTipUnOpen(name:String, isPopUp:Boolean = true) : Boolean
      {
         var arrModeOpen:Array = null;
         var strName:String = null;
         var iOpen:int = 0;
         var obj:Object = null;
         var i:int = 0;
         arrModeOpen = AnalyzeModeOpen.GetInstance().getArrModeOpen();
         if(null != arrModeOpen)
         {
            strName = "";
            for(i = 0; i < arrModeOpen.length; i++)
            {
               obj = arrModeOpen[i];
               if(obj)
               {
                  strName = obj.strName;
                  if(strName == name)
                  {
                     iOpen = int(obj.iOpen);
                     if(1 != iOpen)
                     {
                        if(isPopUp)
                        {
                           this.a_3744(this.gsManager.getString(24738),this.m_szTiShi,false,true,false,false,2000);
                        }
                        return true;
                     }
                  }
               }
            }
         }
         return false;
      }
      
      public function RequestBuyMiShiUseNum(iInstanceType:int) : Boolean
      {
         return this.a_1206.RequestBuyMiShiUseNum(iInstanceType);
      }
      
      public function onLobbyGuide(guideData:String) : void
      {
         var role:a_4463 = null;
         var isOldUser:Boolean = false;
         var userType:Array = null;
         var dict:Dictionary = null;
         var menuOpenData:Array = null;
         var item:Object = null;
         var guide_id:int = 0;
         var str:String = null;
         var tmpArr:Array = null;
         var i:int = 0;
         var menuOpenArr:Array = null;
         var islandOpenArr:Array = null;
         var storyGuideArr:Array = null;
         var levelObj:Object = null;
         var menuPos:int = 0;
         var openLevel:int = 0;
         var level:Object = null;
         var pos:int = 0;
         var value:String = null;
         role = a_2161.e.GetCurrentRole() as a_4463;
         if(role == null)
         {
            return;
         }
         if(this.m_oGuideData != null)
         {
            return;
         }
         if(guideData == null)
         {
            guideData = "";
         }
         this.m_oGuideData = {};
         this.m_oGuideData.guideData = [];
         this.m_oGuideData.guideData[0] = [];
         this.m_oGuideData.guideData[1] = [];
         this.m_oGuideData.guideData[2] = [];
         this.m_oGuideData.guideData[3] = [];
         this.m_oGuideData.guideData[4] = [];
         this.m_oGuideData.guideData[5] = [];
         this.m_oGuideData.guideData[6] = [];
         this.m_oGuideData.guideData[7] = [];
         if(guideData != "")
         {
            str = guideData;
            tmpArr = str.split(",");
            this.m_oGuideData.guideData[0] = tmpArr[0];
            for(i = 1; i < tmpArr.length; i++)
            {
               this.m_oGuideData.guideData[i] = (tmpArr[i] as String).split("|");
            }
         }
         isOldUser = true;
         if(role.m_iGamePoint == 0)
         {
            isOldUser = false;
         }
         userType = this.m_oGuideData.guideData[3];
         if(userType == null)
         {
            userType = [];
            this.m_oGuideData.guideData[3] = userType;
         }
         if(isOldUser)
         {
            if(userType[0] == null || userType[0] == "")
            {
               menuOpenArr = [];
               islandOpenArr = [];
               storyGuideArr = [];
               storyGuideArr[0] = 511;
               userType[0] = 0;
               levelObj = a_2033.getInstance().getGameLevel(role.m_iGamePoint);
               islandOpenArr = this.setIslandOpen(levelObj.iLevel);
               menuOpenArr = this.setAllMenuOpen();
               this.m_oGuideData.guideData[1] = storyGuideArr;
               this.m_oGuideData.guideData[2] = islandOpenArr;
               this.m_oGuideData.guideData[5] = menuOpenArr;
               this.LobbyRequestChangeGroupData(5,menuOpenArr);
               this.LobbyRequestChangeGroupData(2,islandOpenArr);
               this.LobbyRequestChangeGuideData(3,0,"0");
               this.LobbyRequestChangeGuideData(1,0,String(511));
            }
         }
         else
         {
            userType[0] = 1;
            this.LobbyRequestChangeGuideData(3,0,"1");
         }
         dict = NewGuideConfig.Instance.getModelOpenConfig();
         menuOpenData = this.m_oGuideData.guideData[5];
         for each(item in dict)
         {
            menuPos = int(item.animation.@id) - 1;
            if(int(item.animation.@open_task) == 0 && (menuOpenData[menuPos] == null || menuOpenData[menuPos] != 1))
            {
               menuOpenData[menuPos] = 1;
               this.LobbyRequestChangeGuideData(5,menuPos,"1");
            }
            openLevel = int(item.animation.@open_level);
            level = a_2033.getInstance().getGameLevel(role.m_iGamePoint);
            if(openLevel != -1 && (menuOpenData[menuPos] == null || menuOpenData[menuPos] != 1) && level.iLevel >= openLevel)
            {
               menuOpenData[menuPos] = 1;
               this.LobbyRequestChangeGuideData(5,menuPos,"1");
            }
            if(openLevel != -1 && level.iLevel < openLevel)
            {
               menuOpenData[menuPos] = 0;
               this.LobbyRequestChangeGuideData(5,menuPos,"0");
            }
            if(openLevel == -1 && level.iLevel >= 16)
            {
               menuOpenData[menuPos] = 1;
               this.LobbyRequestChangeGuideData(5,menuPos,"1");
            }
         }
         this.updateOpenMenu();
         guide_id = this.hasStoryGuide();
         if((guide_id & 0xFF) != 255)
         {
            switch(guide_id & 0x0F00)
            {
               case 256:
                  this.m_newGuide = true;
                  MeishiGuide.Instance.showStoryGuide(guide_id);
                  pos = (guide_id >> 8) - 1;
                  value = String(guide_id | 0xFF);
                  this.LobbyRequestChangeGuideData(1,pos,value);
            }
         }
         if(!this.m_newGuide)
         {
            a_2159.e.onPlayLobbyBgSound();
         }
         if(this.stTDTownUI != null)
         {
            this.stTDTownUI.addEventListener(LoginEvent.MS_TODAY_LOGIN,this.onResponseTodayLogin);
         }
      }
      
      private function openOldVersionGuide(isOldPlayer:Boolean) : void
      {
         var role:a_4463 = null;
         var userType:Array = null;
         var menuOpenArr:Array = null;
         var islandOpenArr:Array = null;
         var levelObj:Object = null;
         role = a_2161.e.GetCurrentRole() as a_4463;
         userType = this.m_oGuideData.guideData[3];
         if(userType == null)
         {
            userType = [];
            this.m_oGuideData.guideData[3] = userType;
         }
         if(!isOldPlayer)
         {
            menuOpenArr = [];
            islandOpenArr = [];
            userType[0] = 0;
            levelObj = a_2033.getInstance().getGameLevel(role.m_iGamePoint);
            islandOpenArr = this.setIslandOpen(levelObj.iLevel);
            menuOpenArr = this.setAllMenuOpen();
            this.m_oGuideData.guideData[2] = islandOpenArr;
            this.m_oGuideData.guideData[5] = menuOpenArr;
            this.LobbyRequestChangeGroupData(5,menuOpenArr);
            this.LobbyRequestChangeGroupData(2,islandOpenArr);
         }
      }
      
      private function setIslandOpen(level:int) : Array
      {
         var dict:Dictionary = null;
         var arr:Array = null;
         var islandItem:XML = null;
         dict = NewGuideConfig.Instance.getIslandTap();
         arr = [];
         for each(islandItem in dict)
         {
            if(islandItem != null)
            {
               if(int(islandItem.@level) <= level)
               {
                  arr[int(islandItem.@id)] = 1;
               }
            }
         }
         return arr;
      }
      
      private function setAllMenuOpen() : Array
      {
         var dict:Dictionary = null;
         var arr:Array = null;
         var id:String = null;
         dict = NewGuideConfig.Instance.getModelOpenConfig();
         arr = [];
         for(id in dict)
         {
            arr[int(id)] = 1;
         }
         return arr;
      }
      
      public function LobbyRequestChangeGroupData(group:int, arr:Array) : Boolean
      {
         var newGuideData:Object = null;
         var changeData:Array = null;
         var i:int = 0;
         var str:String = null;
         var isSuccess:Boolean = false;
         newGuideData = a_2161.e.GetGuideData();
         changeData = newGuideData.guideData[group];
         for(i = 0; i < arr.length; i++)
         {
            if(int(arr[i]) == 1)
            {
               changeData[i] = arr[i];
            }
         }
         str = "";
         newGuideData.m_szExtData = "";
         for(i = 1; i < newGuideData.guideData.length - 1; i++)
         {
            str += (newGuideData.guideData[i] as Array).join("|") + ",";
         }
         str += (newGuideData.guideData[i] as Array).join("|");
         return this.RequestChangeGuideData(str);
      }
      
      public function LobbyRequestChangeGuideData(group:int, position:int, value:String) : Boolean
      {
         var newGuideData:Object = null;
         var changeData:Array = null;
         var i:int = 0;
         var str:String = null;
         var isSuccess:Boolean = false;
         newGuideData = a_2161.e.GetGuideData();
         changeData = newGuideData.guideData[group];
         changeData[position] = value;
         for(i = 0; i < position; i++)
         {
            if(changeData[i] == null)
            {
               changeData[i] = 0;
            }
         }
         str = "";
         newGuideData.m_szExtData = "";
         for(i = 1; i < newGuideData.guideData.length - 1; i++)
         {
            str += (newGuideData.guideData[i] as Array).join("|") + ",";
         }
         str += (newGuideData.guideData[i] as Array).join("|");
         return this.RequestChangeGuideData(str);
      }
      
      public function RequestChangeGuideData(guideData:String) : Boolean
      {
         return this.a_1206.RequestChangeGuideData(guideData);
      }
      
      private function hasStoryGuide() : int
      {
         var storyGuideData:Array = null;
         var i:int = 0;
         var guide_id:int = 0;
         if(this.m_oGuideData == null)
         {
            return 4095;
         }
         storyGuideData = this.m_oGuideData.guideData[1];
         if(storyGuideData == null || storyGuideData.length == 0)
         {
            return 256;
         }
         for(i = 0; i < 7; i++)
         {
            if(storyGuideData[i] == null || int(storyGuideData[i]) == 0)
            {
               return int("0x" + (i + 1).toString(16) + "00");
            }
            guide_id = int(storyGuideData[i]);
            if((guide_id & 0xFF) != 255)
            {
               return guide_id;
            }
         }
         return 4095;
      }
      
      public function updateOpenMenu() : void
      {
         var menuArr:Array = null;
         if(this.m_oGuideData == null)
         {
            return;
         }
         menuArr = this.m_oGuideData.guideData[5];
         if(this.stTDMenuUI != null && !this.menuOpenCondition["meishi"] && !this.menuOpenCondition["huoshan"] && !this.menuOpenCondition["skycastle"] && !this.menuOpenCondition["seafloorWhirlpool"] && !this.menuOpenCondition["town"])
         {
            IMenuOpen(this.stTDMenuUI).setOpenMenu(menuArr);
         }
         if(this.stTDRightMenuUI != null && !this.menuOpenCondition["meishi"] && !this.menuOpenCondition["huoshan"] && !this.menuOpenCondition["skycastle"] && !this.menuOpenCondition["seafloorWhirlpool"] && !this.menuOpenCondition["town"])
         {
            IMenuOpen(this.stTDRightMenuUI).setOpenMenu(menuArr);
         }
         if(this.stTDMeiShiUI != null && !this.menuOpenCondition["meishi"])
         {
            IMenuOpen(this.stTDMeiShiUI).setOpenMenu(menuArr);
         }
         if(this.stTDHuoShanUI != null && !this.menuOpenCondition["huoshan"])
         {
            IMenuOpen(this.stTDHuoShanUI).setOpenMenu(menuArr);
         }
         if(this.stTDSkyCastleUI != null && !this.menuOpenCondition["skycastle"])
         {
            IMenuOpen(this.stTDSkyCastleUI).setOpenMenu(menuArr);
         }
         if(this.stTDSeafloorWhirlpoolUI != null && !this.menuOpenCondition["seafloorWhirlpool"])
         {
            IMenuOpen(this.stTDSeafloorWhirlpoolUI).setOpenMenu(menuArr);
         }
         if(this.stTDWonderlandUI != null && !this.menuOpenCondition["shuQiDesert"])
         {
            IMenuOpen(this.stTDWonderlandUI).setOpenMenu(menuArr);
         }
         if(this.stTDExploreCampLandUI != null && !this.menuOpenCondition["ExploreLand"])
         {
            IMenuOpen(this.stTDExploreCampLandUI).setOpenMenu(menuArr);
         }
         if(this.stTDSnowDesertLandUI != null && !this.menuOpenCondition["SnowLand"])
         {
            IMenuOpen(this.stTDSnowDesertLandUI).setOpenMenu(menuArr);
         }
         if(this.stTDDesertLandUI != null && !this.menuOpenCondition["DesertLand"])
         {
            IMenuOpen(this.stTDDesertLandUI).setOpenMenu(menuArr);
         }
         if(this.stTDOuterSpaceTavelLandUI != null && !this.menuOpenCondition["OuterSpaceTavelLand"])
         {
            IMenuOpen(this.stTDOuterSpaceTavelLandUI).setOpenMenu(menuArr);
         }
         if(this.stTDEarthcoreExpeditionLandUI != null && !this.menuOpenCondition["EarthcoreExpeditionLand"])
         {
            IMenuOpen(this.stTDEarthcoreExpeditionLandUI).setOpenMenu(menuArr);
         }
         if(this.stTDRoomUserUI != null && !this.menuOpenCondition["meishi"] && !this.menuOpenCondition["huoshan"] && !this.menuOpenCondition["skycastle"] && !this.menuOpenCondition["shuQiDesert"] && !this.menuOpenCondition["ExploreLand"] && !this.menuOpenCondition["SnowLand"] && !this.menuOpenCondition["DesertLand"] && !this.menuOpenCondition["seafloorWhirlpool"])
         {
            IMenuOpen(this.stTDRoomUserUI).setOpenMenu(menuArr);
         }
         if(this.stTDTownUI != null && !this.menuOpenCondition["town"])
         {
            IMenuOpen(this.stTDTownUI).setOpenMenu(menuArr);
         }
         if(this.stTDComposeUI != null)
         {
            IMenuOpen(this.stTDComposeUI).setOpenMenu(menuArr);
         }
         if(this.stTDPackageUI != null)
         {
            IMenuOpen(this.stTDPackageUI).setOpenMenu(menuArr);
         }
         if(this.stTDTurnToUI != null)
         {
            IMenuOpen(this.stTDTurnToUI).setOpenMenu(menuArr);
         }
      }
      
      private function GuideAnimationHandler(task_id:int) : void
      {
         if(this.animationQuence == null)
         {
            this.animationQuence = [];
         }
         this.showLevelAwardDialog();
         this.newCardAnimationHandler(task_id);
         this.menuOpenAnimationHandler(task_id);
         this.storyGuideAnimationHandler();
      }
      
      private function storyGuideAnimationHandler() : void
      {
         var taskData:Vector.<a_4517> = null;
         var storyDict:Dictionary = null;
         var foundStoryArr:Array = null;
         var taskItem:a_4517 = null;
         var storyItem:Object = null;
         var guideStory:Object = null;
         var storyData:Array = null;
         var pos:int = 0;
         if(this.isPlaying)
         {
            return;
         }
         if(this.m_oGuideData == null)
         {
            return;
         }
         taskData = a_2161.e.GetTasks() as Vector.<a_4517>;
         storyDict = NewGuideConfig.Instance.getStoryGuideConfig(this.hasStoryGuide());
         foundStoryArr = [];
         for each(taskItem in taskData)
         {
            for each(storyItem in storyDict)
            {
               if(taskItem.m_iTaskStatus == a_1756.enm_TaskCompleteStatus && int(storyItem.animation.@task_id) != 0 && int(storyItem.animation.@task_id) == taskItem.m_iTaskID)
               {
                  foundStoryArr.push(storyItem);
                  break;
               }
            }
         }
         while(foundStoryArr.length > 0)
         {
            guideStory = foundStoryArr.shift();
            storyData = this.m_oGuideData.guideData[1];
            pos = (int(guideStory.animation.@id) >> 8) - 1;
            if((int(storyData[pos]) & 0xFF) != 255)
            {
               this.isStoryGuide = true;
               storyData[pos] = int(guideStory.animation.@id);
               guideStory.animation.@guide_id = int(guideStory.animation.@id);
               this.LobbyRequestChangeGuideData(1,pos,String(storyData[pos] | 0xFF));
               MeishiGuide.Instance.pushAnimationToQuene({
                  "func":"showStoryGuide",
                  "params":[int(guideStory.animation.@id)]
               });
            }
         }
      }
      
      private function menuOpenAnimationHandler(task_id:int) : void
      {
         var menuOpenData:Array = null;
         var dict:Dictionary = null;
         var item:Object = null;
         var pos:int = 0;
         if(this.m_oGuideData == null)
         {
            return;
         }
         menuOpenData = this.m_oGuideData.guideData[5];
         if(menuOpenData == null)
         {
            menuOpenData = [];
            this.m_oGuideData.guideData[5] = menuOpenData;
         }
         dict = NewGuideConfig.Instance.getModelOpenConfig();
         for each(item in dict)
         {
            pos = int(item.animation.@id) - 1;
            if(int(item.animation.@open_task) == task_id && (menuOpenData[pos] == null || menuOpenData[pos] != 1))
            {
               if(this.stTDTaskUI != null && this.stTDTaskUI.parent != null)
               {
                  removeChild(this.stTDTaskUI);
               }
               menuOpenData[pos] = 1;
               this.LobbyRequestChangeGuideData(5,pos,"1");
               MeishiGuide.Instance.pushAnimationToQuene({
                  "func":"showMenuOpenAnimation",
                  "params":[pos + 1]
               });
               break;
            }
         }
      }
      
      private function newCardAnimationHandler(task_id:int) : void
      {
         var dict:Dictionary = null;
         var item:Object = null;
         dict = NewGuideConfig.Instance.getNewCardConfig();
         for each(item in dict)
         {
            if(item != null)
            {
               if(task_id == item.task_id)
               {
                  if(this.stTDTaskUI != null && this.stTDTaskUI.parent != null)
                  {
                     removeChild(this.stTDTaskUI);
                  }
                  MeishiGuide.Instance.pushAnimationToQuene({
                     "func":"showNewCardAnimationByID",
                     "params":[item.id]
                  });
               }
            }
         }
      }
      
      public function showModelGuideAnimation(model_name:String) : void
      {
         var modelOpenData:Array = null;
         var dict:Dictionary = null;
         var id:String = null;
         var animationGuideArr:Array = null;
         var taskDataArr:Vector.<a_4517> = null;
         var taskDataItem:a_4517 = null;
         var guideItem:Object = null;
         var pos:int = 0;
         var i:int = 0;
         var item:Object = null;
         if(this.m_oGuideData == null)
         {
            return;
         }
         modelOpenData = this.m_oGuideData.guideData[4];
         if(modelOpenData == null)
         {
            modelOpenData = [];
            this.m_oGuideData.guideData[4] = modelOpenData;
         }
         dict = NewGuideConfig.Instance.getAnimationConfig();
         for(id in dict)
         {
            pos = int(id) - 1;
            if(modelOpenData[pos] != null && modelOpenData[pos] == 1)
            {
               delete dict[id];
            }
         }
         animationGuideArr = [];
         taskDataArr = a_2161.e.GetTasks() as Vector.<a_4517>;
         for each(guideItem in dict)
         {
            if(guideItem.name == model_name)
            {
               for(i = 0; i < taskDataArr.length; i++)
               {
                  taskDataItem = taskDataArr[i];
                  if(taskDataItem.m_iTaskID == guideItem.taskID && (taskDataItem.m_iTaskStatus == a_1756.enm_TaskOpenedStatus || taskDataItem.m_iTaskStatus == a_1756.enm_TaskUnderwayStatus))
                  {
                     animationGuideArr.push(guideItem);
                  }
               }
            }
         }
         animationGuideArr.sortOn(["id"],Array.NUMERIC);
         while(animationGuideArr.length > 0)
         {
            item = animationGuideArr.shift();
            if(int(item.animation.@record) == 1)
            {
               modelOpenData[int(item.id) - 1] = 1;
               this.LobbyRequestChangeGuideData(4,int(item.id) - 1,"1");
            }
            MeishiGuide.Instance.pushAnimationToQuene({
               "func":"showGuideAnimation",
               "params":[item.id]
            });
         }
      }
      
      public function GetDefCardIDShineBaseCardDefID(iDefCardID:int) : int
      {
         var iShineDefCardID:int = 0;
         var key:String = null;
         var upgradeIDHex:Array = null;
         var i:int = 0;
         if(null == this.m_dictZhuanZhiID)
         {
            this.m_dictZhuanZhiID = new Dictionary();
            this.m_dictZhuanZhiID[286326814] = 286326804;
            this.m_dictZhuanZhiID[286326815] = 286326804;
            this.m_dictZhuanZhiID[286330926] = 286330916;
            this.m_dictZhuanZhiID[286330927] = 286330916;
            this.m_dictZhuanZhiID[286392350] = 286392336;
            this.m_dictZhuanZhiID[286392351] = 286392336;
            this.m_dictZhuanZhiID[286457934] = 289603632;
            this.m_dictZhuanZhiID[286457950] = 294846544;
            this.m_dictZhuanZhiID[286457951] = 289603632;
            this.m_dictZhuanZhiID[286457966] = 286457952;
            this.m_dictZhuanZhiID[286457967] = 286457952;
            this.m_dictZhuanZhiID[286457983] = 294846544;
            this.m_dictZhuanZhiID[286458014] = 286458000;
            this.m_dictZhuanZhiID[286458015] = 286458000;
            this.m_dictZhuanZhiID[286458190] = 286458176;
            this.m_dictZhuanZhiID[286458191] = 286458176;
            this.m_dictZhuanZhiID[286458206] = 286458192;
            this.m_dictZhuanZhiID[286458207] = 286458192;
            this.m_dictZhuanZhiID[286458398] = 286458384;
            this.m_dictZhuanZhiID[286458399] = 286458384;
            this.m_dictZhuanZhiID[286523438] = 286523424;
            this.m_dictZhuanZhiID[286588958] = 286588948;
            this.m_dictZhuanZhiID[286588959] = 286588948;
            this.m_dictZhuanZhiID[286588990] = 286588980;
            this.m_dictZhuanZhiID[286588991] = 286588980;
            this.m_dictZhuanZhiID[286855534] = 286855520;
            this.m_dictZhuanZhiID[288948702] = 288948688;
            this.m_dictZhuanZhiID[288948703] = 288948688;
            this.m_dictZhuanZhiID[294846494] = 294846480;
            this.m_dictZhuanZhiID[294846495] = 294846480;
            this.m_dictZhuanZhiID[294846510] = 294846496;
            this.m_dictZhuanZhiID[294846511] = 294846496;
            this.m_dictZhuanZhiID[294846542] = 294846528;
            this.m_dictZhuanZhiID[294846543] = 294846528;
            this.m_dictZhuanZhiID[294846622] = 294846608;
            this.m_dictZhuanZhiID[294846623] = 294846608;
            this.m_dictZhuanZhiID[294850670] = 294850656;
            this.m_dictZhuanZhiID[294850671] = 294850656;
            this.m_dictZhuanZhiID[286392462] = 286392448;
            this.m_dictZhuanZhiID[286392463] = 286392448;
            this.m_dictZhuanZhiID[286458286] = 286458272;
            this.m_dictZhuanZhiID[286458287] = 286458272;
            this.m_dictZhuanZhiID[288817214] = 288817204;
            this.m_dictZhuanZhiID[286523454] = 286523444;
            this.m_dictZhuanZhiID[288949262] = 288949248;
            this.m_dictZhuanZhiID[288949263] = 288949248;
            this.m_dictZhuanZhiID[286392478] = 286392464;
            this.m_dictZhuanZhiID[286392479] = 286392464;
            this.m_dictZhuanZhiID[286392590] = 286392576;
            this.m_dictZhuanZhiID[286392591] = 286392576;
            this.m_dictZhuanZhiID[286392606] = 286392592;
            this.m_dictZhuanZhiID[286392607] = 286392592;
            this.m_dictZhuanZhiID[286392622] = 286392608;
            this.m_dictZhuanZhiID[286392623] = 286392608;
            this.m_dictZhuanZhiID[286392638] = 286392624;
            this.m_dictZhuanZhiID[286392639] = 286392624;
            this.m_dictZhuanZhiID[286392654] = 286392640;
            this.m_dictZhuanZhiID[286392655] = 286392640;
            this.m_dictZhuanZhiID[288949518] = 288949504;
            this.m_dictZhuanZhiID[288949519] = 288949504;
            this.m_dictZhuanZhiID[286392686] = 286392672;
            this.m_dictZhuanZhiID[286392623] = 286392672;
            this.m_dictZhuanZhiID[286392670] = 286392656;
            this.m_dictZhuanZhiID[286392671] = 286392656;
            this.m_dictZhuanZhiID[286462126] = 286462112;
            this.m_dictZhuanZhiID[286462127] = 286462112;
            this.m_dictZhuanZhiID[286458542] = 286458528;
            this.m_dictZhuanZhiID[286458543] = 286458528;
            this.m_dictZhuanZhiID[286393166] = 286393152;
            this.m_dictZhuanZhiID[286393167] = 286393152;
            this.m_dictZhuanZhiID[286462286] = 286462272;
            this.m_dictZhuanZhiID[286462287] = 286462272;
            this.m_dictZhuanZhiID[286458254] = 286458240;
            this.m_dictZhuanZhiID[286458255] = 286458240;
            this.m_dictZhuanZhiID[286396478] = 286396464;
            this.m_dictZhuanZhiID[286396479] = 286396464;
            this.m_dictZhuanZhiID[286466574] = 286466560;
            this.m_dictZhuanZhiID[286466575] = 286466560;
            this.m_dictZhuanZhiID[286466382] = 286466368;
            this.m_dictZhuanZhiID[286466383] = 286466368;
            this.m_dictZhuanZhiID[286462382] = 286462368;
            this.m_dictZhuanZhiID[286462383] = 286462368;
            this.m_dictZhuanZhiID[286851678] = 286851668;
            this.m_dictZhuanZhiID[286851679] = 286851668;
            this.m_dictZhuanZhiID[286396494] = 286396480;
            this.m_dictZhuanZhiID[286396495] = 286396480;
            this.m_dictZhuanZhiID[286392718] = 286392704;
            this.m_dictZhuanZhiID[286392719] = 286392704;
            this.m_dictZhuanZhiID[286392734] = 286392720;
            this.m_dictZhuanZhiID[286392735] = 286392720;
            this.m_dictZhuanZhiID[286392846] = 286392832;
            this.m_dictZhuanZhiID[286392847] = 286392832;
            this.m_dictZhuanZhiID[286458686] = 286458672;
            this.m_dictZhuanZhiID[286458687] = 286458672;
            this.m_dictZhuanZhiID[286392862] = 286392848;
            this.m_dictZhuanZhiID[286392863] = 286392848;
            this.m_dictZhuanZhiID[287506478] = 287506468;
            this.m_dictZhuanZhiID[287506479] = 287506468;
            this.m_dictZhuanZhiID[286459086] = 286459072;
            this.m_dictZhuanZhiID[286459087] = 286459072;
            this.m_dictZhuanZhiID[286459118] = 286459104;
            this.m_dictZhuanZhiID[286459119] = 286459104;
            this.m_dictZhuanZhiID[286392942] = 286392928;
            this.m_dictZhuanZhiID[286392943] = 286392928;
            this.m_dictZhuanZhiID[286523934] = 286523920;
            this.m_dictZhuanZhiID[286396526] = 286396512;
            this.m_dictZhuanZhiID[286392926] = 286392912;
            this.m_dictZhuanZhiID[286392927] = 286392912;
            this.m_dictZhuanZhiID[288817246] = 288817232;
            this.m_dictZhuanZhiID[288817247] = 288817232;
            this.m_dictZhuanZhiID[286458558] = 286458544;
            this.m_dictZhuanZhiID[286458559] = 286458544;
            this.m_dictZhuanZhiID[286392990] = 286392976;
            this.m_dictZhuanZhiID[286392991] = 286392976;
            this.m_dictZhuanZhiID[286392974] = 286392960;
            this.m_dictZhuanZhiID[286462478] = 286462464;
            this.m_dictZhuanZhiID[286462479] = 286462464;
            this.m_dictZhuanZhiID[286393438] = 286393424;
            this.m_dictZhuanZhiID[286393454] = 286393440;
            this.m_dictZhuanZhiID[286393455] = 286393440;
            this.m_dictZhuanZhiID[286393470] = 286393456;
            this.m_dictZhuanZhiID[286393471] = 286393456;
            this.m_dictZhuanZhiID[288817262] = 288817248;
            this.m_dictZhuanZhiID[286393486] = 286393472;
            this.m_dictZhuanZhiID[286393487] = 286393472;
            this.m_dictZhuanZhiID[286393502] = 286393488;
            this.m_dictZhuanZhiID[286393503] = 286393488;
            this.m_dictZhuanZhiID[286393614] = 286393600;
            this.m_dictZhuanZhiID[286393615] = 286393600;
            this.m_dictZhuanZhiID[286393646] = 286393632;
            this.m_dictZhuanZhiID[286393647] = 286393632;
            this.m_dictZhuanZhiID[286393678] = 286393664;
            this.m_dictZhuanZhiID[286393679] = 286393664;
            this.m_dictZhuanZhiID[286393694] = 286393680;
            this.m_dictZhuanZhiID[286393695] = 286393680;
            this.m_dictZhuanZhiID[286393710] = 286393696;
            this.m_dictZhuanZhiID[286393711] = 286393696;
            this.m_dictZhuanZhiID[286393726] = 286393712;
            this.m_dictZhuanZhiID[286393727] = 286393712;
            this.m_dictZhuanZhiID[286393742] = 286393728;
            this.m_dictZhuanZhiID[286393743] = 286393728;
            this.m_dictZhuanZhiID[286393758] = 286393744;
            this.m_dictZhuanZhiID[286393759] = 286393744;
            this.m_dictZhuanZhiID[286393886] = 286393872;
            this.m_dictZhuanZhiID[286393887] = 286393872;
            this.m_dictZhuanZhiID[286393902] = 286393888;
            this.m_dictZhuanZhiID[286393903] = 286393888;
            this.m_dictZhuanZhiID[286393931] = 286393930;
            this.m_dictZhuanZhiID[286393932] = 286393930;
            this.m_dictZhuanZhiID[286393933] = 286393930;
            this.m_dictZhuanZhiID[286393947] = 286393946;
            this.m_dictZhuanZhiID[286393948] = 286393946;
            this.m_dictZhuanZhiID[286393949] = 286393946;
            this.m_dictZhuanZhiID[286393966] = 286393952;
            this.m_dictZhuanZhiID[286393967] = 286393952;
            this.m_dictZhuanZhiID[286393982] = 286393968;
            this.m_dictZhuanZhiID[286393983] = 286393968;
            this.m_dictZhuanZhiID[286393998] = 286393984;
            this.m_dictZhuanZhiID[286394126] = 286394112;
            this.m_dictZhuanZhiID[286394127] = 286394112;
            this.m_dictZhuanZhiID[286394158] = 286394144;
            this.m_dictZhuanZhiID[286394159] = 286394144;
            this.m_dictZhuanZhiID[286394190] = 286394176;
            this.m_dictZhuanZhiID[286394191] = 286394176;
            this.m_dictZhuanZhiID[287637534] = 287637520;
            this.m_dictZhuanZhiID[287637535] = 287637520;
            this.m_dictZhuanZhiID[286394254] = 286394240;
            this.m_dictZhuanZhiID[286394255] = 286394240;
            this.m_dictZhuanZhiID[286462318] = 286462304;
            this.m_dictZhuanZhiID[286462319] = 286462304;
            this.m_dictZhuanZhiID[286462475] = 286462474;
            this.m_dictZhuanZhiID[286462476] = 286462474;
            this.m_dictZhuanZhiID[286462477] = 286462474;
            this.m_dictZhuanZhiID[286392619] = 286392618;
            this.m_dictZhuanZhiID[286392620] = 286392618;
            this.m_dictZhuanZhiID[286392621] = 286392618;
            this.m_dictZhuanZhiID[291700766] = 291700752;
            this.m_dictZhuanZhiID[291700767] = 291700752;
            this.m_dictZhuanZhiID[291701006] = 291700992;
            this.m_dictZhuanZhiID[291701007] = 291700992;
            this.m_dictZhuanZhiID[286458078] = 286457956;
            this.m_dictZhuanZhiID[286458079] = 286457956;
            this.m_dictZhuanZhiID[286458094] = 286458084;
            this.m_dictZhuanZhiID[286458095] = 286458084;
            this.m_dictZhuanZhiID[294846590] = 294846580;
            this.m_dictZhuanZhiID[294846591] = 294846580;
            this.m_dictZhuanZhiID[286326884] = 286326868;
            this.m_dictZhuanZhiID[286326879] = 286326868;
            this.m_dictZhuanZhiID[286458062] = 286458020;
            this.m_dictZhuanZhiID[286457982] = 286457972;
            this.m_dictZhuanZhiID[286457871] = 286457972;
            this.m_dictZhuanZhiID[286458068] = 286458052;
            this.m_dictZhuanZhiID[286458063] = 286458052;
            this.m_dictZhuanZhiID[286458270] = 286458256;
            this.m_dictZhuanZhiID[286458271] = 286458256;
            this.m_dictZhuanZhiID[286392382] = 286392372;
            this.m_dictZhuanZhiID[286392383] = 286392372;
            this.m_dictZhuanZhiID[286392366] = 286392352;
            this.m_dictZhuanZhiID[286392367] = 286392352;
            this.m_dictZhuanZhiID[286458110] = 286458064;
            this.m_dictZhuanZhiID[286458111] = 286458064;
            this.m_dictZhuanZhiID[286396446] = 286396432;
            this.m_dictZhuanZhiID[286396447] = 286396432;
            this.m_dictZhuanZhiID[294846574] = 294846560;
            this.m_dictZhuanZhiID[294846575] = 294846560;
            this.m_dictZhuanZhiID[286851422] = 286851412;
            this.m_dictZhuanZhiID[286851423] = 286851412;
            this.m_dictZhuanZhiID[286392446] = 286392436;
            this.m_dictZhuanZhiID[286392447] = 286392436;
            this.m_dictZhuanZhiID[287572014] = 287571988;
            this.m_dictZhuanZhiID[287572015] = 287571988;
            this.m_dictZhuanZhiID[286458494] = 286458480;
            this.m_dictZhuanZhiID[286458495] = 286458480;
            this.m_dictZhuanZhiID[286458750] = 286458736;
            this.m_dictZhuanZhiID[286458751] = 286458736;
            this.m_dictZhuanZhiID[286458510] = 286458496;
            this.m_dictZhuanZhiID[286458511] = 286458496;
            this.m_dictZhuanZhiID[286458542] = 286458532;
            this.m_dictZhuanZhiID[286458543] = 286458532;
            this.m_dictZhuanZhiID[288817230] = 288817220;
            this.m_dictZhuanZhiID[288817231] = 288817220;
            this.m_dictZhuanZhiID[286458446] = 286458432;
            this.m_dictZhuanZhiID[286458447] = 286458432;
            this.m_dictZhuanZhiID[286458462] = 286458448;
            this.m_dictZhuanZhiID[286458463] = 286458448;
            this.m_dictZhuanZhiID[286458478] = 286458464;
            this.m_dictZhuanZhiID[286458479] = 286458464;
            this.m_dictZhuanZhiID[286327646] = 286327636;
            this.m_dictZhuanZhiID[286327647] = 286327636;
            this.m_dictZhuanZhiID[286458638] = 286458628;
            this.m_dictZhuanZhiID[286458639] = 286458628;
            this.m_dictZhuanZhiID[286458734] = 286458724;
            this.m_dictZhuanZhiID[286458735] = 286458724;
            this.m_dictZhuanZhiID[286458830] = 286458820;
            this.m_dictZhuanZhiID[286458831] = 286458820;
            this.m_dictZhuanZhiID[286458862] = 286458852;
            this.m_dictZhuanZhiID[286458863] = 286458852;
            this.m_dictZhuanZhiID[286458798] = 286458788;
            this.m_dictZhuanZhiID[286458799] = 286458788;
            this.m_dictZhuanZhiID[286331694] = 286331684;
            this.m_dictZhuanZhiID[286331695] = 286331684;
            this.m_dictZhuanZhiID[294847358] = 294847348;
            this.m_dictZhuanZhiID[294847359] = 294847348;
            this.m_dictZhuanZhiID[286393150] = [286393140];
            this.m_dictZhuanZhiID[286393151] = [286393140];
            this.m_dictZhuanZhiID[288949214] = [288949204];
            this.m_dictZhuanZhiID[288949215] = [288949204];
            this.m_dictZhuanZhiID[286458091] = [286458090];
            this.m_dictZhuanZhiID[286458092] = [286458090];
            this.m_dictZhuanZhiID[286458093] = [286458090];
            this.m_dictZhuanZhiID[286457867] = [286457866];
            this.m_dictZhuanZhiID[286457868] = [286457866];
            this.m_dictZhuanZhiID[286457869] = [286457866];
            this.m_dictZhuanZhiID[286458059] = [286458058];
            this.m_dictZhuanZhiID[286458060] = [286458058];
            this.m_dictZhuanZhiID[286458061] = [286458058];
            this.m_dictZhuanZhiID[286326875] = [286326874];
            this.m_dictZhuanZhiID[286326876] = [286326874];
            this.m_dictZhuanZhiID[286326877] = [286326874];
            this.m_dictZhuanZhiID[286851419] = [286851418];
            this.m_dictZhuanZhiID[286851420] = [286851418];
            this.m_dictZhuanZhiID[286851421] = [286851418];
            this.m_dictZhuanZhiID[294846587] = [294846586];
            this.m_dictZhuanZhiID[294846588] = [294846586];
            this.m_dictZhuanZhiID[294846589] = [294846586];
            this.m_dictZhuanZhiID[286458075] = [286458074];
            this.m_dictZhuanZhiID[286458076] = [286458074];
            this.m_dictZhuanZhiID[286458077] = [286458074];
            this.m_dictZhuanZhiID[287572011] = [287572010];
            this.m_dictZhuanZhiID[287572012] = [287572010];
            this.m_dictZhuanZhiID[287572013] = [287572010];
            this.m_dictZhuanZhiID[294846619] = [294846618];
            this.m_dictZhuanZhiID[294846620] = [294846618];
            this.m_dictZhuanZhiID[294846621] = [294846618];
            this.m_dictZhuanZhiID[286458174] = [286458160];
            this.m_dictZhuanZhiID[286458175] = [286458160];
            this.m_dictZhuanZhiID[286457902] = [286458004];
            this.m_dictZhuanZhiID[286457903] = [286458004];
            this.m_dictZhuanZhiID[286457886] = [286457984];
            this.m_dictZhuanZhiID[286457887] = [286457984];
            this.m_dictZhuanZhiID[287375406] = [287375396];
            this.m_dictZhuanZhiID[287375407] = [287375396];
            this.m_dictZhuanZhiID[286458142] = [286458132];
            this.m_dictZhuanZhiID[286458143] = [286458132];
            this.m_dictZhuanZhiID[286851438] = [286851428];
            this.m_dictZhuanZhiID[286851439] = [286851428];
            this.m_dictZhuanZhiID[286458222] = [286458212];
            this.m_dictZhuanZhiID[286458223] = [286458212];
            this.m_dictZhuanZhiID[289603646] = [289603636];
            this.m_dictZhuanZhiID[289603647] = [289603636];
            this.m_dictZhuanZhiID[286458158] = [286458148];
            this.m_dictZhuanZhiID[286458159] = [286458148];
            this.m_dictZhuanZhiID[286458126] = [286458116];
            this.m_dictZhuanZhiID[286458127] = [286458116];
            this.m_dictZhuanZhiID[286589006] = [286588996];
            this.m_dictZhuanZhiID[286588974] = [286588964];
            this.m_dictZhuanZhiID[286588975] = [286588964];
            this.m_dictZhuanZhiID[286589022] = [286589012];
            this.m_dictZhuanZhiID[286589023] = [286589012];
            this.m_dictZhuanZhiID[286392894] = [286392884];
            this.m_dictZhuanZhiID[286392895] = [286392884];
            this.m_dictZhuanZhiID[294846606] = [294846596];
            this.m_dictZhuanZhiID[294846607] = [294846596];
            this.m_dictZhuanZhiID[286855646] = [286855632];
            this.m_dictZhuanZhiID[286855647] = [286855632];
            this.m_dictZhuanZhiID[286855648] = [286855648];
            this.m_dictZhuanZhiID[286393102] = 286393088;
            this.m_dictZhuanZhiID[286393103] = 286393088;
            this.m_dictZhuanZhiID[286393118] = 286393104;
            this.m_dictZhuanZhiID[286393119] = 286393104;
            this.m_dictZhuanZhiID[286393134] = 286393120;
            this.m_dictZhuanZhiID[286393135] = 286393120;
            this.m_dictZhuanZhiID[286393230] = 286393216;
            this.m_dictZhuanZhiID[286393231] = 286393216;
            this.m_dictZhuanZhiID[286393214] = 286393200;
            this.m_dictZhuanZhiID[288490367] = 286393200;
            this.m_dictZhuanZhiID[286393198] = 286393184;
            this.m_dictZhuanZhiID[286393199] = 286393184;
            this.m_dictZhuanZhiID[286393358] = 286393344;
            this.m_dictZhuanZhiID[286393359] = 286393344;
            this.m_dictZhuanZhiID[286393371] = 286393370;
            this.m_dictZhuanZhiID[286393372] = 286393370;
            this.m_dictZhuanZhiID[286393373] = 286393370;
            this.m_dictZhuanZhiID[286393406] = 286393392;
            this.m_dictZhuanZhiID[286393407] = 286393392;
            this.m_dictZhuanZhiID[286393422] = 286393408;
            this.m_dictZhuanZhiID[286393423] = 286393408;
            this.m_dictZhuanZhiID[286394270] = 286394256;
            this.m_dictZhuanZhiID[286394271] = 286394256;
            this.m_dictZhuanZhiID[286394382] = 286394368;
            this.m_dictZhuanZhiID[286394383] = 286394368;
            this.m_dictZhuanZhiID[286394398] = 286394384;
            this.m_dictZhuanZhiID[286394399] = 286394384;
            this.m_dictZhuanZhiID[286394414] = 286394400;
            this.m_dictZhuanZhiID[286394415] = 286394400;
            this.m_dictZhuanZhiID[286394430] = 286394416;
            this.m_dictZhuanZhiID[286394431] = 286394416;
            this.m_dictZhuanZhiID[288949774] = 288949760;
            this.m_dictZhuanZhiID[288949775] = 288949760;
            this.m_dictZhuanZhiID[286394478] = 286394464;
            this.m_dictZhuanZhiID[286394479] = 286394464;
            this.m_dictZhuanZhiID[286394494] = 286394480;
            this.m_dictZhuanZhiID[286394495] = 286394480;
            this.m_dictZhuanZhiID[286394635] = 286394634;
            this.m_dictZhuanZhiID[286394636] = 286394634;
            this.m_dictZhuanZhiID[286394637] = 286394634;
            this.m_dictZhuanZhiID[286394670] = 286394656;
            this.m_dictZhuanZhiID[286394671] = 286394656;
            this.m_dictZhuanZhiID[286394702] = 286394688;
            this.m_dictZhuanZhiID[286394703] = 286394688;
            this.m_dictZhuanZhiID[286394718] = 286394704;
            this.m_dictZhuanZhiID[286394719] = 286394704;
            this.m_dictZhuanZhiID[286400558] = 286400544;
            this.m_dictZhuanZhiID[286400559] = 286400544;
            this.m_dictZhuanZhiID[288497742] = 288497728;
            this.m_dictZhuanZhiID[288497743] = 288497728;
            this.m_dictZhuanZhiID[286400606] = 286400592;
            this.m_dictZhuanZhiID[286400607] = 286400592;
            this.m_dictZhuanZhiID[286400619] = 286400618;
            this.m_dictZhuanZhiID[286400620] = 286400618;
            this.m_dictZhuanZhiID[286400621] = 286400618;
            this.m_dictZhuanZhiID[288950030] = 288950016;
            this.m_dictZhuanZhiID[288950031] = 288950016;
            this.m_dictZhuanZhiID[286400654] = 286400640;
            this.m_dictZhuanZhiID[286400655] = 286400640;
            this.m_dictZhuanZhiID[286400670] = 286400656;
            this.m_dictZhuanZhiID[286400671] = 286400656;
            this.m_dictZhuanZhiID[286400782] = 286400768;
            this.m_dictZhuanZhiID[286400783] = 286400768;
            this.m_dictZhuanZhiID[286400798] = 286400784;
            this.m_dictZhuanZhiID[286400799] = 286400784;
            this.m_dictZhuanZhiID[286400814] = 286400800;
            this.m_dictZhuanZhiID[286400815] = 286400800;
            this.m_dictZhuanZhiID[287572030] = 287572016;
            this.m_dictZhuanZhiID[287572031] = 287572016;
            this.m_dictZhuanZhiID[288950046] = 288950032;
            this.m_dictZhuanZhiID[288950047] = 288950032;
            this.m_dictZhuanZhiID[286400910] = 286400896;
            this.m_dictZhuanZhiID[286400911] = 286400896;
            this.m_dictZhuanZhiID[286400926] = 286400912;
            this.m_dictZhuanZhiID[286400927] = 286400912;
            this.m_dictZhuanZhiID[286401051] = 286401050;
            this.m_dictZhuanZhiID[286401052] = 286401050;
            this.m_dictZhuanZhiID[286401053] = 286401050;
            this.m_dictZhuanZhiID[286401070] = 286401056;
            this.m_dictZhuanZhiID[286401071] = 286401056;
            this.m_dictZhuanZhiID[286401086] = 286401072;
            this.m_dictZhuanZhiID[286401087] = 286401072;
            this.m_dictZhuanZhiID[286401118] = 286401104;
            this.m_dictZhuanZhiID[286401119] = 286401104;
            this.m_dictZhuanZhiID[286401134] = 286401120;
            this.m_dictZhuanZhiID[286401135] = 286401120;
            this.m_dictZhuanZhiID[286401150] = 286401136;
            this.m_dictZhuanZhiID[286401151] = 286401136;
            this.m_dictZhuanZhiID[286401182] = 286401168;
            this.m_dictZhuanZhiID[286401183] = 286401168;
            this.m_dictZhuanZhiID[286401310] = 286401296;
            this.m_dictZhuanZhiID[286401311] = 286401296;
            this.m_dictZhuanZhiID[286401326] = 286401312;
            this.m_dictZhuanZhiID[286401327] = 286401312;
            this.m_dictZhuanZhiID[288950059] = 286401338;
            this.m_dictZhuanZhiID[288950060] = 286401338;
            this.m_dictZhuanZhiID[288950061] = 286401338;
            this.m_dictZhuanZhiID[286401358] = 286401344;
            this.m_dictZhuanZhiID[286401359] = 286401344;
            this.m_dictZhuanZhiID[286401374] = 286401360;
            this.m_dictZhuanZhiID[286401375] = 286401360;
            this.m_dictZhuanZhiID[286401406] = 286401392;
            this.m_dictZhuanZhiID[286401407] = 286401392;
            this.m_dictZhuanZhiID[288950078] = 288950064;
            this.m_dictZhuanZhiID[288950079] = 288950064;
            this.m_dictZhuanZhiID[286401422] = 286401408;
            this.m_dictZhuanZhiID[286401423] = 286401408;
            this.m_dictZhuanZhiID[286401438] = 286401424;
            this.m_dictZhuanZhiID[286401439] = 286401424;
            this.m_dictZhuanZhiID[286401550] = 286401536;
            this.m_dictZhuanZhiID[286401551] = 286401536;
            this.m_dictZhuanZhiID[286401566] = 286401552;
            this.m_dictZhuanZhiID[286401567] = 286401552;
            this.m_dictZhuanZhiID[287572046] = 287572032;
            this.m_dictZhuanZhiID[287572047] = 287572032;
            this.m_dictZhuanZhiID[288950094] = 288950080;
            this.m_dictZhuanZhiID[288950095] = 288950080;
            this.m_dictZhuanZhiID[288950286] = 288950272;
            this.m_dictZhuanZhiID[288950287] = 288950272;
            this.m_dictZhuanZhiID[286462158] = 286462144;
            this.m_dictZhuanZhiID[286462159] = 286462144;
            this.m_dictZhuanZhiID[286462078] = 286462064;
            this.m_dictZhuanZhiID[286462079] = 286462064;
            this.m_dictZhuanZhiID[286855630] = 286855616;
            this.m_dictZhuanZhiID[286855631] = 286855616;
            this.m_dictZhuanZhiID[286401582] = 286401568;
            this.m_dictZhuanZhiID[286401583] = 286401568;
            for(key in CardUpgradeXML.Get().m_UpGradeDict)
            {
               upgradeIDHex = CardUpgradeXML.Get().m_UpGradeDict[key];
               for(i = 1; i < upgradeIDHex.length; i++)
               {
                  if(this.m_dictZhuanZhiID[upgradeIDHex[i]] == undefined)
                  {
                     this.m_dictZhuanZhiID[upgradeIDHex[i]] = upgradeIDHex[0];
                  }
               }
            }
         }
         if(this.m_dictZhuanZhiID[iDefCardID])
         {
            iShineDefCardID = int(this.m_dictZhuanZhiID[iDefCardID]);
         }
         else
         {
            iShineDefCardID = iDefCardID;
         }
         return iShineDefCardID;
      }
      
      public function checkIslandTap(islandName:String, roleLv:int) : Boolean
      {
         var dict:Dictionary = null;
         var islandData:Array = null;
         var pos:int = 0;
         if(this.m_oGuideData == null)
         {
            return true;
         }
         dict = NewGuideConfig.Instance.getIslandTap();
         islandData = this.m_oGuideData.guideData[2];
         pos = int(dict[islandName].@id);
         if(islandData[pos] == null || int(islandData[pos]) != 1)
         {
            return false;
         }
         return true;
      }
      
      public function updateIslandTapData(islandName:String) : void
      {
         var dict:Dictionary = null;
         var position:int = 0;
         var islandData:Array = null;
         dict = NewGuideConfig.Instance.getIslandTap();
         position = int(dict[islandName].@id);
         islandData = this.m_oGuideData.guideData[2];
         if(islandData[position] == null || int(islandData[position]) != 1)
         {
            islandData[position] = 1;
            this.LobbyRequestChangeGuideData(2,position,"1");
            if((stage.loaderInfo.parameters.sitetype == "360" || stage.loaderInfo.parameters.sitetype == "123u") && islandName == "map0x0001")
            {
               this.showCilckedTarget(this.stTDNewActionUI,"TDNewActionUI",this.gsManager.getString(4413),this.InitialzeTDNewActionUI);
            }
         }
      }
      
      public function MenuOpenEventHandler(e:Object) : void
      {
         var eData:Object = null;
         var arr:Array = null;
         var pos:int = 0;
         var key:String = null;
         eData = e.event_data;
         if(eData.type == "menuopenmc_playover")
         {
            this.updateOpenMenu();
         }
         else if(eData.type == "menuopen_turnto")
         {
            this.menuOpenCondition = eData.m_mData;
         }
         else if(eData.type == "menuopen_level")
         {
            if(this.m_oGuideData != null)
            {
               arr = this.m_oGuideData.guideData[5];
               pos = eData.data - 1;
               if(arr[pos] == null || int(arr[pos]) != 1)
               {
                  arr[pos] = 1;
                  this.LobbyRequestChangeGuideData(5,pos,"1");
                  MeishiGuide.Instance.pushAnimationToQuene({
                     "func":"showMenuOpenAnimation",
                     "params":[eData.data]
                  });
               }
            }
         }
         if(this.menuOpenCondition != null)
         {
            for(key in this.menuOpenCondition)
            {
               if(key != "id" && Boolean(this.menuOpenCondition[key]))
               {
                  this.showModule(key);
               }
            }
         }
      }
      
      public function GameOpenEventHandler(e:Object) : void
      {
         var eData:Object = null;
         var key:String = null;
         eData = e.event_data;
         if(eData.type == "gameopenevent_turnto")
         {
            this.menuOpenCondition = eData.m_mData;
         }
         if(this.menuOpenCondition != null)
         {
            for(key in this.menuOpenCondition)
            {
               if(key != "id" && Boolean(this.menuOpenCondition[key]))
               {
                  this.showModule(key);
               }
            }
         }
      }
      
      public function LevelUpEventHandler(e:Object) : void
      {
         var eData:Object = null;
         var key:String = null;
         eData = e.event_data;
         if(eData.type == "levelup_event_turnto")
         {
            this.LevelUpCondition = eData.m_mData;
         }
         if(this.LevelUpCondition != null)
         {
            for(key in this.LevelUpCondition)
            {
               if(key != "id" && Boolean(this.LevelUpCondition[key]))
               {
                  this.showModule(key);
               }
            }
         }
      }
      
      public function StoryGuideEventHandler(e:Object) : void
      {
         var obj:Object = null;
         var pos:int = 0;
         var guide_id:int = 0;
         var storyGuideData:Array = null;
         var success:Boolean = false;
         var key:String = null;
         var arr:Array = null;
         var i:int = 0;
         var old_id:int = 0;
         obj = e.event_data.m_mData;
         if(obj == null)
         {
            return;
         }
         switch(obj.type)
         {
            case "step":
               storyGuideData = this.m_oGuideData.guideData[1];
               guide_id = int(obj.data);
               pos = (guide_id >> 8) - 1;
               storyGuideData[pos] = guide_id;
               this.storyGuideCondition = obj.condition;
               break;
            case "guide_fight":
               success = Boolean(this.stTDNewGuideUI.setDDMTip(MeishiGuide.Instance.getResourceByName("com.aurora.ui.maogoutd.ddm.DDmGuideTip")));
               stage.addChild(this.stTDNewGuideUI as DisplayObject);
               if(success)
               {
                  this.stTDNewGuideUI.StartGuideBattle();
               }
               break;
            case "finish_task":
               this.a_1206.a_2502(obj.task_id);
               break;
            case "turnto":
               this.storyGuideCondition = obj.condition;
               if(this.storyGuideCondition != null)
               {
                  for(key in this.storyGuideCondition)
                  {
                     if(key != "id" && Boolean(this.storyGuideCondition[key]))
                     {
                        this.showModule(key);
                        break;
                     }
                  }
               }
               break;
            case "story_level":
               if(this.m_oGuideData != null)
               {
                  arr = this.m_oGuideData.guideData[1];
                  pos = (obj.data >> 8) - 1;
                  for(i = 0; i < pos; i++)
                  {
                     old_id = i << 8 | 0xFF;
                     if(arr[i] == null || int(arr[i]) != old_id)
                     {
                        arr[i] = String(old_id);
                        this.LobbyRequestChangeGuideData(1,i,arr[i]);
                     }
                  }
                  guide_id = pos << 8 | 0xFF;
                  if(arr[pos] == null || int(arr[pos]) != guide_id)
                  {
                     this.LobbyRequestChangeGuideData(1,pos,String(guide_id));
                     MeishiGuide.Instance.pushAnimationToQuene({
                        "func":"showStoryGuide",
                        "params":[obj.data]
                     });
                  }
               }
         }
      }
      
      public function ModelGuideEventHandler(e:Object) : void
      {
         var task_id:int = 0;
         var modelName:String = e.event_data as String;
         if(e.event_task != null)
         {
            task_id = int(e.event_task);
            this.a_1206.a_2502(task_id);
         }
      }
      
      public function NewCardEventHandler(e:Object) : void
      {
         var cards:Object = null;
         var getCardsArr:Array = null;
         var i:int = 0;
         var len:int = 0;
         var newCards:Array = null;
         var card:String = null;
         if(e.event_data == null)
         {
            return;
         }
         if(e.event_data.m_mData == null)
         {
            return;
         }
         cards = e.event_data.m_mData["cards"];
         if(cards == null)
         {
            return;
         }
         if(this.m_oGuideData == null)
         {
            return;
         }
         getCardsArr = this.m_oGuideData.guideData[6];
         if(getCardsArr == null)
         {
            getCardsArr = [];
            this.m_oGuideData.guideData[6] = getCardsArr;
         }
         len = int(getCardsArr.length);
         newCards = [];
         for each(card in cards)
         {
            newCards.push(card);
            i = 0;
            while(i < len)
            {
               if(card == getCardsArr[i])
               {
                  newCards.pop();
                  break;
               }
               i++;
            }
         }
         getCardsArr = getCardsArr.concat(newCards);
         this.m_oGuideData.guideData[6] = getCardsArr;
         for(i = 0; i < newCards.length; i++)
         {
            this.LobbyRequestChangeGuideData(6,len + i,newCards[i]);
         }
      }
      
      public function showModule(module_name:String, once:Boolean = false) : void
      {
         var enterRoom:Object = null;
         if(!once)
         {
            setTimeout(this.showModule,1000,module_name,true);
            return;
         }
         enterRoom = a_2161.e.getEnterRoom();
         if(!enterRoom.m_iLeaveRoom && this.stTDGameReadyUI != null && this.stTDGameReadyUI.stage != null)
         {
            (this.stTDGameReadyUI as Object).standUpBtn.dispatchEvent(new MouseEvent(MouseEvent.CLICK,true,false,10,10));
         }
         if(this.stTDTaskUI != null && contains(this.stTDTaskUI))
         {
            removeChild(this.stTDTaskUI);
         }
         if(this.stTDStoreUI != null && contains(this.stTDStoreUI as DisplayObject))
         {
            removeChild(this.stTDStoreUI as DisplayObject);
         }
         if(this.stTDRankUI != null && contains(this.stTDRankUI))
         {
            removeChild(this.stTDRankUI);
         }
         if(this.stTDNewMarginTreeUI != null && contains(this.stTDNewMarginTreeUI))
         {
            removeChild(this.stTDNewMarginTreeUI);
         }
         if(this.stTDHuangZuanWelfareUI != null && contains(this.stTDHuangZuanWelfareUI))
         {
            removeChild(this.stTDHuangZuanWelfareUI);
         }
         switch(module_name)
         {
            case "meishi":
            case "n_meishi":
               enterRoom.m_index = ROOM_ID_MEI_SHI;
               this.a_2483(-1,-1);
               break;
            case "huoshan":
            case "n_huoshan":
               enterRoom.m_index = ROOM_ID_HUO_SHAN;
               this.a_2483(-1,-1);
               break;
            case "skycastle":
            case "n_skycastle":
               enterRoom.m_index = ROOM_ID_SKY_CASTLE;
               this.a_2483(-1,-1);
               break;
            case "seafloorWhirlpool":
            case "n_seafloorWhirlpool":
               enterRoom.m_index = ROOM_ID_SEAFLOOR_WHIRLPOOL;
               this.a_2483(-1,-1);
               break;
            case "town":
            case "n_town":
               if(!contains(this.stTDTownUI))
               {
                  if(this.stTDMeiShiUI != null && this.stTDMeiShiUI.parent != null)
                  {
                     (this.stTDMeiShiUI as Object).roomReturnBtn.dispatchEvent(new MouseEvent(MouseEvent.CLICK,true,false,10,10));
                  }
                  else if(this.stTDHuoShanUI != null && this.stTDHuoShanUI.parent != null)
                  {
                     (this.stTDHuoShanUI as Object).roomReturnBtn.dispatchEvent(new MouseEvent(MouseEvent.CLICK,true,false,10,10));
                  }
                  else if(this.stTDSkyCastleUI != null && this.stTDSkyCastleUI.parent != null)
                  {
                     (this.stTDSkyCastleUI as Object).roomReturnBtn.dispatchEvent(new MouseEvent(MouseEvent.CLICK,true,false,10,10));
                  }
                  else if(this.stTDSeafloorWhirlpoolUI != null && this.stTDSeafloorWhirlpoolUI.parent != null)
                  {
                     (this.stTDSeafloorWhirlpoolUI as Object).roomReturnBtn.dispatchEvent(new MouseEvent(MouseEvent.CLICK,true,false,10,10));
                  }
               }
               else
               {
                  if(this.menuOpenCondition != null && Boolean(this.menuOpenCondition["town"]))
                  {
                     this.menuOpenCondition["town"] = false;
                     MeishiGuide.Instance.showMenuOpenAnimation(this.menuOpenCondition["id"]);
                  }
                  if(this.storyGuideCondition != null && Boolean(this.storyGuideCondition["n_town"]))
                  {
                     this.storyGuideCondition["n_town"] = false;
                     MeishiGuide.Instance.showStoryGuide(this.hasStoryGuide());
                  }
               }
         }
      }
      
      public function onSendMail(role:Object, isLocal:Boolean, isDetail:Boolean) : void
      {
         var currentRole:a_4463 = null;
         currentRole = a_2161.e.GetCurrentRole() as a_4463;
         if(currentRole.m_szRoleName == role.m_szRoleName)
         {
            this.showTip("不能给自己发送邮件");
            return;
         }
         if(this.stTDMailUI == null)
         {
            this.m_bSendMailDirect = true;
            this.m_oSendToRole = role;
            if(this.stTDFriendUI != null && this == this.stTDFriendUI.parent)
            {
               this.removeChild(this.stTDFriendUI);
            }
            this.setTurnToPanel(true);
            this.showCilckedTarget(this.stTDMailUI,"TDMailUI",this.gsManager.getString(4399),this.a_4562);
         }
         else
         {
            this.stTDMailUI.visible = true;
            addChild(this.stTDMailUI);
            (this.stTDMailUI as Object).requsetNewMail(role.m_szRoleName);
         }
      }
      
      public function OnPetSwallow() : void
      {
      }
      
      public function OnShowResultIDInfo(iResultID:int) : void
      {
         var iStringID:int = 0;
         if(EnmMessageResultID.SUCCESS == iResultID)
         {
            return;
         }
         iStringID = 0;
         switch(iResultID)
         {
            case EnmMessageResultID.ADD_PROP_ATTR_FAIL:
            case EnmMessageResultID.ADD_PROP_FAIL:
               iStringID = 139619;
               break;
            case EnmMessageResultID.ADD_EQUIP_FAIL:
            case EnmMessageResultID.ADD_EQUIP_ATTR_FAIL:
               iStringID = 139620;
               break;
            case EnmMessageResultID.DEDUCT_MONEY_FAIL:
            case EnmMessageResultID.MONEY_NOT_ENOUGH:
            case EnmMessageResultID.FIREWORK_MONEY_NOT_ENOUGH:
               iStringID = 139621;
               break;
            case EnmMessageResultID.MARRIAGE_ROOM_CREATOR_NOT_FOUND:
               iStringID = 139632;
               break;
            case EnmMessageResultID.MARRIAGE_ROOM_IS_FULL:
               iStringID = 139633;
               break;
            case EnmMessageResultID.MARRIAGE_ROOM_NOT_ENOUGH_PEOPLE:
               iStringID = 139634;
               break;
            case EnmMessageResultID.MARRIAGE_LACK_OF_CERTIFICATE:
               iStringID = 139639;
               break;
            case EnmMessageResultID.MARRIAGE_PARTNER_NOT_READY:
               iStringID = 139635;
               break;
            case EnmMessageResultID.MARRIAGE_CERTIFICATE_NOT_SELECT:
               iStringID = 139636;
               break;
            case EnmMessageResultID.MARRIAGE_INVITE_FAILED:
               iStringID = 139785;
               break;
            case EnmMessageResultID.WEDDING_NOT_MARRIED_NOT_PREPARE:
               iStringID = 139654;
               break;
            case EnmMessageResultID.WEDDING_MARRIAGE_LEVEL_NOT_ENOUGH:
               iStringID = 139655;
               break;
            case EnmMessageResultID.WEDDING_LEVEL_NOT_FOUND:
               iStringID = 139656;
               break;
            case EnmMessageResultID.WEDDING_DIVORCING_NOT_PREPARE:
               iStringID = 139657;
               break;
            case EnmMessageResultID.WEDDING_DECALARATION_ERROR:
               iStringID = 139664;
               break;
            case EnmMessageResultID.WEDDING_GAMEDB_ERROR:
               iStringID = 139665;
               break;
            case EnmMessageResultID.WEDDING_DRESS_ERROR:
               iStringID = 139666;
               break;
            case EnmMessageResultID.WEDDING_MAX_COUNT_ERROR:
               iStringID = 139667;
               break;
            case EnmMessageResultID.WEDDING_IS_PREPARE_NOT_CAN_DIVORCING:
               iStringID = 139668;
               break;
            case EnmMessageResultID.HOLIDAY_RECHARGE_TIME_ERROR:
               iStringID = 139669;
               break;
            case EnmMessageResultID.WEDDING_HAVE_WEDDING:
               iStringID = 139673;
               break;
            case EnmMessageResultID.WEDDING_IS_ALREADY_IN_WEDDING_ROOM:
               iStringID = 139781;
               break;
            case EnmMessageResultID.WEDDING_ROOM_NOT_FOUND:
               iStringID = 139782;
               break;
            case EnmMessageResultID.WEDDING_PASSWORD_ERROR:
               iStringID = 139783;
               break;
            case EnmMessageResultID.WEDDING_ROOM_IS_FULL:
               iStringID = 139784;
               break;
            case EnmMessageResultID.WEDDING_PLAYER_NOT_FOUND:
               iStringID = 139785;
               break;
            case EnmMessageResultID.WEDDING_PLAYER_IN_OTHER_ROOM:
               iStringID = 139786;
               break;
            case EnmMessageResultID.WEDDING_SEAT_ERROR:
               iStringID = 139787;
               break;
            case EnmMessageResultID.WEDDING_LEVEL_ERROR:
               iStringID = 139788;
               break;
            case EnmMessageResultID.WEDDING_SEND_WELFARE_MONEY_NOT_ENOUGH:
               iStringID = 139621;
               break;
            case EnmMessageResultID.WEDDING_WELFARE_COUNT_OVER:
               iStringID = 139789;
               break;
            case EnmMessageResultID.WEDDING_WELFARE_REGET_ERROR:
               iStringID = 139790;
               break;
            case EnmMessageResultID.WEDDING_WELFARE_TIME_ERROR:
               iStringID = 139791;
               break;
            case EnmMessageResultID.WEDDING_NO_CHANGE_PASSWORD_RIGHT:
               iStringID = 139808;
               break;
            case EnmMessageResultID.WEDDING_CHANGE_PASSWORD_GAMEDB_ERROR:
               iStringID = 139809;
               break;
            case EnmMessageResultID.BLESS_CD_TIME_ERROR:
               iStringID = 139810;
               break;
            case EnmMessageResultID.BLESS_GAG:
               iStringID = 139811;
               break;
            case EnmMessageResultID.BLESS_ILLEGAL:
               iStringID = 139812;
               break;
            case EnmMessageResultID.FIREWORK_CD_TIME_ERROR:
               iStringID = 139813;
               break;
            case EnmMessageResultID.WEDDING_WELFARE_GOT_COUNT_ERROR:
               iStringID = 139814;
               break;
            case EnmMessageResultID.WEDDING_GET_IN_TIME_ERROR:
               iStringID = 139815;
               break;
            case EnmMessageResultID.MARRIAGE_CREATOR_NOT_IN_ROOM:
               iStringID = 139816;
               break;
            case EnmMessageResultID.WEDDING_CEREMONY_OPEARTE_NOT_AVAILABLE:
               iStringID = 139833;
               break;
            case EnmMessageResultID.WEDDING_WEEK_MAX_RESERVE:
               iStringID = 139843;
               break;
            case EnmMessageResultID.WEDDING_WEEK_MAX_PARTICIPATE:
               iStringID = 139844;
               break;
            case EnmMessageResultID.WEDDING_WELFARE_COUNT_MAX:
               iStringID = 139845;
               break;
            case EnmMessageResultID.RESULT_ID_HAPPYBEAN_LACK:
               iStringID = 131339;
               break;
            case EnmMessageResultID.RESERVE_WEDDING_TIME_ERROR:
               iStringID = 139863;
               break;
            case EnmMessageResultID.SEND_WELFARE_TIME_ERROR:
               iStringID = 139864;
               break;
            case EnmMessageResultID.WELFARE_IS_NOT_READY:
               iStringID = 139865;
               break;
            case EnmMessageResultID.SEND_WELFARE_ROOM_PREPARE_CLOSE_TIME:
               iStringID = 139873;
               break;
            case EnmMessageResultID.MARRIAGE_CERTIFATE_LEVEL_ERROR:
               iStringID = 139891;
         }
         if(iStringID > 0)
         {
            this.a_3744(this.gsManager.getString(iStringID),"",false,true,false,false,-1);
         }
      }
      
      public function CheckCumulativeRechargeActivityIcon() : Boolean
      {
         var iStartTime:int = 0;
         var iCurrAccPay:int = 0;
         var iFlagAccumulate:int = 0;
         var iAwardItemNum:int = 0;
         iStartTime = RechargeActivityConfig.GetInstance().m_stCumulativeRechargeXML.m_iStartTime;
         if(a_1767.getInstance().SystemTime < iStartTime)
         {
            return false;
         }
         iCurrAccPay = a_2161.e.notifyData("GetRechargeActivityInfo","m_iCurrAccPay") as int;
         iFlagAccumulate = a_2161.e.notifyData("GetRechargeActivityInfo","m_iFlagAccumulate") as int;
         iAwardItemNum = int(RechargeActivityConfig.GetInstance().m_stCumulativeRechargeXML.m_vAwardItems.length);
         return iCurrAccPay <= 0 || this.CompareMaskNum(iAwardItemNum,iFlagAccumulate);
      }
      
      public function CheckHolidayRechargeActivityIcon() : Boolean
      {
         return true;
      }
      
      public function CheckFirstRechargeActivityIcon() : Boolean
      {
         var iAccPay:int = 0;
         var iMaskFirstRecharge:int = 0;
         var iAwardItemNum:int = 0;
         iAccPay = a_2161.e.notifyData("GetRechargeActivityInfo","m_iAccPay") as int;
         iMaskFirstRecharge = a_2161.e.notifyData("GetRechargeActivityInfo","m_iFlagFirst") as int;
         iAwardItemNum = int(RechargeActivityConfig.GetInstance().m_stFirstRechargeXML.m_vAwardItems.length);
         return iAccPay <= 0 || this.CompareMaskNum(iAwardItemNum,iMaskFirstRecharge);
      }
      
      private function CompareMaskNum(iNum:int, iMask:int) : Boolean
      {
         return Boolean(iNum > this.BitNum(iMask));
      }
      
      private function BitNum(iValue:int) : int
      {
         var iCountBit:int = 0;
         iCountBit = 0;
         while(0 != iValue)
         {
            iValue &= iValue - 1;
            iCountBit++;
         }
         return iCountBit;
      }
      
      public function CheckCurrencyIsEnough(iNeedCurrencyNum:int, iCurrencyType:int) : int
      {
         var iCurCurrencyNum:int = 0;
         var stCommonInfo:Object = null;
         iCurCurrencyNum = 0;
         stCommonInfo = a_2161.e.GetPlayerCommon();
         switch(iCurrencyType)
         {
            case a_1752.a_516:
               iCurCurrencyNum = int(stCommonInfo.m_iMoney);
               break;
            case a_1752.a_517:
               iCurCurrencyNum = int(stCommonInfo.m_lHappyBean);
               break;
            case a_1752.a_518:
               iCurCurrencyNum = int(stCommonInfo.m_iLottery);
               break;
            case a_1752.a_519:
               iCurCurrencyNum = int(stCommonInfo.m_iCharming);
               break;
            case a_1752.CommodityWeiWangType:
               iCurCurrencyNum = int(stCommonInfo.m_iLastOfflineCharming);
               break;
            case a_1752.CommodityCharmCoinType:
               iCurCurrencyNum = int(stCommonInfo.m_iCharmCoin);
               break;
            default:
               throw Error("iCurrencyType = " + iCurrencyType + " 不存在！！！");
         }
         return iCurCurrencyNum - iNeedCurrencyNum;
      }
      
      private function onGetMonthCard(e:a_1778) : void
      {
         var response:Object = null;
         var systemTime:int = 0;
         response = e.dataObject;
         if(response.m_nResultID == 0)
         {
            systemTime = a_1767.getInstance().SystemTime;
            if(response.m_iDeadline >= systemTime)
            {
               GlobalVariables.getInstance().m_iMonthCardVipService = 1;
            }
            else
            {
               GlobalVariables.getInstance().m_iMonthCardVipService = 0;
            }
         }
      }
      
      private function onRoleCunsume(e:a_1778) : void
      {
         var response:Object = null;
         response = e.dataObject;
         if(stage.loaderInfo.parameters.sitetype == "qqgame")
         {
            ExternalInterface.call("QQGameJs","http://tencentlog.com/stat/report_consume.php?appid=13057&domain=10&opuid=" + int(response.iUin).toString() + "&opopenid=" + stage.loaderInfo.parameters.sig_user + "&modifyfee=" + int(response.iValue).toString());
         }
      }
      
      private function onCreateMap(e:CommonEvent) : void
      {
         if(e.Data.m_nResultID == 0)
         {
            DiyHandler.GetInstance().SetCurrentEditMapID(e.Data.m_iMapID);
            if(this.m_stTDEditorUI != null)
            {
               this.showCilckedTarget(this.m_stTDDiyLaboratoryUI,"TDDiyLaboratoryUI","猫博士的实验室",this.InitialzeTDDiyLaboratoryUI);
               this.showCilckedTarget(this.m_stTDMyChapterUI,"TDMyChapterUI","我的关卡",this.InitialzeTDMyChapterUI);
            }
            this.showCilckedTarget(this.m_stTDEditorUI,"TDEditorUI","关卡编辑",this.InitialzeTDEditorUI);
         }
      }
      
      private function onNotifyMatchTask(e:a_1778) : void
      {
         var response:Object = null;
         response = e.dataObject;
         if(null == this.m_stCompleteMatchTip)
         {
            this.m_stCompleteMatchTip = this.stTDComponentUI.GetCompleteMatchTaskTip();
         }
         if(contains(this.m_stCompleteMatchTip))
         {
            removeChild(this.m_stCompleteMatchTip);
         }
         if(this.m_matchTimer != null && this.m_matchTimer.hasEventListener(TimerEvent.TIMER))
         {
            this.m_matchTimer.removeEventListener(TimerEvent.TIMER,this.HandMatchTaskTimer);
         }
         if(response.m_iType == 1 << 6 || response.m_iType == 1 << 7)
         {
            addChild(this.m_stCompleteMatchTip);
            this.m_matchTimer = new Timer(3000,1);
            this.m_matchTimer.addEventListener(TimerEvent.TIMER,this.HandMatchTaskTimer);
            this.m_matchTimer.start();
         }
      }
      
      private function onNotifyExploreCampTask(e:a_1778) : void
      {
         var response:Object = null;
         response = e.dataObject;
         if(null == this.m_stCompleteExploreTip)
         {
            this.m_stCompleteExploreTip = this.stTDComponentUI.GetCompleteExploreTaskTip();
         }
         if(contains(this.m_stCompleteExploreTip))
         {
            return;
         }
         if(this.m_ExploreTimer != null && this.m_ExploreTimer.hasEventListener(TimerEvent.TIMER))
         {
            this.m_ExploreTimer.removeEventListener(TimerEvent.TIMER,this.HandMatchTaskTimer);
         }
         if(response.m_iType == 1 << 11 || response.m_iType == 1 << 12)
         {
            addChild(this.m_stCompleteExploreTip);
            this.m_ExploreTimer = new Timer(3000,1);
            this.m_ExploreTimer.addEventListener(TimerEvent.TIMER,this.HandExploreTaskTimer);
            this.m_ExploreTimer.start();
         }
      }
      
      private function HandExploreTaskTimer(e:TimerEvent) : void
      {
         if(contains(this.m_stCompleteExploreTip))
         {
            removeChild(this.m_stCompleteExploreTip);
         }
         this.m_ExploreTimer.removeEventListener(TimerEvent.TIMER,this.HandExploreTaskTimer);
         this.m_ExploreTimer.stop();
         this.m_ExploreTimer = null;
      }
      
      private function HandMatchTaskTimer(e:TimerEvent) : void
      {
         if(contains(this.m_stCompleteMatchTip))
         {
            removeChild(this.m_stCompleteMatchTip);
         }
         this.m_matchTimer.removeEventListener(TimerEvent.TIMER,this.HandMatchTaskTimer);
      }
      
      private function onNotifyConsortiaTask(e:a_1778) : void
      {
         var response:Object = null;
         response = e.dataObject;
         if(null == this.m_stCompleteTip)
         {
            this.m_stCompleteTip = this.stTDComponentUI.GetCompleteTaskTip();
         }
         if(null == this.m_stCompleteLoverTip)
         {
            this.m_stCompleteLoverTip = this.stTDComponentUI.GetCompleteLoverTaskTip();
         }
         if(null == this.m_stCompleteAllTip)
         {
            this.m_stCompleteAllTip = this.stTDComponentUI.GetCompleteAllTaskTip();
         }
         if(response.m_iType == 1 || response.m_iType == 2)
         {
            addChild(this.m_stCompleteTip);
            this.timer = new Timer(3000,1);
            this.timer.addEventListener(TimerEvent.TIMER,this.handleConsortiaTaskTimer);
            this.timer.start();
         }
         else if(response.m_iType == 4)
         {
            addChild(this.m_stCompleteLoverTip);
            this.timer = new Timer(3000,1);
            this.timer.addEventListener(TimerEvent.TIMER,this.handleConsortiaTaskTimer);
            this.timer.start();
         }
         else if(response.m_iType != 8)
         {
            if(response.m_iType == 5 || response.m_iType == 6)
            {
               addChild(this.m_stCompleteAllTip);
               this.timer = new Timer(3000,1);
               this.timer.addEventListener(TimerEvent.TIMER,this.handleConsortiaTaskTimer);
               this.timer.start();
            }
         }
      }
      
      private function onNotifySecpwd(e:a_1778) : void
      {
         var response:Object = e.dataObject;
         if(null == this.m_stSecpwdTip)
         {
            this.m_stSecpwdTip = this.stTDComponentUI.GetSecpwd();
         }
         addChild(this.m_stSecpwdTip);
      }
      
      private function onAutoOpenHandbook(e:CommonEvent) : void
      {
         this.showCilckedTarget(this.m_stTDHandbookUI,"TDHandbookUI","图鉴",this.InitialzeTDHandbookUI);
      }
      
      private function onVerifyInGame(e:a_1778) : void
      {
         if(Boolean(this.stTDVerifyInGameUI) && this.stTDVerifyInGameUI.parent == this)
         {
            removeChild(this.stTDVerifyInGameUI);
         }
         a_2439.getInstance().SetVerifyInGame(e.dataObject);
         this.showCilckedTarget(this.stTDVerifyInGameUI,"TDVerifyInGameUI","动态验证",this.InitialzeTDVerifyInGameUI);
      }
      
      private function onVerifyInGameResult(e:a_1778) : void
      {
         var result:Object = null;
         var dataEvent:a_1778 = null;
         result = e.dataObject;
         if(result.m_iOpt == 1)
         {
            a_2439.getInstance().SetVerifyNumInGame(result.m_iNum);
            dataEvent = new a_1778(EventType.VERIFY_IN_GAME_CHANGE);
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
         else if(result.m_iOpt == 0 && result.m_iNum == 0)
         {
            if(Boolean(this.stTDVerifyInGameUI) && this.stTDVerifyInGameUI.parent == this)
            {
               removeChild(this.stTDVerifyInGameUI);
            }
         }
      }
      
      protected function handleConsortiaTaskTimer(a_4730:TimerEvent) : void
      {
         if(contains(this.m_stCompleteTip))
         {
            removeChild(this.m_stCompleteTip);
         }
         if(contains(this.m_stCompleteLoverTip))
         {
            removeChild(this.m_stCompleteLoverTip);
         }
         if(contains(this.m_stCompleteAllTip))
         {
            removeChild(this.m_stCompleteAllTip);
         }
         this.timer.removeEventListener(TimerEvent.TIMER,this.handleConsortiaTaskTimer);
      }
      
      private function onMeishiMatchGoHead(e:a_1778) : void
      {
         var response:Object = null;
         var enterRoom:Object = null;
         var dataEvent:a_1778 = null;
         var objs:Object = null;
         response = e.dataObject;
         this.MeishiTarget = response;
         enterRoom = a_2161.e.getEnterRoom();
         if(enterRoom.m_index != response.m_land)
         {
            this.m_iNewYearBossPosition = 13;
            this.setTurnToPanel(true);
            enterRoom = a_2161.e.getEnterRoom();
            enterRoom.m_index = response.m_land;
            this.a_2483(-1,-1);
         }
         else
         {
            this.showCilckedTarget(this.stTDMeiShiMatchUI as DisplayObject,"TDMeiShiMatchUI",this.gsManager.getString(139616),this.InitialzeTDMeiShiMatchUI);
            dataEvent = new a_1778(EventType.SHORT_CUT_NEW_YEAR_BOSS);
            objs = {};
            objs.m_iType = response.m_iMapID;
            dataEvent.dataObject = objs;
            LobbyEventManager.Get().dispatchEvent(dataEvent);
         }
      }
      
      private function onThunderCityGoHead(e:a_1778) : void
      {
         var response:Object = null;
         var enterRoom:Object = null;
         var dataEvent:a_1778 = null;
         var objs:Object = null;
         response = e.dataObject;
         this.MeishiTarget = response;
         enterRoom = a_2161.e.getEnterRoom();
         if(this.currentPosition != response.m_land + 1)
         {
            this.m_iNewYearBossPosition = 14;
            this.setTurnToPanel(true);
            enterRoom = a_2161.e.getEnterRoom();
            enterRoom.m_index = response.m_land;
            this.a_2483(-1,-1);
         }
         else
         {
            this.showCilckedTarget(this.stTDThunderCityExploreUI as DisplayObject,"TDThunderCityExploreUI",this.gsManager.getString(139616),this.InitialzeTDThunderCityExploreUI);
            dataEvent = new a_1778(EventType.SHORT_CUT_NEW_YEAR_BOSS);
            objs = {};
            objs.m_iType = response.m_iMapID;
            dataEvent.dataObject = objs;
            LobbyEventManager.Get().dispatchEvent(dataEvent);
         }
      }
      
      private function onTestMapGoHead(e:a_1778) : void
      {
         var response:Object = null;
         var enterRoom:Object = null;
         var szMapIDStr:String = null;
         var mitem1:Object = null;
         var roomItem:Object = null;
         var iServerID:int = 0;
         var iRoomID:int = 0;
         var dataEvent:a_1778 = null;
         var objs:Object = null;
         response = e.dataObject;
         this.MeishiTarget = response;
         enterRoom = a_2161.e.getEnterRoom();
         szMapIDStr = "0x" + response.m_iMapID.toString(16).toUpperCase();
         if(szMapIDStr.length == 10 && szMapIDStr.indexOf("0x7") != -1)
         {
            mitem1 = a_2018.getInstance().getRoomItem(41,1);
            if(mitem1 != null)
            {
               enterRoom.m_index = ROOM_ID_WORLD_BOSS_LEVEL;
               roomItem = a_2018.getInstance().getNewPlayerRoomID(enterRoom.m_index);
               iServerID = int(roomItem.iServerID);
               iRoomID = int(roomItem.iRoomID);
               if(iServerID != -1)
               {
                  enterRoom.m_iUpServerID = enterRoom.m_iServerID;
                  enterRoom.m_iUpRoomeID = enterRoom.m_iRoomID;
                  enterRoom.m_iServerID = iServerID;
                  enterRoom.m_iRoomID = iRoomID;
               }
               this.a_2483(mitem1.iServerID,mitem1.iRoomID);
               setTimeout(function():void
               {
                  enterRoom.m_isEnterMatch = 3;
                  (a_1825.e.GetTDLobbyLogic() as b_176).a_2485(enterRoom.m_iServerID,enterRoom.m_iRoomID,-1,0,"地图魔王","",[response.m_iMapID],a_1748.enmGameMode_vComputer | 0x010000);
               },1000);
            }
            return;
         }
         if(this.currentPosition != response.m_land + 1)
         {
            this.m_iNewYearBossPosition = 15;
            this.setTurnToPanel(true);
            enterRoom = a_2161.e.getEnterRoom();
            enterRoom.m_index = response.m_land;
            this.a_2483(-1,-1);
         }
         else
         {
            this.showCilckedTarget(this.stTDGoHeadMapUI as DisplayObject,"TDGoHeadMapUI",this.gsManager.getString(139616),this.InitialzeTDGoHeadMapUI);
            dataEvent = new a_1778(EventType.SHORT_CUT_NEW_YEAR_BOSS);
            objs = {};
            objs.m_iType = response.m_iMapID;
            dataEvent.dataObject = objs;
            LobbyEventManager.Get().dispatchEvent(dataEvent);
         }
      }
      
      private function onEnterWorldBossTrainRoom(e:a_1778) : void
      {
         var enterRoom:Object = null;
         var roomList:Array = null;
         var room:Object = null;
         if(this.currentPosition != 22)
         {
            this.currentPosition = 22;
            enterRoom = a_2161.e.getEnterRoom();
            roomList = a_2018.getInstance().a_791[19];
            room = roomList[1];
            if(room != null && room.index == 19)
            {
               enterRoom.m_index = ROOM_ID_WORLD_BOSS_TRAIN;
               this.a_2483(room.iServerID,room.iRoomID);
            }
         }
      }
      
      private function onTickAutoPopWin() : void
      {
         var has:Boolean = false;
         var next:Object = null;
         this.autoTickPopWinNum += 1;
         has = this.checkHasAutoPopWin();
         if(has)
         {
            next = this.getAutoPopWinItem();
            if(next)
            {
               clearInterval(this.autoPopWinTimerHandler);
               this.autoPopWinTimerHandler = 0;
               if(this.hasAutoPopWinAry.indexOf(next.id) == -1)
               {
                  this.hasAutoPopWinAry.push(next.id);
               }
               this.showCilckedTarget(next.target,next.id,next.showName,next.loadedHandler,next.visibleLoadDialog);
            }
         }
         if(this.autoTickPopWinNum >= 2)
         {
            clearInterval(this.autoPopWinTimerHandler);
            this.autoPopWinTimerHandler = 0;
         }
      }
      
      private function putAutoPopWinAry(winData:Object) : void
      {
         var find:Boolean = false;
         var i:int = 0;
         if(this.hasAutoPopWinAry.indexOf(winData.id) != -1)
         {
            return;
         }
         for(i = 0; i < this.autoPopWinAry.length; i++)
         {
            if(this.autoPopWinAry[i].sortId == winData.sortId)
            {
               find = true;
               break;
            }
         }
         if(!find)
         {
            this.autoPopWinAry.push(winData);
            this.autoPopWinAry.sortOn("sortId",Array.NUMERIC);
         }
      }
      
      private function checkOpenAutoPopWin(winId:String) : void
      {
         var next:Object = null;
         if(this.needAutoPopWin.indexOf(winId) != -1)
         {
            if(this.checkHasAutoPopWin())
            {
               next = this.getAutoPopWinItem();
               if(next)
               {
                  this.showCilckedTarget(next.target,next.id,next.showName,next.loadedHandler,next.visibleLoadDialog);
               }
            }
         }
      }
      
      private function checkHasAutoPopWin() : Boolean
      {
         return this.autoPopWinAry.length > 0;
      }
      
      private function getAutoPopWinItem() : Object
      {
         if(this.checkHasAutoPopWin())
         {
            return this.autoPopWinAry.shift();
         }
         return null;
      }
   }
}

