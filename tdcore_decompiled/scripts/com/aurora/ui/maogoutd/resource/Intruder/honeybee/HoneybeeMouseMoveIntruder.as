package com.aurora.ui.maogoutd.resource.Intruder.honeybee
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   
   public class HoneybeeMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 1170;
      
      private static const MAX_INJURED_LIFE:int = MAX_LIFE / 2;
      
      public function HoneybeeMouseMoveIntruder()
      {
         super();
         BoomIsReduceLife = true;
         a_1272 = 0;
         a_1279 = -width * 0.3;
         a_1467 = -15;
      }
      
      public static function a_3926() : HoneybeeMouseMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(HoneybeeMouseMoveIntruder) as HoneybeeMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return HoneybeeMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (2 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1465 = 3;
         a_1339 = MAX_LIFE;
         return true;
      }
      
      private function GotoAndStopFrame(iFrame:uint) : void
      {
         if(iFrame != a_1275)
         {
            a_1275 = iFrame;
            gotoAndStop((a_1276[iFrame] as FrameLabel).frame);
            a_3419();
         }
      }
      
      private function LifeIsZeroHandle() : void
      {
         this.GotoAndStopFrame(4);
         if(null != m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         play();
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(MAX_INJURED_LIFE < a_1339)
         {
            if(a_1475)
            {
               this.GotoAndStopFrame(2);
            }
            else
            {
               this.GotoAndStopFrame(0);
            }
         }
         else if(0 < a_1339)
         {
            if(a_1475)
            {
               this.GotoAndStopFrame(3);
            }
            else
            {
               this.GotoAndStopFrame(1);
            }
         }
         else if(a_1339 <= 0)
         {
            this.LifeIsZeroHandle();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         return super.a_3969(iRduceLifeValue);
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         return super.a_4216(iCurrentTime);
      }
   }
}

