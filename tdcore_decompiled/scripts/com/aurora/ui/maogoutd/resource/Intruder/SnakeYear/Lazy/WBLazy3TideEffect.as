package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Lazy
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.events.Event;
   
   public class WBLazy3TideEffect extends BaseGameEffect
   {
      
      private var _iNoY:int = 0;
      
      private var _battleView:BattleFieldView;
      
      private var _runTick:int = 0;
      
      public function WBLazy3TideEffect()
      {
         super();
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         SetAnimationOnce2Loop(0,1);
         return true;
      }
      
      public function InitData(battleView:BattleFieldView, iNoY:int) : void
      {
         this._iNoY = iNoY;
         this._battleView = battleView;
         this._runTick = 0;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         ++this._runTick;
         if(this._runTick >= 5 && this._runTick <= 40)
         {
            x -= 12;
         }
         if(this._runTick == 1)
         {
            this.CreateLiquid(8);
         }
         else if(this._runTick == 8)
         {
            this.CreateLiquid(7);
         }
         else if(this._runTick == 13)
         {
            this.CreateLiquid(6);
         }
         else if(this._runTick == 18)
         {
            this.CreateLiquid(5);
         }
         else if(this._runTick == 23)
         {
            this.CreateLiquid(4);
         }
         else if(this._runTick == 28)
         {
            this.CreateLiquid(3);
         }
         else if(this._runTick == 33)
         {
            this.CreateLiquid(2);
         }
         else if(this._runTick == 35)
         {
            SetAnimation(2,true);
         }
         super.a_4109(a_4730);
      }
      
      private function CreateLiquid(iNoX:int) : void
      {
         WBLazyUtil.CreateLiquid(this._battleView,iNoX,this._iNoY,30);
      }
   }
}

