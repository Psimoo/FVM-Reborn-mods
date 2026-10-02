package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldMouse
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   
   public class WBHelmetMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 2650;
      
      private static const MAX_INJURED_LIFE:int = 1900;
      
      private static const MAX_INJURED_LIFE2:int = 1300;
      
      private static const MAX_INJURED_LIFE3:int = 650;
      
      private static const ONE_GRID_SPEED:int = 6;
      
      public function WBHelmetMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBHelmetMouseMoveIntruder) as WBHelmetMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBHelmetMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         a_1279 = -width * 0.2 - 15;
         a_1272 = 0;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(a_1475)
            {
               if(a_1339 >= MAX_INJURED_LIFE)
               {
                  this.SetAnimation2(6);
               }
               else if(a_1339 >= MAX_INJURED_LIFE2)
               {
                  this.SetAnimation2(7);
               }
               else if(a_1339 >= MAX_INJURED_LIFE3)
               {
                  if(a_1275 == 7)
                  {
                     this.SetAnimationOnce2Loop2(8,9);
                  }
                  else
                  {
                     this.SetAnimation2(9);
                  }
               }
               else if(a_1275 == 9)
               {
                  this.SetAnimationOnce2Loop2(10,11);
               }
               else
               {
                  this.SetAnimation2(11);
               }
            }
            else if(a_1339 >= MAX_INJURED_LIFE)
            {
               this.SetAnimation2(0);
            }
            else if(a_1339 >= MAX_INJURED_LIFE2)
            {
               this.SetAnimation2(1);
            }
            else if(a_1339 >= MAX_INJURED_LIFE3)
            {
               if(a_1275 == 1)
               {
                  this.SetAnimationOnce2Loop2(2,3);
               }
               else
               {
                  this.SetAnimation2(3);
               }
            }
            else if(a_1275 == 3)
            {
               this.SetAnimationOnce2Loop2(4,5);
            }
            else
            {
               this.SetAnimation2(5);
            }
         }
         else
         {
            this.SetAnimation2(12);
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var numOrigXPos:Number = x;
         super.a_4216(iCurrentTime);
         SetGameMapModePicnicPosition(numOrigXPos);
         return true;
      }
      
      public function SetAnimationOnce2Loop2(onceAnimIdx:int, loopAnimIdx:int) : void
      {
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
      
      public function SetAnimation2(animIdx:int) : void
      {
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
   }
}

