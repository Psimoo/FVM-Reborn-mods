package com.aurora.ui.maogoutd
{
   import a_4715.EncrypString;
   import a_4718.b_203;
   import a_4719.EnmLoaderType;
   import a_4724.AvatarDetailInfo;
   import a_4724.PlayerDetailInfo;
   import a_4725.AurLoadTask;
   import a_4728.a_1778;
   import a_4729.EventType;
   import a_4729.a_1789;
   import a_4752.GlobalVariables;
   import a_4752.a_2018;
   import a_4752.a_2036;
   import a_4752.a_2037;
   import a_4753.b_150;
   import a_4754.a_2161;
   import a_4763.a_2439;
   import a_4774.a_3004;
   import a_4781.TimeoutManager;
   import com.aurora.game.maogoutd.common.SystemMessage.AnalysisBattleBGXml;
   import com.aurora.protocol.game.maogoutd.CEntityStateChange;
   import com.aurora.protocol.game.maogoutd.CNotifyEntityStateChange;
   import com.aurora.protocol.game.maogoutd.CNotifyGameStep;
   import com.aurora.protocol.game.maogoutd.CVanishDefender;
   import com.aurora.protocol.game.maogoutd.CVanishEnemy;
   import com.aurora.protocol.game.maogoutd.a_2694;
   import com.aurora.protocol.game.maogoutd.a_2695;
   import com.aurora.protocol.game.maogoutd.a_2696;
   import com.aurora.protocol.game.maogoutd.a_2702;
   import com.aurora.protocol.game.maogoutd.a_2703;
   import com.aurora.protocol.game.maogoutd.a_2704;
   import com.aurora.protocol.game.maogoutd.a_2707;
   import com.aurora.protocol.game.maogoutd.a_2708;
   import com.aurora.protocol.game.maogoutd.a_2709;
   import com.aurora.ui.maogoutd.ClientLog.MessageTipHandler;
   import com.aurora.ui.maogoutd.ClientLog.ReportHandler;
   import com.aurora.ui.maogoutd.ClientLog.SendCountInfoHandle;
   import com.aurora.ui.maogoutd.ClientLog.a_4807;
   import com.aurora.ui.maogoutd.ClientLog.a_4812;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.compositemap.CompositeMap;
   import com.aurora.ui.maogoutd.compositemap.CompositeMapHandler;
   import com.aurora.ui.maogoutd.consortiaxml.ConsortiaActivityConfig;
   import com.aurora.ui.maogoutd.crossserver.CrossServerDefine;
   import com.aurora.ui.maogoutd.diy.myEditor.data.MouseLinesData;
   import com.aurora.ui.maogoutd.game.BattleFieldFor4View;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.BattleScoreView;
   import com.aurora.ui.maogoutd.game.CardGrowPanelView;
   import com.aurora.ui.maogoutd.game.ExitGameConfirmView;
   import com.aurora.ui.maogoutd.game.GameBattleCountDownView;
   import com.aurora.ui.maogoutd.game.GameBattleDPSView;
   import com.aurora.ui.maogoutd.game.GameBossBloodProgress2View;
   import com.aurora.ui.maogoutd.game.GameBossBloodProgressView;
   import com.aurora.ui.maogoutd.game.GameCardView;
   import com.aurora.ui.maogoutd.game.GameDoubleBossBloodProgressView;
   import com.aurora.ui.maogoutd.game.GameEndResultAlertView;
   import com.aurora.ui.maogoutd.game.GameEnterExtraStageView;
   import com.aurora.ui.maogoutd.game.GamePropsBoxView;
   import com.aurora.ui.maogoutd.game.HelmetScoopAreaView;
   import com.aurora.ui.maogoutd.game.MoveIntruderWaveNumberIndicatorView;
   import com.aurora.ui.maogoutd.game.UserInfoPanelView;
   import com.aurora.ui.maogoutd.game.Util.BattleRegisterUtil;
   import com.aurora.ui.maogoutd.game.WeaponSkillPanel;
   import com.aurora.ui.maogoutd.game.a_3411;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.IResource;
   import com.aurora.ui.maogoutd.resource.Intruder.TestBaseMoveIntruder;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4269;
   import com.aurora.ui.maogoutd.resource.avatar.GirlAvatarDefenseMovie;
   import com.aurora.ui.maogoutd.resource.avatar.IBattleAnim;
   import com.aurora.ui.maogoutd.resource.avatar.a_3919;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.windrider.MouseScareHandler;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.defender.a_3959;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.defender.a_3971;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import com.aurora.ui.maogoutd.resource.defender.a_4012;
   import com.aurora.ui.maogoutd.resource.defender.test.TestBaseDefense;
   import com.aurora.ui.maogoutd.resource.effect.AurShadow;
   import com.aurora.ui.maogoutd.resource.effect.a_4124;
   import com.aurora.ui.maogoutd.resource.effect.a_4128;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import com.aurora.ui.maogoutd.resource.energy.a_4162;
   import com.aurora.ui.maogoutd.resource.gamemap.BaseGameMap;
   import com.aurora.ui.maogoutd.resource.gamemap.a_4187;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.BaseGameMoveMap;
   import com.aurora.ui.maogoutd.resource.props.DropStuffDisplayEffect;
   import com.aurora.ui.maogoutd.resource.props.EffectObjectValue;
   import com.aurora.ui.maogoutd.resource.props.EnmPropEffectType;
   import com.aurora.ui.maogoutd.resource.props.IBaseProp;
   import com.aurora.ui.maogoutd.resource.shot.a_4388;
   import com.aurora.ui.maogoutd.resource.skill.BaseSkill;
   import com.aurora.ui.maogoutd.resource.skill.IWeaponSkill;
   import com.aurora.ui.maogoutd.resource.sound.a_4403;
   import com.aurora.ui.maogoutd.resource.sound.a_4404;
   import com.aurora.ui.maogoutd.resource.tools.MapPuddleBitmap;
   import com.aurora.ui.maogoutd.resource.tools.a_4427;
   import com.aurora.ui.maogoutd.role.a_4463;
   import com.aurora.ui.maogoutd.version.VersionMD5;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.media.SoundChannel;
   import flash.net.SharedObject;
   import flash.net.URLRequest;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.ui.Keyboard;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class TDGame2V2BattleUI extends a_3411 implements b_147
   {
      
      public static var a_921:TDGame2V2BattleUI;
      
      public static var a_1088:b_150;
      
      public static var m_stGameStartNotify:a_2695;
      
      public static var ms_arrMapInfoDataArray:Array = [];
      
      private static const KEY_2:int = 50;
      
      private static const KEY_9:int = 57;
      
      public var m_stGameMapResource:BaseGameMap;
      
      public var m_arrGameMapArray:Array = [];
      
      public var m_stCardGrowPanelView:CardGrowPanelView;
      
      public var m_stBattleFieldFor4View:BattleFieldFor4View;
      
      public var m_stMaskSprite:Sprite;
      
      public var m_stUserInfoPanel:UserInfoPanelView;
      
      public var m_stExitButton:SimpleButton;
      
      public var m_stRequestNewEnemyWaveButton:SimpleButton;
      
      public var m_stIntruderWaveIndicatorView:MoveIntruderWaveNumberIndicatorView;
      
      public var m_stMouseIntruderWaveAlert:a_4427;
      
      public var m_stGamePropsBoxView:GamePropsBoxView;
      
      public var m_stExitGameConfirmView:ExitGameConfirmView;
      
      public var m_stEnterExtraStageConfirmView:GameEnterExtraStageView;
      
      public var m_stGameBossBloodProgressView:GameBossBloodProgressView;
      
      public var m_stGameBossBloodProgress2View:GameBossBloodProgress2View;
      
      public var m_stDPSView:GameBattleDPSView;
      
      public var m_stGameDoubleBossBloodProgressView:GameDoubleBossBloodProgressView;
      
      public var m_stWeaponSkillPanel:WeaponSkillPanel;
      
      private var m_stGameIMUI:DisplayObject;
      
      public var m_stPlaceAvatarAlert:MovieClip;
      
      public var m_stGameResultAlert:GameEndResultAlertView;
      
      public var m_stGameBattleCountDownView:GameBattleCountDownView;
      
      public var m_stGamePickedCardPackageView:DisplayObject;
      
      public var m_arrPlayerDetailInfos:Array;
      
      public var m_stSittedPlayerStatus:Array;
      
      public var m_arrPlayerAvatarDetailInfo:Array;
      
      public var m_iMyTeamId:int;
      
      public var m_iMySitID:int;
      
      public var m_stGameData:Object = [];
      
      public var m_arrGamePropArray:Array = [];
      
      public var m_arrAvatarResArray:Array = [];
      
      public var m_arrVersionArray:Array = [];
      
      public var m_stAvatar:a_3924;
      
      public var m_isExistDefensePlaceOnHand:Boolean;
      
      public var a_1189:a_4403;
      
      public var m_stBackSoundChannal:SoundChannel;
      
      private var a_1069:Timer;
      
      private var m_isOpponentVisible:Boolean;
      
      private var a_1186:Boolean = false;
      
      private var a_1665:Array = [];
      
      private var m_iShowGameResultDelayTimeout:int;
      
      private var m_iPlaceAvatarTimeoutNum:int;
      
      private var m_iPlaceAvaterTimes:int;
      
      private var m_iPlayMouseSoundTimeOutHnd:int;
      
      private var m_stSwitchBattleButtonRefer:MovieClip = new MovieClip();
      
      private var m_arrPlayerAvatarFieldGrid:Array = [];
      
      private var m_arrPlayerAvatarInfoShowTextField:Array;
      
      public var m_stGameBattleScoreView:BattleScoreView;
      
      public var m_stWeaponSkill:IWeaponSkill;
      
      public var m_arrWeaponSkillArray:Array = [];
      
      public var m_arrDropPropArray:Array = [];
      
      private var a_1010:int;
      
      private var m_iBossAppearTimes:int = 0;
      
      private var m_stBattleAnim:IBattleAnim;
      
      private var m_iLastChangePlayerEnergyValue:int = 0;
      
      private var m_iLastChangeAvatarLifeValue:int = 0;
      
      private var m_szLastAvatarInfoHtmlText:String = null;
      
      private var m_arrMapPuddleBitmapArray:Array = [];
      
      private var m_stTestBaseDefense:TestBaseDefense;
      
      private var m_stTestBaseMoveIntruder:TestBaseMoveIntruder;
      
      public var m_DIYInfo:Object;
      
      private var m_stMouseLinesView:MouseLinesView;
      
      private var dictbg:Dictionary = AnalysisBattleBGXml.Get().dictMusic;
      
      private var m_LastOnHandView:IPlaceOnHandView;
      
      private var m_lastkeyCode:int;
      
      private var m_iTime:int = 0;
      
      private var m_bWorldBossMap:Boolean = false;
      
      private var m_lWorldBossArr:Array = [8389712,8389713,8389714,8389715,8389716,8389717,8389718,8389719,8389720,8389721,8389722,8389723,8389724,8389725,8389726];
      
      private var a_1596:Array = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
      
      private var callIndex:int = 0;
      
      public function TDGame2V2BattleUI()
      {
         var i:int = 0;
         var stTxt:TextField = null;
         super();
         this.m_arrPlayerAvatarInfoShowTextField = [];
         while(i < 4)
         {
            stTxt = new TextField();
            stTxt.mouseEnabled = false;
            stTxt.selectable = false;
            stTxt.background = false;
            stTxt.backgroundColor = 16764006;
            stTxt.border = true;
            stTxt.borderColor = 3355443;
            stTxt.textColor = 0;
            stTxt.width = 100;
            stTxt.height = 35;
            stTxt.multiline = true;
            stTxt.autoSize = TextFieldAutoSize.CENTER;
            stTxt.x = 0;
            stTxt.y = 0;
            stTxt.cacheAsBitmap = true;
            this.m_arrPlayerAvatarInfoShowTextField[i] = stTxt;
            i++;
         }
         this.m_stMaskSprite = new Sprite();
         this.m_stMaskSprite.graphics.beginFill(0,0.7);
         this.m_stMaskSprite.graphics.drawRect(0,0,width,height);
         this.a_1069 = new Timer(25);
         this.a_1069.addEventListener(TimerEvent.TIMER,this.a_3416);
         this.m_stMouseIntruderWaveAlert = a_4427.a_3926();
         this.a_1797();
         a_921 = this;
         this.m_stUserInfoPanel.m_stSwitchBattleButton.addEventListener(MouseEvent.CLICK,this.OnSwitchBattleButtonClickEvent);
         this.m_stSwitchBattleButtonRefer = this.m_stUserInfoPanel.m_stSwitchBattleButtonMovie;
         if(Boolean(loaderInfo) && Boolean(loaderInfo.loader))
         {
            loaderInfo.loader.addEventListener("AvatarBreakDown",this.OnPlayerLeaveAvatarBreakDown);
            loaderInfo.loader.addEventListener("GameBattleScoreEvent",this.OnGameBattleScoreEvent);
            loaderInfo.loader.addEventListener("AurGameEnterExtraStage",this.OnGameEnterExtraStage);
            loaderInfo.loader.addEventListener("AurPlayerLaunchSkillNotify",this.OnPlayerLaunchSkillNotify);
            loaderInfo.loader.addEventListener("AurAddGameEneryNotify",this.OnAddGameEneryNotify);
            loaderInfo.loader.addEventListener("AurPlayerEnergyVlaueNotify",this.OnPlayerEnergyVlaueNotify);
         }
         this.m_stMouseLinesView = new MouseLinesView();
         this.m_stMouseLinesView.x = 730;
         this.m_stMouseLinesView.y = 50;
         this.addChild(this.m_stMouseLinesView);
         a_1789.getInstance().addEventListener(EventType.a_601,this.OnStandUp_Success);
      }
      
      protected function OnStandUp_Success(e:a_1778) : void
      {
         if(null == a_1088)
         {
            return;
         }
         var connInfo:Object = e.dataObject;
         if(a_2018.IsCrossServerLogicRoom())
         {
            a_4812.Get().a_2116();
            MessageTipHandler.Get().a_3146("房主已退出，房间强制解散！");
         }
      }
      
      public function a_1797() : Boolean
      {
         this.m_lastkeyCode = -1;
         this.m_LastOnHandView = null;
         var stAvatarInfoText:TextField = null;
         a_3491.a_1080 = 60;
         a_3491.a_1081 = 64;
         BattleFieldView.a_1011 = 9;
         BattleFieldView.a_1012 = 7;
         BattleFieldView.a_1013 = a_3491.a_1080 * BattleFieldView.a_1011;
         BattleFieldView.a_1014 = a_3491.a_1081 * BattleFieldView.a_1012;
         this.m_stUserInfoPanel.x = 0;
         this.m_stUserInfoPanel.y = 0;
         this.m_stUserInfoPanel.visible = true;
         this.m_stUserInfoPanel.m_stSmallGameDetailInfoMap.a_1797();
         BattleFieldView.a_1054 = this.m_stUserInfoPanel.m_stSmallGameDetailInfoMap;
         this.m_stGameBattleScoreView.visible = false;
         this.m_stExitGameConfirmView.visible = false;
         this.m_stEnterExtraStageConfirmView.visible = false;
         this.m_stEnterExtraStageConfirmView.x = 472;
         this.m_stEnterExtraStageConfirmView.y = 286;
         this.m_stGameBossBloodProgressView.visible = false;
         this.m_stGameBossBloodProgress2View.a_4158();
         this.m_stDPSView.visible = false;
         this.m_stGameDoubleBossBloodProgressView.visible = false;
         this.m_stPlaceAvatarAlert.visible = false;
         this.m_stPlaceAvatarAlert.gotoAndStop(1);
         this.m_stGameResultAlert.visible = false;
         this.m_stBattleFieldFor4View.m_isForbidMove = false;
         this.m_stBattleFieldFor4View.a_1797(this);
         MouseScareHandler.getInstance().clearAll();
         GameCardView.a_1089 = this;
         HelmetScoopAreaView.a_1089 = this;
         if(contains(this.m_stMaskSprite))
         {
            removeChild(this.m_stMaskSprite);
         }
         this.m_stCardGrowPanelView.a_1797(null);
         this.m_stMouseIntruderWaveAlert.a_1797();
         this.m_stMouseIntruderWaveAlert.x = (1024 - this.m_stMouseIntruderWaveAlert.width) * 0.5;
         this.m_stMouseIntruderWaveAlert.y = (600 - this.m_stMouseIntruderWaveAlert.height) * 0.5;
         addEventListener(MouseEvent.MOUSE_UP,this.a_3075);
         addEventListener(MouseEvent.MOUSE_OUT,this.OnMouseOutEvent);
         addEventListener(Event.ADDED_TO_STAGE,this.a_4534);
         addEventListener(Event.REMOVED_FROM_STAGE,this.a_4535);
         this.m_stCardGrowPanelView.a_3480(50);
         this.m_stExitButton.addEventListener(MouseEvent.CLICK,this.a_4536);
         this.m_stRequestNewEnemyWaveButton.addEventListener(MouseEvent.CLICK,this.OnRequestNewEnemyWaveButtonClick);
         this.m_stExitGameConfirmView.m_stConfirmButton.addEventListener(MouseEvent.CLICK,this.OnExitGameConfirmButtonClickEvent);
         this.m_stEnterExtraStageConfirmView.m_stContinueButton.addEventListener(MouseEvent.CLICK,this.OnEnterExtraStageConfirmButtonClick);
         this.m_stEnterExtraStageConfirmView.m_stCancelGetRewardButton.addEventListener(MouseEvent.CLICK,this.OnEnterExtraStageCancelButtonClick);
         this.m_isExistDefensePlaceOnHand = false;
         this.m_stRequestNewEnemyWaveButton.visible = false;
         for each(stAvatarInfoText in this.m_arrPlayerAvatarInfoShowTextField)
         {
            if(Boolean(stAvatarInfoText) && Boolean(stAvatarInfoText.parent))
            {
               stAvatarInfoText.parent.removeChild(stAvatarInfoText);
            }
         }
         return true;
      }
      
      override public function a_3412() : CardGrowPanelView
      {
         return this.m_stCardGrowPanelView;
      }
      
      override public function a_3413() : BattleFieldFor4View
      {
         return this.m_stBattleFieldFor4View;
      }
      
      override public function get IsExistDefensePlaceOnHand() : Boolean
      {
         return this.m_isExistDefensePlaceOnHand;
      }
      
      override public function set IsExistDefensePlaceOnHand(isExist:Boolean) : void
      {
         this.m_isExistDefensePlaceOnHand = isExist;
      }
      
      public function SetDIYInfo(iDIYInfo:Object, iMapID:int) : void
      {
         if(iDIYInfo != null)
         {
            BattleFieldView.m_iDIYCurrentBloodPercent = iDIYInfo.m_iMouseLevel * 50 + 50;
            if((iMapID & 0xF0000000) == 1610612736)
            {
               this.m_DIYInfo = iDIYInfo;
            }
            else
            {
               this.m_DIYInfo = null;
            }
         }
      }
      
      public function a_3607(stGameData:Object) : Boolean
      {
         var stLeftBattleFieldBitmapData:BitmapData = null;
         var stRightBattleFieldBitmapData:BitmapData = null;
         var stMiddleBitmapData:BitmapData = null;
         var stTempMapPuddleBitmap:MapPuddleBitmap = null;
         var stGridInfo:Object = null;
         var stFieldGrid:a_3491 = null;
         var stMapPuddleBitmap:MapPuddleBitmap = null;
         this.m_stGameData = stGameData;
         var iMapID:int = 14680064 + (this.m_stGameData["iMapID"] & 0xFFFF);
         var szMapIDStr:String = "0x" + iMapID.toString(16).toUpperCase();
         if((this.m_stGameData["iMapID"] & 0xF0000000) == 1610612736)
         {
            this.m_stGameMapResource = CompositeMapHandler.Get().GetCompositeMap();
            CompositeMapHandler.Get().GetCompositeMap().SetBattleFieldView(this.m_stBattleFieldFor4View.m_stMyBattleFieldView);
         }
         else if(CompositeMapHandler.Get().IsCompositeMap())
         {
            this.m_stGameMapResource = CompositeMapHandler.Get().GetCompositeMap();
            CompositeMapHandler.Get().GetCompositeMap().SetBattleFieldView(this.m_stBattleFieldFor4View.m_stMyBattleFieldView);
         }
         else
         {
            this.m_stGameMapResource = this.m_arrGameMapArray[szMapIDStr];
         }
         var stMapInfoData:a_4187 = this.m_stGameMapResource.a_4176();
         BattleFieldView.a_1055 = stMapInfoData.m_iBattleFieldStageType;
         a_4128.a_1413 = 1 == stMapInfoData.m_iWeatherType;
         this.m_stBattleFieldFor4View.m_stMyBattleFieldView.m_stDesertFogEffectSprite.a_1413 = 2 == stMapInfoData.m_iWeatherType;
         BattleFieldView.m_iEarthHoleType = this.IsNewMouseEarthHole() ? 2 : 1;
         this.m_stGameMapResource.szMapIDStr = szMapIDStr;
         if(0 == this.m_stGameData["byGameMode"] || 1 == this.m_stGameData["byGameMode"])
         {
            stLeftBattleFieldBitmapData = this.m_stGameMapResource.a_4174();
            stRightBattleFieldBitmapData = this.m_stGameMapResource.a_4173();
            this.m_stBattleFieldFor4View.m_isForbidMove = false;
            this.m_stBattleFieldFor4View.ResetMoveListen();
            this.m_stBattleFieldFor4View.m_stBackgroudBitmapData = this.m_stGameMapResource.a_4172();
            this.m_stBattleFieldFor4View.m_stBackgroudBitmap.bitmapData = this.m_stBattleFieldFor4View.m_stBackgroudBitmapData;
            this.m_stBattleFieldFor4View.m_stMyBattleFieldView.x = 112;
            this.m_stBattleFieldFor4View.m_stMyBattleFieldView.y = 105;
            this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.x = 595;
            this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.y = 105;
            this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.visible = true;
            this.m_isOpponentVisible = true;
            this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.m_stLargeFogEffect.visible = true;
            a_3491.a_1080 = 60;
            a_3491.a_1081 = 64;
            BattleFieldView.a_1011 = 7;
            BattleFieldView.a_1012 = 7;
            if(3 == this.m_stGameData["iMapID"])
            {
               BattleFieldView.a_1012 = 6;
            }
            BattleFieldView.a_1013 = a_3491.a_1080 * BattleFieldView.a_1011;
            BattleFieldView.a_1014 = a_3491.a_1081 * BattleFieldView.a_1012;
            if(1 == this.m_stGameData["byGameMode"])
            {
               a_3971.a_1341 = 0.6;
            }
            else
            {
               a_3971.a_1341 = 1;
            }
         }
         else
         {
            if(!(2 == this.m_stGameData["byGameMode"] || 3 == this.m_stGameData["byGameMode"]))
            {
               return false;
            }
            this.m_stBattleFieldFor4View.x = -85;
            this.m_stBattleFieldFor4View.m_isForbidMove = true;
            this.m_stBattleFieldFor4View.ResetMoveListen();
            this.m_stBattleFieldFor4View.m_stBackgroudBitmapData = this.m_stGameMapResource.a_4172();
            this.m_stBattleFieldFor4View.m_stBackgroudBitmap.bitmapData = this.m_stBattleFieldFor4View.m_stBackgroudBitmapData;
            if((this.m_stGameData["iMapID"] & 0xF0000000) != 1610612736)
            {
               stLeftBattleFieldBitmapData = this.m_stGameMapResource.a_4174();
               this.m_stBattleFieldFor4View.m_stBackgroudBitmapData.copyPixels(stLeftBattleFieldBitmapData,stLeftBattleFieldBitmapData.rect,new Point(293,100));
            }
            this.m_stBattleFieldFor4View.m_stMyBattleFieldView.x = 387;
            this.m_stBattleFieldFor4View.m_stMyBattleFieldView.y = 105;
            this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.x = 1115;
            this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.y = 105;
            this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.visible = false;
            this.m_isOpponentVisible = false;
            this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.m_stLargeFogEffect.visible = false;
            a_3491.a_1080 = 60;
            a_3491.a_1081 = 64;
            BattleFieldView.a_1011 = 9;
            BattleFieldView.a_1012 = 7;
            if(3 == this.m_stGameData["iMapID"])
            {
               BattleFieldView.a_1012 = 6;
            }
            BattleFieldView.a_1013 = a_3491.a_1080 * BattleFieldView.a_1011;
            BattleFieldView.a_1014 = a_3491.a_1081 * BattleFieldView.a_1012;
            if(3 == this.m_stGameData["byGameMode"])
            {
               a_3971.a_1341 = 0.6;
            }
            else
            {
               a_3971.a_1341 = 1;
            }
         }
         this.m_stBattleFieldFor4View.a_3415(stMapInfoData.m_iBattleModType,this.m_stGameMapResource.a_4175());
         this.m_stBattleFieldFor4View.m_stMyBattleFieldView.getDesertFogSprite().a_1797(this.m_stBattleFieldFor4View.m_stMyBattleFieldView);
         this.m_stGameMapResource.SetBattleFieldTerrain(this.m_stBattleFieldFor4View.m_stMyBattleFieldView);
         this.m_stGameMapResource.SetBattleFieldTerrain(this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView);
         if(this.m_arrMapPuddleBitmapArray is Array)
         {
            for each(stTempMapPuddleBitmap in this.m_arrMapPuddleBitmapArray)
            {
               stTempMapPuddleBitmap.a_3940();
            }
            this.m_arrMapPuddleBitmapArray = [];
         }
         var iOrigMapID:int = int(this.m_stGameData["iMapID"]);
         var byGameMode:int = int(this.m_stGameData["byGameMode"]);
         if(Boolean(ms_arrMapInfoDataArray[iOrigMapID]) && Boolean(ms_arrMapInfoDataArray[iOrigMapID][byGameMode]) && ms_arrMapInfoDataArray[iOrigMapID][byGameMode] is Array)
         {
            for each(stGridInfo in ms_arrMapInfoDataArray[iOrigMapID][byGameMode])
            {
               stFieldGrid = this.m_stBattleFieldFor4View.m_stMyBattleFieldView.a_3438(stGridInfo.X,stGridInfo.Y);
               if(Boolean(stFieldGrid) && 1 == stGridInfo.Type)
               {
                  stFieldGrid.m_isNeedTray = true;
                  stMapPuddleBitmap = MapPuddleBitmap.a_3926();
                  stMapPuddleBitmap.x = a_3491.a_1080 * stFieldGrid.m_iXGridNo + 0.5 * (a_3491.a_1080 - stMapPuddleBitmap.width);
                  stMapPuddleBitmap.y = a_3491.a_1081 * stFieldGrid.m_iYGridNo + 0.5 * (a_3491.a_1081 - stMapPuddleBitmap.height);
                  stFieldGrid.m_stCurrentBattbleFieldView.addChildAt(stMapPuddleBitmap,1);
                  this.m_arrMapPuddleBitmapArray.push(stMapPuddleBitmap);
               }
            }
         }
         a_4812.Get().a_3014(a_1088,this.a_1847);
         return true;
      }
      
      public function a_3600(stTDGameLogicInstance:b_150) : Boolean
      {
         this.a_1797();
         if(!stTDGameLogicInstance is b_150)
         {
            trace("stTDGameLogicInstance isnot ITDGameLogic failed.");
            return false;
         }
         a_1088 = stTDGameLogicInstance;
         GameCardView.a_1088 = stTDGameLogicInstance;
         HelmetScoopAreaView.a_1088 = stTDGameLogicInstance;
         a_3962.a_1088 = stTDGameLogicInstance;
         a_4206.a_1088 = stTDGameLogicInstance;
         a_4157.a_1088 = stTDGameLogicInstance;
         return true;
      }
      
      public function a_3601() : uint
      {
         return this.m_stBattleFieldFor4View.m_stMyBattleFieldView.iTimeIntervalNum;
      }
      
      public function a_3602() : uint
      {
         return BattleFieldView.a_1011;
      }
      
      public function a_3603(stSittedPlayersStatus:Array, arrPlayerDetailInfo:Array) : Boolean
      {
         var stPlayerDetailInfo:PlayerDetailInfo = null;
         var stRole:a_4463 = null;
         if(null == stSittedPlayersStatus)
         {
            return false;
         }
         var _loc_5:AvatarDetailInfo = null;
         this.m_iMySitID = stSittedPlayersStatus[0];
         this.m_iMyTeamId = (stSittedPlayersStatus[1] as a_2709).m_arrPlayerStatusInfo[this.m_iMySitID].m_byTeamNo;
         GlobalVariables.getInstance().m_isTeamUp = arrPlayerDetailInfo.length >= 2 ? true : false;
         if((this.m_stGameData["iMapID"] & 0xFF000000) != 1073741824 && arrPlayerDetailInfo.length == 2 && null != arrPlayerDetailInfo[1])
         {
            ReportHandler.Get().m_bIsVs = true;
            stRole = a_2161.e.GetCurrentRole() as a_4463;
            if(PlayerDetailInfo(arrPlayerDetailInfo[0]).m_iUin == stRole.m_iRoleUin)
            {
               ReportHandler.Get().m_iOpponentUin = PlayerDetailInfo(arrPlayerDetailInfo[1]).m_iUin;
            }
            else
            {
               ReportHandler.Get().m_iOpponentUin = PlayerDetailInfo(arrPlayerDetailInfo[0]).m_iUin;
            }
         }
         else
         {
            ReportHandler.Get().m_bIsVs = false;
         }
         this.m_stBattleFieldFor4View.m_stMyBattleFieldView.m_byTeamNo = this.m_iMyTeamId;
         this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.m_byTeamNo = 1 == this.m_iMyTeamId ? 0 : 1;
         a_4807.Get().AppendText("set> m_iMySitID:" + this.m_iMySitID + "  m_iMyTeamId:" + this.m_iMyTeamId);
         this.m_stSittedPlayerStatus = stSittedPlayersStatus[1].m_arrPlayerStatusInfo;
         this.m_arrPlayerDetailInfos = arrPlayerDetailInfo.slice();
         var arrPlayerDetailForPanel:Array = [];
         for each(stPlayerDetailInfo in this.m_arrPlayerDetailInfos)
         {
            if(stPlayerDetailInfo)
            {
               if(stPlayerDetailInfo.m_bySeatID == this.m_iMySitID)
               {
                  arrPlayerDetailForPanel[0] = stPlayerDetailInfo;
               }
               else if(this.m_stSittedPlayerStatus[stPlayerDetailInfo.m_bySeatID].m_byTeamNo == this.m_iMyTeamId)
               {
                  arrPlayerDetailForPanel[1] = stPlayerDetailInfo;
               }
               else if(this.m_stSittedPlayerStatus[stPlayerDetailInfo.m_bySeatID].m_byTeamNo != this.m_iMyTeamId && arrPlayerDetailForPanel[2] == null)
               {
                  arrPlayerDetailForPanel[2] = stPlayerDetailInfo;
               }
               else
               {
                  arrPlayerDetailForPanel[3] = stPlayerDetailInfo;
               }
               _loc_5 = this.m_arrPlayerAvatarDetailInfo[this.m_iMySitID] as AvatarDetailInfo;
               if(Boolean(_loc_5) && (Boolean(_loc_5.m_iCoverallType == 349191696 || _loc_5.m_iCoverallType == 349191968)) && stPlayerDetailInfo.m_bySeatID != this.m_iMySitID)
               {
                  stPlayerDetailInfo.m_szAccount = "*****";
               }
            }
         }
         this.m_stUserInfoPanel.a_3585(arrPlayerDetailForPanel);
         return true;
      }
      
      public function a_3604(arrGameResourceLoaderArray:Array, arrMySelectedCards:Array) : Boolean
      {
         var szKey:String = null;
         var strKey:String = null;
         var i:int = 0;
         var stContent:* = undefined;
         var iCardID:int = 0;
         var stResource:IResource = null;
         var stCardInfo:Object = null;
         this.m_arrVersionArray = arrMySelectedCards["VersionArray"];
         GameCardView.a_1090 = this.m_arrVersionArray;
         GameCardView.a_1091 = arrMySelectedCards[0];
         GameCardView.ms_arrCardEffectAddArray = (arrMySelectedCards[2] as AvatarDetailInfo).m_arrCardEffectAddArray;
         if(Boolean(this.m_arrVersionArray) && this.m_arrVersionArray["IntruderData"] is Array)
         {
            a_4206.ms_arrIntruderDataArray = this.m_arrVersionArray["IntruderData"];
         }
         if(Boolean(this.m_arrVersionArray) && this.m_arrVersionArray["MapInfoArrayData"] is Array)
         {
            ms_arrMapInfoDataArray = this.m_arrVersionArray["MapInfoArrayData"];
            GameBossBloodProgressView.ms_arrMapInfoDataArray = this.m_arrVersionArray["MapInfoArrayData"];
         }
         if(Boolean(this.m_arrVersionArray) && this.m_arrVersionArray["LocalizedData"] is Array)
         {
            GameBossBloodProgressView.ms_arrLocalizedDataArray = this.m_arrVersionArray["LocalizedData"];
            GameCardView.ms_arrLocalizedDataArray = this.m_arrVersionArray["LocalizedData"];
            WeaponSkillPanel.ms_arrLocalizedDataArray = this.m_arrVersionArray["LocalizedData"];
         }
         var stEncrypKey:EncrypString = new EncrypString();
         for(strKey in arrGameResourceLoaderArray)
         {
            stEncrypKey.EncrypValue = strKey;
            szKey = stEncrypKey.Value;
            stContent = arrGameResourceLoaderArray[strKey];
            if(null != stContent)
            {
               iCardID = parseInt(szKey);
               stResource = stContent.content as IResource;
               if(null != stResource)
               {
                  BattleRegisterUtil.RegisterCreator(iCardID,stResource.a_3932());
               }
               else if(stContent.content is IWeaponSkill)
               {
                  this.m_stWeaponSkill = stContent.content as IWeaponSkill;
               }
               else if(stContent.content is IBattleAnim)
               {
                  this.m_stBattleAnim = stContent.content as IBattleAnim;
               }
               else if(CompositeMapHandler.Get().IsCompositeMap())
               {
                  this.m_arrGameMapArray[szKey] = CompositeMapHandler.Get().GetCompositeMap();
               }
               else if(stContent.content is BaseGameMap)
               {
                  this.m_arrGameMapArray[szKey] = stContent.content as BaseGameMap;
               }
            }
         }
         this.m_stCardGrowPanelView.m_iLastDeathDefender = -1;
         for(i = 0; i < arrMySelectedCards[0].length; i++)
         {
            stCardInfo = arrMySelectedCards[0][i];
            if(stCardInfo.m_iCardID > 0)
            {
               this.m_stCardGrowPanelView.a_3478(stCardInfo.m_iCardID);
            }
         }
         if(arrMySelectedCards[4] is Array)
         {
            BattleFieldView.ms_arrLearnSkillCardIDArray = arrMySelectedCards[4];
            BattleFieldView.ms_arrLoverCardIDArray = arrMySelectedCards[5];
         }
         return true;
      }
      
      public function a_3605(arrGamePropLoaderArray:Array, arrMySelectedCards:Array) : Boolean
      {
         var szKey:String = null;
         var iPropID:int = 0;
         var stBaseProp:IBaseProp = null;
         for(szKey in arrGamePropLoaderArray)
         {
            if(null != arrGamePropLoaderArray[szKey])
            {
               iPropID = parseInt(szKey);
               stBaseProp = arrGamePropLoaderArray[szKey].content as IBaseProp;
               if(null != stBaseProp)
               {
                  stBaseProp.a_4323(iPropID);
                  this.m_arrGamePropArray[iPropID] = stBaseProp;
               }
            }
         }
         return true;
      }
      
      public function a_3606(arrAvatarResLoaderArray:Array, arrAvatarDetailInfoArray:Array) : Boolean
      {
         var szKey:String = null;
         var iAvatarResID:int = 0;
         var stAvatarResMovie:MovieClip = null;
         for(szKey in arrAvatarResLoaderArray)
         {
            if(null != arrAvatarResLoaderArray[szKey])
            {
               iAvatarResID = parseInt(szKey);
               stAvatarResMovie = arrAvatarResLoaderArray[szKey].content as MovieClip;
               if(null != stAvatarResMovie)
               {
                  this.m_arrAvatarResArray[iAvatarResID] = stAvatarResMovie;
               }
            }
         }
         this.m_arrPlayerAvatarDetailInfo = arrAvatarDetailInfoArray;
         GirlAvatarDefenseMovie.a_1288 = this.m_arrAvatarResArray;
         return true;
      }
      
      private function GetGameCardStarDegree(bySeatID:int, iGameCardID:int) : int
      {
         var arrPlayerCardInfo:Array = null;
         var stCardInfo:Object = null;
         var iGameCardStarDegree:int = 0;
         var stPlayerAvatarDetailInfo:AvatarDetailInfo = this.m_arrPlayerAvatarDetailInfo[bySeatID];
         if(stPlayerAvatarDetailInfo)
         {
            arrPlayerCardInfo = stPlayerAvatarDetailInfo.m_arrCardInfoArray;
            for each(stCardInfo in arrPlayerCardInfo)
            {
               if(stCardInfo.m_iCardID == iGameCardID)
               {
                  return int(stCardInfo.m_byCardDegreeLevel);
               }
            }
         }
         return iGameCardStarDegree;
      }
      
      private function GetGameCardGradeLevel(bySeatID:int, iGameCardID:int) : int
      {
         var arrPlayerCardInfo:Array = null;
         var stCardInfo:Object = null;
         var iGameCardGradeLevel:int = 0;
         var stPlayerAvatarDetailInfo:AvatarDetailInfo = this.m_arrPlayerAvatarDetailInfo[bySeatID];
         if(stPlayerAvatarDetailInfo)
         {
            arrPlayerCardInfo = stPlayerAvatarDetailInfo.m_arrCardInfoArray;
            for each(stCardInfo in arrPlayerCardInfo)
            {
               if(stCardInfo.m_iCardID == iGameCardID)
               {
                  return int(stCardInfo.m_byCardGradeLevel);
               }
            }
         }
         return iGameCardGradeLevel;
      }
      
      private function GetGameCardSkillDegree(bySeatID:int, iGameCardID:int) : int
      {
         var arrPlayerCardInfo:Array = null;
         var stCardInfo:Object = null;
         var iGameCardSkillDegree:int = 0;
         var stPlayerAvatarDetailInfo:AvatarDetailInfo = this.m_arrPlayerAvatarDetailInfo[bySeatID];
         if(stPlayerAvatarDetailInfo)
         {
            arrPlayerCardInfo = stPlayerAvatarDetailInfo.m_arrCardInfoArray;
            for each(stCardInfo in arrPlayerCardInfo)
            {
               if(stCardInfo.m_iCardID == iGameCardID)
               {
                  return int(stCardInfo.m_byCardSkillLevel);
               }
            }
         }
         return iGameCardSkillDegree;
      }
      
      private function GetGameCardEffectAddArray(bySeatID:int, iGameCardID:int, iEffectTypeID:int) : Array
      {
         var stPlayerAvatarDetailInfo:AvatarDetailInfo = this.m_arrPlayerAvatarDetailInfo[bySeatID];
         if(stPlayerAvatarDetailInfo)
         {
            return AvatarDetailInfo.getCardEffectValueArray(stPlayerAvatarDetailInfo.m_arrCardEffectAddArray,iGameCardID,iEffectTypeID);
         }
         return [];
      }
      
      private function a_4529() : Boolean
      {
         a_4012.getInstance().a_3923();
         a_4388.getInstance().a_3923();
         a_4162.getInstance().a_3923();
         a_3919.getInstance().a_3923();
         a_4255.getInstance().a_3923();
         return true;
      }
      
      public function a_3435(stGameStartNotify:a_2695) : Boolean
      {
         var arrPetSkill:Array = null;
         var arrGenSkill:Array = null;
         var stLocalObject:SharedObject = null;
         var stPlayerAvatarDetailInfo:AvatarDetailInfo = null;
         var iMapID:int = 0;
         var iCoverallType:int = 0;
         var iStatusIndex:int = 0;
         var stPlayerStatus:Object = null;
         var stWeaponSkill:IWeaponSkill = null;
         var iTeamID:int = 0;
         var time:int = 0;
         a_4206.m_iViewBuffId = stGameStartNotify.m_iBuffId;
         if(a_4206.m_iViewBuffId == 0 && (this.m_stGameData["iMapID"] & 0xF0000000) == 1879048192)
         {
            a_4206.m_iViewBuffId = a_2439.getInstance().getWorldBossBuffId();
         }
         a_4206.m_iInitTime = 0;
         a_4206.m_iRealeaseTimes = 0;
         a_2036.getInstance().m_bInBattleView = true;
         try
         {
            stLocalObject = SharedObject.getLocal("msdzls","/");
            if(stLocalObject.data.effectVolume.m_FightBgVolume >= 0)
            {
               a_4403.a_1610 = stLocalObject.data.effectVolume.m_FightBgVolume;
            }
            if(stLocalObject.data.effectVolume.m_effectVolume >= 0)
            {
               a_4404.a_1610 = stLocalObject.data.effectVolume.m_effectVolume;
            }
         }
         catch(error:Error)
         {
         }
         var loadTask:AurLoadTask = new AurLoadTask();
         loadTask.name = "TinyCardDesc";
         loadTask.url = "config/tiny_card_desc.xml?v=" + VersionMD5.Get().GetVersion("config/tiny_card_desc.xml");
         loadTask.type = EnmLoaderType.a_500;
         loadTask.isAddToCurrentAppDomain = true;
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
         a_3004.getInstance().addEventListener(EventType.a_651,this.OnCardDescFileCompleteEvent);
         a_3004.startLoad();
         this.PlayCommonBackSound();
         if(!this.a_1186)
         {
            try
            {
               BattleFieldView.a_1015.load(new URLRequest("resource/sound/commonhit.mp3"));
               BattleFieldView.a_1016.load(new URLRequest("resource/sound/helmetsound.mp3"));
               BattleFieldView.a_1017.load(new URLRequest("resource/sound/throwhitcommon.mp3"));
               BattleFieldView.a_1018.load(new URLRequest("resource/sound/throwhitlarge.mp3"));
               BattleFieldView.a_1019.load(new URLRequest("resource/sound/mouse/putong_28.mp3"));
               BattleFieldView.ms_kenShi29.load(new URLRequest("resource/sound/mouse/ken_29.mp3"));
               BattleFieldView.a_1020.load(new URLRequest("resource/sound/mouse/rushui_25.mp3"));
               BattleFieldView.a_1021.load(new URLRequest("resource/sound/mouse/xiadao_49.mp3"));
               BattleFieldView.a_1053.load(new URLRequest("resource/sound/interface/shengli_08.mp3"));
               BattleFieldView.ms_shibai09.load(new URLRequest("resource/sound/interface/shibai_09.mp3"));
               BattleFieldView.ms_naka13.load(new URLRequest("resource/sound/interface/naka_13.mp3"));
               BattleFieldView.a_1022.load(new URLRequest("resource/sound/interface/fangka_14.mp3"));
               BattleFieldView.a_1023.load(new URLRequest("resource/sound/interface/fangka_g_15.mp3"));
               BattleFieldView.a_1024.load(new URLRequest("resource/sound/interface/fangka_w_16.mp3"));
               BattleFieldView.a_1025.load(new URLRequest("resource/sound/interface/huomiao_17.mp3"));
               BattleFieldView.a_1026.load(new URLRequest("resource/sound/interface/chanzi01_19.mp3"));
               BattleFieldView.a_1027.load(new URLRequest("resource/sound/interface/chanzi01_19.mp3"));
               BattleFieldView.a_1028.load(new URLRequest("resource/sound/defense/zidan01_52.mp3"));
               BattleFieldView.a_1029.load(new URLRequest("resource/sound/defense/zidan02_21.mp3"));
               BattleFieldView.a_1030.load(new URLRequest("resource/sound/defense/touzhi01_53.mp3"));
               BattleFieldView.a_1031.load(new URLRequest("resource/sound/defense/touzhi02_82.mp3"));
               BattleFieldView.a_1032.load(new URLRequest("resource/sound/defense/kafeihu_54.mp3"));
               BattleFieldView.a_1033.load(new URLRequest("resource/sound/defense/jiazi02_56.mp3"));
               BattleFieldView.a_1034.load(new URLRequest("resource/sound/defense/hanbao_57.mp3"));
               BattleFieldView.a_1035.load(new URLRequest("resource/sound/defense/saizi_58.mp3"));
               BattleFieldView.a_1036.load(new URLRequest("resource/sound/defense/en_59.mp3"));
               BattleFieldView.a_1037.load(new URLRequest("resource/sound/defense/yadao_60.mp3"));
               BattleFieldView.a_1038.load(new URLRequest("resource/sound/defense/yuci_61.mp3"));
               BattleFieldView.a_1039.load(new URLRequest("resource/sound/defense/xiangchang_62.mp3"));
               BattleFieldView.a_1040.load(new URLRequest("resource/sound/defense/fengshan_63.mp3"));
               BattleFieldView.a_1041.load(new URLRequest("resource/sound/defense/huanxing_66.mp3"));
               BattleFieldView.a_1042.load(new URLRequest("resource/sound/defense/maomaohe_67.mp3"));
               BattleFieldView.a_1043.load(new URLRequest("resource/sound/defense/shuihu_68.mp3"));
               BattleFieldView.a_1044.load(new URLRequest("resource/sound/defense/jiubeideng_70.mp3"));
               BattleFieldView.a_1045.load(new URLRequest("resource/sound/shothit/jizhong_71.mp3"));
               BattleFieldView.a_1046.load(new URLRequest("resource/sound/shothit/jinshu01_72.mp3"));
               BattleFieldView.a_1047.load(new URLRequest("resource/sound/shothit/huoyan_74.mp3"));
               BattleFieldView.a_1048.load(new URLRequest("resource/sound/shothit/pijiubao_75.mp3"));
               BattleFieldView.a_1049.load(new URLRequest("resource/sound/shothit/jiazibao_76.mp3"));
               BattleFieldView.a_1050.load(new URLRequest("resource/sound/shothit/zhongjibao_77.mp3"));
               BattleFieldView.a_1051.load(new URLRequest("resource/sound/shothit/zadao01_78.mp3"));
               BattleFieldView.a_1052.load(new URLRequest("resource/sound/shothit/bingdong_80.mp3"));
               BattleFieldView.ms_pobing81.load(new URLRequest("resource/sound/shothit/pobing_81.mp3"));
               BattleFieldView.ms_yadianna82.load(new URLRequest("resource/sound/shothit/yadianna_82.mp3"));
               BattleFieldView.ms_tianshen83.load(new URLRequest("resource/sound/shothit/tianshen_83.mp3" + "?v=" + stage.loaderInfo.parameters.v));
               BattleFieldView.ms_tanhuanghu84.load(new URLRequest("resource/sound/shothit/tanhuanghu_84.mp3"));
               BattleFieldView.ms_dadinvshen85.load(new URLRequest("resource/sound/shothit/dadinvshen_85.mp3"));
               BattleFieldView.ms_bingjinglong_86.load(new URLRequest("resource/sound/shothit/bingjinglong_86.mp3"));
               BattleFieldView.ms_zhaocaimiao_87.load(new URLRequest("resource/sound/shothit/zhaocaimiao_87.mp3"));
               BattleFieldView.ms_huojianzhu_88.load(new URLRequest("resource/sound/shothit/huojianzhu_88.mp3"));
               BattleFieldView.ms_xueqiutu_89.load(new URLRequest("resource/sound/shothit/xueqiutu_89.mp3"));
               BattleFieldView.ms_bingshen_90.load(new URLRequest("resource/sound/shothit/bingshen_90.mp3"));
               BattleFieldView.ms_lengcuiji_91.load(new URLRequest("resource/sound/shothit/lengcuiji_91.mp3"));
               BattleFieldView.ms_lingyu_92.load(new URLRequest("resource/sound/shothit/lingyu_92.mp3"));
               BattleFieldView.ms_shizi_93.load(new URLRequest("resource/sound/shothit/shizi_93.mp3"));
            }
            catch(e:Error)
            {
            }
            this.a_1186 = true;
            this.m_stMouseLinesView.a_3079(true);
         }
         this.m_arrPlayerAvatarFieldGrid = [];
         if(this.m_stAvatar == null)
         {
            this.m_stAvatar = a_3919.getInstance().a_3920(15728641);
            this.m_stAvatar.a_3925(this.m_arrPlayerAvatarDetailInfo[this.m_iMySitID],this.m_stBattleAnim);
         }
         a_2036.getInstance().m_isFirstPlaceAvatar = true;
         if(this.m_stAvatar)
         {
            this.m_stAvatar.m_isMyPlaced = true;
            this.m_stAvatar.iDefenseTypeID = 15728641;
            this.m_stAvatar.visible = true;
            this.m_stAvatar.startDrag();
            this.m_isExistDefensePlaceOnHand = true;
            addChild(this.m_stAvatar);
            this.m_stAvatar.x = mouseX - this.m_stAvatar.width * 0.5;
            this.m_stAvatar.y = mouseY - this.m_stAvatar.height * 0.75;
            this.m_stAvatar.addEventListener(MouseEvent.CLICK,this.OnBaseAvatarMouseClick);
            addEventListener(MouseEvent.MOUSE_MOVE,this.a_3616,true);
         }
         this.a_1069.start();
         this.m_stBattleFieldFor4View.m_stMyBattleFieldView.IsOceanChapter = this.IsOceanChapter();
         this.m_stBattleFieldFor4View.m_stMyBattleFieldView.IsWonderLand = this.IsTotalWonderLandMap();
         this.m_stBattleFieldFor4View.m_stMyBattleFieldView.IsCrab = this.IsCrabMap();
         this.m_stBattleFieldFor4View.m_stMyBattleFieldView.a_3435();
         this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.a_3435();
         var arrPetNullSkill:Array = [];
         arrPetNullSkill.push([]);
         arrPetNullSkill.push([]);
         arrPetNullSkill.push([0]);
         arrPetNullSkill.push([32769,0]);
         a_4807.Get().startGame();
         a_4807.Get().AppendText("StartGame>>>> m_iMySitID:" + this.m_iMySitID);
         this.m_bWorldBossMap = false;
         var enterRoom:Object = a_2161.e.getEnterRoom();
         BattleFieldView.m_stRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
         BattleFieldView.m_stSpaceRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
         BattleFieldView.m_stUpGradeRandomSeed.setSeed(enterRoom.m_RandomSeed,1000);
         if(this.m_stGameMapResource as BaseGameMoveMap)
         {
            this.m_stBattleFieldFor4View.m_stMyBattleFieldView.RegisterMap(this.m_stGameMapResource as BaseGameMoveMap);
            (this.m_stGameMapResource as BaseGameMoveMap).SetBattleFieldView(this.m_stBattleFieldFor4View.m_stMyBattleFieldView);
         }
         else if(this.m_stGameMapResource as CompositeMap)
         {
            (this.m_stGameMapResource as CompositeMap).SetBattleFieldView(this.m_stBattleFieldFor4View.m_stMyBattleFieldView);
         }
         if(this.m_stWeaponSkill)
         {
            stPlayerAvatarDetailInfo = this.m_arrPlayerAvatarDetailInfo[this.m_iMySitID];
            arrPetSkill = stPlayerAvatarDetailInfo.m_arrPetInfoArray;
            arrGenSkill = stPlayerAvatarDetailInfo.m_arrGenInfoArray;
            iMapID = int(this.m_stGameData["iMapID"]);
            if(Boolean(this.m_stGameMapResource as BaseGameMoveMap || CompositeMapHandler.Get().IsCompositeMap() || this.m_DIYInfo != null && this.m_DIYInfo.m_bIsBanPet == true || (iMapID & 0xFF000000) == 1358954496) || Boolean(this.IsOceanChapter()) || this.IsNoPetsMap())
            {
               arrPetSkill = arrPetNullSkill;
            }
            if(this.m_DIYInfo != null && this.m_DIYInfo.m_bIsBanEquip == true || (this.m_stGameData["iMapID"] & 0xFF000000) == 1358954496)
            {
               arrGenSkill.length = 0;
            }
            this.m_stWeaponSkill.SetOwnBattleFieldView(this.m_stBattleFieldFor4View.m_stMyBattleFieldView);
            iCoverallType = stPlayerAvatarDetailInfo.m_iCoverallType;
            this.m_stWeaponSkill.a_2088(arrGenSkill,arrPetSkill,iCoverallType);
            this.m_stWeaponSkillPanel.Initialze(arrGenSkill,this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.visible);
            this.m_stWeaponSkillPanel.m_stWeaponSkill = this.m_stWeaponSkill;
            this.m_arrWeaponSkillArray[this.m_iMySitID] = this.m_stWeaponSkill;
            for(iStatusIndex = 0; iStatusIndex < this.m_stSittedPlayerStatus.length; iStatusIndex++)
            {
               stPlayerStatus = this.m_stSittedPlayerStatus[iStatusIndex];
               if(Boolean(stPlayerStatus) && Boolean(stPlayerStatus.m_byTeamNo < 2) && iStatusIndex != this.m_iMySitID)
               {
                  a_4807.Get().AppendText("iStatusIndex:" + iStatusIndex + " iTeamID:" + stPlayerStatus.m_byTeamNo);
                  stWeaponSkill = this.m_stWeaponSkill.CreateWeaponSkill();
                  iTeamID = int(stPlayerStatus.m_byTeamNo);
                  if(this.IsMyTeam(iTeamID))
                  {
                     stWeaponSkill.SetOwnBattleFieldView(this.m_stBattleFieldFor4View.m_stMyBattleFieldView);
                     stPlayerAvatarDetailInfo = this.m_arrPlayerAvatarDetailInfo[iStatusIndex];
                     arrPetSkill = stPlayerAvatarDetailInfo.m_arrPetInfoArray;
                     arrGenSkill = stPlayerAvatarDetailInfo.m_arrGenInfoArray;
                     if(this.m_DIYInfo != null && this.m_DIYInfo.m_bIsBanEquip == true || (this.m_stGameData["iMapID"] & 0xFF000000) == 1358954496)
                     {
                        arrGenSkill.length = 0;
                     }
                     if(Boolean(this.m_stGameMapResource as BaseGameMoveMap || CompositeMapHandler.Get().IsCompositeMap() || this.m_DIYInfo != null && this.m_DIYInfo.m_bIsBanPet == true || (this.m_stGameData["iMapID"] & 0xFF000000) == 1358954496) || Boolean(this.IsOceanChapter()) || this.IsNoPetsMap())
                     {
                        arrPetSkill = arrPetNullSkill;
                     }
                     stWeaponSkill.SetMyAvater(this.m_arrPlayerAvatarFieldGrid[iStatusIndex]);
                     stWeaponSkill.a_2088(arrGenSkill,arrPetSkill,iCoverallType);
                  }
                  else
                  {
                     stWeaponSkill.SetOwnBattleFieldView(this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView);
                     stPlayerAvatarDetailInfo = this.m_arrPlayerAvatarDetailInfo[iStatusIndex];
                     arrPetSkill = stPlayerAvatarDetailInfo.m_arrPetInfoArray;
                     arrGenSkill = stPlayerAvatarDetailInfo.m_arrGenInfoArray;
                     if(this.m_DIYInfo != null && this.m_DIYInfo.m_bIsBanEquip == true || (this.m_stGameData["iMapID"] & 0xFF000000) == 1358954496)
                     {
                        arrGenSkill.length = 0;
                     }
                     if(Boolean(this.m_stGameMapResource as BaseGameMoveMap || CompositeMapHandler.Get().IsCompositeMap() || this.m_DIYInfo != null && this.m_DIYInfo.m_bIsBanPet == true || (this.m_stGameData["iMapID"] & 0xFF000000) == 1358954496) || Boolean(this.IsOceanChapter()) || this.IsNoPetsMap())
                     {
                        arrPetSkill = arrPetNullSkill;
                     }
                     stWeaponSkill.SetMyAvater(this.m_arrPlayerAvatarFieldGrid[iStatusIndex]);
                     stWeaponSkill.a_2088(arrGenSkill,arrPetSkill,iCoverallType);
                  }
                  this.m_arrWeaponSkillArray[iStatusIndex] = stWeaponSkill;
               }
            }
         }
         this.m_stIntruderWaveIndicatorView.a_3563(stGameStartNotify.m_nTotalIntruderWaveNum);
         this.m_stIntruderWaveIndicatorView.visible = true;
         if((this.m_stGameData["iMapID"] & 0xF0000000) == 1610612736)
         {
            this.m_stIntruderWaveIndicatorView.visible = false;
         }
         if((this.m_stGameData["iMapID"] & 0xFF000000) == 1358954496)
         {
            this.m_stIntruderWaveIndicatorView.visible = false;
         }
         if(this.m_stGameData["iMapID"] >= 531 && this.m_stGameData["iMapID"] <= 556)
         {
            this.m_stIntruderWaveIndicatorView.visible = false;
         }
         stage.frameRate = 20;
         this.m_stCardGrowPanelView.a_3480(0);
         var stTempPlayerAvatarDetailInfo:AvatarDetailInfo = this.m_arrPlayerAvatarDetailInfo[this.m_iMySitID];
         if(stTempPlayerAvatarDetailInfo)
         {
            this.m_stCardGrowPanelView.m_stHelmetArea.SetScoopType(stTempPlayerAvatarDetailInfo.m_byShovelType);
         }
         this.m_iTime = 0;
         this.m_iPlaceAvatarTimeoutNum = setTimeout(this.DisplayPlaceAvatarAlert,1500,1);
         if(contains(this.m_stGameBattleCountDownView))
         {
            removeChild(this.m_stGameBattleCountDownView);
         }
         if(contains(this.m_stDPSView))
         {
            removeChild(this.m_stDPSView);
         }
         if((this.m_stGameData["iMapID"] & 0xF0000000) == 1879048192)
         {
            addChild(this.m_stDPSView);
            this.m_stDPSView.a_3014();
            addChild(this.m_stGameBattleCountDownView);
            this.m_stGameBattleCountDownView.a_3014(a_2037.getInstance().m_dictMapMouse[this.m_stGameData["iMapID"]].iMapTime);
         }
         else if(0 == this.m_stGameData["byGameMode"] || 1 == this.m_stGameData["byGameMode"])
         {
            this.m_stGameBattleScoreView.visible = true;
            if((this.m_stGameData["iMapID"] & 0xFF000000) == 1358954496)
            {
               this.m_stGameBattleScoreView.m_stReportBtn.visible = false;
            }
            this.m_stCardGrowPanelView.a_3479();
            this.m_stUserInfoPanel.a_3479();
            addChild(this.m_stGameBattleCountDownView);
            this.m_stGameBattleCountDownView.a_3014(180);
            this.m_stUserInfoPanel.visible = false;
         }
         else if(2 == this.m_stGameData["byGameMode"] || 3 == this.m_stGameData["byGameMode"])
         {
            if((this.m_stGameData["iMapID"] & 0xFFFF0000) > 0 && (this.m_stGameData["iMapID"] & 0xFFFF0000) < 268435456 || (this.m_stGameData["iMapID"] & 0xFF000000) == 1409286144)
            {
               addChild(this.m_stGameBattleCountDownView);
               this.m_stGameBattleCountDownView.a_3014(180);
               if((this.m_stGameData["iMapID"] & 0xFF000000) == 1409286144)
               {
                  if(((this.m_stGameData["iMapID"] & 0xFF0000) >>> 16) % 5 == 0)
                  {
                     this.m_stGameBattleCountDownView.a_3014(300);
                  }
               }
               else if(((this.m_stGameData["iMapID"] & 0xFFFF0000) >>> 16) % 5 == 0)
               {
                  this.m_stGameBattleCountDownView.a_3014(300);
               }
            }
            else if(this.m_stGameData["iMapID"] >= 10 && this.m_stGameData["iMapID"] <= 20)
            {
               addChild(this.m_stGameBattleCountDownView);
               this.m_stGameBattleCountDownView.a_3014(180);
            }
            else if((this.m_stGameData["iMapID"] & 0xF0000000) == 805306368)
            {
               addChild(this.m_stGameBattleCountDownView);
               this.m_stGameBattleCountDownView.a_3014(300);
            }
            else if(this.m_stGameData["iMapID"] >= 531 && this.m_stGameData["iMapID"] <= 556)
            {
               addChild(this.m_stGameBattleCountDownView);
               time = ConsortiaActivityConfig.Get().GetGarbonTime(this.m_stGameData["iMapID"]);
               this.m_stGameBattleCountDownView.a_3014(time);
            }
            else if((this.m_stGameData["iMapID"] & 0xF0000000) == 1610612736)
            {
               if(this.m_DIYInfo.m_iTimeLimit > 0)
               {
                  addChild(this.m_stGameBattleCountDownView);
                  this.m_stGameBattleCountDownView.a_3014(this.m_DIYInfo.m_iTimeLimit);
               }
            }
            else if(CompositeMapHandler.Get().IsCompositeMap())
            {
               addChild(this.m_stGameBattleCountDownView);
               this.m_stGameBattleCountDownView.a_3014(a_2037.getInstance().m_dictMapMouse[this.m_stGameData["iMapID"]].iMapTime);
            }
            this.m_stUserInfoPanel.visible = true;
         }
         this.a_1010 = 0;
         this.m_iBossAppearTimes = 0;
         this.m_iPlaceAvaterTimes = 0;
         if(Boolean(this.m_stGamePickedCardPackageView) && contains(this.m_stGamePickedCardPackageView))
         {
            removeChild(this.m_stGamePickedCardPackageView);
         }
         if(root)
         {
            root.addEventListener("AurBossBloodProgress",this.OnBossBloodProgressEvent);
         }
         SendCountInfoHandle.Get().SendLog(5002);
         return true;
      }
      
      public function DisplayPlaceAvatarAlert(iAlertTimes:int) : void
      {
         var stFieldGrid:a_3491 = null;
         var stMyBattleFieldView:BattleFieldView = null;
         var isFindPlace:Boolean = false;
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         ++this.m_iTime;
         if(iAlertTimes <= 3)
         {
            this.m_stPlaceAvatarAlert.visible = true;
            this.m_stPlaceAvatarAlert.gotoAndStop(iAlertTimes);
            iAlertTimes++;
            if(this.m_iPlaceAvatarTimeoutNum > 0)
            {
               clearTimeout(this.m_iPlaceAvatarTimeoutNum);
               this.m_iPlaceAvatarTimeoutNum = -1;
            }
            this.m_iPlaceAvatarTimeoutNum = setTimeout(this.DisplayPlaceAvatarAlert,1500,iAlertTimes);
         }
         else if(4 == iAlertTimes)
         {
            ++this.m_iPlaceAvaterTimes;
            this.m_stPlaceAvatarAlert.visible = false;
            if(this.m_iPlaceAvatarTimeoutNum > 0)
            {
               clearTimeout(this.m_iPlaceAvatarTimeoutNum);
               this.m_iPlaceAvatarTimeoutNum = -1;
            }
            stMyBattleFieldView = this.m_stBattleFieldFor4View.m_stMyBattleFieldView;
            isFindPlace = false;
            if(this.m_iPlaceAvaterTimes > 64)
            {
               trace("Find the avatar place failed;");
               this.a_1847(null);
            }
            iXGridNo = int(this.m_iPlaceAvaterTimes / BattleFieldView.a_1012) % BattleFieldView.a_1011;
            iYGridNo = int(Math.random() * BattleFieldView.a_1012);
            if(stMyBattleFieldView.a_3441(this.m_stAvatar,iXGridNo,iYGridNo))
            {
               isFindPlace = true;
            }
            if(isFindPlace)
            {
               this.PlaceAvatarHandle(iXGridNo,iYGridNo);
               this.PlaceAvatarCompelete();
            }
            else
            {
               this.DisplayPlaceAvatarAlert(4);
            }
         }
      }
      
      private function GetShowdowBitmap(stBattleFieldView:BattleFieldView, iXGridNo:int, iYGridNo:int) : Bitmap
      {
         var stShowdowBitmap:Bitmap = new Bitmap();
         stShowdowBitmap.x = a_3491.a_1080 * (iXGridNo + 0.1);
         stShowdowBitmap.y = a_3491.a_1081 * (iYGridNo + 1) - 25;
         stShowdowBitmap.bitmapData = AurShadow.a_4106();
         stShowdowBitmap.width = 50;
         stShowdowBitmap.height = 25;
         stShowdowBitmap.alpha = 0.6;
         var stInitialFieldGrid:a_3491 = stBattleFieldView.a_3438(iXGridNo,iYGridNo);
         stBattleFieldView.AddToBattleView(stShowdowBitmap,BattleLayerDefine.DEFENSE_SHADOW_TYPE,stInitialFieldGrid);
         if(stBattleFieldView.GetGameMoveMap())
         {
            stBattleFieldView.GetGameMoveMap().AddMoveDisplayObject(stShowdowBitmap,iXGridNo,iYGridNo);
         }
         return stShowdowBitmap;
      }
      
      public function a_3608(pendingAddMoveIntruderVector:Vector.<a_4269>, byIntruderWaveProgress:int, byWaveStatus:int, byAppearHoleCount:int, byAppearHole:int, stMouseLinesData:MouseLinesData = null) : Boolean
      {
         var pendingIntruder:a_4269 = null;
         var stAurDataEvent:a_1778 = null;
         var i:int = 0;
         var iFirstAppearTime:int = 0;
         var iBossType:int = 0;
         var iBossNum:int = 0;
         if((this.m_stGameData["iMapID"] & 0xF0000000) == 1879048192)
         {
            this.m_bWorldBossMap = true;
         }
         for each(pendingIntruder in pendingAddMoveIntruderVector)
         {
            if(pendingIntruder.m_iIntruderYGridNo < 0)
            {
               iBossNum += 1;
            }
            if(iFirstAppearTime == 0)
            {
               iFirstAppearTime = int(pendingIntruder.m_iAppearTime);
            }
            else if(iFirstAppearTime > pendingIntruder.m_iAppearTime)
            {
               iFirstAppearTime = int(pendingIntruder.m_iAppearTime);
            }
            if(this.m_lWorldBossArr.indexOf(pendingIntruder.m_iIntruderType) != -1)
            {
               this.m_bWorldBossMap = true;
            }
         }
         if(iBossNum == 1)
         {
            iBossType = 0;
         }
         else if(iBossNum == 2)
         {
            iBossType = 1;
         }
         var iPlayMouseIntruduceSoundDelay:int = (iFirstAppearTime - this.m_stBattleFieldFor4View.m_stMyBattleFieldView.iTimeIntervalNum - 20) * 50;
         if(iPlayMouseIntruduceSoundDelay < 1000)
         {
            this.PlayMouseIntruduceSound();
         }
         else
         {
            this.m_iPlayMouseSoundTimeOutHnd = setTimeout(this.PlayMouseIntruduceSound,iPlayMouseIntruduceSoundDelay);
         }
         this.m_stBattleFieldFor4View.m_stMyBattleFieldView.m_stMoveIntruderManage.a_3608(pendingAddMoveIntruderVector);
         if(this.m_bWorldBossMap)
         {
            if(byAppearHole > 0)
            {
               stAurDataEvent = new a_1778("CreateWBMouseHole");
               stAurDataEvent.dataObject = [byAppearHole,byAppearHoleCount];
               a_1789.getInstance().dispatchEvent(stAurDataEvent);
            }
         }
         else
         {
            for(i = 0; i < byAppearHoleCount; i++)
            {
               this.m_stBattleFieldFor4View.m_stMyBattleFieldView.a_3463(byAppearHole * (i + 1));
            }
            if(0 == this.m_stGameData["byGameMode"] || 1 == this.m_stGameData["byGameMode"])
            {
               this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.m_stMoveIntruderManage.a_3608(pendingAddMoveIntruderVector);
               for(i = 0; i < byAppearHoleCount; i++)
               {
                  this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.a_3463(byAppearHole * (i + 1));
               }
            }
         }
         if(byWaveStatus == 1)
         {
            this.m_stMouseIntruderWaveAlert.a_4332(0);
            addChild(this.m_stMouseIntruderWaveAlert);
         }
         else if(byWaveStatus == 2)
         {
            this.m_stMouseIntruderWaveAlert.a_4332(1);
            addChild(this.m_stMouseIntruderWaveAlert);
         }
         else if(byWaveStatus == 3)
         {
            this.m_stIntruderWaveIndicatorView.visible = false;
            if(this.m_stGameData["iMapID"] == 530)
            {
               this.m_stGameDoubleBossBloodProgressView.visible = true;
               this.m_stGameDoubleBossBloodProgressView.a_1797(this.m_stGameData["iMapID"],this.m_iBossAppearTimes);
            }
            else if((this.m_stGameData["iMapID"] & 0xFFFF0000) == 1191182336)
            {
               this.m_stGameDoubleBossBloodProgressView.visible = true;
               this.m_stGameDoubleBossBloodProgressView.a_1797(this.m_stGameData["iMapID"],this.m_iBossAppearTimes);
            }
            else if((this.m_stGameData["iMapID"] & 0xFFFF0000) == 0 || (this.m_stGameData["iMapID"] & 0xFFFF0000) == 536870912 || (this.m_stGameData["iMapID"] & 0xFF000000) == 805306368 || (this.m_stGameData["iMapID"] & 0xFF000000) == 1090519040 || (this.m_stGameData["iMapID"] & 0xFF000000) == 1107296256 || (this.m_stGameData["iMapID"] & 0xFF000000) == 1124073472 || (this.m_stGameData["iMapID"] & 0xF0000000) == 1610612736 || (this.m_stGameData["iMapID"] & 0xF0000000) == 1879048192)
            {
               if(this.m_bWorldBossMap)
               {
                  this.m_stGameBossBloodProgress2View.visible = true;
                  this.m_stDPSView.visible = true;
                  this.m_stGameBossBloodProgress2View.a_1797(this.m_stGameData["iMapID"],this.m_iBossAppearTimes,pendingAddMoveIntruderVector);
               }
               else if((this.m_stGameData["iMapID"] & 0xF0000000) == 1610612736 && iBossType == 1)
               {
                  this.m_stGameDoubleBossBloodProgressView.visible = true;
                  this.m_stGameDoubleBossBloodProgressView.a_1797(this.m_stGameData["iMapID"],this.m_iBossAppearTimes,pendingAddMoveIntruderVector);
               }
               else
               {
                  this.m_stGameBossBloodProgressView.visible = true;
                  this.m_stGameBossBloodProgressView.a_1797(this.m_stGameData["iMapID"],this.m_iBossAppearTimes,pendingAddMoveIntruderVector);
               }
            }
            else if(CompositeMapHandler.Get().IsCompositeMap())
            {
               this.m_stGameDoubleBossBloodProgressView.visible = true;
               this.m_stGameDoubleBossBloodProgressView.a_1797(this.m_stGameData["iMapID"],this.m_iBossAppearTimes);
            }
            else
            {
               this.m_stGameDoubleBossBloodProgressView.visible = true;
               this.m_stGameDoubleBossBloodProgressView.a_1797(this.m_stGameData["iMapID"],this.m_iBossAppearTimes);
            }
            this.m_stBattleFieldFor4View.m_stMyBattleFieldView.m_byIsEnterBossBattle = true;
            this.m_stGameMapResource.ChangeGameMap([1,this.m_iBossAppearTimes,this.m_stBattleFieldFor4View]);
            this.PlayBossBackSound(this.m_iBossAppearTimes);
            ++this.m_iBossAppearTimes;
         }
         this.m_stMouseLinesView.m_stMouseLinesData = stMouseLinesData;
         this.m_stIntruderWaveIndicatorView.a_3564(byIntruderWaveProgress);
         this.m_stGameMapResource.OnWaveStatusData(this.m_stIntruderWaveIndicatorView.m_iWaveNum);
         this.m_stGameMapResource.OnWaveStatusDataByServer(byWaveStatus);
         return true;
      }
      
      public function a_555(stPlaceDefender:a_2704) : Boolean
      {
         var iTeamID:int = 0;
         var isAddDefenseResult:Boolean = false;
         var stFaceRect:Rectangle = null;
         var stTrayBaseDefense:a_3962 = null;
         var stIWeaponSkill:IWeaponSkill = null;
         var stBattleFieldView:BattleFieldView = null;
         ++BattleFieldView.ms_iServerLockStep;
         var stInitialFieldGrid:a_3491 = this.m_stBattleFieldFor4View.m_stMyBattleFieldView.GetInitialFieldGrid(stPlaceDefender.m_byColumn,stPlaceDefender.m_byRow);
         var stBaseDefense:a_3962 = a_4012.getInstance().a_4013(stPlaceDefender.m_uiTypeID);
         if(null != stBaseDefense)
         {
            if(stPlaceDefender.m_iOrigSeatID >= 0)
            {
               stPlaceDefender.m_byPlayerSeatID = stPlaceDefender.m_iOrigSeatID;
            }
            stBaseDefense.m_iPlaceTimeIntervals = stPlaceDefender.m_uiTickCount;
            stBaseDefense.iDefenseTypeID = stPlaceDefender.m_uiTypeID;
            stBaseDefense.m_iDefenseGlobalID = stPlaceDefender.m_uiGlobalID;
            stBaseDefense.m_iRealDefensePrice = stPlaceDefender.m_iCost;
            stBaseDefense.m_iTickTime = (stPlaceDefender.m_iTickTime & 0xFFFFFF00) >> 8;
            stBaseDefense.m_IsCaclueCoolDown = stPlaceDefender.m_IsCaclueCoolDown;
            iTeamID = int(this.m_stSittedPlayerStatus[stPlaceDefender.m_byPlayerSeatID].m_byTeamNo);
            if(stBaseDefense is a_3924 && null != this.m_arrPlayerAvatarDetailInfo[stPlaceDefender.m_byPlayerSeatID])
            {
               (stBaseDefense as a_3924).a_3925(this.m_arrPlayerAvatarDetailInfo[stPlaceDefender.m_byPlayerSeatID],this.m_stBattleAnim);
               if(this.IsMyTeam(iTeamID))
               {
                  if(this.IsMySeatID(stPlaceDefender.m_byPlayerSeatID))
                  {
                     this.m_stAvatar = stBaseDefense as a_3924;
                     this.m_stAvatar.m_isMyPlaced = true;
                     stFaceRect = new Rectangle(28,30,this.m_stUserInfoPanel.m_stMyUserInfo.m_stAvatarFaceBitmapData.width,this.m_stUserInfoPanel.m_stMyUserInfo.m_stAvatarFaceBitmapData.height);
                     this.m_stUserInfoPanel.m_stMyUserInfo.m_stAvatarFaceBitmapData.copyPixels(this.m_stAvatar.stDisplayBitmap.bitmapData,stFaceRect,new Point(0,0));
                  }
                  else
                  {
                     stFaceRect = new Rectangle(25,25,this.m_stUserInfoPanel.m_stTeammateUserInfo.m_stAvatarFaceBitmapData.width,this.m_stUserInfoPanel.m_stTeammateUserInfo.m_stAvatarFaceBitmapData.height);
                     this.m_stUserInfoPanel.m_stTeammateUserInfo.m_stAvatarFaceBitmapData.copyPixels(stBaseDefense.stDisplayBitmap.bitmapData,stFaceRect,new Point(0,0));
                  }
               }
               else if(Boolean(this.m_arrPlayerDetailInfos[stPlaceDefender.m_byPlayerSeatID]) && this.m_stUserInfoPanel.m_stEnemyUserInfo1.m_stUserNameText.text == this.m_arrPlayerDetailInfos[stPlaceDefender.m_byPlayerSeatID].m_szPlayerName)
               {
                  stFaceRect = new Rectangle(25,25,this.m_stUserInfoPanel.m_stEnemyUserInfo1.m_stAvatarFaceBitmapData.width,this.m_stUserInfoPanel.m_stEnemyUserInfo1.m_stAvatarFaceBitmapData.height);
                  this.m_stUserInfoPanel.m_stEnemyUserInfo1.m_stAvatarFaceBitmapData.copyPixels(stBaseDefense.stDisplayBitmap.bitmapData,stFaceRect,new Point(0,0));
               }
               else if(Boolean(this.m_arrPlayerDetailInfos[stPlaceDefender.m_byPlayerSeatID]) && this.m_stUserInfoPanel.m_stEnemyUserInfo2.m_stUserNameText.text == this.m_arrPlayerDetailInfos[stPlaceDefender.m_byPlayerSeatID].m_szPlayerName)
               {
                  stFaceRect = new Rectangle(25,25,this.m_stUserInfoPanel.m_stEnemyUserInfo2.m_stAvatarFaceBitmapData.width,this.m_stUserInfoPanel.m_stEnemyUserInfo2.m_stAvatarFaceBitmapData.height);
                  this.m_stUserInfoPanel.m_stEnemyUserInfo2.m_stAvatarFaceBitmapData.copyPixels(stBaseDefense.stDisplayBitmap.bitmapData,stFaceRect,new Point(0,0));
               }
               this.m_arrPlayerAvatarFieldGrid[stPlaceDefender.m_byPlayerSeatID] = stBaseDefense as a_3924;
            }
            if(stBaseDefense is a_3924 && iTeamID != this.m_iMyTeamId && Boolean(BattleFieldView.a_1054))
            {
               BattleFieldView.a_1054.a_3575(b_203.a_438,stInitialFieldGrid.m_iXGridNo,stInitialFieldGrid.m_iYGridNo);
            }
            if(stBaseDefense is a_3924)
            {
               if(stInitialFieldGrid.m_isNeedTray)
               {
                  stTrayBaseDefense = a_4012.getInstance().a_4013(288817173);
                  if(!stTrayBaseDefense)
                  {
                     stTrayBaseDefense = a_4012.getInstance().a_4013(288817182);
                  }
                  if(!stTrayBaseDefense)
                  {
                     stTrayBaseDefense = a_4012.getInstance().a_4013(288817183);
                  }
                  if(stTrayBaseDefense)
                  {
                     if(this.IsMyTeam(iTeamID))
                     {
                        stInitialFieldGrid = this.m_stBattleFieldFor4View.m_stMyBattleFieldView.GetInitialFieldGrid(stPlaceDefender.m_byColumn,stPlaceDefender.m_byRow);
                        this.m_stBattleFieldFor4View.m_stMyBattleFieldView.a_3441(stTrayBaseDefense,stInitialFieldGrid.m_iXGridNo,stInitialFieldGrid.m_iYGridNo,true);
                        this.m_stBattleFieldFor4View.m_stMyBattleFieldView.stCheckFieldGridsVector[stInitialFieldGrid.m_iYGridNo][stInitialFieldGrid.m_iXGridNo].a_3441(stTrayBaseDefense);
                     }
                     else
                     {
                        stInitialFieldGrid = this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.GetInitialFieldGrid(stPlaceDefender.m_byColumn,stPlaceDefender.m_byRow);
                        this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.a_3441(stTrayBaseDefense,stInitialFieldGrid.m_iXGridNo,stInitialFieldGrid.m_iYGridNo,true);
                        this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.stCheckFieldGridsVector[stInitialFieldGrid.m_iYGridNo][stInitialFieldGrid.m_iXGridNo].a_3441(stTrayBaseDefense);
                     }
                  }
               }
            }
            else if(this.IsMySeatID(stPlaceDefender.m_byPlayerSeatID))
            {
               stBaseDefense.m_iBeOtherPlaced = false;
            }
            else
            {
               stBaseDefense.m_iBeOtherPlaced = true;
            }
            stBaseDefense.m_iOrigSeatID = Boolean(stPlaceDefender.m_iOrigSeatID >= 0) ? stPlaceDefender.m_iOrigSeatID : int(stPlaceDefender.m_byPlayerSeatID);
            this.TansPostStarDegree(stBaseDefense,stBaseDefense.m_iOrigSeatID,stPlaceDefender.a_1094);
            stBaseDefense.m_iRealStarDegree = stPlaceDefender.m_iTickTime == 0 ? stBaseDefense.a_1094 : stPlaceDefender.m_iTickTime & 0xFF;
            stBaseDefense.m_iSkillDegree = this.GetGameCardSkillDegree(stBaseDefense.m_iOrigSeatID,stBaseDefense.a_3512());
            stBaseDefense.m_iGradeDegree = this.GetGameCardGradeLevel(stBaseDefense.m_iOrigSeatID,stBaseDefense.a_3512());
            stBaseDefense.m_bServerIssued = true;
            stBaseDefense.m_bPlaceByUpGradeCard = Boolean(stPlaceDefender.m_iOrigSeatID >= 0);
            if(this.IsMyTeam(iTeamID))
            {
               if(stBaseDefense.m_iBeOtherPlaced)
               {
                  this.m_stBattleFieldFor4View.m_stMyBattleFieldView.a_2180();
               }
               stInitialFieldGrid = this.m_stBattleFieldFor4View.m_stMyBattleFieldView.GetInitialFieldGrid(stPlaceDefender.m_byColumn,stPlaceDefender.m_byRow);
               isAddDefenseResult = this.m_stBattleFieldFor4View.m_stMyBattleFieldView.a_3441(stBaseDefense,stInitialFieldGrid.m_iXGridNo,stInitialFieldGrid.m_iYGridNo,true);
            }
            else
            {
               stInitialFieldGrid = this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.GetInitialFieldGrid(stPlaceDefender.m_byColumn,stPlaceDefender.m_byRow);
               isAddDefenseResult = this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.a_3441(stBaseDefense,stInitialFieldGrid.m_iXGridNo,stInitialFieldGrid.m_iYGridNo,true);
            }
            if(stBaseDefense is a_3924)
            {
               stIWeaponSkill = this.m_arrWeaponSkillArray[stPlaceDefender.m_byPlayerSeatID] as IWeaponSkill;
               if(stIWeaponSkill)
               {
                  stIWeaponSkill.SetMyAvater(stBaseDefense as a_3924);
               }
            }
            if(!isAddDefenseResult)
            {
               stBaseDefense.a_3969(stBaseDefense.iLifeValue);
            }
            else
            {
               this.UpdateCardBuff(stBaseDefense,stPlaceDefender);
               this.AddFangyuBuff(stBaseDefense,stPlaceDefender.m_iProtectBuffTime);
               if(stBaseDefense is a_3924)
               {
                  stBattleFieldView = null;
                  if(this.IsMyTeam(iTeamID))
                  {
                     stBattleFieldView = this.m_stBattleFieldFor4View.m_stMyBattleFieldView;
                     if(this.IsMySeatID(stPlaceDefender.m_byPlayerSeatID))
                     {
                        this.UpdateMyAvatarInfo(stBattleFieldView,stPlaceDefender.m_byColumn,stPlaceDefender.m_byRow);
                     }
                  }
                  else
                  {
                     stBattleFieldView = this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView;
                  }
                  this.UpdateGameIMUI(stBattleFieldView,stBaseDefense as a_3924,stPlaceDefender.m_byPlayerSeatID);
               }
               if(this.IsMyTeam(iTeamID))
               {
                  this.m_stBattleFieldFor4View.m_stMyBattleFieldView.stCheckFieldGridsVector[stInitialFieldGrid.m_iYGridNo][stInitialFieldGrid.m_iXGridNo].a_3441(stBaseDefense);
               }
               else
               {
                  this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.stCheckFieldGridsVector[stInitialFieldGrid.m_iYGridNo][stInitialFieldGrid.m_iXGridNo].a_3441(stBaseDefense);
               }
            }
            return true;
         }
         trace("GetDefense failed for typeid:" + stPlaceDefender.m_uiTypeID);
         return false;
      }
      
      private function IsMySeatID(iPlayerSeatID:int) : Boolean
      {
         return iPlayerSeatID == this.m_iMySitID;
      }
      
      private function IsMyTeam(iTeamID:int) : Boolean
      {
         return iTeamID == this.m_iMyTeamId;
      }
      
      private function UpdateCardBuff(stBaseDefense:a_3962, stPlaceDefender:a_2704) : void
      {
         var iCardEffectAddValue:int = 0;
         var arrCardEffectAddValueArray:Array = null;
         var showTip:String = null;
         var atkFighter:a_3953 = null;
         var iMapID:int = 0;
         var iMapID2:int = 0;
         var iMapID3:int = 0;
         if(a_2036.getInstance().isShowGrowTimes)
         {
            showTip = "";
            showTip += " 技能: " + stBaseDefense.m_iSkillDegree;
            showTip += " 冷却: " + stBaseDefense.a_3963() / 10;
            if(stBaseDefense.m_iTickTime > 0)
            {
               showTip += " 持续: " + stBaseDefense.m_iTickTime / 1000;
            }
            if(Boolean(stBaseDefense as a_3953) && !(stBaseDefense is a_3924))
            {
               atkFighter = stBaseDefense as a_3953;
               showTip += " 攻击力: " + atkFighter.iShotHurtForEach / 10;
               showTip += " 间隔: " + atkFighter.iShotIntervalTimeNum / 20;
            }
            MessageTipHandler.Get().a_3146(showTip);
         }
         arrCardEffectAddValueArray = this.GetGameCardEffectAddArray(stPlaceDefender.m_byPlayerSeatID,stBaseDefense.a_3512(),1);
         for each(iCardEffectAddValue in arrCardEffectAddValueArray)
         {
            stBaseDefense.a_3969(-stBaseDefense.iLifeValue * iCardEffectAddValue / 100);
         }
         arrCardEffectAddValueArray = this.GetGameCardEffectAddArray(stPlaceDefender.m_byPlayerSeatID,stBaseDefense.a_3512(),2);
         for each(iCardEffectAddValue in arrCardEffectAddValueArray)
         {
            stBaseDefense.a_3969(-iCardEffectAddValue * 10);
         }
         arrCardEffectAddValueArray = this.GetGameCardEffectAddArray(stPlaceDefender.m_byPlayerSeatID,stBaseDefense.a_3512(),3);
         for each(iCardEffectAddValue in arrCardEffectAddValueArray)
         {
            if(stBaseDefense as a_3953)
            {
               (stBaseDefense as a_3953).AddShotHurtRate(iCardEffectAddValue / 100);
            }
         }
         arrCardEffectAddValueArray = this.GetGameCardEffectAddArray(stPlaceDefender.m_byPlayerSeatID,stBaseDefense.a_3512(),4);
         for each(iCardEffectAddValue in arrCardEffectAddValueArray)
         {
            if(stBaseDefense as a_3953)
            {
               (stBaseDefense as a_3953).AddShotHurtForEach(iCardEffectAddValue);
            }
         }
         if(BattleFieldView.m_SpecialMapAddPowr.indexOf(stBaseDefense.a_3512()) != -1)
         {
            if(Boolean(root) && Boolean(root.hasOwnProperty("m_stGameData")) && Boolean((root as Object).m_stGameData))
            {
               iMapID = int((root as Object).m_stGameData["iMapID"]);
               if(iMapID == 290 || iMapID == 291 || iMapID == 796 || iMapID == 797)
               {
                  if(stBaseDefense as a_3953)
                  {
                     (stBaseDefense as a_3953).AddShotHurtRate(4);
                  }
               }
            }
         }
         if(Boolean(stBaseDefense as a_3953) && Boolean(stBaseDefense.stFieldGrid) && Boolean(stBaseDefense.stFieldGrid.m_stCrispyKiteEffect))
         {
            (stBaseDefense as a_3953).AddShotHurtForEach(200);
         }
         if(BattleFieldView.m_MemPackStoreAddPower.indexOf(stBaseDefense.a_3512()) != -1)
         {
            if(Boolean(root) && Boolean(root.hasOwnProperty("m_stGameData")) && Boolean((root as Object).m_stGameData))
            {
               iMapID2 = int((root as Object).m_stGameData["iMapID"]);
               if(iMapID2 == 98 || iMapID2 == 99 || iMapID2 == 100 || iMapID2 == 33303 || iMapID2 == 612)
               {
                  if(stBaseDefense as a_3953)
                  {
                     (stBaseDefense as a_3953).AddShotHurtRate(4);
                  }
               }
            }
         }
         if(BattleFieldView.m_HoneyFactoryAddPower.indexOf(stBaseDefense.a_3512()) != -1)
         {
            if(Boolean(root) && Boolean(root.hasOwnProperty("m_stGameData")) && Boolean((root as Object).m_stGameData))
            {
               iMapID3 = int((root as Object).m_stGameData["iMapID"]);
               if((iMapID3 & 0xFFFF) == 113)
               {
                  if(stBaseDefense as a_3953)
                  {
                     (stBaseDefense as a_3953).AddShotHurtRate(10);
                  }
               }
            }
         }
         arrCardEffectAddValueArray = this.GetGameCardEffectAddArray(stPlaceDefender.m_byPlayerSeatID,stBaseDefense.a_3512(),14);
         for each(iCardEffectAddValue in arrCardEffectAddValueArray)
         {
            if(stBaseDefense as a_3953)
            {
               (stBaseDefense as a_3953).AddBaseAuxiliaryMultiplier(iCardEffectAddValue / 100);
            }
         }
         arrCardEffectAddValueArray = this.GetGameCardEffectAddArray(stPlaceDefender.m_byPlayerSeatID,stBaseDefense.a_3512(),5);
         for each(iCardEffectAddValue in arrCardEffectAddValueArray)
         {
            if(stBaseDefense as a_3953)
            {
               (stBaseDefense as a_3953).ReduceShotIntervalTime(iCardEffectAddValue);
            }
         }
         arrCardEffectAddValueArray = this.GetGameCardEffectAddArray(stPlaceDefender.m_byPlayerSeatID,stBaseDefense.a_3512(),6);
         for each(iCardEffectAddValue in arrCardEffectAddValueArray)
         {
            if(stBaseDefense as a_3953)
            {
               (stBaseDefense as a_3953).ReduceShotIntervalTime((stBaseDefense as a_3953).iShotIntervalTimeNum * iCardEffectAddValue / 100);
            }
         }
         arrCardEffectAddValueArray = this.GetGameCardEffectAddArray(stPlaceDefender.m_byPlayerSeatID,stBaseDefense.a_3512(),7);
         for each(iCardEffectAddValue in arrCardEffectAddValueArray)
         {
            if(stBaseDefense as a_3953)
            {
               (stBaseDefense as a_3953).ReduceShotIntervalTime(iCardEffectAddValue);
            }
         }
         arrCardEffectAddValueArray = this.GetGameCardEffectAddArray(stPlaceDefender.m_byPlayerSeatID,stBaseDefense.a_3512(),9);
         for each(iCardEffectAddValue in arrCardEffectAddValueArray)
         {
            if(stBaseDefense as a_3959)
            {
               (stBaseDefense as a_3959).AddHotMultiplierEffect(iCardEffectAddValue / 100);
            }
         }
         arrCardEffectAddValueArray = this.GetGameCardEffectAddArray(stPlaceDefender.m_byPlayerSeatID,stBaseDefense.a_3512(),13);
         for each(iCardEffectAddValue in arrCardEffectAddValueArray)
         {
            if(stBaseDefense as a_3959)
            {
               (stBaseDefense as a_3959).AddParabolaPathMultiplier(iCardEffectAddValue / 100);
            }
         }
         arrCardEffectAddValueArray = this.GetGameCardEffectAddArray(stPlaceDefender.m_byPlayerSeatID,stBaseDefense.a_3512(),16);
         for each(iCardEffectAddValue in arrCardEffectAddValueArray)
         {
            if(stBaseDefense as a_3959)
            {
               (stBaseDefense as a_3959).AddRotateShotMultiplier(iCardEffectAddValue / 100);
            }
            else if(stBaseDefense as a_3976)
            {
               (stBaseDefense as a_3976).AddRotateShotMultiplier(iCardEffectAddValue / 100);
            }
         }
         arrCardEffectAddValueArray = this.GetGameCardEffectAddArray(stPlaceDefender.m_byPlayerSeatID,stBaseDefense.a_3512(),11);
         for each(iCardEffectAddValue in arrCardEffectAddValueArray)
         {
            if(stBaseDefense as a_3971)
            {
               (stBaseDefense as a_3971).AddEnergyValueEachTime(iCardEffectAddValue);
            }
         }
         arrCardEffectAddValueArray = this.GetGameCardEffectAddArray(stPlaceDefender.m_byPlayerSeatID,stBaseDefense.a_3512(),12);
         for each(iCardEffectAddValue in arrCardEffectAddValueArray)
         {
            if(stBaseDefense as a_3971)
            {
               (stBaseDefense as a_3971).ReduceProduceEnergyTimeInterval(iCardEffectAddValue);
            }
         }
         arrCardEffectAddValueArray = this.GetGameCardEffectAddArray(stPlaceDefender.m_byPlayerSeatID,stBaseDefense.a_3512(),15);
         for each(iCardEffectAddValue in arrCardEffectAddValueArray)
         {
            if(stBaseDefense as a_3971)
            {
               (stBaseDefense as a_3971).AddEnergyRate(iCardEffectAddValue / 100);
            }
         }
      }
      
      private function AddFangyuBuff(baseDefense:a_3962, iProtectBuffTime:int) : void
      {
         if(!baseDefense || !baseDefense.stFieldGrid || iProtectBuffTime == 0)
         {
            return;
         }
         var hitCount:int = iProtectBuffTime % 10;
         var fangYuTick:int = iProtectBuffTime / 10 % 1000;
         var wuDiType:int = iProtectBuffTime / 10000 % 10;
         var wuDiTick:int = iProtectBuffTime / 100000 % 1000;
         if(wuDiTick > 0 && wuDiType > 0)
         {
            baseDefense.AddInvincibleBuffTime(wuDiTick,wuDiType,fangYuTick,hitCount);
         }
         else if(hitCount > 0 && fangYuTick > 0)
         {
            baseDefense.AddFangyuBuff(hitCount,fangYuTick);
         }
      }
      
      public function a_3436(stRefusePlaceDefenderNotify:a_2708) : Boolean
      {
         var stFaceRect:Rectangle = null;
         var stBaseDefense:a_3962 = null;
         var iTeamID:int = 0;
         var isAddDefenseResult:Boolean = false;
         var stFieldGrid:a_3491 = this.m_stBattleFieldFor4View.m_stMyBattleFieldView.GetInitialFieldGrid(stRefusePlaceDefenderNotify.m_byXGridNo,stRefusePlaceDefenderNotify.m_byYGridNo);
         this.m_stBattleFieldFor4View.m_stMyBattleFieldView.a_3436(stRefusePlaceDefenderNotify.m_uiTickCount,stRefusePlaceDefenderNotify.m_iDefenderTypeID,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo);
         if(15728641 == stRefusePlaceDefenderNotify.m_iDefenderTypeID)
         {
            if(this.m_stAvatar)
            {
               this.m_stAvatar.a_3940();
               this.m_stAvatar = null;
            }
            this.m_stAvatar = a_3919.getInstance().a_3920(15728641);
            this.m_stAvatar.a_3925(this.m_arrPlayerAvatarDetailInfo[this.m_iMySitID],this.m_stBattleAnim);
            if(this.m_stAvatar)
            {
               this.m_stAvatar.iDefenseTypeID = 15728641;
               this.m_stAvatar.visible = true;
               this.m_stAvatar.startDrag();
               this.m_isExistDefensePlaceOnHand = true;
               addChild(this.m_stAvatar);
               this.m_stAvatar.x = mouseX - this.m_stAvatar.width * 0.5;
               this.m_stAvatar.y = mouseY - this.m_stAvatar.height * 0.75;
               this.m_stAvatar.addEventListener(MouseEvent.CLICK,this.OnBaseAvatarMouseClick);
               addEventListener(MouseEvent.MOUSE_MOVE,this.a_3616,true);
               stFaceRect = new Rectangle(28,30,this.m_stUserInfoPanel.m_stMyUserInfo.m_stAvatarFaceBitmapData.width,this.m_stUserInfoPanel.m_stMyUserInfo.m_stAvatarFaceBitmapData.height);
               this.m_stUserInfoPanel.m_stMyUserInfo.m_stAvatarFaceBitmapData.copyPixels(this.m_stAvatar.stDisplayBitmap.bitmapData,stFaceRect,new Point(0,0));
            }
         }
         if(stRefusePlaceDefenderNotify.m_iExistDefenderTypeID > 0)
         {
            stBaseDefense = a_4012.getInstance().a_4013(stRefusePlaceDefenderNotify.m_iExistDefenderTypeID);
            if(null != stBaseDefense)
            {
               stBaseDefense.m_iPlaceTimeIntervals = stRefusePlaceDefenderNotify.m_uiTickCount;
               stBaseDefense.iDefenseTypeID = stRefusePlaceDefenderNotify.m_iExistDefenderTypeID;
               stBaseDefense.m_iDefenseGlobalID = 1;
               iTeamID = int(this.m_stSittedPlayerStatus[stRefusePlaceDefenderNotify.m_byExistOwnerSeatID].m_byTeamNo);
               if(stBaseDefense is a_3924 && null != this.m_arrPlayerAvatarDetailInfo[stRefusePlaceDefenderNotify.m_byExistOwnerSeatID])
               {
                  (stBaseDefense as a_3924).a_3925(this.m_arrPlayerAvatarDetailInfo[stRefusePlaceDefenderNotify.m_byExistOwnerSeatID],this.m_stBattleAnim);
                  if(this.IsMyTeam(iTeamID))
                  {
                     stFaceRect = new Rectangle(25,25,this.m_stUserInfoPanel.m_stTeammateUserInfo.m_stAvatarFaceBitmapData.width,this.m_stUserInfoPanel.m_stTeammateUserInfo.m_stAvatarFaceBitmapData.height);
                     this.m_stUserInfoPanel.m_stTeammateUserInfo.m_stAvatarFaceBitmapData.copyPixels(stBaseDefense.stDisplayBitmap.bitmapData,stFaceRect,new Point(0,0));
                  }
                  else if(Boolean(this.m_arrPlayerDetailInfos[stRefusePlaceDefenderNotify.m_byExistOwnerSeatID]) && this.m_stUserInfoPanel.m_stEnemyUserInfo1.m_stUserNameText.text == this.m_arrPlayerDetailInfos[stRefusePlaceDefenderNotify.m_byExistOwnerSeatID].m_szPlayerName)
                  {
                     stFaceRect = new Rectangle(25,25,this.m_stUserInfoPanel.m_stEnemyUserInfo1.m_stAvatarFaceBitmapData.width,this.m_stUserInfoPanel.m_stEnemyUserInfo1.m_stAvatarFaceBitmapData.height);
                     this.m_stUserInfoPanel.m_stEnemyUserInfo1.m_stAvatarFaceBitmapData.copyPixels(stBaseDefense.stDisplayBitmap.bitmapData,stFaceRect,new Point(0,0));
                  }
                  else if(Boolean(this.m_arrPlayerDetailInfos[stRefusePlaceDefenderNotify.m_byExistOwnerSeatID]) && this.m_stUserInfoPanel.m_stEnemyUserInfo2.m_stUserNameText.text == this.m_arrPlayerDetailInfos[stRefusePlaceDefenderNotify.m_byExistOwnerSeatID].m_szPlayerName)
                  {
                     stFaceRect = new Rectangle(25,25,this.m_stUserInfoPanel.m_stEnemyUserInfo2.m_stAvatarFaceBitmapData.width,this.m_stUserInfoPanel.m_stEnemyUserInfo2.m_stAvatarFaceBitmapData.height);
                     this.m_stUserInfoPanel.m_stEnemyUserInfo2.m_stAvatarFaceBitmapData.copyPixels(stBaseDefense.stDisplayBitmap.bitmapData,stFaceRect,new Point(0,0));
                  }
                  this.m_arrPlayerAvatarFieldGrid[stRefusePlaceDefenderNotify.m_byExistOwnerSeatID] = stBaseDefense as a_3924;
               }
               this.TansPostStarDegree(stBaseDefense,stRefusePlaceDefenderNotify.m_byExistOwnerSeatID,stRefusePlaceDefenderNotify.a_1094);
               stBaseDefense.m_iSkillDegree = this.GetGameCardSkillDegree(stRefusePlaceDefenderNotify.m_byExistOwnerSeatID,stBaseDefense.a_3512());
               stBaseDefense.m_iGradeDegree = this.GetGameCardGradeLevel(stRefusePlaceDefenderNotify.m_byExistOwnerSeatID,stBaseDefense.a_3512());
               if(this.IsMyTeam(iTeamID))
               {
                  stFieldGrid = this.m_stBattleFieldFor4View.m_stMyBattleFieldView.GetInitialFieldGrid(stRefusePlaceDefenderNotify.m_byXGridNo,stRefusePlaceDefenderNotify.m_byYGridNo);
                  isAddDefenseResult = this.m_stBattleFieldFor4View.m_stMyBattleFieldView.a_3441(stBaseDefense,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo,true);
               }
               else
               {
                  stFieldGrid = this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.GetInitialFieldGrid(stRefusePlaceDefenderNotify.m_byXGridNo,stRefusePlaceDefenderNotify.m_byYGridNo);
                  isAddDefenseResult = this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.a_3441(stBaseDefense,stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo,true);
               }
               if(!isAddDefenseResult)
               {
                  stBaseDefense.a_3969(stBaseDefense.iLifeValue);
               }
               else if(this.IsMyTeam(iTeamID))
               {
                  this.m_stBattleFieldFor4View.m_stMyBattleFieldView.stCheckFieldGridsVector[stFieldGrid.m_iYGridNo][stFieldGrid.m_iXGridNo].a_3441(stBaseDefense);
               }
               else
               {
                  this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.stCheckFieldGridsVector[stFieldGrid.m_iYGridNo][stFieldGrid.m_iXGridNo].a_3441(stBaseDefense);
               }
            }
         }
         return true;
      }
      
      private function TansPostStarDegree(defense:a_3962, SeatID:int, iStarDegree:int) : void
      {
         if(!defense)
         {
            return;
         }
         if(iStarDegree == 20 || iStarDegree == 30)
         {
            defense.a_1094 = this.GetGameCardStarDegree(SeatID,defense.a_3512());
         }
         else
         {
            defense.a_1094 = iStarDegree;
         }
         if(iStarDegree == 30)
         {
            defense.tagCom.AddTag(30037);
         }
      }
      
      public function a_3610(stPlayerEnemyVanishNotify:a_2703) : Boolean
      {
         var stVanishEnemy:CVanishEnemy = null;
         if(stPlayerEnemyVanishNotify.m_byTeamNo == this.m_iMyTeamId)
         {
            for each(stVanishEnemy in stPlayerEnemyVanishNotify.m_arrVanishEnemy)
            {
               this.m_stBattleFieldFor4View.m_stMyBattleFieldView.a_3458(stVanishEnemy);
            }
         }
         else
         {
            for each(stVanishEnemy in stPlayerEnemyVanishNotify.m_arrVanishEnemy)
            {
               this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.a_3458(stVanishEnemy);
            }
         }
         return true;
      }
      
      public function a_558(stPlayerDefenderVanishNotify:a_2702) : Boolean
      {
         var stVanishDefense:CVanishDefender = null;
         var stInitialFieldGrid:a_3491 = null;
         if(stPlayerDefenderVanishNotify.m_byTeamNo == this.m_iMyTeamId)
         {
            for each(stVanishDefense in stPlayerDefenderVanishNotify.m_arrVanishDefender)
            {
               stInitialFieldGrid = this.m_stBattleFieldFor4View.m_stMyBattleFieldView.GetInitialFieldGrid(stVanishDefense.m_byXGridNo,stVanishDefense.m_byYGridNo);
               this.m_stBattleFieldFor4View.m_stMyBattleFieldView.a_3455(stVanishDefense.m_iDefenderID,stVanishDefense.m_iDefenderTypeID,stInitialFieldGrid.m_iXGridNo,stInitialFieldGrid.m_iYGridNo,stVanishDefense.m_byIsTool);
            }
         }
         else
         {
            for each(stVanishDefense in stPlayerDefenderVanishNotify.m_arrVanishDefender)
            {
               stInitialFieldGrid = this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.GetInitialFieldGrid(stVanishDefense.m_byXGridNo,stVanishDefense.m_byYGridNo);
               this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.a_3455(stVanishDefense.m_iDefenderID,stVanishDefense.m_iDefenderTypeID,stInitialFieldGrid.m_iXGridNo,stInitialFieldGrid.m_iYGridNo,stVanishDefense.m_byIsTool);
            }
         }
         return true;
      }
      
      public function PlayerEntityStateChange(stPlayerEntityStateChangeNotify:CNotifyEntityStateChange) : Boolean
      {
         var stEntityStateChange:CEntityStateChange = null;
         var stAurDataEvent:a_1778 = null;
         for each(stEntityStateChange in stPlayerEntityStateChangeNotify.m_arrChange)
         {
            if(stEntityStateChange.m_iType == 3)
            {
               stAurDataEvent = new a_1778("EntityStateChange_CustomMessage_" + stEntityStateChange.m_iGlobalID);
               stAurDataEvent.dataObject = [stEntityStateChange.m_iTypeID,stEntityStateChange.key,stEntityStateChange.value];
               a_1789.getInstance().dispatchEvent(stAurDataEvent);
            }
            else if(stEntityStateChange.m_iType == 2)
            {
               if(stPlayerEntityStateChangeNotify.m_byTeamNo == this.m_iMyTeamId)
               {
                  this.m_stBattleFieldFor4View.m_stMyBattleFieldView.MoveIntruderStateChangeByGlobalID(stEntityStateChange);
               }
               else
               {
                  this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.MoveIntruderStateChangeByGlobalID(stEntityStateChange);
               }
            }
            else if(stEntityStateChange.m_iType == 1)
            {
               if(stPlayerEntityStateChangeNotify.m_byTeamNo == this.m_iMyTeamId)
               {
                  this.m_stBattleFieldFor4View.m_stMyBattleFieldView.DefenseStateChangeByGlobalID(stEntityStateChange);
               }
               else
               {
                  this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.DefenseStateChangeByGlobalID(stEntityStateChange);
               }
            }
         }
         return true;
      }
      
      public function a_3612(stPlayerUsePropNotify:a_2707) : Boolean
      {
         var stBaseProp:IBaseProp = this.m_arrGamePropArray[stPlayerUsePropNotify.m_iGamePropID];
         var iTeamID:int = int(this.m_stSittedPlayerStatus[stPlayerUsePropNotify.m_byPlayerSeatID].m_byTeamNo);
         if(this.IsMyTeam(iTeamID))
         {
            this.a_4539(stBaseProp,stPlayerUsePropNotify,true);
         }
         else
         {
            this.a_4539(stBaseProp,stPlayerUsePropNotify,false);
         }
         return false;
      }
      
      public function a_3613(stIntruderDropGoldOrPropNotify:a_2696) : Boolean
      {
         var stInitialFieldGrid:a_3491 = null;
         var stBaseProp:IBaseProp = null;
         var stPropSprite:Sprite = null;
         var stDropStuffEffect:DropStuffDisplayEffect = null;
         var stGoldCoinEffect:a_4124 = null;
         if(stIntruderDropGoldOrPropNotify.m_uiPropID > 0)
         {
            stBaseProp = this.m_arrGamePropArray[stIntruderDropGoldOrPropNotify.m_uiPropID];
            if(null != stBaseProp)
            {
               stBaseProp.a_4325(stIntruderDropGoldOrPropNotify.m_nDropPropSequence);
               stPropSprite = stBaseProp.a_4326();
               stPropSprite.x = stIntruderDropGoldOrPropNotify.m_byColumn * a_3491.a_1080 + 0.5 * (a_3491.a_1080 - stPropSprite.width);
               stPropSprite.y = stIntruderDropGoldOrPropNotify.m_byRow * a_3491.a_1081 + 0.5 * (a_3491.a_1081 - stPropSprite.height);
               if(0 == stIntruderDropGoldOrPropNotify.m_byDropBattleID)
               {
                  stInitialFieldGrid = this.m_stBattleFieldFor4View.m_stMyBattleFieldView.GetInitialFieldGrid(stIntruderDropGoldOrPropNotify.m_byColumn,stIntruderDropGoldOrPropNotify.m_byRow);
                  this.m_stBattleFieldFor4View.m_stMyBattleFieldView.AddToBattleView(stPropSprite,BattleLayerDefine.EFFECTS_TOP_TYPE,stInitialFieldGrid);
               }
               else
               {
                  stInitialFieldGrid = this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.GetInitialFieldGrid(stIntruderDropGoldOrPropNotify.m_byColumn,stIntruderDropGoldOrPropNotify.m_byRow);
                  this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.AddToBattleView(stPropSprite,BattleLayerDefine.EFFECTS_TOP_TYPE,stInitialFieldGrid);
                  stPropSprite.x = BattleFieldView.a_1013 - stPropSprite.x;
               }
               stPropSprite.addEventListener(MouseEvent.CLICK,this.OnDropPropClickEvent);
               stPropSprite.addEventListener(MouseEvent.MOUSE_OVER,this.OnDropPropClickEvent);
               if(-1 == this.m_arrDropPropArray.indexOf(stPropSprite))
               {
                  this.m_arrDropPropArray.push(stPropSprite);
               }
               stPropSprite.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
            }
            if((stIntruderDropGoldOrPropNotify.m_uiPropID & 0xFFF00000) != 303038464)
            {
               stDropStuffEffect = DropStuffDisplayEffect.a_3926();
               stDropStuffEffect.SetStuffID(stIntruderDropGoldOrPropNotify.m_uiPropID,stIntruderDropGoldOrPropNotify.m_nDropPropSequence);
               stDropStuffEffect.x = stIntruderDropGoldOrPropNotify.m_byColumn * a_3491.a_1080 + 0.5 * (a_3491.a_1080 - stDropStuffEffect.width);
               stDropStuffEffect.y = stIntruderDropGoldOrPropNotify.m_byRow * a_3491.a_1081 + 0.5 * (a_3491.a_1081 - stDropStuffEffect.height);
               stInitialFieldGrid = this.m_stBattleFieldFor4View.m_stMyBattleFieldView.GetInitialFieldGrid(stIntruderDropGoldOrPropNotify.m_byColumn,stIntruderDropGoldOrPropNotify.m_byRow);
               this.m_stBattleFieldFor4View.m_stMyBattleFieldView.AddToBattleView(stDropStuffEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,stInitialFieldGrid);
               stDropStuffEffect.addEventListener(MouseEvent.CLICK,this.OnDropStuffClickEvent);
               stDropStuffEffect.addEventListener(MouseEvent.MOUSE_OVER,this.OnDropStuffClickEvent);
               this.m_stBattleFieldFor4View.m_stMyBattleFieldView.m_arrDropPropsArray.push(stDropStuffEffect);
            }
         }
         if(stIntruderDropGoldOrPropNotify.m_iGoldNum > 0)
         {
            stGoldCoinEffect = a_4124.a_3926();
            stGoldCoinEffect.a_1797(false);
            stGoldCoinEffect.x = stIntruderDropGoldOrPropNotify.m_byColumn * a_3491.a_1080 + 0.5 * (a_3491.a_1080 - stGoldCoinEffect.width);
            stGoldCoinEffect.y = stIntruderDropGoldOrPropNotify.m_byRow * a_3491.a_1081 + 0.5 * (a_3491.a_1081 - stGoldCoinEffect.height);
            stInitialFieldGrid = this.m_stBattleFieldFor4View.m_stMyBattleFieldView.GetInitialFieldGrid(stIntruderDropGoldOrPropNotify.m_byColumn,stIntruderDropGoldOrPropNotify.m_byRow);
            this.m_stBattleFieldFor4View.m_stMyBattleFieldView.AddToBattleView(stGoldCoinEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,stInitialFieldGrid);
            stGoldCoinEffect.m_iCoinValue = stIntruderDropGoldOrPropNotify.m_iGoldNum;
            stGoldCoinEffect.buttonMode = true;
            stGoldCoinEffect.mouseEnabled = true;
            stGoldCoinEffect.addEventListener(MouseEvent.CLICK,this.OnDropGoldCoinClickEvent);
            stGoldCoinEffect.addEventListener(MouseEvent.MOUSE_OVER,this.OnDropGoldCoinClickEvent);
            this.m_stBattleFieldFor4View.m_stMyBattleFieldView.m_arrDropCoinsArray.push(stGoldCoinEffect);
         }
         return true;
      }
      
      private function OnDropPropClickEvent(a_4730:Event) : void
      {
         var stBaseProp:IBaseProp = a_4730.currentTarget.m_stBaseProp as IBaseProp;
         if(Boolean(stBaseProp) && this.m_stGamePropsBoxView.a_3542(stBaseProp))
         {
            (a_4730.currentTarget as Sprite).removeEventListener(MouseEvent.CLICK,this.OnDropPropClickEvent);
            (a_4730.currentTarget as Sprite).removeEventListener(MouseEvent.MOUSE_OVER,this.OnDropPropClickEvent);
            a_1088.a_2067(stBaseProp.a_4324());
            stBaseProp.a_4329(a_4730.currentTarget as Sprite);
            this.m_arrDropPropArray.splice(this.m_arrDropPropArray.indexOf(a_4730.currentTarget),1);
         }
      }
      
      private function OnDropStuffClickEvent(a_4730:Event) : void
      {
         var stDropStuffEffect:DropStuffDisplayEffect = a_4730.currentTarget as DropStuffDisplayEffect;
         if(stDropStuffEffect)
         {
            stDropStuffEffect.removeEventListener(MouseEvent.CLICK,this.OnDropStuffClickEvent);
            stDropStuffEffect.removeEventListener(MouseEvent.MOUSE_OVER,this.OnDropStuffClickEvent);
            if(-1 != this.m_stBattleFieldFor4View.m_stMyBattleFieldView.m_arrDropPropsArray.indexOf(stDropStuffEffect))
            {
               this.m_stBattleFieldFor4View.m_stMyBattleFieldView.m_arrDropPropsArray.splice(this.m_stBattleFieldFor4View.m_stMyBattleFieldView.m_arrDropPropsArray.indexOf(stDropStuffEffect),1);
            }
            a_1088.a_2067(stDropStuffEffect.iDripStaffSequence);
            stDropStuffEffect.a_3940();
         }
      }
      
      private function OnDropGoldCoinClickEvent(stEvent:Event) : void
      {
         var stGoldCoinEffect:a_4124 = stEvent.currentTarget as a_4124;
         if(stGoldCoinEffect)
         {
            stGoldCoinEffect.removeEventListener(MouseEvent.CLICK,this.OnDropGoldCoinClickEvent);
            stGoldCoinEffect.removeEventListener(MouseEvent.MOUSE_OVER,this.OnDropGoldCoinClickEvent);
            if(-1 != this.m_stBattleFieldFor4View.m_stMyBattleFieldView.m_arrDropCoinsArray.indexOf(stGoldCoinEffect))
            {
               this.m_stBattleFieldFor4View.m_stMyBattleFieldView.m_arrDropCoinsArray.splice(this.m_stBattleFieldFor4View.m_stMyBattleFieldView.m_arrDropCoinsArray.indexOf(stGoldCoinEffect),1);
            }
            a_1088.a_2066(stGoldCoinEffect.m_iCoinValue);
            stGoldCoinEffect.a_3940();
         }
      }
      
      public function a_1847(stGameEndNotify:a_2694) : Boolean
      {
         var stWeaponSkill:IWeaponSkill = null;
         var stPropButtonObj:Object = null;
         var byLoseTeamID:int = 0;
         var stDisplayObj:DisplayObject = null;
         var stBaseProp:IBaseProp = null;
         this.m_stGameBattleScoreView.m_stReportView.visible = false;
         a_4206.m_iInitTime = 0;
         a_4206.m_iRealeaseTimes = 0;
         a_2036.getInstance().m_bInBattleView = false;
         a_2036.getInstance().tagCom.ClearAll();
         try
         {
            if(this.m_stBackSoundChannal)
            {
               this.m_stBackSoundChannal.stop();
            }
         }
         catch(e:Error)
         {
            trace("close game music trow exception");
         }
         if(contains(this.m_stMouseIntruderWaveAlert))
         {
            removeChild(this.m_stMouseIntruderWaveAlert);
         }
         this.a_1069.stop();
         this.m_stBattleFieldFor4View.m_stMyBattleFieldView.a_1847();
         this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.a_1847();
         for each(stWeaponSkill in this.m_arrWeaponSkillArray)
         {
            if(stWeaponSkill)
            {
               stWeaponSkill.a_2098();
               if(stWeaponSkill != this.m_stWeaponSkill)
               {
                  stWeaponSkill.a_4330();
               }
            }
         }
         this.m_arrWeaponSkillArray = [];
         if(this.m_iPlayMouseSoundTimeOutHnd > 0)
         {
            clearTimeout(this.m_iPlayMouseSoundTimeOutHnd);
            this.m_iPlayMouseSoundTimeOutHnd = -1;
         }
         if(root)
         {
            root.removeEventListener("AurBossBloodProgress",this.OnBossBloodProgressEvent);
         }
         if(contains(this.m_stMaskSprite))
         {
            removeChild(this.m_stMaskSprite);
         }
         if(stGameEndNotify)
         {
            byLoseTeamID = stGameEndNotify.m_byLoseTeamID;
            if(byLoseTeamID == this.m_iMyTeamId)
            {
               if(stGameEndNotify.m_iMapID == 2562 || stGameEndNotify.m_iMapID == 2305 || stGameEndNotify.m_iMapID >= 10 && stGameEndNotify.m_iMapID <= 20)
               {
                  this.m_stGameResultAlert.a_3524();
               }
               else
               {
                  this.m_stGameResultAlert.a_3522();
               }
               BattleFieldView.ms_shibai09.play();
               this.m_stBattleFieldFor4View.a_3417(0);
            }
            else
            {
               if((stGameEndNotify.m_iMapID & 0xF0000000) == 1879048192)
               {
                  this.m_stGameResultAlert.a_3521();
               }
               else if(stGameEndNotify.m_iMapID != 2562 && stGameEndNotify.m_iMapID != 2305 && stGameEndNotify.m_byRoundStep != 0 && stGameEndNotify.m_byRoundStep != 3)
               {
                  this.m_stGameResultAlert.a_3523();
               }
               else
               {
                  this.m_stGameResultAlert.a_3521();
               }
               BattleFieldView.a_1053.play();
               this.m_stBattleFieldFor4View.a_3417(1);
            }
            this.m_stGameResultAlert.visible = true;
            setTimeout(this.HideTheGameResultAlert,4000);
            stGameEndNotify.m_iRemainEnergy = this.m_stCardGrowPanelView.Money;
            if(this.m_iShowGameResultDelayTimeout > 0)
            {
               clearTimeout(this.m_iShowGameResultDelayTimeout);
               this.m_iShowGameResultDelayTimeout = -1;
            }
            this.m_iShowGameResultDelayTimeout = setTimeout(this.ShowGameResultDelay,7000,stGameEndNotify);
            if(this.m_stGamePickedCardPackageView)
            {
               addChild(this.m_stGamePickedCardPackageView);
            }
         }
         else
         {
            for each(stDisplayObj in this.a_1665)
            {
               stDisplayObj.visible = true;
            }
            this.a_1665 = [];
            Mouse.cursor = MouseCursor.ARROW;
            a_4128.a_1413 = false;
            if(this.m_stAvatar)
            {
               this.m_stAvatar.a_3940();
               this.m_stAvatar = null;
            }
            this.ReleaseMemory();
         }
         this.m_stGamePropsBoxView.a_3541();
         for each(stPropButtonObj in this.m_arrDropPropArray)
         {
            if(stPropButtonObj)
            {
               stBaseProp = stPropButtonObj.m_stBaseProp as IBaseProp;
               (stPropButtonObj as Sprite).removeEventListener(MouseEvent.CLICK,this.OnDropPropClickEvent);
               stBaseProp.a_4329(stPropButtonObj as Sprite);
            }
         }
         this.m_stGameMapResource.ChangeGameMap([2,0]);
         this.m_LastOnHandView = null;
         return true;
      }
      
      public function HideTheGameResultAlert() : void
      {
         this.m_stGameResultAlert.visible = false;
      }
      
      public function ShowGameResultDelay(stGameEndNotify:a_2694) : Boolean
      {
         var stDisplayObj:DisplayObject = null;
         a_4206.m_iInitTime = 0;
         a_4206.m_iRealeaseTimes = 0;
         for each(stDisplayObj in this.a_1665)
         {
            stDisplayObj.visible = true;
         }
         this.a_1665 = [];
         Mouse.cursor = MouseCursor.ARROW;
         a_4128.a_1413 = false;
         if(this.m_stAvatar)
         {
            this.m_stAvatar.a_3940();
            this.m_stAvatar = null;
         }
         return true;
      }
      
      public function ReleaseMemory() : void
      {
         var arrRegistedTypeIDs:Array = null;
         var iTypeID:int = 0;
         var stBaseAvatar:a_3924 = null;
         var stBaseMoveIntruder:a_4206 = null;
         arrRegistedTypeIDs = a_3919.getInstance().a_3922();
         for each(iTypeID in arrRegistedTypeIDs)
         {
            stBaseAvatar = a_3919.getInstance().a_3920(iTypeID);
            if(stBaseAvatar)
            {
               stBaseAvatar.a_3916();
               stBaseAvatar.a_3940();
            }
         }
         arrRegistedTypeIDs = a_4255.getInstance().a_3922();
         for each(iTypeID in arrRegistedTypeIDs)
         {
            stBaseMoveIntruder = PoolManager.getInstance().GetReleaseMoveIntruder(iTypeID);
            if(stBaseMoveIntruder)
            {
               if(stBaseMoveIntruder.m_stCurrentFieldGrid)
               {
                  stBaseMoveIntruder.a_3969(stBaseMoveIntruder.iLifeValue);
                  stBaseMoveIntruder.a_4211(stBaseMoveIntruder.iLifeValue);
               }
               stBaseMoveIntruder.a_4212();
               stBaseMoveIntruder.a_3916();
            }
         }
         this.m_stGameMapResource.a_4177();
         this.m_stBattleFieldFor4View.m_stMyBattleFieldView.getDesertFogSprite().ReleaseFog();
         TimeoutManager.getInstance().clearAllTimeouts();
      }
      
      public function a_3477(iGameCardTypeID:int) : Boolean
      {
         return this.m_stCardGrowPanelView.a_3477(iGameCardTypeID);
      }
      
      public function OtherPlayerDataNotify(byarrGameDataByteArray:ByteArray) : Boolean
      {
         return true;
      }
      
      public function MyAvatarInfoText() : TextField
      {
         var stAvatarInfoText:TextField = null;
         stAvatarInfoText = this.m_arrPlayerAvatarInfoShowTextField[this.m_iMySitID] as TextField;
         if(Boolean(stAvatarInfoText) && Boolean(this.m_stAvatar.parent))
         {
            return stAvatarInfoText;
         }
         return null;
      }
      
      private function a_3615(a_4730:Event) : void
      {
      }
      
      private function PlayMouseIntruduceSound() : void
      {
         BattleFieldView.a_1019.play();
         if(this.m_iPlayMouseSoundTimeOutHnd > 0)
         {
            clearTimeout(this.m_iPlayMouseSoundTimeOutHnd);
            this.m_iPlayMouseSoundTimeOutHnd = -1;
         }
      }
      
      private function PlayCommonBackSound() : void
      {
         if(this.m_stBackSoundChannal)
         {
            this.m_stBackSoundChannal.stop();
         }
         try
         {
            this.a_1189 = new a_4403();
            if(this.dictbg[this.m_stGameData["iMapID"]] != null)
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/" + this.dictbg[this.m_stGameData["iMapID"]].CommBG + "?v=" + stage.loaderInfo.parameters.v));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else if(this.IsWonderLandMap())
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/alice_day_1.mp3?v=" + stage.loaderInfo.parameters.v));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else if(1 == BattleFieldView.a_1055)
            {
               if(260 == this.m_stGameData["iMapID"] || 772 == this.m_stGameData["iMapID"] || 4 == this.m_stGameData["iMapID"] || 516 == this.m_stGameData["iMapID"] || 261 == this.m_stGameData["iMapID"] || 773 == this.m_stGameData["iMapID"] || 518 == this.m_stGameData["iMapID"] || 6 == this.m_stGameData["iMapID"] || 585 == this.m_stGameData["iMapID"] || 586 == this.m_stGameData["iMapID"] || 587 == this.m_stGameData["iMapID"] || 4097 == this.m_stGameData["iMapID"] || 4609 == this.m_stGameData["iMapID"] || 7 == this.m_stGameData["iMapID"] || 519 == this.m_stGameData["iMapID"])
               {
                  this.a_1189.load(new URLRequest("resource/sound/backgound/zhandou_b_100.mp3"));
                  this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
               }
               else if(2819 == this.m_stGameData["iMapID"] || 2053 == this.m_stGameData["iMapID"] || 2054 == this.m_stGameData["iMapID"])
               {
                  this.a_1189.load(new URLRequest("resource/sound/backgound/shendian_104.mp3"));
                  this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
               }
               else if(2562 == this.m_stGameData["iMapID"] || 2305 == this.m_stGameData["iMapID"])
               {
                  this.a_1189.load(new URLRequest("resource/sound/backgound/shendian_87.mp3"));
                  this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
               }
               else if(32769 == this.m_stGameData["iMapID"] || 33027 == this.m_stGameData["iMapID"] || 36870 == this.m_stGameData["iMapID"] || 36872 == this.m_stGameData["iMapID"] || 32778 == this.m_stGameData["iMapID"] || 32780 == this.m_stGameData["iMapID"])
               {
                  this.a_1189.load(new URLRequest("resource/sound/backgound/zhandou_b_200.mp3"));
                  this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
               }
               else if(34821 == this.m_stGameData["iMapID"] || 39433 == this.m_stGameData["iMapID"] || 34830 == this.m_stGameData["iMapID"])
               {
                  this.a_1189.load(new URLRequest("resource/sound/backgound/shendian_204.mp3"));
                  this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
               }
               else if(this.IsOceanChapterDayMap())
               {
                  this.a_1189.load(new URLRequest("resource/sound/backgound/ocean_day_0.mp3"));
                  this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
               }
               else if(72 == this.m_stGameData["iMapID"] || 73 == this.m_stGameData["iMapID"] || 2060 == this.m_stGameData["iMapID"])
               {
                  this.a_1189.load(new URLRequest("resource/sound/backgound/flashcity_day_0.mp3"));
                  this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
               }
               else if(CompositeMapHandler.Get().IsCompositeMap())
               {
                  this.a_1189.load(new URLRequest(CompositeMapHandler.Get().GetCompositeMapSoundBGUrl()));
                  this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
               }
               else if(280 == this.m_stGameData["iMapID"])
               {
                  this.a_1189.load(new URLRequest("resource/sound/backgound/jiaqi_01.mp3"));
                  this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
               }
               else if(78 == this.m_stGameData["iMapID"] || 4099 == this.m_stGameData["iMapID"] || 32783 == this.m_stGameData["iMapID"])
               {
                  this.a_1189.load(new URLRequest("resource/sound/backgound/hunian_01.mp3"));
                  this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
               }
               else if(2061 == this.m_stGameData["iMapID"])
               {
                  this.a_1189.load(new URLRequest("resource/sound/backgound/alice_day_2.mp3?v=" + stage.loaderInfo.parameters.v));
                  this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
               }
               else if(83 == this.m_stGameData["iMapID"])
               {
                  this.a_1189.load(new URLRequest("resource/sound/backgound/alice_day_1.mp3?v=" + stage.loaderInfo.parameters.v));
                  this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
               }
               else if(84 == this.m_stGameData["iMapID"] || 85 == this.m_stGameData["iMapID"])
               {
                  this.a_1189.load(new URLRequest("resource/sound/backgound/alice_day_1.mp3?v=" + stage.loaderInfo.parameters.v));
                  this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
               }
               else
               {
                  this.a_1189.load(new URLRequest("resource/sound/backgound/zhandou_b_03.mp3"));
                  this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
               }
            }
            else if(260 == this.m_stGameData["iMapID"] || 772 == this.m_stGameData["iMapID"] || 4 == this.m_stGameData["iMapID"] || 516 == this.m_stGameData["iMapID"] || 261 == this.m_stGameData["iMapID"] || 773 == this.m_stGameData["iMapID"] || 518 == this.m_stGameData["iMapID"] || 6 == this.m_stGameData["iMapID"] || 585 == this.m_stGameData["iMapID"] || 586 == this.m_stGameData["iMapID"] || 587 == this.m_stGameData["iMapID"] || 4097 == this.m_stGameData["iMapID"] || 4609 == this.m_stGameData["iMapID"] || 7 == this.m_stGameData["iMapID"] || 519 == this.m_stGameData["iMapID"])
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/zhandou_y_101.mp3"));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else if(2819 == this.m_stGameData["iMapID"] || 2053 == this.m_stGameData["iMapID"] || 2054 == this.m_stGameData["iMapID"])
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/shendian_104.mp3"));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else if(2562 == this.m_stGameData["iMapID"] || 2305 == this.m_stGameData["iMapID"])
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/shendian_87.mp3"));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else if(33282 == this.m_stGameData["iMapID"] || 33540 == this.m_stGameData["iMapID"] || 37383 == this.m_stGameData["iMapID"] || 37384 == this.m_stGameData["iMapID"] || 33291 == this.m_stGameData["iMapID"] || 33293 == this.m_stGameData["iMapID"])
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/zhandou_y_201.mp3"));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else if(34821 == this.m_stGameData["iMapID"] || 39433 == this.m_stGameData["iMapID"] || 34830 == this.m_stGameData["iMapID"])
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/shendian_204.mp3"));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else if(this.IsOceanChapterNightMap())
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/ocean_night_0.mp3"));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else if(CompositeMapHandler.Get().IsCompositeMap())
            {
               this.a_1189.load(new URLRequest(CompositeMapHandler.Get().GetCompositeMapSoundBGUrl()));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else if(590 == this.m_stGameData["iMapID"] || 591 == this.m_stGameData["iMapID"] || 2567 == this.m_stGameData["iMapID"])
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/flashcity_night_0.mp3"));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else if(6657 == this.m_stGameData["iMapID"])
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/alice_day_2.mp3?v=" + stage.loaderInfo.parameters.v));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else if(598 == this.m_stGameData["iMapID"])
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/alice_day_1.mp3?v=" + stage.loaderInfo.parameters.v));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else if(790 == this.m_stGameData["iMapID"] || 33295 == this.m_stGameData["iMapID"] || 33542 == this.m_stGameData["iMapID"] || 599 == this.m_stGameData["iMapID"] || 791 == this.m_stGameData["iMapID"] || 792 == this.m_stGameData["iMapID"])
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/alice_day_2.mp3?v=" + stage.loaderInfo.parameters.v));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/zhandou_y_04.mp3"));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
         }
         catch(e:Error)
         {
         }
         this.m_stBackSoundChannal = this.a_1189.play(0,100);
      }
      
      private function PlayCommonQuickBackSound() : void
      {
         if(this.m_stBackSoundChannal)
         {
            this.m_stBackSoundChannal.stop();
         }
         try
         {
            this.a_1189 = new a_4403();
            if(this.dictbg[this.m_stGameData["iMapID"]] != null)
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/" + this.dictbg[this.m_stGameData["iMapID"]].CommQuickBG + "?v=" + stage.loaderInfo.parameters.v));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else if(this.IsWonderLandMap())
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/alice_day_1.mp3?v=" + stage.loaderInfo.parameters.v));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else if(1 == BattleFieldView.a_1055)
            {
               if(260 == this.m_stGameData["iMapID"] || 772 == this.m_stGameData["iMapID"] || 4 == this.m_stGameData["iMapID"] || 516 == this.m_stGameData["iMapID"] || 261 == this.m_stGameData["iMapID"] || 773 == this.m_stGameData["iMapID"] || 518 == this.m_stGameData["iMapID"] || 6 == this.m_stGameData["iMapID"] || 585 == this.m_stGameData["iMapID"] || 586 == this.m_stGameData["iMapID"] || 587 == this.m_stGameData["iMapID"] || 4097 == this.m_stGameData["iMapID"] || 4609 == this.m_stGameData["iMapID"] || 7 == this.m_stGameData["iMapID"] || 519 == this.m_stGameData["iMapID"])
               {
                  this.a_1189.load(new URLRequest("resource/sound/backgound/zhandou_b_102.mp3"));
                  this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
               }
               else if(2819 == this.m_stGameData["iMapID"] || 2053 == this.m_stGameData["iMapID"] || 2054 == this.m_stGameData["iMapID"])
               {
                  this.a_1189.load(new URLRequest("resource/sound/backgound/shendian_105.mp3"));
                  this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
               }
               else if(2562 == this.m_stGameData["iMapID"] || 2305 == this.m_stGameData["iMapID"])
               {
                  this.a_1189.load(new URLRequest("resource/sound/backgound/shendian_88.mp3"));
                  this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
               }
               else if(32769 == this.m_stGameData["iMapID"] || 33027 == this.m_stGameData["iMapID"] || 36870 == this.m_stGameData["iMapID"] || 36872 == this.m_stGameData["iMapID"] || 32778 == this.m_stGameData["iMapID"] || 32780 == this.m_stGameData["iMapID"])
               {
                  this.a_1189.load(new URLRequest("resource/sound/backgound/zhandou_b_202.mp3"));
                  this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
               }
               else if(34821 == this.m_stGameData["iMapID"] || 39433 == this.m_stGameData["iMapID"] || 34830 == this.m_stGameData["iMapID"])
               {
                  this.a_1189.load(new URLRequest("resource/sound/backgound/shendian_205.mp3"));
                  this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
               }
               else if(this.IsOceanChapterDayMap())
               {
                  this.a_1189.load(new URLRequest("resource/sound/backgound/ocean_day_0.mp3"));
                  this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
               }
               else if(72 == this.m_stGameData["iMapID"] || 73 == this.m_stGameData["iMapID"] || 2060 == this.m_stGameData["iMapID"])
               {
                  this.a_1189.load(new URLRequest("resource/sound/backgound/flashcity_day_0.mp3"));
                  this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
               }
               else if(2061 == this.m_stGameData["iMapID"])
               {
                  this.a_1189.load(new URLRequest("resource/sound/backgound/alice_day_2.mp3?v=" + stage.loaderInfo.parameters.v));
                  this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
               }
               else if(83 == this.m_stGameData["iMapID"])
               {
                  this.a_1189.load(new URLRequest("resource/sound/backgound/alice_day_1.mp3?v=" + stage.loaderInfo.parameters.v));
                  this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
               }
               else if(84 == this.m_stGameData["iMapID"] || 85 == this.m_stGameData["iMapID"])
               {
                  this.a_1189.load(new URLRequest("resource/sound/backgound/alice_day_1.mp3?v=" + stage.loaderInfo.parameters.v));
                  this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
               }
               else
               {
                  this.a_1189.load(new URLRequest("resource/sound/backgound/zhandou_b_83.mp3"));
                  this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
               }
            }
            else if(260 == this.m_stGameData["iMapID"] || 772 == this.m_stGameData["iMapID"] || 4 == this.m_stGameData["iMapID"] || 516 == this.m_stGameData["iMapID"] || 261 == this.m_stGameData["iMapID"] || 773 == this.m_stGameData["iMapID"] || 518 == this.m_stGameData["iMapID"] || 6 == this.m_stGameData["iMapID"] || 585 == this.m_stGameData["iMapID"] || 586 == this.m_stGameData["iMapID"] || 587 == this.m_stGameData["iMapID"] || 4097 == this.m_stGameData["iMapID"] || 4609 == this.m_stGameData["iMapID"] || 7 == this.m_stGameData["iMapID"] || 519 == this.m_stGameData["iMapID"])
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/zhandou_y_103.mp3"));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else if(2819 == this.m_stGameData["iMapID"] || 2053 == this.m_stGameData["iMapID"] || 2054 == this.m_stGameData["iMapID"])
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/shendian_105.mp3"));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else if(2562 == this.m_stGameData["iMapID"] || 2305 == this.m_stGameData["iMapID"])
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/shendian_88.mp3"));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else if(33282 == this.m_stGameData["iMapID"] || 33540 == this.m_stGameData["iMapID"] || 37383 == this.m_stGameData["iMapID"] || 37384 == this.m_stGameData["iMapID"] || 33291 == this.m_stGameData["iMapID"] || 33293 == this.m_stGameData["iMapID"])
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/zhandou_y_203.mp3"));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else if(34821 == this.m_stGameData["iMapID"] || 39433 == this.m_stGameData["iMapID"] || 34830 == this.m_stGameData["iMapID"])
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/shendian_205.mp3"));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else if(this.IsOceanChapterNightMap())
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/ocean_night_0.mp3"));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else if(590 == this.m_stGameData["iMapID"] || 591 == this.m_stGameData["iMapID"] || 2567 == this.m_stGameData["iMapID"])
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/flashcity_night_0.mp3"));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else if(598 == this.m_stGameData["iMapID"])
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/alice_day_1.mp3?v=" + stage.loaderInfo.parameters.v));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else if(6657 == this.m_stGameData["iMapID"])
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/alice_day_2.mp3?v=" + stage.loaderInfo.parameters.v));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else if(790 == this.m_stGameData["iMapID"] || 33295 == this.m_stGameData["iMapID"] || 33542 == this.m_stGameData["iMapID"] || 599 == this.m_stGameData["iMapID"] || 791 == this.m_stGameData["iMapID"] || 792 == this.m_stGameData["iMapID"])
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/alice_day_2.mp3?v=" + stage.loaderInfo.parameters.v));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/zhandou_y_84.mp3"));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
         }
         catch(e:Error)
         {
         }
         this.m_stBackSoundChannal = this.a_1189.play(0,100);
      }
      
      private function PlayBossBackSound(bossNum:int) : void
      {
         var config:Object = null;
         if(this.m_stBackSoundChannal)
         {
            this.m_stBackSoundChannal.stop();
         }
         try
         {
            this.a_1189 = new a_4403();
            if(this.dictbg[this.m_stGameData["iMapID"]] != null)
            {
               config = this.dictbg[this.m_stGameData["iMapID"]];
               if(config.BossBGArray != null)
               {
                  if(bossNum < config.BossBGArray.length)
                  {
                     this.a_1189.load(new URLRequest("resource/sound/backgound/" + config.BossBGArray[bossNum] + "?v=" + stage.loaderInfo.parameters.v));
                  }
                  else
                  {
                     this.a_1189.load(new URLRequest("resource/sound/backgound/" + config.BossBGArray[0] + "?v=" + stage.loaderInfo.parameters.v));
                  }
               }
               else
               {
                  this.a_1189.load(new URLRequest("resource/sound/backgound/" + config.BossBG + "?v=" + stage.loaderInfo.parameters.v));
               }
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else if(this.IsOceanChapter())
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/ocean_boss.mp3"));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else if(this.IsWonderLandMap())
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/alice_boss.mp3?v=" + stage.loaderInfo.parameters.v));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else if(1 == BattleFieldView.a_1055)
            {
               if(260 == this.m_stGameData["iMapID"] || 772 == this.m_stGameData["iMapID"] || 4 == this.m_stGameData["iMapID"] || 516 == this.m_stGameData["iMapID"] || 261 == this.m_stGameData["iMapID"] || 773 == this.m_stGameData["iMapID"] || 518 == this.m_stGameData["iMapID"] || 6 == this.m_stGameData["iMapID"] || 585 == this.m_stGameData["iMapID"] || 586 == this.m_stGameData["iMapID"] || 587 == this.m_stGameData["iMapID"] || 4097 == this.m_stGameData["iMapID"] || 4609 == this.m_stGameData["iMapID"] || 7 == this.m_stGameData["iMapID"] || 519 == this.m_stGameData["iMapID"] || 2819 == this.m_stGameData["iMapID"] || 2053 == this.m_stGameData["iMapID"] || 2054 == this.m_stGameData["iMapID"])
               {
                  this.a_1189.load(new URLRequest("resource/sound/backgound/boss_b_106.mp3"));
                  this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
               }
               else if(32769 == this.m_stGameData["iMapID"] || 33027 == this.m_stGameData["iMapID"] || 36870 == this.m_stGameData["iMapID"] || 36872 == this.m_stGameData["iMapID"] || 32778 == this.m_stGameData["iMapID"] || 32780 == this.m_stGameData["iMapID"] || 34821 == this.m_stGameData["iMapID"] || 34830 == this.m_stGameData["iMapID"])
               {
                  this.a_1189.load(new URLRequest("resource/sound/backgound/boss_b_206.mp3"));
                  this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
               }
               else if(CompositeMapHandler.Get().IsCompositeMap())
               {
                  this.a_1189.load(new URLRequest(CompositeMapHandler.Get().GetCompositeMapBossSoundBGUrl()));
                  this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
               }
               else if(72 == this.m_stGameData["iMapID"] || 73 == this.m_stGameData["iMapID"])
               {
                  this.a_1189.load(new URLRequest("resource/sound/backgound/flashcity_boss.mp3"));
                  this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
               }
               else if(2060 == this.m_stGameData["iMapID"])
               {
                  this.a_1189.load(new URLRequest("resource/sound/backgound/flashcity_boss_mj.mp3"));
                  this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
               }
               else if(2061 == this.m_stGameData["iMapID"])
               {
                  this.a_1189.load(new URLRequest("resource/sound/backgound/alice_boss_hz.mp3?v=" + stage.loaderInfo.parameters.v));
                  this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
               }
               else if(83 == this.m_stGameData["iMapID"])
               {
                  this.a_1189.load(new URLRequest("resource/sound/backgound/alice_boss.mp3?v=" + stage.loaderInfo.parameters.v));
                  this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
               }
               else if(84 == this.m_stGameData["iMapID"] || 85 == this.m_stGameData["iMapID"])
               {
                  this.a_1189.load(new URLRequest("resource/sound/backgound/alice_boss.mp3?v=" + stage.loaderInfo.parameters.v));
                  this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
               }
               else
               {
                  this.a_1189.load(new URLRequest("resource/sound/backgound/boss_b_85.mp3"));
                  this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
               }
            }
            else if(260 == this.m_stGameData["iMapID"] || 772 == this.m_stGameData["iMapID"] || 4 == this.m_stGameData["iMapID"] || 516 == this.m_stGameData["iMapID"] || 261 == this.m_stGameData["iMapID"] || 773 == this.m_stGameData["iMapID"] || 518 == this.m_stGameData["iMapID"] || 6 == this.m_stGameData["iMapID"] || 585 == this.m_stGameData["iMapID"] || 586 == this.m_stGameData["iMapID"] || 587 == this.m_stGameData["iMapID"] || 4097 == this.m_stGameData["iMapID"] || 4609 == this.m_stGameData["iMapID"] || 7 == this.m_stGameData["iMapID"] || 519 == this.m_stGameData["iMapID"] || 2819 == this.m_stGameData["iMapID"] || 2053 == this.m_stGameData["iMapID"] || 2054 == this.m_stGameData["iMapID"])
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/boss_y_107.mp3"));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else if(33282 == this.m_stGameData["iMapID"] || 33540 == this.m_stGameData["iMapID"] || 37383 == this.m_stGameData["iMapID"] || 37384 == this.m_stGameData["iMapID"] || 33291 == this.m_stGameData["iMapID"] || 33293 == this.m_stGameData["iMapID"] || 39433 == this.m_stGameData["iMapID"])
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/boss_y_207.mp3"));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else if(CompositeMapHandler.Get().IsCompositeMap())
            {
               this.a_1189.load(new URLRequest(CompositeMapHandler.Get().GetCompositeMapBossSoundBGUrl()));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else if(590 == this.m_stGameData["iMapID"] || 591 == this.m_stGameData["iMapID"])
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/flashcity_boss.mp3"));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else if(2567 == this.m_stGameData["iMapID"])
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/flashcity_boss_mj.mp3"));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else if(598 == this.m_stGameData["iMapID"])
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/alice_boss.mp3?v=" + stage.loaderInfo.parameters.v));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else if(6657 == this.m_stGameData["iMapID"])
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/alice_boss_hz.mp3?v=" + stage.loaderInfo.parameters.v));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else if(790 == this.m_stGameData["iMapID"] || 33295 == this.m_stGameData["iMapID"] || 33542 == this.m_stGameData["iMapID"] || 599 == this.m_stGameData["iMapID"] || 791 == this.m_stGameData["iMapID"] || 792 == this.m_stGameData["iMapID"])
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/alice_boss_hz.mp3?v=" + stage.loaderInfo.parameters.v));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
            else
            {
               this.a_1189.load(new URLRequest("resource/sound/backgound/boss_y_86.mp3"));
               this.a_1189.addEventListener(Event.COMPLETE,this.a_3615);
            }
         }
         catch(e:Error)
         {
         }
         this.m_stBackSoundChannal = this.a_1189.play(0,100);
      }
      
      private function IsOceanChapter() : Boolean
      {
         return this.IsOceanChapterDayMap() || this.IsOceanChapterNightMap();
      }
      
      private function IsNoPetsMap() : Boolean
      {
         var iMapID:int = int(this.m_stGameData["iMapID"]);
         return 94 == iMapID || 609 == iMapID || 295 == iMapID || 802 == iMapID || 35329 == iMapID || 95 == iMapID || 610 == iMapID || 32785 == iMapID || 33299 == iMapID || 2568 == iMapID;
      }
      
      private function IsWonderLandMap() : Boolean
      {
         var iMapID:int = int(this.m_stGameData["iMapID"]);
         return 81 == iMapID || 596 == iMapID || 82 == iMapID || 597 == iMapID;
      }
      
      private function IsTotalWonderLandMap() : Boolean
      {
         var iMapID:int = int(this.m_stGameData["iMapID"]);
         return 81 == iMapID || 596 == iMapID || 82 == iMapID || 597 == iMapID || 2061 == iMapID || 83 == iMapID || 598 == iMapID || 6657 == iMapID;
      }
      
      private function IsCrabMap() : Boolean
      {
         var iMapID:int = int(this.m_stGameData["iMapID"]);
         return 787 == iMapID || 788 == iMapID || 291 == iMapID || 789 == iMapID || 297 == iMapID;
      }
      
      private function IsOceanChapterDayMap() : Boolean
      {
         var iMapID:int = int(this.m_stGameData["iMapID"]);
         return 35 == iMapID || 36 == iMapID || 2057 == iMapID || 37 == iMapID || (iMapID & 0xFFFF) == 35 || (iMapID & 0xFFFF) == 36 || (iMapID & 0xFFFF) == 2057 || (iMapID & 0xFFFF) == 37 || (iMapID & 0xFFFF) == 91 || (iMapID & 0xFFFF) == 43;
      }
      
      private function IsOceanChapterNightMap() : Boolean
      {
         var iMapID:int = int(this.m_stGameData["iMapID"]);
         return 563 == iMapID || 564 == iMapID || 2564 == iMapID || (iMapID & 0xFFFF) == 563 || (iMapID & 0xFFFF) == 564 || (iMapID & 0xFFFF) == 2564 || (iMapID & 0xFFFF) == 589;
      }
      
      private function IsNewMouseEarthHole() : Boolean
      {
         var iMapID:int = int(this.m_stGameData["iMapID"]);
         return (iMapID & 0xFFFF) == 79 || (iMapID & 0xFFFF) == 594 || (iMapID & 0xFFFF) == 80 || (iMapID & 0xFFFF) == 595;
      }
      
      private function a_2196() : void
      {
         visible = false;
      }
      
      private function a_3075(a_4730:Event) : void
      {
         this.m_stBattleFieldFor4View.stopDrag();
      }
      
      private function OnMouseOutEvent(a_4730:Event) : void
      {
         if(null == stage)
         {
            return;
         }
         if(mouseX < 0 || mouseX > stage.stageWidth || mouseY < 0 || mouseY > stage.stageHeight)
         {
            this.m_stBattleFieldFor4View.stopDrag();
         }
      }
      
      private function a_4530(a_4730:Event) : void
      {
         this.m_stBattleFieldFor4View.a_3417(0);
      }
      
      private function a_4531(a_4730:Event) : void
      {
         this.m_stBattleFieldFor4View.a_3417(1);
      }
      
      private function OnKeyboardEvent(a_4730:KeyboardEvent) : void
      {
         if(a_4730.ctrlKey || a_4730.altKey || a_4730.shiftKey)
         {
            return;
         }
         if(a_4730.target.name == "inputMessageTxt")
         {
            return;
         }
         if(!this.m_stBattleFieldFor4View.m_isForbidMove && a_4730.keyCode == Keyboard.SPACE)
         {
            if(this.m_stSwitchBattleButtonRefer.currentFrame == 1)
            {
               this.m_stSwitchBattleButtonRefer.gotoAndStop(2);
               this.m_stBattleFieldFor4View.a_3417(1);
            }
            else if(this.m_stSwitchBattleButtonRefer.currentFrame == 2)
            {
               this.m_stSwitchBattleButtonRefer.gotoAndStop(1);
               this.m_stBattleFieldFor4View.a_3417(0);
            }
         }
         if(a_4730.keyCode == Keyboard.NUMPAD_1 || a_4730.keyCode == 49)
         {
            if(Boolean(this.m_LastOnHandView) && this.m_isExistDefensePlaceOnHand)
            {
               if(this.m_lastkeyCode == a_4730.keyCode)
               {
                  return;
               }
               this.m_LastOnHandView.BackToPanleGameCardOnHand();
            }
            if(Boolean(this.m_stCardGrowPanelView.m_stHelmetArea) && !this.m_isExistDefensePlaceOnHand)
            {
               this.m_stCardGrowPanelView.m_stHelmetArea.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_DOWN));
               this.m_lastkeyCode = a_4730.keyCode;
            }
         }
         else
         {
            this.HandleQuickCardHotkey(a_4730);
         }
      }
      
      private function HandleQuickCardHotkey(a_4730:KeyboardEvent) : void
      {
         if(a_4730.ctrlKey || a_4730.altKey || a_4730.shiftKey)
         {
            return;
         }
         var index:int = -1;
         if(a_4730.keyCode >= KEY_2 && a_4730.keyCode <= KEY_9)
         {
            index = a_4730.keyCode - KEY_2;
         }
         else if(a_4730.keyCode >= Keyboard.NUMPAD_2 && a_4730.keyCode <= Keyboard.NUMPAD_9)
         {
            index = a_4730.keyCode - Keyboard.NUMPAD_2;
         }
         if(index < 0)
         {
            return;
         }
         var card:GameCardView = this.m_stCardGrowPanelView.GetGameCardViewByIndex(index);
         if(!card)
         {
            return;
         }
         if(card.stGrowTimer.running || !card.buttonMode)
         {
            return;
         }
         if(Boolean(this.m_LastOnHandView) && this.m_isExistDefensePlaceOnHand)
         {
            if(this.m_lastkeyCode == a_4730.keyCode)
            {
               return;
            }
            this.m_LastOnHandView.BackToPanleGameCardOnHand();
         }
         if(this.m_isExistDefensePlaceOnHand)
         {
            return;
         }
         card.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_DOWN));
         this.m_lastkeyCode = a_4730.keyCode;
      }
      
      override public function SetLastCardViewOnHand(view:IPlaceOnHandView) : void
      {
         this.m_LastOnHandView = view;
      }
      
      private function a_4534(a_4730:Event) : void
      {
         var i:int = 0;
         var stDisplayObj:DisplayObject = null;
         var stParentObj:DisplayObjectContainer = parent is Loader ? parent.parent : parent;
         var stChildOjb:DisplayObject = this;
         while(null != stParentObj)
         {
            if(stParentObj.hasOwnProperty("stTDGameIMUI") && (stParentObj as Object).stTDGameIMUI is DisplayObject)
            {
               this.m_stGameIMUI = (stParentObj as Object).stTDGameIMUI as DisplayObject;
               Object(this.m_stGameIMUI).imDefaultUI.trade_tip.visible = false;
               addChild(this.m_stGameIMUI);
            }
            for(i = 0; i < stParentObj.numChildren; i++)
            {
               stDisplayObj = stParentObj.getChildAt(i);
               if(stDisplayObj is Loader)
               {
                  stDisplayObj = (stDisplayObj as Loader).content;
               }
               if(Boolean(stDisplayObj && stChildOjb != stDisplayObj) && Boolean(stDisplayObj.visible) && !stDisplayObj.hasOwnProperty("m_mlgbd"))
               {
                  stDisplayObj.visible = false;
                  this.a_1665.push(stDisplayObj);
               }
               if(stDisplayObj.hasOwnProperty("stTDGamePopCardPackage") && (stDisplayObj as Object).stTDGamePopCardPackage is DisplayObject)
               {
                  this.m_stGamePickedCardPackageView = (stDisplayObj as Object).stTDGamePopCardPackage;
               }
            }
            stChildOjb = stParentObj;
            stParentObj = stParentObj.parent is Loader ? stParentObj.parent.parent : stParentObj.parent;
         }
         stage.addEventListener(KeyboardEvent.KEY_DOWN,this.OnKeyboardEvent);
      }
      
      private function a_4535(a_4730:Event) : void
      {
         var stDisplayObj:DisplayObject = null;
         for each(stDisplayObj in this.a_1665)
         {
            stDisplayObj.visible = true;
         }
         this.a_1665 = [];
         this.m_stDPSView.a_4158();
         this.m_stGameBossBloodProgress2View.a_4158();
         stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.OnKeyboardEvent);
         this.m_stBattleFieldFor4View.m_stMyBattleFieldView.a_3432();
         this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.a_3432();
         MouseScareHandler.getInstance().clearAll();
         this.onRemoveTimeout();
         this.ReleaseMemory();
      }
      
      private function onRemoveTimeout() : void
      {
         if(this.m_iShowGameResultDelayTimeout > 0)
         {
            clearTimeout(this.m_iShowGameResultDelayTimeout);
            this.m_iShowGameResultDelayTimeout = -1;
            this.ShowGameResultDelay(null);
         }
         if(this.m_iPlaceAvatarTimeoutNum > 0)
         {
            clearTimeout(this.m_iPlaceAvatarTimeoutNum);
            this.m_iPlaceAvatarTimeoutNum = -1;
         }
         if(this.m_iPlayMouseSoundTimeOutHnd > 0)
         {
            clearTimeout(this.m_iPlayMouseSoundTimeOutHnd);
            this.m_iPlayMouseSoundTimeOutHnd = -1;
         }
      }
      
      private function a_4536(a_4730:Event) : void
      {
         this.m_stExitGameConfirmView.visible = true;
      }
      
      private function OnExitGameConfirmButtonClickEvent(a_4730:Event) : void
      {
         CrossServerDefine.m_bSelfExit = true;
         a_4812.Get().a_2116();
         a_4206.m_iInitTime = 0;
         a_4206.m_iRealeaseTimes = 0;
         this.m_stMouseLinesView.a_3079(true);
      }
      
      private function OnEnterExtraStageConfirmButtonClick(stEvent:Event) : void
      {
         var stAurDataEvent:a_1778 = null;
         if(Boolean(parent) && Boolean(parent.parent))
         {
            stAurDataEvent = new a_1778("AurPostIsEnterExtraStageEvent");
            stAurDataEvent.dataObject = 1;
            parent.parent.dispatchEvent(stAurDataEvent);
         }
         this.m_stEnterExtraStageConfirmView.visible = false;
         if(contains(this.m_stMaskSprite))
         {
            removeChild(this.m_stMaskSprite);
         }
         this.PlayCommonQuickBackSound();
      }
      
      private function OnEnterExtraStageCancelButtonClick(stEvent:Event) : void
      {
         var stAurDataEvent:a_1778 = null;
         if(Boolean(parent) && Boolean(parent.parent))
         {
            stAurDataEvent = new a_1778("AurPostIsEnterExtraStageEvent");
            stAurDataEvent.dataObject = 0;
            parent.parent.dispatchEvent(stAurDataEvent);
         }
         this.m_stEnterExtraStageConfirmView.visible = false;
         if(contains(this.m_stMaskSprite))
         {
            removeChild(this.m_stMaskSprite);
         }
      }
      
      private function OnRequestNewEnemyWaveButtonClick(stEvent:Event) : void
      {
         var stAurDataEvent:a_1778 = null;
         if(Boolean(parent) && Boolean(parent.parent))
         {
            stAurDataEvent = new a_1778("AurRequestNewEnemyWaveEvent");
            stAurDataEvent.dataObject = 0;
            parent.parent.dispatchEvent(stAurDataEvent);
         }
      }
      
      private function a_4538(a_4730:Event) : void
      {
         this.a_1189.play();
      }
      
      private function OnSwitchBattleButtonClickEvent(a_4730:Event) : void
      {
         if(this.m_stSwitchBattleButtonRefer.currentFrame == 1)
         {
            this.m_stSwitchBattleButtonRefer.gotoAndStop(2);
            this.m_stBattleFieldFor4View.a_3417(1);
         }
         else if(this.m_stSwitchBattleButtonRefer.currentFrame == 2)
         {
            this.m_stSwitchBattleButtonRefer.gotoAndStop(1);
            this.m_stBattleFieldFor4View.a_3417(0);
         }
         stage.focus = stage;
      }
      
      private function OnPlayerLeaveAvatarBreakDown(stAurDataEvent:a_1778) : void
      {
         var stBaseAvatar:a_3924 = null;
         var iSeatID:int = stAurDataEvent.dataObject as int;
         if(this.m_arrPlayerAvatarFieldGrid[iSeatID] is a_3924)
         {
            stBaseAvatar = this.m_arrPlayerAvatarFieldGrid[iSeatID] as a_3924;
            if(Boolean(stBaseAvatar) && stBaseAvatar.iLifeValue > 0)
            {
               stBaseAvatar.a_3969(stBaseAvatar.iLifeValue);
            }
            this.m_arrPlayerAvatarFieldGrid[iSeatID] = null;
         }
      }
      
      private function OnGameBattleScoreEvent(stAurDataEvent:a_1778) : void
      {
         var arrGameBattleScore:Array = stAurDataEvent.dataObject as Array;
         if(arrGameBattleScore)
         {
            this.m_stGameBattleScoreView.a_3473(arrGameBattleScore[this.m_iMyTeamId],arrGameBattleScore[(this.m_iMyTeamId + 1) % 2],this.m_stGameData["iMapID"]);
         }
      }
      
      private function OnGameEnterExtraStage(stAurDataEvent:a_1778) : void
      {
         var iTypeID:int = stAurDataEvent.dataObject as int;
         this.OnGameEnterExtraStage2(iTypeID);
      }
      
      private function OnGameEnterExtraStage2(iTypeID:int) : void
      {
         this.m_stEnterExtraStageConfirmView.visible = true;
         this.m_stEnterExtraStageConfirmView.a_1797(iTypeID,this.m_stGameData["iMapID"]);
         if(0 == iTypeID || 1 == iTypeID)
         {
            addChild(this.m_stMaskSprite);
            addChild(this.m_stEnterExtraStageConfirmView);
         }
         else if(2 == iTypeID)
         {
            if(contains(this.m_stMaskSprite))
            {
               removeChild(this.m_stMaskSprite);
            }
            this.PlayCommonQuickBackSound();
         }
      }
      
      private function CallLater(func:Function, delay:Number) : void
      {
         this.a_1596[this.callIndex] = setTimeout(func,delay);
         ++this.callIndex;
      }
      
      private function TestAll() : void
      {
         var i:int;
         for(i = 0; i < this.a_1596.length; i++)
         {
            if(this.a_1596[i] != -1)
            {
               clearTimeout(this.a_1596[i]);
               this.a_1596[i] = -1;
            }
         }
         this.callIndex = 0;
         this.CallLater(function():void
         {
            OnGameEnterExtraStage2(0);
         },2000);
         this.CallLater(function():void
         {
            OnGameEnterExtraStage2(1);
         },4000);
         this.CallLater(function():void
         {
            OnGameEnterExtraStage2(2);
         },6000);
         this.CallLater(function():void
         {
            m_stGameBossBloodProgressView.visible = true;
            m_stGameBossBloodProgressView.a_1797(m_stGameData["iMapID"],0);
         },6000);
         this.CallLater(function():void
         {
            m_stGameBossBloodProgressView.visible = true;
            m_stGameBossBloodProgressView.a_1797(m_stGameData["iMapID"],1);
         },10000);
         this.CallLater(function():void
         {
            m_stGameBossBloodProgressView.visible = true;
            m_stGameBossBloodProgressView.a_1797(m_stGameData["iMapID"],2);
         },14000);
         this.CallLater(function():void
         {
            m_stGameBossBloodProgressView.visible = true;
            m_stGameBossBloodProgressView.a_1797(m_stGameData["iMapID"],3);
         },18000);
         this.CallLater(function():void
         {
            m_stGameBossBloodProgressView.visible = true;
            m_stGameBossBloodProgressView.a_1797(m_stGameData["iMapID"],4);
         },22000);
         this.CallLater(function():void
         {
            m_stGameBossBloodProgressView.visible = true;
            m_stGameBossBloodProgressView.a_1797(m_stGameData["iMapID"],5);
         },26000);
         this.CallLater(function():void
         {
            m_stGameBossBloodProgressView.visible = true;
            m_stGameBossBloodProgressView.a_1797(m_stGameData["iMapID"],6);
         },30000);
         this.CallLater(function():void
         {
            m_stGameBossBloodProgressView.visible = true;
            m_stGameBossBloodProgressView.a_1797(m_stGameData["iMapID"],7);
         },34000);
         this.CallLater(function():void
         {
            m_stGameBossBloodProgressView.visible = true;
            m_stGameBossBloodProgressView.a_1797(m_stGameData["iMapID"],8);
         },38000);
         this.CallLater(function():void
         {
            m_stGameBossBloodProgressView.visible = true;
            m_stGameBossBloodProgressView.a_1797(m_stGameData["iMapID"],9);
         },42000);
         this.CallLater(function():void
         {
            m_stGameBossBloodProgressView.visible = true;
            m_stGameBossBloodProgressView.a_1797(m_stGameData["iMapID"],10);
         },46000);
         this.CallLater(function():void
         {
            m_stGameBossBloodProgressView.visible = true;
            m_stGameBossBloodProgressView.a_1797(m_stGameData["iMapID"],11);
         },50000);
      }
      
      private function OnPlayerLaunchSkillNotify(stAurDataEvent:a_1778) : void
      {
         var stBaseSkill:BaseSkill = null;
         var stNotifyPlayerUseSkill:Object = stAurDataEvent.dataObject;
         var bySeatID:int = int(stNotifyPlayerUseSkill.m_bySeatID);
         var iUseTimeNum:int = int(stNotifyPlayerUseSkill.m_iUseTimeNum);
         var uiSkillID:uint = uint(stNotifyPlayerUseSkill.m_uiSkillID);
         var iRandomNum:int = int(stNotifyPlayerUseSkill.m_iRandomNum);
         var stWeaponSkill:IWeaponSkill = this.m_arrWeaponSkillArray[bySeatID] as IWeaponSkill;
         if(stWeaponSkill)
         {
            stBaseSkill = stWeaponSkill.GetSkill(uiSkillID);
            if(stBaseSkill)
            {
               stBaseSkill.UseSkill(iRandomNum);
            }
         }
      }
      
      private function OnAddGameEneryNotify(stAurDataEvent:a_1778) : void
      {
         var stAddGameEneryNotify:Object = stAurDataEvent.dataObject;
         this.m_stCardGrowPanelView.a_3480(stAddGameEneryNotify.m_iAddEnergyValue);
      }
      
      private function OnSubGameEneryNotify(stAurDataEvent:a_1778) : void
      {
         var stAddGameEneryNotify:Object = stAurDataEvent.dataObject;
         this.m_stCardGrowPanelView.a_3481(stAddGameEneryNotify.m_iAddEnergyValue);
      }
      
      private function OnPlayerEnergyVlaueNotify(e:a_1778) : void
      {
         var bySeatID:int = e.dataObject.m_bySeatID as int;
         var iEnergyValue:int = e.dataObject.m_iEnergyValue as int;
         if(bySeatID >= 0 && bySeatID < 4)
         {
            (this.m_arrPlayerAvatarInfoShowTextField[bySeatID] as TextField).text = (WeaponSkillPanel.ms_arrLocalizedDataArray["能量"] ? WeaponSkillPanel.ms_arrLocalizedDataArray["能量"] : "能量") + ":" + iEnergyValue.toString();
         }
      }
      
      private function a_3616(a_4730:MouseEvent) : void
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         if(!this.m_stAvatar)
         {
            removeEventListener(MouseEvent.MOUSE_MOVE,this.a_3616,true);
            return;
         }
         this.m_stAvatar.x = mouseX - this.m_stAvatar.width * 0.6;
         this.m_stAvatar.y = mouseY - this.m_stAvatar.height * 0.7;
         var stMyBattleFieldView:BattleFieldView = this.m_stBattleFieldFor4View.m_stMyBattleFieldView;
         if(stMyBattleFieldView.mouseX > 0 && stMyBattleFieldView.mouseX < BattleFieldView.a_1013 && stMyBattleFieldView.mouseY > 0 && stMyBattleFieldView.mouseY < BattleFieldView.a_1014)
         {
            iXGridNo = int(stMyBattleFieldView.mouseX / a_3491.a_1080);
            iYGridNo = int(stMyBattleFieldView.mouseY / a_3491.a_1081);
            stFieldGrid = stMyBattleFieldView.a_3438(iXGridNo,iYGridNo);
            if(this.m_stAvatar is a_3924 && null != stFieldGrid.m_stAttackFighter)
            {
               return;
            }
         }
      }
      
      private function OnBaseAvatarMouseClick(a_4730:Event) : void
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var stTrayBaseDefense:a_3962 = null;
         var iTrayID:int = 0;
         trace("OnBaseAvatarMouseClick");
         var stMyBattleFieldView:BattleFieldView = TDGame2V2BattleUI.a_921.m_stBattleFieldFor4View.m_stMyBattleFieldView;
         if(stMyBattleFieldView.mouseX > 0 && stMyBattleFieldView.mouseX < BattleFieldView.a_1013 && stMyBattleFieldView.mouseY > 0 && stMyBattleFieldView.mouseY < BattleFieldView.a_1014)
         {
            iXGridNo = int(stMyBattleFieldView.mouseX / a_3491.a_1080);
            iYGridNo = int(stMyBattleFieldView.mouseY / a_3491.a_1081);
            stFieldGrid = stMyBattleFieldView.a_3438(iXGridNo,iYGridNo);
            if(this.m_stAvatar is a_3924 && null != stFieldGrid.m_stAttackFighter)
            {
               trace("OnBaseAvatarMouseClick stFieldGrid 己被占用, 放置不成功");
               this.m_stAvatar.startDrag();
               return;
            }
            if(stFieldGrid.m_isNeedTray)
            {
               iTrayID = 0;
               if(this.m_stCardGrowPanelView.a_3476(288817173))
               {
                  iTrayID = 288817173;
               }
               else if(this.m_stCardGrowPanelView.a_3476(288817182))
               {
                  iTrayID = 288817182;
               }
               else if(this.m_stCardGrowPanelView.a_3476(288817183))
               {
                  iTrayID = 288817183;
               }
               else if(this.m_stCardGrowPanelView.a_3476(288817220))
               {
                  iTrayID = 288817220;
               }
               else if(this.m_stCardGrowPanelView.a_3476(288817230))
               {
                  iTrayID = 288817230;
               }
               else if(this.m_stCardGrowPanelView.a_3476(288817231))
               {
                  iTrayID = 288817231;
               }
               if(0 != iTrayID)
               {
                  stTrayBaseDefense = a_4012.getInstance().a_4013(iTrayID);
               }
               if(stTrayBaseDefense)
               {
                  stMyBattleFieldView.a_3441(stTrayBaseDefense,iXGridNo,iYGridNo);
               }
            }
            if(stMyBattleFieldView.a_3441(this.m_stAvatar,iXGridNo,iYGridNo))
            {
               if(this.m_iPlaceAvatarTimeoutNum > 0)
               {
                  clearTimeout(this.m_iPlaceAvatarTimeoutNum);
               }
               this.m_iPlaceAvatarTimeoutNum = -1;
               this.m_stPlaceAvatarAlert.visible = false;
               this.PlaceAvatarHandle(iXGridNo,iYGridNo);
               this.PlaceAvatarCompelete();
               return;
            }
            trace("stMyBattleFieldView.AddBaseAvatar failed , 放置不成功");
            this.m_stAvatar.startDrag();
            return;
         }
         this.m_stAvatar.startDrag();
      }
      
      public function a_3476(iGameCardTypeID:uint) : GameCardView
      {
         return this.m_stCardGrowPanelView.a_3476(iGameCardTypeID);
      }
      
      public function GetGameCardViewByIndex(index:int) : GameCardView
      {
         return this.m_stCardGrowPanelView.GetGameCardViewByIndex(index);
      }
      
      private function UpdateGameIMUI(stBattleFieldView:BattleFieldView, stAvatar:a_3924, iSeatID:int) : void
      {
         var stAurDataEvent:a_1778 = null;
         var iXAvatarPos:int = 0;
         if(null != this.m_stGameIMUI && null != stAvatar)
         {
            stAurDataEvent = new a_1778("AvatarPostionEvent");
            iXAvatarPos = this.m_stBattleFieldFor4View.x + stBattleFieldView.x + stAvatar.x + stAvatar.stDisplayBitmap.x + 0.5 * stAvatar.stDisplayBitmap.width;
            stAurDataEvent.dataObject = [iSeatID,iXAvatarPos,stBattleFieldView.y + stAvatar.y];
            this.m_stGameIMUI.dispatchEvent(stAurDataEvent);
         }
      }
      
      private function UpdateMyAvatarInfo(stBattleFieldView:BattleFieldView, iXGridNo:int, iYGridNo:int) : void
      {
         var stAvatarInfoText:TextField = null;
         var stInitialFieldGrid:a_3491 = null;
         this.m_stAvatar.m_iPlaceTimeIntervals = stBattleFieldView.iTimeIntervalNum;
         this.m_stAvatar.m_iDefenseGlobalID = stBattleFieldView.a_2180();
         this.m_arrPlayerAvatarFieldGrid[this.m_iMySitID] = this.m_stAvatar;
         stAvatarInfoText = this.m_arrPlayerAvatarInfoShowTextField[this.m_iMySitID] as TextField;
         if(Boolean(stAvatarInfoText) && Boolean(this.m_stAvatar.parent))
         {
            stAvatarInfoText.x = this.m_stAvatar.x + 40;
            stAvatarInfoText.y = this.m_stAvatar.y + 20;
            stInitialFieldGrid = stBattleFieldView.a_3438(iXGridNo,iYGridNo);
            stBattleFieldView.AddToBattleView(stAvatarInfoText,BattleLayerDefine.EFFECTS_TOP_TYPE,stInitialFieldGrid);
            if(stBattleFieldView.GetGameMoveMap())
            {
               stBattleFieldView.GetGameMoveMap().AddMoveDisplayObject(stAvatarInfoText,stInitialFieldGrid.m_iXGridNo,stInitialFieldGrid.m_iYGridNo);
            }
         }
         if(this.m_stAvatar.isNeedAddShawdow)
         {
            this.m_stAvatar.m_stShadowRefence = this.GetShowdowBitmap(stBattleFieldView,iXGridNo,iYGridNo);
         }
         this.m_isExistDefensePlaceOnHand = false;
      }
      
      private function PlaceAvatarHandle(iXGridNo:int, iYGridNo:int) : void
      {
         var stMyBattleFieldView:BattleFieldView = this.m_stBattleFieldFor4View.m_stMyBattleFieldView;
         var byIsTool:int = 0;
         var stInitialFieldGrid:a_3491 = stMyBattleFieldView.a_3438(iXGridNo,iYGridNo);
         a_1088.a_2059(this.m_stAvatar.m_iDefenseGlobalID,this.m_stAvatar.a_3512(),stInitialFieldGrid.m_iInitialXGridNo,stInitialFieldGrid.m_iInitialYGridNo,byIsTool);
      }
      
      private function PlaceAvatarCompelete() : void
      {
         this.m_stAvatar.removeEventListener(MouseEvent.CLICK,this.OnBaseAvatarMouseClick);
         removeEventListener(MouseEvent.MOUSE_MOVE,this.a_3616,true);
         this.m_stAvatar.stopDrag();
         this.m_stAvatar.a_3940();
         this.m_stAvatar = null;
         this.m_isExistDefensePlaceOnHand = false;
      }
      
      public function a_4539(stGameBasePop:IBaseProp, stPlayerUsePropNotify:a_2707, isMyTeamUse:Boolean = true) : void
      {
         var arrPendingAddMoveIntruderVector:Vector.<a_4269> = null;
         var stPropEffectValue:EffectObjectValue = stGameBasePop.a_4328();
         var stUseDisplayEffect:MovieClip = stGameBasePop.a_4327();
         if(stPropEffectValue.m_iEffectTypeID == EnmPropEffectType.a_1567)
         {
            if(isMyTeamUse && stPropEffectValue.m_iEffectValue < 0 || !isMyTeamUse && stPropEffectValue.m_iEffectValue > 0)
            {
               TDGame2V2BattleUI.a_921.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.a_3468(stGameBasePop);
            }
            else
            {
               TDGame2V2BattleUI.a_921.m_stBattleFieldFor4View.m_stMyBattleFieldView.a_3468(stGameBasePop);
            }
         }
         else if(stPropEffectValue.m_iEffectTypeID == EnmPropEffectType.a_1566)
         {
            if(isMyTeamUse && stPropEffectValue.m_iEffectValue < 0 || !isMyTeamUse && stPropEffectValue.m_iEffectValue > 0)
            {
               TDGame2V2BattleUI.a_921.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.a_3469(stGameBasePop);
            }
            else
            {
               TDGame2V2BattleUI.a_921.m_stBattleFieldFor4View.m_stMyBattleFieldView.a_3469(stGameBasePop);
            }
         }
         else if(stPropEffectValue.m_iEffectTypeID == EnmPropEffectType.a_1564)
         {
            if(isMyTeamUse && stPropEffectValue.m_iEffectValue < 0 || !isMyTeamUse && stPropEffectValue.m_iEffectValue > 0)
            {
               TDGame2V2BattleUI.a_921.m_stBattleFieldFor4View.m_stMyBattleFieldView.a_3467(stPropEffectValue.m_iEffectValue,stGameBasePop);
            }
            else
            {
               TDGame2V2BattleUI.a_921.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.a_3467(stPropEffectValue.m_iEffectValue,stGameBasePop);
            }
         }
         else if(stPropEffectValue.m_iEffectTypeID == EnmPropEffectType.a_1565)
         {
            if(isMyTeamUse && stPropEffectValue.m_iEffectValue < 0 || !isMyTeamUse && stPropEffectValue.m_iEffectValue > 0)
            {
               TDGame2V2BattleUI.a_921.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.a_3470(stPropEffectValue.m_iEffectValue,stGameBasePop);
            }
            else
            {
               TDGame2V2BattleUI.a_921.m_stBattleFieldFor4View.m_stMyBattleFieldView.a_3470(stPropEffectValue.m_iEffectValue,stGameBasePop);
            }
         }
         else if(stPropEffectValue.m_iEffectTypeID == EnmPropEffectType.a_1568)
         {
            stPlayerUsePropNotify.m_byYGridNo;
            arrPendingAddMoveIntruderVector = new Vector.<a_4269>();
            arrPendingAddMoveIntruderVector[0] = new a_4269();
            arrPendingAddMoveIntruderVector[0].m_iIntruderYGridNo = stPlayerUsePropNotify.m_byYGridNo;
            arrPendingAddMoveIntruderVector[0].m_iIntruderXGridNo = stPlayerUsePropNotify.m_byXGridNo;
            arrPendingAddMoveIntruderVector[0].m_iAppearTime = stPlayerUsePropNotify.m_uiUseTimeCount;
            arrPendingAddMoveIntruderVector[0].m_iIntruderGlobalNo = stPlayerUsePropNotify.m_nIntruderGlobalID;
            arrPendingAddMoveIntruderVector[0].m_iIntruderType = stPropEffectValue.m_iEffectValue;
            if(Boolean(this.m_stSittedPlayerStatus[stPlayerUsePropNotify.m_byPlayerSeatID]) && this.m_stSittedPlayerStatus[stPlayerUsePropNotify.m_byPlayerSeatID].m_byTeamNo == this.m_iMyTeamId)
            {
               TDGame2V2BattleUI.a_921.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.m_stMoveIntruderManage.a_3608(arrPendingAddMoveIntruderVector);
            }
            else
            {
               TDGame2V2BattleUI.a_921.m_stBattleFieldFor4View.m_stMyBattleFieldView.m_stMoveIntruderManage.a_3608(arrPendingAddMoveIntruderVector);
            }
         }
      }
      
      private function OnCardDescFileCompleteEvent(stDataEvent:a_1778) : void
      {
         var stCardDesc:XML = null;
         var item:XML = null;
         var stGameCardView:GameCardView = null;
         if("TinyCardDesc" == stDataEvent.dataObject.name)
         {
            stCardDesc = stDataEvent.dataObject.data as XML;
            for each(item in stCardDesc.item)
            {
               stGameCardView = this.m_stCardGrowPanelView.a_3476(parseInt(item.@id,16));
               if(stGameCardView)
               {
                  stGameCardView.m_szCardName = item.@name;
               }
            }
         }
      }
      
      public function OnGameStepLock(stGameStartNotify:CNotifyGameStep) : Boolean
      {
         return true;
      }
      
      private function a_3416(a_4730:Event) : void
      {
         var stWeaponSkill:IWeaponSkill = null;
         var arrInfo:Array = null;
         var iPositionY:int = 0;
         var iPositionX:int = 0;
         var stAurDataEvent:a_1778 = null;
         var stBaseAttackFighter:a_3953 = null;
         var stDropGoldCoin:a_4124 = null;
         this.m_stBattleFieldFor4View.m_stMyBattleFieldView.a_3416(a_4730);
         if(this.m_isOpponentVisible)
         {
            this.m_stBattleFieldFor4View.m_stOpponentBattleFieldView.a_3416(a_4730);
         }
         var iCheckTimes:* = int(this.m_stBattleFieldFor4View.m_stMyBattleFieldView.iTimeIntervalNum - this.a_1010);
         while(iCheckTimes-- > 0)
         {
            ++this.a_1010;
            this.m_stBattleFieldFor4View.a_3416(a_4730);
            if(this.a_1010 % 3 == 0)
            {
               for each(stDropGoldCoin in a_4124.a_1411)
               {
                  stDropGoldCoin.a_4003(null);
               }
            }
            this.m_stCardGrowPanelView.OnTimeInterval(this.a_1010);
            this.m_stGameMapResource.OnTimeInterval(this.a_1010);
            this.m_stBattleFieldFor4View.m_stMyBattleFieldView.getDesertFogSprite().OnTimeInterval(this.a_1010);
            for each(stWeaponSkill in this.m_arrWeaponSkillArray)
            {
               if(stWeaponSkill)
               {
                  stWeaponSkill.OnTimeInterval(this.a_1010);
               }
            }
            this.m_stWeaponSkillPanel.OnTimeInterval(this.a_1010);
            arrInfo = null;
            iPositionY = 0;
            iPositionX = 0;
            stAurDataEvent = null;
            stBaseAttackFighter = null;
            if(this.a_1010 % 10 == 0 && this.m_iLastChangePlayerEnergyValue != this.m_stCardGrowPanelView.iMoneyCount)
            {
               this.m_iLastChangePlayerEnergyValue = this.m_stCardGrowPanelView.iMoneyCount;
               this.UpdatePlayerAvatarInfoHtmlText();
            }
            if(Boolean(this.a_1010 % 10 == 0) && Boolean(this.m_stAvatar) && this.m_iLastChangeAvatarLifeValue != this.m_stAvatar.iLifeValue)
            {
               this.m_iLastChangeAvatarLifeValue = this.m_stAvatar.iLifeValue;
               this.UpdatePlayerAvatarInfoHtmlText();
            }
         }
         if(this.m_stMouseLinesView.m_stMouseLinesData != null)
         {
            if(this.a_1010 > this.m_stMouseLinesView.m_stMouseLinesData.m_iShowTime * 1000 / 50)
            {
               this.m_stMouseLinesView.a_3078();
            }
         }
      }
      
      private function OnBossBloodProgressEvent(stAurDataEvent:a_1778) : void
      {
         var numBossBloodProgress:Number = 0;
         var allBossBloodProgress:Number = 0;
         if(!this.m_bWorldBossMap)
         {
            numBossBloodProgress = stAurDataEvent.dataObject as Number;
         }
         else
         {
            numBossBloodProgress = stAurDataEvent.dataObject.now as Number;
            allBossBloodProgress = stAurDataEvent.dataObject.all as Number;
         }
         if(this.m_stGameData["iMapID"] == 530)
         {
            this.m_stGameDoubleBossBloodProgressView.a_3510(numBossBloodProgress);
         }
         else if((this.m_stGameData["iMapID"] & 0xFFFF0000) == 1191182336)
         {
            this.m_stGameDoubleBossBloodProgressView.a_3510(numBossBloodProgress);
         }
         else if((this.m_stGameData["iMapID"] & 0xFFFF0000) > 0 && (this.m_stGameData["iMapID"] & 0xFFFF0000) < 268435456 || (this.m_stGameData["iMapID"] & 0xFF000000) == 1409286144)
         {
            this.m_stGameDoubleBossBloodProgressView.a_3510(numBossBloodProgress);
         }
         else if(CompositeMapHandler.Get().IsCompositeMap())
         {
            this.m_stGameDoubleBossBloodProgressView.a_3510(numBossBloodProgress);
         }
         else if(this.m_bWorldBossMap)
         {
            this.m_stGameBossBloodProgress2View.a_3510(numBossBloodProgress,allBossBloodProgress);
         }
         else if((this.m_stGameData["iMapID"] & 0xF0000000) == 1610612736)
         {
            this.m_stGameBossBloodProgressView.a_3510(numBossBloodProgress);
            this.m_stGameDoubleBossBloodProgressView.a_3510(numBossBloodProgress);
            this.m_stIntruderWaveIndicatorView.visible = false;
            if(numBossBloodProgress <= 0)
            {
               setTimeout(this.GameBossBloodVanish,200,1);
            }
         }
         else
         {
            this.m_stGameBossBloodProgressView.a_3510(numBossBloodProgress);
         }
         if(this.m_stGameData["iMapID"] == 530)
         {
            this.m_stIntruderWaveIndicatorView.visible = false;
            this.m_stGameBossBloodProgressView.visible = true;
            this.m_stGameBossBloodProgress2View.a_4158();
            this.m_stDPSView.visible = false;
            this.m_stBattleFieldFor4View.m_stMyBattleFieldView.m_byIsEnterBossBattle = false;
         }
         else if(numBossBloodProgress <= 0 && ((this.m_stGameData["iMapID"] & 0xFFFF0000) == 0 || (this.m_stGameData["iMapID"] & 0xFFFF0000) == 33554432 || (this.m_stGameData["iMapID"] & 0xFF000000) == 1090519040 || (this.m_stGameData["iMapID"] & 0xFF000000) == 1107296256 || (this.m_stGameData["iMapID"] & 0xFF000000) == 1124073472 || this.m_bWorldBossMap))
         {
            this.m_stIntruderWaveIndicatorView.visible = true;
            this.m_stGameBossBloodProgressView.visible = false;
            this.m_stGameBossBloodProgress2View.a_4158();
            this.m_stDPSView.visible = false;
            this.m_stBattleFieldFor4View.m_stMyBattleFieldView.m_byIsEnterBossBattle = false;
            if(this.m_bWorldBossMap && (this.m_stGameData["iMapID"] & 0xFFFF) == 4620 && this.m_iBossAppearTimes <= 1)
            {
               this.PlayCommonBackSound();
            }
            else
            {
               this.PlayCommonQuickBackSound();
            }
         }
         if(this.m_stGameData["iMapID"] >= 531 && this.m_stGameData["iMapID"] <= 556)
         {
            this.m_stIntruderWaveIndicatorView.visible = false;
         }
      }
      
      private function GetLocalizedAvatarInfoLabel(key:String, defaultLabel:String) : String
      {
         var szLabel:String = WeaponSkillPanel.ms_arrLocalizedDataArray[key];
         return szLabel ? szLabel : defaultLabel;
      }
      
      private function UpdatePlayerAvatarInfoHtmlText() : void
      {
         var stAvatarInfoText:TextField = this.m_arrPlayerAvatarInfoShowTextField[this.m_iMySitID] as TextField;
         if(stAvatarInfoText == null)
         {
            return;
         }
         var szEnergyLabel:String = this.GetLocalizedAvatarInfoLabel("能量","能量");
         var szLifeLabel:String = this.GetLocalizedAvatarInfoLabel("体力","体力");
         var szText:String = szEnergyLabel + ":" + this.m_iLastChangePlayerEnergyValue.toString() + "<br>" + szLifeLabel + ":" + this.m_iLastChangeAvatarLifeValue.toString();
         if(this.m_szLastAvatarInfoHtmlText == szText)
         {
            return;
         }
         this.m_szLastAvatarInfoHtmlText = szText;
         stAvatarInfoText.htmlText = szText;
      }
      
      private function GameBossBloodVanish(iAlertTimes:int) : void
      {
         this.m_stGameBossBloodProgressView.visible = false;
         this.m_stGameBossBloodProgress2View.a_4158();
         this.m_stDPSView.visible = false;
         this.m_stGameDoubleBossBloodProgressView.visible = false;
      }
   }
}

