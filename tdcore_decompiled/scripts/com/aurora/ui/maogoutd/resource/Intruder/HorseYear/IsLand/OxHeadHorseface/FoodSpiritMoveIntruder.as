package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.IsLand.OxHeadHorseface
{
   import a_4718.b_182;
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.Base.BaseGameMoveIntruder;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   
   public class FoodSpiritMoveIntruder extends BaseGameMoveIntruder
   {
      
      private var m_iTick:int = 0;
      
      private var m_iWaitTick:int = 0;
      
      private var m_iJumpTick:int = 0;
      
      private var m_iLastJumpNoX:int;
      
      public function FoodSpiritMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : FoodSpiritMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(FoodSpiritMoveIntruder,FoodSpiritMoveIntruderMovie) as FoodSpiritMoveIntruder;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         MAX_LIFE = 90000;
         INJURED_LIFE = 0;
         ONE_GRID_SPEED = 0;
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         this.m_iTick = 0;
         a_1481 = false;
         a_1464 = true;
         a_1463 = true;
         SetAnimationOnce2Loop(0,1,0,1);
         tagCom.AddTag(401);
         AddTag(5);
         BoomIsReduceLife = true;
         this.m_iWaitTick = 0;
         this.m_iJumpTick = 0;
         this.m_iLastJumpNoX = -1;
         a_1789.getInstance().addEventListener("IsLand_CallMouseMove",this.SetMove2Position);
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         a_1789.getInstance().removeEventListener("IsLand_CallMouseMove",this.SetMove2Position);
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0)
         {
            SetDeadAnim(2);
         }
         return true;
      }
      
      public function SetMove2Position(stDataEvent:a_1778) : void
      {
         SetMoveToPosition(7,m_stCurrentFieldGrid.m_iYGridNo,2);
      }
      
      public function EndMove() : void
      {
         a_1789.getInstance().dispatchEvent(new a_1778("IsLand_CallBossRecover"));
         a_3969(999999);
      }
      
      override protected function MoveUpdate() : void
      {
         var iXGridNo:int = 0;
         var iYGridNo:int = 0;
         if(m_stCurrentFieldGrid == null)
         {
            return;
         }
         ++this.m_iTick;
         if(this.m_iTick >= 30 * 20)
         {
            a_1339 = 0;
            this.ResetMovieStatus();
            return;
         }
         if(a_1581 > 0)
         {
            if(Boolean(m_stCurrentFieldGrid.m_stAttackFighter) && m_stCurrentFieldGrid.m_stAttackFighter.iBreadFighterType > 1)
            {
               ++this.m_iWaitTick;
               if(this.m_iWaitTick % 10 == 0)
               {
                  a_3969(30000);
               }
            }
            else if(this.m_iJumpTick == 0 && BattleDestroyUtil.HasDefense2(m_stCurrentFieldGrid) && m_stCurrentFieldGrid.m_iXGridNo != this.m_iLastJumpNoX)
            {
               this.m_iJumpTick = 1;
               this.m_iLastJumpNoX = m_stCurrentFieldGrid.m_iXGridNo;
            }
            else
            {
               --a_1581;
               this.m_iWaitTick = 0;
               this.x += m_fMoveSpeedX;
               this.y += m_fMoveSpeedY;
               if(this.m_iJumpTick > 0)
               {
                  ++this.m_iJumpTick;
                  if(this.m_iJumpTick >= 2 && this.m_iJumpTick <= 17)
                  {
                     y -= 3;
                  }
                  if(this.m_iJumpTick >= 18 && this.m_iJumpTick <= 33)
                  {
                     y += 3;
                  }
                  if(this.m_iJumpTick == 33)
                  {
                     this.m_iJumpTick = 0;
                  }
               }
               iXGridNo = getXGridNoByPosX();
               iYGridNo = m_stCurrentFieldGrid.m_iYGridNo;
               if(a_1581 == 0)
               {
                  m_fMoveSpeedX = 0;
                  m_fMoveSpeedY = 0;
                  SetPosition(m_iTargetPosX,m_iTargetPosY);
                  this.EndMove();
               }
               else
               {
                  ChangeToFieldGrid(iXGridNo,iYGridNo);
               }
            }
         }
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_432 == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function a_4213() : Boolean
      {
         a_3969(900);
         return false;
      }
      
      override public function a_4212() : Boolean
      {
         a_3969(900);
         return false;
      }
      
      override public function ShowBatDieEffect() : void
      {
      }
   }
}

