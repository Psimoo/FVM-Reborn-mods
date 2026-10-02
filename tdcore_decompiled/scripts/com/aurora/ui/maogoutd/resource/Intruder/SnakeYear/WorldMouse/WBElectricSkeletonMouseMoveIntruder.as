package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldMouse
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   
   public class WBElectricSkeletonMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 1500;
      
      private static const MAX_INJURED_LIFE:int = 750;
      
      private static const ONE_GRID_SPEED:int = 3;
      
      public function WBElectricSkeletonMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBElectricSkeletonMouseMoveIntruder) as WBElectricSkeletonMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBElectricSkeletonMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (ONE_GRID_SPEED * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         a_1279 = -width * 0.2;
         a_1272 = 0;
         a_1462 = false;
         a_1377 = 500;
         this.SetAnimation2(1);
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > MAX_INJURED_LIFE)
         {
            if(a_1475)
            {
               if(a_1275 != 4)
               {
                  a_1275 = 4;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
               }
            }
            else if(a_1470 < 1)
            {
               if(a_1275 != 2)
               {
                  a_1275 = 2;
                  gotoAndStop((a_1276[2] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 0)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(a_1475)
            {
               if(a_1275 != 5)
               {
                  a_1275 = 5;
                  gotoAndStop((a_1276[5] as FrameLabel).frame);
               }
            }
            else if(a_1470 < 1)
            {
               if(a_1275 != 3)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
            a_3419();
         }
         if(a_1339 > 0)
         {
            if(a_1475)
            {
               if(a_1339 > MAX_INJURED_LIFE)
               {
                  this.SetAnimation2(7);
               }
               else if(a_1339 > 0 && a_1275 == 7)
               {
                  this.SetAnimationOnce2Loop2(8,9);
               }
               else
               {
                  this.SetAnimation2(9);
               }
            }
            else if(a_1339 > MAX_INJURED_LIFE)
            {
               if(a_1470 < 1)
               {
                  this.SetAnimation2(4);
               }
               else
               {
                  this.SetAnimation2(1);
               }
            }
            else if(a_1339 > 0 && a_1275 == 4 && a_1470 < 1)
            {
               this.SetAnimationOnce2Loop2(5,6);
            }
            else if(a_1339 > 0 && a_1275 == 1 && a_1470 >= 1)
            {
               this.SetAnimationOnce2Loop2(2,3);
            }
            else if(a_1470 < 1)
            {
               this.SetAnimation2(6);
            }
            else
            {
               this.SetAnimation2(3);
            }
         }
         else
         {
            this.SetAnimation2(10);
            a_3419();
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         super.a_4210();
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         super.a_4216(iCurrentTime);
         var iXGridNo:int = int(x / a_3491.a_1080);
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - iXGridNo;
         }
         if(iXGridNo <= 1 || iXGridNo >= BattleFieldView.a_1011)
         {
            SetCannotSeeByFighter(false);
         }
         else if(a_1475 || a_1470 < 1)
         {
            SetCannotSeeByFighter(false);
         }
         else
         {
            SetCannotSeeByFighter(true);
         }
         return true;
      }
      
      public function InDamage() : Boolean
      {
         return a_1339 > 0 && a_1339 < MAX_INJURED_LIFE;
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
      
      public function SetAnimationOnce2Loop2(onceAnimIdx:int, loopAnimIdx:int) : void
      {
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
   }
}

