package com.aurora.ui.maogoutd.resource.Intruder.newMouse
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4143;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class WaterPandaMouseMoveIntruder extends a_4206
   {
      
      private const FULL_HP:int = 2700;
      
      private const HURT_HP:int = 1000;
      
      private const DEAD_HP:int = 0;
      
      private var a_1500:Boolean;
      
      private var a_1501:Boolean;
      
      private var a_1502:Boolean;
      
      private var a_1450:LittleWaterPandaMouseMoveIntruder;
      
      private var a_1451:a_3491 = new a_3491(null,0,0);
      
      private var a_1503:Point;
      
      private var a_1453:Number;
      
      private var a_1454:Number;
      
      private var a_1455:Boolean;
      
      public function WaterPandaMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WaterPandaMouseMoveIntruder) as WaterPandaMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WaterPandaMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (6.5 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = this.FULL_HP;
         a_1279 = -width * 0.3;
         a_1272 = 0;
         a_1377 = 0;
         a_1476 = 50;
         a_1477 = 0;
         this.a_1500 = true;
         this.a_1501 = false;
         this.a_1502 = false;
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
            if(this.a_1502)
            {
               if(a_1275 != 8)
               {
                  a_1275 = 8;
                  gotoAndStop((a_1276[8] as FrameLabel).frame);
               }
            }
            else if(a_1475)
            {
               if(this.a_1501)
               {
                  if(a_1275 != 6)
                  {
                     a_1275 = 6;
                     gotoAndStop((a_1276[6] as FrameLabel).frame);
                  }
               }
               else if(a_1275 != 4)
               {
                  a_1275 = 4;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
               }
            }
            else if(this.a_1501)
            {
               if(a_1275 != 2)
               {
                  a_1275 = 2;
                  gotoAndStop((a_1276[2] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 0)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 > this.DEAD_HP)
         {
            if(this.a_1502)
            {
               if(a_1275 != 9)
               {
                  a_1275 = 9;
                  gotoAndStop((a_1276[9] as FrameLabel).frame);
               }
            }
            else if(a_1475)
            {
               if(this.a_1501)
               {
                  if(a_1275 != 7)
                  {
                     a_1275 = 7;
                     gotoAndStop((a_1276[7] as FrameLabel).frame);
                  }
               }
               else if(a_1275 != 5)
               {
                  a_1275 = 5;
                  gotoAndStop((a_1276[5] as FrameLabel).frame);
               }
            }
            else if(this.a_1501)
            {
               if(a_1275 != 3)
               {
                  a_1275 = 3;
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
         else if(a_1339 <= this.DEAD_HP && a_1275 != 10)
         {
            a_1275 = 10;
            gotoAndStop((a_1276[10] as FrameLabel).frame);
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
         if(this.a_1500)
         {
            if(!this.a_1501)
            {
               if(!this.a_1502)
               {
                  if(a_1339 < this.FULL_HP / 2)
                  {
                     this.a_1502 = true;
                     this.a_1500 = false;
                  }
               }
            }
         }
         if(a_1339 == this.HURT_HP)
         {
            if(this.a_1502)
            {
               if(a_1275 != 9)
               {
                  a_1275 = 9;
                  gotoAndStop((a_1276[9] as FrameLabel).frame);
               }
            }
            else if(a_1475)
            {
               if(this.a_1501)
               {
                  if(a_1275 != 7)
                  {
                     a_1275 = 7;
                     gotoAndStop((a_1276[7] as FrameLabel).frame);
                  }
               }
               else if(a_1275 != 5)
               {
                  a_1275 = 5;
                  gotoAndStop((a_1276[5] as FrameLabel).frame);
               }
            }
            else if(this.a_1501)
            {
               if(a_1275 != 3)
               {
                  a_1275 = 3;
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
         else if(a_1339 <= this.DEAD_HP && a_1275 != 10)
         {
            a_1275 = 10;
            gotoAndStop((a_1276[10] as FrameLabel).frame);
            a_3419();
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            play();
         }
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         var stSmallMouseBoomdie:a_4143 = null;
         this.a_3969(900);
         if(a_1339 <= 0)
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
            this.a_3940();
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
         this.a_3969(900);
         if(a_1339 <= 0)
         {
            a_4212();
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stFieldGrid:a_3491 = null;
         this.a_4200(iCurrentTime);
         super.a_4216(iCurrentTime);
         if(this.a_1500)
         {
            if(m_stCurrentFieldGrid.m_iXGridNo == BattleFieldView.a_1011 - 3)
            {
               if(x <= m_stCurrentFieldGrid.m_iXGridNo * a_3491.a_1080 + a_3491.a_1080 / 2)
               {
                  this.a_1502 = true;
                  this.a_1500 = false;
                  this.ResetMovieStatus();
               }
            }
            else if(m_stCurrentFieldGrid.m_iXGridNo < BattleFieldView.a_1011 - 3)
            {
               this.a_1500 = false;
            }
         }
         if(this.a_1502)
         {
            if(a_1273 == (a_1276[8] as FrameLabel).frame + 6 || a_1273 == (a_1276[9] as FrameLabel).frame + 6)
            {
               if(!this.a_1501)
               {
                  this.a_1451.m_iXGridNo = m_stCurrentFieldGrid.m_iXGridNo - 5;
                  this.a_1451.m_iYGridNo = m_stCurrentFieldGrid.m_iYGridNo;
                  if(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 5,m_stCurrentFieldGrid.m_iYGridNo))
                  {
                     this.a_1501 = true;
                     this.a_4197();
                  }
               }
            }
            else if(a_1273 == (a_1276[9] as FrameLabel).frame - 1 || a_1273 == (a_1276[10] as FrameLabel).frame - 1)
            {
               if(this.a_1502)
               {
                  this.a_1502 = false;
                  this.ResetMovieStatus();
               }
            }
         }
         if(this.a_1455)
         {
            if(0 == iCurrentTime % 2)
            {
               this.a_4198();
            }
         }
         return true;
      }
      
      override public function a_4140(iCurrentTime:int) : void
      {
         super.a_4140(iCurrentTime);
      }
      
      private function a_4197() : void
      {
         this.a_1450 = LittleWaterPandaMouseMoveIntruder.a_3926() as LittleWaterPandaMouseMoveIntruder;
         this.a_1450.a_1797(0,-1);
         this.a_1450.gotoAndStop(1);
         this.a_1450.x = x;
         this.a_1450.y = y - 100;
         this.a_1503 = new Point();
         this.a_1503.x = this.a_1451.m_iXGridNo * a_3491.a_1080 + a_3491.a_1080 / 2;
         this.a_1503.y = this.a_1450.iYPosSkewing + a_3491.a_1081 * this.a_1451.m_iYGridNo + (a_3491.a_1081 - this.a_1450.height);
         var tempFrames:int = (LittleWaterPandaMouseMoveIntruder(this.a_1450).getFrameLables()[1] as FrameLabel).frame;
         this.a_1453 = (this.a_1503.x - this.a_1450.x) / tempFrames;
         this.a_1454 = (this.a_1503.y - this.a_1450.y) / tempFrames;
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
            arrFrameLabels = LittleWaterPandaMouseMoveIntruder(this.a_1450).getFrameLables();
            currentFrameIndex = this.a_1450.iCurrentFrame;
            if(currentFrameIndex <= (arrFrameLabels[1] as FrameLabel).frame)
            {
               tempValue = this.a_1450.x + this.a_1453;
               if(tempValue < this.a_1503.x)
               {
                  tempValue = this.a_1503.x;
               }
               this.a_1450.x = tempValue;
               tempValue = this.a_1450.y + this.a_1454;
               if(tempValue > this.a_1503.y)
               {
                  tempValue = this.a_1503.y;
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
      
      private function a_4200(iCurrentTime:int) : void
      {
         if(Boolean(m_stCurrentFieldGrid && null != m_stCurrentFieldGrid.m_stBoomDefense && !m_stCurrentFieldGrid.m_stBoomDefense.isCanBeEaten) && Boolean(iCurrentTime >= a_1477 + a_1476 * (1 / a_1470)) && !a_1464)
         {
            a_1472 = iCurrentTime + 22;
            a_1477 = iCurrentTime;
            a_1475 = true;
            a_4215(m_stCurrentFieldGrid.m_stBoomDefense);
            this.ResetMovieStatus();
         }
         if(a_1473 <= 0 && a_1474 <= 0 && iCurrentTime == a_1477 + 22)
         {
            GiantJumpSplashDamageOnGrid(900);
         }
      }
   }
}

