package com.aurora.ui.maogoutd.resource.Intruder.kfcarbon
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class DragonMachineBossLowerBodyTailIntruder extends a_4206
   {
      
      private var m_iStartTimeNum:int;
      
      private var m_numTargetYPos:Number;
      
      protected var m_stPosFieldGrid:a_3491;
      
      public function DragonMachineBossLowerBodyTailIntruder()
      {
         super();
         a_1481 = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(DragonMachineBossLowerBodyTailIntruder) as DragonMachineBossLowerBodyTailIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return DragonMachineBossLowerBodyTailIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 120;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 900000;
         a_1279 = -width * 0;
         a_1272 = 0;
         a_1463 = true;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         if(Boolean(m_stCurrentFieldGrid) && 2 == m_stCurrentFieldGrid.m_iFieldGridType)
         {
            m_stCurrentFieldGrid.m_iFieldGridType = 0;
         }
         if(Boolean(this.m_stPosFieldGrid) && 2 == this.m_stPosFieldGrid.m_iFieldGridType)
         {
            this.m_stPosFieldGrid.m_iFieldGridType = 0;
         }
         super.a_3940();
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         if(!a_1460)
         {
            this.m_iStartTimeNum = iCurrentTime;
            a_1460 = true;
            gotoAndStop(1);
            a_1275 = 1;
            this.m_stPosFieldGrid = m_stCurrentFieldGrid;
            this.m_numTargetYPos = y;
         }
         if(a_1273 == a_1274)
         {
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         if(iCurrentTime - this.m_iStartTimeNum > 300)
         {
            this.a_3969(iLifeValue);
            a_4212();
         }
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
      }
   }
}

