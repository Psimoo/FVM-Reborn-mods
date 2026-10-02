package com.aurora.ui.maogoutd.resource.defender.eggBoilerPisces
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   
   public class EggBoilerPiscesFirstTransAttackFighter extends a_3953
   {
      
      public function EggBoilerPiscesFirstTransAttackFighter()
      {
         super();
         a_1314 = true;
         a_1338 = 5;
         a_1337 = -30;
         a_1312 = 15;
         a_1095 = EggBoilerPiscesDefine.DEFENSE_PRICE;
         a_1096 = false;
         a_1304 = EggBoilerPiscesDefine.GetShotTypeID();
         a_1310 = EggBoilerPiscesDefine.SHOT_DELAY_TIMENUM;
         a_1317 = EggBoilerPiscesDefine.CONTINUE_SHOT_INTERVAL;
         a_1309 = EggBoilerPiscesDefine.a_3966(m_iSkillDegree);
         a_1311 = EggBoilerPiscesDefine.a_3965(a_1094);
         if(a_1336)
         {
            a_1336.x += 32;
            a_1336.y += 2;
         }
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(EggBoilerPiscesFirstTransAttackFighter) as EggBoilerPiscesFirstTransAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return EggBoilerPiscesFirstTransAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1309 = EggBoilerPiscesDefine.a_3966(m_iSkillDegree);
         a_1311 = EggBoilerPiscesDefine.a_3965(a_1094);
         if(a_1336)
         {
            a_1336.x += 32;
            a_1336.y += 2;
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return EggBoilerPiscesDefine.a_3964();
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 2 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         return super.a_3954(iCurrentTime);
      }
      
      override protected function a_3955() : Number
      {
         return width + 15;
      }
      
      override protected function a_3956() : Number
      {
         return -25;
      }
   }
}

