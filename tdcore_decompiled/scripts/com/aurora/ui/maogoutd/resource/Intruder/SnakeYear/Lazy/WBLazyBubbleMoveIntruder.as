package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Lazy
{
   import a_4718.b_182;
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class WBLazyBubbleMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 100000;
      
      private static const ONE_GRID_SPEED:Number = 0.6;
      
      protected static var a_1490:Array = new Array();
      
      private var m_iMoveState:int = 0;
      
      private var m_iRemainTick:int = -1;
      
      private var m_iWaitNum:int = -1;
      
      private var m_iTimeNum:int = -1;
      
      private var m_iDelayTick:int = 0;
      
      protected var m_fMoveSpeedX:Number = 0;
      
      protected var m_fMoveSpeedY:Number = 0;
      
      private var m_lStopArr:Array = [286851424,286851614,286851615,286851408];
      
      private var m_lDsteoyArr:Array = [286393200,286393214,288490367];
      
      private var targetGrid:a_3491;
      
      public function WBLazyBubbleMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : WBLazyBubbleMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(WBLazyBubbleMoveIntruder) as WBLazyBubbleMoveIntruder;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = 0;
         a_1339 = MAX_LIFE;
         scaleX = 0.7;
         scaleY = 0.7;
         a_1279 = -42;
         m_iYDisplayCenterPos = -73;
         a_1272 = 0;
         a_1463 = true;
         a_1464 = true;
         a_1465 = 3;
         this.m_iMoveState = 0;
         a_1275 = 0;
         gotoAndStop((a_1276[0] as FrameLabel).frame);
         a_3419();
         this.m_iWaitNum = -1;
         this.m_iTimeNum = -1;
         this.m_iRemainTick = -1;
         this.m_iDelayTick = 0;
         a_1789.getInstance().addEventListener("DefenseCardCountChange",this.a_3483);
         return true;
      }
      
      public function InitData(delayTick:int) : void
      {
         if(delayTick == 0)
         {
            this.m_iDelayTick = 0;
            this.RealGoMove();
         }
         else
         {
            this.m_iDelayTick = delayTick;
         }
      }
      
      public function RealGoMove() : void
      {
         this.m_iMoveState = 1;
         a_1350 = a_3491.a_1080 / (20 * ONE_GRID_SPEED);
         if(!a_1283)
         {
            a_1350 *= -1;
         }
         this.m_iRemainTick = this.setMoveToPosition(0,-1);
      }
      
      protected function setMoveToPosition(iNoX:int, iNoY:int) : int
      {
         var fDistanceX:Number = this.getPosXByXGridNo(iNoX) - this.x;
         var fDistanceY:Number = this.getPosXByXGridNo(iNoY) - this.y;
         if(iNoX == -1)
         {
            fDistanceX = 0;
         }
         else if(iNoY == -1)
         {
            fDistanceY = 0;
         }
         var fDistance:Number = Math.sqrt(fDistanceX * fDistanceX + fDistanceY * fDistanceY);
         var iMoveTick:int = fDistance / (60 / (20 * ONE_GRID_SPEED));
         if(iMoveTick > 0)
         {
            this.m_fMoveSpeedY = fDistanceY / iMoveTick;
            this.m_fMoveSpeedX = fDistanceX / iMoveTick;
         }
         else
         {
            this.m_fMoveSpeedY = 0;
            this.m_fMoveSpeedX = 0;
         }
         return iMoveTick;
      }
      
      protected function getPosXByXGridNo(iXGridNo:int) : Number
      {
         return a_3491.a_1080 * (iXGridNo + 0.5);
      }
      
      protected function getPosYByYGridNo(iYGridNo:int) : Number
      {
         return a_3491.a_1081 * (iYGridNo + 0.5);
      }
      
      override protected function a_3940() : Boolean
      {
         a_1789.getInstance().removeEventListener("DefenseCardCountChange",this.a_3483);
         super.a_3940();
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var stNextFieldGrid:a_3491 = null;
         if(!a_1460)
         {
            a_1460 = true;
         }
         this.m_iTimeNum = iCurrentTime;
         if(this.m_iDelayTick > 0)
         {
            --this.m_iDelayTick;
            if(this.m_iDelayTick == 0)
            {
               this.RealGoMove();
            }
         }
         if(this.m_iRemainTick > 0)
         {
            --this.m_iRemainTick;
            x += this.m_fMoveSpeedX;
            if(this.m_fMoveSpeedX <= 0)
            {
               a_1283 = false;
            }
            else
            {
               a_1283 = true;
            }
            y += this.m_fMoveSpeedY;
            if(this.m_iRemainTick == 0)
            {
               this.StopMove();
            }
         }
         var iXGridNo:int = GetiNoX();
         var iYGridNo:int = int(y / a_3491.a_1081);
         if(iXGridNo < 0)
         {
            iXGridNo = 0;
         }
         if(iXGridNo > 8)
         {
            iXGridNo = 8;
         }
         if(iYGridNo < 0)
         {
            iYGridNo = 0;
         }
         if(iYGridNo > 6)
         {
            iXGridNo = 6;
         }
         if(m_stCurrentFieldGrid.m_iXGridNo != iXGridNo || m_stCurrentFieldGrid.m_iYGridNo != iYGridNo)
         {
            stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,iYGridNo);
            ChangeFieldGrid(stNextFieldGrid);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_LAND_TYPE,stNextFieldGrid);
         }
         if(m_LastPositionX != x || m_LastPositionY != y)
         {
            m_LastPositionX = x;
            m_LastPositionY = y;
            UpdateFollowEffect();
         }
         if(this.m_iWaitNum > 0 && iCurrentTime - this.m_iWaitNum == 20 * 2)
         {
            a_1339 = 0;
            this.ResetMovieStatus();
         }
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            this.SetAnimation2(0);
         }
         else
         {
            this.SetAnimation2(1);
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         return true;
      }
      
      private function a_3483(stDataEvent:a_1778) : void
      {
         var iDefenseTypeID:int = int(stDataEvent.dataObject[0]);
         var tempFieldGrid:Object = stDataEvent.dataObject.length >= 3 ? stDataEvent.dataObject[2] : null;
         if(tempFieldGrid == null)
         {
            return;
         }
         if(this.m_lStopArr.indexOf(iDefenseTypeID) != -1)
         {
            this.StopMove();
         }
         else if(this.m_lDsteoyArr.indexOf(iDefenseTypeID) != -1)
         {
            this.RealDie();
         }
      }
      
      private function StopMove() : void
      {
         if(this.m_iMoveState == 2)
         {
            return;
         }
         a_1350 = 0;
         this.m_fMoveSpeedX = 0;
         this.m_fMoveSpeedY = 0;
         this.m_iRemainTick = 0;
         a_1789.getInstance().removeEventListener("DefenseCardCountChange",this.a_3483);
         this.targetGrid = m_stCurrentFieldGrid;
         this.m_iMoveState = 2;
         this.m_iWaitNum = this.m_iTimeNum;
      }
      
      public function RealDie() : Boolean
      {
         a_1339 = 0;
         if(m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         this.a_3940();
         return true;
      }
      
      override public function a_4140(iCurrentTime:int) : void
      {
         if(a_1273 == 20 && this.targetGrid != null)
         {
            BattleDestroyUtil.ClearOneGrid(this.targetGrid);
            this.targetGrid = null;
         }
         super.a_4140(iCurrentTime);
      }
      
      override protected function getBindMovie() : Class
      {
         return WBLazyBubbleMoveIntruderMovie;
      }
      
      override public function ReduceAllLife(iRduceLifeValue:int, bIsIgnoreArmor:Boolean = false, ishowHuijing:Boolean = false) : Boolean
      {
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         return true;
      }
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         return true;
      }
      
      override public function a_4211(iCutLifeValue:int) : Boolean
      {
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      public function SetAnimation2(animIdx:int) : void
      {
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
   }
}

