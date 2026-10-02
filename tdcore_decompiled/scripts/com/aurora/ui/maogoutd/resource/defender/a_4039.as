package com.aurora.ui.maogoutd.resource.defender
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class a_4039 extends a_3953
   {
      
      public function a_4039()
      {
         super();
         a_1309 = 60 - this.a_3966();
         a_1311 = this.a_3965();
         a_1312 = 15;
         a_1095 = 100;
         a_1304 = b_183.b_186;
         a_1310 = 12;
         a_1333 = true;
         a_1322 = 0;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(a_4039) as a_4039;
      }
      
      override protected function getBindMovie() : Class
      {
         return FruitSaladAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         a_1310 = 12;
         super.a_1797(stFieldGrid);
         a_1311 = this.a_3965();
         a_1309 = 60 - this.a_3966();
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
               iStarDegreeEffect = 30;
               break;
            case 1:
               iStarDegreeEffect = 40;
               break;
            case 2:
               iStarDegreeEffect = 50;
               break;
            case 3:
               iStarDegreeEffect = 60;
               break;
            case 4:
               iStarDegreeEffect = 70;
               break;
            case 5:
               iStarDegreeEffect = 80;
               break;
            case 6:
               iStarDegreeEffect = 100;
               break;
            case 7:
               iStarDegreeEffect = 120;
               break;
            case 8:
               iStarDegreeEffect = 140;
               break;
            case 9:
               iStarDegreeEffect = 160;
               break;
            case 10:
               iStarDegreeEffect = 190;
               break;
            case 11:
               iStarDegreeEffect = 220;
               break;
            case 12:
               iStarDegreeEffect = 250;
               break;
            case 13:
               iStarDegreeEffect = 280;
               break;
            case 14:
               iStarDegreeEffect = 310;
               break;
            case 15:
               iStarDegreeEffect = 340;
               break;
            case 16:
               iStarDegreeEffect = 370;
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