import a_4714.AssetType;
import a_4714.AssetsItemData;
import a_4714.AssetsLoader;
import com.aurora.ui.maogoutd.diy.DiyHandler;
import com.aurora.ui.maogoutd.diy.myEditor.data.BossData;
import com.aurora.ui.maogoutd.diy.myEditor.data.MonsterData;
import com.aurora.ui.maogoutd.diy.myEditor.data.MouseLinesChatBubblesData;
import com.aurora.ui.maogoutd.diy.myEditor.data.MouseLinesData;
import com.aurora.ui.maogoutd.diy.myEditor.data.MouseLinesTalkMouseData;
import com.aurora.ui.maogoutd.diy.xml.DIYConfigData;
import flash.display.Bitmap;
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.utils.Dictionary;
import flash.utils.clearTimeout;
import flash.utils.setTimeout;

class MouseLinesView extends Sprite
{
   
   private var m_bmMousePic:Bitmap;
   
   private var m_bmChatBubbles:Bitmap;
   
   private var m_txtLinesTxt:TextField;
   
   private var m_dicImage:Dictionary;
   
   private var m_ConfigData:DIYConfigData;
   
   private var m_iTimeoutID:uint;
   
   private var m_iLoadedImgCnt:int;
   
   private var m_tfTextFormat:TextFormat;
   
