package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.TangChiBoss
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class TangChiGolfIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 10000000;
      
      private static const ONE_GRID_SPEED:int = 0;
      
      private var m_stBOSS:TangChiIntruderBoss;
      
      public function TangChiGolfIntruder()
      {
         super();
      }
      
      public static function a_3926() : TangChiGolfIntruder
      {
         return PoolManager.getInstance().CheckOutOne(TangChiGolfIntruder) as TangChiGolfIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return TangChiGolfIntruderMovie;
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
         a_1279 = -126;
         m_iYDisplayCenterPos = -160;
         a_1481 = false;
         a_1464 = true;
         a_1463 = true;
         a_1272 = 0;
         this.SetAnimationOnce2Loop(1,2);
         this.m_stBOSS = null;
         return true;
      }
      
      public function InitBOSS(boss:TangChiIntruderBoss) : void
      {
         this.m_stBOSS = boss;
      }
      
      override protected function a_3940() : Boolean
      {
         this.m_stBOSS = null;
         super.a_3940();
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0)
         {
            this.SetAnimation(3);
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(a_1339 <= 0)
         {
            return false;
         }
         this.m_stBOSS.TriggerStop();
         this.m_stBOSS = null;
         a_1339 = 0;
         this.ResetMovieStatus();
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         return true;
      }
      
      override public function ReduceAllLife(iRduceLifeValue:int, bIsIgnoreArmor:Boolean = false, ishowHuijing:Boolean = false) : Boolean
      {
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var numOrigXPos:Number = x;
         super.a_4216(iCurrentTime);
         SetGameMapModePicnicPosition(numOrigXPos);
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      public function SetAnimation(animIdx:int) : void
      {
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      public function SetAnimationOnce2Loop(onceAnimIdx:int, loopAnimIdx:int) : void
      {
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
   }
}

