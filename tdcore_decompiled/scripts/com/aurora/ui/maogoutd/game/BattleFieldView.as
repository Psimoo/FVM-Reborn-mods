package com.aurora.ui.maogoutd.game
{
   import a_4715.EncrypBooleanEx;
   import a_4715.EncrypIntEx;
   import a_4715.EncrypNumber;
   import a_4718.b_180;
   import a_4718.b_203;
   import a_4728.a_1778;
   import a_4788.a_4648;
   import a_4789.a_4657;
   import com.adobe.utils.RandomSeed;
   import com.aurora.protocol.game.maogoutd.CEntityStateChange;
   import com.aurora.protocol.game.maogoutd.CVanishEnemy;
   import com.aurora.ui.maogoutd.ClientLog.CDebugPane;
   import com.aurora.ui.maogoutd.b_147;
   import com.aurora.ui.maogoutd.diy.xml.DIYConfigData;
   import com.aurora.ui.maogoutd.iface.IBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.EffectManager;
   import com.aurora.ui.maogoutd.resource.ISmallGameDetailInfoMap;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4255;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4258;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4269;
   import com.aurora.ui.maogoutd.resource.Intruder.newBoss.BaseBossMoveIntruder;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.defender.a_3959;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.defender.a_3971;
   import com.aurora.ui.maogoutd.resource.defender.a_3972;
   import com.aurora.ui.maogoutd.resource.defender.a_3975;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import com.aurora.ui.maogoutd.resource.defender.a_3977;
   import com.aurora.ui.maogoutd.resource.defender.a_4012;
   import com.aurora.ui.maogoutd.resource.defender.defenderSet.BaseAttackFighterSet;
   import com.aurora.ui.maogoutd.resource.defender.defenderSet.IDefenderSet;
   import com.aurora.ui.maogoutd.resource.effect.AddBloodEffect;
   import com.aurora.ui.maogoutd.resource.effect.CardExpAddEffect;
   import com.aurora.ui.maogoutd.resource.effect.CardLoverAttackAddEffect;
   import com.aurora.ui.maogoutd.resource.effect.CardLoverEnergyAddEffect;
   import com.aurora.ui.maogoutd.resource.effect.DesertFogEffectSprite;
   import com.aurora.ui.maogoutd.resource.effect.MouseSecondEarthHole;
   import com.aurora.ui.maogoutd.resource.effect.VolcanicFireEffect;
   import com.aurora.ui.maogoutd.resource.effect.a_4111;
   import com.aurora.ui.maogoutd.resource.effect.a_4128;
   import com.aurora.ui.maogoutd.resource.effect.a_4133;
   import com.aurora.ui.maogoutd.resource.effect.a_4135;
   import com.aurora.ui.maogoutd.resource.effect.a_4142;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import com.aurora.ui.maogoutd.resource.energy.a_4162;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.BaseGameMoveMap;
   import com.aurora.ui.maogoutd.resource.moveBlock.MoveBlockFieldGrid;
   import com.aurora.ui.maogoutd.resource.props.IBaseProp;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.sound.a_4404;
   import com.aurora.ui.maogoutd.resource.tools.a_4408;
   import com.aurora.ui.maogoutd.resource.tools.a_4440;
   import com.aurora.ui.maogoutd.resource.tools.a_4448;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   
   public class BattleFieldView extends Sprite
   {
      
      public static var a_1011:int;
      
      public static var m_iDIYCurrentBloodPercent:int;
      
      public static var a_1054:ISmallGameDetailInfoMap;
      
      private static var ms_isMyPlacedEx:EncrypBooleanEx;
      
      public static var lastAttacker:a_3953;
      
      public static var lastMouseMoveIntruder:a_4206;
      
      public static var ms_iYGridNumIntEx:EncrypIntEx = new EncrypIntEx();
      
      public static var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      public static var m_stSpaceRandomSeed:RandomSeed = new RandomSeed();
      
      public static var m_stUpGradeRandomSeed:RandomSeed = new RandomSeed();
      
      public static var ms_iBattleFieldWidthEncrypIntEx:EncrypIntEx = new EncrypIntEx();
      
      public static var ms_iServerLockStepIntEx:int = 0;
      
      public static var ms_iBattleFiledHeigthEncrypIntEx:EncrypIntEx = new EncrypIntEx();
      
      public static var m_iEarthHoleTypeEncrypIntEx:EncrypIntEx = new EncrypIntEx(1);
      
      public static var m_CannotSilentCard:Array = new Array(286392452,286392448,286392462,286392463,286458416,286458672,286458686,286458687,286400570,286400571,286400572,286400573,286458384,286458398,286458399,286392640,286392654,286392655,286392960,286392974,286458420,286458400,286458414,286458415,286392688,286392702,286392703);
      
      public static var m_CatDieByHelmetScoop:Array = new Array(286394720,286394734,286394735);
      
      public static var m_SpecialMapAddPowr:Array = new Array(294850656,294850670,294850671,286462004,286462014,286457919,292552784,292552798,292552799,286462064,286462078,286462079);
      
      public static var m_MemPackStoreAddPower:Array = new Array(286457934,286457951);
      
      public static var m_HoneyFactoryAddPower:Array = new Array(286394496,286394510,286394511,286394512,286394526,286394527,286402336,286402350,286402351,286402352,286402366,286402367);
      
      public static var a_1015:a_4404 = new a_4404();
      
      public static var a_1016:a_4404 = new a_4404();
      
      public static var a_1017:a_4404 = new a_4404();
      
      public static var a_1018:a_4404 = new a_4404();
      
      public static var a_1019:a_4404 = new a_4404();
      
      public static var ms_kenShi29:a_4404 = new a_4404();
      
      public static var a_1020:a_4404 = new a_4404();
      
      public static var a_1021:a_4404 = new a_4404();
      
      public static var ms_naka13:a_4404 = new a_4404();
      
      public static var a_1022:a_4404 = new a_4404();
      
      public static var a_1023:a_4404 = new a_4404();
      
      public static var a_1024:a_4404 = new a_4404();
      
      public static var a_1025:a_4404 = new a_4404();
      
      public static var a_1026:a_4404 = new a_4404();
      
      public static var a_1027:a_4404 = new a_4404();
      
      public static var a_1028:a_4404 = new a_4404();
      
      public static var a_1029:a_4404 = new a_4404();
      
      public static var a_1030:a_4404 = new a_4404();
      
      public static var a_1031:a_4404 = new a_4404();
      
      public static var a_1032:a_4404 = new a_4404();
      
      public static var a_1033:a_4404 = new a_4404();
      
      public static var a_1034:a_4404 = new a_4404();
      
      public static var a_1035:a_4404 = new a_4404();
      
      public static var a_1036:a_4404 = new a_4404();
      
      public static var a_1037:a_4404 = new a_4404();
      
      public static var a_1038:a_4404 = new a_4404();
      
      public static var a_1039:a_4404 = new a_4404();
      
      public static var a_1040:a_4404 = new a_4404();
      
      public static var a_1041:a_4404 = new a_4404();
      
      public static var a_1042:a_4404 = new a_4404();
      
      public static var a_1043:a_4404 = new a_4404();
      
      public static var a_1044:a_4404 = new a_4404();
      
      public static var a_1045:a_4404 = new a_4404();
      
      public static var a_1046:a_4404 = new a_4404();
      
      public static var a_1047:a_4404 = new a_4404();
      
      public static var a_1048:a_4404 = new a_4404();
      
      public static var a_1049:a_4404 = new a_4404();
      
      public static var a_1050:a_4404 = new a_4404();
      
      public static var a_1051:a_4404 = new a_4404();
      
      public static var a_1052:a_4404 = new a_4404();
      
      public static var ms_pobing81:a_4404 = new a_4404();
      
      public static var ms_yadianna82:a_4404 = new a_4404();
      
      public static var ms_tianshen83:a_4404 = new a_4404();
      
      public static var ms_tanhuanghu84:a_4404 = new a_4404();
      
      public static var ms_dadinvshen85:a_4404 = new a_4404();
      
      public static var ms_bingjinglong_86:a_4404 = new a_4404();
      
      public static var ms_zhaocaimiao_87:a_4404 = new a_4404();
      
      public static var ms_huojianzhu_88:a_4404 = new a_4404();
      
      public static var ms_xueqiutu_89:a_4404 = new a_4404();
      
      public static var ms_bingshen_90:a_4404 = new a_4404();
      
      public static var ms_lengcuiji_91:a_4404 = new a_4404();
      
      public static var ms_lingyu_92:a_4404 = new a_4404();
      
      public static var ms_shizi_93:a_4404 = new a_4404();
      
      public static var a_1053:a_4404 = new a_4404();
      
      public static var ms_shibai09:a_4404 = new a_4404();
      
      public static var a_1055:int = 0;
      
      public static var a_1056:Boolean = false;
      
      public static var ms_arrLearnSkillCardIDArray:Array = [];
      
      public static var ms_arrLoverCardIDArray:Array = [];
      
      public static const m_GostMouse:Array = [8388631,8388749,8388750,8392727,8389639];
      
      public static const m_UnPopularMouse:Array = [8388649,8392745,8389221,8393220,8389320];
      
      public static const m_lCantUseCardsInBuff:Array = [286458144,294846544,286457950,286457983,286394688,286394702,286394703,288817189,288817198,288817199,288817248,288817262,288817263,288817280,288817294,288817295,292552960,292552974,292552975,286523936,286523950,288497791,286393200,286393214,286393215,288950061,288950060,288950059,286401338];
      
      public static const FiveDirectionDefenseCardIDs:Array = new Array(286458368,286458382,286458383,286462464,286462478,286462479,286462474,286462475,286462476,286462477,286394400,286394414,286394415,286394704,286394718,286394719,286400618,286400619,286400620,286400621,286466560,286466574,286466575,286400544,286400558,286400559,292552992,292553006,292553007);
      
      public static const EightDirectionDefenseCardIDs:Array = new Array(286394208,286394222,286394223,292552720,292552734,292552735);
      
      public static const FourCountCardIDArray:Array = [286394144,286394158,286394159,286393088,286393102,286393103,286394384,286394398,286394399,286393744,286393758,286393759,286401168,286401182,286401183,286394240,286394254,286394255,286394208,286394222,286394223,292552720,292552734,292552735];
      
      public static const yOffsetList:Array = [0,0,0,0,15.25,16,16.2,15.95,18.85,19.05,22.7,22.7,22.7,25.35,23.15,23.2,23.85,24.55,22.05];
      
      public static const yGradeOffsetList:Array = [0,0,0,-1,0,0,0,-1,0,1,1,0,0,0,0,-1,0];
      
      public static const m_lTraceCard:Array = [286458074,286458075,286458076,286458077,286462304,286462318,286462319,286458724,286458734,286458735,286457956,286458078,286458079,289603636,289603646,289603647,286394656,286394670,286394671,286457934,286457951];
      
      public static const m_lAuxCard:Array = [286851393,286851406,286851407,286851412,286851422,286851423,286851418,286851419,286851420,286851421,286851428,286851438,286851439,286851668,286851678,286851679,286401904,286401918,286401919,292552832,292552846,292552847];
      
      public static const m_lBoomCard:Array = [286392352,286392366,286392367,286392372,286392382,286392383,286396432,286396446,286396447,286392436,286392446,286392447,286396448,286396462,286396463,286392432,286393246,286393247,286393616];
      
      public static const m_lAlcoholLamp:Array = [286855520,286855534];
      
      public static const m_lBarrierHorse:Array = [286402176,286402190,288949823];
      
      public static const MS_ALLOWED_DEFENSE_TYPE_IDS:Array = [286326804,286326814,286326815,294846528,294846542,294846543,286326868,286326884,286326879,286326874,286326875,286326876,286326877,286327636,286327646,286327647,286330916,286330926,286330927,286331684,286331694,286331695,286330932,287375396,287375406,287375407,287506468,287506478,287506479,286393104,286393118,286393119,287440932,287637520,287637534,287637535];
      
      public var m_iRandomXGridNoEncrypIntEx:EncrypIntEx = new EncrypIntEx();
      
      public var m_iRandomYGridNoEncrypIntEx:EncrypIntEx = new EncrypIntEx();
      
      private var ms_iFrozenBrokeTimeEncrypIntEx:EncrypIntEx = new EncrypIntEx(60);
      
      private var ms_iShihuaTimeEncrypIntEx:EncrypIntEx = new EncrypIntEx(5);
      
      public var m_CatDragonWindBrokeArray:Array = new Array(288817173,288817182,288817183,288817220,288817230,288817231,288817232,288817246,288817247,288817264,288817278,288817279,292552848,292552862,292552863);
      
      public var m_stOpponentBattleFieldInstance:BattleFieldView;
      
      private var m_isOwnBattleFieldEx:EncrypBooleanEx;
      
      public var m_byTeamNo:int = -1;
      
      private var m_isAllowStartDropEnergyEx:EncrypBooleanEx;
      
      public var m_stMoveIntruderManage:a_4258;
      
      public var m_stMoveIntruderFactory:a_4255;
      
      private var a_1057:b_147;
      
      private var a_1058:Array;
      
      private var m_stStaticFieldGridVector:Array;
      
      private var m_stCheckFieldGridsVector:Array;
      
      private var a_1059:Vector.<int>;
      
      public var m_stBaseShotVector:Array;
      
      public var m_stFieldRowSlipStatusArray:Vector.<Boolean>;
      
      public var m_arrEffectArray:Array = new Array();
      
      public var m_arrBaseInsuranceVector:Vector.<a_3972>;
      
      public var m_arrBaseMoveIntruderVector:Array;
      
      public var m_arrBaseEnergyVector:Vector.<a_4157>;
      
      public var m_arrDropPropsArray:Array;
      
      public var m_arrDropCoinsArray:Array;
      
      public var m_dicFoodBox:Dictionary;
      
      public var m_BBQMasterGridBuffDic:Dictionary;
      
      public var m_GoldZBSHeirGridBaseBuffDic:Dictionary;
      
      public var m_GoldZBSHeirGridFirstBuffDic:Dictionary;
      
      public var m_GoldZBSHeirGridSecondBuffDic:Dictionary;
      
      public var m_stLargeFogEffect:a_4128;
      
      public var m_stDesertFogEffectSprite:DesertFogEffectSprite;
      
      public var m_stRowBreakDownMoveIntruderBitmap:Bitmap;
      
      public var m_stAvatarBreakDownBitmap:Bitmap;
      
      public var ms_dicPendingCopyGrid:Dictionary = new Dictionary();
      
      public var m_stMoveDefense:a_3962;
      
      public var m_OtherMoveDefense:a_3962;
      
      public var m_LockMoveDefense:a_3962;
      
      public var m_UnLockMoveDefense:a_3962;
      
      public var m_OtherLockMoveDefense:a_3962;
      
      public var m_OtherUnLockMoveDefense:a_3962;
      
      public var m_CardCount:int;
      
      private var m_byIsEnterBossBattleEx:EncrypBooleanEx;
      
      private var m_isAutoPickUpEnergyEx:EncrypBooleanEx;
      
      private var m_isAutoPickUpPropsEx:EncrypBooleanEx;
      
      private var a_1060:Vector.<Bitmap>;
      
      private var a_1061:Vector.<Bitmap>;
      
      private var a_1062:Bitmap;
      
      private var a_1063:Bitmap;
      
      private var a_763:int = 0;
      
      private var m_iClientIntruderID:int = 0;
      
      private var m_iGolobalShotID:int = 0;
      
      private var m_iStartGetTimerTimestampEx:EncrypNumber;
      
      private var m_iStartDateTimestampEx:EncrypNumber;
      
      private var m_iTimeIntervalNumEx:int = 0;
      
      private var m_iLastCheckTimeIntervalNumEx:int = 0;
      
      private var m_iLastAutoPickEnergyTimeNumEx:int = 0;
      
      private var m_iLastAutoPickPropsTimeNumEx:int = 0;
      
      private var a_1070:Array = [];
      
      private var m_iIntruderMoveDirectionEx:EncrypIntEx;
      
      private var a_1072:Boolean;
      
      private var a_1073:int;
      
      private var m_stBaseGameMap:BaseGameMoveMap;
      
      private var m_stBattleLayerManager:BattleLayerManager;
      
      private var m_stMoveSp:Sprite;
      
      private var m_lHasThiefGrid:Array = new Array();
      
      private var m_iStartThiefTick:int = 0;
      
      public var IsOceanChapter:Boolean = false;
      
      public var IsWonderLand:Boolean = false;
      
      public var IsCrab:Boolean = false;
      
      private var m_iTick25Count:int = 0;
      
      private var m_bIsTick1:Boolean = false;
      
      private var a_1010:EncrypIntEx = new EncrypIntEx();
      
      private var m_arrTempArr:Array = [];
      
      public function BattleFieldView()
      {
         super();
         this.a_1072 = false;
         this.m_stMoveSp = new Sprite();
         this.addChild(this.m_stMoveSp);
         this.m_stBattleLayerManager = new BattleLayerManager();
         this.addChild(this.m_stBattleLayerManager);
      }
      
      public static function set a_1012(value:int) : void
      {
         ms_iYGridNumIntEx.Value = value;
      }
      
      public static function get a_1012() : int
      {
         return ms_iYGridNumIntEx.Value;
      }
      
      public static function set a_1013(value:int) : void
      {
         ms_iBattleFieldWidthEncrypIntEx.Value = value;
      }
      
      public static function get a_1013() : int
      {
         return ms_iBattleFieldWidthEncrypIntEx.Value;
      }
      
      public static function set ms_iServerLockStep(value:int) : void
      {
         ms_iServerLockStepIntEx = value;
      }
      
      public static function get ms_iServerLockStep() : int
      {
         return ms_iServerLockStepIntEx;
      }
      
      public static function set a_1014(value:int) : void
      {
         ms_iBattleFiledHeigthEncrypIntEx.Value = value;
      }
      
      public static function get a_1014() : int
      {
         return ms_iBattleFiledHeigthEncrypIntEx.Value;
      }
      
      public static function set m_iEarthHoleType(value:int) : void
      {
         m_iEarthHoleTypeEncrypIntEx.Value = value;
      }
      
      public static function get m_iEarthHoleType() : int
      {
         return m_iEarthHoleTypeEncrypIntEx.Value;
      }
      
      public static function get ms_isMyPlaced() : Boolean
      {
         if(!ms_isMyPlacedEx)
         {
            ms_isMyPlacedEx = new EncrypBooleanEx(false);
         }
         return ms_isMyPlacedEx.Value;
      }
      
      public static function set ms_isMyPlaced(value:Boolean) : void
      {
         if(!ms_isMyPlacedEx)
         {
            ms_isMyPlacedEx = new EncrypBooleanEx(false);
         }
         ms_isMyPlacedEx.Value = value;
      }
      
      public static function IsMagicFudgeLandDefense(typeID:int) : Boolean
      {
         return typeID == 288817280 || typeID == 288817294 || typeID == 288817295;
      }
      
      public static function IsMagicFudgeWaterDefense(typeID:int) : Boolean
      {
         return typeID == 288817264 || typeID == 288817278 || typeID == 288817279;
      }
      
      public static function IsMagicFudgeFusionWaterDefense(typeID:int) : Boolean
      {
         return typeID == 292552848 || typeID == 292552862 || typeID == 292552863;
      }
      
      public static function IsMagicFudgeFusionLandDefense(typeID:int) : Boolean
      {
         return typeID == 292552960 || typeID == 292552974 || typeID == 292552975;
      }
      
      private static function ConvertDefenseType(baseID:int, targetBaseID:int) : int
      {
         if((targetBaseID & 0xFFFF0000) == 288817152)
         {
            return (targetBaseID & 0xFFFFFFF0) + (baseID & 0x0F);
         }
         if((targetBaseID & 0xFFFF0000) == 292552704)
         {
            return baseID + 112;
         }
         return baseID;
      }
      
      public static function JudgeIsCooldownCard(cardID:uint) : Boolean
      {
         if(cardID == 288948688 || cardID == 288948702 || cardID == 288948703 || cardID == 288950016 || cardID == 288950030 || cardID == 288950031 || cardID == 288497728 || cardID == 288497742 || cardID == 288497743 || cardID == 288950032 || cardID == 288950046 || cardID == 288950047 || cardID == 288950064 || cardID == 288950078 || cardID == 288950079 || cardID == 288950272 || cardID == 288950286 || cardID == 288950287 || cardID == 288497770 || cardID == 288497771 || cardID == 288497772 || cardID == 288497744 || cardID == 288497758 || cardID == 288497759 || cardID == 288497770 || cardID == 288497771 || cardID == 288497772 || cardID == 288497773 || cardID == 288949776 || cardID == 288949790 || cardID == 288949791 || cardID == 286402096 || cardID == 286402110 || cardID == 286402111 || cardID == 286394512 || cardID == 286394526 || cardID == 286394527 || cardID == 288949856 || cardID == 288949870 || cardID == 288949871 || cardID == 288949882 || cardID == 288949883 || cardID == 288949884 || cardID == 288949885 || cardID == 286402352 || cardID == 286402366 || cardID == 286402367 || cardID == 15728641)
         {
            return true;
         }
         return false;
      }
      
      public static function JudgeIsCopyCard(cardID:uint) : Boolean
      {
         if(cardID == 288949204 || cardID == 288949214 || cardID == 288949215 || cardID == 288949248 || cardID == 288949262 || cardID == 288949263 || cardID == 288949760 || cardID == 288949774 || cardID == 288949775 || cardID == 288950026 || cardID == 288950027 || cardID == 288950028 || cardID == 288950029 || cardID == 288949504 || cardID == 288949518 || cardID == 288949519)
         {
            return true;
         }
         return false;
      }
      
      public function set m_iRandomXGridNo(value:int) : void
      {
         this.m_iRandomXGridNoEncrypIntEx.Value = value;
      }
      
      public function get m_iRandomXGridNo() : int
      {
         return this.m_iRandomXGridNoEncrypIntEx.Value;
      }
      
      public function set m_iRandomYGridNo(value:int) : void
      {
         this.m_iRandomYGridNoEncrypIntEx.Value = value;
      }
      
      public function get m_iRandomYGridNo() : int
      {
         return this.m_iRandomYGridNoEncrypIntEx.Value;
      }
      
      public function get ms_iFrozenBrokeTime() : int
      {
         return this.ms_iFrozenBrokeTimeEncrypIntEx.Value;
      }
      
      public function set ms_iFrozenBrokeTime(value:int) : void
      {
         this.ms_iFrozenBrokeTimeEncrypIntEx.Value = value;
      }
      
      public function get ms_iShihuaTime() : int
      {
         return this.ms_iShihuaTimeEncrypIntEx.Value;
      }
      
      public function set ms_iShihuaTime(value:int) : void
      {
         this.ms_iShihuaTimeEncrypIntEx.Value = value;
      }
      
      public function get m_isOwnBattleField() : Boolean
      {
         if(!this.m_isOwnBattleFieldEx)
         {
            this.m_isOwnBattleFieldEx = new EncrypBooleanEx(false);
         }
         return this.m_isOwnBattleFieldEx.Value;
      }
      
      public function set m_isOwnBattleField(value:Boolean) : void
      {
         if(!this.m_isOwnBattleFieldEx)
         {
            this.m_isOwnBattleFieldEx = new EncrypBooleanEx(false);
         }
         this.m_isOwnBattleFieldEx.Value = value;
      }
      
      public function get m_isAllowStartDropEnergy() : Boolean
      {
         if(!this.m_isAllowStartDropEnergyEx)
         {
            this.m_isAllowStartDropEnergyEx = new EncrypBooleanEx(true);
         }
         return this.m_isAllowStartDropEnergyEx.Value;
      }
      
      public function set m_isAllowStartDropEnergy(value:Boolean) : void
      {
         if(!this.m_isAllowStartDropEnergyEx)
         {
            this.m_isAllowStartDropEnergyEx = new EncrypBooleanEx(true);
         }
         this.m_isAllowStartDropEnergyEx.Value = value;
      }
      
      public function get m_MoveDefense() : a_3962
      {
         return this.m_stMoveDefense;
      }
      
      public function set m_MoveDefense(value:a_3962) : void
      {
         this.m_stMoveDefense = value;
      }
      
      public function get m_byIsEnterBossBattle() : Boolean
      {
         if(!this.m_byIsEnterBossBattleEx)
         {
            this.m_byIsEnterBossBattleEx = new EncrypBooleanEx(false);
         }
         return this.m_byIsEnterBossBattleEx.Value;
      }
      
      public function set m_byIsEnterBossBattle(value:Boolean) : void
      {
         if(!this.m_byIsEnterBossBattleEx)
         {
            this.m_byIsEnterBossBattleEx = new EncrypBooleanEx(false);
         }
         this.m_byIsEnterBossBattleEx.Value = value;
      }
      
      public function get m_isAutoPickUpEnergy() : Boolean
      {
         if(!this.m_isAutoPickUpEnergyEx)
         {
            this.m_isAutoPickUpEnergyEx = new EncrypBooleanEx(false);
         }
         return this.m_isAutoPickUpEnergyEx.Value;
      }
      
      public function set m_isAutoPickUpEnergy(value:Boolean) : void
      {
         if(!this.m_isAutoPickUpEnergyEx)
         {
            this.m_isAutoPickUpEnergyEx = new EncrypBooleanEx(false);
         }
         this.m_isAutoPickUpEnergyEx.Value = value;
      }
      
      public function get m_isAutoPickUpProps() : Boolean
      {
         if(!this.m_isAutoPickUpPropsEx)
         {
            this.m_isAutoPickUpPropsEx = new EncrypBooleanEx(false);
         }
         return this.m_isAutoPickUpPropsEx.Value;
      }
      
      public function set m_isAutoPickUpProps(value:Boolean) : void
      {
         if(!this.m_isAutoPickUpPropsEx)
         {
            this.m_isAutoPickUpPropsEx = new EncrypBooleanEx(false);
         }
         this.m_isAutoPickUpPropsEx.Value = value;
      }
      
      private function get a_1064() : Number
      {
         if(!this.m_iStartGetTimerTimestampEx)
         {
            this.m_iStartGetTimerTimestampEx = new EncrypNumber();
         }
         return this.m_iStartGetTimerTimestampEx.Value;
      }
      
      private function set a_1064(value:Number) : void
      {
         if(!this.m_iStartGetTimerTimestampEx)
         {
            this.m_iStartGetTimerTimestampEx = new EncrypNumber();
         }
         this.m_iStartGetTimerTimestampEx.Value = value;
      }
      
      private function get a_1065() : Number
      {
         if(!this.m_iStartDateTimestampEx)
         {
            this.m_iStartDateTimestampEx = new EncrypNumber();
         }
         return this.m_iStartDateTimestampEx.Value;
      }
      
      private function set a_1065(value:Number) : void
      {
         if(!this.m_iStartDateTimestampEx)
         {
            this.m_iStartDateTimestampEx = new EncrypNumber();
         }
         this.m_iStartDateTimestampEx.Value = value;
      }
      
      private function get a_1066() : int
      {
         return this.m_iTimeIntervalNumEx;
      }
      
      private function set a_1066(value:int) : void
      {
         this.m_iTimeIntervalNumEx = value;
      }
      
      private function get a_1067() : int
      {
         return this.m_iLastCheckTimeIntervalNumEx;
      }
      
      private function set a_1067(value:int) : void
      {
         this.m_iLastCheckTimeIntervalNumEx = value;
      }
      
      private function get a_1068() : int
      {
         return this.m_iLastAutoPickEnergyTimeNumEx;
      }
      
      private function set a_1068(value:int) : void
      {
         this.m_iLastAutoPickEnergyTimeNumEx = value;
      }
      
      private function get m_iLastAutoPickPropsTimeNum() : int
      {
         return this.m_iLastAutoPickPropsTimeNumEx;
      }
      
      private function set m_iLastAutoPickPropsTimeNum(value:int) : void
      {
         this.m_iLastAutoPickPropsTimeNumEx = value;
      }
      
      private function get a_1071() : int
      {
         if(!this.m_iIntruderMoveDirectionEx)
         {
            this.m_iIntruderMoveDirectionEx = new EncrypIntEx();
         }
         return this.m_iIntruderMoveDirectionEx.Value;
      }
      
      private function set a_1071(value:int) : void
      {
         if(!this.m_iIntruderMoveDirectionEx)
         {
            this.m_iIntruderMoveDirectionEx = new EncrypIntEx();
         }
         this.m_iIntruderMoveDirectionEx.Value = value;
      }
      
      public function get arrBackDepthBitmap() : Vector.<Bitmap>
      {
         return this.a_1061;
      }
      
      public function get arrFrontDepthBitmap() : Vector.<Bitmap>
      {
         return this.a_1060;
      }
      
      public function get stFieldRowIntruderStatusArray() : Vector.<int>
      {
         return this.a_1059;
      }
      
      public function AddRowIntruderNum(stBaseMoveIntruder:a_4206, iYGridNo:int, bIsMustAdd:Boolean = false) : void
      {
         if(bIsMustAdd || !stBaseMoveIntruder.isCannotSeeByFighter)
         {
            this.stFieldRowIntruderStatusArray[iYGridNo] += 1;
            this.printInfo(stBaseMoveIntruder,iYGridNo,1);
         }
         var lable:String = "";
         for(var i:int = 0; i < this.stFieldRowIntruderStatusArray.length; i++)
         {
            lable += "第" + i + "行老鼠数量:" + this.stFieldRowIntruderStatusArray[i] + "\n";
         }
         CDebugPane.Get().OnLog(lable);
      }
      
      public function ReduceRowIntruderNum(stBaseMoveIntruder:a_4206, iYGridNo:int) : void
      {
         if(!stBaseMoveIntruder.isCannotSeeByFighter)
         {
            this.stFieldRowIntruderStatusArray[iYGridNo] = this.stFieldRowIntruderStatusArray[iYGridNo] - 1;
            this.printInfo(stBaseMoveIntruder,iYGridNo,-1);
         }
         var lable:String = "";
         for(var i:int = 0; i < this.stFieldRowIntruderStatusArray.length; i++)
         {
            lable += "第" + i + "行老鼠数量:" + this.stFieldRowIntruderStatusArray[i] + "\n";
         }
         CDebugPane.Get().OnLog(lable);
      }
      
      private function printInfo(stBaseMoveIntruder:a_4206, iYGridNo:int, addValue:int) : void
      {
         var _loc5_:Error = null;
      }
      
      public function get iBattleFieldStageType() : int
      {
         return a_1055;
      }
      
      public function get isOwnBattleField() : Boolean
      {
         return this.m_isOwnBattleField;
      }
      
      public function get iIntruderMoveDirection() : int
      {
         return this.a_1071;
      }
      
      public function get stFieldGridsVector() : Array
      {
         return this.a_1058;
      }
      
      public function get stStaticFieldGridVector() : Array
      {
         return this.m_stStaticFieldGridVector;
      }
      
      public function get stCheckFieldGridsVector() : Array
      {
         return this.m_stCheckFieldGridsVector;
      }
      
      public function get iTimeIntervalNum() : int
      {
         return this.a_1066;
      }
      
      public function a_3422(iDefenseTypeID:int) : int
      {
         var i:int = 0;
         var j:int = 0;
         var iTotalGridNum:int = 0;
         for(i = 0; i < a_1012; i++)
         {
            for(j = 0; j < a_1011; j++)
            {
               if(null != this.a_1058[i][j].a_3493(iDefenseTypeID))
               {
                  iTotalGridNum++;
               }
            }
         }
         return iTotalGridNum;
      }
      
      public function a_3423() : int
      {
         var i:int = 0;
         var j:int = 0;
         var iTotalGridNum:int = 0;
         for(i = 0; i < a_1012; i++)
         {
            for(j = 0; j < a_1011; j++)
            {
               if(this.a_1058[i][j].a_3492())
               {
                  iTotalGridNum++;
               }
            }
         }
         return iTotalGridNum;
      }
      
      public function a_3424() : int
      {
         var i:int = 0;
         var j:int = 0;
         var iTotalGridNum:int = 0;
         for(i = 0; i < a_1012; i++)
         {
            for(j = 3; j < a_1011; j++)
            {
               if(!this.a_1058[i][j].m_isNeedTray && !this.a_1058[i][j].a_3492() && !this.a_1058[i][j].m_isExistMouseHole)
               {
                  iTotalGridNum++;
               }
            }
         }
         return iTotalGridNum;
      }
      
      public function a_3425() : int
      {
         var i:int = 0;
         var j:int = 0;
         var iTotalGridNum:int = 0;
         for(i = 0; i < a_1012; i++)
         {
            for(j = 0; j < a_1011; j++)
            {
               if(this.a_1058[i][j].m_isExistMouseHole)
               {
                  iTotalGridNum++;
               }
            }
         }
         return iTotalGridNum;
      }
      
      public function a_3426(iYGridNo:uint) : int
      {
         var j:int = 0;
         if(iYGridNo >= a_1012)
         {
            return 0;
         }
         var iTotalGridNum:int = 0;
         for(j = 0; j < a_1011; j++)
         {
            if(this.a_1058[iYGridNo][j].a_3492())
            {
               iTotalGridNum++;
            }
         }
         return iTotalGridNum;
      }
      
      public function GetFiledGrid2ThiefMouse(tick:int) : a_3491
      {
         var fieldGrid:a_3491 = null;
         var iGridYNo:int = 0;
         var iGridXNo:int = 0;
         if(tick - this.m_iStartThiefTick > 10)
         {
            this.m_iStartThiefTick = tick;
            this.m_lHasThiefGrid.length = 0;
            fieldGrid = this.GetFiledGrid2ThiefMouseInRange(0,8,0,6);
         }
         else if(this.m_lHasThiefGrid.length > 0)
         {
            iGridYNo = Math.floor(this.m_lHasThiefGrid[0] / 1000);
            iGridXNo = Math.floor(this.m_lHasThiefGrid[0] % 1000);
            fieldGrid = this.GetFiledGrid2ThiefMouseInRange(Math.max(iGridXNo - 1,0),Math.min(iGridXNo + 1,8),Math.max(iGridYNo - 1,0),Math.min(iGridYNo + 1,6));
         }
         if(fieldGrid != null)
         {
            this.m_lHasThiefGrid.push(fieldGrid.m_iYGridNo * 1000 + fieldGrid.m_iXGridNo);
         }
         return fieldGrid;
      }
      
      public function GetFiledGrid2ThiefMouseInRange(xStart:int, xEnd:int, yStart:int, yEnd:int) : a_3491
      {
         var i:int = 0;
         var j:int = 0;
         var stFieldGrid:a_3491 = null;
         var i1:int = 0;
         var i2:int = 0;
         var i3:int = 0;
         var lHasDefenceArray:Array = new Array();
         var lNullDefenceArray:Array = new Array();
         var lHeroDefenceArray:Array = new Array();
         for(i = yStart; i <= yEnd; i++)
         {
            for(j = xStart; j <= xEnd; j++)
            {
               if(this.m_lHasThiefGrid.indexOf(i * 1000 + j) == -1)
               {
                  stFieldGrid = this.a_1058[i][j];
                  if(stFieldGrid.a_3492())
                  {
                     if(Boolean(stFieldGrid.m_stAttackFighter) && stFieldGrid.m_stAttackFighter is a_3924)
                     {
                        lHeroDefenceArray.push(this.a_1058[i][j]);
                     }
                     else
                     {
                        lHasDefenceArray.push(this.a_1058[i][j]);
                     }
                  }
                  else
                  {
                     lNullDefenceArray.push(this.a_1058[i][j]);
                  }
               }
            }
         }
         if(lHasDefenceArray.length > 0)
         {
            i1 = int(m_stSpaceRandomSeed.nextInt(lHasDefenceArray.length));
            return lHasDefenceArray[i1];
         }
         if(lHeroDefenceArray.length > 0)
         {
            i2 = int(m_stSpaceRandomSeed.nextInt(lHeroDefenceArray.length));
            return lHeroDefenceArray[i2];
         }
         if(lNullDefenceArray.length > 0)
         {
            i3 = int(m_stSpaceRandomSeed.nextInt(lNullDefenceArray.length));
            return lNullDefenceArray[i3];
         }
         return null;
      }
      
      public function a_3427(iOrderNum:int) : a_3491
      {
         var i:int = 0;
         var j:int = 0;
         if(iOrderNum < 0 || iOrderNum > this.a_3423() - 1)
         {
            return null;
         }
         loop0:
         for(i = 0; i < a_1012; )
         {
            j = 0;
            while(true)
            {
               if(j >= a_1011)
               {
                  i++;
                  continue loop0;
               }
               if(this.a_1058[i][j].a_3492())
               {
                  if(0 == iOrderNum)
                  {
                     break;
                  }
                  iOrderNum--;
               }
               j++;
            }
            return this.a_1058[i][j];
         }
         return null;
      }
      
      public function a_3428(iOrderNum:int) : a_3491
      {
         var i:int = 0;
         var j:int = 0;
         if(iOrderNum < 0 || iOrderNum > this.a_3424() - 1)
         {
            return null;
         }
         loop0:
         for(i = 0; i < a_1012; )
         {
            j = 3;
            while(true)
            {
               if(j >= a_1011)
               {
                  i++;
                  continue loop0;
               }
               if(!this.a_1058[i][j].m_isNeedTray && !this.a_1058[i][j].a_3492() && !this.a_1058[i][j].m_isExistMouseHole)
               {
                  if(0 == iOrderNum)
                  {
                     break;
                  }
                  iOrderNum--;
               }
               j++;
            }
            return this.a_1058[i][j];
         }
         return null;
      }
      
      public function a_3429(iOrderNum:int) : a_3491
      {
         var i:int = 0;
         var j:int = 0;
         if(iOrderNum < 0 || iOrderNum > this.a_3425() - 1)
         {
            return null;
         }
         loop0:
         for(i = 0; i < a_1012; )
         {
            j = 0;
            while(true)
            {
               if(j >= a_1011)
               {
                  i++;
                  continue loop0;
               }
               if(this.a_1058[i][j].m_isExistMouseHole)
               {
                  if(0 == iOrderNum)
                  {
                     break;
                  }
                  iOrderNum--;
               }
               j++;
            }
            return this.a_1058[i][j];
         }
         return null;
      }
      
      public function a_3430(iCenterRowNum:int) : int
      {
         var iTotalIntruderNum:int = 0;
         if(iCenterRowNum >= 0 && iCenterRowNum < BattleFieldView.a_1012)
         {
            iTotalIntruderNum += this.stFieldRowIntruderStatusArray[iCenterRowNum];
         }
         if(iCenterRowNum + 1 >= 0 && iCenterRowNum + 1 < BattleFieldView.a_1012)
         {
            iTotalIntruderNum += this.stFieldRowIntruderStatusArray[iCenterRowNum + 1];
         }
         if(iCenterRowNum - 1 >= 0 && iCenterRowNum - 1 < BattleFieldView.a_1012)
         {
            iTotalIntruderNum += this.stFieldRowIntruderStatusArray[iCenterRowNum - 1];
         }
         return iTotalIntruderNum;
      }
      
      public function IsExistCanSeeMouse() : Boolean
      {
         for(var i:int = 0; i < BattleFieldView.a_1012; i++)
         {
            if(this.stFieldRowIntruderStatusArray[i] > 0)
            {
               return true;
            }
         }
         return false;
      }
      
      public function IsExistMouse() : Boolean
      {
         var stArray:Array = null;
         var stFieldGrid:a_3491 = null;
         loop0:
         for(var i:int = 0; i < BattleFieldView.a_1012; )
         {
            stArray = this.stFieldGridsVector[i];
            var _loc4_:int = 0;
            var _loc5_:* = stArray;
            do
            {
               for each(stFieldGrid in _loc5_)
               {
               }
               i++;
               continue loop0;
            }
            while(stFieldGrid.a_1511.length <= 0);
            return true;
         }
         return false;
      }
      
      public function GetFieldRowIntruderNumForFiveRow(iCenterRowNum:int) : int
      {
         var iTotalIntruderNum:int = 0;
         if(iCenterRowNum >= 0 && iCenterRowNum < BattleFieldView.a_1012)
         {
            iTotalIntruderNum += this.stFieldRowIntruderStatusArray[iCenterRowNum];
         }
         if(iCenterRowNum + 1 >= 0 && iCenterRowNum + 1 < BattleFieldView.a_1012)
         {
            iTotalIntruderNum += this.stFieldRowIntruderStatusArray[iCenterRowNum + 1];
         }
         if(iCenterRowNum - 1 >= 0 && iCenterRowNum - 1 < BattleFieldView.a_1012)
         {
            iTotalIntruderNum += this.stFieldRowIntruderStatusArray[iCenterRowNum - 1];
         }
         if(iCenterRowNum + 2 >= 0 && iCenterRowNum + 2 < BattleFieldView.a_1012)
         {
            iTotalIntruderNum += this.stFieldRowIntruderStatusArray[iCenterRowNum + 2];
         }
         if(iCenterRowNum - 2 >= 0 && iCenterRowNum - 2 < BattleFieldView.a_1012)
         {
            iTotalIntruderNum += this.stFieldRowIntruderStatusArray[iCenterRowNum - 2];
         }
         return iTotalIntruderNum;
      }
      
      public function GetFieldIntruderNumForThreeDirection(stFieldGrid:a_3491) : int
      {
         var iYIndex:int = 0;
         var iTotalIntruderNum:int = 0;
         if(stFieldGrid)
         {
            iTotalIntruderNum += this.stFieldRowIntruderStatusArray[stFieldGrid.m_iYGridNo];
            for(iYIndex = 0; iYIndex < BattleFieldView.a_1012; iYIndex++)
            {
               iTotalIntruderNum += this.a_3438(stFieldGrid.m_iXGridNo,iYIndex).a_1511.length;
            }
         }
         return iTotalIntruderNum;
      }
      
      public function a_3431(iSpaceState:int = -1) : a_4206
      {
         var stNearestMoveIntruder:a_4206 = null;
         var stMoveIntruder:a_4206 = null;
         for each(stMoveIntruder in this.m_arrBaseMoveIntruderVector)
         {
            if(stMoveIntruder.iLifeValue > 0 && !stMoveIntruder.isCannotSeeByFighter && (iSpaceState >= 0 && iSpaceState == stMoveIntruder.iSpaceState || -1 == iSpaceState && 1 != stMoveIntruder.iSpaceState))
            {
               if(null == stNearestMoveIntruder)
               {
                  stNearestMoveIntruder = stMoveIntruder;
               }
               if(this.a_1071 < 0 && stMoveIntruder.x < stNearestMoveIntruder.x)
               {
                  stNearestMoveIntruder = stMoveIntruder;
               }
               else if(this.a_1071 > 0 && stMoveIntruder.x > stNearestMoveIntruder.x)
               {
                  stNearestMoveIntruder = stMoveIntruder;
               }
            }
         }
         return stNearestMoveIntruder;
      }
      
      public function GetAllNearestIntruder() : a_4206
      {
         var stNearestMoveIntruder:a_4206 = null;
         var stMoveIntruder:a_4206 = null;
         for each(stMoveIntruder in this.m_arrBaseMoveIntruderVector)
         {
            if(stMoveIntruder.iLifeValue > 0 && (stMoveIntruder.iSpaceState == 1 || !stMoveIntruder.isCannotSeeByFighter))
            {
               if(null == stNearestMoveIntruder)
               {
                  stNearestMoveIntruder = stMoveIntruder;
               }
               if(this.a_1071 < 0 && stMoveIntruder.x < stNearestMoveIntruder.x)
               {
                  stNearestMoveIntruder = stMoveIntruder;
               }
               else if(this.a_1071 > 0 && stMoveIntruder.x > stNearestMoveIntruder.x)
               {
                  stNearestMoveIntruder = stMoveIntruder;
               }
            }
         }
         return stNearestMoveIntruder;
      }
      
      public function GetCurrentRowFirstIntruder(iYGridNo:int, oExcept:Object = null, bIsContainInvalidType:Boolean = true, iSpaceStateMask:int = 5) : a_4206
      {
         var stFieldGrid:a_3491 = null;
         var stBaseMoveIntruder:a_4206 = null;
         if(iYGridNo < 0 || iYGridNo >= a_1012)
         {
            return null;
         }
         for(var iXGridNo:int = 0; iXGridNo < a_1011; iXGridNo++)
         {
            stFieldGrid = this.a_3438(iXGridNo,iYGridNo);
            if(null != stFieldGrid && stFieldGrid.a_1511.length > 0)
            {
               for each(stBaseMoveIntruder in stFieldGrid.a_1511)
               {
                  if((false == bIsContainInvalidType || (stBaseMoveIntruder.m_stMoveIntruderTypeID & 0x0FFFFF) > 0) && (iSpaceStateMask & 1 << stBaseMoveIntruder.iSpaceState) > 0 && (null == oExcept || null == oExcept[stBaseMoveIntruder.m_stMoveIntruderTypeID]))
                  {
                     return stBaseMoveIntruder;
                  }
               }
            }
         }
         return null;
      }
      
      public function a_1797(iIntruderMoveDirection:int, stTDGameBattleUI:b_147) : Boolean
      {
         var i:int = 0;
         var j:int = 0;
         this.m_lHasThiefGrid.length = 0;
         this.m_iStartThiefTick = 0;
         if(null == stTDGameBattleUI)
         {
            trace("null == stTDGameBattleUI return false");
            return false;
         }
         this.a_1057 = stTDGameBattleUI;
         if(!this.a_1072)
         {
            this.m_stBaseShotVector = new Array();
            this.a_1058 = new Array();
            this.m_stStaticFieldGridVector = new Array();
            this.m_stCheckFieldGridsVector = new Array();
            this.m_arrBaseInsuranceVector = new Vector.<a_3972>();
            this.m_arrBaseMoveIntruderVector = new Array();
            this.m_arrBaseEnergyVector = new Vector.<a_4157>();
            this.m_arrDropPropsArray = [];
            this.m_arrDropCoinsArray = [];
            this.m_arrEffectArray = [];
            this.m_dicFoodBox = new Dictionary();
            this.m_BBQMasterGridBuffDic = new Dictionary();
            this.m_GoldZBSHeirGridBaseBuffDic = new Dictionary();
            this.m_GoldZBSHeirGridFirstBuffDic = new Dictionary();
            this.m_GoldZBSHeirGridSecondBuffDic = new Dictionary();
            this.m_CardCount = 0;
            this.a_1060 = new Vector.<Bitmap>(a_1012,true);
            this.a_1061 = new Vector.<Bitmap>(a_1012,true);
            this.m_stFieldRowSlipStatusArray = new Vector.<Boolean>(a_1012,true);
            for(i = 0; i < a_1012; i++)
            {
               this.m_stBaseShotVector[i] = new Array();
               this.a_1058[i] = new Array();
               this.m_stStaticFieldGridVector[i] = new Array();
               this.m_stCheckFieldGridsVector[i] = new Array();
               for(j = 0; j < a_1011; j++)
               {
                  this.a_1058[i][j] = new a_3491(this,j,i);
                  this.m_stStaticFieldGridVector[i][j] = new StaticFieldGrid(this,j,i);
                  this.m_stCheckFieldGridsVector[i][j] = new CheckFieldGrid(this,j,i);
               }
               this.a_1060[i] = new Bitmap();
               this.addChild(this.a_1060[i]);
               this.a_1061[i] = new Bitmap();
               this.addChild(this.a_1061[i]);
            }
            this.a_1062 = new Bitmap();
            this.addChild(this.a_1062);
            this.a_1063 = new Bitmap();
            this.addChild(this.a_1063);
            this.m_stRowBreakDownMoveIntruderBitmap = new Bitmap();
            this.addChild(this.m_stRowBreakDownMoveIntruderBitmap);
            this.m_stAvatarBreakDownBitmap = new Bitmap();
            this.a_1059 = new Vector.<int>(a_1012);
            this.m_stMoveIntruderManage = new a_4258();
            this.m_stMoveIntruderFactory = a_4255.getInstance();
            this.m_stLargeFogEffect = new a_4128();
            this.m_stDesertFogEffectSprite = new DesertFogEffectSprite();
         }
         for(i = 0; i < a_1012; i++)
         {
            this.a_1059[i] = 0;
            this.m_stFieldRowSlipStatusArray[i] = false;
         }
         this.a_1071 = iIntruderMoveDirection;
         parent.addChild(this.m_stLargeFogEffect);
         parent.addChild(this.m_stDesertFogEffectSprite);
         this.m_stRowBreakDownMoveIntruderBitmap.bitmapData = null;
         this.m_stAvatarBreakDownBitmap.bitmapData = null;
         this.m_stAvatarBreakDownBitmap.filters = [];
         this.a_1072 = true;
         return true;
      }
      
      public function getDesertFogSprite() : DesertFogEffectSprite
      {
         if(this.m_stDesertFogEffectSprite != null)
         {
            return this.m_stDesertFogEffectSprite;
         }
         return null;
      }
      
      public function a_3432() : void
      {
         var i:int = 0;
         var key:* = undefined;
         var stEffect:* = undefined;
         var stBaseInsurance:a_3972 = null;
         var j:int = 0;
         var stBaseShot:a_4348 = null;
         var stBaseMoveIntruder:a_4206 = null;
         var stBaseEnergy:a_4157 = null;
         var stDropProps:DisplayObject = null;
         var stDropCoins:DisplayObject = null;
         this.m_byIsEnterBossBattle = false;
         i = 0;
         while(Boolean(this.m_arrBaseInsuranceVector) && i < this.m_arrBaseInsuranceVector.length)
         {
            stBaseInsurance = this.m_arrBaseInsuranceVector[i];
            if(stBaseInsurance)
            {
               stBaseInsurance.a_3940();
            }
            i++;
         }
         i = 0;
         while(Boolean(this.a_1058) && i < a_1012)
         {
            for(j = 0; j < a_1011; j++)
            {
               this.a_1058[i][j].a_3502();
               this.m_stStaticFieldGridVector[i][j].a_3502();
               this.m_stCheckFieldGridsVector[i][j].a_3502();
            }
            i++;
         }
         for(i = 0; i < a_1012; i++)
         {
            if(Boolean(this.m_stBaseShotVector) && Boolean(this.m_stBaseShotVector[i]) && this.m_stBaseShotVector[i].length > 0)
            {
               for each(stBaseShot in this.m_stBaseShotVector[i].slice())
               {
                  stBaseShot.a_4350();
               }
            }
         }
         if(this.m_stMoveIntruderManage)
         {
            this.m_stMoveIntruderManage.a_1797();
         }
         if(this.m_arrBaseMoveIntruderVector)
         {
            for each(stBaseMoveIntruder in this.m_arrBaseMoveIntruderVector.slice())
            {
               stBaseMoveIntruder.visible = false;
               stBaseMoveIntruder.a_3432();
            }
         }
         if(this.m_arrBaseEnergyVector)
         {
            for each(stBaseEnergy in this.m_arrBaseEnergyVector.slice())
            {
               stBaseEnergy.a_4158();
            }
         }
         if(this.a_1058)
         {
            this.a_3415(0);
         }
         if(this.m_arrDropPropsArray)
         {
            for each(stDropProps in this.m_arrDropPropsArray.slice())
            {
               stDropProps.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
            }
            this.m_arrDropPropsArray = [];
         }
         if(this.m_arrDropCoinsArray)
         {
            for each(stDropCoins in this.m_arrDropCoinsArray.slice())
            {
               stDropCoins.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
            }
            this.m_arrDropCoinsArray = [];
         }
         for(key in this.m_dicFoodBox)
         {
            delete this.m_dicFoodBox[key];
         }
         this.ReleaseDictionary(this.m_BBQMasterGridBuffDic);
         this.ReleaseDictionary(this.m_GoldZBSHeirGridBaseBuffDic);
         this.ReleaseDictionary(this.m_GoldZBSHeirGridFirstBuffDic);
         this.ReleaseDictionary(this.m_GoldZBSHeirGridSecondBuffDic);
         this.m_CardCount = 0;
         if(this.m_stFieldRowSlipStatusArray)
         {
            for(i = 0; i < a_1012; i++)
            {
               this.m_stFieldRowSlipStatusArray[i] = false;
            }
         }
         while(this.m_arrEffectArray.length > 0)
         {
            stEffect = this.m_arrEffectArray.pop();
            if(stEffect)
            {
               stEffect.a_3940();
            }
         }
         EffectManager.getInstance().ReleaseAll();
      }
      
      private function ReleaseDictionary(dict:Dictionary) : void
      {
         var key:* = undefined;
         var obj:* = undefined;
         for(key in dict)
         {
            obj = dict[key];
            if(obj)
            {
               obj.a_3940();
            }
            delete dict[key];
         }
      }
      
      public function a_3433() : int
      {
         return 0;
      }
      
      public function a_3434() : int
      {
         return 0;
      }
      
      public function a_3415(iGameMode:int) : Boolean
      {
         var i:int = 0;
         var j:int = 0;
         for(i = 0; i < a_1012; i++)
         {
            for(j = 0; j < a_1011; j++)
            {
               this.a_1058[i][j].m_isNeedTray = false;
               this.a_1058[i][j].m_isSilent = false;
               this.a_1058[i][j].m_isClawMark = false;
               this.a_1058[i][j].m_iFieldGridType = 0;
            }
         }
         if(1 == iGameMode)
         {
            for(j = 0; j < a_1011; j++)
            {
               this.a_1058[2][j].m_isNeedTray = true;
               this.a_1058[3][j].m_isNeedTray = true;
            }
         }
         else if(2 == iGameMode)
         {
            for(j = 0; j < a_1011; j++)
            {
               this.a_1058[2][j].m_isNeedTray = true;
               this.a_1058[3][j].m_isNeedTray = true;
               this.a_1058[4][j].m_isNeedTray = true;
            }
         }
         else if(3 == iGameMode)
         {
            for(j = 0; j < a_1011; j++)
            {
               this.a_1058[0][j].m_isNeedTray = true;
               this.a_1058[1][j].m_isNeedTray = true;
               this.a_1058[5][j].m_isNeedTray = true;
               this.a_1058[6][j].m_isNeedTray = true;
            }
         }
         else if(4 == iGameMode)
         {
            for(i = 0; i < a_1012; i++)
            {
               for(j = 0; j < a_1011; j++)
               {
                  this.a_1058[i][j].m_isNeedTray = true;
               }
            }
         }
         else if(5 == iGameMode)
         {
            a_1056 = true;
         }
         else if(6 == iGameMode)
         {
            for(i = 0; i < a_1012; i++)
            {
               for(j = 0; j < a_1011; j++)
               {
                  this.a_1058[i][j].m_isNeedTray = true;
               }
            }
         }
         else if(7 != iGameMode)
         {
            if(8 != iGameMode)
            {
               if(9 != iGameMode)
               {
                  if(10 == iGameMode)
                  {
                     this.a_1058[0][0].m_iFieldGridType = 3;
                     this.a_1058[0][4].m_iFieldGridType = 3;
                     this.a_1058[0][8].m_iFieldGridType = 3;
                     this.a_1058[4][0].m_iFieldGridType = 3;
                     this.a_1058[4][8].m_iFieldGridType = 3;
                     this.a_1058[5][0].m_iFieldGridType = 3;
                     this.a_1058[5][1].m_iFieldGridType = 3;
                     this.a_1058[5][7].m_iFieldGridType = 3;
                     this.a_1058[5][8].m_iFieldGridType = 3;
                     this.a_1058[6][0].m_iFieldGridType = 3;
                     this.a_1058[6][1].m_iFieldGridType = 3;
                     this.a_1058[6][2].m_iFieldGridType = 3;
                     this.a_1058[6][6].m_iFieldGridType = 3;
                     this.a_1058[6][7].m_iFieldGridType = 3;
                     this.a_1058[6][8].m_iFieldGridType = 3;
                  }
               }
            }
         }
         if(this.isOwnBattleField)
         {
            this.m_stLargeFogEffect.x = x;
            this.m_stDesertFogEffectSprite.x = x;
         }
         else
         {
            this.m_stLargeFogEffect.x = x - 5 * a_3491.a_1080;
            this.m_stDesertFogEffectSprite.x = x - 5 * a_3491.a_1080;
         }
         this.m_stLargeFogEffect.y = y - a_3491.a_1081;
         this.m_stLargeFogEffect.a_1797();
         this.m_stDesertFogEffectSprite.y = y - a_3491.a_1081;
         this.a_3462(4);
         return true;
      }
      
      public function a_3435() : Boolean
      {
         var stFieldGrid:a_3491 = null;
         var stStaticFieldGrid:StaticFieldGrid = null;
         var checkFieldGrid:CheckFieldGrid = null;
         var i:int = 0;
         var j:int = 0;
         var stBaseInsurance:a_3972 = null;
         this.m_bIsTick1 = false;
         this.a_763 = 0;
         this.m_iClientIntruderID = 5000;
         this.m_iGolobalShotID = 0;
         this.a_1066 = 0;
         BattleFieldView.ms_iServerLockStep = 0;
         this.a_1067 = 0;
         this.a_1068 = 0;
         this.m_iLastAutoPickPropsTimeNum = 0;
         this.a_1064 = getTimer();
         this.a_1065 = new Date().time;
         for(i = 0; i < a_1012; i++)
         {
            for(j = 0; j < a_1011; j++)
            {
               stFieldGrid = this.a_1058[i][j];
               stFieldGrid.m_iXGridNo = j;
               stFieldGrid.m_iInitialXGridNo = j;
               stFieldGrid.m_iYGridNo = i;
               stFieldGrid.m_iInitialYGridNo = i;
               stStaticFieldGrid = this.m_stStaticFieldGridVector[i][j];
               stStaticFieldGrid.m_iXGridNo = j;
               stStaticFieldGrid.m_iInitialXGridNo = j;
               stStaticFieldGrid.m_iYGridNo = i;
               stStaticFieldGrid.m_iInitialYGridNo = i;
               checkFieldGrid = this.m_stCheckFieldGridsVector[i][j];
               checkFieldGrid.m_iXGridNo = j;
               checkFieldGrid.m_iInitialXGridNo = j;
               checkFieldGrid.m_iYGridNo = i;
               checkFieldGrid.m_iInitialYGridNo = i;
            }
         }
         for(i = 0; i < a_1012; i++)
         {
            if(this.IsOceanChapter)
            {
               stBaseInsurance = a_4012.getInstance().GetObject(285212675) as a_3972;
            }
            else if(this.IsWonderLand)
            {
               stBaseInsurance = a_4012.getInstance().GetObject(285212676) as a_3972;
            }
            else if(this.IsCrab)
            {
               stBaseInsurance = a_4012.getInstance().GetObject(285212672) as a_3972;
            }
            else if(this.a_1058[i][0].m_isNeedTray)
            {
               stBaseInsurance = a_4012.getInstance().GetObject(285212672) as a_3972;
            }
            else
            {
               stBaseInsurance = a_4012.getInstance().GetObject(285212673) as a_3972;
            }
            if(null != stBaseInsurance)
            {
               stBaseInsurance.iDefenseTypeID = 285212672;
               stBaseInsurance.a_1797(this.a_1058[i][0]);
               stBaseInsurance.m_bCheckGoHit = false;
               stBaseInsurance.x = this.a_1071 > 0 ? a_1013 + stBaseInsurance.width : -stBaseInsurance.width;
               stBaseInsurance.y = a_3491.a_1081 * i + (a_3491.a_1081 - stBaseInsurance.height);
               this.m_stBattleLayerManager.AddToBattleView(stBaseInsurance,BattleLayerDefine.DEFENSE_ATTACK_FIGHTER_TYPE,this.a_3438(0,i));
               this.m_arrBaseInsuranceVector[i] = stBaseInsurance;
               if(!this.isOwnBattleField && Boolean(a_1054))
               {
                  a_1054.a_3575(b_203.a_439,0,i);
               }
            }
         }
         return true;
      }
      
      public function a_1847() : Boolean
      {
         var i:int = 0;
         var j:int = 0;
         var stMoveIntruder:a_4206 = null;
         for(i = 0; i < a_1012; i++)
         {
            for(j = 0; j < a_1011; j++)
            {
               if(this.a_1058[i][j].m_isOccupy)
               {
                  for each(stMoveIntruder in this.a_1058[i][j].a_1511)
                  {
                     stMoveIntruder.stop();
                  }
               }
            }
         }
         this.m_stBaseGameMap = null;
         this.m_stBattleLayerManager.CleanUp();
         return true;
      }
      
      public function a_3436(uiTickCount:int, iDefenseType:int, byXGridNo:int, byYGridNo:int) : Boolean
      {
         var stAurDataEvent:a_1778 = null;
         var stFieldGrid:a_3491 = this.a_3438(byXGridNo,byYGridNo);
         if(null == stFieldGrid)
         {
            return false;
         }
         if(this.m_isOwnBattleField && Boolean(root))
         {
            stAurDataEvent = new a_1778("DefenseCardCountChange");
            stAurDataEvent.dataObjectNew = [iDefenseType,this.a_3422(iDefenseType),stFieldGrid];
            root.dispatchEvent(stAurDataEvent);
         }
         if(null != stFieldGrid.m_stAttackFighter && stFieldGrid.m_stAttackFighter.a_3512() == iDefenseType)
         {
            return this.a_3450(byXGridNo,byYGridNo);
         }
         if(null != stFieldGrid.m_stHoneyTrapBaseDefense && stFieldGrid.m_stHoneyTrapBaseDefense.a_3512() == iDefenseType)
         {
            return this.CancelHoneyTrapAttackFighter(byXGridNo,byYGridNo);
         }
         if(null != stFieldGrid.m_stProtector && stFieldGrid.m_stProtector.a_3512() == iDefenseType)
         {
            return this.a_3449(byXGridNo,byYGridNo);
         }
         if(null != stFieldGrid.m_stTrayDefense && stFieldGrid.m_stTrayDefense.a_3512() == iDefenseType)
         {
            return this.a_3451(byXGridNo,byYGridNo);
         }
         if(null != stFieldGrid.m_stBoomDefense && stFieldGrid.m_stBoomDefense.a_3512() == iDefenseType)
         {
            return this.a_3453(byXGridNo,byYGridNo);
         }
         if(null != stFieldGrid.m_stFlowerDefense && stFieldGrid.m_stFlowerDefense.a_3512() == iDefenseType)
         {
            return this.a_3454(byXGridNo,byYGridNo);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter && stFieldGrid.m_stBaseAuxiliaryFighter.a_3512() == iDefenseType)
         {
            return this.a_3452(byXGridNo,byYGridNo);
         }
         return false;
      }
      
      public function a_2180() : int
      {
         return this.a_763++;
      }
      
      public function GetClientIntruderID() : int
      {
         return this.m_iClientIntruderID++;
      }
      
      public function GetGlobalShotID() : int
      {
         return this.m_iGolobalShotID++;
      }
      
      public function a_3416(a_4730:Event) : void
      {
         var stPendingAddIntruder:Object = null;
         var stBaseEnergy:a_4157 = null;
         var stDropProps:DisplayObject = null;
         var stDropCoins:DisplayObject = null;
         var iGetTimerTimeIntervalNum:int = int((getTimer() - this.a_1064) / 25);
         var iDateTimeIntervalNum:int = int((new Date().time - this.a_1065) / 25);
         if(Math.abs(iDateTimeIntervalNum - this.a_1067) > 40)
         {
            this.a_1065 += (iDateTimeIntervalNum - this.a_1067) * 25;
            iDateTimeIntervalNum = this.a_1067 + 1;
         }
         this.m_iTick25Count = iGetTimerTimeIntervalNum;
         if(Math.abs(iGetTimerTimeIntervalNum - iDateTimeIntervalNum) > 80)
         {
            this.m_iTick25Count = iDateTimeIntervalNum;
         }
         var iCheckTimes:* = int(this.m_iTick25Count - this.a_1067);
         while(iCheckTimes-- > 0)
         {
            ++this.a_1067;
            if(iCheckTimes <= 200)
            {
               if(this.m_bIsTick1)
               {
                  ++this.a_1066;
                  stPendingAddIntruder = this.m_stMoveIntruderManage.a_4259(this.a_1066);
                  if(stPendingAddIntruder)
                  {
                     this.a_3456(stPendingAddIntruder);
                  }
                  this.UpdateAllShotAndDefense(this.a_1066);
               }
               else
               {
                  this.UpdateAllIntruder(this.a_1066);
                  this.UpdateAllEnergy(this.a_1066);
               }
               if(this.m_isAutoPickUpEnergy && this.a_1066 - this.a_1068 >= 60 && Boolean(this.m_arrBaseEnergyVector))
               {
                  this.a_1068 = this.a_1066;
                  for each(stBaseEnergy in this.m_arrBaseEnergyVector)
                  {
                     stBaseEnergy.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_OVER));
                  }
               }
               if(Boolean(this.m_isAutoPickUpProps && this.a_1066 - this.m_iLastAutoPickPropsTimeNum >= 60) && Boolean(this.m_arrDropPropsArray) && Boolean(this.m_arrDropCoinsArray))
               {
                  this.m_iLastAutoPickPropsTimeNum = this.a_1066;
                  for each(stDropProps in this.m_arrDropPropsArray.slice())
                  {
                     stDropProps.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                  }
                  for each(stDropCoins in this.m_arrDropCoinsArray.slice())
                  {
                     stDropCoins.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                  }
               }
               this.m_bIsTick1 = !this.m_bIsTick1;
            }
         }
      }
      
      private function UpdateAllShotAndDefense(iTimeIntervals:int) : void
      {
         var shot:a_4348 = null;
         var s:* = 0;
         var j:int = 0;
         var stGrid:a_3491 = null;
         var stAttackFighter:a_3953 = null;
         var stHoneyTrapFighter:a_3953 = null;
         for(var i:int = 0; i < a_1012; i++)
         {
            this.m_arrTempArr.length = 0;
            for each(shot in this.m_stBaseShotVector[i])
            {
               this.m_arrTempArr.push(shot);
            }
            for(s = int(this.m_arrTempArr.length - 1); s >= 0; s--)
            {
               this.m_arrTempArr[s].a_4216(iTimeIntervals);
            }
            for(j = 0; j < a_1011; j++)
            {
               stGrid = this.a_1058[i][j];
               stAttackFighter = stGrid.m_stAttackFighter;
               stHoneyTrapFighter = stGrid.m_stHoneyTrapBaseDefense;
               if(stAttackFighter != null && stAttackFighter.stFieldGrid != null)
               {
                  if((stAttackFighter.isShotAllTheTime || this.a_1059[i] > 0) && !stAttackFighter.m_isShowFrozen)
                  {
                     if(!stAttackFighter.stFieldGrid.m_isSilent || m_CannotSilentCard.indexOf(stAttackFighter.a_3512()) != -1)
                     {
                        lastAttacker = stAttackFighter;
                        stAttackFighter.a_3954(iTimeIntervals);
                        lastAttacker = null;
                     }
                  }
                  stAttackFighter.a_3957(iTimeIntervals);
               }
               if(stHoneyTrapFighter != null && stHoneyTrapFighter.stFieldGrid != null)
               {
                  if((stHoneyTrapFighter.isShotAllTheTime || this.a_1059[i] > 0) && !stHoneyTrapFighter.m_isShowFrozen)
                  {
                     if(!stHoneyTrapFighter.stFieldGrid.m_isSilent || m_CannotSilentCard.indexOf(stHoneyTrapFighter.a_3512()) != -1)
                     {
                        lastAttacker = stHoneyTrapFighter;
                        stHoneyTrapFighter.a_3954(iTimeIntervals);
                        lastAttacker = null;
                     }
                  }
                  stHoneyTrapFighter.a_3957(iTimeIntervals);
               }
               if(stGrid.m_stTrayDefense)
               {
                  stGrid.m_stTrayDefense.a_3957(iTimeIntervals);
               }
               if(stGrid.m_stAccelerationEffect)
               {
                  stGrid.m_stAccelerationEffect.a_3957(iTimeIntervals);
               }
               if(stGrid.m_stBaseAuxiliaryFighter)
               {
                  stGrid.m_stBaseAuxiliaryFighter.a_3957(iTimeIntervals);
               }
               if(stGrid.m_stFlowerDefense)
               {
                  stGrid.m_stFlowerDefense.a_3957(iTimeIntervals);
               }
               if(stGrid.m_stProtector)
               {
                  stGrid.m_stProtector.a_3957(iTimeIntervals);
               }
               if(stGrid.m_stBaseToolDefense)
               {
                  stGrid.m_stBaseToolDefense.a_3957(iTimeIntervals);
               }
               if(stGrid.m_stMageSnakePoisonBuff)
               {
                  stGrid.m_stMageSnakePoisonBuff.a_3957(iTimeIntervals);
               }
               if(stGrid.m_stBattleBarrierHorseDefense)
               {
                  stGrid.m_stBattleBarrierHorseDefense.a_3957(iTimeIntervals);
               }
            }
         }
      }
      
      private function UpdateAllIntruder(iTimeIntervals:int) : void
      {
         var j:int = 0;
         var stGrid:a_3491 = null;
         var intruder:a_4206 = null;
         var k:int = 0;
         var stIntruder:a_4206 = null;
         var iMove:Number = NaN;
         var stBaseMoveIntruder:a_4206 = null;
         for(var i:int = 0; i < a_1012; i++)
         {
            for(j = 0; j < a_1011; j++)
            {
               stGrid = this.a_1058[i][j];
               stGrid.buffCom.UpdateBuff(1);
               if(stGrid.m_isOccupy)
               {
                  this.m_arrTempArr.length = 0;
                  for each(intruder in stGrid.a_1511)
                  {
                     this.m_arrTempArr.push(intruder);
                  }
                  for(k = 0; k < this.m_arrTempArr.length; k++)
                  {
                     stIntruder = this.m_arrTempArr[k];
                     if(stIntruder.m_stCurrentFieldGrid != null && stIntruder.parent != null)
                     {
                        stIntruder.ShowPlayEffect(iTimeIntervals);
                        BattleFieldView.lastMouseMoveIntruder = stIntruder;
                        stIntruder.a_4216(iTimeIntervals);
                        BattleFieldView.lastMouseMoveIntruder = null;
                     }
                  }
               }
               if(Boolean(stGrid.m_stBoomDefense) && !stGrid.m_stBoomDefense.m_isShowFrozen)
               {
                  stGrid.m_stBoomDefense.a_3961(iTimeIntervals);
               }
            }
            if(this.m_arrBaseInsuranceVector[i])
            {
               if(this.m_arrBaseInsuranceVector[i].m_bCheckGoHit)
               {
                  iMove = this.m_arrBaseInsuranceVector[i].x;
                  this.m_arrBaseInsuranceVector[i].a_3973(iTimeIntervals);
               }
               else
               {
                  this.m_arrBaseInsuranceVector[i].a_3973(iTimeIntervals);
               }
            }
         }
         if(iTimeIntervals % 2 == 0)
         {
            this.m_arrTempArr.length = 0;
            for each(stBaseMoveIntruder in this.m_arrBaseMoveIntruderVector)
            {
               this.m_arrTempArr.push(stBaseMoveIntruder);
            }
            for each(stBaseMoveIntruder in this.m_arrTempArr)
            {
               if(stBaseMoveIntruder.parent != null && stBaseMoveIntruder.m_stCurrentFieldGrid != null)
               {
                  stBaseMoveIntruder.a_4140(iTimeIntervals);
               }
            }
         }
      }
      
      private function UpdateAllEnergy(iTimeIntervals:int) : void
      {
         var stBaseEnergy:a_4157 = null;
         var stFreeEnergy:a_4157 = null;
         var iDropEnergyValue:int = 0;
         var stGameBasePop:IBaseProp = null;
         var stPropDisplayEffect:MovieClip = null;
         this.m_arrTempArr.length = 0;
         for each(stBaseEnergy in this.m_arrBaseEnergyVector)
         {
            this.m_arrTempArr.push(stBaseEnergy);
         }
         for each(stBaseEnergy in this.m_arrTempArr)
         {
            stBaseEnergy.a_4140(iTimeIntervals);
         }
         if(1 == a_1055 && iTimeIntervals % 140 == 0 && iTimeIntervals > 0 && this.m_isAllowStartDropEnergy)
         {
            stFreeEnergy = a_4162.getInstance().a_4163(b_180.a_420);
            if(stFreeEnergy)
            {
               iDropEnergyValue = this.isOwnBattleField ? int(a_3971.a_1341 * 25) : 5;
               stGameBasePop = this.a_1070.pop();
               if(stGameBasePop)
               {
                  iDropEnergyValue += stGameBasePop.a_4328().m_iEffectValue;
               }
               stFreeEnergy.m_stCurrentBattleField = this;
               stFreeEnergy.a_1797(0,iDropEnergyValue,0.6 * a_1013 * Math.random(),-50,a_3491.a_1081 / 30,160 + 160 * Math.random());
               this.addChild(stFreeEnergy);
               if(stGameBasePop)
               {
                  stPropDisplayEffect = stGameBasePop.a_4327();
                  stPropDisplayEffect.x = stFreeEnergy.width;
                  stPropDisplayEffect.y = -20;
                  stFreeEnergy.addChild(stPropDisplayEffect);
               }
            }
         }
      }
      
      public function OnCheckTimerEvent111(a_4730:Event) : void
      {
         var stBaseEnergy:a_4157 = null;
         var stDropProps:DisplayObject = null;
         var stDropCoins:DisplayObject = null;
         var iGetTimerTimeIntervalNum:int = int((getTimer() - this.a_1064) / 50);
         var iDateTimeIntervalNum:int = int((new Date().time - this.a_1065) / 50);
         if(Math.abs(iDateTimeIntervalNum - this.a_1067) > 20)
         {
            this.a_1065 += (iDateTimeIntervalNum - this.a_1067) * 50;
            iDateTimeIntervalNum = this.a_1067 + 1;
         }
         this.a_1066 = iGetTimerTimeIntervalNum;
         if(Math.abs(iGetTimerTimeIntervalNum - iDateTimeIntervalNum) > 40)
         {
            this.a_1066 = iDateTimeIntervalNum;
         }
         var iCheckTimes:* = int(this.a_1066 - this.a_1067);
         while(iCheckTimes-- > 0)
         {
            ++this.a_1067;
            if(iCheckTimes <= 100)
            {
               this.a_3437(this.a_1067);
            }
         }
         if(this.m_isAutoPickUpEnergy && this.a_1066 - this.a_1068 >= 60 && Boolean(this.m_arrBaseEnergyVector))
         {
            this.a_1068 = this.a_1066;
            for each(stBaseEnergy in this.m_arrBaseEnergyVector)
            {
               stBaseEnergy.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_OVER));
            }
         }
         if(Boolean(this.m_isAutoPickUpProps && this.a_1066 - this.m_iLastAutoPickPropsTimeNum >= 60) && Boolean(this.m_arrDropPropsArray) && Boolean(this.m_arrDropCoinsArray))
         {
            this.m_iLastAutoPickPropsTimeNum = this.a_1066;
            for each(stDropProps in this.m_arrDropPropsArray.slice())
            {
               stDropProps.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
            }
            for each(stDropCoins in this.m_arrDropCoinsArray.slice())
            {
               stDropCoins.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
            }
         }
      }
      
      private function a_3437(iTimeIntervals:int) : Boolean
      {
         var i:int = 0;
         var j:int = 0;
         var stBaseEnergy:a_4157 = null;
         var shot:a_4348 = null;
         var s:* = 0;
         var stGrid:a_3491 = null;
         var stAttackFighter:a_3953 = null;
         var stHoneyTrapFighter:a_3953 = null;
         var intruder:a_4206 = null;
         var k:int = 0;
         var stIntruder:a_4206 = null;
         var iMove:Number = NaN;
         var stBaseMoveIntruder:a_4206 = null;
         var stFreeEnergy:a_4157 = null;
         var iDropEnergyValue:int = 0;
         var stGameBasePop:IBaseProp = null;
         var stPropDisplayEffect:MovieClip = null;
         var stPendingAddIntruder:Object = this.m_stMoveIntruderManage.a_4259(iTimeIntervals);
         if(null != stPendingAddIntruder)
         {
            this.a_3456(stPendingAddIntruder);
         }
         for(i = 0; i < a_1012; i++)
         {
            this.m_arrTempArr.length = 0;
            for each(shot in this.m_stBaseShotVector[i])
            {
               this.m_arrTempArr.push(shot);
            }
            for(s = int(this.m_arrTempArr.length - 1); s >= 0; s--)
            {
               this.m_arrTempArr[s].a_4216(iTimeIntervals);
            }
            for(j = 0; j < a_1011; j++)
            {
               stGrid = this.a_1058[i][j];
               stAttackFighter = stGrid.m_stAttackFighter;
               stHoneyTrapFighter = stGrid.m_stHoneyTrapBaseDefense;
               if(stAttackFighter != null && stAttackFighter.stFieldGrid != null)
               {
                  if((stAttackFighter.isShotAllTheTime || this.a_1059[i] > 0) && !stAttackFighter.m_isShowFrozen)
                  {
                     if(!stAttackFighter.stFieldGrid.m_isSilent)
                     {
                        lastAttacker = stAttackFighter;
                        stAttackFighter.a_3954(iTimeIntervals);
                        lastAttacker = null;
                     }
                     else if(m_CannotSilentCard.indexOf(stAttackFighter.a_3512()) != -1)
                     {
                        lastAttacker = stAttackFighter;
                        stAttackFighter.a_3954(iTimeIntervals);
                        lastAttacker = null;
                     }
                  }
                  stAttackFighter.a_3957(iTimeIntervals);
               }
               if(stHoneyTrapFighter != null && stHoneyTrapFighter.stFieldGrid != null)
               {
                  if((stHoneyTrapFighter.isShotAllTheTime || this.a_1059[i] > 0) && !stHoneyTrapFighter.m_isShowFrozen)
                  {
                     if(!stHoneyTrapFighter.stFieldGrid.m_isSilent)
                     {
                        lastAttacker = stHoneyTrapFighter;
                        stHoneyTrapFighter.a_3954(iTimeIntervals);
                        lastAttacker = null;
                     }
                     else if(m_CannotSilentCard.indexOf(stHoneyTrapFighter.a_3512()) != -1)
                     {
                        lastAttacker = stHoneyTrapFighter;
                        stHoneyTrapFighter.a_3954(iTimeIntervals);
                        lastAttacker = null;
                     }
                  }
                  stHoneyTrapFighter.a_3957(iTimeIntervals);
               }
               if(stGrid.m_stTrayDefense)
               {
                  stGrid.m_stTrayDefense.a_3957(iTimeIntervals);
               }
               if(stGrid.m_stAccelerationEffect)
               {
                  stGrid.m_stAccelerationEffect.a_3957(iTimeIntervals);
               }
               if(stGrid.m_stBaseAuxiliaryFighter)
               {
                  stGrid.m_stBaseAuxiliaryFighter.a_3957(iTimeIntervals);
               }
               if(stGrid.m_stFlowerDefense)
               {
                  stGrid.m_stFlowerDefense.a_3957(iTimeIntervals);
               }
               if(stGrid.m_stProtector)
               {
                  stGrid.m_stProtector.a_3957(iTimeIntervals);
               }
               if(stGrid.m_stBaseToolDefense)
               {
                  stGrid.m_stBaseToolDefense.a_3957(iTimeIntervals);
               }
               if(stGrid.m_isOccupy)
               {
                  this.m_arrTempArr.length = 0;
                  for each(intruder in stGrid.a_1511)
                  {
                     this.m_arrTempArr.push(intruder);
                  }
                  for(k = 0; k < this.m_arrTempArr.length; k++)
                  {
                     stIntruder = this.m_arrTempArr[k];
                     if(stIntruder.m_stCurrentFieldGrid != null && stIntruder.parent != null)
                     {
                        stIntruder.ShowPlayEffect(iTimeIntervals);
                        BattleFieldView.lastMouseMoveIntruder = stIntruder;
                        stIntruder.a_4216(iTimeIntervals);
                        BattleFieldView.lastMouseMoveIntruder = null;
                     }
                  }
               }
               if(Boolean(stGrid.m_stBoomDefense) && !stGrid.m_stBoomDefense.m_isShowFrozen)
               {
                  stGrid.m_stBoomDefense.a_3961(iTimeIntervals);
               }
               if(stGrid.m_stMageSnakePoisonBuff)
               {
                  stGrid.m_stMageSnakePoisonBuff.a_3957(iTimeIntervals);
               }
            }
            if(null != this.m_arrBaseInsuranceVector[i])
            {
               if(this.m_arrBaseInsuranceVector[i].m_bCheckGoHit)
               {
                  iMove = 0;
                  iMove = this.m_arrBaseInsuranceVector[i].x;
                  this.m_arrBaseInsuranceVector[i].a_3973(iTimeIntervals);
                  if(Boolean(this.m_arrBaseInsuranceVector[i]) && iMove == this.m_arrBaseInsuranceVector[i].x)
                  {
                  }
               }
               else
               {
                  this.m_arrBaseInsuranceVector[i].a_3973(iTimeIntervals);
               }
            }
         }
         if(iTimeIntervals % 2 == 0)
         {
            for each(stBaseMoveIntruder in this.m_arrBaseMoveIntruderVector.slice())
            {
               if(stBaseMoveIntruder.parent != null && stBaseMoveIntruder.m_stCurrentFieldGrid != null)
               {
                  stBaseMoveIntruder.a_4140(iTimeIntervals);
               }
            }
         }
         for each(stBaseEnergy in this.m_arrBaseEnergyVector.slice())
         {
            stBaseEnergy.a_4140(iTimeIntervals);
         }
         if(1 == a_1055 && iTimeIntervals % 140 == 0 && iTimeIntervals > 0 && this.m_isAllowStartDropEnergy)
         {
            stFreeEnergy = a_4162.getInstance().a_4163(b_180.a_420);
            if(null != stFreeEnergy && 1 == a_1055 && iTimeIntervals % 140 == 0 && iTimeIntervals > 0 && this.m_isAllowStartDropEnergy)
            {
               iDropEnergyValue = this.isOwnBattleField ? int(a_3971.a_1341 * 25) : 5;
               stGameBasePop = this.a_1070.pop();
               if(stGameBasePop)
               {
                  iDropEnergyValue += stGameBasePop.a_4328().m_iEffectValue;
               }
               stFreeEnergy.m_stCurrentBattleField = this;
               stFreeEnergy.a_1797(0,iDropEnergyValue,0.6 * a_1013 * Math.random(),-50,a_3491.a_1081 / 30,160 + 160 * Math.random());
               this.addChild(stFreeEnergy);
               if(stGameBasePop)
               {
                  stPropDisplayEffect = stGameBasePop.a_4327();
                  stPropDisplayEffect.x = stFreeEnergy.width;
                  stPropDisplayEffect.y = -20;
                  stFreeEnergy.addChild(stPropDisplayEffect);
               }
            }
            else
            {
               stFreeEnergy.a_4158();
            }
         }
         if(stFreeEnergy)
         {
            this.a_1010.Value = iTimeIntervals;
            if(iTimeIntervals % 140 != 0)
            {
            }
         }
         if(this.a_1073 > 0)
         {
            if(2 == this.a_1073)
            {
               x += 5;
               y += 5;
            }
            else if(1 == this.a_1073)
            {
               x -= 5;
               y -= 5;
            }
            --this.a_1073;
         }
         return true;
      }
      
      public function a_3438(iXGridNo:int, iYGridNo:int) : a_3491
      {
         if(iXGridNo < 0 || iXGridNo >= a_1011 || iYGridNo < 0 || iYGridNo >= a_1012)
         {
            return null;
         }
         return this.a_1058[iYGridNo][iXGridNo];
      }
      
      public function a_3439(iYGridNo:int) : int
      {
         var iDepthIndex:int = 0;
         if(iYGridNo >= 0 && iYGridNo < a_1012)
         {
            iDepthIndex = getChildIndex(this.a_1060[iYGridNo]);
         }
         return iDepthIndex;
      }
      
      public function a_3440(iYGridNo:int) : int
      {
         var iDepthIndex:int = 0;
         if(iYGridNo >= 0 && iYGridNo < a_1012)
         {
            iDepthIndex = getChildIndex(this.a_1061[iYGridNo]);
         }
         return iDepthIndex;
      }
      
      private function ReplaceDefense(stBaseDefense:a_3962, targetBaseID:int) : a_3962
      {
         var newID:int = ConvertDefenseType(stBaseDefense.a_3512(),targetBaseID);
         var newDefense:a_3962 = a_4012.getInstance().a_4013(newID);
         newDefense.iDefenseTypeID = stBaseDefense.a_3512();
         newDefense.a_1094 = stBaseDefense.a_1094;
         newDefense.m_iRealStarDegree = stBaseDefense.m_iRealStarDegree;
         newDefense.m_iSkillDegree = stBaseDefense.m_iSkillDegree;
         newDefense.m_iGradeDegree = stBaseDefense.m_iGradeDegree;
         newDefense.m_iBeOtherPlaced = stBaseDefense.m_iBeOtherPlaced;
         newDefense.m_iPlaceTimeIntervals = stBaseDefense.m_iPlaceTimeIntervals;
         newDefense.m_iDefenseGlobalID = stBaseDefense.m_iDefenseGlobalID;
         newDefense.m_iOrigSeatID = stBaseDefense.m_iOrigSeatID;
         newDefense.m_iTickTime = stBaseDefense.m_iTickTime;
         newDefense.m_iRealDefensePrice = stBaseDefense.m_iRealDefensePrice;
         newDefense.m_IsCaclueCoolDown = stBaseDefense.m_IsCaclueCoolDown;
         newDefense.m_bServerIssued = stBaseDefense.m_bServerIssued;
         newDefense.m_bPlaceByUpGradeCard = stBaseDefense.m_bPlaceByUpGradeCard;
         return newDefense;
      }
      
      public function a_3441(stBaseDefense:a_3962, iXGridNo:int, iYGridNo:int, ByServer:Boolean = false) : Boolean
      {
         var stBaseTray:a_3977 = null;
         var iBaseDefCardID:int = 0;
         var addobj:Object = null;
         var addValue:Number = NaN;
         var addType:int = 0;
         var MaxHeight:int = 0;
         var stWaterPlacementEffect:a_4111 = null;
         var stPlacementEffect:a_4142 = null;
         var stCardExpAddEffect:CardExpAddEffect = null;
         var ms_stCardLoverAttackAddEffect:CardLoverAttackAddEffect = null;
         var ms_stCardLoverEnergyAddEffect:CardLoverEnergyAddEffect = null;
         var stAurDataEvent:a_1778 = null;
         if(null == stBaseDefense || iXGridNo < 0 || iXGridNo >= a_1011 || iYGridNo < 0 || iYGridNo >= a_1012)
         {
            trace("null == stBaseDefense, iXGridNo < 0 || iXGridNo >= ms_iXGridNum || iYGridNo < 0 || iYGridNo >= ms_iYGridNum, AddBaseDefense failed");
            return false;
         }
         var addResult:Boolean = false;
         var stFieldGrid:a_3491 = this.a_3438(iXGridNo,iYGridNo);
         if(!stFieldGrid)
         {
            return false;
         }
         if(!(stBaseDefense is a_3976) && stFieldGrid.m_isCannotAddCard)
         {
            trace("格子上有buff,无法放卡");
            return addResult;
         }
         if(stFieldGrid.HasTag(20024))
         {
            if(!(stBaseDefense is a_3976 && (stBaseDefense as a_3976).iToolType == 0))
            {
               return false;
            }
         }
         if(!stFieldGrid.m_isNeedTray)
         {
            if(IsMagicFudgeWaterDefense(stBaseDefense.a_3512()))
            {
               stBaseDefense = this.ReplaceDefense(stBaseDefense,288817280);
            }
            else if(IsMagicFudgeFusionWaterDefense(stBaseDefense.a_3512()))
            {
               stBaseDefense = this.ReplaceDefense(stBaseDefense,292552960);
            }
         }
         if(null != stFieldGrid && stFieldGrid.m_stAttackFighter is IDefenderSet && (stFieldGrid.m_stAttackFighter as IDefenderSet).IsUpgradeID(stBaseDefense.a_3512()) && stBaseDefense is a_3953)
         {
            return this.AddAttackFighterSet(stFieldGrid.m_stAttackFighter as BaseAttackFighterSet,stBaseDefense as a_3953);
         }
         if(stBaseDefense is a_3975)
         {
            addResult = this.a_3442(stBaseDefense as a_3975,iXGridNo,iYGridNo);
         }
         else if(stBaseDefense is a_3953)
         {
            addResult = this.a_3443(stBaseDefense as a_3953,iXGridNo,iYGridNo);
         }
         else if(stBaseDefense is a_3977)
         {
            addResult = this.a_3444(stBaseDefense as a_3977,iXGridNo,iYGridNo);
         }
         else if(stBaseDefense is a_3959)
         {
            addResult = this.a_3445(stBaseDefense as a_3959,iXGridNo,iYGridNo);
         }
         else if(stBaseDefense is a_3960)
         {
            addResult = this.a_3446(stBaseDefense as a_3960,iXGridNo,iYGridNo);
         }
         else if(stBaseDefense is a_3971)
         {
            addResult = this.a_3447(stBaseDefense as a_3971,iXGridNo,iYGridNo);
         }
         else if(stBaseDefense is a_3976)
         {
            addResult = this.a_3448(stBaseDefense as a_3976,iXGridNo,iYGridNo);
         }
         if(addResult)
         {
            if(this.iIntruderMoveDirection < 0)
            {
               stBaseDefense.x = stBaseDefense.iXPosSheft + iXGridNo * a_3491.a_1080 + (a_3491.a_1080 - stBaseDefense.width) / 2;
            }
            else
            {
               stBaseDefense.x = a_1013 - (stBaseDefense.iXPosSheft + iXGridNo * a_3491.a_1080 + (a_3491.a_1080 - stBaseDefense.width) / 2);
            }
            stBaseTray = this.a_3438(iXGridNo,iYGridNo).m_stTrayDefense;
            if(Boolean(stBaseTray) && !(stBaseDefense is a_3977))
            {
               MaxHeight = stBaseTray.height > 55 ? 55 : int(stBaseTray.height);
               stBaseDefense.y = stBaseTray.y + MaxHeight - stBaseDefense.height - 20 + stBaseTray.m_iOffsetByY;
            }
            else
            {
               stBaseDefense.y = stBaseDefense.iYPosSheft + iYGridNo * a_3491.a_1081 + (a_3491.a_1081 - stBaseDefense.height - 5);
            }
            stBaseDefense.y -= stBaseDefense.stDisplayBitmap.y;
            stBaseDefense.finalizeInitialization();
            if(this.m_stBaseGameMap)
            {
               this.m_stBaseGameMap.AddMoveDisplayObject(stBaseDefense,iXGridNo,iYGridNo);
            }
            if(!this.m_isOwnBattleField && Boolean(a_1054))
            {
               if(stBaseDefense is a_3971)
               {
                  a_1054.a_3575(b_203.a_441,iXGridNo,iYGridNo);
               }
               else if(stBaseDefense is a_3953)
               {
                  if((stBaseDefense as a_3953).iBreadFighterType > 1)
                  {
                     a_1054.a_3575(b_203.a_443,iXGridNo,iYGridNo);
                  }
                  else
                  {
                     a_1054.a_3575(b_203.a_444,iXGridNo,iYGridNo);
                  }
               }
               else if(stBaseDefense is a_3977 || stBaseDefense is a_3959 || stBaseDefense is a_3960 && (stBaseDefense as a_3960).isCanBeEaten)
               {
                  a_1054.a_3575(b_203.a_444,iXGridNo,iYGridNo);
               }
            }
            if(Boolean(this.m_isOwnBattleField && a_1054) && Boolean(stBaseDefense is a_3953) && (stBaseDefense as a_3953).iBattleFighterType > 1)
            {
               a_1054.a_3575(b_203.a_442,a_1011 - iXGridNo - 1,iYGridNo);
            }
            if(this.a_1058[iYGridNo][iXGridNo].m_isNeedTray)
            {
               stWaterPlacementEffect = a_4111.a_3926();
               stWaterPlacementEffect.a_1797(!this.isOwnBattleField);
               stWaterPlacementEffect.x = a_3491.a_1080 * (iXGridNo + 0.5) - 0.5 * stWaterPlacementEffect.width;
               if(!this.isOwnBattleField)
               {
                  stWaterPlacementEffect.x = a_1013 - stWaterPlacementEffect.x;
               }
               stWaterPlacementEffect.y = a_3491.a_1081 * (iYGridNo + 0.7);
               this.addChild(stWaterPlacementEffect);
               BattleFieldView.a_1024.play();
            }
            else
            {
               stPlacementEffect = a_4142.a_3926();
               stPlacementEffect.a_1797(!this.isOwnBattleField);
               stPlacementEffect.x = a_3491.a_1080 * (iXGridNo + 0.5) - 0.5 * stPlacementEffect.width;
               if(!this.isOwnBattleField)
               {
                  stPlacementEffect.x = a_1013 - stPlacementEffect.x;
               }
               stPlacementEffect.y = a_3491.a_1081 * (iYGridNo + 0.7);
               this.addChild(stPlacementEffect);
               BattleFieldView.a_1023.play();
            }
            iBaseDefCardID = a_4657.getInstance().execute("GetDefCardIDShineBaseCardDefID",null,stBaseDefense.a_3512());
            if(this.m_isOwnBattleField && ms_isMyPlaced && -1 != ms_arrLearnSkillCardIDArray.indexOf(iBaseDefCardID))
            {
               stCardExpAddEffect = CardExpAddEffect.a_3926();
               stCardExpAddEffect.a_1797(!this.isOwnBattleField);
               stCardExpAddEffect.x = a_3491.a_1080 * (iXGridNo + 0.5) - 0.5 * stCardExpAddEffect.width + 10;
               if(!this.isOwnBattleField)
               {
                  stCardExpAddEffect.x = a_1013 - stCardExpAddEffect.x;
               }
               stCardExpAddEffect.y = a_3491.a_1081 * (iYGridNo + 0.2);
               this.addChild(stCardExpAddEffect);
            }
            addobj = this.GetLoverAddValue(stBaseDefense.a_3512());
            addValue = addobj ? Number(addobj.m_iValue) : 0;
            addType = addobj ? int(addobj.m_iAttrType) : 1;
            if(!(stBaseDefense is a_3971))
            {
               if(this.m_isOwnBattleField && ms_isMyPlaced && addValue > 0)
               {
                  addType = addType == 3 ? 1 : 2;
                  ms_stCardLoverAttackAddEffect = CardLoverAttackAddEffect.a_3926();
                  ms_stCardLoverAttackAddEffect.a_1797(addValue,addType);
                  ms_stCardLoverAttackAddEffect.x = a_3491.a_1080 * (iXGridNo + 0.5) - 0.5 * ms_stCardLoverAttackAddEffect.width + 10;
                  if(!this.isOwnBattleField)
                  {
                     ms_stCardLoverAttackAddEffect.x = a_1013 - ms_stCardLoverAttackAddEffect.x;
                  }
                  ms_stCardLoverAttackAddEffect.y = a_3491.a_1081 * (iYGridNo - 0.2);
                  if(!contains(ms_stCardLoverAttackAddEffect))
                  {
                     this.addChild(ms_stCardLoverAttackAddEffect);
                  }
               }
            }
            else if(this.m_isOwnBattleField && ms_isMyPlaced && addValue > 0)
            {
               ms_stCardLoverEnergyAddEffect = CardLoverEnergyAddEffect.a_3926();
               ms_stCardLoverEnergyAddEffect.a_1797(addValue);
               ms_stCardLoverEnergyAddEffect.x = a_3491.a_1080 * (iXGridNo + 0.5) - 0.5 * ms_stCardLoverEnergyAddEffect.width + 10;
               if(!this.isOwnBattleField)
               {
                  ms_stCardLoverEnergyAddEffect.x = a_1013 - ms_stCardLoverEnergyAddEffect.x;
               }
               ms_stCardLoverEnergyAddEffect.y = a_3491.a_1081 * (iYGridNo - 0.2);
               if(!contains(ms_stCardLoverEnergyAddEffect))
               {
                  this.addChild(ms_stCardLoverEnergyAddEffect);
               }
            }
            if(Boolean(this.m_isOwnBattleField) && Boolean(root) && ByServer)
            {
               stAurDataEvent = new a_1778("DefenseCardCountChange");
               stAurDataEvent.dataObjectNew = [stBaseDefense.a_3512(),this.a_3422(stBaseDefense.a_3512()),stFieldGrid,stBaseDefense];
               root.dispatchEvent(stAurDataEvent);
               BattlePlaceDefenderTrigger.GoldLightBaderBoomTrigger(stBaseDefense.stFieldGrid,stBaseDefense.a_3512());
            }
         }
         return addResult;
      }
      
      private function GetLoverAddValue(id:int) : Object
      {
         var j:int = 0;
         for(var i:int = 0; i < ms_arrLoverCardIDArray.length; i++)
         {
            if(ms_arrLoverCardIDArray[i].m_iRecipesId == 0)
            {
               j = 0;
               while(j < ms_arrLoverCardIDArray[i].m_aryAttrInfo[0].m_aryCardId.length)
               {
                  if(ms_arrLoverCardIDArray[i].m_aryAttrInfo[0].m_aryCardId[j] == id)
                  {
                     return ms_arrLoverCardIDArray[i].m_aryAttrInfo[0];
                     break;
                  }
                  j++;
               }
            }
         }
         return null;
      }
      
      public function AddAttackFighterSet(stDefenderSet:BaseAttackFighterSet, stBaseAttackFighter:a_3953) : Boolean
      {
         if(!stDefenderSet.IsFull())
         {
            stBaseAttackFighter.a_1797(stDefenderSet.stFieldGrid);
            stDefenderSet.AddDefender(stBaseAttackFighter.a_3512(),stBaseAttackFighter.iShotHurtForEach);
            return true;
         }
         trace("放置不成功 卡套已经满了！！！");
         return false;
      }
      
      public function a_3442(baseProtector:a_3975, iXGridNo:int, iYGridNo:int) : Boolean
      {
         var stTargetFieldGird:a_3491 = null;
         if(this.a_1058[iYGridNo][iXGridNo].a_3442(baseProtector))
         {
            baseProtector.a_1797(this.a_1058[iYGridNo][iXGridNo]);
            stTargetFieldGird = this.a_1058[iYGridNo][iXGridNo];
            baseProtector.m_iBattleLayerType = BattleLayerDefine.DEFENSE_PROTECTOR_AFTER_TYPE;
            this.m_stBattleLayerManager.AddToBattleView(baseProtector,baseProtector.m_iBattleLayerType,stTargetFieldGird);
            return true;
         }
         return false;
      }
      
      public function a_3443(attackFighter:a_3953, iXGridNo:int, iYGridNo:int) : Boolean
      {
         var stTargetFieldGird:a_3491 = null;
         if(this.a_1058[iYGridNo][iXGridNo].a_3443(attackFighter))
         {
            attackFighter.a_1797(this.a_1058[iYGridNo][iXGridNo]);
            stTargetFieldGird = this.a_1058[iYGridNo][iXGridNo];
            if(attackFighter.secondExtraSlotType == 1)
            {
               attackFighter.m_iBattleLayerType = BattleLayerDefine.DEFENSE_PROTECTOR_BEFORE_TYPE;
            }
            else if(attackFighter.secondExtraSlotType == 2)
            {
               attackFighter.m_iBattleLayerType = BattleLayerDefine.DEFENSE_TOP_TOOL_TYPE;
            }
            else
            {
               attackFighter.m_iBattleLayerType = BattleLayerDefine.DEFENSE_ATTACK_FIGHTER_TYPE;
            }
            this.m_stBattleLayerManager.AddToBattleView(attackFighter,attackFighter.m_iBattleLayerType,stTargetFieldGird);
            return true;
         }
         return false;
      }
      
      public function a_3444(stTrayDefense:a_3977, iXGridNo:int, iYGridNo:int) : Boolean
      {
         var stTargetFieldGird:a_3491 = null;
         if(this.a_1058[iYGridNo][iXGridNo].a_3444(stTrayDefense))
         {
            stTrayDefense.a_1797(this.a_1058[iYGridNo][iXGridNo]);
            stTargetFieldGird = this.a_1058[iYGridNo][iXGridNo];
            stTrayDefense.m_iBattleLayerType = BattleLayerDefine.DEFENSE_TRAY_TYPE;
            this.m_stBattleLayerManager.AddToBattleView(stTrayDefense,stTrayDefense.m_iBattleLayerType,stTargetFieldGird);
            return true;
         }
         return false;
      }
      
      public function a_3445(baseAuxiliaryFighter:a_3959, iXGridNo:int, iYGridNo:int) : Boolean
      {
         var stTargetFieldGird:a_3491 = null;
         if(this.a_1058[iYGridNo][iXGridNo].a_3445(baseAuxiliaryFighter))
         {
            baseAuxiliaryFighter.a_1797(this.a_1058[iYGridNo][iXGridNo]);
            stTargetFieldGird = this.a_1058[iYGridNo][iXGridNo];
            baseAuxiliaryFighter.m_iBattleLayerType = BattleLayerDefine.DEFENSE_FLOWER_TYPE;
            this.m_stBattleLayerManager.AddToBattleView(baseAuxiliaryFighter,baseAuxiliaryFighter.m_iBattleLayerType,stTargetFieldGird);
            return true;
         }
         return false;
      }
      
      public function a_3446(stBoomDefense:a_3960, iXGridNo:int, iYGridNo:int) : Boolean
      {
         var stTargetFieldGird:a_3491 = null;
         if(this.a_1058[iYGridNo][iXGridNo].a_3446(stBoomDefense))
         {
            stBoomDefense.a_1797(this.a_1058[iYGridNo][iXGridNo]);
            stBoomDefense.m_iBattleLayerType = BattleLayerDefine.DEFENSE_BOOM_TYPE;
            stTargetFieldGird = this.a_1058[iYGridNo][iXGridNo];
            this.m_stBattleLayerManager.AddToBattleView(stBoomDefense,stBoomDefense.m_iBattleLayerType,stTargetFieldGird);
            return true;
         }
         return false;
      }
      
      public function a_3447(stBaseFlowerDefense:a_3971, iXGridNo:int, iYGridNo:int) : Boolean
      {
         var stTargetFieldGird:a_3491 = null;
         if(this.a_1058[iYGridNo][iXGridNo].a_3447(stBaseFlowerDefense))
         {
            stBaseFlowerDefense.a_1797(this.a_1058[iYGridNo][iXGridNo]);
            stTargetFieldGird = this.a_1058[iYGridNo][iXGridNo];
            stBaseFlowerDefense.m_iBattleLayerType = BattleLayerDefine.DEFENSE_FLOWER_TYPE;
            this.m_stBattleLayerManager.AddToBattleView(stBaseFlowerDefense,stBaseFlowerDefense.m_iBattleLayerType,stTargetFieldGird);
            return true;
         }
         return false;
      }
      
      public function a_3448(stToolDefense:a_3976, iXGridNo:int, iYGridNo:int) : Boolean
      {
         var stTargetFieldGird:a_3491 = this.a_1058[iYGridNo][iXGridNo];
         if(stToolDefense != null && stTargetFieldGird.HasTag(20021) && BattleFieldView.m_lBarrierHorse.indexOf(stToolDefense.a_3512()) != -1)
         {
            return false;
         }
         if(1 == stToolDefense.iToolType && !stTargetFieldGird.m_isExistMouseHole)
         {
            return false;
         }
         if(0 != stToolDefense.iToolType && !stTargetFieldGird.a_3448(stToolDefense))
         {
            return false;
         }
         stToolDefense.a_1797(stTargetFieldGird);
         if(stToolDefense.iToolType == 2)
         {
            stToolDefense.m_iBattleLayerType = BattleLayerDefine.DEFENSE_BOTTOM_TOOL_TYPE;
         }
         else if(stToolDefense.iToolType == 4)
         {
            stToolDefense.m_iBattleLayerType = BattleLayerDefine.DEFENSE_ATTACK_FIGHTER_TYPE;
         }
         else
         {
            stToolDefense.m_iBattleLayerType = BattleLayerDefine.DEFENSE_TOP_TOOL_TYPE;
         }
         this.m_stBattleLayerManager.AddToBattleView(stToolDefense,stToolDefense.m_iBattleLayerType,stTargetFieldGird);
         return true;
      }
      
      protected function a_3449(iXGridNo:int, iYGridNo:int) : Boolean
      {
         var baseProtector:a_3975 = this.a_1058[iYGridNo][iXGridNo].m_stProtector;
         this.a_1058[iYGridNo][iXGridNo].a_3496(baseProtector);
         if(baseProtector.parent)
         {
            baseProtector.parent.removeChild(baseProtector);
         }
         baseProtector.a_3940();
         return this.a_1057.a_3477(baseProtector.a_3512());
      }
      
      public function a_3476(iGameCardTypeID:uint) : GameCardView
      {
         return this.a_1057.a_3476(iGameCardTypeID);
      }
      
      public function GetGameCardViewByIndex(index:int) : GameCardView
      {
         return this.a_1057.GetGameCardViewByIndex(index);
      }
      
      protected function a_3450(iXGridNo:int, iYGridNo:int) : Boolean
      {
         var baseAttackFighter:a_3953 = this.a_1058[iYGridNo][iXGridNo].m_stAttackFighter;
         this.a_1058[iYGridNo][iXGridNo].a_3497(baseAttackFighter);
         if(baseAttackFighter.parent)
         {
            baseAttackFighter.parent.removeChild(baseAttackFighter);
         }
         baseAttackFighter.a_3940();
         return this.a_1057.a_3477(baseAttackFighter.a_3512());
      }
      
      protected function CancelHoneyTrapAttackFighter(iXGridNo:int, iYGridNo:int) : Boolean
      {
         var stGrid:a_3491 = this.a_1058[iYGridNo][iXGridNo];
         var baseAttackFighter:a_3953 = stGrid.m_stHoneyTrapBaseDefense;
         if(baseAttackFighter == null)
         {
            return false;
         }
         stGrid.a_3497(baseAttackFighter);
         if(baseAttackFighter.parent)
         {
            baseAttackFighter.parent.removeChild(baseAttackFighter);
         }
         baseAttackFighter.a_3940();
         return this.a_1057.a_3477(baseAttackFighter.a_3512());
      }
      
      protected function a_3451(iXGridNo:int, iYGridNo:int) : Boolean
      {
         var stTrayDefense:a_3977 = this.a_1058[iYGridNo][iXGridNo].m_stTrayDefense;
         this.a_1058[iYGridNo][iXGridNo].a_3498(stTrayDefense);
         if(stTrayDefense.parent)
         {
            stTrayDefense.parent.removeChild(stTrayDefense);
         }
         stTrayDefense.a_3940();
         return this.a_1057.a_3477(stTrayDefense.a_3512());
      }
      
      protected function a_3452(iXGridNo:int, iYGridNo:int) : Boolean
      {
         var baseAuxiliaryFighter:a_3959 = this.a_1058[iYGridNo][iXGridNo].m_stBaseAuxiliaryFighter;
         this.a_1058[iYGridNo][iXGridNo].a_3501(baseAuxiliaryFighter);
         if(baseAuxiliaryFighter.parent)
         {
            baseAuxiliaryFighter.parent.removeChild(baseAuxiliaryFighter);
         }
         baseAuxiliaryFighter.a_3940();
         return this.a_1057.a_3477(baseAuxiliaryFighter.a_3512());
      }
      
      protected function a_3453(iXGridNo:int, iYGridNo:int) : Boolean
      {
         var baseBoomDefense:a_3960 = this.a_1058[iYGridNo][iXGridNo].m_stBoomDefense;
         this.a_1058[iYGridNo][iXGridNo].a_3499(baseBoomDefense);
         if(baseBoomDefense.parent)
         {
            baseBoomDefense.parent.removeChild(baseBoomDefense);
         }
         baseBoomDefense.a_3940();
         return this.a_1057.a_3477(baseBoomDefense.a_3512());
      }
      
      protected function a_3454(iXGridNo:int, iYGridNo:int) : Boolean
      {
         var baseFlowerDefense:a_3971 = this.a_1058[iYGridNo][iXGridNo].m_stFlowerDefense;
         this.a_1058[iYGridNo][iXGridNo].a_3500(baseFlowerDefense);
         if(baseFlowerDefense.parent)
         {
            baseFlowerDefense.parent.removeChild(baseFlowerDefense);
         }
         baseFlowerDefense.a_3940();
         return this.a_1057.a_3477(baseFlowerDefense.a_3512());
      }
      
      private function TryRemoveUnoccupiedDefense(stFieldGrid:a_3491, iDefenseTypeID:int, iDieType:int) : Boolean
      {
         if(Boolean(stFieldGrid.m_stBattleBarrierHorseDefense) && iDefenseTypeID == stFieldGrid.m_stBattleBarrierHorseDefense.a_3512())
         {
            stFieldGrid.m_stBattleBarrierHorseDefense.m_iDieType = iDieType;
            stFieldGrid.m_stBattleBarrierHorseDefense.a_3969(stFieldGrid.m_stBattleBarrierHorseDefense.iLifeValue);
            return true;
         }
         if(Boolean(stFieldGrid.m_stOceanGoddessToolDefense) && iDefenseTypeID == stFieldGrid.m_stOceanGoddessToolDefense.a_3512())
         {
            stFieldGrid.m_stOceanGoddessToolDefense.m_iDieType = iDieType;
            stFieldGrid.m_stOceanGoddessToolDefense.a_3969(stFieldGrid.m_stOceanGoddessToolDefense.iLifeValue);
            return true;
         }
         if(Boolean(stFieldGrid.m_stVersatileDefense) && iDefenseTypeID == stFieldGrid.m_stVersatileDefense.a_3512())
         {
            stFieldGrid.m_stVersatileDefense.m_iDieType = iDieType;
            stFieldGrid.m_stVersatileDefense.a_3969(stFieldGrid.m_stVersatileDefense.iLifeValue);
            return true;
         }
         if(Boolean(stFieldGrid.m_stHoneyTrapBaseDefense) && iDefenseTypeID == stFieldGrid.m_stHoneyTrapBaseDefense.a_3512())
         {
            stFieldGrid.m_stHoneyTrapBaseDefense.m_iDieType = iDieType;
            stFieldGrid.m_stHoneyTrapBaseDefense.a_3969(stFieldGrid.m_stHoneyTrapBaseDefense.iLifeValue);
            return true;
         }
         return false;
      }
      
      public function a_3455(iDefenseGlobalID:int, iDefenseTypeID:int, iXGridNo:int, iYGridNo:int, m_byIsTool:int) : Boolean
      {
         var stAurDataEvent:a_1778 = null;
         var gride:a_3491 = this.a_1058[iYGridNo][iXGridNo];
         if(!gride)
         {
            return false;
         }
         var baseAttackFighter:a_3953 = gride.m_stAttackFighter;
         var baseBoomDefense:a_3960 = gride.m_stBoomDefense;
         var baseProtector:a_3975 = gride.m_stProtector;
         var stTrayDefense:a_3977 = gride.m_stTrayDefense;
         var baseAuxiliaryFighter:a_3959 = gride.m_stBaseAuxiliaryFighter;
         var baseFlowerDefense:a_3971 = gride.m_stFlowerDefense;
         var baseInsureance:a_3972 = this.m_arrBaseInsuranceVector[iYGridNo];
         var baseToolDefense:a_3976 = null;
         if(this.m_OtherLockMoveDefense != null && this.m_OtherLockMoveDefense.a_3512() == iDefenseTypeID && this.m_OtherLockMoveDefense.stFieldGrid.m_iXGridNo == iXGridNo && this.m_OtherLockMoveDefense.stFieldGrid.m_iYGridNo == iYGridNo)
         {
            baseToolDefense = this.m_OtherLockMoveDefense as a_3976;
         }
         else if(this.m_OtherMoveDefense != null && this.m_OtherMoveDefense.a_3512() == iDefenseTypeID && this.m_OtherMoveDefense.stFieldGrid.m_iXGridNo == iXGridNo && this.m_OtherMoveDefense.stFieldGrid.m_iYGridNo == iYGridNo)
         {
            baseToolDefense = this.m_OtherMoveDefense as a_3976;
         }
         if(!this.TryRemoveUnoccupiedDefense(gride,iDefenseTypeID,m_byIsTool))
         {
            if(Boolean(baseAttackFighter) && iDefenseTypeID == baseAttackFighter.a_3512())
            {
               baseAttackFighter.m_iDieType = m_byIsTool;
               baseAttackFighter.a_3969(baseAttackFighter.iLifeValue);
            }
            else if(Boolean(baseProtector) && iDefenseTypeID == baseProtector.a_3512())
            {
               baseProtector.m_iDieType = m_byIsTool;
               baseProtector.a_3969(baseProtector.iLifeValue);
            }
            else if(Boolean(stTrayDefense) && iDefenseTypeID == stTrayDefense.a_3512())
            {
               stTrayDefense.m_iDieType = m_byIsTool;
               stTrayDefense.a_3969(stTrayDefense.iLifeValue);
            }
            else if(Boolean(baseAuxiliaryFighter) && iDefenseTypeID == baseAuxiliaryFighter.a_3512())
            {
               baseAuxiliaryFighter.m_iDieType = m_byIsTool;
               baseAuxiliaryFighter.a_3969(baseAuxiliaryFighter.iLifeValue);
            }
            else if(Boolean(baseFlowerDefense) && iDefenseTypeID == baseFlowerDefense.a_3512())
            {
               baseFlowerDefense.m_iDieType = m_byIsTool;
               baseFlowerDefense.a_3969(baseFlowerDefense.iLifeValue);
            }
            else if(Boolean(baseToolDefense) && iDefenseTypeID == baseToolDefense.a_3512())
            {
               baseToolDefense.m_iDieType = m_byIsTool;
               baseToolDefense.a_3969(baseToolDefense.iLifeValue);
            }
            else if(Boolean(baseInsureance) && iDefenseTypeID == baseInsureance.a_3512())
            {
               baseInsureance.a_3974();
            }
            else if(Boolean(baseBoomDefense) && (Boolean(!baseBoomDefense.isCanBeEaten || 1 == baseBoomDefense.iBoomType)) && iDefenseTypeID == baseBoomDefense.a_3512())
            {
               baseBoomDefense.m_iDieType = m_byIsTool;
               baseBoomDefense.a_3969(baseBoomDefense.iLifeValue);
            }
         }
         if(!this.m_isOwnBattleField && Boolean(a_1054))
         {
            if(Boolean(baseInsureance) && iDefenseTypeID == baseInsureance.a_3512())
            {
               a_1054.a_3577(iYGridNo);
               return true;
            }
            a_1054.a_3576(iXGridNo,iYGridNo);
            baseAttackFighter = gride.m_stAttackFighter;
            baseBoomDefense = gride.m_stBoomDefense;
            baseProtector = gride.m_stProtector;
            stTrayDefense = gride.m_stTrayDefense;
            baseAuxiliaryFighter = gride.m_stBaseAuxiliaryFighter;
            baseFlowerDefense = gride.m_stFlowerDefense;
            baseInsureance = this.m_arrBaseInsuranceVector[iYGridNo];
            if(baseFlowerDefense)
            {
               a_1054.a_3575(b_203.a_441,iXGridNo,iYGridNo);
            }
            else if(baseAttackFighter)
            {
               if(baseAttackFighter.iBreadFighterType > 1)
               {
                  a_1054.a_3575(b_203.a_443,iXGridNo,iYGridNo);
               }
               else if(baseAttackFighter.iBattleFighterType > 1)
               {
                  a_1054.a_3575(b_203.a_442,iXGridNo,iYGridNo);
               }
               else
               {
                  a_1054.a_3575(b_203.a_444,iXGridNo,iYGridNo);
               }
            }
            else if(Boolean(baseProtector && stTrayDefense) || Boolean(baseAuxiliaryFighter) || Boolean(baseBoomDefense) && Boolean(baseBoomDefense.isCanBeEaten))
            {
               a_1054.a_3575(b_203.a_444,iXGridNo,iYGridNo);
            }
         }
         if(Boolean(this.m_isOwnBattleField) && Boolean(a_1054) && null == baseAttackFighter)
         {
            a_1054.a_3578(a_1011 - iXGridNo - 1,iYGridNo);
         }
         if(this.m_isOwnBattleField && Boolean(root))
         {
            stAurDataEvent = new a_1778("DefenseCardCountChange");
            stAurDataEvent.dataObjectNew = [iDefenseTypeID,this.a_3422(iDefenseTypeID)];
            root.dispatchEvent(stAurDataEvent);
         }
         return true;
      }
      
      public function SwapDefense(stBaseDefense:a_3962, iXGridNo:int, iYGridNo:int, ByServer:Boolean = false) : void
      {
         var stAvatarInfoText:TextField = null;
         stBaseDefense.stFieldGrid.RemoveDefense(stBaseDefense);
         if(this.m_stBaseGameMap)
         {
            this.m_stBaseGameMap.RemoveMoveDisplayObject(stBaseDefense);
         }
         var addResult:Boolean = this.a_3441(stBaseDefense,iXGridNo,iYGridNo,ByServer);
         if(!addResult)
         {
            stBaseDefense.a_3940();
            return;
         }
         if(stBaseDefense is a_3924)
         {
            stAvatarInfoText = this.a_1057.MyAvatarInfoText();
            if(stAvatarInfoText != null)
            {
               stAvatarInfoText.x = stBaseDefense.x + 40;
               stAvatarInfoText.y = stBaseDefense.y + 20;
               if(this.GetGameMoveMap())
               {
                  this.m_stBaseGameMap.RemoveMoveDisplayObject(stAvatarInfoText);
                  this.m_stBaseGameMap.AddMoveDisplayObject(stAvatarInfoText,iXGridNo,iYGridNo);
               }
            }
         }
         if(stBaseDefense.stFieldGrid.m_stSleepingEffect != null && stBaseDefense.stFieldGrid.m_stAttackFighter != null)
         {
            stBaseDefense.stFieldGrid.m_stSleepingEffect.x = stBaseDefense.stFieldGrid.m_stAttackFighter.x + stBaseDefense.stFieldGrid.m_stAttackFighter.width * 0.4;
            stBaseDefense.stFieldGrid.m_stSleepingEffect.y = stBaseDefense.stFieldGrid.m_stAttackFighter.y - 10;
         }
      }
      
      public function a_3456(addedMoveIntruder:Object) : Boolean
      {
         var stAddedMoveIntruder:a_4269 = null;
         var stBaseMoveIntruder:a_4206 = null;
         var iDepthIndex:int = 0;
         var stTempFieldGrid:a_3491 = null;
         var iAppearTime:int = 0;
         var stTargetFieldGird:a_3491 = null;
         if(addedMoveIntruder is a_4269)
         {
            stAddedMoveIntruder = addedMoveIntruder as a_4269;
            stBaseMoveIntruder = this.m_stMoveIntruderFactory.a_4256(stAddedMoveIntruder.m_iIntruderType);
            if(null == stBaseMoveIntruder)
            {
               trace("IntruderFactory.GetMoveIntruder failed for IntruderType:" + stAddedMoveIntruder.m_iIntruderType.toString(16));
               throw new Error("此老鼠不存在ID:" + stAddedMoveIntruder.m_iIntruderType.toString(16));
            }
            if(stAddedMoveIntruder.m_iIntruderYGridNo >= a_1012)
            {
               stAddedMoveIntruder.m_iIntruderYGridNo = a_1012 - 1;
            }
            stBaseMoveIntruder.m_stGameBattleView = this;
            stBaseMoveIntruder.OnPreInit(this,stAddedMoveIntruder);
            stBaseMoveIntruder.a_1797(stAddedMoveIntruder.m_iIntruderGlobalNo,this.a_1071);
            stBaseMoveIntruder.m_bServerIssued = true;
            if(-1 != this.m_arrBaseMoveIntruderVector.indexOf(stBaseMoveIntruder))
            {
               throw new Error("-1 != m_arrBaseMoveIntruderVector.indexOf(stBaseMoveIntruder)");
            }
            this.m_arrBaseMoveIntruderVector.push(stBaseMoveIntruder);
            stBaseMoveIntruder.m_stMoveIntruderTypeID = stAddedMoveIntruder.m_iIntruderType;
            if(stAddedMoveIntruder.m_iLife > 0 || stAddedMoveIntruder.m_iIntruderYGridNo < 0)
            {
               if(stAddedMoveIntruder.m_iIntruderYGridNo < 0)
               {
                  stBaseMoveIntruder.iDIYLife = DIYConfigData.Get().m_vBossLevelData[int(stAddedMoveIntruder.m_iLife / 1000)].iMinBlood + int(int(stAddedMoveIntruder.m_iLife % 1000) * (DIYConfigData.Get().m_vBossLevelData[int(stAddedMoveIntruder.m_iLife / 1000)].iMaxBlood - DIYConfigData.Get().m_vBossLevelData[int(stAddedMoveIntruder.m_iLife / 1000)].iMinBlood) / 100);
               }
               else
               {
                  stBaseMoveIntruder.iDIYLife = int(stAddedMoveIntruder.m_iLife * 1 / 100 * DIYConfigData.Get().m_dictMonseLife[stBaseMoveIntruder.m_stMoveIntruderTypeID - 8388608] * m_iDIYCurrentBloodPercent / 100);
               }
            }
            if(stAddedMoveIntruder.m_iIntruderYGridNo < 0)
            {
               stAddedMoveIntruder.m_iIntruderYGridNo = -stAddedMoveIntruder.m_iIntruderYGridNo - 1;
            }
            if(stAddedMoveIntruder.m_iApearFlag > 0)
            {
               stTempFieldGrid = this.a_3438(stAddedMoveIntruder.m_iIntruderXGridNo,stAddedMoveIntruder.m_iIntruderYGridNo);
               if(Boolean(4 == stAddedMoveIntruder.m_byAppearType) && Boolean(stTempFieldGrid) && stTempFieldGrid.m_isNeedTray)
               {
                  stBaseMoveIntruder.x = this.a_1071 < 0 ? stTempFieldGrid.m_iXGridNo * a_3491.a_1080 : a_1013 - stTempFieldGrid.m_iXGridNo * a_3491.a_1080;
                  stBaseMoveIntruder.y = stBaseMoveIntruder.iYPosSkewing + a_3491.a_1081 * stTempFieldGrid.m_iYGridNo + (a_3491.a_1081 - stBaseMoveIntruder.height);
                  stTempFieldGrid.a_3459(stBaseMoveIntruder);
                  this.AddRowIntruderNum(stBaseMoveIntruder,stTempFieldGrid.m_iYGridNo);
                  stTargetFieldGird = this.a_1058[stTempFieldGrid.m_iYGridNo][0];
                  if(Boolean(stBaseMoveIntruder as IBossMoveIntruder) && (!stBaseMoveIntruder.hasOwnProperty("IsBoss") || (stBaseMoveIntruder as BaseBossMoveIntruder).IsBoss))
                  {
                     this.m_stBattleLayerManager.AddToBattleView(stBaseMoveIntruder,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,stTargetFieldGird);
                  }
                  else
                  {
                     this.m_stBattleLayerManager.AddToBattleView(stBaseMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGird);
                  }
                  stBaseMoveIntruder.InitAppearedLife = true;
               }
               if(2 == stAddedMoveIntruder.m_byAppearType && this.a_3425() <= 0)
               {
                  this.a_1058[stAddedMoveIntruder.m_iIntruderYGridNo][stAddedMoveIntruder.m_iIntruderXGridNo].a_3459(stBaseMoveIntruder);
                  this.AddRowIntruderNum(stBaseMoveIntruder,stAddedMoveIntruder.m_iIntruderYGridNo);
                  stBaseMoveIntruder.a_4212();
               }
               else if(2 == stAddedMoveIntruder.m_byAppearType)
               {
                  stTempFieldGrid = this.a_3429(stAddedMoveIntruder.m_iApearFlag % this.a_3425());
                  if(stTempFieldGrid)
                  {
                     stBaseMoveIntruder.x = this.a_1071 < 0 ? stTempFieldGrid.m_iXGridNo * a_3491.a_1080 : a_1013 - stTempFieldGrid.m_iXGridNo * a_3491.a_1080;
                     stBaseMoveIntruder.y = stBaseMoveIntruder.iYPosSkewing + a_3491.a_1081 * stTempFieldGrid.m_iYGridNo + (a_3491.a_1081 - stBaseMoveIntruder.height);
                     stTempFieldGrid.a_3459(stBaseMoveIntruder);
                     this.AddRowIntruderNum(stBaseMoveIntruder,stTempFieldGrid.m_iYGridNo);
                     stTargetFieldGird = this.a_1058[stTempFieldGrid.m_iYGridNo][0];
                     if(Boolean(stBaseMoveIntruder as IBossMoveIntruder) && (!stBaseMoveIntruder.hasOwnProperty("IsBoss") || (stBaseMoveIntruder as BaseBossMoveIntruder).IsBoss))
                     {
                        this.m_stBattleLayerManager.AddToBattleView(stBaseMoveIntruder,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,stTargetFieldGird);
                     }
                     else
                     {
                        this.m_stBattleLayerManager.AddToBattleView(stBaseMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGird);
                     }
                     stBaseMoveIntruder.InitAppearedLife = true;
                     this.a_3465(stTempFieldGrid);
                  }
                  else
                  {
                     this.a_1058[stAddedMoveIntruder.m_iIntruderYGridNo][stAddedMoveIntruder.m_iIntruderXGridNo].a_3459(stBaseMoveIntruder);
                     this.AddRowIntruderNum(stBaseMoveIntruder,stAddedMoveIntruder.m_iIntruderYGridNo);
                     stBaseMoveIntruder.a_4212();
                  }
               }
               else
               {
                  this.a_1058[stAddedMoveIntruder.m_iIntruderYGridNo][stAddedMoveIntruder.m_iIntruderXGridNo].a_3459(stBaseMoveIntruder);
                  this.AddRowIntruderNum(stBaseMoveIntruder,stAddedMoveIntruder.m_iIntruderYGridNo);
                  stBaseMoveIntruder.a_4212();
               }
            }
            else
            {
               stBaseMoveIntruder.x = this.a_1071 > 0 ? 0 : a_1013;
               stBaseMoveIntruder.y = stBaseMoveIntruder.iYPosSkewing + a_3491.a_1081 * stAddedMoveIntruder.m_iIntruderYGridNo + (a_3491.a_1081 - stBaseMoveIntruder.height);
               stTargetFieldGird = this.a_1058[stAddedMoveIntruder.m_iIntruderYGridNo][0];
               if(Boolean(stBaseMoveIntruder as IBossMoveIntruder) && (!stBaseMoveIntruder.hasOwnProperty("IsBoss") || (stBaseMoveIntruder as BaseBossMoveIntruder).IsBoss))
               {
                  this.m_stBattleLayerManager.AddToBattleView(stBaseMoveIntruder,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,stTargetFieldGird);
               }
               else
               {
                  this.m_stBattleLayerManager.AddToBattleView(stBaseMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGird);
               }
               stBaseMoveIntruder.InitAppearedLife = true;
               this.a_1058[stAddedMoveIntruder.m_iIntruderYGridNo][stAddedMoveIntruder.m_iIntruderXGridNo].a_3459(stBaseMoveIntruder);
               this.AddRowIntruderNum(stBaseMoveIntruder,stAddedMoveIntruder.m_iIntruderYGridNo);
            }
         }
         else if(addedMoveIntruder is Array)
         {
            for each(stAddedMoveIntruder in addedMoveIntruder)
            {
               stBaseMoveIntruder = this.m_stMoveIntruderFactory.a_4256(stAddedMoveIntruder.m_iIntruderType);
               if(null == stBaseMoveIntruder)
               {
                  trace("IntruderFactory.GetMoveIntruder failed for IntruderType:" + stAddedMoveIntruder.m_iIntruderType.toString(16));
                  throw new Error("此老鼠不存在ID:" + stAddedMoveIntruder.m_iIntruderType.toString(16));
               }
               if(stAddedMoveIntruder.m_iIntruderYGridNo >= a_1012)
               {
                  stAddedMoveIntruder.m_iIntruderYGridNo = a_1012 - 1;
               }
               stBaseMoveIntruder.m_stGameBattleView = this;
               stBaseMoveIntruder.a_1797(stAddedMoveIntruder.m_iIntruderGlobalNo,this.a_1071);
               stBaseMoveIntruder.m_bServerIssued = true;
               if(-1 != this.m_arrBaseMoveIntruderVector.indexOf(stBaseMoveIntruder))
               {
                  throw new Error("-1 != m_arrBaseMoveIntruderVector.indexOf(stBaseMoveIntruder)");
               }
               this.m_arrBaseMoveIntruderVector.push(stBaseMoveIntruder);
               stBaseMoveIntruder.m_stMoveIntruderTypeID = stAddedMoveIntruder.m_iIntruderType;
               if(stAddedMoveIntruder.m_iApearFlag > 0)
               {
                  stTempFieldGrid = this.a_3438(stAddedMoveIntruder.m_iIntruderXGridNo,stAddedMoveIntruder.m_iIntruderYGridNo);
                  if(Boolean(4 == stAddedMoveIntruder.m_byAppearType) && Boolean(stTempFieldGrid) && stTempFieldGrid.m_isNeedTray)
                  {
                     stBaseMoveIntruder.x = this.a_1071 < 0 ? stTempFieldGrid.m_iXGridNo * a_3491.a_1080 : a_1013 - stTempFieldGrid.m_iXGridNo * a_3491.a_1080;
                     stBaseMoveIntruder.y = stBaseMoveIntruder.iYPosSkewing + a_3491.a_1081 * stTempFieldGrid.m_iYGridNo + (a_3491.a_1081 - stBaseMoveIntruder.height);
                     stTempFieldGrid.a_3459(stBaseMoveIntruder);
                     this.AddRowIntruderNum(stBaseMoveIntruder,stTempFieldGrid.m_iYGridNo);
                     stTargetFieldGird = this.a_1058[stTempFieldGrid.m_iYGridNo][0];
                     if(Boolean(stBaseMoveIntruder as IBossMoveIntruder) && (!stBaseMoveIntruder.hasOwnProperty("IsBoss") || (stBaseMoveIntruder as BaseBossMoveIntruder).IsBoss))
                     {
                        this.m_stBattleLayerManager.AddToBattleView(stBaseMoveIntruder,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,stTargetFieldGird);
                     }
                     else
                     {
                        this.m_stBattleLayerManager.AddToBattleView(stBaseMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGird);
                     }
                     stBaseMoveIntruder.InitAppearedLife = true;
                  }
                  if(2 == stAddedMoveIntruder.m_byAppearType && this.a_3425() <= 0)
                  {
                     this.a_1058[stAddedMoveIntruder.m_iIntruderYGridNo][stAddedMoveIntruder.m_iIntruderXGridNo].a_3459(stBaseMoveIntruder);
                     this.AddRowIntruderNum(stBaseMoveIntruder,stAddedMoveIntruder.m_iIntruderYGridNo);
                     stBaseMoveIntruder.a_4212();
                  }
                  else if(2 == stAddedMoveIntruder.m_byAppearType)
                  {
                     stTempFieldGrid = this.a_3429(stAddedMoveIntruder.m_iApearFlag % this.a_3425());
                     if(stTempFieldGrid)
                     {
                        stBaseMoveIntruder.x = this.a_1071 < 0 ? stTempFieldGrid.m_iXGridNo * a_3491.a_1080 : a_1013 - stTempFieldGrid.m_iXGridNo * a_3491.a_1080;
                        stBaseMoveIntruder.y = stBaseMoveIntruder.iYPosSkewing + a_3491.a_1081 * stTempFieldGrid.m_iYGridNo + (a_3491.a_1081 - stBaseMoveIntruder.height);
                        stTempFieldGrid.a_3459(stBaseMoveIntruder);
                        this.AddRowIntruderNum(stBaseMoveIntruder,stTempFieldGrid.m_iYGridNo);
                        stTargetFieldGird = this.a_1058[stTempFieldGrid.m_iYGridNo][0];
                        if(Boolean(stBaseMoveIntruder as IBossMoveIntruder) && (!stBaseMoveIntruder.hasOwnProperty("IsBoss") || (stBaseMoveIntruder as BaseBossMoveIntruder).IsBoss))
                        {
                           this.m_stBattleLayerManager.AddToBattleView(stBaseMoveIntruder,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,stTargetFieldGird);
                        }
                        else
                        {
                           this.m_stBattleLayerManager.AddToBattleView(stBaseMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGird);
                        }
                        stBaseMoveIntruder.InitAppearedLife = true;
                        this.a_3465(stTempFieldGrid);
                     }
                     else
                     {
                        this.a_1058[stAddedMoveIntruder.m_iIntruderYGridNo][stAddedMoveIntruder.m_iIntruderXGridNo].a_3459(stBaseMoveIntruder);
                        this.AddRowIntruderNum(stBaseMoveIntruder,stAddedMoveIntruder.m_iIntruderYGridNo);
                        stBaseMoveIntruder.a_4212();
                     }
                  }
                  else
                  {
                     this.a_1058[stAddedMoveIntruder.m_iIntruderYGridNo][stAddedMoveIntruder.m_iIntruderXGridNo].a_3459(stBaseMoveIntruder);
                     this.AddRowIntruderNum(stBaseMoveIntruder,stAddedMoveIntruder.m_iIntruderYGridNo);
                     stBaseMoveIntruder.a_4212();
                  }
               }
               else
               {
                  stBaseMoveIntruder.x = this.a_1071 > 0 ? 0 : a_1013;
                  stBaseMoveIntruder.y = stBaseMoveIntruder.iYPosSkewing + a_3491.a_1081 * stAddedMoveIntruder.m_iIntruderYGridNo + (a_3491.a_1081 - stBaseMoveIntruder.height);
                  stTargetFieldGird = this.a_1058[stAddedMoveIntruder.m_iIntruderYGridNo][0];
                  if(Boolean(stBaseMoveIntruder as IBossMoveIntruder) && (!stBaseMoveIntruder.hasOwnProperty("IsBoss") || (stBaseMoveIntruder as BaseBossMoveIntruder).IsBoss))
                  {
                     this.m_stBattleLayerManager.AddToBattleView(stBaseMoveIntruder,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,stTargetFieldGird);
                  }
                  else
                  {
                     this.m_stBattleLayerManager.AddToBattleView(stBaseMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGird);
                  }
                  stBaseMoveIntruder.InitAppearedLife = true;
                  this.a_1058[stAddedMoveIntruder.m_iIntruderYGridNo][stAddedMoveIntruder.m_iIntruderXGridNo].a_3459(stBaseMoveIntruder);
                  this.AddRowIntruderNum(stBaseMoveIntruder,stAddedMoveIntruder.m_iIntruderYGridNo);
               }
            }
         }
         return true;
      }
      
      public function a_3457(stMoveIntruder:a_4206) : Boolean
      {
         if(null == stMoveIntruder || this != stMoveIntruder.m_stCurrentFieldGrid.m_stCurrentBattbleFieldView)
         {
            trace("Error: RemoveMoveIntruder Failed, null == stMoveIntruder || this != stMoveIntruder.m_stCurrentFieldGrid.m_stCurrentBattbleFieldView");
            return false;
         }
         if(!stMoveIntruder.m_isRemovedFromBattaleField && -1 != this.m_arrBaseMoveIntruderVector.indexOf(stMoveIntruder))
         {
            stMoveIntruder.m_isRemovedFromBattaleField = true;
            this.ReduceRowIntruderNum(stMoveIntruder,stMoveIntruder.m_stCurrentFieldGrid.m_iYGridNo);
         }
         return true;
      }
      
      public function a_3458(stVanishEnemy:CVanishEnemy) : Boolean
      {
         var stBaseMoveIntruder:a_4206 = null;
         for each(stBaseMoveIntruder in this.m_arrBaseMoveIntruderVector.slice())
         {
            if(stBaseMoveIntruder.globalMoveFighterID == stVanishEnemy.m_iEnemyID)
            {
               if(stBaseMoveIntruder.m_stCurrentFieldGrid)
               {
                  stBaseMoveIntruder.m_iDieType = 1;
                  stBaseMoveIntruder.a_3969(stBaseMoveIntruder.iLifeValue);
                  stBaseMoveIntruder.a_4211(stBaseMoveIntruder.iLifeValue);
               }
               stBaseMoveIntruder.a_4212();
               return true;
            }
         }
         return false;
      }
      
      public function MoveIntruderStateChangeByGlobalID(stEntityStateChange:CEntityStateChange) : Boolean
      {
         var stBaseMoveIntruder:a_4206 = null;
         if(stEntityStateChange.m_iType != 2)
         {
            return false;
         }
         for each(stBaseMoveIntruder in this.m_arrBaseMoveIntruderVector.slice())
         {
            if(stBaseMoveIntruder.globalMoveFighterID == stEntityStateChange.m_iGlobalID && stBaseMoveIntruder.m_stMoveIntruderTypeID == stEntityStateChange.m_iTypeID)
            {
               stBaseMoveIntruder.SpecialSkillCallBack(stEntityStateChange.key,stEntityStateChange.value);
               return true;
            }
         }
         return false;
      }
      
      public function DefenseStateChangeByGlobalID(stEntityStateChange:CEntityStateChange) : Boolean
      {
         var finalBrahma:a_3976 = null;
         if(!stEntityStateChange || stEntityStateChange.m_iType != 1)
         {
            return false;
         }
         var yGridNo:int = stEntityStateChange.key;
         var xGridNo:int = stEntityStateChange.m_iTypeID;
         if(yGridNo < 0 || yGridNo >= a_1012 || xGridNo < 0 || xGridNo >= a_1011)
         {
            return false;
         }
         var stGrid:a_3491 = this.a_1058[yGridNo][xGridNo];
         if(!stGrid)
         {
            return false;
         }
         if(stEntityStateChange.value == 288950029)
         {
            finalBrahma = stGrid.m_stFinalBrahmaDefense;
            if(Boolean(finalBrahma) && finalBrahma.m_iDefenseGlobalID == stEntityStateChange.m_iGlobalID)
            {
               finalBrahma.SpecialSkillCallBack(1);
               return true;
            }
         }
         return false;
      }
      
      public function a_3459(stBaseMoveIntruder:a_4206, stFieldGrid:a_3491, isNeedInitialize:Boolean = true, iType:int = -1) : Boolean
      {
         var stTargetFieldGird:a_3491 = null;
         var iCurrentFrame:int = 0;
         if(null != stBaseMoveIntruder && null != stFieldGrid)
         {
            stBaseMoveIntruder.m_isRemovedFromBattaleField = false;
            if(isNeedInitialize)
            {
               stBaseMoveIntruder.a_1797(stBaseMoveIntruder.globalMoveFighterID,this.a_1071);
            }
            if(-1 == this.m_arrBaseMoveIntruderVector.indexOf(stBaseMoveIntruder))
            {
               this.m_arrBaseMoveIntruderVector.push(stBaseMoveIntruder);
               iCurrentFrame = stBaseMoveIntruder.iCurrentFrame;
               stBaseMoveIntruder.gotoAndStop(1);
               stBaseMoveIntruder.y = stBaseMoveIntruder.iYPosSkewing + a_3491.a_1081 * stFieldGrid.m_iYGridNo + (a_3491.a_1081 - stBaseMoveIntruder.height);
               stBaseMoveIntruder.gotoAndStop(iCurrentFrame);
               stBaseMoveIntruder.a_4207();
               stTargetFieldGird = this.a_1058[stFieldGrid.m_iYGridNo][0];
               if(iType >= 0)
               {
                  this.m_stBattleLayerManager.AddToBattleView(stBaseMoveIntruder,iType,stTargetFieldGird);
               }
               else if(Boolean(stBaseMoveIntruder as IBossMoveIntruder) && (!stBaseMoveIntruder.hasOwnProperty("IsBoss") || (stBaseMoveIntruder as BaseBossMoveIntruder).IsBoss))
               {
                  this.m_stBattleLayerManager.AddToBattleView(stBaseMoveIntruder,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,stTargetFieldGird);
               }
               else
               {
                  this.m_stBattleLayerManager.AddToBattleView(stBaseMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,stTargetFieldGird);
               }
               stFieldGrid.a_3459(stBaseMoveIntruder);
               this.AddRowIntruderNum(stBaseMoveIntruder,stFieldGrid.m_iYGridNo);
               return true;
            }
            throw new Error("BattleField AddMoveIntruder Failed: -1 != m_arrBaseMoveIntruderVector.indexOf(stBaseMoveIntruder)");
         }
         return false;
      }
      
      public function MoveIntruderChangeFieldGrid(stBaseMoveIntruder:a_4206, stOrigFieldGrid:a_3491, stTargetFieldGrid:a_3491) : Boolean
      {
         if(null == stBaseMoveIntruder || null == stOrigFieldGrid || null == stTargetFieldGrid)
         {
            return false;
         }
         this.ReduceRowIntruderNum(stBaseMoveIntruder,stOrigFieldGrid.m_iYGridNo);
         stTargetFieldGrid.a_3459(stBaseMoveIntruder);
         this.AddRowIntruderNum(stBaseMoveIntruder,stTargetFieldGrid.m_iYGridNo);
         var stRowTargetFieldGird:a_3491 = this.a_1058[stTargetFieldGrid.m_iYGridNo][0];
         if(Boolean(stBaseMoveIntruder as IBossMoveIntruder) && (!stBaseMoveIntruder.hasOwnProperty("IsBoss") || (stBaseMoveIntruder as BaseBossMoveIntruder).IsBoss))
         {
            this.m_stBattleLayerManager.AddToBattleView(stBaseMoveIntruder,BattleLayerDefine.INTRUDER_SKY_BOSS_TYPE,stRowTargetFieldGird);
         }
         else
         {
            this.m_stBattleLayerManager.AddToBattleView(stBaseMoveIntruder,BattleLayerDefine.INTRUDER_LAND_TYPE,stRowTargetFieldGird);
         }
         return true;
      }
      
      public function a_3460(iXGridNo:int, iYGridNo:int) : Boolean
      {
         var stFieldGrid:a_3491 = this.a_3438(iXGridNo,iYGridNo);
         if(null == stFieldGrid)
         {
            return false;
         }
         if(Boolean(stFieldGrid) && Boolean(stFieldGrid.m_stBaseFieldAlarm) && stFieldGrid.m_stBaseFieldAlarm is a_4440)
         {
            return true;
         }
         this.a_3461(iXGridNo,iYGridNo);
         var stBaseFieldAlarm:a_4408 = a_4440.a_3926();
         stBaseFieldAlarm.x = a_3491.a_1080 * iXGridNo;
         stBaseFieldAlarm.y = a_3491.a_1081 * iYGridNo + 10;
         if(this.a_1071 > 0)
         {
            stBaseFieldAlarm.x = a_3491.a_1080 * (a_1011 - iXGridNo - 1);
         }
         var stTargetFieldGird:a_3491 = this.a_1058[iYGridNo][iXGridNo];
         this.m_stBattleLayerManager.AddToBattleView(stBaseFieldAlarm,BattleLayerDefine.DEFENSE_AUXILIARY_FIGHTER_TYPE,stTargetFieldGird);
         stFieldGrid.m_stBaseFieldAlarm = stBaseFieldAlarm;
         return true;
      }
      
      public function a_3461(iXGridNo:int, iYGridNo:int) : Boolean
      {
         var stFieldGrid:a_3491 = this.a_3438(iXGridNo,iYGridNo);
         if(null == stFieldGrid)
         {
            return false;
         }
         if(stFieldGrid.m_stBaseFieldAlarm)
         {
            if(stFieldGrid.m_stBaseFieldAlarm.parent)
            {
               stFieldGrid.m_stBaseFieldAlarm.parent.removeChild(stFieldGrid.m_stBaseFieldAlarm);
            }
            stFieldGrid.m_stBaseFieldAlarm.a_3940();
            stFieldGrid.m_stBaseFieldAlarm = null;
         }
         return true;
      }
      
      public function a_3462(iGridNum:int = -1) : Boolean
      {
         if(-1 == iGridNum)
         {
            iGridNum = this.m_stLargeFogEffect.LastGridNum;
         }
         if(iGridNum >= 0)
         {
            this.m_stLargeFogEffect.a_4129(this.a_1058,iGridNum);
         }
         return true;
      }
      
      public function a_3463(iHoleRadomID:int) : Boolean
      {
         var stMouseEarthHole:a_4135 = null;
         var iTatolFreeGrid:int = this.a_3424();
         if(iTatolFreeGrid <= 0)
         {
            return false;
         }
         var stTempFieldGrid:a_3491 = this.a_3428(iHoleRadomID % iTatolFreeGrid);
         if(null == stTempFieldGrid)
         {
            return false;
         }
         stTempFieldGrid.m_isExistMouseHole = true;
         if(m_iEarthHoleType == 1)
         {
            stMouseEarthHole = a_4135.a_3926();
         }
         else if(m_iEarthHoleType == 2)
         {
            stMouseEarthHole = MouseSecondEarthHole.a_3926();
         }
         stMouseEarthHole.a_1797(!this.m_isOwnBattleField);
         stMouseEarthHole.x = a_3491.a_1080 * stTempFieldGrid.m_iXGridNo + 0.5 * (a_3491.a_1080 - stMouseEarthHole.width);
         stMouseEarthHole.y = a_3491.a_1081 * stTempFieldGrid.m_iYGridNo + 0.5 * (a_3491.a_1081 - stMouseEarthHole.height) + 15;
         this.m_stBattleLayerManager.AddToBattleView(stMouseEarthHole,BattleLayerDefine.EFFECTS_BASE_TYPE);
         stMouseEarthHole.play();
         if(!this.m_isOwnBattleField)
         {
            stMouseEarthHole.x = a_1013 - stMouseEarthHole.x;
         }
         stTempFieldGrid.m_stMouseEarthHole = stMouseEarthHole;
         return true;
      }
      
      public function a_3464(stFieldGrid:a_3491) : Boolean
      {
         var stMouseEarthHole:a_4135 = null;
         var stTempFieldGrid:a_3491 = stFieldGrid;
         if(null == stTempFieldGrid || Boolean(stTempFieldGrid) && Boolean(stTempFieldGrid.m_isExistMouseHole))
         {
            return false;
         }
         stTempFieldGrid.m_isExistMouseHole = true;
         if(m_iEarthHoleType == 1)
         {
            stMouseEarthHole = a_4135.a_3926();
         }
         else if(m_iEarthHoleType == 2)
         {
            stMouseEarthHole = MouseSecondEarthHole.a_3926();
         }
         stMouseEarthHole.a_1797(!this.m_isOwnBattleField);
         stMouseEarthHole.x = a_3491.a_1080 * stTempFieldGrid.m_iXGridNo + 0.5 * (a_3491.a_1080 - stMouseEarthHole.width);
         stMouseEarthHole.y = a_3491.a_1081 * stTempFieldGrid.m_iYGridNo + 0.5 * (a_3491.a_1081 - stMouseEarthHole.height) + 15;
         this.m_stBattleLayerManager.AddToBattleView(stMouseEarthHole,BattleLayerDefine.EFFECTS_BASE_TYPE);
         stMouseEarthHole.play();
         if(!this.m_isOwnBattleField)
         {
            stMouseEarthHole.x = a_1013 - stMouseEarthHole.x;
         }
         stTempFieldGrid.m_stMouseEarthHole = stMouseEarthHole;
         return true;
      }
      
      public function a_3465(stFieldGrid:a_3491) : Boolean
      {
         var stMouseComeUpEarthEffect:a_4133 = null;
         if(Boolean(stFieldGrid) && Boolean(stFieldGrid.m_stMouseEarthHole))
         {
            stMouseComeUpEarthEffect = a_4133.a_3926();
            stMouseComeUpEarthEffect.a_1797(!this.m_isOwnBattleField);
            stMouseComeUpEarthEffect.x = a_3491.a_1080 * stFieldGrid.m_iXGridNo + 0.5 * (a_3491.a_1080 - stMouseComeUpEarthEffect.width);
            stMouseComeUpEarthEffect.y = a_3491.a_1081 * stFieldGrid.m_iYGridNo + 0.5 * (a_3491.a_1081 - stMouseComeUpEarthEffect.height) + 15;
            this.addChild(stMouseComeUpEarthEffect);
            stMouseComeUpEarthEffect.play();
            return true;
         }
         return false;
      }
      
      public function a_3466() : Boolean
      {
         if(0 == this.a_1073)
         {
            this.a_1073 = 2;
         }
         return true;
      }
      
      public function a_3467(iChangeLifeValue:int, stGameBasePop:IBaseProp) : Boolean
      {
         var stBaseMoveIntruder:a_4206 = null;
         var stPropDisplayEffect:MovieClip = null;
         if(this.m_arrBaseMoveIntruderVector.length > 0)
         {
            for each(stBaseMoveIntruder in this.m_arrBaseMoveIntruderVector.slice())
            {
               if(stBaseMoveIntruder.iLifeValue > 0)
               {
                  stBaseMoveIntruder.a_3969(-1 * iChangeLifeValue);
                  stPropDisplayEffect = stGameBasePop.a_4327();
                  stPropDisplayEffect.x = stBaseMoveIntruder.width;
                  stPropDisplayEffect.y = -20;
                  stBaseMoveIntruder.addChild(stPropDisplayEffect);
               }
            }
         }
         return true;
      }
      
      public function a_3468(stGameBasePop:IBaseProp) : Boolean
      {
         this.a_1070.push(stGameBasePop);
         return true;
      }
      
      public function a_3469(stGameBasePop:IBaseProp) : Boolean
      {
         var stFieldGrid:a_3491 = null;
         var j:int = 0;
         for(var i:int = 0; i < a_1012; i++)
         {
            for(j = 0; j < a_1011; j++)
            {
               stFieldGrid = this.a_1058[i][j];
               if(null != stFieldGrid.m_stFlowerDefense)
               {
                  stFieldGrid.m_stFlowerDefense.m_arrEnergyAddValueProp.push(stGameBasePop);
               }
            }
         }
         return true;
      }
      
      public function a_3470(iChangeLifeValue:int, stGameBasePop:IBaseProp) : Boolean
      {
         var stFieldGrid:a_3491 = null;
         var stPropDisplayEffect:MovieClip = null;
         var j:int = 0;
         for(var i:int = 0; i < a_1012; i++)
         {
            for(j = 0; j < a_1011; j++)
            {
               stFieldGrid = this.a_1058[i][j];
               if(null != stFieldGrid.m_stProtector)
               {
                  stFieldGrid.m_stProtector.a_3969(-1 * iChangeLifeValue);
                  stPropDisplayEffect = stGameBasePop.a_4327();
                  stPropDisplayEffect.x = stFieldGrid.m_stProtector.width;
                  stPropDisplayEffect.y = -20;
                  stFieldGrid.m_stProtector.addChild(stPropDisplayEffect);
               }
               if(null != stFieldGrid.m_stAttackFighter && stFieldGrid.m_stAttackFighter.iBreadFighterType > 0)
               {
                  stFieldGrid.m_stAttackFighter.a_3969(-1 * iChangeLifeValue);
                  stPropDisplayEffect = stGameBasePop.a_4327();
                  stPropDisplayEffect.x = stFieldGrid.m_stAttackFighter.width;
                  stPropDisplayEffect.y = -20;
                  stFieldGrid.m_stAttackFighter.addChild(stPropDisplayEffect);
               }
            }
         }
         return true;
      }
      
      private function a_3471(iCurrentTime:int) : void
      {
         var _loc2_:Vector.<a_4269> = null;
         var _loc3_:a_4269 = null;
      }
      
      public function MoveHandler(stBlock:MoveBlockFieldGrid) : Boolean
      {
         this.ShowFieldInfo();
         var result:Boolean = false;
         switch(stBlock.m_iDirection)
         {
            case MoveBlockFieldGrid.MOVE_UP:
               result = this.MoveUpHandler(stBlock);
               break;
            case MoveBlockFieldGrid.MOVE_DOWN:
               result = this.MoveDownHandler(stBlock);
               break;
            case MoveBlockFieldGrid.MOVE_LEFT:
               result = this.MoveLeftHandler(stBlock);
               break;
            case MoveBlockFieldGrid.MOVE_RIGHT:
               result = this.MoveRightHandler(stBlock);
         }
         this.ShowFieldInfo();
         return result;
      }
      
      private function MoveLeftHandler(stBlock:MoveBlockFieldGrid) : Boolean
      {
         var stFieldGrid:a_3491 = null;
         var i:int = 0;
         var j:int = 0;
         for(i = stBlock.m_iYGridNo; i < stBlock.m_iYGridNo + stBlock.m_iHeight; i++)
         {
            for(j = stBlock.m_iXGridNo; j < stBlock.m_iXGridNo + stBlock.m_iWidth; j++)
            {
               this.OnSwapFieldGrid(this.a_1058[i][j],this.a_1058[i][j - 1]);
            }
         }
         return true;
      }
      
      private function MoveRightHandler(stBlock:MoveBlockFieldGrid) : Boolean
      {
         var stFieldGrid:a_3491 = null;
         var i:int = 0;
         var j:* = 0;
         for(i = stBlock.m_iYGridNo; i < stBlock.m_iYGridNo + stBlock.m_iHeight; i++)
         {
            for(j = int(stBlock.m_iXGridNo + stBlock.m_iWidth); j > stBlock.m_iXGridNo; j--)
            {
               this.OnSwapFieldGrid(this.a_1058[i][j - 1],this.a_1058[i][j]);
            }
         }
         return true;
      }
      
      private function MoveUpHandler(stBlock:MoveBlockFieldGrid) : Boolean
      {
         var stFieldGrid:a_3491 = null;
         var i:int = 0;
         var j:int = 0;
         for(i = stBlock.m_iYGridNo; i < stBlock.m_iYGridNo + stBlock.m_iHeight; i++)
         {
            for(j = stBlock.m_iXGridNo; j < stBlock.m_iXGridNo + stBlock.m_iWidth; j++)
            {
               this.OnSwapFieldGrid(this.a_1058[i][j],this.a_1058[i - 1][j]);
            }
         }
         return true;
      }
      
      private function MoveDownHandler(stBlock:MoveBlockFieldGrid) : Boolean
      {
         var stFieldGrid:a_3491 = null;
         var i:* = 0;
         var j:int = 0;
         for(i = int(stBlock.m_iYGridNo + stBlock.m_iHeight - 1); i >= stBlock.m_iYGridNo; i--)
         {
            for(j = stBlock.m_iXGridNo; j < stBlock.m_iXGridNo + stBlock.m_iWidth; j++)
            {
               this.OnSwapFieldGrid(this.a_1058[i][j],this.a_1058[i + 1][j]);
            }
         }
         return true;
      }
      
      private function printRowNum(strMark:String = "") : void
      {
      }
      
      private function OnSwapFieldGrid(stCurrentFieldGrid:a_3491, stTargetFieldGrid:a_3491) : void
      {
         var stMoveIntruder:a_4206 = null;
         var iCurrX:int = stCurrentFieldGrid.m_iXGridNo;
         var iCurrY:int = stCurrentFieldGrid.m_iYGridNo;
         var iTargetX:int = stTargetFieldGrid.m_iXGridNo;
         var iTargetY:int = stTargetFieldGrid.m_iYGridNo;
         var arrCurrentMoveIntruder:Array = stCurrentFieldGrid.a_1511.slice();
         stCurrentFieldGrid.a_1511.length = 0;
         var arrTargetMoveIntruder:Array = stTargetFieldGrid.a_1511.slice();
         stTargetFieldGrid.a_1511.length = 0;
         if(arrCurrentMoveIntruder.length > 0 || arrTargetMoveIntruder.length > 0)
         {
            this.printRowNum("swapPre");
         }
         for each(stMoveIntruder in arrCurrentMoveIntruder)
         {
            stTargetFieldGrid.a_1511.push(stMoveIntruder);
            stMoveIntruder.m_stCurrentFieldGrid = stTargetFieldGrid;
         }
         for each(stMoveIntruder in arrTargetMoveIntruder)
         {
            stCurrentFieldGrid.a_1511.push(stMoveIntruder);
            stMoveIntruder.m_stCurrentFieldGrid = stCurrentFieldGrid;
         }
         if(arrCurrentMoveIntruder.length > 0 || arrTargetMoveIntruder.length > 0)
         {
            this.printRowNum("swapSuf");
         }
         stTargetFieldGrid.m_isOccupy = Boolean(stTargetFieldGrid.a_1511.length > 0);
         stCurrentFieldGrid.m_isOccupy = Boolean(stCurrentFieldGrid.a_1511.length > 0);
         stCurrentFieldGrid.m_iXGridNo = iTargetX;
         stCurrentFieldGrid.m_iYGridNo = iTargetY;
         this.a_1058[iTargetY][iTargetX] = stCurrentFieldGrid;
         stTargetFieldGrid.m_iXGridNo = iCurrX;
         stTargetFieldGrid.m_iYGridNo = iCurrY;
         this.a_1058[iCurrY][iCurrX] = stTargetFieldGrid;
         var stCurrentCheckFieldGrid:CheckFieldGrid = this.m_stCheckFieldGridsVector[iCurrY][iCurrX];
         var stCheckTargetFieldGrid:CheckFieldGrid = this.m_stCheckFieldGridsVector[iTargetY][iTargetX];
         stCurrentCheckFieldGrid.m_iXGridNo = iTargetX;
         stCurrentCheckFieldGrid.m_iYGridNo = iTargetY;
         this.m_stCheckFieldGridsVector[iTargetY][iTargetX] = stCurrentCheckFieldGrid;
         stCheckTargetFieldGrid.m_iXGridNo = iCurrX;
         stCheckTargetFieldGrid.m_iYGridNo = iCurrY;
         this.m_stCheckFieldGridsVector[iCurrY][iCurrX] = stCheckTargetFieldGrid;
         a_4648.a_4649("交换格子:(" + iCurrX + "," + iCurrY + ")" + ">>>(" + iTargetX + "," + iTargetY + ")");
      }
      
      public function RegisterMap(stBaseGameMap:BaseGameMoveMap) : void
      {
         this.m_stBaseGameMap = stBaseGameMap;
         this.ShowFieldInfo();
      }
      
      public function GetGameMoveMap() : BaseGameMoveMap
      {
         return this.m_stBaseGameMap;
      }
      
      public function get stMoveSprite() : Sprite
      {
         return this.m_stMoveSp;
      }
      
      public function SortDisplayObject() : void
      {
         this.m_stBattleLayerManager.Sort();
      }
      
      public function calculateAverageDamage(attackPower:Number, hitCount:int) : Array
      {
         var totalDamage:Number = attackPower * hitCount;
         var damagePerHit:Array = [];
         var baseDamage:Number = Math.floor(totalDamage / hitCount);
         var totalBaseDamage:Number = baseDamage * hitCount;
         var difference:int = Math.round(totalDamage - totalBaseDamage);
         for(var i:int = 0; i < hitCount; i++)
         {
            if(i < difference)
            {
               damagePerHit.push(baseDamage + 1);
            }
            else
            {
               damagePerHit.push(baseDamage);
            }
         }
         return damagePerHit;
      }
      
      public function GetInitialFieldGrid(iInitialX:int, iInitialY:int) : a_3491
      {
         var i:int = 0;
         var j:int = 0;
         var stFieldGrid:a_3491 = null;
         loop0:
         for(i = 0; i < a_1012; )
         {
            j = 0;
            while(true)
            {
               if(j >= a_1011)
               {
                  i++;
                  continue loop0;
               }
               stFieldGrid = this.a_1058[i][j];
               if(iInitialX == stFieldGrid.m_iInitialXGridNo && iInitialY == stFieldGrid.m_iInitialYGridNo)
               {
                  break;
               }
               j++;
            }
            return stFieldGrid;
         }
         return null;
      }
      
      public function AddToBattleView(stDisplayObject:DisplayObject, iType:int, stTargetFieldGrid:a_3491 = null) : void
      {
         if(stDisplayObject as VolcanicFireEffect)
         {
            (stDisplayObject as VolcanicFireEffect).stCurrentFieldGrid = stTargetFieldGrid;
         }
         this.m_stBattleLayerManager.AddToBattleView(stDisplayObject,iType,stTargetFieldGrid);
      }
      
      override public function addChildAt(stChild:DisplayObject, index:int) : DisplayObject
      {
         if(stChild as a_4348)
         {
            this.m_stBattleLayerManager.AddToBattleView(stChild,BattleLayerDefine.SHOT_TYPE);
         }
         else if(stChild as AddBloodEffect)
         {
            this.m_stBattleLayerManager.AddToBattleView(stChild,BattleLayerDefine.EFFECTS_TOP_TYPE);
         }
         else if(stChild as a_4206)
         {
            this.m_stBattleLayerManager.AddToBattleView(stChild,BattleLayerDefine.INTRUDER_LAND_TYPE,(stChild as a_4206).m_stCurrentFieldGrid);
         }
         else if(stChild as a_4157)
         {
            this.m_stBattleLayerManager.AddToBattleView(stChild,BattleLayerDefine.EFFECTS_TOP_TYPE);
         }
         else
         {
            if(!(stChild as a_4448))
            {
               return super.addChildAt(stChild,index);
            }
            this.m_stBattleLayerManager.AddToBattleView(stChild,BattleLayerDefine.EFFECTS_BASE_TYPE);
         }
         return stChild;
      }
      
      override public function addChild(stChild:DisplayObject) : DisplayObject
      {
         if(stChild as a_4348)
         {
            this.m_stBattleLayerManager.AddToBattleView(stChild,BattleLayerDefine.SHOT_TYPE);
         }
         else if(stChild as AddBloodEffect)
         {
            this.m_stBattleLayerManager.AddToBattleView(stChild,BattleLayerDefine.EFFECTS_TOP_TYPE);
         }
         else if(stChild as a_4206)
         {
            this.m_stBattleLayerManager.AddToBattleView(stChild,BattleLayerDefine.INTRUDER_LAND_TYPE);
         }
         else if(stChild as a_4157)
         {
            this.m_stBattleLayerManager.AddToBattleView(stChild,BattleLayerDefine.EFFECTS_TOP_TYPE);
         }
         else
         {
            if(!(stChild as a_4448))
            {
               return super.addChild(stChild);
            }
            this.m_stBattleLayerManager.AddToBattleView(stChild,BattleLayerDefine.EFFECTS_BASE_TYPE);
         }
         return stChild;
      }
      
      public function ShowFieldInfo() : void
      {
         var st:a_3491 = null;
         var i:int = 0;
         var j:int = 0;
      }
   }
}