   public var m_stMouseLinesData:MouseLinesData;
   
   private var m_strLinesContent:String;
   
   private var m_bFirstRes:Boolean = true;
   
   public function MouseLinesView()
   {
      super();
      this.m_bmMousePic = new Bitmap();
      this.m_bmMousePic.x = 0;
      this.m_bmMousePic.y = 0;
      this.addChild(this.m_bmMousePic);
      this.m_bmChatBubbles = new Bitmap();
      this.m_bmChatBubbles.x = 0;
      this.m_bmChatBubbles.y = 0;
      this.addChild(this.m_bmChatBubbles);
      this.m_tfTextFormat = new TextFormat();
      this.m_tfTextFormat.font = "微软雅黑";
      this.m_tfTextFormat.size = 15;
      this.m_tfTextFormat.bold = true;
      this.m_tfTextFormat.align = "center";
      this.m_txtLinesTxt = new TextField();
      this.m_txtLinesTxt.x = 0;
      this.m_txtLinesTxt.y = 0;
      this.m_txtLinesTxt.defaultTextFormat = this.m_tfTextFormat;
      this.m_txtLinesTxt.multiline = true;
      this.m_txtLinesTxt.wordWrap = true;
      this.addChild(this.m_txtLinesTxt);
      this.mouseEnabled = false;
      this.mouseChildren = false;
      this.m_dicImage = DiyHandler.GetInstance().dictImage;
      this.m_ConfigData = DiyHandler.GetInstance().m_ConfigData;
      this.m_iTimeoutID = 0;
      this.m_stMouseLinesData = null;
   }
   
