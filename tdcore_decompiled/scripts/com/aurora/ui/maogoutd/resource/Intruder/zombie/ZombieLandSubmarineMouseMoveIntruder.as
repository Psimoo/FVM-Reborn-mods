package com.aurora.ui.maogoutd.resource.Intruder.zombie
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4143;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.shot.a_4377;
   import flash.display.FrameLabel;
   
   public class ZombieLandSubmarineMouseMoveIntruder extends BaseZombieMoveIntruder
   {
      
      private const FULL_HP:int = 7200;
      
      private const HURT_HP:int = 4800;
      
      private const DEAD_HP:int = 0;
      
      private const WAIT_CYCLE_TIME:int = 40;
      
      protected var a_1312:int = 6;
      
      private var m_iShotTime:int;
      
      private var m_isMoving:Boolean;
      
      private var m_isWaiting:Boolean;
      
      private var m_isShoting:Boolean;
      
      private var m_isDying:Boolean;
      
      private var a_1507:Boolean;
      
      private var a_1448:int;
      
      private var a_1508:a_3491;
      
      public function ZombieLandSubmarineMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(ZombieLandSubmarineMouseMoveIntruder) as ZombieLandSubmarineMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return ZombieLandSubmarineMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (6 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 800;
         a_1466 = 1600;
         a_1279 = -width * 0.5;
         a_1272 = 0;
         a_1377 = 0;
         a_1476 = 50;
         a_1477 = 0;
         this.m_isMoving = true;
         this.m_isWaiting = false;
         this.m_isShoting = false;
         this.m_isDying = false;
         this.a_1448 = 0;
         this.m_iShotTime = 2;
         this.a_1508 = null;
         return true;
      }
      
      protected function a_2180() : int
      {
         return (globalMoveFighterID << 16) + 1;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(this.m_isDying)
         {
            if(a_1275 < 6)
            {
               a_1275 = 6;
               gotoAndStop((a_1276[6] as FrameLabel).frame);
               a_3419();
            }
         }
         else if(a_1339 + a_1466 > this.HURT_HP)
         {
            if(this.m_isWaiting)
            {
               if(a_1275 != 2)
               {
                  a_1275 = 2;
                  gotoAndStop((a_1276[2] as FrameLabel).frame);
               }
               a_3419();
            }
            else if(this.m_isShoting)
            {
               if(a_1275 != 4)
               {
                  a_1275 = 4;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
               }
               a_3419();
            }
            else
            {
               if(a_1275 != 0)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[0] as FrameLabel).frame);
               }
               a_3419();
            }
         }
         else if(a_1339 + a_1466 > this.DEAD_HP)
         {
            if(this.m_isWaiting)
            {
               if(a_1275 != 3)
               {
                  a_1275 = 3;
                  gotoAndStop((a_1276[3] as FrameLabel).frame);
               }
               a_3419();
            }
            else if(this.m_isShoting)
            {
               if(a_1275 != 5)
               {
                  a_1275 = 5;
                  gotoAndStop((a_1276[5] as FrameLabel).frame);
               }
               a_3419();
            }
            else
            {
               if(a_1275 != 1)
               {
                  a_1275 = 1;
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
               a_3419();
            }
         }
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         var transferToHurt:Boolean = false;
         if(a_1339 + a_1466 > this.HURT_HP)
         {
            transferToHurt = true;
         }
         super.a_3969(iRduceLifeValue);
         if(this.m_isDying)
         {
            a_1339 = 1;
         }
         if(transferToHurt)
         {
            if(a_1339 + a_1466 <= this.HURT_HP)
            {
               transferToHurt = true;
            }
            else
            {
               transferToHurt = false;
            }
         }
         if(a_1466 <= this.DEAD_HP || a_1339 <= this.DEAD_HP)
         {
            if(!this.m_isDying)
            {
               this.m_isDying = true;
               this.ResetMovieStatus();
            }
         }
         if(!this.m_isDying)
         {
            if(transferToHurt)
            {
               if(this.m_isWaiting)
               {
                  if(a_1275 != 3)
                  {
                     a_1275 = 3;
                     gotoAndStop((a_1276[3] as FrameLabel).frame);
                  }
                  a_3419();
               }
               else if(this.m_isShoting)
               {
                  if(a_1275 != 5)
                  {
                     a_1275 = 5;
                     gotoAndStop((a_1276[5] as FrameLabel).frame);
                  }
                  a_3419();
               }
               else
               {
                  if(a_1275 != 1)
                  {
                     a_1275 = 1;
                     gotoAndStop((a_1276[1] as FrameLabel).frame);
                  }
                  a_3419();
               }
            }
         }
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         var stSmallMouseBoomdie:a_4143 = null;
         this.a_3969(900);
         if(a_1466 <= this.DEAD_HP || a_1339 <= this.DEAD_HP)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            stSmallMouseBoomdie = a_4143.a_3926();
            stSmallMouseBoomdie.a_1797(a_1283);
            stSmallMouseBoomdie.x = x;
            stSmallMouseBoomdie.y = y;
            parent.addChildAt(stSmallMouseBoomdie,parent.getChildIndex(this));
            a_3940();
         }
         return true;
      }
      
      override public function a_4211(iCutLifeValue:int) : Boolean
      {
         if(iCutLifeValue > 200)
         {
            iCutLifeValue = 200;
         }
         a_1339 -= iCutLifeValue;
         if(a_1466 <= this.DEAD_HP || a_1339 <= this.DEAD_HP)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            a_3940();
         }
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         this.a_3969(900);
         if(a_1466 <= this.DEAD_HP || a_1339 <= this.DEAD_HP)
         {
            a_4212();
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stFieldGrid:a_3491 = null;
         var isExistDefenseAhead:Boolean = false;
         var iXGridNo:int = m_stCurrentFieldGrid.m_iXGridNo;
         if(this.m_isDying)
         {
            if(a_1273 == (a_1276[7] as FrameLabel).frame - 1)
            {
               a_1275 = 7;
               gotoAndStop((a_1276[7] as FrameLabel).frame);
               this.addLastShot();
            }
            if(a_1273 == (a_1276[8] as FrameLabel).frame - 1)
            {
               a_1275 = 8;
               gotoAndStop((a_1276[8] as FrameLabel).frame);
               if(m_stCurrentFieldGrid)
               {
                  m_stCurrentFieldGrid.a_3457(this);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               }
               a_1339 = 0;
               this.m_isDying = true;
               play();
            }
            return true;
         }
         if(this.m_isMoving)
         {
            super.a_4216(iCurrentTime);
            if(a_1474 <= 0)
            {
               x += a_1350 * a_1470;
            }
         }
         if(this.m_isMoving || this.m_isWaiting)
         {
            if(iXGridNo - 3 >= 0)
            {
               stFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo - 3,m_stCurrentFieldGrid.m_iYGridNo);
               isExistDefenseAhead = Boolean(stFieldGrid) && stFieldGrid.a_3492();
            }
            if(isExistDefenseAhead)
            {
               if(this.m_isMoving)
               {
                  this.m_isMoving = false;
                  this.m_isShoting = true;
                  this.a_1448 = 0;
                  this.ResetMovieStatus();
               }
               else
               {
                  ++this.a_1448;
                  if(this.WAIT_CYCLE_TIME == this.a_1448)
                  {
                     this.m_isWaiting = false;
                     this.m_isShoting = true;
                     this.ResetMovieStatus();
                  }
               }
            }
            else if(this.m_isWaiting)
            {
               this.m_isMoving = true;
               this.m_isWaiting = false;
               this.a_1448 = 0;
               this.m_iShotTime = 2;
               this.ResetMovieStatus();
            }
         }
         if(this.m_isShoting)
         {
            if(a_1273 == (a_1276[5] as FrameLabel).frame - 1 || a_1273 == (a_1276[6] as FrameLabel).frame - 1)
            {
               this.m_isShoting = false;
               this.a_1507 = false;
               this.m_isWaiting = true;
               this.a_1448 = 0;
               this.ResetMovieStatus();
            }
            if(!this.a_1507 && (a_1273 == (a_1276[4] as FrameLabel).frame + 4 || a_1273 == (a_1276[5] as FrameLabel).frame + 4))
            {
               this.a_1507 = true;
               --this.m_iShotTime;
               if(this.m_iShotTime == 0)
               {
                  this.addShot(10000,this.a_1312);
                  this.m_iShotTime = 2;
               }
               else
               {
                  this.addShot(10,this.a_1312);
               }
            }
         }
         return true;
      }
      
      override public function a_4140(iCurrentTime:int) : void
      {
         super.a_4140(iCurrentTime);
      }
      
      private function addShot(iHurt:Number, iSpeed:Number) : void
      {
         this.a_1508 = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 3,m_stCurrentFieldGrid.m_iYGridNo);
         var shot:a_4348 = a_4377.a_4344();
         shot.a_1797(0,iSpeed,iHurt,x - this.width,y + height * 0.4,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid);
         a_4377(shot).setTargetFieldGrid(this.a_1508);
         parent.addChild(shot);
      }
      
      private function addLastShot() : void
      {
         var shot:a_4348 = a_4377.a_4344();
         shot.a_1797(0,this.a_1312,10000,x - this.width,m_stCurrentFieldGrid.m_iYGridNo * a_3491.a_1081 + a_3491.a_1081 * 0.4,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView,m_stCurrentFieldGrid);
         parent.addChild(shot);
      }
   }
}

