package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.IsLand.ObsessionMouse
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.HorseYear.IsLand.PathfinderMouse.IsLandBaseSoulMoveIntruder;
   import flash.display.FrameLabel;
   
   public class IsLandObsessionMouseSoulMoveIntruder extends IsLandBaseSoulMoveIntruder
   {
      
      private var attackCount:int = 0;
      
      private var inAttack:Boolean = false;
      
      private var m_iWaitTick:int = 0;
      
      private var m_iLastFrameTick:int = -1;
      
      public function IsLandObsessionMouseSoulMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : IsLandObsessionMouseSoulMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(IsLandObsessionMouseSoulMoveIntruder,IsLandObsessionMouseSoulMoveIntruderMovie) as IsLandObsessionMouseSoulMoveIntruder;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         MAX_LIFE = 30000;
         INJURED_LIFE = 6000;
         ONE_GRID_SPEED = 0;
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         AddTag(5);
         this.attackCount = 0;
         a_1464 = true;
         this.inAttack = false;
         this.m_iWaitTick = 0;
         this.m_iLastFrameTick = -1;
         SetAnimationOnce2Loop(0,1,0,1);
         SetSpeed(0);
         return true;
      }
      
      public function InitNormal() : void
      {
         a_1275 = -1;
         SetAnimation(1,1);
         SetSpeed(6);
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 <= 0)
         {
            SetDeadAnim(7);
         }
         return true;
      }
      
      override protected function OnAnimSkill() : void
      {
         var iNoY:int = 0;
         var iNoX:int = 0;
         var animIdx:int = 0;
         if(a_1273 == 28 || a_1273 == 72)
         {
            BattleDestroyUtil.AttackFieldGridDefense(m_stCurrentFieldGrid,200,false);
         }
         else if(a_1273 == 31 || a_1273 == 75)
         {
            ++this.attackCount;
            if(this.attackCount == 3)
            {
               SetAnimationOnce2Loop(3,1,6,4);
               this.attackCount = 0;
               SetSpeed(0);
            }
            else
            {
               this.m_iWaitTick = 30;
               SetSpeed(0);
            }
         }
         else if(a_1273 == 9)
         {
            SetSpeed(6);
         }
         else if(a_1273 == 47 || a_1273 == 91)
         {
            BattleDestroyUtil.ClearOneGrid(m_stCurrentFieldGrid);
         }
         else if((a_1273 == 48 || a_1273 == 92) && m_stCurrentFieldGrid != null)
         {
            BattleDestroyUtil.ClearOneGrid(m_stCurrentFieldGrid.m_stCurrentBattbleFieldView.a_3438(m_stCurrentFieldGrid.m_iXGridNo - 1,m_stCurrentFieldGrid.m_iYGridNo));
         }
         else if((a_1273 == 53 || a_1273 == 97) && m_stCurrentFieldGrid != null)
         {
            iNoY = m_stCurrentFieldGrid.m_iYGridNo;
            x -= 120;
            iNoX = x / a_3491.a_1080;
            if(iNoX < 0)
            {
               iNoX = 0;
            }
            ChangeToFieldGrid(iNoX,iNoY);
            SetSpeed(6);
            this.inAttack = false;
            animIdx = 1;
            if(InDamage())
            {
               animIdx = 4;
            }
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         super.a_4216(iCurrentTime);
         if(a_1273 <= 10)
         {
            return true;
         }
         this.AttackUpdate();
         return true;
      }
      
      private function AttackUpdate() : void
      {
         if(this.m_iWaitTick > 0)
         {
            --this.m_iWaitTick;
            if(this.m_iWaitTick <= 0)
            {
               if(BattleDestroyUtil.HasDefense2(m_stCurrentFieldGrid,true))
               {
                  SetAnimationOnce2Loop(2,1,5,4);
                  SetSpeed(0);
               }
               else
               {
                  SetSpeed(6);
                  this.inAttack = false;
                  this.attackCount = 0;
               }
            }
         }
         else if(this.inAttack == false && BattleDestroyUtil.HasDefense2(m_stCurrentFieldGrid,true))
         {
            this.attackCount = 0;
            SetAnimationOnce2Loop(2,1,5,4);
            SetSpeed(0);
            this.inAttack = true;
         }
      }
   }
}

