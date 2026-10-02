package com.aurora.ui.maogoutd.resource.Intruder.WonderLand.RobeCommonMouse
{
   import a_4718.b_181;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   
   public class RobeCommonMouseMoveIntruder extends a_4206
   {
      
      private const FULL_HP:int = 240;
      
      private const HURT_HP:int = 50;
      
      private const DEAD_HP:int = 0;
      
      private var m_isDaHua:Boolean = false;
      
      private var m_SprintTimes:int = -10;
      
      private var m_isJumping:Boolean = false;
      
      private var m_isOverDaHuaSkill:Boolean = false;
      
      private var m_isReadmove:Boolean = false;
      
      private var m_isSprint:Boolean = false;
      
      private var m_isEndmove:Boolean = false;
      
      private var m_StartMoveTime:int;
      
      private var m_numYSpeed:int;
      
      private var m_MoveTotalTime:int = 10;
      
      public function RobeCommonMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(RobeCommonMouseMoveIntruder) as RobeCommonMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return RobeCommonMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (6 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1339 = this.FULL_HP;
         a_1279 = -width * 0.2;
         a_1272 = 0;
         this.m_isReadmove = false;
         this.m_isSprint = false;
         this.m_isEndmove = false;
         this.m_isDaHua = false;
         this.m_SprintTimes = -10;
         a_1473 = 0;
         this.m_isJumping = false;
         this.m_isOverDaHuaSkill = false;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.HURT_HP)
         {
            if(this.m_isReadmove)
            {
               if(a_1275 != 5)
               {
                  a_1275 = 5;
                  gotoAndStop((a_1276[5] as FrameLabel).frame);
               }
            }
            else if(this.m_isSprint)
            {
               if(a_1275 != 6)
               {
                  a_1275 = 6;
                  gotoAndStop((a_1276[6] as FrameLabel).frame);
               }
            }
            else if(this.m_isEndmove)
            {
               if(a_1275 != 7)
               {
                  a_1275 = 7;
                  gotoAndStop((a_1276[7] as FrameLabel).frame);
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
         else if(a_1339 > 0)
         {
            if(this.m_isReadmove)
            {
               if(a_1275 != 8)
               {
                  a_1275 = 8;
                  gotoAndStop((a_1276[8] as FrameLabel).frame);
               }
            }
            else if(this.m_isSprint)
            {
               if(a_1275 != 9)
               {
                  a_1275 = 9;
                  gotoAndStop((a_1276[9] as FrameLabel).frame);
               }
            }
            else if(this.m_isEndmove)
            {
               if(a_1275 != 10)
               {
                  a_1275 = 10;
                  gotoAndStop((a_1276[10] as FrameLabel).frame);
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
         else if(a_1339 <= 0 && a_1275 != 4)
         {
            a_1275 = 4;
            gotoAndStop((a_1276[4] as FrameLabel).frame);
            a_3419();
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            this.play();
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
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var numOrigXPos:Number = NaN;
         var numYMove:Number = NaN;
         numOrigXPos = x;
         if(!a_1460)
         {
            a_1460 = true;
         }
         super.a_4216(iCurrentTime);
         if(!this.m_isOverDaHuaSkill && !this.m_isDaHua && m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.m_iXGridNo >= 2)
         {
            if(m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.m_stFieldRowSlipStatusArray[m_stCurrentFieldGrid.m_iYGridNo])
            {
               this.Slip();
            }
         }
         if(iCurrentTime % 2 == 0 && a_1339 > 0)
         {
            if(a_1273 == 42 || a_1273 == 59)
            {
               this.m_isReadmove = false;
               this.m_isSprint = true;
               this.m_SprintTimes = this.m_MoveTotalTime * 3;
               this.ResetMovieStatus();
            }
            if(a_1273 == 54 || a_1273 == 71)
            {
               this.m_isDaHua = false;
               this.m_isOverDaHuaSkill = true;
               this.m_isEndmove = false;
               this.ResetMovieStatus();
            }
         }
         if(this.m_SprintTimes > 0)
         {
            --this.m_SprintTimes;
            if(this.m_SprintTimes == 0)
            {
               this.m_isSprint = false;
               this.m_isEndmove = true;
               this.ResetMovieStatus();
            }
         }
         a_1350 = this.m_isSprint ? a_3491.a_1080 / this.m_MoveTotalTime : a_3491.a_1080 / (6 * 20);
         if(m_isCharmed)
         {
            a_1464 = true;
         }
         else
         {
            a_1464 = this.m_isDaHua ? true : false;
         }
         if(!a_1283)
         {
            a_1350 *= -1;
         }
         if(Boolean(this.m_isDaHua && !this.m_isJumping && m_stCurrentFieldGrid) && Boolean(this.m_isSprint) && BattleDestroyUtil.HasDefenseOnGridForJump(m_stCurrentFieldGrid,false))
         {
            a_1473 = this.m_MoveTotalTime + 1;
            this.m_isJumping = true;
            this.m_StartMoveTime = iCurrentTime;
            this.m_numYSpeed = a_3491.a_1081 * 3 / this.m_MoveTotalTime;
         }
         if(a_1473 > 0 && this.m_isJumping && Boolean(m_stCurrentFieldGrid))
         {
            --a_1473;
            numYMove = 2 * this.m_numYSpeed * (iCurrentTime - this.m_StartMoveTime) / this.m_MoveTotalTime - this.m_numYSpeed;
            y += numYMove > 30 ? 30 : numYMove;
            if(a_1473 <= 0)
            {
               this.m_isJumping = false;
            }
         }
         if(a_1457 == b_181.a_424 && (x > a_3491.a_1080 * 4 && a_1283 || x < a_3491.a_1080 * 5 && !a_1283))
         {
            y += Math.tan(15 * Math.PI / 180) * Math.abs(numOrigXPos - x);
         }
         return true;
      }
      
      public function Slip() : void
      {
         this.m_isDaHua = true;
         this.m_isReadmove = true;
         this.ResetMovieStatus();
      }
      
      override public function get isFearCatHead() : Boolean
      {
         if(this.m_SprintTimes > 0)
         {
            return false;
         }
         if(a_1473 > 0)
         {
            return false;
         }
         return a_1481;
      }
      
      override public function play() : void
      {
         super.play();
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(!this.m_isDaHua)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override protected function get AccelerationEffectValue() : Number
      {
         if(this.m_isDaHua)
         {
            return 1;
         }
         if(null != m_stCurrentFieldGrid && m_stCurrentFieldGrid.IsHasAcceleration && (0 == a_1465 || 2 == a_1465))
         {
            return 2;
         }
         return 1;
      }
   }
}

