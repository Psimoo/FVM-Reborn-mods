package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Lazy
{
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.events.Event;
   
   public class WBLazy3LightUpEffect extends BaseGameEffect
   {
      
      public var targetGrid:a_3491;
      
      public function WBLazy3LightUpEffect()
      {
         super();
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         var iNoX:int = this.targetGrid.m_iXGridNo + 1;
         var iNoY:int = this.targetGrid.m_iYGridNo;
         if(a_1273 == 2)
         {
            this.ClearGrid(iNoX,iNoY);
         }
         else if(a_1273 == 4)
         {
            this.ClearGrid(iNoX - 1,iNoY - 1);
         }
         else if(a_1273 == 6)
         {
            this.ClearGrid(iNoX - 2,iNoY - 2);
         }
         super.a_4109(a_4730);
      }
      
      private function ClearGrid(iNoX:int, iNoY:int) : void
      {
         if(this.targetGrid == null)
         {
            return;
         }
         BattleDestroyUtil.ClearOneGrid(this.targetGrid.m_stCurrentBattbleFieldView.a_3438(iNoX,iNoY));
      }
   }
}

