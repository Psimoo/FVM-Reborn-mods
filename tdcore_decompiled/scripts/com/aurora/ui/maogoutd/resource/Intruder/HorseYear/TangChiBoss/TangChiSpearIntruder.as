package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.TangChiBoss
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   
   public class TangChiSpearIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 9000000;
      
      private static const MAX_INJURED_LIFE:int = 3000000;
      
      private static const ONE_GRID_SPEED:int = 0;
      
      public function TangChiSpearIntruder()
      {
         super();
      }
      
      public static function a_3926() : TangChiSpearIntruder
      {
         return PoolManager.getInstance().CheckOutOne(TangChiSpearIntruder) as TangChiSpearIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return TangChiSpearIntruderMovie;
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
         a_1279 = -23;
         m_iYDisplayCenterPos = -215;
         a_1481 = false;
         a_1464 = true;
         a_1463 = true;
         BoomIsReduceLife = true;
         a_1272 = 0;
         this.SetAnimationOnce2Loop(0,1,0,1);
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(a_1273 >= 5)
            {
               this.SetAnimation(1,2);
            }
         }
         else
         {
            this.SetAnimation(3,3);
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
      
      public function InDamage() : Boolean
      {
         return a_1339 > 0 && a_1339 < MAX_INJURED_LIFE;
      }
      
      public function RealDie() : void
      {
         a_1339 = 0;
         a_3940();
      }
      
      public function SetAnimation(animIdx:int, damageIdx:int) : void
      {
         if(this.InDamage())
         {
            animIdx = damageIdx;
         }
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      public function SetAnimationOnce2Loop(onceAnimIdx:int, loopAnimIdx:int, onceAnimIdx2:int, loopAnimIdx2:int) : void
      {
         if(this.InDamage())
         {
            onceAnimIdx += onceAnimIdx2;
            loopAnimIdx += loopAnimIdx2;
         }
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
   }
}

