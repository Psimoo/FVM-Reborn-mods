package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.P2
{
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.Util.BattleEffectUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.WBDesireKingRainbowNoteEffect;
   import com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.WBDesireKingRainbowNoteMovie;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.events.Event;
   
   public class WBDesireKingP2BellEffect extends BaseGameEffect
   {
      
      private var _battleView:BattleFieldView;
      
      private var _iState:int = 0;
      
      private var _tick:int = 0;
      
      private var _iSpeed:Number = 0;
      
      public function WBDesireKingP2BellEffect()
      {
         super();
      }
      
      public function InitData(battleView:BattleFieldView) : void
      {
         this._iState = -1;
         this._tick = 0;
         this._iSpeed = 0;
         this._battleView = battleView;
         this.ChangeState(0);
         a_1789.getInstance().addEventListener("ClearMouseHole",this.OnClearMouseHole);
      }
      
      private function OnClearMouseHole(stDataEvent:a_1778) : void
      {
         var iNoX:int = int(stDataEvent.dataObject[0]);
         var iNoY:int = int(stDataEvent.dataObject[1]);
         var iNoX1:int = x / 60;
         var iNoY1:int = y / 64;
         if(iNoX != iNoX1 || iNoY != iNoY1)
         {
            return;
         }
         var grid:a_3491 = this._battleView.a_3438(iNoX,iNoY);
         if(grid != null && this._iState != 0 && this._iState != 4)
         {
            this.ChangeState(4);
         }
      }
      
      override public function a_3940() : Boolean
      {
         a_1789.getInstance().removeEventListener("ClearMouseHole",this.OnClearMouseHole);
         return super.a_3940();
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         super.a_4109(a_4730);
         x += this._iSpeed;
         ++this._tick;
         if(this._iState == 0 || this._iState == 3)
         {
            if(this._tick == 50)
            {
               this.ChangeState(this._iState + 1);
            }
         }
         else if(this._iState == 2)
         {
            if(this._tick == 6)
            {
               this.ChangeState(this._iState + 1);
            }
         }
         else if(this._iState == 1)
         {
            if(this._tick == 64)
            {
               this.ChangeState(this._iState + 1);
            }
         }
      }
      
      private function ChangeState(state:int) : void
      {
         if(state == this._iState)
         {
            return;
         }
         this._iState = state;
         this._tick = 0;
         switch(state)
         {
            case 0:
               SetAnimation(0);
               this.CreateRainbows();
               break;
            case 1:
               this._iSpeed = 3.75;
               SetAnimation(2);
               break;
            case 2:
               this._iSpeed = 0;
               break;
            case 3:
               SetAnimation(0);
               this.CreateRainbows();
               break;
            case 4:
               SetAnimation(3,true);
         }
      }
      
      private function CreateRainbows() : void
      {
         var iNoX:int = x / 60;
         var iNoY:int = y / 64;
         this.CreateRainbow(iNoX,iNoY - 1);
         this.CreateRainbow(iNoX - 1,iNoY);
         this.CreateRainbow(iNoX + 1,iNoY);
         this.CreateRainbow(iNoX,iNoY + 1);
      }
      
      private function CreateRainbow(iNoX:int, iNoY:int) : void
      {
         var grid:a_3491 = this._battleView.a_3438(iNoX,iNoY);
         if(grid == null)
         {
            return;
         }
         var effect:WBDesireKingRainbowNoteEffect = BattleEffectUtil.CreateGameEffect(WBDesireKingRainbowNoteEffect,WBDesireKingRainbowNoteMovie,grid) as WBDesireKingRainbowNoteEffect;
         effect.InitData(grid);
      }
   }
}

