package com.aurora.ui.maogoutd.resource.Intruder
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class BaseMoveIntruderRepaired extends a_4206
   {
      
      private var m_iTargetYGrid:int = 0;
      
      private var m_iMoveYSpeed:Number = 0;
      
      private var m_iMoveYTimes:int = 0;
      
      public function BaseMoveIntruderRepaired()
      {
         super();
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.m_iMoveYTimes = this.m_iMoveYSpeed = 0;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var iXGridNo:int = 0;
         var stNextFieldGrid:a_3491 = null;
         var numMoveSpeed:Number = NaN;
         if(!a_1460)
         {
            a_1460 = true;
         }
         if(a_1468 > 0 || a_1469 > 0)
         {
            return true;
         }
         if(null == m_stCurrentFieldGrid)
         {
            return false;
         }
         if(x == (a_1283 ? 0 : BattleFieldView.a_1013) && m_stCurrentFieldGrid.m_stBaseLander != null)
         {
            x += a_1283 ? 2 : -2;
            SetClarmLanderTime();
         }
         if(!a_1283 && x <= 0 || a_1283 && x >= BattleFieldView.a_1013)
         {
            x += a_1350 * a_1470;
            if(!a_1283 && x <= -40 || a_1283 && x >= BattleFieldView.a_1013 + 40)
            {
               if(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.isOwnBattleField)
               {
                  a_1088.a_2062(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.iTimeIntervalNum,m_stCurrentFieldGrid.m_iYGridNo);
               }
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_stRowBreakDownMoveIntruderBitmap.bitmapData = stDisplayBitmap.bitmapData;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_stRowBreakDownMoveIntruderBitmap.x = x + stDisplayBitmap.x + (a_1283 ? 50 : -50);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_stRowBreakDownMoveIntruderBitmap.y = y + stDisplayBitmap.y;
               trace("m_isReversed && x <= -40 || !m_isReversed && x >= BattleFieldView.ms_iBattleFieldWidth + 40  Realease the MoveIntruder");
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               if(!m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.isOwnBattleField)
               {
                  iGlobalMoveFighterID = -1;
               }
               this.a_3940();
               return true;
            }
            return true;
         }
         if(a_1474 <= 0 && iCurrentTime >= a_1472 + a_1471 && !a_1475 && !HasCanEatTarget())
         {
            this.CheckUpdateYPosition();
            a_1472 = iCurrentTime;
            play();
            x += a_1350 * a_1470;
            iXGridNo = int(x / a_3491.a_1080);
            if(iXGridNo >= 0 && iXGridNo < BattleFieldView.a_1011 && m_stCurrentFieldGrid.m_iXGridNo != iXGridNo)
            {
               stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
               ChangeFieldGrid(stNextFieldGrid);
               if(stNextFieldGrid.m_stBaseLander != null)
               {
                  SetClarmLanderTime();
               }
            }
            else if(iXGridNo < 0 || iXGridNo >= BattleFieldView.a_1011)
            {
               trace("iXGridNo < 0 || iXGridNo >= BattleFieldView.ms_iXGridNum  Realease the MoveIntruder");
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               this.a_3940();
               return true;
            }
         }
         if(a_1474 > 0)
         {
            --a_1474;
            numMoveSpeed = a_3491.a_1080 / 20;
            if(!a_1283)
            {
               numMoveSpeed *= -1;
            }
            x += numMoveSpeed * m_fClimbWidthTick;
            y += GetHeightByClarmLanderTime();
            iXGridNo = int(x / a_3491.a_1080);
            if(iXGridNo >= 0 && iXGridNo < BattleFieldView.a_1011 && m_stCurrentFieldGrid.m_iXGridNo != iXGridNo)
            {
               stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
               ChangeFieldGrid(stNextFieldGrid);
               if(stNextFieldGrid.m_stBaseLander != null)
               {
                  SetClarmLanderTime();
               }
            }
            else if(iXGridNo < 0 || iXGridNo >= BattleFieldView.a_1011)
            {
               trace("iXGridNo < 0 || iXGridNo >= BattleFieldView.ms_iXGridNum  Realease the MoveIntruder");
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               this.a_3940();
               return true;
            }
         }
         if(a_1473 <= 0 && a_1474 <= 0 && iCurrentTime >= a_1477 + a_1476 * (1 / a_1470) && !a_1464)
         {
            TryEatDefenseOnGrid(iCurrentTime);
         }
         EattingJudge();
         return true;
      }
      
      override public function SetMoveToYPosition(fYPosition:Number, iTargetYGrid:int, iMoveYTime:int = 20) : void
      {
         var fDistance:Number = NaN;
         var fMoveYSpeed:Number = NaN;
         if(a_1460 && !a_1462 && this.m_iMoveYTimes < 1 && null != m_stCurrentFieldGrid && m_stCurrentFieldGrid.m_iYGridNo != iTargetYGrid)
         {
            fDistance = Math.abs(fYPosition - y);
            if(fDistance > 2)
            {
               fMoveYSpeed = fDistance / iMoveYTime;
               if(fMoveYSpeed < 1)
               {
                  fMoveYSpeed = 1;
                  iMoveYTime = fDistance / fMoveYSpeed;
               }
               this.m_iMoveYSpeed = fMoveYSpeed;
               if(fYPosition < y)
               {
                  this.m_iMoveYSpeed = -this.m_iMoveYSpeed;
               }
               this.m_iMoveYTimes = iMoveYTime;
               this.m_iTargetYGrid = iTargetYGrid;
               SetCannotSeeByFighter(true);
               if(a_1475)
               {
                  a_1475 = false;
                  ResetMovieStatus();
               }
               trace("*********MoveToYGrid:" + fYPosition + "********m_iMoveYSpeed:" + this.m_iMoveYSpeed + "  m_iMoveYTimes:" + this.m_iMoveYTimes + "**********");
            }
         }
         else
         {
            trace("*******MoveToYGrid:" + fYPosition + "************Fail:m_stCurrentFieldGrid is null**********");
         }
      }
      
      protected function CheckUpdateYPosition() : void
      {
         var stNextFielGrid:a_3491 = null;
         if(this.m_iMoveYTimes < 1)
         {
            return;
         }
         --this.m_iMoveYTimes;
         if(null == m_stCurrentFieldGrid)
         {
            return;
         }
         y += this.m_iMoveYSpeed;
         if(y + this.height < 0)
         {
            y = this.height;
         }
         else if(y + this.height > BattleFieldView.a_1014)
         {
            y = BattleFieldView.a_1014 - this.height;
         }
         if(0 == this.m_iMoveYTimes)
         {
            y = iYPosSkewing + a_3491.a_1081 * (1 + this.m_iTargetYGrid) - height - stDisplayBitmap.y;
            stNextFielGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo,this.m_iTargetYGrid);
            ChangeFieldGrid(stNextFielGrid);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(this,BattleLayerDefine.INTRUDER_LAND_TYPE,stNextFielGrid);
            SetCannotSeeByFighter(false);
            return;
         }
      }
   }
}

