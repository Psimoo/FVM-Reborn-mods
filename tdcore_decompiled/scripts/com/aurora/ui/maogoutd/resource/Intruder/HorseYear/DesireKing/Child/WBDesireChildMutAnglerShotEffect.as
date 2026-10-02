package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.Child
{
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.events.Event;
   
   public class WBDesireChildMutAnglerShotEffect extends BaseGameEffect
   {
      
      private var _grid:a_3491;
      
      private var _iLastNoX:int = 0;
      
      public function WBDesireChildMutAnglerShotEffect()
      {
         super();
      }
      
      public function InitData(grid:a_3491) : void
      {
         this._grid = grid;
         this._iLastNoX = -1;
         SetAnimation(0);
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         super.a_4109(a_4730);
         x -= 15;
         var iXGridNo:int = int(x / a_3491.a_1080);
         var iYGridNo:int = this._grid.m_iYGridNo;
         if(iXGridNo != this._iLastNoX)
         {
            this._iLastNoX = iXGridNo;
            BattleDestroyUtil.DamageOneGrid(this._grid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo),10);
         }
         if(x <= -30)
         {
            a_3940();
         }
      }
   }
}

