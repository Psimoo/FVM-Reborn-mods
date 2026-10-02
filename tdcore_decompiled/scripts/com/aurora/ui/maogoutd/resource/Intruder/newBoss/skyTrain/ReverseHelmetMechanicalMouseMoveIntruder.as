package com.aurora.ui.maogoutd.resource.Intruder.newBoss.skyTrain
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import flash.display.FrameLabel;
   
   public class ReverseHelmetMechanicalMouseMoveIntruder extends a_4206
   {
      
      public function ReverseHelmetMechanicalMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(ReverseHelmetMechanicalMouseMoveIntruder) as ReverseHelmetMechanicalMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return ReverseHelmetMechanicalMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 120;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = 1320;
         a_1279 = -width * 0.4;
         a_1272 = 0;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 660)
         {
            if(a_1475)
            {
               if(a_1275 != 5)
               {
                  a_1275 = 5;
                  gotoAndStop((a_1276[5] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 0)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[0] as FrameLabel).frame);
            }
         }
         else if(a_1339 > 330)
         {
            if(a_1475)
            {
               if(a_1275 != 6)
               {
                  a_1275 = 6;
                  gotoAndStop((a_1276[6] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         else if(a_1339 > 50)
         {
            if(a_1475)
            {
               if(a_1275 != 8)
               {
                  a_1275 = 8;
                  gotoAndStop((a_1276[7] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 3)
            {
               a_1275 = 3;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
            a_3419();
         }
         else if(a_1339 > 0)
         {
            if(a_1475)
            {
               if(a_1275 != 9)
               {
                  a_1275 = 9;
                  gotoAndStop((a_1276[9] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 4)
            {
               a_1275 = 4;
               gotoAndStop((a_1276[4] as FrameLabel).frame);
            }
         }
         else if(a_1339 <= 0 && a_1275 != 10)
         {
            a_1275 = 10;
            gotoAndStop((a_1276[10] as FrameLabel).frame);
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            this.play();
         }
         a_3419();
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         if(a_1339 == 660)
         {
            if(a_1475)
            {
               if(a_1275 != 6)
               {
                  a_1275 = 6;
                  gotoAndStop((a_1276[6] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         else if(a_1339 == 330)
         {
            if(a_1475)
            {
               if(a_1275 != 8)
               {
                  a_1275 = 8;
                  gotoAndStop((a_1276[7] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 3)
            {
               a_1275 = 3;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
         }
         else if(a_1339 == 50)
         {
            if(a_1475)
            {
               if(a_1275 != 9)
               {
                  a_1275 = 9;
                  gotoAndStop((a_1276[9] as FrameLabel).frame);
               }
            }
            else if(a_1275 != 4)
            {
               a_1275 = 4;
               gotoAndStop((a_1276[4] as FrameLabel).frame);
            }
         }
         else if(a_1339 <= 0 && a_1275 != 10)
         {
            a_1275 = 10;
            gotoAndStop((a_1276[10] as FrameLabel).frame);
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            this.play();
         }
         a_3419();
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         m_stCurrentFieldGrid.a_3457(this);
         m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         super.a_4210();
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      private function GoAhead2(iCurrentTime:int) : Boolean
      {
         var iXGridNo:int = 0;
         var stNextFielGrid:a_3491 = null;
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
            a_1474 = 20;
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
               a_3940();
               return true;
            }
            return true;
         }
         if(a_1474 <= 0 && iCurrentTime >= a_1472 + a_1471 && (!HasBlockingDefenseOnGrid(true) || a_1464))
         {
            a_1472 = iCurrentTime;
            this.play();
            x += a_1350 * a_1470;
            iXGridNo = int(x / a_3491.a_1080);
            if(iXGridNo >= 0 && iXGridNo < BattleFieldView.a_1011 && m_stCurrentFieldGrid.m_iXGridNo != iXGridNo)
            {
               stNextFielGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
               stNextFielGrid.a_3459(this);
               if(stNextFielGrid.m_stBaseLander != null)
               {
                  a_1474 = 20;
               }
            }
            else if(iXGridNo < (a_1283 ? -1 : 0) || iXGridNo > BattleFieldView.a_1011)
            {
               trace("iXGridNo < -1 || iXGridNo > BattleFieldView.ms_iXGridNum  Realease the MoveIntruder");
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               a_3940();
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
            x += numMoveSpeed;
            y += 6 * (10 - a_1474 > 0 ? 1 : -1);
            iXGridNo = int(x / a_3491.a_1080);
            if(iXGridNo >= 0 && iXGridNo < BattleFieldView.a_1011 && m_stCurrentFieldGrid.m_iXGridNo != iXGridNo)
            {
               stNextFielGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
               stNextFielGrid.a_3459(this);
               if(stNextFielGrid.m_stBaseLander != null)
               {
                  a_1474 = 20;
               }
            }
            else if(iXGridNo < (a_1283 ? -1 : 0) || iXGridNo > BattleFieldView.a_1011)
            {
               trace("iXGridNo < -1 || iXGridNo > BattleFieldView.ms_iXGridNum  Realease the MoveIntruder");
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               a_3940();
               return true;
            }
         }
         if(a_1473 <= 0 && a_1474 <= 0 && iCurrentTime >= a_1477 + a_1476 * (1 / a_1470) && !a_1464)
         {
            if(m_stCurrentFieldGrid.m_stBaseLander != null)
            {
               a_1474 = 20;
               a_1475 = false;
               this.ResetMovieStatus();
            }
            TryEatDefenseOnGridSimple(iCurrentTime,true);
         }
         if(a_1475 && null == m_stCurrentFieldGrid.m_stProtector && null == m_stCurrentFieldGrid.m_stAttackFighter && null == m_stCurrentFieldGrid.m_stFlowerDefense && null == m_stCurrentFieldGrid.m_stBaseAuxiliaryFighter && null == m_stCurrentFieldGrid.m_stHoneyTrapBaseDefense && null == m_stCurrentFieldGrid.m_stOceanGoddessToolDefense && null == m_stCurrentFieldGrid.m_stTrayDefense && null == m_stCurrentFieldGrid.m_stBoomDefense)
         {
            a_1475 = false;
            this.ResetMovieStatus();
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         this.GoAhead2(iCurrentTime);
         return true;
      }
      
      override public function play() : void
      {
         super.play();
      }
   }
}

