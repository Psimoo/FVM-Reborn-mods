package com.aurora.ui.maogoutd.resource.defender
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class MealieFirstTransAttackFighter extends a_3953
   {
      
      public function MealieFirstTransAttackFighter()
      {
         super();
         a_1335 = 6;
         a_1309 = 60 - this.a_3966();
         a_1311 = this.a_3965();
         a_1312 = 15;
         a_1095 = 125;
         a_1304 = b_183.b_192;
         a_1310 = 12;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(MealieFirstTransAttackFighter) as MealieFirstTransAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return MealieFirstTransAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         a_1310 = 12;
         a_1322 = 0;
         super.a_1797(stFieldGrid);
         a_1311 = this.a_3965();
         a_1309 = 60 - this.a_3966();
         return true;
      }
      
      override public function a_3954(iCurrentTime:int) : Boolean
      {
         super.a_3954(iCurrentTime);
         if(iCurrentTime == a_1321)
         {
            a_1322 = int(iCurrentTime * 10000 * Math.PI) % 3 == 0 ? 1 : 0;
            if(a_1322 == 0)
            {
               a_1322 = 2;
            }
            else
            {
               a_1322 = 3;
            }
         }
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 70;
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
      
      override protected function a_3955() : Number
      {
         return width * 0.9;
      }
      
      override protected function a_3956() : Number
      {
         return -0.1 * height;
      }
      
      override protected function a_3965() : int
      {
         var iStarDegreeEffect:int = 0;
         switch(a_1094)
         {
            case 0:
               iStarDegreeEffect = 20;
               break;
            case 1:
               iStarDegreeEffect = 25;
               break;
            case 2:
               iStarDegreeEffect = 30;
               break;
            case 3:
               iStarDegreeEffect = 35;
               break;
            case 4:
               iStarDegreeEffect = 40;
               break;
            case 5:
               iStarDegreeEffect = 50;
               break;
            case 6:
               iStarDegreeEffect = 60;
               break;
            case 7:
               iStarDegreeEffect = 70;
               break;
            case 8:
               iStarDegreeEffect = 85;
               break;
            case 9:
               iStarDegreeEffect = 100;
               break;
            case 10:
               iStarDegreeEffect = 120;
               break;
            case 11:
               iStarDegreeEffect = 140;
               break;
            case 12:
               iStarDegreeEffect = 160;
               break;
            case 13:
               iStarDegreeEffect = 180;
               break;
            case 14:
               iStarDegreeEffect = 200;
               break;
            case 15:
               iStarDegreeEffect = 220;
               break;
            case 16:
               iStarDegreeEffect = 240;
         }
         return iStarDegreeEffect;
      }
      
      override protected function a_3966() : int
      {
         var iSkillDegreeEffect:int = 0;
         if(m_iSkillDegree <= 4)
         {
            iSkillDegreeEffect = 1 * m_iSkillDegree;
         }
         else if(m_iSkillDegree > 4)
         {
            iSkillDegreeEffect = 1 * 4 + 2 * (m_iSkillDegree - 4);
         }
         return 2 * iSkillDegreeEffect;
      }
   }
}

