package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldMouse
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   
   public class WBGiantMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 10800;
      
      private static const MAX_INJURED_LIFE:int = 5400;
      
      private static const ONE_GRID_SPEED:int = 6;
      
      public function WBGiantMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBGiantMouseMoveIntruder) as WBGiantMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBGiantMouseMoveIntruderMovie;
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
         a_1279 = -width * 0.3;
         a_1377 = 0;
         a_1476 = 50;
         a_1477 = 0;
         BoomIsReduceLife = true;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(a_1475)
            {
               if(iLifeValue > MAX_INJURED_LIFE)
               {
                  this.SetAnimation2(3);
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
            else if(iLifeValue > MAX_INJURED_LIFE)
            {
               this.SetAnimation2(0);
            }
            else if(a_1275 == 0)
            {
               this.SetAnimationOnce2Loop2(1,2);
            }
            else
            {
               this.SetAnimation2(2);
            }
         }
         else if(a_1339 <= 0)
         {
            this.SetAnimation2(6);
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         a_3419();
         return true;
      }
      
      override public function a_4211(iCutLifeValue:int) : Boolean
      {
         if(iCutLifeValue > 200)
         {
            iCutLifeValue = 200;
         }
         a_1339 -= iCutLifeValue;
         if(a_1339 <= 0)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            a_3940();
         }
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         a_3969(900);
         if(a_1339 <= 0)
         {
            a_4212();
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var numOrigXPos:Number = x;
         super.a_4216(iCurrentTime);
         if(m_stCurrentFieldGrid == null)
         {
            return false;
         }
         if(Boolean(m_stCurrentFieldGrid && null != m_stCurrentFieldGrid.m_stBoomDefense && !m_stCurrentFieldGrid.m_stBoomDefense.isCanBeEaten) && Boolean(iCurrentTime >= a_1477 + a_1476 * (1 / a_1470)) && !a_1464)
         {
            a_1472 = iCurrentTime + 22;
            a_1477 = iCurrentTime;
            a_1475 = true;
            a_4215(m_stCurrentFieldGrid.m_stBoomDefense);
            this.ResetMovieStatus();
         }
         if(m_stCurrentFieldGrid == null)
         {
            return false;
         }
         if(a_1473 <= 0 && a_1474 <= 0 && iCurrentTime == a_1477 + 22)
         {
            GiantJumpSplashDamageOnGrid(900);
         }
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
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

