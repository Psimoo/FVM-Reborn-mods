package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.Assistant
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import flash.display.FrameLabel;
   
   public class AssistantJumpingMouseMoveIntruder extends a_4206
   {
      
      private var m_isJumping:Boolean = false;
      
      private const FULL_HP:int = 3000;
      
      private const HURT_HP:int = 1500;
      
      private const DEAD_HP:int = 0;
      
      private var m_fBaseY:Number;
      
      public function AssistantJumpingMouseMoveIntruder()
      {
         super();
         a_1279 = -35;
         m_bPostEnemy = false;
      }
      
      public static function a_3926() : a_4206
      {
         return PoolManager.getInstance().CheckOutOne(AssistantJumpingMouseMoveIntruder) as AssistantJumpingMouseMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return AssistantJumpingMouseMoveIntruderMovie;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1350 = a_3491.a_1080 / (1.5 * 20);
         if(iIntruderMoveDirection < 0)
         {
            a_1350 *= -1;
         }
         a_1473 = 0;
         this.m_isJumping = false;
         a_1339 = this.FULL_HP;
         a_1464 = true;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > this.HURT_HP)
         {
            if(a_1275 != 0)
            {
               a_1275 = 0;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         else if(a_1339 > 0)
         {
            if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         else if(a_1339 <= 0)
         {
            if(a_1275 != 2)
            {
               a_1275 = 2;
               gotoAndStop((a_1276[2] as FrameLabel).frame);
            }
            if(m_stCurrentFieldGrid)
            {
               m_stCurrentFieldGrid.a_3457(this);
               m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
            }
            play();
         }
         a_3419();
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         if(m_stCurrentFieldGrid)
         {
            m_stCurrentFieldGrid.a_3457(this);
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
         }
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
         var numMoveSpeed:Number = NaN;
         var jumpHeight:Number = NaN;
         var t:Number = NaN;
         var stNextFieldGrid:a_3491 = null;
         var iXGridNo:int = 0;
         var numOrigXPos:Number = x;
         if(m_stCurrentFieldGrid == null)
         {
            return false;
         }
         if(this.m_isJumping == false && m_stCurrentFieldGrid.a_3492() && BattleDestroyUtil.HasDefenseOnGridForJump(m_stCurrentFieldGrid,false))
         {
            this.m_isJumping = true;
            a_1473 = 17;
            this.ResetMovieStatus();
            return true;
         }
         if(a_1473 > 0 && this.m_isJumping)
         {
            --a_1473;
            if(a_1473 <= 0)
            {
               this.m_isJumping = false;
               a_1350 = a_3491.a_1080 / (1.5 * 20);
               if(!a_1283)
               {
                  a_1350 *= -1;
               }
               return false;
            }
            if(a_1473 <= 16)
            {
               numMoveSpeed = a_3491.a_1080 / 16;
               if(!a_1283)
               {
                  numMoveSpeed *= -1;
               }
               if(Boolean(m_stCurrentFieldGrid.m_stAttackFighter) && m_stCurrentFieldGrid.m_stAttackFighter.iBreadFighterType > 1)
               {
                  numMoveSpeed = 0;
               }
               if(a_1473 == 16)
               {
                  this.m_fBaseY = y;
               }
               x += numMoveSpeed;
               jumpHeight = 25;
               t = (17 - a_1473) / 16;
               y = this.m_fBaseY - jumpHeight * this.easeJumpParabola(t);
               iXGridNo = int(x / a_3491.a_1080);
               if(a_1283)
               {
                  iXGridNo = BattleFieldView.a_1011 - 1 - iXGridNo;
               }
               if(iXGridNo >= 0 && iXGridNo < BattleFieldView.a_1011 && m_stCurrentFieldGrid.m_iXGridNo != iXGridNo)
               {
                  stNextFieldGrid = m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,m_stCurrentFieldGrid.m_iYGridNo);
                  ChangeFieldGrid(stNextFieldGrid);
                  if(stNextFieldGrid.m_stBaseLander != null)
                  {
                     SetClarmLanderTime();
                  }
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
                  if(m_stCurrentFieldGrid)
                  {
                     m_stCurrentFieldGrid.a_3457(this);
                     m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3457(this);
                  }
                  a_3940();
                  return true;
               }
            }
         }
         else
         {
            super.a_4216(iCurrentTime);
         }
         return true;
      }
      
      private function easeJumpParabola(t:Number) : Number
      {
         return 4 * t * (1 - t);
      }
   }
}

