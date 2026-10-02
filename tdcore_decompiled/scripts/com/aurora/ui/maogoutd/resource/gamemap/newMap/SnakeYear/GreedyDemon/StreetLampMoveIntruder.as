package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.GreedyDemon
{
   import a_4718.b_180;
   import a_4718.b_181;
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import com.aurora.ui.maogoutd.resource.energy.a_4162;
   import flash.display.FrameLabel;
   import flash.events.MouseEvent;
   import flash.utils.setTimeout;
   
   public class StreetLampMoveIntruder extends a_4206
   {
      
      private var MAX_INJURED_LIFE:int = 20000;
      
      private var MAX_LIFE:int = 300000;
      
      public var m_iOldFieldGridType:int;
      
      private var _arrGrid:Array;
      
      private var _index:int;
      
      private var _stMap:SweetTrapAmusementParkGameMap;
      
      private var _realDie:Boolean = false;
      
      private var _iState:int = 0;
      
      private var _times:int = 0;
      
      private var _battleView:BattleFieldView;
      
      private var m_iTimeNum:int = 0;
      
      private var m_iBeginTime:int = 0;
      
      public function StreetLampMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : StreetLampMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(StreetLampMoveIntruder) as StreetLampMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return StreetLampMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = 0;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1279 = -30;
         m_iYDisplayCenterPos = -110;
         a_1272 = 0;
         a_1481 = false;
         a_1464 = true;
         a_1463 = true;
         BoomIsReduceLife = true;
         if(m_iViewBuffId == 2576980377)
         {
            a_1339 = 4000000;
         }
         else
         {
            a_1339 = this.MAX_LIFE;
         }
         m_SecondDieFrame = 136;
         this.m_iBeginTime = -1;
         tagCom.AddTag(40003);
         return true;
      }
      
      public function InitData(index:int, arrGrid:Array, times:int, map:SweetTrapAmusementParkGameMap) : void
      {
         a_1271 = true;
         this._arrGrid = arrGrid;
         this._index = index;
         this._stMap = map;
         this._realDie = false;
         this._iState = 2;
         this.m_iOldFieldGridType = -1;
         this.SetAnimationOnce2Loop(0,2,0,7);
         this.m_iBeginTime = -1;
         this._times = times;
         if(m_stCurrentFieldGrid != null)
         {
            this.m_iOldFieldGridType = m_stCurrentFieldGrid.m_iFieldGridType;
            m_stCurrentFieldGrid.m_iFieldGridType = 8;
         }
      }
      
      protected function a_3502(stFieldGrid:*) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         var hasKill:Boolean = false;
         if(null != stFieldGrid.m_stAttackFighter)
         {
            if(stFieldGrid.m_stAttackFighter is a_3924)
            {
               return false;
            }
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
            hasKill = true;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
            hasKill = true;
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
            hasKill = true;
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
            hasKill = true;
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
            hasKill = true;
         }
         stFieldGrid.DamageNewSlot(true,0,true,0,1);
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
            hasKill = true;
         }
         return hasKill;
      }
      
      public function CallDie() : void
      {
         this._realDie = true;
         if(m_stCurrentFieldGrid != null && this.m_iOldFieldGridType != -1)
         {
            m_stCurrentFieldGrid.m_iFieldGridType = this.m_iOldFieldGridType;
            this.m_iOldFieldGridType = -1;
         }
         a_3969(iLifeValue);
      }
      
      private function gray2Light() : void
      {
         this.SetAnimationOnce2Loop(3,4,8,9);
         this._iState = 1;
         this.m_iBeginTime = this.m_iTimeNum;
      }
      
      private function light2Gray() : void
      {
         this.SetAnimationOnce2Loop(5,1,10,6);
         this._iState = 0;
         this.m_iBeginTime = this.m_iTimeNum;
      }
      
      override protected function a_3940() : Boolean
      {
         if(!this._realDie)
         {
            this._stMap.CreateLamp(this._index,this._arrGrid,this._times + 1);
         }
         if(m_stCurrentFieldGrid != null && this.m_iOldFieldGridType != -1)
         {
            m_stCurrentFieldGrid.m_iFieldGridType = this.m_iOldFieldGridType;
            this.m_iOldFieldGridType = -1;
         }
         super.a_3940();
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0)
         {
            if(a_4206.m_iViewBuffId == 2576980377)
            {
               this.DoBoomDie();
            }
            else
            {
               if(this._iState == 0)
               {
                  this.SetAnimation(11,11);
               }
               else
               {
                  this.SetAnimation(12,12);
               }
               if(m_stCurrentFieldGrid)
               {
                  m_stCurrentFieldGrid.a_3457(this);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               }
               play();
            }
         }
         return true;
      }
      
      public function DoBoomDie() : Boolean
      {
         var iNoX:int = 0;
         var iNoY:int = 0;
         var stEffect:SweetTrapBoomEffect = null;
         a_1339 = 0;
         if(m_stCurrentFieldGrid)
         {
            iNoX = m_stCurrentFieldGrid.m_iXGridNo;
            iNoY = m_stCurrentFieldGrid.m_iYGridNo;
            this._battleView = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView;
            stEffect = SweetTrapBoomEffect.a_3926();
            stEffect.a_1797(false);
            stEffect.InitData(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,iNoX,iNoY);
            stEffect.x = m_stCurrentFieldGrid.m_iXGridNo * a_3491.a_1080 - 25;
            stEffect.y = m_stCurrentFieldGrid.m_iYGridNo * a_3491.a_1081 - 55;
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stEffect,BattleLayerDefine.SHOT_TYPE,m_stCurrentFieldGrid);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_arrEffectArray.push(stEffect);
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         this.a_3940();
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function a_4213() : Boolean
      {
         a_3969(900);
         if(a_1339 <= 0)
         {
            this.a_4212();
         }
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         if(m_stCurrentFieldGrid)
         {
            a_3969(900);
         }
         else
         {
            a_1339 = 0;
            this.a_3940();
         }
         return true;
      }
      
      private function Gray2Fire() : void
      {
         this.SetAnimation(2,7);
         this._iState = 2;
         this.m_iBeginTime = this.m_iTimeNum;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         this.m_iTimeNum = iCurrentTime;
         if(this.m_iBeginTime == -1)
         {
            this.m_iBeginTime = iCurrentTime;
         }
         var runTick:int = this.m_iTimeNum - this.m_iBeginTime;
         if(runTick == 2)
         {
            this.a_3502(m_stCurrentFieldGrid);
         }
         if(this._iState == 0)
         {
            if(runTick == 110)
            {
               this.Gray2Fire();
            }
         }
         else if(this._iState == 2)
         {
            if(iCurrentTime % 2 == 1)
            {
               this.RealeaseAllFire();
            }
            if(runTick == 100)
            {
               this.gray2Light();
            }
         }
         else if(runTick == 210)
         {
            this.CreateFire();
         }
         else if(runTick == 410)
         {
            this.CreateFire();
            this.light2Gray();
         }
         var numOrigXPos:Number = x;
         super.a_4216(iCurrentTime);
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
      
      private function RealeaseAllFire() : void
      {
         var stBaseEnergy:a_4157 = null;
         var battleView:BattleFieldView = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView;
         if(null != battleView && Boolean(battleView.m_arrBaseEnergyVector))
         {
            for each(stBaseEnergy in battleView.m_arrBaseEnergyVector.slice())
            {
               if(m_iViewBuffId == 2576980377)
               {
                  if(stBaseEnergy.iEnergyPower > 50)
                  {
                     stBaseEnergy.a_4159(x - 60,y - 45,20,false);
                  }
               }
               else if(stBaseEnergy.iEnergyPower > 100)
               {
                  stBaseEnergy.a_4159(x - 60,y - 45,20,false);
               }
            }
         }
      }
      
      private function CreateFire() : void
      {
         var stFreeEnergy:a_4157 = a_4162.getInstance().a_4163(b_180.a_420);
         if(null != stFreeEnergy)
         {
            stFreeEnergy.m_stCurrentBattleField = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView;
            stFreeEnergy.a_1797(0,200,x - 35,y - 78);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stFreeEnergy,BattleLayerDefine.EFFECTS_TOP_TYPE);
            setTimeout(this.onDispathEvent,500,stFreeEnergy);
         }
      }
      
      private function onDispathEvent(stFreeEnergy:a_4157) : void
      {
         stFreeEnergy.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_OVER));
      }
      
      public function InDamage() : Boolean
      {
         return a_1339 > 0 && a_1339 < this.MAX_INJURED_LIFE;
      }
      
      public function SetAnimation(animIdx:int, animIdx2:int) : void
      {
         if(this.InDamage())
         {
            animIdx = animIdx2;
         }
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      public function SetAnimationOnce2Loop(onceAnimIdx:int, loopAnimIdx:int, onceAnimIdx2:int, loopAnimIdx2:int) : void
      {
         if(this.InDamage())
         {
            onceAnimIdx = onceAnimIdx2;
            loopAnimIdx = loopAnimIdx2;
         }
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
   }
}

