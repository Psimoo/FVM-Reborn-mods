package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing.Child
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.Base.BaseGameMoveIntruder;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   
   public class WBDesireChildCalamityRatMoveIntruder extends BaseGameMoveIntruder
   {
      
      private var m_iCreateTick:int = -1;
      
      public function WBDesireChildCalamityRatMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : WBDesireChildCalamityRatMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(WBDesireChildCalamityRatMoveIntruder,WBDesireChildCalamityRatMovie) as WBDesireChildCalamityRatMoveIntruder;
      }
      
      override public function a_1797(iGlobalMoveFighterID:int, iIntruderMoveDirection:int) : Boolean
      {
         MAX_LIFE = 100000;
         INJURED_LIFE = 0;
         ONE_GRID_SPEED = 4;
         super.a_1797(iGlobalMoveFighterID,iIntruderMoveDirection);
         a_1481 = false;
         a_1464 = false;
         this.m_iCreateTick = -1;
         SetAnimation(1,1);
         tagCom.AddTag(401);
         AddTag(5);
         AddTag(10);
         return true;
      }
      
      public function InitData() : void
      {
         SetAnimationOnce2Loop(0,1,0,1);
         a_1464 = true;
         SetSpeed(0);
      }
      
      override protected function ResetMovieStatus() : Boolean
      {
         if(a_1339 > 0)
         {
            if(isEatingDefense)
            {
               SetAnimation(2,2);
            }
            else
            {
               SetAnimation(1,1);
            }
         }
         else
         {
            SetDeadAnim(3);
         }
         return true;
      }
      
      override public function a_4215(stBaseDefense:a_3962) : Boolean
      {
         super.a_4215(stBaseDefense);
         a_1377 += 50;
         return true;
      }
      
      override protected function IsCanEat(stBaseDefense:a_3962) : Boolean
      {
         if(stBaseDefense is a_3924)
         {
            return false;
         }
         return super.IsCanEat(stBaseDefense);
      }
      
      override public function a_4216(iCurrentTime:int) : Boolean
      {
         var numOrigXPos:Number = x;
         if(!a_1460)
         {
            a_1460 = true;
            this.m_iCreateTick = iCurrentTime;
         }
         if(a_1273 == 8)
         {
            a_1464 = false;
            SetSpeed(ONE_GRID_SPEED);
         }
         if(!isEatingDefense)
         {
            a_1377 = 50;
         }
         super.a_4216(iCurrentTime);
         SetGameMapModePicnicPosition(numOrigXPos);
         if(m_stCurrentFieldGrid != null)
         {
            if(iCurrentTime - this.m_iCreateTick >= 16 * 20)
            {
               a_1339 = 0;
               this.ResetMovieStatus();
            }
         }
         return true;
      }
      
      override public function a_4208(iEffectType:int, iEffectTime:int, stBaseEffect:a_4108 = null) : void
      {
         if(b_182.a_433 == iEffectType || b_182.enm_shotEffectFreezeStop == iEffectType || b_182.a_434 == iEffectType || b_182.a_432 == iEffectType || b_182.a_435 == iEffectType || b_182.enm_shotEffectXuanYun == iEffectType)
         {
            super.a_4208(iEffectType,iEffectTime,stBaseEffect);
         }
      }
      
      override public function a_4213() : Boolean
      {
         return false;
      }
      
      override public function a_4210() : Boolean
      {
         return false;
      }
      
      override public function ShowBatDieEffect() : void
      {
      }
      
      override public function a_3969(value:int) : Boolean
      {
         return false;
      }
      
      override public function a_4209(value:int) : Boolean
      {
         return false;
      }
      
      override public function PowerfulBombReduceLifeRate(fRate:Number = 0.3, bIsIgnoreArmor:Boolean = false) : Boolean
      {
         return false;
      }
   }
}

