package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.WorldMouse
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class WBDrillHamsterMouseMoveIntruder extends a_4206
   {
      
      private static const MAX_LIFE:int = 1500;
      
      private static const MAX_INJURED_LIFE:int = 750;
      
      private static const ONE_GRID_SPEED:int = 1;
      
      protected var a_1493:Boolean = false;
      
      protected var a_1494:int;
      
      protected var m_numXpos:Number;
      
      private var m_InvincibleTick:int = 0;
      
      public function WBDrillHamsterMouseMoveIntruder()
      {
         a_1281 = true;
         a_1463 = true;
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(WBDrillHamsterMouseMoveIntruder) as WBDrillHamsterMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBDrillHamsterMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / 40;
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         this.a_1493 = false;
         this.a_1494 = 60;
         a_1462 = true;
         a_1463 = true;
         a_1465 = 1;
         a_1339 = MAX_LIFE;
         a_1279 = -width * 0.7;
         a_1272 = 0;
         this.m_numXpos = -1;
         this.m_InvincibleTick = 20;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(this.a_1494 > 0 || this.a_1493 == false)
            {
               return true;
            }
            if(a_1475)
            {
               if(a_1339 > MAX_INJURED_LIFE)
               {
                  this.SetAnimation2(8);
               }
               else if(a_1339 > 0 && a_1275 == 8)
               {
                  this.SetAnimationOnce2Loop2(9,10);
               }
               else
               {
                  this.SetAnimation2(10);
               }
            }
            else if(a_1339 > MAX_INJURED_LIFE)
            {
               this.SetAnimation2(5);
            }
            else if(a_1339 > 0 && a_1275 == 5)
            {
               this.SetAnimationOnce2Loop2(6,7);
            }
            else
            {
               this.SetAnimation2(7);
            }
         }
         else if(a_1339 <= 0 && a_1275 != 11)
         {
            a_1275 = 11;
            gotoAndStop((a_1276[11] as FrameLabel).frame);
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
      
      override public function a_4209(iRduceLifeValue:int) : Boolean
      {
         if(this.m_InvincibleTick > 0)
         {
            return true;
         }
         return super.a_4209(iRduceLifeValue);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(this.m_InvincibleTick > 0)
         {
            return true;
         }
         super.a_3969(iRduceLifeValue);
         return true;
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
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var numOrigXPos:Number = NaN;
         var iXGridNo:int = 0;
         if(!a_1460)
         {
            a_1460 = true;
         }
         if(m_stCurrentFieldGrid == null)
         {
            return true;
         }
         --this.m_InvincibleTick;
         numOrigXPos = x;
         if(-1 == this.m_numXpos)
         {
            this.m_numXpos = x;
         }
         if(iCurrentTime >= a_1472 + a_1471 && (!this.a_1493 || this.a_1493 && this.a_1494 <= 0 && !HasBlockingDefenseOnGrid()))
         {
            a_1472 = iCurrentTime;
            play();
            this.m_numXpos += a_1350 * a_1470;
            x = this.m_numXpos;
            iXGridNo = int(x / a_3491.a_1080);
            if(a_1283)
            {
               iXGridNo = BattleFieldView.a_1011 - 1 - iXGridNo;
            }
            if(iXGridNo >= 0 && iXGridNo < BattleFieldView.a_1011 && m_stCurrentFieldGrid.m_iXGridNo != iXGridNo)
            {
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,m_stCurrentFieldGrid.m_iYGridNo).a_3459(this);
            }
            else if(!this.a_1493 && (x < 0 || x > BattleFieldView.a_1013))
            {
               this.a_1493 = true;
               this.m_numXpos -= a_1350 * a_1470;
               x = this.m_numXpos;
               this.SetAnimationOnce2Loop2(2,4);
            }
            else if(iXGridNo < (a_1283 ? -1 : 0) || iXGridNo > BattleFieldView.a_1011)
            {
               if(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.isOwnBattleField)
               {
                  a_1088.a_2062(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.iTimeIntervalNum,m_stCurrentFieldGrid.m_iYGridNo);
               }
               trace("iXGridNo < -1 || iXGridNo > BattleFieldView.ms_iXGridNum  Realease the MoveIntruder");
               if(m_stCurrentFieldGrid)
               {
                  m_stCurrentFieldGrid.a_3457(this);
                  m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
               }
               a_3940();
               return true;
            }
         }
         if(this.a_1494 <= 0 && this.a_1493 && iCurrentTime >= a_1477 + a_1476 * (1 / a_1470))
         {
            TryEatDefenseOnGridSimple(iCurrentTime);
         }
         if(this.a_1494 > 0 && this.a_1493)
         {
            --this.a_1494;
            if(40 == this.a_1494)
            {
               a_1465 = 0;
               SetCannotSeeByFighter(false);
            }
            if(this.a_1494 <= 0)
            {
               a_1350 = a_3491.a_1080 / 260;
               if(a_1283)
               {
                  a_1350 *= -1;
               }
               this.SetAnimation2(5);
            }
            play();
         }
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += (this.a_1493 ? -1 : 1) * Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(0 == a_1465)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
   }
}

