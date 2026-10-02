package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing
{
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.events.Event;
   
   public class WBDesireKingCandleEffect extends BaseGameEffect
   {
      
      public var _grid:a_3491;
      
      public var _iState:int = 0;
      
      public var _tick:int = 0;
      
      public var _changeTick:int = 0;
      
      public var _level:int = 0;
      
      public function WBDesireKingCandleEffect()
      {
         super();
      }
      
      public function InitData(grid:a_3491, m_stRandomSeed:RandomSeed, level:int) : void
      {
         this._grid = grid;
         this._iState = -1;
         this._tick = 0;
         this._changeTick = 0;
         this._level = level;
         WBDesireKingCandleMgr.getInstance().Add(this,m_stRandomSeed,grid.m_stCurrentBattbleFieldView);
         if(level == 2)
         {
            BattleDestroyUtil.ClearOneGridIgnoreFangYu(grid);
         }
         a_1789.getInstance().addEventListener("ClearMouseHole",this.OnClearMouseHole);
      }
      
      private function OnClearMouseHole(stDataEvent:a_1778) : void
      {
         var iNoX:int = int(stDataEvent.dataObject[0]);
         var iNoY:int = int(stDataEvent.dataObject[1]);
         if(iNoX != this._grid.m_iXGridNo || iNoY != this._grid.m_iYGridNo)
         {
            return;
         }
         if(this._iState == 0)
         {
            this._iState = 2;
            this._changeTick = this._tick;
            SetAnimationOnce2Loop(3,4);
         }
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         super.a_4109(a_4730);
         ++this._tick;
         WBDesireKingCandleMgr.getInstance().a_3897(this._tick);
      }
      
      public function Change2Purple() : void
      {
         this._iState = 0;
         this._changeTick = this._tick;
         SetAnimation(1);
      }
      
      public function Change2Black() : void
      {
         this._iState = 1;
         this._changeTick = this._tick;
         SetAnimation(2);
      }
      
      override public function a_3940() : Boolean
      {
         a_1789.getInstance().removeEventListener("ClearMouseHole",this.OnClearMouseHole);
         WBDesireKingCandleMgr.getInstance().Remove(this);
         return super.a_3940();
      }
      
      public function RealRealease() : void
      {
         super.a_3940();
      }
   }
}

