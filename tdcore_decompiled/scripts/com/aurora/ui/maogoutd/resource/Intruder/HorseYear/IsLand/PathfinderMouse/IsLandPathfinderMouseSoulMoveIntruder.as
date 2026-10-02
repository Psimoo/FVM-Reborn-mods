package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.IsLand.PathfinderMouse
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.Util.BattleDestroyUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class IsLandPathfinderMouseSoulMoveIntruder extends IsLandBaseSoulMoveIntruder
   {
      
      private var _boomGrid:a_3491 = null;
      
      public function IsLandPathfinderMouseSoulMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : IsLandPathfinderMouseSoulMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(IsLandPathfinderMouseSoulMoveIntruder,IsLandPathfinderMouseSoulMoveIntruderMovie) as IsLandPathfinderMouseSoulMoveIntruder;
      }
      
      public static function HasDefense(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         return !(null == stFieldGrid.m_stProtector && null == stFieldGrid.m_stAttackFighter && null == stFieldGrid.m_stTrayDefense && null == stFieldGrid.m_stBoomDefense && null == stFieldGrid.m_stFlowerDefense && null == stFieldGrid.m_stBaseAuxiliaryFighter && null == stFieldGrid.m_stBattleBarrierHorseDefense && null == stFieldGrid.m_stOceanGoddessToolDefense && null == stFieldGrid.m_stHoneyTrapBaseDefense);
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         MAX_LIFE = 7500;
         INJURED_LIFE = 1500;
         ONE_GRID_SPEED = 0;
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         SetAnimationOnce2Loop(0,1,0,1);
         this._boomGrid = null;
         a_1464 = true;
         return true;
      }
      
      public function InitNormal() : void
      {
         a_1275 = -1;
         SetAnimation(1,1);
         SetSpeed(4);
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(a_1273 > 7)
            {
               SetAnimation(1,2);
            }
         }
         else if(this._boomGrid != null)
         {
            SetDeadAnim(3);
         }
         else
         {
            SetDeadAnim(4);
         }
         return true;
      }
      
      override protected function OnAnimSkill() : void
      {
         if(a_1273 == 7)
         {
            SetSpeed(4);
         }
         if(a_1273 == 42 && this._boomGrid != null)
         {
            BattleDestroyUtil.BurnFieldGridDefense2(this._boomGrid,500);
            this._boomGrid = null;
         }
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         super.a_4216(iCurrentTime);
         if(m_stCurrentFieldGrid == null)
         {
            return false;
         }
         if(x < (m_stCurrentFieldGrid.m_iXGridNo + 0.15) * a_3491.a_1080 && HasDefense(m_stCurrentFieldGrid))
         {
            this._boomGrid = m_stCurrentFieldGrid;
            a_1339 = 0;
            this.ResetMovieStatus();
         }
         return true;
      }
   }
}

