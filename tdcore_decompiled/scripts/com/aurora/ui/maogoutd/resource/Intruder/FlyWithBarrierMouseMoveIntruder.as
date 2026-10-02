package com.aurora.ui.maogoutd.resource.Intruder
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.MousePigBarrier;
   import flash.display.FrameLabel;
   
   public class FlyWithBarrierMouseMoveIntruder extends a_4206
   {
      
      protected var m_isFlying:Boolean = true;
      
      protected var a_1496:int;
      
      public function FlyWithBarrierMouseMoveIntruder()
      {
         a_1467 = -25;
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(FlyWithBarrierMouseMoveIntruder) as FlyWithBarrierMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return FlyWithBarrierMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 50;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         this.m_isFlying = true;
         this.a_1496 = 12;
         a_1339 = 660;
         a_1279 = -width * 0.5;
         a_1465 = 3;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0 && a_1275 != 2 && a_1275 != 7)
         {
            if(this.m_isFlying)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
            else
            {
               a_1275 = 7;
               gotoAndStop((a_1276[7] as FrameLabel).frame);
            }
            a_3419();
            if(null != m_stCurrentFieldGrid)
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
            if(this.m_isFlying)
            {
               if(a_1275 != 0)
               {
                  a_1275 = 0;
                  gotoAndStop((a_1276[0] as FrameLabel).frame);
               }
            }
            else if(a_1475)
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
            a_3419();
         }
         else if(a_1339 <= 0 && a_1275 != 2 && a_1275 != 7)
         {
            if(this.m_isFlying)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
            else
            {
               a_1275 = 7;
               gotoAndStop((a_1276[7] as FrameLabel).frame);
            }
            a_3419();
            if(null != m_stCurrentFieldGrid)
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
         if(null != m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
         super.a_4210();
         return true;
      }
      
      override public function a_4214() : Boolean
      {
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var iXGridNo:int = 0;
         var m_iOldFieldGridType:int = 0;
         var stMousePigBarrier:MousePigBarrier = null;
         if(a_1468 > 0 || a_1469 > 0)
         {
            return true;
         }
         if(null == m_stCurrentFieldGrid)
         {
            return false;
         }
         var numOrigXPos:Number = x;
         if(iCurrentTime >= a_1472 + a_1471 && (this.m_isFlying || !this.m_isFlying && this.a_1496 <= 0 && !HasBlockingDefenseOnGrid()))
         {
            a_1472 = iCurrentTime;
            play();
            x += a_1350 * a_1470;
            iXGridNo = int(x / a_3491.a_1080);
            if(a_1283)
            {
               iXGridNo = BattleFieldView.a_1011 - 1 - iXGridNo;
            }
            if(iXGridNo >= 0 && iXGridNo < BattleFieldView.a_1011 && m_stCurrentFieldGrid.m_iXGridNo != iXGridNo)
            {
               ChangeFieldGrid(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,m_stCurrentFieldGrid.m_iYGridNo));
            }
            if(this.m_isFlying && iXGridNo == 4 + this.globalMoveFighterID % 3)
            {
               this.m_isFlying = false;
               if(a_1339 > 280)
               {
                  a_1339 = 280;
               }
               x -= a_1350 * a_1470;
               y += 25;
               a_1275 = 3;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
               if(m_stCurrentFieldGrid.m_stMouseEarthHole)
               {
                  m_stCurrentFieldGrid.m_stMouseEarthHole.a_3940();
                  m_stCurrentFieldGrid.m_stMouseEarthHole = null;
               }
               m_iOldFieldGridType = m_stCurrentFieldGrid.m_iFieldGridType;
               if(0 == m_stCurrentFieldGrid.m_iFieldGridType)
               {
                  m_stCurrentFieldGrid.m_iFieldGridType = 1;
               }
               if(1 == m_stCurrentFieldGrid.m_iFieldGridType)
               {
                  m_stCurrentFieldGrid.InitClimb();
                  stMousePigBarrier = MousePigBarrier.a_3926();
                  stMousePigBarrier.m_stCurrentFieldGrid = m_stCurrentFieldGrid;
                  stMousePigBarrier.a_1797(a_1283);
                  stMousePigBarrier.m_iOldFieldGridType = m_iOldFieldGridType;
                  stMousePigBarrier.x = a_3491.a_1080 * m_stCurrentFieldGrid.m_iXGridNo + 0.5 * (a_3491.a_1080 - stMousePigBarrier.width);
                  stMousePigBarrier.y = a_3491.a_1081 * m_stCurrentFieldGrid.m_iYGridNo + (a_3491.a_1081 - stMousePigBarrier.height) - 15;
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stMousePigBarrier,BattleLayerDefine.OBSTACL_TYPE,m_stCurrentFieldGrid);
                  if(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap())
                  {
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.GetGameMoveMap().AddMoveDisplayObject(stMousePigBarrier,m_stCurrentFieldGrid.m_iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
                  }
                  stMousePigBarrier.play();
                  m_stCurrentFieldGrid.m_stMouseEarthHole = stMousePigBarrier;
                  if(a_1283)
                  {
                     stMousePigBarrier.x = BattleFieldView.a_1013 - stMousePigBarrier.x;
                  }
               }
            }
            if(iXGridNo < (a_1283 ? -1 : 0) || iXGridNo > BattleFieldView.a_1011)
            {
               if(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.isOwnBattleField)
               {
                  a_1088.a_2062(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.iTimeIntervalNum,m_stCurrentFieldGrid.m_iYGridNo);
               }
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_stRowBreakDownMoveIntruderBitmap.bitmapData = stDisplayBitmap.bitmapData;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_stRowBreakDownMoveIntruderBitmap.x = x + stDisplayBitmap.x + (a_1283 ? 50 : -50);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_stRowBreakDownMoveIntruderBitmap.y = y + stDisplayBitmap.y;
               trace("iXGridNo < -1 || iXGridNo > BattleFieldView.ms_iXGridNum  Realease the MoveIntruder");
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               a_3940();
               return true;
            }
         }
         if(this.a_1496 <= 0 && !this.m_isFlying && iCurrentTime >= a_1477 + a_1476 * (1 / a_1470))
         {
            TryEatDefenseOnGridSimple(iCurrentTime);
         }
         if(this.a_1496 > 0 && !this.m_isFlying)
         {
            --this.a_1496;
            if(this.a_1496 <= 0)
            {
               a_1350 = a_3491.a_1080 / 100;
               if(!a_1283)
               {
                  a_1350 *= -1;
               }
               a_1275 = 3;
               gotoAndStop((a_1276[3] as FrameLabel).frame);
               a_1465 = 0;
            }
            play();
         }
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
      
      protected function a_3502(stFieldGrid:a_3491) : Boolean
      {
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         stFieldGrid.DamageNewSlot(true,0,true,0,1);
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
         return true;
      }
   }
}

