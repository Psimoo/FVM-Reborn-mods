package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldMouse
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class WBPlunger2MousleHole extends a_4206
   {
      
      private static const MAX_LIFE:int = 20000;
      
      private static const ONE_GRID_SPEED:int = 0;
      
      private var m_bForceDamage:Boolean = false;
      
      private var tick:int = 0;
      
      public function WBPlunger2MousleHole()
      {
         super();
      }
      
      public static function a_3926() : WBPlunger2MousleHole
      {
         return PoolManager.getInstance().CheckOutOne(WBPlunger2MousleHole) as WBPlunger2MousleHole;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBPlunger2MousleHoleMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = 0;
         a_1339 = MAX_LIFE;
         a_1279 = 12;
         m_iYDisplayCenterPos = -120;
         a_1272 = 0;
         this.SetAnimationOnce2Loop2(0,1);
         a_1481 = false;
         a_1464 = true;
         a_1463 = true;
         this.m_bForceDamage = false;
         this.tick = 0;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0)
         {
            this.SetAnimation2(2);
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         return true;
      }
      
      override public function a_3969(value:int) : Boolean
      {
         if(this.m_bForceDamage)
         {
            super.a_3969(value);
         }
         return true;
      }
      
      public function ForceDamage() : void
      {
         this.m_bForceDamage = true;
         this.a_3969(iLifeValue);
         this.m_bForceDamage = false;
      }
      
      override public function a_4209(value:int) : Boolean
      {
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(!a_1460)
         {
            a_1460 = true;
         }
         var numOrigXPos:Number = x;
         super.a_4216(iCurrentTime);
         SetGameMapModePicnicPosition(numOrigXPos);
         ++this.tick;
         if(this.tick == 110)
         {
            this.ForceDamage();
         }
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
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

