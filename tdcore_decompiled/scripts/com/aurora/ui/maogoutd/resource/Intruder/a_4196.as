package com.aurora.ui.maogoutd.resource.Intruder
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class a_4196 extends a_4206
   {
      
      private const FULL_HP:int = 420;
      
      private const HURT_HP:int = 180;
      
      private const DEAD_HP:int = 0;
      
      private const DELAY_TIME:int = 300;
      
      private var a_1447:int = 0;
      
      private var a_1448:int = 0;
      
      private var m_isReady:Boolean;
      
      private var m_isWaiting:Boolean;
      
      private var m_isFiring:Boolean;
      
      private var a_1449:Boolean;
      
      private var a_1450:a_4282;
      
      private var a_1451:a_3491 = new a_3491(null,0,0);
      
      private var a_1452:Point;
      
      private var a_1453:Number;
      
      private var a_1454:Number;
      
      private var a_1455:Boolean;
      
      public function a_4196()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(a_4196) as a_4196;
      }
      
      override protected function getBindMovie() : Class
      {
         return ArtilleryMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (3 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = this.FULL_HP;
         a_1279 = -width * 0.6;
         a_1272 = 0;
         a_1377 = 0;
         a_1476 = 50;
         a_1477 = 0;
         this.a_1447 = 0;
         this.a_1448 = 0;
         this.m_isReady = true;
         this.m_isWaiting = false;
         this.m_isFiring = false;
         this.a_1449 = false;
         this.a_1455 = false;
         trace("ResetMovieStatus>>0");
         this.ResetMovieStatus();
         return true;
      }
      
      protected function a_2180() : int
      {
         return (globalMoveFighterID << 16) + 1;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(null != this.a_1450)
         {
            this.a_1455 = false;
            if(null != this.a_1450.parent)
            {
               this.a_1450.parent.removeChild(this.a_1450);
            }
            this.a_1450 = null;
         }
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.HURT_HP)
         {
            if(this.m_isReady)
            {
               if(a_1275 != 0)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[0] as FrameLabel).frame);
               }
            }
            else if(this.a_1449)
            {
               if(a_1275 != 8)
               {
                  a_1275 = 8;
                  gotoAndStop((a_1276[8] as FrameLabel).frame);
               }
            }
            else if(this.m_isFiring)
            {
               if(a_1273 < (a_1276[2] as FrameLabel).frame - 1 || a_1273 > (a_1276[4] as FrameLabel).frame - 1)
               {
                  if(a_1275 != 2)
                  {
                     a_1275 = 2;
                     gotoAndStop((a_1276[2] as FrameLabel).frame);
                  }
               }
            }
            else if(a_1275 != 6)
            {
               a_1275 = 6;
               gotoAndStop((a_1276[6] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 > this.DEAD_HP)
         {
            if(this.m_isReady)
            {
               if(a_1275 != 1)
               {
                  a_1275 = 1;
                  gotoAndStop((a_1276[1] as FrameLabel).frame);
               }
            }
            else if(this.a_1449)
            {
               if(a_1275 != 9)
               {
                  a_1275 = 9;
                  gotoAndStop((a_1276[9] as FrameLabel).frame);
               }
            }
            else if(this.m_isFiring)
            {
               if(a_1273 < (a_1276[4] as FrameLabel).frame - 1 || a_1273 > (a_1276[6] as FrameLabel).frame - 1)
               {
                  if(a_1275 != 4)
                  {
                     a_1275 = 4;
                     gotoAndStop((a_1276[4] as FrameLabel).frame);
                  }
               }
            }
            else if(a_1275 != 7)
            {
               a_1275 = 7;
               gotoAndStop((a_1276[7] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 <= this.DEAD_HP && a_1275 != 10)
         {
            a_1275 = 10;
            gotoAndStop((a_1276[10] as FrameLabel).frame);
            a_3419();
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         trace("---->ResetMovieStatus:m_iFrameLabelIndex=" + a_1275);
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         super.a_4210();
         return true;
      }
      
      override public function a_4211(iCutLifeValue:int) : Boolean
      {
         if(iCutLifeValue > 200)
         {
            iCutLifeValue = 200;
         }
         a_1339 -= iCutLifeValue;
         if(a_1339 <= 0)
         {
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.a_3940();
         }
         return true;
      }
      
      override public function a_4213() : Boolean
      {
         super.a_4213();
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         this.a_4200(iCurrentTime);
         if(this.a_1447 < 20)
         {
            ++this.a_1447;
            x += a_1350;
            return true;
         }
         this.a_4199(iCurrentTime);
         if(this.a_1455)
         {
            if(0 == iCurrentTime % 2)
            {
               this.a_4198();
            }
         }
         return true;
      }
      
      private function a_4197() : void
      {
         this.a_1450 = a_4282.a_3926() as a_4282;
         this.a_1450.a_1797(0,-1);
         this.a_1450.gotoAndStop(1);
         this.a_1450.x = x;
         this.a_1450.y = y - 100;
         this.a_1452 = new Point();
         this.a_1452.x = this.a_1451.m_iXGridNo * a_3491.a_1080 + a_3491.a_1080 / 2;
         this.a_1452.y = this.a_1450.iYPosSkewing + a_3491.a_1081 * this.a_1451.m_iYGridNo + (a_3491.a_1081 - this.a_1450.height);
         var tempFrames:int = (a_4282(this.a_1450).getFrameLables()[1] as FrameLabel).frame;
         this.a_1453 = (this.a_1452.x - this.a_1450.x) / tempFrames;
         this.a_1454 = (this.a_1452.y - this.a_1450.y) / tempFrames;
         this.a_1455 = true;
         this.parent.addChild(this.a_1450);
      }
      
      private function a_4198() : void
      {
         var arrFrameLabels:Array = null;
         var currentFrameIndex:int = 0;
         var tempValue:Number = NaN;
         if(null != this.a_1450)
         {
            arrFrameLabels = a_4282(this.a_1450).getFrameLables();
            currentFrameIndex = this.a_1450.iCurrentFrame;
            if(currentFrameIndex <= (arrFrameLabels[1] as FrameLabel).frame)
            {
               tempValue = this.a_1450.x + this.a_1453;
               if(tempValue < this.a_1452.x)
               {
                  tempValue = this.a_1452.x;
               }
               this.a_1450.x = tempValue;
               tempValue = this.a_1450.y + this.a_1454;
               if(tempValue > this.a_1452.y)
               {
                  tempValue = this.a_1452.y;
               }
               this.a_1450.y = tempValue;
            }
            if(currentFrameIndex == (arrFrameLabels[2] as FrameLabel).frame)
            {
               this.a_1455 = false;
               this.a_1450.iGlobalMoveFighterID = this.a_2180();
               this.a_1450.m_stMoveIntruderTypeID = 8388608;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(this.a_1450,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.a_1451.m_iXGridNo,this.a_1451.m_iYGridNo));
               this.a_1450 = null;
               return;
            }
            this.a_1450.nextFrame();
         }
      }
      
      private function a_4199(iCurrentTime:int) : void
      {
         var gridOffset:int = 0;
         if(this.m_isWaiting)
         {
            ++this.a_1448;
            if(this.DELAY_TIME == this.a_1448)
            {
               this.m_isWaiting = false;
               this.a_1449 = true;
               this.ResetMovieStatus();
            }
         }
         else if(this.a_1449)
         {
            if(a_1273 == (a_1276[10] as FrameLabel).frame - 1 || a_1273 == (a_1276[9] as FrameLabel).frame - 1)
            {
               this.a_1449 = false;
               this.m_isReady = true;
               this.ResetMovieStatus();
            }
         }
         else if(this.m_isReady)
         {
            if(a_1273 == (a_1276[1] as FrameLabel).frame - 1 || a_1273 == (a_1276[2] as FrameLabel).frame - 1)
            {
               this.m_isReady = false;
               this.m_isFiring = true;
               this.ResetMovieStatus();
            }
         }
         else if(this.m_isFiring)
         {
            if(null == this.a_1450 && (a_1273 == (a_1276[3] as FrameLabel).frame - 1 || a_1273 == (a_1276[5] as FrameLabel).frame - 1))
            {
               a_1275 = a_1273 == (a_1276[3] as FrameLabel).frame - 1 ? 3 : 5;
               gridOffset = 5;
               this.a_1451.m_iXGridNo = m_stCurrentFieldGrid.m_iXGridNo - gridOffset;
               this.a_1451.m_iYGridNo = m_stCurrentFieldGrid.m_iYGridNo;
               this.a_4197();
            }
            if(a_1273 == (a_1276[4] as FrameLabel).frame - 1 || a_1273 == (a_1276[6] as FrameLabel).frame - 1)
            {
               this.m_isWaiting = true;
               this.a_1448 = 0;
               this.m_isFiring = false;
               this.ResetMovieStatus();
            }
         }
      }
      
      private function a_4200(iCurrentTime:int) : void
      {
         if(Boolean(m_stCurrentFieldGrid && null != m_stCurrentFieldGrid.m_stBoomDefense && !m_stCurrentFieldGrid.m_stBoomDefense.isCanBeEaten) && Boolean(iCurrentTime >= a_1477 + a_1476 * (1 / a_1470)) && !a_1464)
         {
            a_1472 = iCurrentTime + 22;
            a_1477 = iCurrentTime;
            a_1475 = true;
            a_4215(m_stCurrentFieldGrid.m_stBoomDefense);
         }
         if(a_1473 <= 0 && a_1474 <= 0 && iCurrentTime == a_1477 + 22)
         {
            GiantJumpSplashDamageOnGrid(0,true);
         }
      }
   }
}

