package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Lazy
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.events.Event;
   
   public class WBLazy3StarEffect extends BaseGameEffect
   {
      
      private var _iNoY:int = 0;
      
      private var _battleView:BattleFieldView;
      
      public function WBLazy3StarEffect()
      {
         super();
      }
      
      public function InitData(battleView:BattleFieldView, iNoY:int) : void
      {
         this._iNoY = iNoY;
         this._battleView = battleView;
         SetAnimation(0,true);
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         if(a_1273 == 4)
         {
            this.SleepGrid(7);
         }
         else if(a_1273 == 5)
         {
            this.SleepGrid(6);
         }
         else if(a_1273 == 6)
         {
            this.SleepGrid(5);
         }
         else if(a_1273 == 7)
         {
            this.SleepGrid(4);
         }
         else if(a_1273 == 8)
         {
            this.SleepGrid(3);
         }
         else if(a_1273 == 9)
         {
            this.SleepGrid(2);
         }
         else if(a_1273 == 10)
         {
            this.SleepGrid(1);
         }
         else if(a_1273 == 11)
         {
            this.SleepGrid(0);
         }
         super.a_4109(a_4730);
      }
      
      private function SleepGrid(iNoX:int) : void
      {
         this.SleepCard(iNoX,this._iNoY);
      }
      
      private function SleepCard(iNoX:int, iNoY:int) : void
      {
         var stTempFieldGrid:a_3491 = this._battleView.a_3438(iNoX,iNoY);
         if(Boolean(stTempFieldGrid) && null != stTempFieldGrid.m_stAttackFighter)
         {
            WBLazyUtil.SleepByDeep(stTempFieldGrid.m_stAttackFighter,60 * 20);
         }
      }
   }
}

