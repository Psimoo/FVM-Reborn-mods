package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.IsLand.FuzhouMouse
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.Intruder.HorseYear.IsLand.PathfinderMouse.IsLandBaseSoulMoveIntruder;
   
   public class IsLandFuzhouMouseSoulMoveIntruder extends IsLandBaseSoulMoveIntruder
   {
      
      public function IsLandFuzhouMouseSoulMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : IsLandFuzhouMouseSoulMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(IsLandFuzhouMouseSoulMoveIntruder,IsLandFuzhouMouseSoulMoveIntruderMovie) as IsLandFuzhouMouseSoulMoveIntruder;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         MAX_LIFE = 2500;
         INJURED_LIFE = 1250;
         ONE_GRID_SPEED = 5;
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         SetAnimation(0,0);
         AddTag(5);
         a_1377 = 20;
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            SetAnimation(0,8);
         }
         else
         {
            SetDeadAnim(16);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         super.a_4216(iCurrentTime);
         if(m_stCurrentFieldGrid == null)
         {
            return true;
         }
         return true;
      }
   }
}

