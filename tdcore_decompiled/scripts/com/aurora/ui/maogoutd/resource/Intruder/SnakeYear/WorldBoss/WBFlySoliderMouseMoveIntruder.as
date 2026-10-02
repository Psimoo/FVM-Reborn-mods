package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldBoss
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   
   public class WBFlySoliderMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 90000;
      
      private static const MAX_INJURED_LIFE:int = 30000;
      
      private static const ONE_GRID_SPEED:int = 4;
      
      private var m_iRemainTick:int = 0;
      
      public function WBFlySoliderMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : WBFlySoliderMouseMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(WBFlySoliderMouseMoveIntruder) as WBFlySoliderMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBFlySoliderMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = 0;
         a_1339 = MAX_LIFE;
         a_1279 = -width * 0.2;
         m_iYDisplayCenterPos = -25;
         this.m_iRemainTick = 22;
         a_1272 = 0;
         a_1465 = 3;
         this.SetAnimationOnce2Loop2(0,1);
         if(a_1283)
         {
            a_1463 = true;
         }
         else
         {
            a_1463 = false;
         }
         BoomIsReduceLife = true;
         return true;
      }
      
      override public function a_2062() : void
      {
         if(a_1283)
         {
            return;
         }
         a_1088.a_2062(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.iTimeIntervalNum,m_stCurrentFieldGrid.m_iYGridNo);
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(this.m_iRemainTick <= 0)
            {
               if(a_1475)
               {
                  this.SetAnimation(2,2);
               }
               else
               {
                  this.SetAnimation(1,2);
               }
            }
         }
         else
         {
            this.SetAnimation(5);
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         return true;
      }
      
      override public function a_4214() : Boolean
      {
         if(this.m_iRemainTick <= 0)
         {
            this.setAppearToGrid(Math.min(BattleFieldView.a_1011 - 1,m_stCurrentFieldGrid.m_iXGridNo + 3),m_stCurrentFieldGrid.m_iYGridNo);
            a_3969(30000);
         }
         return true;
      }
      
      protected function setAppearToGrid(iXGridNo:int, iYGridNo:int) : void
      {
         var stNextFieldGrid:a_3491 = null;
         stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         this.x = a_3491.a_1080 * iXGridNo;
         this.y = a_3491.a_1081 * iYGridNo;
         ChangeFieldGrid(stNextFieldGrid);
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var numOrigXPos:Number = x;
         if(this.m_iRemainTick > 0)
         {
            --this.m_iRemainTick;
            if(this.m_iRemainTick == 0)
            {
               a_1350 = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
               if(!a_1283)
               {
                  a_1350 *= -1;
               }
               this.m_iRemainTick = -1;
            }
         }
         super.a_4216(iCurrentTime);
         SetGameMapModePicnicPosition(numOrigXPos);
         return true;
      }
      
      public function InDamage() : Boolean
      {
         return a_1339 > 0 && a_1339 < MAX_INJURED_LIFE;
      }
      
      public function SetAnimation(animIdx:int, addIdx:int = 0) : void
      {
         if(this.InDamage())
         {
            animIdx += addIdx;
         }
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      override protected function IsReveredGrid() : Boolean
      {
         return false;
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
      
      public function SetAnimationOnce2Loop(onceAnimIdx:int, loopAnimIdx:int, addIdx:int = 0) : void
      {
         if(this.InDamage())
         {
            onceAnimIdx += addIdx;
            loopAnimIdx += addIdx;
         }
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
      
      public function SetAnimationOnce2Loop2(onceAnimIdx:int, loopAnimIdx:int) : void
      {
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
   }
}

