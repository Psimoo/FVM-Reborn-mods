package com.aurora.ui.maogoutd.resource.Intruder
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import flash.display.FrameLabel;
   
   public class NinjaMouseSecondTransMoveIntruder extends a_4206
   {
      
      private var m_stFrontNinjaGuardMouseSecondTransMoveIntruder:NinjaGuardMouseSecondTransMoveIntruder = null;
      
      private var m_stBackNinjaGuardMouseSecondTransMoveIntruder:NinjaGuardMouseSecondTransMoveIntruder = null;
      
      private var m_stHeadNinjaGuardMouseSecondTransMoveIntruder:NinjaGuardMouseSecondTransMoveIntruder = null;
      
      private var m_stFootNinjaGuardMouseSecondTransMoveIntruder:NinjaGuardMouseSecondTransMoveIntruder = null;
      
      private var a_1524:int = 1;
      
      private var a_1516:Boolean;
      
      private var a_1525:Boolean;
      
      private var a_1517:Boolean;
      
      private var a_1526:Boolean;
      
      private var a_1527:int;
      
      private var m_iMoveTime:int;
      
      public function NinjaMouseSecondTransMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(NinjaMouseSecondTransMoveIntruder) as NinjaMouseSecondTransMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return NinjaMouseSecondTransMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 30;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 1140;
         a_1377 = 50;
         a_1279 = -width * 0.4;
         a_1272 = 0;
         this.a_1524 = 1;
         this.a_1516 = true;
         this.a_1525 = false;
         this.a_1517 = false;
         this.a_1526 = false;
         this.a_1527 = 0;
         this.m_iMoveTime = 0;
         return true;
      }
      
      protected function a_4265() : int
      {
         return (globalMoveFighterID << 16) + this.a_1524++;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.a_1517 = false;
         if(null != this.m_stFrontNinjaGuardMouseSecondTransMoveIntruder)
         {
            this.m_stFrontNinjaGuardMouseSecondTransMoveIntruder.m_stNinjaMouseSecondTransMoveIntruder = null;
            this.m_stFrontNinjaGuardMouseSecondTransMoveIntruder = null;
         }
         if(null != this.m_stBackNinjaGuardMouseSecondTransMoveIntruder)
         {
            this.m_stBackNinjaGuardMouseSecondTransMoveIntruder.m_stNinjaMouseSecondTransMoveIntruder = null;
            this.m_stBackNinjaGuardMouseSecondTransMoveIntruder = null;
         }
         if(null != this.m_stHeadNinjaGuardMouseSecondTransMoveIntruder)
         {
            this.m_stHeadNinjaGuardMouseSecondTransMoveIntruder.m_stNinjaMouseSecondTransMoveIntruder = null;
            this.m_stHeadNinjaGuardMouseSecondTransMoveIntruder = null;
         }
         if(null != this.m_stFootNinjaGuardMouseSecondTransMoveIntruder)
         {
            this.m_stFootNinjaGuardMouseSecondTransMoveIntruder.m_stNinjaMouseSecondTransMoveIntruder = null;
            this.m_stFootNinjaGuardMouseSecondTransMoveIntruder = null;
         }
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 100)
         {
            if(this.a_1516)
            {
               if(a_1275 != 0)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[0] as FrameLabel).frame);
               }
            }
            else if(this.a_1525)
            {
               if(a_1275 != 2)
               {
                  a_1275 = 2;
                  gotoAndStop((a_1276[2] as FrameLabel).frame);
               }
            }
            else if(a_1475)
            {
               if(a_1275 != 7)
               {
                  a_1275 = 7;
                  gotoAndStop((a_1276[6] as FrameLabel).frame);
               }
            }
            else if(this.a_1517)
            {
               if(a_1275 != 8)
               {
                  a_1275 = 8;
                  gotoAndStop((a_1276[6] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 4)
            {
               a_1275 = 4;
               gotoAndStop((a_1276[4] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(this.a_1516)
            {
               if(a_1275 != 1)
               {
                  a_1275 = 1;
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
            }
            else if(this.a_1525)
            {
               if(a_1275 != 3)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
            }
            else if(a_1475)
            {
               if(a_1275 != 10)
               {
                  a_1275 = 10;
                  gotoAndStop((a_1276[9] as FrameLabel).frame);
               }
            }
            else if(this.a_1517)
            {
               if(a_1275 != 11)
               {
                  a_1275 = 11;
                  gotoAndStop((a_1276[9] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 5)
            {
               a_1275 = 5;
               gotoAndStop((a_1276[5] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 <= 0 && a_1275 != 12)
         {
            a_1275 = 12;
            gotoAndStop((a_1276[12] as FrameLabel).frame);
            a_3419();
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            play();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         if(a_1339 == 100)
         {
            if(this.a_1516)
            {
               if(a_1275 != 1)
               {
                  a_1275 = 1;
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
            }
            else if(this.a_1525)
            {
               if(a_1275 != 3)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
            }
            else if(a_1475)
            {
               if(a_1275 != 10)
               {
                  a_1275 = 10;
                  gotoAndStop((a_1276[9] as FrameLabel).frame);
               }
            }
            else if(this.a_1517)
            {
               if(a_1275 != 11)
               {
                  a_1275 = 11;
                  gotoAndStop((a_1276[9] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 5)
            {
               a_1275 = 5;
               gotoAndStop((a_1276[5] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 <= 0 && a_1275 != 12)
         {
            a_1275 = 12;
            gotoAndStop((a_1276[12] as FrameLabel).frame);
            a_3419();
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            play();
         }
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         super.a_4210();
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stFieldGrid:a_3491 = null;
         var numOrigXPos:Number = x;
         if(!this.a_1525 && !this.a_1517)
         {
            if(this.m_iMoveTime < 40)
            {
               ++this.m_iMoveTime;
            }
            super.a_4216(iCurrentTime);
         }
         if(null != this.m_stFrontNinjaGuardMouseSecondTransMoveIntruder)
         {
            this.m_stFrontNinjaGuardMouseSecondTransMoveIntruder.a_4261(iCurrentTime);
         }
         if(null != this.m_stBackNinjaGuardMouseSecondTransMoveIntruder)
         {
            this.m_stBackNinjaGuardMouseSecondTransMoveIntruder.a_4261(iCurrentTime);
         }
         if(null != this.m_stHeadNinjaGuardMouseSecondTransMoveIntruder)
         {
            this.m_stHeadNinjaGuardMouseSecondTransMoveIntruder.a_4261(iCurrentTime);
         }
         if(null != this.m_stFootNinjaGuardMouseSecondTransMoveIntruder)
         {
            this.m_stFootNinjaGuardMouseSecondTransMoveIntruder.a_4261(iCurrentTime);
         }
         if(this.a_1516 && (m_stCurrentFieldGrid.a_3492() || !a_1283 && x <= a_3491.a_1080 * (BattleFieldView.a_1011 - 3) || a_1283 && x >= a_3491.a_1080 * 3))
         {
            this.a_1516 = false;
            this.a_1525 = true;
            this.a_1527 = 46;
            a_1350 = a_3491.a_1080 / 140;
            if(!a_1283)
            {
               a_1350 *= -1;
            }
            this.ResetMovieStatus();
         }
         if(a_1273 == (a_1276[9] as FrameLabel).frame - 1 || a_1273 == (a_1276[12] as FrameLabel).frame - 1)
         {
            if(this.a_1526 && !this.a_1525)
            {
               this.a_1525 = true;
               this.a_1527 = 46;
               this.ResetMovieStatus();
            }
         }
         if(this.a_1527 > 0)
         {
            --this.a_1527;
            if(0 == this.a_1527)
            {
               play();
               this.a_1525 = false;
               this.ResetMovieStatus();
            }
            if(18 == this.a_1527)
            {
               stop();
               if(null == this.m_stFrontNinjaGuardMouseSecondTransMoveIntruder)
               {
                  stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo);
                  if(stFieldGrid)
                  {
                     this.m_stFrontNinjaGuardMouseSecondTransMoveIntruder = NinjaGuardMouseSecondTransMoveIntruder.a_3926() as NinjaGuardMouseSecondTransMoveIntruder;
                     this.m_stFrontNinjaGuardMouseSecondTransMoveIntruder.iGlobalMoveFighterID = this.a_4265();
                     this.m_stFrontNinjaGuardMouseSecondTransMoveIntruder.m_stMoveIntruderTypeID = 8388608;
                     this.m_stFrontNinjaGuardMouseSecondTransMoveIntruder.m_stNinjaMouseSecondTransMoveIntruder = this;
                     this.m_stFrontNinjaGuardMouseSecondTransMoveIntruder.x = !a_1283 ? x - a_3491.a_1080 : x + a_3491.a_1080;
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(this.m_stFrontNinjaGuardMouseSecondTransMoveIntruder,stFieldGrid);
                  }
               }
               if(null == this.m_stBackNinjaGuardMouseSecondTransMoveIntruder)
               {
                  stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo + 1,m_stCurrentFieldGrid.m_iYGridNo);
                  if(stFieldGrid)
                  {
                     this.m_stBackNinjaGuardMouseSecondTransMoveIntruder = NinjaGuardMouseSecondTransMoveIntruder.a_3926() as NinjaGuardMouseSecondTransMoveIntruder;
                     this.m_stBackNinjaGuardMouseSecondTransMoveIntruder.iGlobalMoveFighterID = this.a_4265();
                     this.m_stBackNinjaGuardMouseSecondTransMoveIntruder.m_stMoveIntruderTypeID = 8388608;
                     this.m_stBackNinjaGuardMouseSecondTransMoveIntruder.m_stNinjaMouseSecondTransMoveIntruder = this;
                     this.m_stBackNinjaGuardMouseSecondTransMoveIntruder.x = !a_1283 ? x + a_3491.a_1080 : x - a_3491.a_1080;
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(this.m_stBackNinjaGuardMouseSecondTransMoveIntruder,stFieldGrid);
                  }
               }
               if(null == this.m_stHeadNinjaGuardMouseSecondTransMoveIntruder)
               {
                  stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo - 1);
                  if(Boolean(stFieldGrid) && !stFieldGrid.m_isNeedTray)
                  {
                     this.m_stHeadNinjaGuardMouseSecondTransMoveIntruder = NinjaGuardMouseSecondTransMoveIntruder.a_3926() as NinjaGuardMouseSecondTransMoveIntruder;
                     this.m_stHeadNinjaGuardMouseSecondTransMoveIntruder.iGlobalMoveFighterID = this.a_4265();
                     this.m_stHeadNinjaGuardMouseSecondTransMoveIntruder.m_stMoveIntruderTypeID = 8388608;
                     this.m_stHeadNinjaGuardMouseSecondTransMoveIntruder.m_stNinjaMouseSecondTransMoveIntruder = this;
                     this.m_stHeadNinjaGuardMouseSecondTransMoveIntruder.x = x;
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(this.m_stHeadNinjaGuardMouseSecondTransMoveIntruder,stFieldGrid);
                  }
               }
               if(null == this.m_stFootNinjaGuardMouseSecondTransMoveIntruder)
               {
                  stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo + 1);
                  if(Boolean(stFieldGrid) && !stFieldGrid.m_isNeedTray)
                  {
                     this.m_stFootNinjaGuardMouseSecondTransMoveIntruder = NinjaGuardMouseSecondTransMoveIntruder.a_3926() as NinjaGuardMouseSecondTransMoveIntruder;
                     this.m_stFootNinjaGuardMouseSecondTransMoveIntruder.iGlobalMoveFighterID = this.a_4265();
                     this.m_stFootNinjaGuardMouseSecondTransMoveIntruder.m_stMoveIntruderTypeID = 8388608;
                     this.m_stFootNinjaGuardMouseSecondTransMoveIntruder.m_stNinjaMouseSecondTransMoveIntruder = this;
                     this.m_stFootNinjaGuardMouseSecondTransMoveIntruder.x = x;
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(this.m_stFootNinjaGuardMouseSecondTransMoveIntruder,stFieldGrid);
                  }
               }
               this.a_1526 = false;
            }
         }
         var isNinjaStop:Boolean = false;
         if(Boolean(this.m_stFrontNinjaGuardMouseSecondTransMoveIntruder) && this.m_stFrontNinjaGuardMouseSecondTransMoveIntruder.isEatingDefense)
         {
            isNinjaStop = true;
         }
         if(Boolean(this.m_stBackNinjaGuardMouseSecondTransMoveIntruder) && this.m_stBackNinjaGuardMouseSecondTransMoveIntruder.isEatingDefense)
         {
            isNinjaStop = true;
         }
         if(Boolean(this.m_stHeadNinjaGuardMouseSecondTransMoveIntruder) && this.m_stHeadNinjaGuardMouseSecondTransMoveIntruder.isEatingDefense)
         {
            isNinjaStop = true;
         }
         if(Boolean(this.m_stFootNinjaGuardMouseSecondTransMoveIntruder) && this.m_stFootNinjaGuardMouseSecondTransMoveIntruder.isEatingDefense)
         {
            isNinjaStop = true;
         }
         if(this.a_1527 > 0)
         {
            isNinjaStop = true;
         }
         if(!this.a_1516 && this.m_iMoveTime >= 40 && this.m_iMoveTime < 80)
         {
            ++this.m_iMoveTime;
            if(80 == this.m_iMoveTime && !a_1475)
            {
               this.m_iMoveTime = 0;
            }
            else
            {
               isNinjaStop = true;
            }
         }
         if(this.a_1517 != isNinjaStop)
         {
            this.a_1517 = isNinjaStop;
            this.ResetMovieStatus();
         }
         var isGuardStop:Boolean = false;
         if(a_1475 || this.a_1517)
         {
            isGuardStop = true;
         }
         if(null != this.m_stFrontNinjaGuardMouseSecondTransMoveIntruder && this.m_stFrontNinjaGuardMouseSecondTransMoveIntruder.isStopWaiting != isGuardStop)
         {
            this.m_stFrontNinjaGuardMouseSecondTransMoveIntruder.isStopWaiting = isGuardStop;
         }
         if(null != this.m_stBackNinjaGuardMouseSecondTransMoveIntruder && this.m_stBackNinjaGuardMouseSecondTransMoveIntruder.isStopWaiting != isGuardStop)
         {
            this.m_stBackNinjaGuardMouseSecondTransMoveIntruder.isStopWaiting = isGuardStop;
         }
         if(null != this.m_stHeadNinjaGuardMouseSecondTransMoveIntruder && this.m_stHeadNinjaGuardMouseSecondTransMoveIntruder.isStopWaiting != isGuardStop)
         {
            this.m_stHeadNinjaGuardMouseSecondTransMoveIntruder.isStopWaiting = isGuardStop;
         }
         if(null != this.m_stFootNinjaGuardMouseSecondTransMoveIntruder && this.m_stFootNinjaGuardMouseSecondTransMoveIntruder.isStopWaiting != isGuardStop)
         {
            this.m_stFootNinjaGuardMouseSecondTransMoveIntruder.isStopWaiting = isGuardStop;
         }
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
      
      override public function a_4140(iCurrentTime:int) : void
      {
         if(this.a_1517)
         {
            if(a_1273 == (a_1276[9] as FrameLabel).frame - 1)
            {
               gotoAndStop((a_1276[6] as FrameLabel).frame);
            }
            else if(a_1273 == (a_1276[12] as FrameLabel).frame - 1)
            {
               gotoAndStop((a_1276[9] as FrameLabel).frame);
            }
         }
         super.a_4140(iCurrentTime);
      }
      
      public function a_4266(stNinjaGuardMouseSecondTransMoveIntruder:NinjaGuardMouseSecondTransMoveIntruder) : Boolean
      {
         if(stNinjaGuardMouseSecondTransMoveIntruder == this.m_stFrontNinjaGuardMouseSecondTransMoveIntruder)
         {
            this.m_stFrontNinjaGuardMouseSecondTransMoveIntruder = null;
            this.a_1526 = true;
         }
         if(stNinjaGuardMouseSecondTransMoveIntruder == this.m_stBackNinjaGuardMouseSecondTransMoveIntruder)
         {
            this.m_stBackNinjaGuardMouseSecondTransMoveIntruder = null;
            this.a_1526 = true;
         }
         if(stNinjaGuardMouseSecondTransMoveIntruder == this.m_stHeadNinjaGuardMouseSecondTransMoveIntruder)
         {
            this.m_stHeadNinjaGuardMouseSecondTransMoveIntruder = null;
            this.a_1526 = true;
         }
         if(stNinjaGuardMouseSecondTransMoveIntruder == this.m_stFootNinjaGuardMouseSecondTransMoveIntruder)
         {
            this.m_stFootNinjaGuardMouseSecondTransMoveIntruder = null;
            this.a_1526 = true;
         }
         return true;
      }
   }
}

