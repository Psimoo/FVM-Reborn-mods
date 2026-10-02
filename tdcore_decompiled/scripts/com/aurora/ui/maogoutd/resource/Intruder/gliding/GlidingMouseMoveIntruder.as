package com.aurora.ui.maogoutd.resource.Intruder.gliding
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   
   public class GlidingMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 10200;
      
      private static const MAX_INJURED_LIFE:int = MAX_LIFE / 2;
      
      private static const GLIDING_TICK:int = 40 * 2;
      
      private static const GLIDING_GRID:int = 3;
      
      private var m_bIsFlying:Boolean;
      
      private var m_bIsGliding:Boolean;
      
      private var m_iGlidingTime:int;
      
      private var m_iBoomDelay:int;
      
      public function GlidingMouseMoveIntruder()
      {
         super();
         BoomIsReduceLife = true;
         a_1272 = 0;
         a_1279 = -width * 0.5;
         a_1467 = -24;
         m_IsAirElite = true;
      }
      
      public static function a_3926() : GlidingMouseMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(GlidingMouseMoveIntruder) as GlidingMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return GlidingMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1339 = MAX_LIFE;
         a_1465 = 3;
         this.m_bIsFlying = true;
         this.m_bIsGliding = false;
         a_1463 = true;
         a_1462 = false;
         this.setSpeed();
         return true;
      }
      
      private function setSpeed() : void
      {
         var iXGridNo:int = 0;
         var fGlidingDistance:Number = NaN;
         if(this.m_bIsFlying)
         {
            a_1350 = a_3491.a_1080 / (3 * 20);
         }
         else if(this.m_bIsGliding)
         {
            iXGridNo = this.getXGridNo(x);
            iXGridNo += a_1283 ? GLIDING_GRID : -GLIDING_GRID;
            fGlidingDistance = Math.abs(x - (0.65 + iXGridNo) * a_3491.a_1080);
            a_1350 = fGlidingDistance / GLIDING_TICK;
         }
         else
         {
            a_1350 = 0;
         }
         if(!a_1283)
         {
            a_1350 *= -1;
         }
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
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(this.m_bIsFlying)
         {
            this.GotoAndStopFrame(0);
         }
         else if(this.m_bIsGliding)
         {
            this.GotoAndStopFrame(1);
         }
         else
         {
            this.GotoAndStopFrame(2);
         }
         return true;
      }
      
      private function IsIngore(iRduceLifeValue:int) : Boolean
      {
         if(this.m_bIsFlying && iRduceLifeValue > 0)
         {
            this.StartGliding();
            return true;
         }
         if(this.m_bIsGliding)
         {
            return false;
         }
         return false;
      }
      
      override public function a_4210() : Boolean
      {
         BoomIsReduceLife = !this.m_bIsGliding;
         return super.a_4210();
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         if(this.IsIngore(iRduceLifeValue))
         {
            return true;
         }
         return super.a_4209(iRduceLifeValue);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(this.IsIngore(iRduceLifeValue))
         {
            return true;
         }
         return super.a_3969(iRduceLifeValue);
      }
      
      private function getXGridNo(fXPos:Number) : int
      {
         var iXGridNo:int = int(fXPos / a_3491.a_1080);
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - iXGridNo;
         }
         return iXGridNo;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var fNumOrigXPos:Number = NaN;
         var fMoveDistance:Number = NaN;
         var stNextFielGrid:a_3491 = null;
         fNumOrigXPos = x;
         if(!a_1460)
         {
            a_1460 = true;
         }
         if(this.m_bIsFlying && (a_1468 > 0 || a_1469 > 0))
         {
            return true;
         }
         if(null == m_stCurrentFieldGrid)
         {
            return false;
         }
         play();
         if(this.m_bIsFlying)
         {
            fMoveDistance = a_1350 * a_1470;
         }
         else
         {
            fMoveDistance = a_1350;
         }
         x += fMoveDistance;
         var iXGridNo:int = this.getXGridNo(x);
         if(iXGridNo >= 0 && iXGridNo < BattleFieldView.a_1011 && m_stCurrentFieldGrid.m_iXGridNo != iXGridNo)
         {
            stNextFielGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
            ChangeFieldGrid(stNextFielGrid);
         }
         if(this.m_bIsFlying && iXGridNo <= GLIDING_GRID)
         {
            this.StartGliding();
         }
         else if(this.m_bIsGliding && this.m_iGlidingTime > 0)
         {
            --this.m_iGlidingTime;
            if(0 == this.m_iGlidingTime)
            {
               this.StartBoom();
            }
         }
         else if(this.m_iBoomDelay > 0)
         {
            --this.m_iBoomDelay;
            if(0 == this.m_iBoomDelay)
            {
               this.a_3502(m_stCurrentFieldGrid);
            }
         }
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(fNumOrigXPos - x);
         }
         return true;
      }
      
      private function StartGliding() : void
      {
         this.m_bIsFlying = false;
         this.m_bIsGliding = true;
         this.m_iGlidingTime = GLIDING_TICK;
         this.setSpeed();
         this.ResetMovieStatus();
      }
      
      private function StartBoom() : void
      {
         this.m_bIsGliding = false;
         this.m_iBoomDelay = 3 * 2;
         this.a_3969(a_1339);
         this.setSpeed();
         a_1465 = 0;
         SetCannotSeeByFighter(true);
         this.ResetMovieStatus();
      }
      
      protected function a_3502(stFieldGrid:a_3491, isCleanTray:Boolean = false) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption(true);
      }
   }
}

