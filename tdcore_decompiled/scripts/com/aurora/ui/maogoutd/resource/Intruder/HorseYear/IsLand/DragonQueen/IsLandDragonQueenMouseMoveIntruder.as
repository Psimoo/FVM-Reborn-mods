package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.IsLand.DragonQueen
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.Base.BaseGameMoveIntruder;
   
   public class IsLandDragonQueenMouseMoveIntruder extends BaseGameMoveIntruder
   {
      
      private var a_1537:int;
      
      public function IsLandDragonQueenMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : IsLandDragonQueenMouseMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(IsLandDragonQueenMouseMoveIntruder,IsLandDragonQueenMouseMoveIntruderMovie) as IsLandDragonQueenMouseMoveIntruder;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         MAX_LIFE = 1500;
         INJURED_LIFE = 750;
         ONE_GRID_SPEED = 6;
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1466 = 3000;
         SetAnimation(0,0);
         this.a_1537 = 0;
         a_1377 = 10;
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(a_1466 > 0)
         {
            a_1466 = 0;
            this.ResetMovieStatus();
         }
         else
         {
            a_3969(900);
         }
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(a_1475)
            {
               if(a_1466 > 0)
               {
                  SetAnimation(1,6);
               }
               else if(a_1466 != -100)
               {
                  SetAnimationOnce2Loop(2,4,7,9);
                  a_1466 = -100;
               }
               else
               {
                  SetAnimation(4,9);
               }
            }
            else if(a_1466 > 0)
            {
               SetAnimation(0,5);
            }
            else if(a_1466 != -100)
            {
               SetAnimationOnce2Loop(2,3,7,8);
               a_1466 = -100;
            }
            else
            {
               SetAnimation(3,8);
            }
         }
         else
         {
            SetDeadAnim(10);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(a_1466 <= 0)
         {
            SetSpeed(3);
            a_1377 = 50;
         }
         if(a_1273 >= 17 && a_1273 <= 25 || a_1273 >= 54 && a_1273 <= 62)
         {
            if(a_1285 > 0)
            {
               if(a_1285 > this.a_1537)
               {
                  this.a_1537 = a_1285;
               }
               a_1285 = 0;
            }
            return true;
         }
         if(this.a_1537 > 0)
         {
            a_1285 = this.a_1537;
            this.a_1537 = 0;
         }
         super.a_4216(iCurrentTime);
         return true;
      }
   }
}