   public function a_3078() : void
   {
      clearTimeout(this.m_iTimeoutID);
      if(this.m_stMouseLinesData == null || this.m_stMouseLinesData.IsHaveLines() == false)
      {
         this.a_3079(true);
         return;
      }
      this.a_3897(this.m_stMouseLinesData);
      this.m_stMouseLinesData = null;
      this.visible = true;
      this.m_iTimeoutID = setTimeout(this.a_3079,10000);
   }
   
   public function a_3079(bCleanData:Boolean = false) : void
   {
      if(bCleanData)
      {
         this.m_stMouseLinesData = null;
      }
      this.visible = false;
   }
   
   private function a_3897(stMouseLinesData:MouseLinesData) : void
   {
      var stBossData:BossData = null;
      var stMonsterData:MonsterData = null;
      this.m_iLoadedImgCnt = 0;
      this.m_strLinesContent = stMouseLinesData.m_strLinesContent;
      var strResUrl:String = "";
      var stTalkMouseData:MouseLinesTalkMouseData = this.m_ConfigData.GetMouseLinesTalkMouseData(stMouseLinesData.m_iTalkingMouseID);
      if(stTalkMouseData != null)
      {
         if(stTalkMouseData.m_bIsBoss)
         {
            stBossData = DiyHandler.GetInstance().m_ConfigData.GetBossData(stTalkMouseData.m_iMonsterOrBossID);
            strResUrl = stBossData.sBossUrl;
         }
         else
         {
            stMonsterData = DiyHandler.GetInstance().m_ConfigData.GetMonsterData(stTalkMouseData.m_iMonsterOrBossID);
            strResUrl = stMonsterData.sUrl;
         }
      }
      this.ShowImg(this.m_bmMousePic,strResUrl);
      strResUrl = "";
      var stChatBubblesData:MouseLinesChatBubblesData = this.m_ConfigData.GetMouseLinesChatBubblesData(stMouseLinesData.m_iChatBubblesID);
      if(stChatBubblesData != null)
      {
         strResUrl = stChatBubblesData.m_strResUrl;
      }
      this.ShowImg(this.m_bmChatBubbles,strResUrl);
      this.UpdateRes();
   }
   
