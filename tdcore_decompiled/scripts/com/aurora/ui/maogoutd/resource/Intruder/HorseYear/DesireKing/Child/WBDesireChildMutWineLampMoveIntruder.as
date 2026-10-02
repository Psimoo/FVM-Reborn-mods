package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.Child
{
   import a_4728.a_1778;
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class WBDesireChildMutWineLampMoveIntruder extends WBVariationCardMoveIntruder
   {
      
      private var _bornFireTick:int = 0;
      
      private var _attackTime:int = 0;
      
      private var _waitingTick:int = 0;
      
      public function WBDesireChildMutWineLampMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : WBVariationCardMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(WBDesireChildMutWineLampMoveIntruder,WBDesireChildMutWineLampMovie) as WBDesireChildMutWineLampMoveIntruder;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         SetAnimationOnce2Loop(0,3,0,3);
         this._attackTime = 0;
         this._bornFireTick = 0;
         this._waitingTick = -1;
         return true;
      }
      
      private function ReduceEnergy(value:int) : void
      {
         var stDataEvent:a_1778 = new a_1778("ReduceEnergy");
         stDataEvent.dataObject = value;
         if(root)
         {
            root.dispatchEvent(stDataEvent);
         }
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         super.a_4216(iCurrentTime);
         if(m_stCurrentFieldGrid == null)
         {
            return true;
         }
         if(iCurrentTime % 2 == 1)
         {
            return true;
         }
         if(this._waitingTick == -1)
         {
            if(a_1273 == 31)
            {
               ++this._bornFireTick;
               this.ReduceEnergy(300);
            }
            else if(a_1273 == 63)
            {
               ++this._bornFireTick;
               this.ReduceEnergy(600);
            }
            else if((a_1273 == 34 || a_1273 == 70) && this._bornFireTick == 4)
            {
               ++this._attackTime;
               this._bornFireTick = 0;
               this._waitingTick = 0;
               if(this._attackTime <= 2)
               {
                  SetAnimation(1,1);
               }
               else
               {
                  SetAnimation(5,5);
               }
            }
         }
         else
         {
            ++this._waitingTick;
            if(this._waitingTick == 60)
            {
               if(this._attackTime < 2)
               {
                  this._waitingTick = -1;
                  SetAnimation(3,3);
               }
               else if(this._attackTime == 2)
               {
                  this._bornFireTick = 0;
                  this._waitingTick = 0;
                  ++this._attackTime;
                  SetAnimationOnce2Loop(4,5,4,5);
               }
               else
               {
                  this._waitingTick = -1;
                  SetAnimation(7,7);
               }
            }
         }
         return true;
      }
   }
}

