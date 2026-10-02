package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.Child
{
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.events.Event;
   
   public class WBDesireChildMutLobShotEffect extends BaseGameEffect
   {
      
      private var _grid:a_3491;
      
      public function WBDesireChildMutLobShotEffect()
      {
         super();
      }
      
      public function InitData(grid:a_3491) : void
      {
         this._grid = grid;
         SetAnimation(0,true);
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         var iNoX:int = 0;
         var iNoY:int = 0;
         var i:int = 0;
         var j:int = 0;
         super.a_4109(a_4730);
         if(a_1273 == 7)
         {
            iNoX = this._grid.m_iXGridNo;
            iNoY = this._grid.m_iYGridNo;
            for(i = -1; i <= 1; i++)
            {
               for(j = -1; j <= 1; j++)
               {
                  BattleDestroyUtil.ClearOneGrid(this._grid.m_stCurrentBattbleFieldView.a_3438(iNoX + i,iNoY + j));
               }
            }
         }
      }
   }
}

