package com.aurora.ui.maogoutd.resource.Intruder.zombie
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import flash.display.FrameLabel;
   
   public class ZombieNinjaGuardMouseMoveIntruder extends BaseZombieMoveIntruder
   {
      
      private var a_1515:int = 0;
      
      private var a_1516:Boolean = true;
      
      private var a_1517:Boolean = false;
      
      private var a_1518:int;
      
      public var m_stNinjaMouseMoveIntruder:ZombieNinjaMouseMoveIntruder = null;
      
      public function ZombieNinjaGuardMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(ZombieNinjaGuardMouseMoveIntruder) as ZombieNinjaGuardMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return ZombieNinjaGuardMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 140;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 100;
         a_1279 = -width * 0.4;
         a_1272 = 0;
         this.a_1515 = 0;
         this.a_1516 = true;
         this.a_1517 = false;
         this.a_1518 = 18;
         a_1465 = 4;
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(this.m_stNinjaMouseMoveIntruder)
         {
            this.m_stNinjaMouseMoveIntruder.a_4266(this);
            this.m_stNinjaMouseMoveIntruder = null;
         }
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 50)
         {
            if(a_1475)
            {
               if(a_1275 != 4)
               {
                  a_1275 = 4;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
            }
            else if(this.a_1517)
            {
               if(a_1275 != 5)
               {
                  a_1275 = 5;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(a_1475)
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
            else if(a_1275 != 2)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 <= 0 && a_1275 != 9)
         {
            a_1275 = 9;
            gotoAndStop((a_1276[9] as FrameLabel).frame);
            a_3419();
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         if(a_1339 == 50)
         {
            if(a_1475)
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
            else if(a_1275 != 2)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 <= 0 && a_1275 != 9)
         {
            a_1275 = 9;
            gotoAndStop((a_1276[9] as FrameLabel).frame);
            a_3419();
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
         var numOrigXPos:Number = NaN;
         if(null == this.m_stNinjaMouseMoveIntruder)
         {
            if(this.a_1517)
            {
               this.a_1517 = false;
               this.ResetMovieStatus();
            }
            if(this.a_1518 > 0)
            {
               --this.a_1518;
               if(this.a_1518 == 0)
               {
                  a_1465 = 0;
                  this.a_1516 = false;
                  this.ResetMovieStatus();
               }
            }
            numOrigXPos = x;
            super.a_4216(iCurrentTime);
            if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
            {
               y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
            }
         }
         return true;
      }
      
      override public function a_4140(iCurrentTime:int) : void
      {
         if(this.a_1517)
         {
            if(a_1273 == (a_1276[6] as FrameLabel).frame - 1)
            {
               gotoAndStop((a_1276[3] as FrameLabel).frame);
            }
            else if(a_1273 == (a_1276[9] as FrameLabel).frame - 1)
            {
               gotoAndStop((a_1276[6] as FrameLabel).frame);
            }
         }
         super.a_4140(iCurrentTime);
      }
      
      public function a_4261(iCurrentTime:int) : Boolean
      {
         var numOrigXPos:Number = x;
         if(a_1339 <= 0 && Boolean(this.m_stNinjaMouseMoveIntruder))
         {
            this.m_stNinjaMouseMoveIntruder.a_4266(this);
            this.m_stNinjaMouseMoveIntruder = null;
         }
         if(!this.a_1516 && !this.a_1517)
         {
            super.a_4216(iCurrentTime);
         }
         if(!this.a_1516 && this.a_1517)
         {
            if(a_1473 <= 0 && a_1474 <= 0 && iCurrentTime >= a_1477 + a_1476 * (1 / a_1470))
            {
               if(m_stCurrentFieldGrid.m_stBaseLander != null)
               {
                  a_1474 = 20;
                  a_1475 = false;
                  this.ResetMovieStatus();
               }
               TryEatDefenseOnGridSimple(iCurrentTime,false);
            }
         }
         if(this.a_1518 > 0)
         {
            --this.a_1518;
            if(this.a_1518 == 0)
            {
               a_1465 = 0;
               this.a_1516 = false;
               this.ResetMovieStatus();
            }
         }
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
      
      public function get isStopWaiting() : Boolean
      {
         return this.a_1517;
      }
      
      public function set isStopWaiting(value:Boolean) : void
      {
         if(!this.a_1516)
         {
            this.a_1517 = value;
            this.ResetMovieStatus();
         }
      }
   }
}

