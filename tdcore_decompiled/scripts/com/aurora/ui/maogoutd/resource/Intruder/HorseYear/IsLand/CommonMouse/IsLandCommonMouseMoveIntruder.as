package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.IsLand.CommonMouse
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.Base.BaseGameMoveIntruder;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   
   public class IsLandCommonMouseMoveIntruder extends BaseGameMoveIntruder
   {
      
      public function IsLandCommonMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : IsLandCommonMouseMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(IsLandCommonMouseMoveIntruder,IsLandCommonMouseMoveIntruderMovie) as IsLandCommonMouseMoveIntruder;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         MAX_LIFE = 600;
         INJURED_LIFE = 300;
         ONE_GRID_SPEED = 4.5;
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         SetAnimation(0,1);
         return true;
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(a_1475)
            {
               SetAnimation(2,3);
            }
            else
            {
               SetAnimation(0,1);
            }
         }
         else
         {
            SetDeadAnim(4);
         }
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_433 == iEffectType)
         {
            SetSpeed(6);
         }
         super.a_4208(iEffectType,iEffectTime,stBaseEffect);
      }
   }
}

