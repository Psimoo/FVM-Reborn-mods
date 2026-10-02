package com.aurora.ui.maogoutd.game
{
   import a_4715.EncrypBooleanEx;
   import a_4715.EncrypIntEx;
   import a_4728.a_1778;
   import a_4752.TagComponent;
   import com.aurora.ui.maogoutd.game.Buff.BuffComponent;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.OceanGoddess.OceanGoddessFinalEffectManager;
   import com.aurora.ui.maogoutd.resource.defender.SnakeYear.mageSnake.MageSnakePoisonBuff;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.defender.a_3959;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.defender.a_3971;
   import com.aurora.ui.maogoutd.resource.defender.a_3972;
   import com.aurora.ui.maogoutd.resource.defender.a_3975;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import com.aurora.ui.maogoutd.resource.defender.a_3977;
   import com.aurora.ui.maogoutd.resource.effect.BaseAccelerationEffect;
   import com.aurora.ui.maogoutd.resource.effect.BaseDesertFogEffect;
   import com.aurora.ui.maogoutd.resource.effect.IPickFireObject;
   import com.aurora.ui.maogoutd.resource.effect.SleepingEffect;
   import com.aurora.ui.maogoutd.resource.effect.SpaceMarkEffect;
   import com.aurora.ui.maogoutd.resource.effect.WindbreakEffect;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.effect.a_4135;
   import com.aurora.ui.maogoutd.resource.effect.baseClimb.BaseClimbEffect;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.CattleYear.ThundCity.Effect.BurnEffect;
   import com.aurora.ui.maogoutd.resource.tools.a_4408;
   import flash.display.Bitmap;
   import flash.events.TimerEvent;
   import flash.text.TextField;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class a_3491
   {
      
      private static var ms_iGridWidthEx:EncrypIntEx;
      
      private static var ms_iGridHeigthEx:EncrypIntEx;
      
      public var m_stCurrentBattbleFieldView:BattleFieldView;
      
      private var m_iInitialXGridNoEx:EncrypIntEx;
      
      private var m_iInitialYGridNoEx:EncrypIntEx;
      
      private var m_iXGridNoEx:int = 0;
      
      private var m_iYGridNoEx:int = 0;
      
      private var m_isNeedTrayEx:EncrypBooleanEx;
      
      private var m_isExistMouseHoleEx:EncrypBooleanEx;
      
      private var m_iFieldGridTypeEx:int = 0;
      
      private var m_iSpecialTypeEx:EncrypIntEx;
      
      private var m_isCanBrokeByLightEx:EncrypBooleanEx;
      
      private var m_isCanBrokeByWindEx:EncrypBooleanEx;
      
      public var m_stWindbreakEffect:WindbreakEffect;
      
      public var m_stAccelerationEffect:BaseAccelerationEffect;
      
      public var m_stSleepingEffect:SleepingEffect;
      
      public var m_stSpaceMarkEffect:SpaceMarkEffect;
      
      public var m_stProtector:a_3975;
      
      public var m_stAttackFighter:a_3953;
      
      public var m_stTrayDefense:a_3977;
      
      public var m_stBoomDefense:a_3960;
      
      public var m_stFlowerDefense:a_3971;
      
      public var m_stBaseAuxiliaryFighter:a_3959;
      
      public var m_stBaseToolDefense:a_3976;
      
      public var m_stVersatileDefense:a_3976;
      
      public var m_stBattleFlagHorseDefense:a_3976;
      
      public var m_SoulPuppetIntruder:a_4206;
      
      public var m_stBattleBarrierHorseDefense:a_3976;
      
      public var m_stOceanGoddessToolDefense:a_3976;
      
      public var m_stHoneyTrapBaseDefense:a_3953;
      
      public var m_stFinalBrahmaDefense:a_3976;
      
      public var m_stBaseLander:BaseClimbEffect;
      
      public var m_stDesertFogEffect:BaseDesertFogEffect;
      
      public var m_stBaseFieldAlarm:a_4408;
      
      public var m_stMouseEarthHole:a_4135;
      
      public var m_stMouseObstacle:a_4206;
      
      public var m_stPickFireObject:IPickFireObject;
      
      public var m_stTentMouse:a_4206;
      
      public var m_stBurnEffect:BurnEffect;
      
      public var m_SpeedBool:Boolean = false;
      
      public var m_stObstacleEffect:a_4108;
      
      public var m_stPlotEffect:a_4108;
      
      public var m_stMageSnakePoisonBuff:MageSnakePoisonBuff;
      
      public var m_stCrispyKiteMouse:a_4206;
      
      public var m_stCrispyKiteEffect:a_4108;
      
      public var a_1511:Array = new Array();
      
      private var m_isOccupyEx:Boolean = false;
      
      public var m_iHurtRate:Number = 1;
      
      public var m_dicCannotAddCard:Dictionary = new Dictionary();
      
      private var m_hasFireEffectEx:EncrypBooleanEx;
      
      private var m_isClawMarkEx:EncrypBooleanEx;
      
      private var m_isSilentEx:EncrypBooleanEx;
      
      private var m_isLockBuildMouseEx:EncrypBooleanEx;
      
      private var m_isLockVersatileDefenseEx:EncrypBooleanEx;
      
      private var m_isShowFrozenEx:Boolean = false;
      
      public var m_bShowFrozenEffect:Boolean = true;
      
      private var m_stShowThis:Bitmap;
      
      private var m_stTimer:Timer = new Timer(1000);
      
      private var ticks:int;
      
      private var m_stShowText:TextField;
      
      private var _tagCom:TagComponent;
      
      private var _buffCom:BuffComponent;
      
      private var m_arrTempIntruderArray:Array = [];
      
      public function a_3491(stBattleFieldView:BattleFieldView, iXGridNo:int, iYGridNo:int)
      {
         super();
         this.m_stCurrentBattbleFieldView = stBattleFieldView;
         this.m_iXGridNo = iXGridNo;
         this.m_iYGridNo = iYGridNo;
         this.m_iInitialXGridNo = iXGridNo;
         this.m_iInitialYGridNo = iYGridNo;
      }
      
      public static function get a_1080() : int
      {
         if(!ms_iGridWidthEx)
         {
            ms_iGridWidthEx = new EncrypIntEx();
         }
         return ms_iGridWidthEx.Value;
      }
      
      public static function set a_1080(value:int) : void
      {
         if(!ms_iGridWidthEx)
         {
            ms_iGridWidthEx = new EncrypIntEx();
         }
         ms_iGridWidthEx.Value = value;
      }
      
      public static function get a_1081() : int
      {
         if(!ms_iGridHeigthEx)
         {
            ms_iGridHeigthEx = new EncrypIntEx();
         }
         return ms_iGridHeigthEx.Value;
      }
      
      public static function set a_1081(value:int) : void
      {
         if(!ms_iGridHeigthEx)
         {
            ms_iGridHeigthEx = new EncrypIntEx();
         }
         ms_iGridHeigthEx.Value = value;
      }
      
      public function get m_iInitialXGridNo() : int
      {
         if(!this.m_iInitialXGridNoEx)
         {
            this.m_iInitialXGridNoEx = new EncrypIntEx();
         }
         return this.m_iInitialXGridNoEx.Value;
      }
      
      public function set m_iInitialXGridNo(value:int) : void
      {
         if(!this.m_iInitialXGridNoEx)
         {
            this.m_iInitialXGridNoEx = new EncrypIntEx();
         }
         this.m_iInitialXGridNoEx.Value = value;
      }
      
      public function get m_iInitialYGridNo() : int
      {
         if(!this.m_iInitialYGridNoEx)
         {
            this.m_iInitialYGridNoEx = new EncrypIntEx();
         }
         return this.m_iInitialYGridNoEx.Value;
      }
      
      public function set m_iInitialYGridNo(value:int) : void
      {
         if(!this.m_iInitialYGridNoEx)
         {
            this.m_iInitialYGridNoEx = new EncrypIntEx();
         }
         this.m_iInitialYGridNoEx.Value = value;
      }
      
      public function get m_iXGridNo() : int
      {
         return this.m_iXGridNoEx;
      }
      
      public function set m_iXGridNo(value:int) : void
      {
         this.m_iXGridNoEx = value;
      }
      
      public function get m_iYGridNo() : int
      {
         return this.m_iYGridNoEx;
      }
      
      public function set m_iYGridNo(value:int) : void
      {
         this.m_iYGridNoEx = value;
      }
      
      public function get m_isNeedTray() : Boolean
      {
         if(!this.m_isNeedTrayEx)
         {
            this.m_isNeedTrayEx = new EncrypBooleanEx(false);
         }
         return this.m_isNeedTrayEx.Value;
      }
      
      public function set m_isNeedTray(value:Boolean) : void
      {
         if(!this.m_isNeedTrayEx)
         {
            this.m_isNeedTrayEx = new EncrypBooleanEx(false);
         }
         this.m_isNeedTrayEx.Value = value;
      }
      
      public function get m_isExistMouseHole() : Boolean
      {
         if(!this.m_isExistMouseHoleEx)
         {
            this.m_isExistMouseHoleEx = new EncrypBooleanEx(false);
         }
         return this.m_isExistMouseHoleEx.Value;
      }
      
      public function set m_isExistMouseHole(value:Boolean) : void
      {
         if(!this.m_isExistMouseHoleEx)
         {
            this.m_isExistMouseHoleEx = new EncrypBooleanEx(false);
         }
         this.m_isExistMouseHoleEx.Value = value;
      }
      
      public function get m_iFieldGridType() : int
      {
         return this.m_iFieldGridTypeEx;
      }
      
      public function set m_iFieldGridType(value:int) : void
      {
         this.m_iFieldGridTypeEx = value;
      }
      
      public function get m_iSpecialType() : int
      {
         if(!this.m_iSpecialTypeEx)
         {
            this.m_iSpecialTypeEx = new EncrypIntEx(0);
         }
         return this.m_iSpecialTypeEx.Value;
      }
      
      public function set m_iSpecialType(value:int) : void
      {
         if(!this.m_iSpecialTypeEx)
         {
            this.m_iSpecialTypeEx = new EncrypIntEx(0);
         }
         this.m_iSpecialTypeEx.Value = value;
      }
      
      public function get m_isCanBrokeByLight() : Boolean
      {
         if(!this.m_isCanBrokeByLightEx)
         {
            this.m_isCanBrokeByLightEx = new EncrypBooleanEx(true);
         }
         return this.m_isCanBrokeByLightEx.Value;
      }
      
      public function set m_isCanBrokeByLight(value:Boolean) : void
      {
         if(!this.m_isCanBrokeByLightEx)
         {
            this.m_isCanBrokeByLightEx = new EncrypBooleanEx(true);
         }
         this.m_isCanBrokeByLightEx.Value = value;
      }
      
      public function get m_isCanBrokeByWind() : Boolean
      {
         if(!this.m_isCanBrokeByWindEx)
         {
            this.m_isCanBrokeByWindEx = new EncrypBooleanEx(true);
         }
         return this.m_isCanBrokeByWindEx.Value;
      }
      
      public function set m_isCanBrokeByWind(value:Boolean) : void
      {
         var base:a_3962 = null;
         if(!this.m_isCanBrokeByWindEx)
         {
            this.m_isCanBrokeByWindEx = new EncrypBooleanEx(true);
         }
         this.m_isCanBrokeByWindEx.Value = value;
         if(!this.m_isCanBrokeByWindEx.Value)
         {
            this.a_2217();
            if(this.m_stWindbreakEffect == null && this.a_3492())
            {
               base = this.getPositionDefense();
               if(Boolean(base && !(base is a_3924)) && Boolean(base.a_3512() != 286396512) && base.a_3512() != 286396526)
               {
                  this.m_stWindbreakEffect = WindbreakEffect.a_3926();
                  this.m_stWindbreakEffect.a_1797(false);
                  this.m_stWindbreakEffect.play();
                  this.m_stWindbreakEffect.x = base.x + base.width * 0.4 - 20;
                  this.m_stWindbreakEffect.y = base.y - 10;
                  this.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stWindbreakEffect,BattleLayerDefine.EFFECTS_TOP_TYPE,this);
               }
            }
         }
         else
         {
            if(this.m_stWindbreakEffect)
            {
               this.m_stWindbreakEffect.stop();
               this.m_stWindbreakEffect.a_3940();
               this.m_stWindbreakEffect = null;
            }
            this.a_2218();
         }
      }
      
      public function get m_isCannotAddCard() : Boolean
      {
         var obj:* = undefined;
         for(obj in this.m_dicCannotAddCard)
         {
            if(this.m_dicCannotAddCard[obj])
            {
               return true;
            }
         }
         return false;
      }
      
      public function get m_isOccupy() : Boolean
      {
         return this.m_isOccupyEx;
      }
      
      public function set m_isOccupy(value:Boolean) : void
      {
         this.m_isOccupyEx = value;
      }
      
      public function get m_hasFireEffect() : Boolean
      {
         if(!this.m_hasFireEffectEx)
         {
            this.m_hasFireEffectEx = new EncrypBooleanEx(false);
         }
         return this.m_hasFireEffectEx.Value;
      }
      
      public function set m_hasFireEffect(value:Boolean) : void
      {
         if(!this.m_hasFireEffectEx)
         {
            this.m_hasFireEffectEx = new EncrypBooleanEx(false);
         }
         this.m_hasFireEffectEx.Value = value;
      }
      
      public function get m_isClawMark() : Boolean
      {
         if(!this.m_isClawMarkEx)
         {
            this.m_isClawMarkEx = new EncrypBooleanEx(false);
         }
         return this.m_isClawMarkEx.Value;
      }
      
      public function set m_isClawMark(value:Boolean) : void
      {
         if(!this.m_isClawMarkEx)
         {
            this.m_isClawMarkEx = new EncrypBooleanEx(false);
         }
         this.m_isClawMarkEx.Value = value;
      }
      
      public function get m_isSilent() : Boolean
      {
         if(!this.m_isSilentEx)
         {
            this.m_isSilentEx = new EncrypBooleanEx(false);
         }
         return this.m_isSilentEx.Value;
      }
      
      public function set m_isSilent(value:Boolean) : void
      {
         if(!this.m_isSilentEx)
         {
            this.m_isSilentEx = new EncrypBooleanEx(false);
         }
         this.m_isSilentEx.Value = value;
      }
      
      public function get m_isLockBuildMouse() : Boolean
      {
         if(!this.m_isLockBuildMouseEx)
         {
            this.m_isLockBuildMouseEx = new EncrypBooleanEx(false);
         }
         return this.m_isLockBuildMouseEx.Value;
      }
      
      public function set m_isLockBuildMouse(value:Boolean) : void
      {
         if(!this.m_isLockBuildMouseEx)
         {
            this.m_isLockBuildMouseEx = new EncrypBooleanEx(false);
         }
         this.m_isLockBuildMouseEx.Value = value;
      }
      
      public function get m_isLockVersatileDefense() : Boolean
      {
         if(!this.m_isLockVersatileDefenseEx)
         {
            this.m_isLockVersatileDefenseEx = new EncrypBooleanEx(false);
         }
         return this.m_isLockVersatileDefenseEx.Value;
      }
      
      public function set m_isLockVersatileDefense(value:Boolean) : void
      {
         if(!this.m_isLockVersatileDefenseEx)
         {
            this.m_isLockVersatileDefenseEx = new EncrypBooleanEx(false);
         }
         this.m_isLockVersatileDefenseEx.Value = value;
      }
      
      public function get m_isShowFrozen() : Boolean
      {
         return this.m_isShowFrozenEx;
      }
      
      public function set m_isShowFrozen(value:Boolean) : void
      {
         this.m_isShowFrozenEx = value;
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
         if(!this.m_stTimer.hasEventListener(TimerEvent.TIMER))
         {
            this.m_stTimer.addEventListener(TimerEvent.TIMER,this.OnTickHandler);
         }
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
         if(this.ticks == 4)
         {
            this.m_isCanBrokeByWind = true;
         }
      }
      
      protected function OnTimerHandler(a_4730:TimerEvent) : void
      {
         this.ShowThis(this.m_iXGridNo,this.m_iYGridNo);
      }
      
      public function a_3492() : Boolean
      {
         if(this.m_isShowFrozen == true)
         {
            return false;
         }
         return !(null == this.m_stProtector && null == this.m_stAttackFighter && null == this.m_stHoneyTrapBaseDefense && null == this.m_stOceanGoddessToolDefense && null == this.m_stTrayDefense && null == this.m_stBoomDefense && null == this.m_stFlowerDefense && null == this.m_stBaseAuxiliaryFighter);
      }
      
      public function CanAddDefenseInWater() : Boolean
      {
         if(this.m_isShowFrozen == true || null == this.m_stTrayDefense)
         {
            return false;
         }
         return null == this.m_stProtector && null == this.m_stAttackFighter && null == this.m_stBoomDefense && null == this.m_stFlowerDefense && null == this.m_stBaseAuxiliaryFighter;
      }
      
      public function getPositionDefense() : a_3962
      {
         if(this.m_stProtector != null)
         {
            return this.m_stProtector;
         }
         if(this.m_stAttackFighter != null)
         {
            return this.m_stAttackFighter;
         }
         if(this.m_stTrayDefense != null)
         {
            return this.m_stTrayDefense;
         }
         if(this.m_stBoomDefense != null)
         {
            return this.m_stBoomDefense;
         }
         if(this.m_stFlowerDefense != null)
         {
            return this.m_stFlowerDefense;
         }
         if(this.m_stBaseAuxiliaryFighter != null)
         {
            return this.m_stBaseAuxiliaryFighter;
         }
         return null;
      }
      
      public function getIUpgradeDefense() : a_3962
      {
         if(this.m_stAttackFighter != null)
         {
            return this.m_stAttackFighter;
         }
         if(this.m_stBoomDefense != null)
         {
            return this.m_stBoomDefense;
         }
         if(this.m_stFlowerDefense != null)
         {
            return this.m_stFlowerDefense;
         }
         if(this.m_stBaseAuxiliaryFighter != null)
         {
            return this.m_stBaseAuxiliaryFighter;
         }
         if(this.m_stProtector != null)
         {
            return this.m_stProtector;
         }
         if(this.m_stOceanGoddessToolDefense != null)
         {
            return this.m_stOceanGoddessToolDefense;
         }
         if(this.m_stHoneyTrapBaseDefense != null)
         {
            return this.m_stHoneyTrapBaseDefense;
         }
         if(this.m_stBattleBarrierHorseDefense != null)
         {
            return this.m_stBattleBarrierHorseDefense;
         }
         if(this.m_stTrayDefense != null)
         {
            return this.m_stTrayDefense;
         }
         return null;
      }
      
      public function a_3493(iBaseTypeID:int) : a_3962
      {
         var stBaseDefense:a_3962 = null;
         if(Boolean(this.m_stAttackFighter) && iBaseTypeID == this.m_stAttackFighter.a_3512())
         {
            stBaseDefense = this.m_stAttackFighter;
         }
         else if(Boolean(this.m_stFlowerDefense) && iBaseTypeID == this.m_stFlowerDefense.a_3512())
         {
            stBaseDefense = this.m_stFlowerDefense;
         }
         else if(Boolean(this.m_stBaseAuxiliaryFighter) && iBaseTypeID == this.m_stBaseAuxiliaryFighter.a_3512())
         {
            stBaseDefense = this.m_stBaseAuxiliaryFighter;
         }
         else if(Boolean(this.m_stBoomDefense) && iBaseTypeID == this.m_stBoomDefense.a_3512())
         {
            stBaseDefense = this.m_stBoomDefense;
         }
         else if(Boolean(this.m_stProtector) && iBaseTypeID == this.m_stProtector.a_3512())
         {
            stBaseDefense = this.m_stProtector;
         }
         else if(Boolean(this.m_stOceanGoddessToolDefense) && iBaseTypeID == this.m_stOceanGoddessToolDefense.a_3512())
         {
            stBaseDefense = this.m_stOceanGoddessToolDefense;
         }
         else if(Boolean(this.m_stHoneyTrapBaseDefense) && iBaseTypeID == this.m_stHoneyTrapBaseDefense.a_3512())
         {
            stBaseDefense = this.m_stHoneyTrapBaseDefense;
         }
         else if(Boolean(this.m_stBattleBarrierHorseDefense) && iBaseTypeID == this.m_stBattleBarrierHorseDefense.a_3512())
         {
            stBaseDefense = this.m_stBattleBarrierHorseDefense;
         }
         else if(Boolean(this.m_stTrayDefense) && iBaseTypeID == this.m_stTrayDefense.a_3512())
         {
            stBaseDefense = this.m_stTrayDefense;
         }
         else if(Boolean(this.m_stBaseToolDefense) && iBaseTypeID == this.m_stBaseToolDefense.a_3512())
         {
            stBaseDefense = this.m_stBaseToolDefense;
         }
         return stBaseDefense;
      }
      
      public function a_3494() : a_3962
      {
         var stThiefDefense:a_3962 = null;
         if(this.m_stAttackFighter)
         {
            if(this.m_stAttackFighter.iBattleFighterType > 0)
            {
               stThiefDefense = this.m_stAttackFighter;
            }
            else if(this.m_stProtector)
            {
               stThiefDefense = this.m_stProtector;
            }
         }
         else if(this.m_stFlowerDefense)
         {
            stThiefDefense = this.m_stFlowerDefense;
         }
         else if(this.m_stBaseAuxiliaryFighter)
         {
            stThiefDefense = this.m_stBaseAuxiliaryFighter;
         }
         else if(this.m_stBoomDefense)
         {
            stThiefDefense = this.m_stBoomDefense;
         }
         else if(this.m_stProtector)
         {
            stThiefDefense = this.m_stProtector;
         }
         else
         {
            if(this.m_stOceanGoddessToolDefense != null)
            {
               return this.m_stOceanGoddessToolDefense;
            }
            if(this.m_stHoneyTrapBaseDefense != null)
            {
               return this.m_stHoneyTrapBaseDefense;
            }
            if(this.m_stTrayDefense)
            {
               stThiefDefense = this.m_stTrayDefense;
            }
         }
         return stThiefDefense;
      }
      
      public function getMoveDefense(a_1098:uint, m_isMyPlaced:Boolean = true) : a_3962
      {
         if(this.m_stAttackFighter != null && this.m_stAttackFighter is a_3924 && (this.m_stAttackFighter as a_3924).m_isMyPlaced == m_isMyPlaced && a_1098 == 288950047)
         {
            return this.m_stAttackFighter;
         }
         if(this.m_stAttackFighter != null && !(this.m_stAttackFighter is a_3924))
         {
            return this.m_stAttackFighter;
         }
         if(this.m_stFlowerDefense != null)
         {
            return this.m_stFlowerDefense;
         }
         if(this.m_stBaseAuxiliaryFighter != null)
         {
            return this.m_stBaseAuxiliaryFighter;
         }
         if(this.m_stProtector != null)
         {
            return this.m_stProtector;
         }
         if(this.m_stOceanGoddessToolDefense != null)
         {
            return this.m_stOceanGoddessToolDefense;
         }
         if(this.m_stHoneyTrapBaseDefense != null)
         {
            return this.m_stHoneyTrapBaseDefense;
         }
         if(this.m_stTrayDefense != null)
         {
            return this.m_stTrayDefense;
         }
         if(this.m_stBaseToolDefense != null && (this.m_stBaseToolDefense.iToolType == 2 || this.m_stBaseToolDefense.iToolType == 3))
         {
            return this.m_stBaseToolDefense;
         }
         return null;
      }
      
      public function a_3442(baseProtector:a_3975) : Boolean
      {
         if(this.m_isNeedTray && null == this.m_stTrayDefense || null == baseProtector || null != this.m_stProtector || this.m_isExistMouseHole || this.m_iFieldGridType != 0 || this.m_isClawMark)
         {
            return false;
         }
         this.m_stProtector = baseProtector;
         return true;
      }
      
      protected function IfNeedTray() : Boolean
      {
         return !this.m_isNeedTray || null != this.m_stTrayDefense;
      }
      
      public function get IsHasAcceleration() : Boolean
      {
         return Boolean(null != this.m_stAccelerationEffect && this.m_stAccelerationEffect.IsEffective || this.m_SpeedBool);
      }
      
      public function AddAcceleration(stBaseAccelerationEffect:BaseAccelerationEffect) : Boolean
      {
         if(null == stBaseAccelerationEffect || this.m_isNeedTray)
         {
            return false;
         }
         if(null != this.m_stAccelerationEffect)
         {
            this.m_stAccelerationEffect.UpdateTick(stBaseAccelerationEffect.iShowTick,stBaseAccelerationEffect.iDelayTick);
         }
         else
         {
            this.m_stAccelerationEffect = stBaseAccelerationEffect;
         }
         return true;
      }
      
      public function RemoveAcceleration(stBaseAccelerationEffect:BaseAccelerationEffect) : Boolean
      {
         if(null == stBaseAccelerationEffect || null == this.m_stAccelerationEffect || stBaseAccelerationEffect != stBaseAccelerationEffect)
         {
            return false;
         }
         this.m_stAccelerationEffect = null;
         return true;
      }
      
      public function a_3496(baseProtector:a_3975) : Boolean
      {
         var stAurDataEvent:a_1778 = null;
         if(null == baseProtector || null == this.m_stProtector || baseProtector != this.m_stProtector)
         {
            return false;
         }
         this.m_stProtector = null;
         if(this.m_stCurrentBattbleFieldView.m_isOwnBattleField && Boolean(this.m_stCurrentBattbleFieldView.root))
         {
            stAurDataEvent = new a_1778("DefenseCardCountChange");
            stAurDataEvent.dataObjectNew = [baseProtector.a_3512(),this.m_stCurrentBattbleFieldView.a_3422(baseProtector.a_3512())];
            this.m_stCurrentBattbleFieldView.root.dispatchEvent(stAurDataEvent);
         }
         if(!(this.m_stAttackFighter && this.m_stAttackFighter.iBreadFighterType > 0) && this.m_stBaseLander != null)
         {
            this.m_stBaseLander.a_3940();
            this.m_stBaseLander = null;
         }
         return true;
      }
      
      private function CanAddAttackFighter(attackFighter:a_3953) : Boolean
      {
         if(null == attackFighter)
         {
            return false;
         }
         if(!attackFighter.isCanInWater && this.m_isNeedTray && null == this.m_stTrayDefense)
         {
            return false;
         }
         if(attackFighter.isCanInWater && (!this.m_isNeedTray || null != this.m_stTrayDefense))
         {
            return false;
         }
         if(attackFighter.isOnlyOnTray && null == this.m_stTrayDefense)
         {
            return false;
         }
         if(this.m_isExistMouseHole || this.m_iFieldGridType != 0 || this.m_isClawMark)
         {
            return false;
         }
         if(attackFighter.secondExtraSlotType == 1 || attackFighter.secondExtraSlotType == 2)
         {
            return null == this.m_stHoneyTrapBaseDefense;
         }
         if(null != this.m_stBoomDefense || null != this.m_stBaseAuxiliaryFighter || null != this.m_stFlowerDefense)
         {
            return false;
         }
         if(this.HasTag(20021) && BattleFieldView.m_lBarrierHorse.indexOf(attackFighter.a_3512()) != -1)
         {
            return false;
         }
         return null == this.m_stAttackFighter;
      }
      
      public function a_3443(attackFighter:a_3953) : Boolean
      {
         if(!this.CanAddAttackFighter(attackFighter))
         {
            return false;
         }
         if(attackFighter.secondExtraSlotType == 1 || attackFighter.secondExtraSlotType == 2)
         {
            this.m_stHoneyTrapBaseDefense = attackFighter;
         }
         else
         {
            this.m_stAttackFighter = attackFighter;
         }
         return true;
      }
      
      public function a_3497(attackFighter:a_3953) : Boolean
      {
         var stAurDataEvent:a_1778 = null;
         if(null == attackFighter)
         {
            return false;
         }
         if(attackFighter == this.m_stHoneyTrapBaseDefense)
         {
            this.m_stHoneyTrapBaseDefense = null;
         }
         else
         {
            if(attackFighter != this.m_stAttackFighter)
            {
               return false;
            }
            if(this.m_stSleepingEffect != null)
            {
               this.m_stSleepingEffect.a_3940();
               this.m_stSleepingEffect = null;
            }
            this.m_stAttackFighter = null;
         }
         if(this.m_stCurrentBattbleFieldView.m_isOwnBattleField && Boolean(this.m_stCurrentBattbleFieldView.root))
         {
            stAurDataEvent = new a_1778("DefenseCardCountChange");
            stAurDataEvent.dataObjectNew = [attackFighter.a_3512(),this.m_stCurrentBattbleFieldView.a_3422(attackFighter.a_3512())];
            this.m_stCurrentBattbleFieldView.root.dispatchEvent(stAurDataEvent);
         }
         if(null == this.m_stProtector && this.m_stBaseLander != null)
         {
            this.m_stBaseLander.a_3940();
            this.m_stBaseLander = null;
         }
         return true;
      }
      
      public function a_3444(stTrayDefense:a_3977) : Boolean
      {
         if(!this.m_isNeedTray || null == stTrayDefense || null != this.m_stTrayDefense || this.m_isExistMouseHole || this.m_iFieldGridType != 0 || this.m_isClawMark)
         {
            return false;
         }
         this.m_stTrayDefense = stTrayDefense;
         return true;
      }
      
      public function a_3498(stTrayDefense:a_3977) : Boolean
      {
         var stAurDataEvent:a_1778 = null;
         if(null == stTrayDefense || null == this.m_stTrayDefense || stTrayDefense != this.m_stTrayDefense)
         {
            return false;
         }
         this.m_stTrayDefense = null;
         if(this.m_stVersatileDefense != null)
         {
            this.m_stVersatileDefense.a_3940();
         }
         if(this.m_stCurrentBattbleFieldView.m_isOwnBattleField && Boolean(this.m_stCurrentBattbleFieldView.root))
         {
            stAurDataEvent = new a_1778("DefenseCardCountChange");
            stAurDataEvent.dataObjectNew = [stTrayDefense.a_3512(),this.m_stCurrentBattbleFieldView.a_3422(stTrayDefense.a_3512())];
            this.m_stCurrentBattbleFieldView.root.dispatchEvent(stAurDataEvent);
         }
         return true;
      }
      
      public function a_3446(stBoomDefense:a_3960) : Boolean
      {
         var i:int = 0;
         if(this.m_isNeedTray && null == this.m_stTrayDefense || null == stBoomDefense || null != this.m_stBoomDefense || null != this.m_stAttackFighter || null != this.m_stBaseAuxiliaryFighter || null != this.m_stFlowerDefense || stBoomDefense.isOnlyOnLand && this.m_isNeedTray || this.m_isExistMouseHole || this.m_isClawMark)
         {
            return false;
         }
         if(this.HasTag(22) && BattleFieldView.m_lBoomCard.indexOf(stBoomDefense.a_3512()) != -1)
         {
            i = 0;
         }
         else if(this.m_iFieldGridType != 0)
         {
            return false;
         }
         this.m_stBoomDefense = stBoomDefense;
         return true;
      }
      
      public function a_3499(stBoomDefense:a_3960) : Boolean
      {
         var stAurDataEvent:a_1778 = null;
         if(null == stBoomDefense || null == this.m_stBoomDefense || stBoomDefense != this.m_stBoomDefense)
         {
            return false;
         }
         this.m_stBoomDefense = null;
         if(this.m_stCurrentBattbleFieldView.m_isOwnBattleField && Boolean(this.m_stCurrentBattbleFieldView.root))
         {
            stAurDataEvent = new a_1778("DefenseCardCountChange");
            stAurDataEvent.dataObjectNew = [stBoomDefense.a_3512(),this.m_stCurrentBattbleFieldView.a_3422(stBoomDefense.a_3512())];
            this.m_stCurrentBattbleFieldView.root.dispatchEvent(stAurDataEvent);
         }
         return true;
      }
      
      public function a_3447(stFlowerDefense:a_3971) : Boolean
      {
         var i:int = 0;
         if(this.m_isNeedTray && null == this.m_stTrayDefense || null == stFlowerDefense || null != this.m_stFlowerDefense || null != this.m_stAttackFighter || null != this.m_stBaseAuxiliaryFighter || null != this.m_stBoomDefense || this.m_isExistMouseHole || this.m_isClawMark)
         {
            return false;
         }
         if(this.HasTag(23) && BattleFieldView.m_lAlcoholLamp.indexOf(stFlowerDefense.a_3512()) != -1)
         {
            i = 0;
         }
         else if(this.m_iFieldGridType != 0)
         {
            return false;
         }
         this.m_stFlowerDefense = stFlowerDefense;
         return true;
      }
      
      public function a_3500(stFlowerDefense:a_3971) : Boolean
      {
         var stAurDataEvent:a_1778 = null;
         if(null == stFlowerDefense || null == this.m_stFlowerDefense || stFlowerDefense != this.m_stFlowerDefense)
         {
            return false;
         }
         this.m_stFlowerDefense = null;
         if(this.m_stCurrentBattbleFieldView.m_isOwnBattleField && Boolean(this.m_stCurrentBattbleFieldView.root))
         {
            stAurDataEvent = new a_1778("DefenseCardCountChange");
            stAurDataEvent.dataObjectNew = [stFlowerDefense.a_3512(),this.m_stCurrentBattbleFieldView.a_3422(stFlowerDefense.a_3512())];
            this.m_stCurrentBattbleFieldView.root.dispatchEvent(stAurDataEvent);
         }
         return true;
      }
      
      public function a_3445(stAuxiliaryFighter:a_3959) : Boolean
      {
         if(this.m_isNeedTray && null == this.m_stTrayDefense || null == stAuxiliaryFighter || null != this.m_stBaseAuxiliaryFighter || null != this.m_stAttackFighter || null != this.m_stFlowerDefense || null != this.m_stBoomDefense || this.m_isExistMouseHole || this.m_isClawMark)
         {
            return false;
         }
         if(!(a_4206.m_iViewBuffId == 320012400 && this.HasTag(21) && BattleFieldView.m_lAuxCard.indexOf(stAuxiliaryFighter.a_3512()) != -1))
         {
            if(this.m_iFieldGridType != 0)
            {
               return false;
            }
         }
         this.m_stBaseAuxiliaryFighter = stAuxiliaryFighter;
         return true;
      }
      
      public function a_3501(stAuxiliaryFighter:a_3959) : Boolean
      {
         var stAurDataEvent:a_1778 = null;
         if(null == stAuxiliaryFighter || null == this.m_stBaseAuxiliaryFighter || stAuxiliaryFighter != this.m_stBaseAuxiliaryFighter)
         {
            return false;
         }
         this.m_stBaseAuxiliaryFighter = null;
         if(this.m_stCurrentBattbleFieldView.m_isOwnBattleField && Boolean(this.m_stCurrentBattbleFieldView.root))
         {
            stAurDataEvent = new a_1778("DefenseCardCountChange");
            stAurDataEvent.dataObjectNew = [stAuxiliaryFighter.a_3512(),this.m_stCurrentBattbleFieldView.a_3422(stAuxiliaryFighter.a_3512())];
            this.m_stCurrentBattbleFieldView.root.dispatchEvent(stAurDataEvent);
         }
         return true;
      }
      
      public function a_3448(stToolDefense:a_3976) : Boolean
      {
         if(null == stToolDefense || this.m_isClawMark || this.m_isCannotAddCard)
         {
            return false;
         }
         if(stToolDefense.iToolType == 4)
         {
            if(this.m_isExistMouseHole || !this.m_isNeedTray && this.a_3492() || this.m_isNeedTray && null == this.m_stTrayDefense)
            {
               return false;
            }
            this.m_stVersatileDefense = stToolDefense;
            return true;
         }
         if(stToolDefense.iToolType == 3 && (this.m_isExistMouseHole || this.m_iFieldGridType != 0 && !this.a_3492()))
         {
            return false;
         }
         if(stToolDefense.iToolType == 5)
         {
            if(this.m_isExistMouseHole || this.m_iFieldGridType != 0 && !this.a_3492())
            {
               return false;
            }
            return true;
         }
         if(this.m_stBaseToolDefense != null)
         {
            if(this.m_stBaseToolDefense.iToolType == 1)
            {
               return false;
            }
            if(this.m_stBaseToolDefense.iToolType != stToolDefense.iToolType)
            {
               return false;
            }
            if(stToolDefense.iToolType != 0)
            {
               this.m_stBaseToolDefense.m_iDieType = 0;
               this.m_stBaseToolDefense.a_3969(this.m_stBaseToolDefense.iLifeValue);
            }
         }
         this.m_stBaseToolDefense = stToolDefense;
         return true;
      }
      
      public function RemoveToolDefense(stToolDefense:a_3976) : Boolean
      {
         var stAurDataEvent:a_1778 = null;
         if(!stToolDefense)
         {
            return false;
         }
         if(stToolDefense == this.m_stVersatileDefense)
         {
            this.m_stVersatileDefense = null;
         }
         else if(stToolDefense == this.m_stBattleBarrierHorseDefense)
         {
            this.m_stBattleBarrierHorseDefense = null;
         }
         else if(stToolDefense == this.m_stOceanGoddessToolDefense)
         {
            this.m_stOceanGoddessToolDefense = null;
         }
         else
         {
            if(stToolDefense != this.m_stBaseToolDefense)
            {
               return false;
            }
            this.m_stBaseToolDefense = null;
         }
         if(this.m_stCurrentBattbleFieldView.m_isOwnBattleField && Boolean(this.m_stCurrentBattbleFieldView.root))
         {
            stAurDataEvent = new a_1778("DefenseCardCountChange");
            stAurDataEvent.dataObjectNew = [stToolDefense.a_3512(),this.m_stCurrentBattbleFieldView.a_3422(stToolDefense.a_3512())];
            this.m_stCurrentBattbleFieldView.root.dispatchEvent(stAurDataEvent);
         }
         return true;
      }
      
      public function RemoveDefense(stBaseDefense:a_3962) : Boolean
      {
         if(stBaseDefense == null)
         {
            return false;
         }
         if(stBaseDefense == this.m_stProtector)
         {
            this.m_stProtector = null;
         }
         else if(stBaseDefense == this.m_stAttackFighter)
         {
            this.m_stAttackFighter = null;
         }
         else if(stBaseDefense == this.m_stHoneyTrapBaseDefense)
         {
            this.m_stHoneyTrapBaseDefense = null;
         }
         else if(stBaseDefense == this.m_stOceanGoddessToolDefense)
         {
            this.m_stOceanGoddessToolDefense = null;
         }
         else if(stBaseDefense == this.m_stFlowerDefense)
         {
            this.m_stFlowerDefense = null;
         }
         else if(stBaseDefense == this.m_stBaseAuxiliaryFighter)
         {
            this.m_stBaseAuxiliaryFighter = null;
         }
         else if(stBaseDefense == this.m_stTrayDefense)
         {
            this.m_stTrayDefense = null;
         }
         return true;
      }
      
      public function CheckAddDefense(stBaseDefense:a_3962, isCheckVersatileDefense:Boolean = true) : Boolean
      {
         if(!stBaseDefense)
         {
            return false;
         }
         var attackFighter:a_3953 = stBaseDefense as a_3953;
         var stBoomDefense:a_3960 = stBaseDefense as a_3960;
         var baseProtector:a_3975 = stBaseDefense as a_3975;
         var stTrayDefense:a_3977 = stBaseDefense as a_3977;
         var stAuxiliaryFighter:a_3959 = stBaseDefense as a_3959;
         var stFlowerDefense:a_3971 = stBaseDefense as a_3971;
         var baseInsureance:a_3972 = stBaseDefense as a_3972;
         var baseToolDefense:a_3976 = stBaseDefense as a_3976;
         if(isCheckVersatileDefense && this.m_stVersatileDefense != null || this.m_isClawMark || this.m_isCannotAddCard)
         {
            return false;
         }
         if(attackFighter)
         {
            return this.CanAddAttackFighter(attackFighter);
         }
         if(stBoomDefense)
         {
            if(this.m_isNeedTray && null == this.m_stTrayDefense || null == stBoomDefense || null != this.m_stBoomDefense || null != this.m_stAttackFighter || null != this.m_stBaseAuxiliaryFighter || null != this.m_stFlowerDefense || stBoomDefense.isOnlyOnLand && this.m_isNeedTray || this.m_isExistMouseHole || this.m_iFieldGridType != 0 || this.m_isClawMark)
            {
               return false;
            }
         }
         else if(baseProtector)
         {
            if(this.m_isNeedTray && null == this.m_stTrayDefense || null == baseProtector || null != this.m_stProtector || this.m_isExistMouseHole || this.m_iFieldGridType != 0 || this.m_isClawMark)
            {
               return false;
            }
         }
         else if(stTrayDefense)
         {
            if(!this.m_isNeedTray && (BattleFieldView.IsMagicFudgeWaterDefense(stTrayDefense.a_3512()) || BattleFieldView.IsMagicFudgeFusionWaterDefense(stTrayDefense.a_3512())))
            {
               if(this.m_stBaseToolDefense != null)
               {
                  if(this.m_stBaseToolDefense.iToolType == 1)
                  {
                     return false;
                  }
                  if(this.m_stBaseToolDefense.iToolType != 2)
                  {
                     return false;
                  }
               }
            }
            else if(!this.m_isNeedTray || null == stTrayDefense || null != this.m_stTrayDefense || this.m_isExistMouseHole || this.m_iFieldGridType != 0 || this.m_isClawMark)
            {
               return false;
            }
         }
         else if(stAuxiliaryFighter)
         {
            if(this.m_isNeedTray && null == this.m_stTrayDefense || null == stAuxiliaryFighter || null != this.m_stBaseAuxiliaryFighter || null != this.m_stAttackFighter || null != this.m_stFlowerDefense || null != this.m_stBoomDefense || this.m_isExistMouseHole || this.m_iFieldGridType != 0 || this.m_isClawMark)
            {
               return false;
            }
         }
         else if(stFlowerDefense)
         {
            if(this.m_isNeedTray && null == this.m_stTrayDefense || null == stFlowerDefense || null != this.m_stFlowerDefense || null != this.m_stAttackFighter || null != this.m_stBaseAuxiliaryFighter || null != this.m_stBoomDefense || this.m_isExistMouseHole || this.m_iFieldGridType != 0 || this.m_isClawMark)
            {
               return false;
            }
         }
         else if(Boolean(baseToolDefense) && !this.m_isClawMark)
         {
            if(1 == baseToolDefense.iToolType && !this.m_isExistMouseHole)
            {
               return false;
            }
            if(0 != baseToolDefense.iToolType)
            {
               if(this.m_isNeedTray && (BattleFieldView.IsMagicFudgeLandDefense(baseToolDefense.a_3512()) || BattleFieldView.IsMagicFudgeFusionLandDefense(baseToolDefense.a_3512())))
               {
                  if(!this.m_isNeedTray || null != this.m_stTrayDefense || this.m_isExistMouseHole || this.m_iFieldGridType != 0 || this.m_isClawMark)
                  {
                     return false;
                  }
               }
               if(baseToolDefense.iToolType == 3 && (this.m_isExistMouseHole || this.m_iFieldGridType != 0 && !this.a_3492()))
               {
                  return false;
               }
               if(baseToolDefense.iToolType == 4)
               {
                  if(this.m_isExistMouseHole || this.m_iFieldGridType != 0 || !this.m_isNeedTray && this.a_3492() || this.m_isNeedTray && !this.CanAddDefenseInWater())
                  {
                     return false;
                  }
               }
               if(this.m_stBaseToolDefense != null)
               {
                  if(this.m_stBaseToolDefense.iToolType == 1)
                  {
                     return false;
                  }
                  if(baseToolDefense.iToolType == 4)
                  {
                     return true;
                  }
                  if(this.m_stBaseToolDefense.iToolType != baseToolDefense.iToolType && this.m_stBaseToolDefense.iToolType == 3)
                  {
                     return false;
                  }
               }
            }
         }
         return true;
      }
      
      public function AddMageSnakePoisonBuff(iHurtPower:Number = 1) : void
      {
         if(this.m_stMageSnakePoisonBuff == null)
         {
            this.m_stMageSnakePoisonBuff = MageSnakePoisonBuff.a_3926();
            this.m_stMageSnakePoisonBuff.stTargetGrid = this;
            this.m_stMageSnakePoisonBuff.a_1797(!this.m_stCurrentBattbleFieldView.m_isOwnBattleField,1,iHurtPower);
            this.m_stMageSnakePoisonBuff.x = this.m_stCurrentBattbleFieldView.m_isOwnBattleField ? (this.m_iXGridNo + 0.5) * a_3491.a_1080 : BattleFieldView.a_1013 - (this.m_iXGridNo + 0.5) * a_3491.a_1080;
            this.m_stMageSnakePoisonBuff.y = (this.m_iYGridNo + 0.5) * a_3491.a_1081;
            this.m_stCurrentBattbleFieldView.AddToBattleView(this.m_stMageSnakePoisonBuff,BattleLayerDefine.EFFECTS_BASE_TYPE,this);
         }
         if(this.m_stMageSnakePoisonBuff.m_BuffDurations.length < 6)
         {
            this.m_stMageSnakePoisonBuff.m_BuffDurations.push(4 * 20 + 1);
            this.m_stMageSnakePoisonBuff.m_BuffPowers.push(iHurtPower);
         }
      }
      
      public function a_3459(stMoveIntruder:a_4206) : Boolean
      {
         if(null == stMoveIntruder || -1 != this.a_1511.indexOf(stMoveIntruder))
         {
            trace("WARNING: AddMoveFighter failed, stMoveIntruder is null or stMoveIntruder exist in m_arrMoveIntruder for ID:" + stMoveIntruder.globalMoveFighterID);
            return false;
         }
         if(null != stMoveIntruder.m_stCurrentFieldGrid)
         {
            stMoveIntruder.m_stCurrentFieldGrid.a_3457(stMoveIntruder);
         }
         this.a_1511.push(stMoveIntruder);
         this.m_isOccupy = true;
         stMoveIntruder.m_stCurrentFieldGrid = this;
         return true;
      }
      
      public function a_3457(stMoveIntruder:a_4206) : Boolean
      {
         if(null == stMoveIntruder)
         {
            trace("Error: stMoveIntruder is null, RemoveMoveFighter failed");
            return false;
         }
         if(-1 != this.a_1511.indexOf(stMoveIntruder))
         {
            this.a_1511.splice(this.a_1511.indexOf(stMoveIntruder),1);
         }
         if(0 == this.a_1511.length)
         {
            this.m_isOccupy = false;
         }
         return true;
      }
      
      public function a_3502() : void
      {
         var key:* = undefined;
         this.tagCom.ClearAll();
         this.buffCom.ClearAll();
         if(null != this.m_stTentMouse)
         {
            this.m_stTentMouse.a_3432();
            this.m_stTentMouse = null;
         }
         if(null != this.m_stCrispyKiteMouse)
         {
            this.m_stCrispyKiteMouse.a_3432();
            this.m_stCrispyKiteMouse = null;
         }
         if(this.m_stBaseLander != null)
         {
            this.m_stBaseLander.a_3940();
            this.m_stBaseLander = null;
         }
         if(this.m_stObstacleEffect != null)
         {
            this.m_stObstacleEffect.a_3940();
            this.m_stObstacleEffect = null;
         }
         if(this.m_stPlotEffect != null)
         {
            this.m_stPlotEffect.a_3940();
            this.m_stPlotEffect = null;
         }
         if(this.m_stCrispyKiteEffect != null)
         {
            this.m_stCrispyKiteEffect.a_3940();
            this.m_stCrispyKiteEffect = null;
         }
         if(this.m_stMageSnakePoisonBuff != null)
         {
            this.m_stMageSnakePoisonBuff.a_3940();
            this.m_stMageSnakePoisonBuff = null;
         }
         if(null != this.m_stProtector)
         {
            this.m_stProtector.a_3940();
            this.m_stProtector = null;
         }
         if(null != this.m_stAttackFighter)
         {
            this.m_stAttackFighter.a_3940();
            this.m_stAttackFighter = null;
         }
         if(null != this.m_stBoomDefense)
         {
            this.m_stBoomDefense.a_3940();
            this.m_stBoomDefense = null;
         }
         if(null != this.m_stFlowerDefense)
         {
            this.m_stFlowerDefense.a_3940();
            this.m_stFlowerDefense = null;
         }
         if(null != this.m_stBaseAuxiliaryFighter)
         {
            this.m_stBaseAuxiliaryFighter.a_3940();
            this.m_stBaseAuxiliaryFighter = null;
         }
         if(null != this.m_stOceanGoddessToolDefense)
         {
            this.m_stOceanGoddessToolDefense.a_3940();
            this.m_stOceanGoddessToolDefense = null;
         }
         if(null != this.m_stHoneyTrapBaseDefense)
         {
            this.m_stHoneyTrapBaseDefense.a_3940();
            this.m_stHoneyTrapBaseDefense = null;
         }
         if(null != this.m_stTrayDefense)
         {
            this.m_stTrayDefense.a_3940();
            this.m_stTrayDefense = null;
         }
         if(null != this.m_stBaseToolDefense)
         {
            this.m_stBaseToolDefense.a_3940();
         }
         if(null != this.m_stVersatileDefense)
         {
            this.m_stVersatileDefense.a_3940();
         }
         if(null != this.m_stFinalBrahmaDefense)
         {
            this.m_stFinalBrahmaDefense.a_3940();
         }
         if(null != this.m_stBattleFlagHorseDefense)
         {
            this.m_stBattleFlagHorseDefense.a_3940();
         }
         if(null != this.m_stBattleBarrierHorseDefense)
         {
            this.m_stBattleBarrierHorseDefense.a_3940();
         }
         if(null != this.m_stAccelerationEffect)
         {
            this.m_stAccelerationEffect.a_3940();
         }
         this.a_3503();
         this.m_isExistMouseHole = false;
         this.m_bShowFrozenEffect = true;
         this.m_iFieldGridType = 0;
         this.m_iSpecialType = 0;
         this.m_isClawMark = false;
         this.m_hasFireEffect = false;
         this.m_isSilent = false;
         this.m_isLockBuildMouse = false;
         this.m_isLockVersatileDefense = false;
         this.m_iInitialXGridNo = this.m_iXGridNo;
         this.m_iInitialYGridNo = this.m_iYGridNo;
         for(key in this.m_dicCannotAddCard)
         {
            delete this.m_dicCannotAddCard[key];
         }
      }
      
      public function ClearFieldGridDefenseNoraml() : Boolean
      {
         return this.ClearFieldGridDefenseWithOption();
      }
      
      public function ClearFieldGridDefenseWithOption(isOnlyTop:Boolean = false, isClearBoom:Boolean = true, isClearTray:Boolean = true, dieType:int = 1) : Boolean
      {
         if(null != this.m_stProtector)
         {
            this.m_stProtector.m_iDieType = dieType;
            this.m_stProtector.a_3969(this.m_stProtector.iLifeValue);
            if(isOnlyTop)
            {
               return true;
            }
         }
         if(null != this.m_stAttackFighter && !(this.m_stAttackFighter is a_3924))
         {
            this.m_stAttackFighter.m_iDieType = dieType;
            this.m_stAttackFighter.a_3969(this.m_stAttackFighter.iLifeValue);
            if(isOnlyTop)
            {
               return true;
            }
         }
         if(isClearBoom && null != this.m_stBoomDefense)
         {
            this.m_stBoomDefense.m_iDieType = dieType;
            this.m_stBoomDefense.a_3969(this.m_stBoomDefense.iLifeValue);
            if(isOnlyTop)
            {
               return true;
            }
         }
         if(null != this.m_stFlowerDefense)
         {
            this.m_stFlowerDefense.m_iDieType = dieType;
            this.m_stFlowerDefense.a_3969(this.m_stFlowerDefense.iLifeValue);
            if(isOnlyTop)
            {
               return true;
            }
         }
         if(null != this.m_stBaseAuxiliaryFighter)
         {
            this.m_stBaseAuxiliaryFighter.m_iDieType = dieType;
            this.m_stBaseAuxiliaryFighter.a_3969(this.m_stBaseAuxiliaryFighter.iLifeValue);
            if(isOnlyTop)
            {
               return true;
            }
         }
         if(null != this.m_stOceanGoddessToolDefense)
         {
            this.m_stOceanGoddessToolDefense.m_iDieType = dieType;
            this.m_stOceanGoddessToolDefense.a_3969(this.m_stOceanGoddessToolDefense.iLifeValue);
            if(isOnlyTop)
            {
               return true;
            }
         }
         if(null != this.m_stHoneyTrapBaseDefense)
         {
            this.m_stHoneyTrapBaseDefense.m_iDieType = dieType;
            this.m_stHoneyTrapBaseDefense.a_3969(this.m_stHoneyTrapBaseDefense.iLifeValue);
            if(isOnlyTop)
            {
               return true;
            }
         }
         if(isClearTray && null != this.m_stTrayDefense)
         {
            this.m_stTrayDefense.m_iDieType = dieType;
            this.m_stTrayDefense.a_3969(this.m_stTrayDefense.iLifeValue);
            if(isOnlyTop)
            {
               return true;
            }
         }
         return true;
      }
      
      public function HasNewSlot() : Boolean
      {
         return null != this.m_stHoneyTrapBaseDefense || null != this.m_stOceanGoddessToolDefense;
      }
      
      public function GetNewSlotDefense() : a_3962
      {
         if(null != this.m_stOceanGoddessToolDefense)
         {
            return this.m_stOceanGoddessToolDefense;
         }
         if(null != this.m_stHoneyTrapBaseDefense)
         {
            return this.m_stHoneyTrapBaseDefense;
         }
         return null;
      }
      
      public function DamageNewSlot(bBoth:Boolean = true, iFrozen:int = 0, bUseDefenseFullLife:Boolean = false, iHurt:int = 0, iDieType:int = -1) : void
      {
         if(bBoth)
         {
            this.TryReduceDefenseLife(this.m_stOceanGoddessToolDefense,iFrozen,bUseDefenseFullLife,iHurt,iDieType);
            this.TryReduceDefenseLife(this.m_stHoneyTrapBaseDefense,iFrozen,bUseDefenseFullLife,iHurt,iDieType);
         }
         else
         {
            if(this.TryReduceDefenseLife(this.m_stOceanGoddessToolDefense,iFrozen,bUseDefenseFullLife,iHurt,iDieType))
            {
               return;
            }
            this.TryReduceDefenseLife(this.m_stHoneyTrapBaseDefense,iFrozen,bUseDefenseFullLife,iHurt,iDieType);
         }
      }
      
      private function TryReduceDefenseLife(st:a_3962, iFrozen:int, bUseDefenseFullLife:Boolean, iHurt:int, iDieType:int = -1) : Boolean
      {
         if(null == st)
         {
            return false;
         }
         if(1 == iFrozen && !st.m_isShowFrozen)
         {
            return false;
         }
         if(2 == iFrozen && st.m_isShowFrozen)
         {
            return false;
         }
         if(iDieType >= 0)
         {
            st.m_iDieType = iDieType;
         }
         st.a_3969(bUseDefenseFullLife ? st.iLifeValue : iHurt);
         return true;
      }
      
      public function SetNewSlotShihuaBoth(bShihua:Boolean = true) : void
      {
         if(null != this.m_stHoneyTrapBaseDefense)
         {
            this.m_stHoneyTrapBaseDefense.m_isShihua = bShihua;
         }
         if(null != this.m_stOceanGoddessToolDefense)
         {
            this.m_stOceanGoddessToolDefense.m_isShihua = bShihua;
         }
      }
      
      public function TryConsumeUpgradeMatchNewSlot(stCopy:a_3962) : Boolean
      {
         if(!(stCopy is a_3959))
         {
            return false;
         }
         var mask:int = stCopy.iUpgradeID & 0xFFFF;
         if(null != this.m_stOceanGoddessToolDefense && this.m_stOceanGoddessToolDefense.iUpgradeID == mask)
         {
            this.m_stOceanGoddessToolDefense.a_3969(this.m_stOceanGoddessToolDefense.iLifeValue);
            return true;
         }
         if(null != this.m_stHoneyTrapBaseDefense && this.m_stHoneyTrapBaseDefense.iUpgradeID == mask)
         {
            this.m_stHoneyTrapBaseDefense.a_3969(this.m_stHoneyTrapBaseDefense.iLifeValue);
            return true;
         }
         return false;
      }
      
      public function ClearFieldGridDefenseOnlyFrozen() : Boolean
      {
         if(null != this.m_stProtector && this.m_stProtector.m_isShowFrozen)
         {
            this.m_stProtector.m_iDieType = 1;
            this.m_stProtector.a_3969(this.m_stProtector.iLifeValue);
         }
         if(null != this.m_stAttackFighter && !(this.m_stAttackFighter is a_3924) && this.m_stAttackFighter.m_isShowFrozen)
         {
            this.m_stAttackFighter.m_iDieType = 1;
            this.m_stAttackFighter.a_3969(this.m_stAttackFighter.iLifeValue);
         }
         if(null != this.m_stBoomDefense && this.m_stBoomDefense.m_isShowFrozen)
         {
            this.m_stBoomDefense.m_iDieType = 1;
            this.m_stBoomDefense.a_3969(this.m_stBoomDefense.iLifeValue);
         }
         if(null != this.m_stFlowerDefense && this.m_stFlowerDefense.m_isShowFrozen)
         {
            this.m_stFlowerDefense.m_iDieType = 1;
            this.m_stFlowerDefense.a_3969(this.m_stFlowerDefense.iLifeValue);
         }
         if(null != this.m_stBaseAuxiliaryFighter && this.m_stBaseAuxiliaryFighter.m_isShowFrozen)
         {
            this.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            this.m_stBaseAuxiliaryFighter.a_3969(this.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         if(null != this.m_stOceanGoddessToolDefense && this.m_stOceanGoddessToolDefense.m_isShowFrozen)
         {
            this.m_stOceanGoddessToolDefense.m_iDieType = 1;
            this.m_stOceanGoddessToolDefense.a_3969(this.m_stOceanGoddessToolDefense.iLifeValue);
         }
         if(null != this.m_stHoneyTrapBaseDefense && this.m_stHoneyTrapBaseDefense.m_isShowFrozen)
         {
            this.m_stHoneyTrapBaseDefense.m_iDieType = 1;
            this.m_stHoneyTrapBaseDefense.a_3969(this.m_stHoneyTrapBaseDefense.iLifeValue);
         }
         if(null != this.m_stTrayDefense && this.m_stTrayDefense.m_isShowFrozen)
         {
            this.m_stTrayDefense.m_iDieType = 1;
            this.m_stTrayDefense.a_3969(this.m_stTrayDefense.iLifeValue);
         }
         return true;
      }
      
      public function BurnFieldGridDefenseNormal(iReduceLife:int) : Boolean
      {
         if(null != this.m_stBaseToolDefense)
         {
            this.m_stBaseToolDefense.m_iDieType = 1;
            this.m_stBaseToolDefense.a_3969(iReduceLife);
         }
         else if(null != this.m_stProtector)
         {
            this.m_stProtector.m_iDieType = 1;
            this.m_stProtector.a_3969(iReduceLife);
         }
         else if(null != this.m_stAttackFighter && !(this.m_stAttackFighter is a_3924))
         {
            this.m_stAttackFighter.m_iDieType = 1;
            this.m_stAttackFighter.a_3969(iReduceLife);
         }
         else if(null != this.m_stBoomDefense)
         {
            this.m_stBoomDefense.m_iDieType = 1;
            this.m_stBoomDefense.a_3969(iReduceLife);
         }
         else if(null != this.m_stFlowerDefense)
         {
            this.m_stFlowerDefense.m_iDieType = 1;
            this.m_stFlowerDefense.a_3969(iReduceLife);
         }
         else if(null != this.m_stBaseAuxiliaryFighter)
         {
            this.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            this.m_stBaseAuxiliaryFighter.a_3969(iReduceLife);
         }
         else if(this.HasNewSlot())
         {
            this.DamageNewSlot(false,0,false,iReduceLife,1);
         }
         else if(null != this.m_stTrayDefense)
         {
            this.m_stTrayDefense.m_iDieType = 1;
            this.m_stTrayDefense.a_3969(iReduceLife);
         }
         return true;
      }
      
      public function a_3503() : Boolean
      {
         if(this.m_stMouseEarthHole)
         {
            this.m_stMouseEarthHole.a_3940();
            this.m_stMouseEarthHole = null;
            this.m_isExistMouseHole = false;
         }
         this.tagCom.RemoveTag(140);
         return true;
      }
      
      public function ShowThis(x:int = 0, y:int = 0) : void
      {
      }
      
      public function ClimbIsEmpty() : Boolean
      {
         return Boolean(null == this.m_stBaseLander);
      }
      
      public function InitClimb() : void
      {
         this.m_stBaseLander = new BaseClimbEffect();
      }
      
      public function IsCanPutDownClimb() : Boolean
      {
         if(null != this.m_stBaseLander)
         {
            return false;
         }
         return null != this.m_stProtector || null != this.m_stAttackFighter && this.m_stAttackFighter.iBreadFighterType > 0;
      }
      
      public function get tagCom() : TagComponent
      {
         if(this._tagCom == null)
         {
            this._tagCom = new TagComponent();
         }
         return this._tagCom;
      }
      
      public function HasTag(iTag:int) : Boolean
      {
         if(this.tagCom.HasTag(iTag))
         {
            return true;
         }
         if(this.m_stBaseToolDefense != null && this.m_stBaseToolDefense.tagCom.HasTag(iTag))
         {
            return true;
         }
         if(this.m_stAttackFighter != null && this.m_stAttackFighter.tagCom.HasTag(iTag))
         {
            return true;
         }
         if(this.m_stBattleBarrierHorseDefense != null && this.m_stBattleBarrierHorseDefense.tagCom.HasTag(iTag))
         {
            return true;
         }
         if(this.m_stOceanGoddessToolDefense != null && this.m_stOceanGoddessToolDefense.tagCom.HasTag(iTag))
         {
            return true;
         }
         var arrMouveIntruder:Array = this.a_1511.slice();
         for(var i:int = 0; i < arrMouveIntruder.length; i++)
         {
            if(arrMouveIntruder[i].HasTag(iTag))
            {
               return true;
            }
         }
         return false;
      }
      
      public function get buffCom() : BuffComponent
      {
         if(this._buffCom == null)
         {
            this._buffCom = new BuffComponent();
            this._buffCom.InitByGrid(this._tagCom,this);
         }
         return this._buffCom;
      }
      
      public function getStraightShotMultiplier(step:int = 0) : Number
      {
         var field:a_3491 = null;
         var assist:a_3959 = null;
         var tool:a_3976 = null;
         var iYGridNo:int = 0;
         var multiplier:Number = 1;
         var isOceanGlobal:Boolean = Boolean(OceanGoddessFinalEffectManager.instance) && OceanGoddessFinalEffectManager.instance.m_cardCount >= 4;
         for(var iXGridNo:int = 0; iXGridNo < BattleFieldView.a_1011; iXGridNo++)
         {
            field = this.m_stCurrentBattbleFieldView.a_3438(iXGridNo,this.m_iYGridNo + step);
            if(field)
            {
               if(Boolean(field.m_stBaseAuxiliaryFighter) && this.IsAuxiliaryFighterForStraight(field.m_stBaseAuxiliaryFighter.a_3512()))
               {
                  assist = field.m_stBaseAuxiliaryFighter;
                  if(assist.RotateShotMultiplier > multiplier)
                  {
                     multiplier = assist.RotateShotMultiplier;
                  }
               }
               if(!isOceanGlobal)
               {
                  if(Boolean(field.m_stOceanGoddessToolDefense) && this.IsToolDefenseForStraight(field.m_stOceanGoddessToolDefense.a_3512()))
                  {
                     tool = field.m_stOceanGoddessToolDefense;
                     if(tool.RotateShotMultiplier > multiplier)
                     {
                        multiplier = tool.RotateShotMultiplier;
                     }
                  }
               }
            }
         }
         if(isOceanGlobal)
         {
            for(iYGridNo = 0; iYGridNo < BattleFieldView.a_1012; iYGridNo++)
            {
               for(iXGridNo = 0; iXGridNo < BattleFieldView.a_1011; iXGridNo++)
               {
                  field = this.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
                  if(!(!field || !field.m_stOceanGoddessToolDefense))
                  {
                     if(this.IsToolDefenseForStraight(field.m_stOceanGoddessToolDefense.a_3512()))
                     {
                        tool = field.m_stOceanGoddessToolDefense;
                        if(tool.RotateShotMultiplier > multiplier)
                        {
                           multiplier = tool.RotateShotMultiplier;
                        }
                     }
                  }
               }
            }
         }
         return multiplier;
      }
      
      private function isExistAuxiliaryFighter(grid:a_3491) : Boolean
      {
         if(!grid)
         {
            return false;
         }
         if(grid.m_stBaseAuxiliaryFighter)
         {
            return this.IsAuxiliaryFighterForStraight(grid.m_stBaseAuxiliaryFighter.a_3512());
         }
         if(grid.m_stOceanGoddessToolDefense)
         {
            return this.IsToolDefenseForStraight(grid.m_stOceanGoddessToolDefense.a_3512());
         }
         return false;
      }
      
      private function IsAuxiliaryFighterForStraight(id:uint) : Boolean
      {
         return id == 286401840 || id == 286401854 || id == 286401855 || id == 286402426;
      }
      
      private function IsToolDefenseForStraight(id:uint) : Boolean
      {
         return id == 288949851 || id == 288949852 || id == 288949853;
      }
      
      public function get IntruderArray() : Array
      {
         var stIntruder:a_4206 = null;
         this.m_arrTempIntruderArray.length = 0;
         if(!this.m_isOccupy)
         {
            return this.m_arrTempIntruderArray;
         }
         for each(stIntruder in this.a_1511)
         {
            this.m_arrTempIntruderArray.push(stIntruder);
         }
         return this.m_arrTempIntruderArray;
      }
   }
}