   private function OnImgLoaded() : void
   {
      ++this.m_iLoadedImgCnt;
      if(this.m_iLoadedImgCnt == 2)
      {
         this.m_bmMousePic.x = (this.m_bmChatBubbles.width - this.m_bmMousePic.width) / 2;
         this.m_bmMousePic.y = this.m_bmChatBubbles.height;
         this.m_txtLinesTxt.width = this.m_bmChatBubbles.width - 18 * 2;
         this.m_txtLinesTxt.text = this.m_strLinesContent;
         this.m_txtLinesTxt.height = this.m_txtLinesTxt.textHeight + 5;
         this.m_txtLinesTxt.x = this.m_bmChatBubbles.x + 18;
         this.m_txtLinesTxt.y = (this.m_bmChatBubbles.height - this.m_txtLinesTxt.height) / 2 + 4;
      }
   }
   
   private function ShowImg(bmImg:Bitmap, strResUrl:String) : void
   {
      var dict:Dictionary = null;
      var loader:AssetsLoader = null;
      if(strResUrl == "")
      {
         bmImg.bitmapData = null;
         return;
      }
      if(this.m_dicImage[strResUrl] != null)
      {
         bmImg.bitmapData = this.m_dicImage[strResUrl].bitmapData;
         this.OnImgLoaded();
      }
      else
      {
         dict = new Dictionary();
         dict[strResUrl] = new AssetsItemData(strResUrl,AssetType.PNG,strResUrl);
         loader = new AssetsLoader();
         loader.load(dict,{
            "onComplete":this.onLoadImageComplete,
            "onCompleteParms":[bmImg,strResUrl]
         });
      }
   }
   
   private function onLoadImageComplete(dict:Dictionary, bmImg:Bitmap, url:String) : void
   {
      var image:Bitmap = null;
      if(dict[url] != null && Boolean(dict[url].data))
      {
         image = dict[url].data;
         bmImg.bitmapData = image.bitmapData;
         this.m_dicImage[url] = dict[url].data;
         this.OnImgLoaded();
      }
   }
   
   private function UpdateRes() : void
   {
      if(!this.m_bFirstRes)
      {
         return;
      }
      this.m_bFirstRes = false;
   }
}
