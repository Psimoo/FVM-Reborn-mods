package com.aurora.ui.maogoutd.resource.defender
{
   import a_4752.GlobalVariables;
   import a_4752.TagComponent;
   import a_4753.b_150;
   import com.adobe.utils.RandomSeed;
   import com.aurora.protocol.game.maogoutd.CVanishDefender;
   import com.aurora.protocol.game.maogoutd.CardDieVO;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Buff.BuffComponent;
   import com.aurora.ui.maogoutd.game.GameCardView;
   import com.aurora.ui.maogoutd.game.Util.BattleDecorationEffectUtil;
   import com.aurora.ui.maogoutd.game.Util.BattleVOUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.GoldRebirthOsiris.effect.GoldOsirisInvincibleBuff;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.stardome.ImperialStrikeHurtBuff;
   import com.aurora.ui.maogoutd.resource.defender.PigYear.IceCreamPitcher.FrozenCardEffect;
   import com.aurora.ui.maogoutd.resource.defender.PigYear.IceCreamPitcher.ShiHuaEffect;
   import com.aurora.ui.maogoutd.resource.defender.RabbitYear.YanYanRabbit.YanYanRabbitAddFireBuff;
   import com.aurora.ui.maogoutd.resource.effect.GradeLevelAnimation.GradeLevel1Animation;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.effect.a_4110;
   import flash.display.Bitmap;
   import flash.display.FrameLabel;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.clearInterval;
   import flash.utils.setTimeout;
   
   public class a_3962 extends a_3909
   {
      
      public static var a_1088:b_150;
      
      public static var s_GlobalInitCount:int = 0;
      
      public var m_stShadowRefence:Bitmap;
      
      public var m_iDefenseGlobalID:int;
      
      public var m_iBeOtherPlaced:Boolean;
      
      public var m_iDefenseRandomSeed:RandomSeed = new RandomSeed();
      
      public var m_IsCaclueCoolDown:int = 0;
      
      public var m_iMoveState:int;
      
      public var m_iBattleLayerType:int;
      
      private var m_iPlaceTimeIntervalsEx:uint = 0;
      
      private var m_isHurtByOpponentEx:Boolean = false;
      
      private var m_iDieTypeEx:int = 0;
      
      private var m_iDefenseStateTypeEx:int = 0;
      
      private var m_iOffsetByYEx:int = 0;
      
      private var m_isNeedAddShawdowEx:Boolean = false;
      
      private var m_iDefenseTypeIDEx:uint = 0;
      
      private var m_iDefensePriceEx:uint = 0;
      
      public var m_iRealDefensePrice:uint;
      
      private var m_iTickTimeEx:int = 0;
      
      private var m_iFangyuTimeEx:int = 0;
      
      private var ResetStarTimeout:int;
      
      private var m_isNeedAdditionPriceEx:Boolean = false;
      
      protected var a_1334:a_3491;
      
      protected var a_1335:int;
      
      public var iUpgradeArray:Array = new Array();
      
      protected var m_stBaseGradeLevel:GradeLevel1Animation;
      
      protected var m_stNewStarLevel:NewStarLevelAnimation;
      
      protected var a_1336:a_4110;
      
      public var m_stFrozenCardEffect:FrozenCardEffect;
      
      public var m_stShiHuaEffect:ShiHuaEffect;
      
      public var m_AddFireBuff:YanYanRabbitAddFireBuff;
      
      public var m_FangyuBuff:a_4108;
      
      public var m_InvincibleBuff:a_4108;
      
      public var m_BaseEffect:a_4108;
      
      private var m_iStarDegreeEx:int = 0;
      
      private var m_iOrigSeatIDEx:int = 0;
      
      private var m_iRealStarDegreeEx:int = 0;
      
      private var m_iSkillDegreeEx:int = 0;
      
      private var m_iGradeDegreeEx:int = 0;
      
      private var m_iXPosSheftEx:int = 0;
      
      private var m_iYPosSheftEx:int = 0;
      
      private var m_iHiddenLifeValueEx:int = 50;
      
      private var m_InitialLifeValueEx:int = 0;
      
      private var m_isShihuaEx:Boolean = false;
      
      private var m_isShowFrozenEx:Boolean = false;
      
      private var m_CannotFrozenCard:Array = new Array(288817232,288817246,288817247,286392912,286392926,286392927,286396464,286396478,286396479);
      
      private var m_stTimer:Timer;
      
      private var ticks:int;
      
      private var m_bIsSleepingEx:Boolean = false;
      
      private var m_bIsNotEaten:Boolean = false;
      
      private var m_bServerIssuedEx:Boolean = false;
      
      private var m_bPlaceByUpGradeCardEx:Boolean = false;
      
      private var _tagCom:TagComponent = new TagComponent();
      
      private var _buffCom:BuffComponent;
      
      public function a_3962()
      {
         super();
         gotoAndStop(1);
      }
      
      private static function RecordEatDieDeath(stDefenderInfo:CVanishDefender, iDieTimeNum:int) : void
      {
         if(!stDefenderInfo || stDefenderInfo.m_byIsTool != 1 || !GameCardView.a_1089)
         {
            return;
         }
         var copyItem:int = stDefenderInfo.m_iDefenderTypeID;
         if(BattleFieldView.JudgeIsCopyCard(copyItem) || BattleFieldView.JudgeIsCooldownCard(copyItem))
         {
            return;
         }
         GameCardView.a_1089.a_3412().m_iLastDeathDefender = stDefenderInfo.m_iDefenderTypeID;
         var data:CardDieVO = new CardDieVO();
         data.m_iDefenderID = stDefenderInfo.m_iDefenderID;
         data.m_iDefenderTypeID = stDefenderInfo.m_iDefenderTypeID;
         data.m_byYGridNo = stDefenderInfo.m_byYGridNo;
         data.m_byXGridNo = stDefenderInfo.m_byXGridNo;
         data.m_byIsTool = stDefenderInfo.m_byIsTool;
         data.m_iOrigSeatID = stDefenderInfo.m_iOrigSeatID;
         data.m_DieTime = iDieTimeNum;
         GlobalVariables.getInstance().m_iEatDieArr.push(data);
      }
      
      public function get m_iPlaceTimeIntervals() : uint
      {
         return this.m_iPlaceTimeIntervalsEx;
      }
      
      public function set m_iPlaceTimeIntervals(iValue:uint) : void
      {
         this.m_iPlaceTimeIntervalsEx = iValue;
      }
      
      public function get m_isHurtByOpponent() : Boolean
      {
         return this.m_isHurtByOpponentEx;
      }
      
      public function set m_isHurtByOpponent(value:Boolean) : void
      {
         this.m_isHurtByOpponentEx = value;
      }
      
      public function get m_iDieType() : int
      {
         return this.m_iDieTypeEx;
      }
      
      public function set m_iDieType(value:int) : void
      {
         this.m_iDieTypeEx = value;
      }
      
      public function get m_iDefenseStateType() : int
      {
         return this.m_iDefenseStateTypeEx;
      }
      
      public function set m_iDefenseStateType(value:int) : void
      {
         this.m_iDefenseStateTypeEx = value;
      }
      
      public function get m_iOffsetByY() : int
      {
         return this.m_iOffsetByYEx;
      }
      
      public function set m_iOffsetByY(value:int) : void
      {
         this.m_iOffsetByYEx = value;
      }
      
      protected function get a_1333() : Boolean
      {
         return this.m_isNeedAddShawdowEx;
      }
      
      protected function set a_1333(value:Boolean) : void
      {
         this.m_isNeedAddShawdowEx = value;
      }
      
      protected function get a_1098() : uint
      {
         return this.m_iDefenseTypeIDEx;
      }
      
      protected function set a_1098(iValue:uint) : void
      {
         this.m_iDefenseTypeIDEx = iValue;
      }
      
      public function GetRealPrice() : int
      {
         if(this.m_iRealDefensePrice > 0)
         {
            return this.m_iRealDefensePrice;
         }
         return this.iDefensePrice;
      }
      
      public function get m_iTickTime() : int
      {
         return this.m_iTickTimeEx;
      }
      
      public function set m_iTickTime(value:int) : void
      {
         this.m_iTickTimeEx = value;
      }
      
      public function get m_iFangyuTime() : int
      {
         return this.m_iFangyuTimeEx;
      }
      
      public function set m_iFangyuTime(value:int) : void
      {
         this.m_iFangyuTimeEx = value;
      }
      
      protected function get a_1095() : uint
      {
         return this.m_iDefensePriceEx;
      }
      
      protected function set a_1095(value:uint) : void
      {
         this.m_iDefensePriceEx = value;
      }
      
      protected function get a_1096() : Boolean
      {
         return this.m_isNeedAdditionPriceEx;
      }
      
      protected function set a_1096(value:Boolean) : void
      {
         this.m_isNeedAdditionPriceEx = value;
      }
      
      public function get a_1094() : int
      {
         return this.m_iStarDegreeEx;
      }
      
      public function set a_1094(iValue:int) : void
      {
         this.m_iStarDegreeEx = iValue;
      }
      
      public function get m_iOrigSeatID() : int
      {
         return this.m_iOrigSeatIDEx;
      }
      
      public function set m_iOrigSeatID(iValue:int) : void
      {
         this.m_iOrigSeatIDEx = iValue;
      }
      
      public function get m_iRealStarDegree() : int
      {
         return this.m_iRealStarDegreeEx;
      }
      
      public function set m_iRealStarDegree(iValue:int) : void
      {
         this.m_iRealStarDegreeEx = iValue;
      }
      
      public function get m_iSkillDegree() : int
      {
         return this.m_iSkillDegreeEx;
      }
      
      public function set m_iSkillDegree(iValue:int) : void
      {
         this.m_iSkillDegreeEx = iValue;
      }
      
      public function get m_iGradeDegree() : int
      {
         return this.m_iGradeDegreeEx;
      }
      
      public function set m_iGradeDegree(iValue:int) : void
      {
         this.m_iGradeDegreeEx = iValue;
      }
      
      protected function get a_1337() : int
      {
         return this.m_iXPosSheftEx;
      }
      
      protected function set a_1337(value:int) : void
      {
         this.m_iXPosSheftEx = value;
      }
      
      protected function get a_1338() : int
      {
         return this.m_iYPosSheftEx;
      }
      
      protected function set a_1338(value:int) : void
      {
         this.m_iYPosSheftEx = value;
      }
      
      protected function set m_iHiddenLifeValue(value:int) : void
      {
         this.m_iHiddenLifeValueEx = value;
      }
      
      protected function get m_iHiddenLifeValue() : int
      {
         return this.m_iHiddenLifeValueEx;
      }
      
      protected function get m_InitialLifeValue() : int
      {
         return this.m_InitialLifeValueEx;
      }
      
      protected function set m_InitialLifeValue(value:int) : void
      {
         this.m_InitialLifeValueEx = value;
      }
      
      public function get m_isShihua() : Boolean
      {
         return this.m_isShihuaEx;
      }
      
      public function set m_isShihua(value:Boolean) : void
      {
         var bShouldShowShiHua:Boolean = false;
         this.m_isShihuaEx = value;
         if(this.m_isShowFrozen)
         {
            return;
         }
         bShouldShowShiHua = value && !this.checkHasProtector() && !this.checkHasTrayDefense();
         if(bShouldShowShiHua)
         {
            this.CreateShiHuaEffect();
         }
         else if(this.m_stShiHuaEffect)
         {
            this.m_stShiHuaEffect.a_3940();
            this.m_stShiHuaEffect = null;
         }
         this.visible = !value;
         if(bShouldShowShiHua)
         {
            this.a_2217();
         }
         else
         {
            this.a_2218();
         }
      }
      
      public function get m_isShowFrozen() : Boolean
      {
         return this.m_isShowFrozenEx;
      }
      
      public function set m_isShowFrozen(value:Boolean) : void
      {
         var bShouldShowFrozen:Boolean = false;
         if(value && this.m_CannotFrozenCard.indexOf(this.a_3512()) != -1)
         {
            return;
         }
         this.m_isShowFrozenEx = value;
         if(value == false)
         {
            this.m_isShihua = false;
         }
         if(this.m_stFrozenCardEffect)
         {
            this.m_stFrozenCardEffect.visible = value;
         }
         if(this.stFieldGrid != null)
         {
            this.stFieldGrid.m_isShowFrozen = this.checkFieldisShowFrozen();
         }
         bShouldShowFrozen = value && !this.checkHasProtector() && !this.checkHasTrayDefense();
         if(bShouldShowFrozen && this.stFieldGrid.m_bShowFrozenEffect)
         {
            this.addFrozenEffect();
         }
         else if(this.m_stFrozenCardEffect)
         {
            this.m_stFrozenCardEffect.a_3940();
            this.m_stFrozenCardEffect = null;
         }
         if(!(Boolean(this.stFieldGrid) && !this.stFieldGrid.m_bShowFrozenEffect))
         {
            this.visible = !value;
            if(bShouldShowFrozen)
            {
               this.a_2217();
            }
            else
            {
               this.a_2218();
            }
         }
         if(this.m_stBaseGradeLevel)
         {
            this.m_stBaseGradeLevel.visible = this.visible;
         }
         if(this.m_stNewStarLevel)
         {
            this.m_stNewStarLevel.visible = this.visible;
         }
      }
      
      private function checkHasProtector() : Boolean
      {
         if(this.stFieldGrid != null && this.stFieldGrid.m_stProtector != null && this.stFieldGrid.m_stProtector.a_3512() == this.a_3512())
         {
            return this.stFieldGrid.m_stAttackFighter != null || this.stFieldGrid.m_stTrayDefense != null || this.stFieldGrid.m_stBoomDefense != null || this.stFieldGrid.m_stFlowerDefense != null || this.stFieldGrid.m_stBaseAuxiliaryFighter != null;
         }
         return false;
      }
      
      private function checkHasTrayDefense() : Boolean
      {
         if(this.stFieldGrid != null && this.stFieldGrid.m_stTrayDefense != null && this.stFieldGrid.m_stTrayDefense.a_3512() == this.a_3512())
         {
            return this.stFieldGrid.m_stAttackFighter != null || this.stFieldGrid.m_stProtector != null || this.stFieldGrid.m_stBoomDefense != null || this.stFieldGrid.m_stFlowerDefense != null || this.stFieldGrid.m_stBaseAuxiliaryFighter != null;
         }
         return false;
      }
      
      private function checkFieldisShowFrozen() : Boolean
      {
         if(this.stFieldGrid.m_stAttackFighter != null && this.stFieldGrid.m_stAttackFighter.m_isShowFrozen)
         {
            return true;
         }
         if(this.stFieldGrid.m_stTrayDefense != null && this.stFieldGrid.m_stTrayDefense.m_isShowFrozen)
         {
            return true;
         }
         if(this.stFieldGrid.m_stBoomDefense != null && this.stFieldGrid.m_stBoomDefense.m_isShowFrozen)
         {
            return true;
         }
         if(this.stFieldGrid.m_stFlowerDefense != null && this.stFieldGrid.m_stFlowerDefense.m_isShowFrozen)
         {
            return true;
         }
         if(this.stFieldGrid.m_stBaseAuxiliaryFighter != null && this.stFieldGrid.m_stBaseAuxiliaryFighter.m_isShowFrozen)
         {
            return true;
         }
         if(this.stFieldGrid.m_stProtector != null && this.stFieldGrid.m_stProtector.m_isShowFrozen)
         {
            return true;
         }
         return false;
      }
      
      public function a_2217() : void
      {
         if(this.m_stTimer == null)
         {
            this.m_stTimer = new Timer(1000);
            this.m_stTimer.addEventListener(TimerEvent.TIMER,this.OnTickHandler);
         }
         if(this.m_stTimer.running)
         {
            this.m_stTimer.stop();
         }
         this.ticks = 0;
         this.m_stTimer.start();
      }
      
      public function a_2218() : void
      {
         if(Boolean(this.m_stTimer) && this.m_stTimer.hasEventListener(TimerEvent.TIMER))
         {
            this.m_stTimer.removeEventListener(TimerEvent.TIMER,this.OnTickHandler);
         }
         if(this.m_stTimer)
         {
            this.m_stTimer.stop();
            this.m_stTimer = null;
         }
      }
      
      private function OnTickHandler(e:TimerEvent) : void
      {
         ++this.ticks;
         if(this.m_isShihua && this.ticks == this.stFieldGrid.m_stCurrentBattbleFieldView.ms_iShihuaTime)
         {
            this.m_iDieType = 1;
            this.a_3969(this.iLifeValue);
         }
         else if(this.ticks == this.stFieldGrid.m_stCurrentBattbleFieldView.ms_iFrozenBrokeTime)
         {
            this.m_iDieType = 1;
            this.a_3969(this.iLifeValue);
         }
      }
      
      protected function get a_1340() : Boolean
      {
         return this.m_bIsSleepingEx;
      }
      
      protected function set a_1340(bValue:Boolean) : void
      {
         this.m_bIsSleepingEx = bValue;
      }
      
      public function get IsNotEaten() : Boolean
      {
         return this.m_bIsNotEaten;
      }
      
      public function set IsNotEaten(bValue:Boolean) : void
      {
         this.m_bIsNotEaten = bValue;
      }
      
      public function get isSleeping() : Boolean
      {
         return this.a_1340;
      }
      
      public function get isNeedAdditionPrice() : Boolean
      {
         return this.a_1096;
      }
      
      public function get iUpgradeID() : int
      {
         return this.a_1335;
      }
      
      public function get iXPosSheft() : int
      {
         return this.a_1337;
      }
      
      public function get iYPosSheft() : int
      {
         return this.a_1338;
      }
      
      public function get isNeedAddShawdow() : Boolean
      {
         return this.a_1333;
      }
      
      public function set a_1339(iValue:int) : void
      {
         this.m_iHiddenLifeValue = iValue;
      }
      
      public function set iDefenseTypeID(value:uint) : void
      {
         this.a_1098 = value;
      }
      
      public function get iDefensePrice() : uint
      {
         return this.a_1095;
      }
      
      public function set iDefensePrice(value:uint) : void
      {
         this.a_1095 = value;
      }
      
      public function get iLifeValue() : int
      {
         return this.a_1339;
      }
      
      public function get iInitialLifeValue() : int
      {
         return this.m_InitialLifeValue;
      }
      
      public function set stFieldGrid(value:a_3491) : void
      {
         this.a_1334 = value;
      }
      
      public function get stFieldGrid() : a_3491
      {
         return this.a_1334;
      }
      
      public function a_3512() : int
      {
         return this.a_1098;
      }
      
      public function a_3963() : int
      {
         return this.a_3964();
      }
      
      public function a_1797(mstFieldGrid:a_3491) : Boolean
      {
         this.m_stShadowRefence = null;
         this.stFieldGrid = mstFieldGrid;
         if(this.stFieldGrid.m_stCurrentBattbleFieldView.iIntruderMoveDirection > 0)
         {
            a_1283 = true;
         }
         else
         {
            a_1283 = false;
         }
         this.IsNotEaten = false;
         gotoAndStop(1);
         a_1275 = 0;
         this.a_1339 = 50;
         a_1282 = true;
         this.m_iDieType = 0;
         this.m_isHurtByOpponent = false;
         if(this.m_bServerIssued)
         {
            ++s_GlobalInitCount;
         }
         if(this.m_iTickTime > 0)
         {
            if(this.ResetStarTimeout > 0)
            {
               clearInterval(this.ResetStarTimeout);
            }
            this.ResetStarTimeout = setTimeout(this.onResetCardGradeTimerComplete,this.m_iTickTime);
         }
         this.addStarDegreeMovie();
         this.m_isShowFrozen = false;
         this.m_isShihua = false;
         return true;
      }
      
      public function finalizeInitialization() : void
      {
         this.m_InitialLifeValue = this.a_1339;
         this.addGradeLevelMovie();
      }
      
      private function addStarDegreeMovie() : void
      {
         if(this.a_1336)
         {
            this.a_1336.a_3940();
            this.a_1336 = null;
         }
         this.a_1336 = BattleDecorationEffectUtil.GetStarDegreDecoration(this.a_1094);
         if(this.a_1336)
         {
            this.a_1336.a_1797(false);
            if(a_1283)
            {
               this.a_1336.x = stDisplayBitmap.x - this.a_1336.width - (width - this.a_1336.width) * 0.5;
            }
            else
            {
               this.a_1336.x = (width - this.a_1336.width) * 0.5;
            }
            this.a_1336.y = height - this.a_1336.height;
            if(this.a_1094 >= 14)
            {
               this.a_1336.SetAnimationOnce2Loop(1,1);
            }
            addChild(this.a_1336);
            if(this.m_iGradeDegree > 0)
            {
               this.a_1336.visible = false;
            }
         }
      }
      
      private function addGradeLevelMovie() : void
      {
         if(this.m_stBaseGradeLevel)
         {
            this.m_stBaseGradeLevel.a_3940();
            this.m_stBaseGradeLevel = null;
         }
         if(this.m_stNewStarLevel)
         {
            this.m_stNewStarLevel.a_3940();
            this.m_stNewStarLevel = null;
         }
         if(!this.m_bServerIssued || !this.a_1334 || this.m_iGradeDegree <= 0 || this.a_1336 == null)
         {
            return;
         }
         var tempX:Number = 0;
         var tempY:Number = 0;
         this.m_stBaseGradeLevel = BattleDecorationEffectUtil.GetGradeLevelDecoration(this.m_iGradeDegree);
         if(this.m_stBaseGradeLevel)
         {
            this.m_stBaseGradeLevel.a_1797(false);
            tempX = this.m_stBaseGradeLevel.x = this.x + this.a_1336.x + this.a_1336.m_InitializeWidth * 0.5 - 3;
            tempY = this.m_stBaseGradeLevel.y = this.y + (height - this.m_stBaseGradeLevel.height / 2) - 4;
            this.a_1334.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stBaseGradeLevel,this.m_iBattleLayerType,this.a_1334);
            if(this.a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
            {
               this.a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.m_stBaseGradeLevel,this.a_1334.m_iXGridNo,this.a_1334.m_iYGridNo);
            }
            this.m_stBaseGradeLevel.ShowPlayAnimation(1,1);
            this.m_stBaseGradeLevel.play();
            this.m_stNewStarLevel = PoolManager.getInstance().CheckOutOne(NewStarLevelAnimation,NewStarLevelAnimationMovie) as NewStarLevelAnimation;
            if(this.m_stNewStarLevel)
            {
               this.m_stNewStarLevel.a_1797(false);
               this.m_stNewStarLevel.PlayAnimation(this.a_1094);
               if(a_1283)
               {
                  this.m_stNewStarLevel.x = tempX - 3.65;
               }
               else
               {
                  this.m_stNewStarLevel.x = tempX + 3.65;
               }
               this.m_stNewStarLevel.y = tempY + this.m_stBaseGradeLevel.height / 2 - this.m_stNewStarLevel.height / 2 + BattleFieldView.yGradeOffsetList[this.m_iGradeDegree];
               if(this.a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap())
               {
                  this.a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(this.m_stNewStarLevel,this.a_1334.m_iXGridNo,this.a_1334.m_iYGridNo);
               }
               this.a_1334.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stNewStarLevel,this.m_iBattleLayerType,this.a_1334);
               this.m_stNewStarLevel.play();
            }
         }
      }
      
      protected function a_3964() : int
      {
         return 70;
      }
      
      public function CanBeEat() : Boolean
      {
         return true;
      }
      
      protected function a_3965() : int
      {
         return 0;
      }
      
      public function get a_1339() : int
      {
         return this.m_iHiddenLifeValue;
      }
      
      protected function a_3966() : int
      {
         return 0;
      }
      
      public function a_3967() : Boolean
      {
         if(this.a_1336)
         {
            this.a_1336.visible = false;
         }
         return true;
      }
      
      public function a_3968() : Boolean
      {
         if(this.a_1336)
         {
            this.a_1336.visible = true;
         }
         return true;
      }
      
      public function a_3969(iRduceLifeValue:int) : Boolean
      {
         var stDefenderInfo:CVanishDefender = null;
         var iVanishTimeNum:int = 0;
         if(Boolean(this.m_InvincibleBuff) && iRduceLifeValue > 0)
         {
            return false;
         }
         if(Boolean(this.m_iDieType == 1 && this.m_FangyuBuff) && Boolean(iRduceLifeValue > 0) && this.m_iFangyuTime > 0)
         {
            this.m_FangyuBuff.SpecialSkillCallBack();
            if(--this.m_iFangyuTime == 0)
            {
               this.m_FangyuBuff.a_3940();
               this.m_FangyuBuff = null;
            }
            return false;
         }
         this.a_1339 -= iRduceLifeValue;
         if(Boolean(this.a_1334) && this.a_1339 <= 0)
         {
            stDefenderInfo = new CVanishDefender();
            stDefenderInfo.m_iDefenderID = this.m_iDefenseGlobalID;
            stDefenderInfo.m_iDefenderTypeID = this.a_1098;
            stDefenderInfo.m_byXGridNo = this.a_1334.m_iInitialXGridNo;
            stDefenderInfo.m_byYGridNo = this.a_1334.m_iInitialYGridNo;
            stDefenderInfo.m_iOrigSeatID = this.m_iOrigSeatID;
            stDefenderInfo.m_byIsTool = this.m_iDieType;
            iVanishTimeNum = this.a_1334.m_stCurrentBattbleFieldView.iTimeIntervalNum;
            a_1088.a_2060(iVanishTimeNum,this.a_1334.m_stCurrentBattbleFieldView.m_byTeamNo,new Array(stDefenderInfo));
            if(this.a_1334.m_stCurrentBattbleFieldView.isOwnBattleField)
            {
               RecordEatDieDeath(stDefenderInfo,iVanishTimeNum);
            }
         }
         return true;
      }
      
      private function onResetCardGradeTimerComplete() : void
      {
         var stInitialFieldGrid:a_3491 = null;
         if(this.stFieldGrid != null)
         {
            stInitialFieldGrid = this.a_1334.m_stCurrentBattbleFieldView.a_3438(this.stFieldGrid.m_iXGridNo,this.stFieldGrid.m_iYGridNo);
            if(!BattleVOUtil.IsLavaPreferBurnToolCard(this.a_3512()) || !(this is a_3976))
            {
               this.a_3940();
            }
            a_1088.a_2059(this.m_iDefenseGlobalID,this.a_3512(),stInitialFieldGrid.m_iInitialXGridNo,stInitialFieldGrid.m_iInitialYGridNo,0,1,this.m_iRealStarDegree,0,0,this.m_iOrigSeatID);
         }
      }
      
      public function a_3940() : Boolean
      {
         var stBattleFieldView:BattleFieldView = null;
         PoolManager.getInstance().CheckInOne(this);
         this.tagCom.ClearAll();
         this.buffCom.ClearAll();
         this.m_iMoveState = 0;
         this.m_iBattleLayerType = 0;
         this.m_iDefenseStateType = 0;
         this.m_IsCaclueCoolDown = 0;
         this.m_iTickTime = this.m_iFangyuTime = 0;
         if(this.ResetStarTimeout > 0)
         {
            clearInterval(this.ResetStarTimeout);
         }
         this.m_isShowFrozen = false;
         this.m_bServerIssued = false;
         this.m_bPlaceByUpGradeCard = false;
         if(this.m_stFrozenCardEffect)
         {
            this.m_stFrozenCardEffect.a_3940();
            this.m_stFrozenCardEffect = null;
         }
         this.m_isShihua = false;
         if(this.m_stShiHuaEffect)
         {
            this.m_stShiHuaEffect.a_3940();
            this.m_stShiHuaEffect = null;
         }
         if(this.m_AddFireBuff)
         {
            this.m_AddFireBuff.a_3940();
            this.m_AddFireBuff = null;
         }
         if(this.m_FangyuBuff)
         {
            this.m_FangyuBuff.a_3940();
            this.m_FangyuBuff = null;
         }
         if(this.m_InvincibleBuff)
         {
            this.m_InvincibleBuff.a_3940();
            this.m_InvincibleBuff = null;
         }
         if(this.m_BaseEffect)
         {
            this.m_BaseEffect.a_3940();
            this.m_BaseEffect = null;
         }
         if(this.m_stBaseGradeLevel)
         {
            if(Boolean(this.a_1334) && Boolean(this.a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap()))
            {
               this.a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this.m_stBaseGradeLevel);
            }
            this.m_stBaseGradeLevel.a_3940();
            this.m_stBaseGradeLevel = null;
         }
         if(this.m_stNewStarLevel)
         {
            if(Boolean(this.a_1334) && Boolean(this.a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap()))
            {
               this.a_1334.m_stCurrentBattbleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this.m_stNewStarLevel);
            }
            this.m_stNewStarLevel.a_3940();
            this.m_stNewStarLevel = null;
         }
         if(Boolean(this.a_1334) && null != this.m_stShadowRefence)
         {
            stBattleFieldView = this.a_1334.m_stCurrentBattbleFieldView;
            if(this.m_stShadowRefence.parent)
            {
               this.m_stShadowRefence.parent.removeChild(this.m_stShadowRefence);
            }
            this.m_stShadowRefence = null;
         }
         if(this.stFieldGrid != null && this.stFieldGrid.m_stCurrentBattbleFieldView.m_MoveDefense == this)
         {
            this.stFieldGrid.m_stCurrentBattbleFieldView.m_MoveDefense = null;
         }
         if(this.stFieldGrid != null && this.stFieldGrid.m_stCurrentBattbleFieldView.m_OtherMoveDefense == this)
         {
            this.stFieldGrid.m_stCurrentBattbleFieldView.m_OtherMoveDefense = null;
         }
         if(parent)
         {
            parent.removeChild(this);
         }
         if(Boolean(this.a_1334 && this.a_1334.m_stSpaceMarkEffect && this.a_1334.m_stBaseToolDefense == null && this.a_1334.m_stBaseAuxiliaryFighter == null && this.a_1334.m_stFlowerDefense == null && this.a_1334.m_stBoomDefense == null && this.a_1334.m_stTrayDefense == null) && Boolean(this.a_1334.m_stAttackFighter == null) && this.a_1334.m_stProtector == null)
         {
            this.a_1334.m_stSpaceMarkEffect.a_3940();
            this.a_1334.m_stSpaceMarkEffect = null;
         }
         this.stFieldGrid = null;
         visible = false;
         a_1283 = false;
         gotoAndStop(1);
         this.a_1094 = 0;
         if(this.a_1336)
         {
            if(contains(this.a_1336))
            {
               removeChild(this.a_1336);
            }
            this.a_1336.a_3940();
            this.a_1336 = null;
         }
         if(stBattleFieldView)
         {
            stBattleFieldView.SortDisplayObject();
            if(stBattleFieldView.GetGameMoveMap())
            {
               stBattleFieldView.GetGameMoveMap().RemoveMoveDisplayObject(this);
            }
         }
         return true;
      }
      
      public function ReduceDefensePrice(iValue:int) : void
      {
         this.a_1095 += iValue;
      }
      
      public function a_3970() : Boolean
      {
         return false;
      }
      
      public function SpecialSkillCallBack(... args) : void
      {
      }
      
      public function get m_bServerIssued() : Boolean
      {
         return this.m_bServerIssuedEx;
      }
      
      public function set m_bServerIssued(value:Boolean) : void
      {
         this.m_bServerIssuedEx = value;
      }
      
      public function get m_bPlaceByUpGradeCard() : Boolean
      {
         return this.m_bPlaceByUpGradeCardEx;
      }
      
      public function set m_bPlaceByUpGradeCard(value:Boolean) : void
      {
         this.m_bPlaceByUpGradeCardEx = value;
      }
      
      private function addFrozenEffect() : void
      {
         if(this.m_stFrozenCardEffect == null)
         {
            this.m_stFrozenCardEffect = FrozenCardEffect.a_3926();
         }
         if(this.m_stFrozenCardEffect)
         {
            this.m_stFrozenCardEffect.a_1797(false);
            this.m_stFrozenCardEffect.x = a_3491.a_1080 * this.a_1334.m_iXGridNo;
            this.m_stFrozenCardEffect.y = a_3491.a_1081 * this.a_1334.m_iYGridNo;
            this.a_1334.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stFrozenCardEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,this.a_1334);
         }
      }
      
      public function AddInvincibleBuffTime(durationTick:int, invincibleType:int, fangYuTick:int, hitCount:int) : void
      {
         if(!this.a_1334 || durationTick <= 0 || !this.m_bServerIssued)
         {
            return;
         }
         if(this.m_InvincibleBuff)
         {
            GoldOsirisInvincibleBuff(this.m_InvincibleBuff).AddDuration(durationTick,true,fangYuTick,hitCount);
            return;
         }
         var invincibleBuff:GoldOsirisInvincibleBuff = GoldOsirisInvincibleBuff.a_3926(invincibleType);
         invincibleBuff.m_BaseDefense = this;
         invincibleBuff.AddDuration(durationTick,true,fangYuTick,hitCount);
         invincibleBuff.a_1797(invincibleBuff.IsReversed());
         var offsetX:Number = this.width / 2;
         invincibleBuff.x = this.x + this.iXPosSheft + (this.IsReversed() ? -offsetX : offsetX);
         invincibleBuff.y = this.y + this.iYPosSheft + this.height - 77;
         this.stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(invincibleBuff,BattleLayerDefine.OBSTACL_TYPE,this.stFieldGrid);
         this.m_InvincibleBuff = invincibleBuff;
      }
      
      public function AddFangyuBuff(hitTime:int, continueTick:int) : void
      {
         var buff:ImperialStrikeHurtBuff = null;
         var offsetX:Number = NaN;
         if(!this.a_1334 || hitTime <= 0 || continueTick <= 0 || !this.m_bServerIssued)
         {
            return;
         }
         this.m_iFangyuTime += hitTime;
         if(!this.m_FangyuBuff)
         {
            buff = ImperialStrikeHurtBuff.a_3926();
            buff.m_BaseDefense = this;
            buff.a_1797(buff.IsReversed());
            buff.AddBuff(continueTick,hitTime);
            offsetX = this.width - 34.25;
            buff.x = this.x + this.iXPosSheft + (this.IsReversed() ? -offsetX : offsetX);
            buff.y = this.y + this.iYPosSheft;
            this.stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(buff,BattleLayerDefine.OBSTACL_TYPE,this.stFieldGrid);
            this.m_FangyuBuff = buff;
         }
         else
         {
            ImperialStrikeHurtBuff(this.m_FangyuBuff).AddBuff(continueTick,hitTime);
         }
      }
      
      private function CreateShiHuaEffect() : void
      {
         if(this.m_stShiHuaEffect == null)
         {
            this.m_stShiHuaEffect = ShiHuaEffect.a_3926();
         }
         if(this.m_stShiHuaEffect)
         {
            this.m_stShiHuaEffect.a_1797(false);
            this.m_stShiHuaEffect.x = a_3491.a_1080 * this.a_1334.m_iXGridNo;
            this.m_stShiHuaEffect.y = a_3491.a_1081 * this.a_1334.m_iYGridNo - 20;
            this.a_1334.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stShiHuaEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,this.a_1334);
         }
      }
      
      public function get tagCom() : TagComponent
      {
         return this._tagCom;
      }
      
      public function get buffCom() : BuffComponent
      {
         if(this._buffCom == null)
         {
            this._buffCom = new BuffComponent();
            this._buffCom.a_3014(this._tagCom,this);
         }
         return this._buffCom;
      }
      
      public function SetAnimationOnce2Loop(onceIdx:int, loopIdx:int) : void
      {
         a_1275 = loopIdx;
         gotoAndStop((a_1276[onceIdx] as FrameLabel).frame);
      }
   }
}

