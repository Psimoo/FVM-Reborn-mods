package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.IsLand.WolfTeethClubMouse
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.Base.BaseGameMoveIntruder;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   
   public class IsLandWolfTeethClubMouseMoveIntruder extends BaseGameMoveIntruder
   {
      
      public function IsLandWolfTeethClubMouseMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : IsLandWolfTeethClubMouseMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(IsLandWolfTeethClubMouseMoveIntruder,IsLandWolfTeethClubMouseMoveIntruderMovie) as IsLandWolfTeethClubMouseMoveIntruder;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         MAX_LIFE = 7200;
         INJURED_LIFE = 3600;
         ONE_GRID_SPEED = 5;
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         SetAnimationOnce2Loop(0,1,0,1);
         tagCom.AddTag(401);
         BoomIsReduceLife = true;
         a_1377 = 0;
         a_1476 = 50;
         a_1477 = 0;
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
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         super.a_4216(iCurrentTime);
         if(null != m_stCurrentFieldGrid && null != m_stCurrentFieldGrid.m_stBoomDefense && !m_stCurrentFieldGrid.m_stBoomDefense.isCanBeEaten && iCurrentTime >= a_1477 + a_1476 * (1 / a_1470) && !a_1464)
         {
            a_1472 = iCurrentTime + 22;
            a_1477 = iCurrentTime;
            a_1475 = true;
            a_4215(m_stCurrentFieldGrid.m_stBoomDefense);
            this.ResetMovieStatus();
         }
         if(a_1473 <= 0 && a_1474 <= 0 && iCurrentTime == a_1477 + 22)
         {
            GiantJumpSplashDamageOnGrid(900,true);
         }
         super.a_4216(iCurrentTime);
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.enm_shotEffectXuanYun == iEffectType)
         {
            return;
         }
         super.a_4208(iEffectType,iEffectTime,stBaseEffect);
      }
      
      override public function a_4213() : Boolean
      {
         a_3969(900);
         if(a_1339 <= 0)
         {
            a_4212();
         }
         return true;
      }
   }
}

