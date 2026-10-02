package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.IsLand.ListeningMouse
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import flash.events.Event;
   
   public class IsLandSoundWaveBulletEffect extends BaseGameEffect
   {
      
      public var _grid:a_3491;
      
      public var _iState:int = 0;
      
      public var _tick:int = 0;
      
      public var _lastBoundGridX:int = -1;
      
      public function IsLandSoundWaveBulletEffect()
      {
         super();
      }
      
      public function InitData(grid:a_3491) : void
      {
         this._grid = grid;
         this._iState = 0;
         this._tick = 0;
         this._lastBoundGridX = grid.m_iXGridNo;
         a_1283 = false;
         SetAnimation(0);
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         var iLastNoX:Number = NaN;
         var iNoX:Number = NaN;
         super.a_4109(a_4730);
         ++this._tick;
         if(this._tick >= 25 * 10)
         {
            this.SetDead();
            return;
         }
         if(this._iState != 0)
         {
            return;
         }
         iLastNoX = x / 60;
         if(!a_1283)
         {
            x -= 6;
         }
         else
         {
            x += 6;
         }
         iNoX = x / 60;
         var iNow:Number = Math.floor(iNoX) + 0.5;
         if(iNoX < 0)
         {
            iNoX = 0;
            x = 0;
            this.TriggerBound(iNoX);
         }
         else if(iNoX >= 9)
         {
            iNoX = 8;
            x = 540;
            this.TriggerBound(iNoX);
         }
         else if(a_1283)
         {
            if(iLastNoX < iNow && iNoX >= iNow && this._lastBoundGridX != Math.floor(iNoX))
            {
               this.AttackGrid(iNoX);
            }
         }
         else if(!a_1283)
         {
            if(iLastNoX > iNow && iNoX <= iNow && this._lastBoundGridX != Math.floor(iNoX))
            {
               this.AttackGrid(iNoX);
            }
         }
      }
      
      private function AttackGrid(iNoX:int) : void
      {
         var stMoveIntruder:a_4206 = null;
         this._lastBoundGridX = iNoX;
         var grid:a_3491 = this._grid.m_stCurrentBattbleFieldView.a_3438(iNoX,this._grid.m_iYGridNo);
         if(grid == null)
         {
            return;
         }
         if(grid.HasTag(40010))
         {
            grid.buffCom.AddBuff(20047,5);
            this.SetDead();
         }
         else if(BattleDestroyUtil.HasDefense2(grid))
         {
            BattleDestroyUtil.BurnFieldGridDefense2(grid,100);
            this.TriggerBound(iNoX);
         }
         var arrMoveIntruder:Array = grid.a_1511.slice();
         for each(stMoveIntruder in arrMoveIntruder)
         {
            if((0 == stMoveIntruder.iSpaceState || 1 == stMoveIntruder.iSpaceState) && !stMoveIntruder.isCannotSeeByFighter && !stMoveIntruder.tagCom.HasTag(40010))
            {
               if(stMoveIntruder.IsBossIntruder)
               {
                  stMoveIntruder.ReduceLife2(20000,[50002,50005]);
               }
               else
               {
                  stMoveIntruder.ReduceLife2(4000,[50002,50005]);
               }
               stMoveIntruder.a_4208(b_182.a_432,1);
            }
         }
      }
      
      private function SetDead() : void
      {
         this._iState = 1;
         this.a_3940();
      }
      
      private function TriggerBound(iNoX:int) : void
      {
         a_1283 = !a_1283;
         this._lastBoundGridX = iNoX;
      }
      
      override public function a_3940() : Boolean
      {
         return super.a_3940();
      }
   }
}

