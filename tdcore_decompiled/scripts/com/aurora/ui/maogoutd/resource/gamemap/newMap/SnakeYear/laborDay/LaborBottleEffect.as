package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.laborDay
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class LaborBottleEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      private var m_stGrid:a_3491;
      
      private var _state:int = -1;
      
      private var _runTick:int = 0;
      
      public function LaborBottleEffect()
      {
         super();
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : LaborBottleEffect
      {
         return PoolManager.getInstance().CheckOutOne(LaborBottleEffect) as LaborBottleEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return LaborBottleEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         a_1279 = 2;
         m_iYDisplayCenterPos = 5;
         this.visible = true;
         gotoAndStop(1);
         this.play();
         return true;
      }
      
      public function InitData(fieldGrid:a_3491, state:int) : void
      {
         this.m_stGrid = fieldGrid;
         this._state = -1;
         if(state == 0)
         {
            this.SetAnimationOnce2Loop(0,0);
         }
         else
         {
            this.SetAnimationOnce2Loop(2,2);
         }
         this._runTick = 0;
         this.SwtichState(state);
      }
      
      public function IsClose() : Boolean
      {
         return !(this._state == 0 || this._state == 10);
      }
      
      public function IsSilence() : Boolean
      {
         return (this._state == 0 || this._state == 10) && this._runTick > 50;
      }
      
      private function SwtichState(state:int) : void
      {
         if(state >= 10)
         {
            return;
         }
         if(this._state != state)
         {
            this._runTick = 0;
            this._state = state;
            switch(state)
            {
               case 0:
                  a_1275 = 0;
                  this.m_stGrid.m_iFieldGridType = 8;
                  this.m_stGrid.m_isExistMouseHole = true;
                  break;
               case 1:
                  a_1275 = 2;
                  this.m_stGrid.m_iFieldGridType = 4;
                  this.m_stGrid.m_isExistMouseHole = false;
                  break;
               case 2:
                  a_1275 = 3;
                  this.m_stGrid.m_iFieldGridType = 4;
                  this.m_stGrid.m_isExistMouseHole = false;
                  break;
               case 3:
                  a_1275 = 5;
                  this.m_stGrid.m_iFieldGridType = 4;
                  this.m_stGrid.m_isExistMouseHole = false;
                  break;
               case 4:
                  a_1275 = 7;
                  this.m_stGrid.m_iFieldGridType = 4;
                  this.m_stGrid.m_isExistMouseHole = false;
            }
         }
      }
      
      private function CreateEffect(level:int) : void
      {
         var effect:LaborBottleBulletEffect = LaborBottleBulletEffect.a_3926();
         effect.a_1797(false);
         this.m_stGrid.m_stCurrentBattbleFieldView.AddToBattleView(effect,BattleLayerDefine.EFFECTS_TOP_TYPE,this.m_stGrid);
         effect.InitData(this.m_stGrid,level);
      }
      
      public function OnScoopPlace() : void
      {
         switch(this._state)
         {
            case 1:
               this.SetAnimationOnce2Loop(4,0);
               this._state = 11;
               break;
            case 2:
               this.SetAnimationOnce2Loop(4,0);
               this._state = 12;
               break;
            case 3:
               this.SetAnimationOnce2Loop(6,0);
               this._state = 13;
               break;
            case 4:
               this.SetAnimationOnce2Loop(8,0);
               this._state = 14;
         }
      }
      
      public function ClearFieldGridDefenseNoraml2(grid:a_3491) : Boolean
      {
         if(null != grid.m_stProtector)
         {
            grid.m_stProtector.m_iDieType = 2;
            grid.m_stProtector.a_3969(grid.m_stProtector.iLifeValue);
         }
         if(null != grid.m_stAttackFighter && !(grid.m_stAttackFighter is a_3924))
         {
            grid.m_stAttackFighter.m_iDieType = 2;
            grid.m_stAttackFighter.a_3969(grid.m_stAttackFighter.iLifeValue);
         }
         if(null != grid.m_stBoomDefense)
         {
            grid.m_stBoomDefense.m_iDieType = 2;
            grid.m_stBoomDefense.a_3969(grid.m_stBoomDefense.iLifeValue);
         }
         if(null != grid.m_stFlowerDefense)
         {
            grid.m_stFlowerDefense.m_iDieType = 2;
            grid.m_stFlowerDefense.a_3969(grid.m_stFlowerDefense.iLifeValue);
         }
         if(null != grid.m_stBaseAuxiliaryFighter)
         {
            grid.m_stBaseAuxiliaryFighter.m_iDieType = 2;
            grid.m_stBaseAuxiliaryFighter.a_3969(grid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         if(grid.HasNewSlot())
         {
            grid.DamageNewSlot(true,0,true,0,2);
         }
         if(null != grid.m_stTrayDefense)
         {
            grid.m_stTrayDefense.m_iDieType = 2;
            grid.m_stTrayDefense.a_3969(grid.m_stTrayDefense.iLifeValue);
         }
         if(null != grid.m_stBaseToolDefense)
         {
            grid.m_stBaseToolDefense.m_iDieType = 2;
            grid.m_stBaseToolDefense.a_3969(grid.m_stBaseToolDefense.iLifeValue);
         }
         return true;
      }
      
      public function OnStopperPlace() : void
      {
         if(this._state == 0)
         {
            this.ClearFieldGridDefenseNoraml2(this.m_stGrid);
            this.SetAnimationOnce2Loop(1,3);
            this._state = 10;
         }
      }
      
      private function UpdateCheck() : void
      {
         if(a_1273 == 47 || a_1273 == 64 || a_1273 == 77)
         {
            this.CreateEffect(this._state - 10);
            this.SwtichState(0);
         }
         else if(a_1273 == 23)
         {
            this.SwtichState(1);
         }
         if(this._state < 11)
         {
            ++this._runTick;
            if(this._runTick > 50 && (this._state == 1 || this._state == 2 || this._state == 3))
            {
               this.SwtichState(this._state + 1);
            }
         }
      }
      
      public function a_3940() : Boolean
      {
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      public function play() : void
      {
         this.m_stTiemr.start();
      }
      
      public function stop() : void
      {
         this.m_stTiemr.stop();
         this.a_3940();
      }
      
      private function a_4003(a_4730:Event) : void
      {
         this.UpdateCheck();
         nextFrame();
         if(a_1278 != null || a_1273 == 83)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
      }
      
      public function SetAnimationOnce2Loop(once:int, loop:int) : void
      {
         a_1275 = loop;
         gotoAndStop((a_1276[once] as FrameLabel).frame);
      }
   }
}

