package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.GreedyDemon
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class WBGreedyActor2MoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 2000000;
      
      private static const MAX_INJURED_LIFE:int = 30000;
      
      private static const ONE_GRID_SPEED:Number = 1.5;
      
      public var iTargetNoY:int = 0;
      
      private var m_iState:int = 0;
      
      public function WBGreedyActor2MoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : WBGreedyActor2MoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(WBGreedyActor2MoveIntruder) as WBGreedyActor2MoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBGreedyActor2MoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         this.SetSpeed(ONE_GRID_SPEED);
         a_1339 = MAX_LIFE;
         a_1279 = -25 - 9;
         m_iYDisplayCenterPos = -568;
         a_1272 = 0;
         a_1481 = false;
         a_1464 = true;
         a_1463 = true;
         this.m_iState = 0;
         this.SetAnimation(4,4);
         a_1465 = 3;
         AddTag(2);
         AddTag(3);
         this.iTargetNoY = 0;
         return true;
      }
      
      override public function get height() : Number
      {
         return 50;
      }
      
      public function CallMove() : void
      {
         this.SetSpeed(0);
      }
      
      private function SetSpeed(oneGridSpeed:Number) : void
      {
         if(oneGridSpeed <= 0)
         {
            a_1350 = 0;
            return;
         }
         a_1350 = a_3491.a_1080 / (20 * oneGridSpeed);
         if(!a_1283)
         {
            a_1350 *= -1;
         }
      }
      
      public function CallBirth1() : void
      {
         a_1462 = true;
         this.m_iState = 1;
         if(x >= 240)
         {
            this.SetAnimation(4,10);
         }
         else
         {
            this.SetAnimation(5,11);
         }
      }
      
      public function CallBirth2() : void
      {
         a_1462 = false;
         this.m_iState = 2;
         this.SetAnimationOnce2Loop(0,1,6,7);
      }
      
      public function CallBirth3() : void
      {
         a_1462 = false;
         this.m_iState = 3;
         this.SetAnimationOnce2Loop(0,1,6,7);
      }
      
      public function CallBirth4() : void
      {
         a_1462 = true;
         this.m_iState = 4;
         if(x >= 240)
         {
            this.SetAnimation(4,10);
         }
         else
         {
            this.SetAnimation(5,11);
         }
      }
      
      public function CallChange() : void
      {
         this.SetAnimation(2,8);
      }
      
      public function CallDie() : void
      {
         this.m_iState = 10;
      }
      
      public function CallDie2() : void
      {
         this.m_iState = 11;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(a_1273 >= 13 && a_1273 <= 26)
            {
               this.SetAnimation(7,7);
            }
         }
         else
         {
            this.TryCallDie();
         }
         return true;
      }
      
      private function ChangeGrid(iXGridNo:int, iYGridNo:int) : void
      {
         var stNextFieldGrid:a_3491 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
         ChangeFieldGrid(stNextFieldGrid);
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         if(this.m_iState == 11)
         {
            y -= 12;
            iXGridNo = GetiNoX();
            iYGridNo = int(y / a_3491.a_1081);
            if(m_stCurrentFieldGrid.m_iXGridNo != iXGridNo || m_stCurrentFieldGrid.m_iYGridNo != iYGridNo)
            {
               if(iXGridNo >= 0 && iYGridNo >= 0)
               {
                  this.ChangeGrid(iXGridNo,iYGridNo);
               }
            }
            if(y <= -240)
            {
               this.DoDie();
               return true;
            }
         }
         if(iCurrentTime % 2 == 1)
         {
            if(this.m_iState == 2)
            {
               if(a_1273 == 144 || a_1273 == 40)
               {
                  this.ChangeGrid(7,this.iTargetNoY);
                  x = 7 * a_3491.a_1080 + 30;
                  y = this.iTargetNoY * a_3491.a_1081 + 32;
                  this.SetAnimationOnce2Loop(3,1,9,7);
               }
            }
            else if(this.m_iState == 1)
            {
               if(x >= 240)
               {
                  if(a_1273 == 104)
                  {
                     this.DoDie();
                  }
                  else if(a_1273 == 78)
                  {
                     this.SetAnimation(5,11);
                  }
               }
               else if(a_1273 == 104)
               {
                  this.SetAnimation(4,10);
               }
               else if(a_1273 == 78)
               {
                  this.DoDie();
               }
            }
            else if(this.m_iState == 4)
            {
               if(a_1273 == 104)
               {
                  this.SetAnimation(4,10);
               }
               else if(a_1273 == 78)
               {
                  this.SetAnimation(5,11);
               }
            }
            else if(this.m_iState == 10)
            {
               if(a_1273 == 104 || a_1273 == 78)
               {
                  this.DoDie();
               }
            }
         }
         return true;
      }
      
      private function DoDie() : void
      {
         if(m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         a_3940();
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function a_4210() : Boolean
      {
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(this.m_iState != 2 && this.m_iState != 3)
         {
            return true;
         }
         super.a_3969(iRduceLifeValue);
         this.TryCallDie();
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         if(this.m_iState != 2 && this.m_iState != 3)
         {
            return true;
         }
         super.a_4209(iRduceLifeValue);
         this.TryCallDie();
         return true;
      }
      
      override public function ReduceAllLife(iRduceLifeValue:int, bIsIgnoreArmor:Boolean = false, ishowHuijing:Boolean = false) : Boolean
      {
         if(this.m_iState != 2 && this.m_iState != 3)
         {
            return true;
         }
         super.ReduceAllLife(iRduceLifeValue,bIsIgnoreArmor,ishowHuijing);
         this.TryCallDie();
         return true;
      }
      
      private function TryCallDie() : void
      {
         if(a_1339 <= 0)
         {
            SetCannotSeeByFighter(true);
            this.CallDie2();
         }
      }
      
      public function SetAnimation(animIdx:int, damageAnimIdx:int = 0) : void
      {
         if(iLifeValue <= MAX_INJURED_LIFE)
         {
            animIdx = damageAnimIdx;
         }
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      public function SetAnimationOnce2Loop(onceAnimIdx:int, loopAnimIdx:int, damageOnceAnimIdx:int, damageLoopAnimIdx:int) : void
      {
         if(iLifeValue <= MAX_INJURED_LIFE)
         {
            a_1275 = damageLoopAnimIdx;
            gotoAndStop((a_1276[damageOnceAnimIdx] as FrameLabel).frame);
         }
         else
         {
            a_1275 = loopAnimIdx;
            gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         }
         a_3419();
      }
   }
}

