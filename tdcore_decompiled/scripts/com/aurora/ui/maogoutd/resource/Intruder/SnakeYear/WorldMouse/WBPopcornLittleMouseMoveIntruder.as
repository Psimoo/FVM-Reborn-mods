package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldMouse
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class WBPopcornLittleMouseMoveIntruder extends a_4206
   {
      
      public static var MAX_LIFE:int = 10000;
      
      private static const MAX_INJURED_LIFE:int = 600;
      
      private static const ONE_GRID_SPEED:int = 6;
      
      private var m_iFlyTime:int = 0;
      
      public function WBPopcornLittleMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBPopcornLittleMouseMoveIntruder) as WBPopcornLittleMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBPopcornLittleMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = 12;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         a_1279 = -width * 0.2 - 20;
         a_1272 = 0;
         a_1481 = false;
         a_1464 = true;
         this.m_iFlyTime = 20;
         this.SetAnimation2(0);
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(this.m_iFlyTime <= 0)
            {
               if(a_1475)
               {
                  if(iLifeValue > MAX_INJURED_LIFE)
                  {
                     this.SetAnimation2(5);
                  }
                  else if(a_1275 == 5)
                  {
                     this.SetAnimationOnce2Loop2(6,7);
                  }
                  else
                  {
                     this.SetAnimation2(7);
                  }
               }
               else if(iLifeValue > MAX_INJURED_LIFE)
               {
                  this.SetAnimation2(2);
               }
               else if(a_1275 == 2)
               {
                  this.SetAnimationOnce2Loop2(3,4);
               }
               else
               {
                  this.SetAnimation2(4);
               }
            }
         }
         else
         {
            this.SetAnimation2(8);
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
         var stNextFieldGrid:a_3491 = null;
         var iXGridNo:int = 0;
         var numOrigXPos:Number = NaN;
         if(!a_1460)
         {
            a_1460 = true;
         }
         if(this.m_iFlyTime > 0)
         {
            if(!a_1460)
            {
               a_1460 = true;
            }
            x += a_1350;
            iXGridNo = int(x / a_3491.a_1080);
            if(m_stCurrentFieldGrid != null && iXGridNo >= 0 && iXGridNo < BattleFieldView.a_1011 && m_stCurrentFieldGrid.m_iXGridNo != iXGridNo)
            {
               stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
               ChangeFieldGrid(stNextFieldGrid);
               if(stNextFieldGrid.m_stBaseLander != null)
               {
                  SetClarmLanderTime();
               }
            }
            --this.m_iFlyTime;
            if(this.m_iFlyTime > 14)
            {
               y -= 5;
            }
            else if(this.m_iFlyTime > 5)
            {
               y += 13;
            }
            if(this.m_iFlyTime == 5)
            {
               a_1350 = 0;
               this.SetAnimation2(1);
            }
            else if(this.m_iFlyTime == 0)
            {
               a_1481 = true;
               a_1464 = false;
               a_1350 = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
               if(!a_1283)
               {
                  a_1350 *= -1;
               }
               this.ResetMovieStatus();
            }
         }
         else
         {
            numOrigXPos = x;
            super.a_4216(iCurrentTime);
            SetGameMapModePicnicPosition(numOrigXPos);
         }
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(this.m_iFlyTime > 0)
         {
            return;
         }
         super.a_4208(iEffectType,iEffectTime,stBaseEffect);
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

