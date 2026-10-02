package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.P2
{
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.events.Event;
   
   public class WBDesireKingP2GroundSpurEffect extends BaseGameEffect
   {
      
      public var _grid:a_3491;
      
      public var _tick:int = 0;
      
      public function WBDesireKingP2GroundSpurEffect()
      {
         super();
      }
      
      public function InitData(grid:a_3491) : void
      {
         this._grid = grid;
         this._tick = 0;
         SetAnimationOnce2Loop(0,1);
         BattleDestroyUtil.ClearOneGridIgnoreFangYu(grid);
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         super.a_4109(a_4730);
         ++this._tick;
         if(this._tick == 15)
         {
            SetAnimation(2,true);
         }
      }
   }
}

