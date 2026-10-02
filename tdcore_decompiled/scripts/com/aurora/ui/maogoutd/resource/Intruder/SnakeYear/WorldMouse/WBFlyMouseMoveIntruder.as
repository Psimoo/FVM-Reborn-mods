package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldMouse
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import flash.display.FrameLabel;
   
   public class WBFlyMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 1560;
      
      private static const MAX_INJURED_LIFE:int = 750;
      
      private static const ONE_GRID_SPEED:Number = 1.5;
      
      protected var m_isFlying:Boolean = true;
      
      protected var a_1496:int;
      
      public function WBFlyMouseMoveIntruder()
      {
         a_1467 = -25;
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBFlyMouseMoveIntruder) as WBFlyMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBFlyMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (ONE_GRID_SPEED * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         this.m_isFlying = true;
         this.a_1496 = 12;
         a_1339 = MAX_LIFE;
         a_1279 = -width * 0.5;
         a_1465 = 3;
         return true;
      }
      
      override protected function ChangeFieldGrid(stNextFieldGrid:a_3491) : void
      {
         if(this.m_isFlying && stNextFieldGrid.m_iXGridNo == 5)
         {
            a_1350 = a_3491.a_1080 / (4 * 20);
            if(!a_1283)
            {
               a_1350 *= -1;
            }
         }
         super.ChangeFieldGrid(stNextFieldGrid);
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(this.m_isFlying)
            {
               this.SetAnimation2(0);
            }
            else if(a_1475)
            {
               if(!this.InDamage())
               {
                  this.SetAnimation2(5);
               }
               else if(a_1275 == 5)
               {
                  this.SetAnimationOnce2Loop2(6,7);
               }
               else
               {
                  this.SetAnimation2(7);
               }
            }
            else if(!this.InDamage())
            {
               this.SetAnimation2(2);
            }
            else if(a_1275 == 2)
            {
               this.SetAnimationOnce2Loop2(3,4);
            }
            else
            {
               this.SetAnimation2(4);
            }
         }
         else if(a_1339 <= 0)
         {
            this.SetAnimation2(8);
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
         if(iRduceLifeValue > 0 && this.m_isFlying)
         {
            this.m_isFlying = false;
            this.SetAnimationOnce2Loop2(1,2);
            return true;
         }
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         this.a_3969(900);
         if(a_1339 <= 0)
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
      
      override public function a_4214() : Boolean
      {
         a_4212();
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
         if(!a_1460)
         {
            a_1460 = true;
         }
         var numOrigXPos:Number = x;
         if(a_1468 > 0 || a_1469 > 0)
         {
            return true;
         }
         if(null == m_stCurrentFieldGrid)
         {
            return false;
         }
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
               this.ChangeFieldGrid(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,m_stCurrentFieldGrid.m_iYGridNo));
            }
            else if(this.m_isFlying && (iXGridNo <= 0 || iXGridNo >= BattleFieldView.a_1011))
            {
               this.m_isFlying = false;
               x -= a_1350 * a_1470;
               a_1275 = 2;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
            else if(iXGridNo < (a_1283 ? -1 : 0) || iXGridNo > BattleFieldView.a_1011)
            {
               if(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.isOwnBattleField)
               {
                  a_1088.a_2062(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.iTimeIntervalNum,m_stCurrentFieldGrid.m_iYGridNo);
               }
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_stRowBreakDownMoveIntruderBitmap.bitmapData = stDisplayBitmap.bitmapData;
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_stRowBreakDownMoveIntruderBitmap.x = x + stDisplayBitmap.x + (a_1283 ? 50 : -50);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_stRowBreakDownMoveIntruderBitmap.y = y + stDisplayBitmap.y;
               trace("iXGridNo < -1 || iXGridNo > BattleFieldView.ms_iXGridNum  Realease the MoveIntruder");
               if(null != m_stCurrentFieldGrid)
               {
                  m_stCurrentFieldGrid.a_3457(this);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               }
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
               a_1350 = a_3491.a_1080 / 80;
               if(!a_1283)
               {
                  a_1350 *= -1;
               }
               a_1275 = 2;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
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
      
      public function InDamage() : Boolean
      {
         return a_1339 > 0 && a_1339 < MAX_INJURED_LIFE;
      }
      
      public function SetAnimationOnce2Loop2(onceAnimIdx:int, loopAnimIdx:int) : void
      {
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
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

