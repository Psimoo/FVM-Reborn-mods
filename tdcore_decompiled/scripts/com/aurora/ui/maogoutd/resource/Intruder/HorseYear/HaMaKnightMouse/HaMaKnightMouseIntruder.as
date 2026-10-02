package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.HaMaKnightMouse
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.Base.BaseGameMoveIntruder;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import com.aurora.ui.maogoutd.resource.tools.a_4448;
   
   public class HaMaKnightMouseIntruder extends BaseGameMoveIntruder
   {
      
      private var m_iJumpState:int = 0;
      
      private var a_1363:a_4448;
      
      private var m_iJumpEndTick:int = 0;
      
      private var m_iLastFrame:int = -1;
      
      public function HaMaKnightMouseIntruder()
      {
         super();
      }
      
      public static function a_3926() : HaMaKnightMouseIntruder
      {
         return PoolManager.getInstance().CheckOutOne(HaMaKnightMouseIntruder,HaMaKnightMouseIntruderMovie) as HaMaKnightMouseIntruder;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         MAX_LIFE = 4200;
         INJURED_LIFE = 2000;
         ONE_GRID_SPEED = 0;
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1466 = 60000;
         a_1481 = false;
         a_1464 = true;
         BoomIsReduceLife = true;
         tagCom.AddTag(401);
         SetSpeed(0);
         this.m_iJumpState = 0;
         a_1275 = 0;
         a_1461 = true;
         this.m_iJumpEndTick = -1;
         this.m_iLastFrame = -1;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var numOrigXPos:Number = x;
         super.a_4216(iCurrentTime);
         if(m_stCurrentFieldGrid == null)
         {
            return false;
         }
         this.UpdateMouseMove(iCurrentTime);
         if(m_stCurrentFieldGrid == null)
         {
            return false;
         }
         if(a_1466 > 0)
         {
            HaMaKnightMouseSingleGridPollutionEffect.CreatePollution(m_stCurrentFieldGrid);
         }
         if(m_stCurrentFieldGrid.m_isNeedTray)
         {
            if(null == this.a_1363)
            {
               if(parent)
               {
                  this.a_1363 = a_4448.a_3926();
                  this.a_1363.a_1797(a_1283);
                  if(a_1283)
                  {
                     this.a_1363.x = x - 0.5 * (stDisplayBitmap.width - this.a_1363.width) + 25;
                  }
                  else
                  {
                     this.a_1363.x = x + 0.5 * (stDisplayBitmap.width - this.a_1363.width) - 25;
                  }
                  this.a_1363.y = y + stDisplayBitmap.y + stDisplayBitmap.height - 0.7 * this.a_1363.height;
                  parent.addChildAt(this.a_1363,1);
               }
            }
            else
            {
               this.a_1363.nextFrame();
               this.a_1363.x += x - numOrigXPos;
               this.a_1363.visible = true;
            }
         }
         else if(this.a_1363 != null)
         {
            this.a_1363.a_3940();
            this.a_1363 = null;
         }
         return true;
      }
      
      private function UpdateJumpState() : void
      {
         this.m_iJumpState = m_stCurrentFieldGrid.m_stAttackFighter != null && m_stCurrentFieldGrid.m_stAttackFighter.iBreadFighterType > 1 ? 1 : 2;
      }
      
      private function UpdateMouseMove(iCurrentTime:int) : Boolean
      {
         if(this.m_iLastFrame != a_1273)
         {
            if(a_1273 >= 24 && a_1273 <= 27 || a_1273 >= 32 && a_1273 <= 35)
            {
               if(this.m_iJumpState == 2)
               {
                  if(a_1273 == 27 || a_1273 == 35)
                  {
                     x -= 16;
                  }
                  else
                  {
                     x -= 15;
                  }
               }
            }
            else if(a_1273 >= 74 && a_1273 <= 79 || a_1273 >= 64 && a_1273 <= 69)
            {
               if(this.m_iJumpState == 2)
               {
                  if(a_1273 == 69 || a_1273 == 79)
                  {
                     x -= 11;
                  }
                  else
                  {
                     x -= 10;
                  }
               }
            }
            else if(a_1273 == 28 || a_1273 == 36)
            {
               this.m_iJumpState = 0;
               SetSpeed(0);
               this.m_iJumpEndTick = iCurrentTime;
            }
            else if(a_1273 == 44 || a_1273 == 52)
            {
               this.m_iJumpState = 0;
               SetSpeed(1.5);
            }
            else if(a_1273 == 70 || a_1273 == 80)
            {
               this.m_iJumpState = 0;
               a_1466 = 0;
               SetSpeed(5);
            }
            this.m_iLastFrame = a_1273;
         }
         if(this.m_iJumpState == 0)
         {
            if(a_1466 > 0)
            {
               if(!m_stCurrentFieldGrid.m_isNeedTray)
               {
                  if(this.m_iJumpEndTick == -1 || iCurrentTime - this.m_iJumpEndTick > 80)
                  {
                     this.UpdateJumpState();
                     SetAnimationOnce2Loop(2,0,3,1);
                  }
                  else
                  {
                     SetSpeed(0);
                     SetAnimation(0,1);
                  }
               }
               else if(a_1275 == 0 || a_1275 == 1)
               {
                  SetSpeed(0);
                  this.UpdateJumpState();
                  BattleFieldView.a_1020.play();
                  SetAnimationOnce2Loop(4,6,5,7);
               }
               else if(Boolean(m_stCurrentFieldGrid) && BattleDestroyUtil.HasDefenseOnGridForJump(m_stCurrentFieldGrid))
               {
                  SetSpeed(0);
                  this.UpdateJumpState();
                  SetAnimationOnce2Loop(8,10,9,11);
               }
               else
               {
                  SetAnimation(6,7);
                  SetSpeed(1.5);
               }
            }
            else
            {
               SetSpeed(5);
               if(a_1475)
               {
                  if(m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.m_isNeedTray)
                  {
                     SetAnimation(16,17);
                  }
                  else
                  {
                     SetAnimation(14,15);
                  }
               }
               else if(m_stCurrentFieldGrid != null && m_stCurrentFieldGrid.m_isNeedTray)
               {
                  SetAnimation(10,11);
               }
               else
               {
                  SetAnimation(12,13);
               }
               a_1464 = false;
            }
         }
         this.ChangeGrid();
         return false;
      }
      
      private function ChangeGrid() : void
      {
         var iXGridNo:int = int(x / a_3491.a_1080);
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - iXGridNo;
         }
         if(iXGridNo >= 0 && iXGridNo < BattleFieldView.a_1011 && m_stCurrentFieldGrid.m_iXGridNo != iXGridNo)
         {
            m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(iXGridNo,m_stCurrentFieldGrid.m_iYGridNo).a_3459(this);
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
            this.a_3940();
         }
      }
      
      override public function a_4207() : void
      {
         if(this.a_1363)
         {
            this.a_1363.gotoAndStop(1);
            this.a_1363.y = y + stDisplayBitmap.y + stDisplayBitmap.height - 0.7 * this.a_1363.height;
         }
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0)
         {
            SetDeadAnim(18);
         }
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_434 != iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override protected function a_3940() : Boolean
      {
         if(this.a_1363)
         {
            this.a_1363.a_3940();
            this.a_1363 = null;
         }
         super.a_3940();
         return true;
      }
   }
}

