package com.aurora.ui.maogoutd.resource.Intruder.ThunderCity.LaserPatrol
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import flash.display.FrameLabel;
   import flash.geom.Point;
   
   public class LaserPatrolMouseMoveIntruder extends a_4206
   {
      
      private const FULL_HP:int = 5400;
      
      private const HURT_HP:int = 1000;
      
      private const DEAD_HP:int = 0;
      
      private var a_1500:Boolean;
      
      private var a_1502:Boolean;
      
      private var m_isAddMouse:Boolean;
      
      private var stlittleMouseMoveIntruder:LittleGaoDaMouseMoveIntruder;
      
      private var stlittleMouseFallFieldGrid:a_3491;
      
      private var stlittleMouseFallPoint:Point;
      
      private var stLittleMouseFlyVX:Number;
      
      private var stLittleMouseFlyVY:Number;
      
      private var a_1455:Boolean;
      
      public function LaserPatrolMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(LaserPatrolMouseMoveIntruder) as LaserPatrolMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return LaserPatrolMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (7 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = this.FULL_HP;
         a_1279 = -width * 0.3 - 3;
         a_1272 = 0;
         a_1377 = 0;
         a_1476 = 50;
         a_1477 = 0;
         this.a_1500 = true;
         this.a_1502 = false;
         this.m_isAddMouse = false;
         this.a_1455 = false;
         BoomIsReduceLife = true;
         return true;
      }
      
      protected function a_2180() : int
      {
         return (globalMoveFighterID << 16) + 1;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(null != this.stlittleMouseMoveIntruder)
         {
            this.a_1455 = false;
            if(null != this.stlittleMouseMoveIntruder.parent)
            {
               this.stlittleMouseMoveIntruder.parent.removeChild(this.stlittleMouseMoveIntruder);
            }
            this.stlittleMouseMoveIntruder = null;
         }
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.HURT_HP)
         {
            if(this.a_1502)
            {
               if(a_1275 != 4)
               {
                  a_1275 = 4;
                  gotoAndStop((a_1276[4] as FrameLabel).frame);
               }
            }
            else if(a_1475)
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
               if(a_1275 != 5)
               {
                  a_1275 = 5;
                  gotoAndStop((a_1276[5] as FrameLabel).frame);
               }
            }
            else if(a_1475)
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
         else if(a_1339 <= this.DEAD_HP && a_1275 != 6)
         {
            a_1275 = 6;
            gotoAndStop((a_1276[6] as FrameLabel).frame);
            a_3419();
            if(m_stCurrentFieldGrid != null)
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
         if(!this.a_1502)
         {
            super.a_4216(iCurrentTime);
         }
         if(this.a_1500)
         {
            if(m_stCurrentFieldGrid.m_iXGridNo == BattleFieldView.a_1011 - 3)
            {
               if(x <= m_stCurrentFieldGrid.m_iXGridNo * a_3491.a_1080 + a_3491.a_1080 / 2)
               {
                  this.a_1502 = true;
                  this.m_isAddMouse = false;
                  this.a_1500 = false;
                  this.ResetMovieStatus();
               }
            }
            else if(m_stCurrentFieldGrid.m_iXGridNo < BattleFieldView.a_1011 - 3)
            {
               this.a_1500 = false;
            }
         }
         if(this.a_1502 && 0 == iCurrentTime % 2)
         {
            if(a_1273 == (a_1276[4] as FrameLabel).frame + 8 || a_1273 == (a_1276[5] as FrameLabel).frame + 8)
            {
               this.stlittleMouseFallFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 5,m_stCurrentFieldGrid.m_iYGridNo);
               if(!this.m_isAddMouse)
               {
                  this.a_4197();
                  this.m_isAddMouse = true;
               }
            }
            else if(a_1273 == (a_1276[5] as FrameLabel).frame - 1 || a_1273 == (a_1276[6] as FrameLabel).frame - 1)
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
         if(this.stlittleMouseFallFieldGrid == null)
         {
            return;
         }
         this.stlittleMouseMoveIntruder = LittleGaoDaMouseMoveIntruder.a_3926() as LittleGaoDaMouseMoveIntruder;
         this.stlittleMouseMoveIntruder.a_1797(0,-1);
         this.stlittleMouseMoveIntruder.gotoAndStop(1);
         this.stlittleMouseMoveIntruder.x = x;
         this.stlittleMouseMoveIntruder.y = y - 14;
         this.stlittleMouseFallPoint = new Point();
         this.stlittleMouseFallPoint.x = this.stlittleMouseFallFieldGrid.m_iXGridNo * a_3491.a_1080 - a_3491.a_1080 / 2;
         this.stlittleMouseFallPoint.y = this.stlittleMouseMoveIntruder.iYPosSkewing + a_3491.a_1081 * this.stlittleMouseFallFieldGrid.m_iYGridNo + (a_3491.a_1081 - this.stlittleMouseMoveIntruder.height);
         var tempFrames:int = (LittleGaoDaMouseMoveIntruder(this.stlittleMouseMoveIntruder).getFrameLables()[1] as FrameLabel).frame;
         this.stLittleMouseFlyVX = (this.stlittleMouseFallPoint.x - this.stlittleMouseMoveIntruder.x) / tempFrames;
         this.stLittleMouseFlyVY = (this.stlittleMouseFallPoint.y - this.stlittleMouseMoveIntruder.y) / tempFrames;
         this.a_1455 = true;
         this.parent.addChild(this.stlittleMouseMoveIntruder);
      }
      
      private function a_4198() : void
      {
         var arrFrameLabels:Array = null;
         var currentFrameIndex:int = 0;
         var tempValue:Number = NaN;
         if(null != this.stlittleMouseMoveIntruder)
         {
            arrFrameLabels = this.stlittleMouseMoveIntruder.getFrameLables();
            currentFrameIndex = this.stlittleMouseMoveIntruder.iCurrentFrame;
            if(currentFrameIndex < (arrFrameLabels[1] as FrameLabel).frame)
            {
               tempValue = this.stlittleMouseMoveIntruder.x + this.stLittleMouseFlyVX;
               if(tempValue < this.stlittleMouseFallPoint.x)
               {
                  tempValue = this.stlittleMouseFallPoint.x;
               }
               this.stlittleMouseMoveIntruder.x = tempValue;
               tempValue = this.stlittleMouseMoveIntruder.y + this.stLittleMouseFlyVY;
               if(tempValue > this.stlittleMouseFallPoint.y)
               {
                  tempValue = this.stlittleMouseFallPoint.y;
               }
               this.stlittleMouseMoveIntruder.y = tempValue;
            }
            if(currentFrameIndex == (arrFrameLabels[1] as FrameLabel).frame - 1)
            {
               this.a_1455 = false;
               this.stlittleMouseMoveIntruder.iGlobalMoveFighterID = this.a_2180();
               this.stlittleMouseMoveIntruder.m_stMoveIntruderTypeID = 8388608;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3459(this.stlittleMouseMoveIntruder,m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(this.stlittleMouseFallFieldGrid.m_iXGridNo,this.stlittleMouseFallFieldGrid.m_iYGridNo));
               this.stlittleMouseMoveIntruder = null;
               return;
            }
            this.stlittleMouseMoveIntruder.nextFrame();
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
         if(iCurrentTime % 2 == 0)
         {
            if(a_1273 == 46 || a_1273 == 59)
            {
               this.a_3502(m_stCurrentFieldGrid);
            }
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return true;
         }
         return stFieldGrid.ClearFieldGridDefenseWithOption();
      }
   }
}

