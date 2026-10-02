package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldMouse
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class WBYoyoMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 3200;
      
      private static const MAX_INJURED_LIFE:int = 1600;
      
      private static const ONE_GRID_SPEED:int = 5;
      
      private var m_bCatFearDead:Boolean = false;
      
      private var m_bMoveSize:int = 0;
      
      private var m_iState:int = 0;
      
      public function WBYoyoMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBYoyoMouseMoveIntruder) as WBYoyoMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBYoyoMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
         if(a_1283 < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         a_1279 = -width * 0.2;
         a_1272 = 0;
         this.m_bMoveSize = 0;
         this.m_iState = 0;
         this.m_bCatFearDead = false;
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         this.TriggerYoYo();
         return true;
      }
      
      private function TriggerYoYo() : void
      {
         if(this.m_iState == 0 && m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.m_iXGridNo > 1)
         {
            this.m_iState = 2;
            a_1464 = true;
            a_1475 = false;
            this.SetAnimationOnce2Loop(4,5,3);
            this.m_bMoveSize = 0;
         }
      }
      
      private function BackYoYo() : void
      {
         if(this.m_iState == 1)
         {
            this.m_iState = 3;
            if(this.InDamage())
            {
               this.SetAnimationOnce2Loop2(9,1);
            }
            else
            {
               this.SetAnimationOnce2Loop2(6,0);
            }
            this.m_bMoveSize = 0;
         }
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(this.m_iState == 0)
            {
               if(a_1475)
               {
                  this.SetAnimation(2,1);
               }
               else
               {
                  this.SetAnimation(0,1);
               }
            }
            else if(this.m_iState == 1)
            {
               this.SetAnimation(5,3);
            }
         }
         else
         {
            if(this.m_bCatFearDead)
            {
               this.SetAnimation(10);
            }
            else
            {
               this.SetAnimation(11);
            }
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         return true;
      }
      
      override public function ReduceLife2(iRduceLifeValue:int, damageParams:Array = null) : Boolean
      {
         if(damageParams.indexOf(106) != -1)
         {
            a_1339 = 0;
            this.m_bCatFearDead = true;
            this.ResetMovieStatus();
            return true;
         }
         return super.ReduceLife2(iRduceLifeValue,damageParams);
      }
      
      override public function a_4212() : Boolean
      {
         if(this.m_iState != 0)
         {
            return true;
         }
         super.a_4212();
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(this.m_iState != 0)
         {
            return true;
         }
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         if(this.m_iState != 0)
         {
            return true;
         }
         super.a_4209(iRduceLifeValue);
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         a_1339 = 0;
         if(m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         a_3940();
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(this.m_iState != 0)
         {
            return;
         }
         super.a_4208(iEffectType,iEffectTime,stBaseEffect);
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var numOrigXPos:Number = NaN;
         numOrigXPos = x;
         super.a_4216(iCurrentTime);
         if(m_stCurrentFieldGrid != null)
         {
            if(m_stCurrentFieldGrid.m_iXGridNo <= 1)
            {
               this.BackYoYo();
            }
            if(a_1273 == 29 || a_1273 == 43)
            {
               this.m_iState = 1;
            }
            if(a_1273 == 38 || a_1273 == 52)
            {
               this.m_iState = 0;
            }
            if(this.m_iState == 0)
            {
               a_1464 = false;
               a_1481 = true;
            }
            else
            {
               a_1464 = true;
               a_1481 = false;
            }
            if(this.m_iState == 0)
            {
               a_1350 = a_3491.a_1080 / (20 * 5);
            }
            else if(this.m_iState == 1)
            {
               a_1350 = a_3491.a_1080 / (20 * 0.5);
               ClearFieldGridDefenseCard(m_stCurrentFieldGrid);
            }
            else
            {
               a_1350 = 0;
            }
            if(this.m_iState == 1)
            {
               this.m_bMoveSize += numOrigXPos - x;
               if(this.m_bMoveSize >= 180)
               {
                  this.BackYoYo();
               }
            }
            if(!a_1283)
            {
               a_1350 *= -1;
            }
         }
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

