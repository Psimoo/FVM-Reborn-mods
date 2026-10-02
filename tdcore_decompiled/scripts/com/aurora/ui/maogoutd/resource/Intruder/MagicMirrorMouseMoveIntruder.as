package com.aurora.ui.maogoutd.resource.Intruder
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import flash.display.FrameLabel;
   
   public class MagicMirrorMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 1890;
      
      private static const MAX_INJURED_LIFE:int = 600;
      
      private static const USE_MAGICMIRROR_TIME:int = 64 * 1;
      
      private var m_bIsUsedMagicMirror:Boolean;
      
      private var m_bIsUseingMagicMirror:Boolean;
      
      private var m_iMoveTime:int;
      
      private var m_iUseMagicMirrorTime:int;
      
      public function MagicMirrorMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(MagicMirrorMouseMoveIntruder) as MagicMirrorMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return MagicMirrorMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 120;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = MAX_LIFE;
         a_1272 = 0;
         a_1279 = -width * 0.4;
         this.m_bIsUsedMagicMirror = false;
         this.m_bIsUseingMagicMirror = false;
         this.m_iMoveTime = Math.abs(int(1.8 * a_3491.a_1080 / a_1350));
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
         this.GotoAndStopFrame(6);
         if(m_stCurrentFieldGrid != null)
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
            if(this.m_bIsUseingMagicMirror)
            {
               this.GotoAndStopFrame(2);
            }
            else if(a_1475)
            {
               this.GotoAndStopFrame(4);
            }
            else
            {
               this.GotoAndStopFrame(0);
            }
         }
         else if(0 < a_1339)
         {
            if(this.m_bIsUseingMagicMirror)
            {
               this.GotoAndStopFrame(3);
            }
            else if(a_1475)
            {
               this.GotoAndStopFrame(5);
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
         super.a_3969(iRduceLifeValue);
         return this.ResetMovieStatus();
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(a_1468 > 0 || a_1469 > 0)
         {
            return true;
         }
         var numOrigXPos:Number = x;
         if(this.m_bIsUsedMagicMirror)
         {
            super.a_4216(iCurrentTime);
            this.UpdatePosY(numOrigXPos);
            return true;
         }
         if(this.m_bIsUseingMagicMirror)
         {
            this.UseMagicMirror();
            --this.m_iUseMagicMirrorTime;
            if(this.m_iUseMagicMirrorTime <= 0)
            {
               this.StopUseMagicMirror();
            }
         }
         else
         {
            if(null == m_stCurrentFieldGrid)
            {
               return false;
            }
            --this.m_iMoveTime;
            if(0 == this.m_iMoveTime || m_stCurrentFieldGrid.a_3492())
            {
               this.StartUseMagicMirror();
            }
            else
            {
               super.a_4216(iCurrentTime);
               this.UpdatePosY(numOrigXPos);
            }
         }
         return true;
      }
      
      private function StartUseMagicMirror() : void
      {
         this.m_bIsUsedMagicMirror = false;
         this.m_bIsUseingMagicMirror = true;
         this.m_iUseMagicMirrorTime = USE_MAGICMIRROR_TIME;
         this.ResetMovieStatus();
         this.UseMagicMirror();
      }
      
      private function UseMagicMirror() : void
      {
         var stBaseEnergy:a_4157 = null;
         if(null != m_stCurrentFieldGrid && Boolean(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_arrBaseEnergyVector))
         {
            for each(stBaseEnergy in m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_arrBaseEnergyVector.slice())
            {
               stBaseEnergy.a_4159(x - 10,y - 90,10,true);
            }
         }
      }
      
      private function StopUseMagicMirror() : void
      {
         this.m_bIsUsedMagicMirror = true;
         this.m_bIsUseingMagicMirror = false;
         this.m_iUseMagicMirrorTime = -1;
         this.m_iMoveTime = -1;
         this.ResetMovieStatus();
      }
      
      private function UpdatePosY(numOrigXPos:Number) : void
      {
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
      }
   }
}

