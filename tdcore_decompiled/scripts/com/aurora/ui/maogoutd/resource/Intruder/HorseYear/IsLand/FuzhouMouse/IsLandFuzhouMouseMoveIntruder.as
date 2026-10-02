package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.IsLand.FuzhouMouse
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.Base.BaseGameMoveIntruder;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   
   public class IsLandFuzhouMouseMoveIntruder extends BaseGameMoveIntruder
   {
      
      public function IsLandFuzhouMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : IsLandFuzhouMouseMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(IsLandFuzhouMouseMoveIntruder,IsLandFuzhouMouseMoveIntruderMovie) as IsLandFuzhouMouseMoveIntruder;
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
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         super.a_4208(iEffectType,iEffectTime,stBaseEffect);
      }
      
      override public function a_4213() : Boolean
      {
         this.a_4212();
         return true;
      }
      
      override public function a_4212() : Boolean
      {
         super.a_4212();
         return true;
      }
      
      override public function a_4210() : Boolean
      {
         a_3969(BOOM_INJURE_LIFE);
         return true;
      }
      
      override public function ShowBatDieEffect() : void
      {
      }
   }
}

