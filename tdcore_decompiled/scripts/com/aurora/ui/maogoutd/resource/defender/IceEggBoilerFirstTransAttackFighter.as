package com.aurora.ui.maogoutd.resource.defender
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class IceEggBoilerFirstTransAttackFighter extends a_3953
   {
      
      public function IceEggBoilerFirstTransAttackFighter()
      {
         super();
         a_1335 = 65540;
         a_1309 = 60 - IceEggBoilerDefence.a_3966(m_iSkillDegree);
         a_1311 = this.a_3965();
         a_1312 = 15;
         a_1095 = 200;
         a_1304 = b_183.enm_IceEggShot;
         a_1310 = 10;
         a_1337 = -15;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(IceEggBoilerFirstTransAttackFighter) as IceEggBoilerFirstTransAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return IceEggBoilerFirstTransAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         a_1310 = 10;
         super.a_1797(stFieldGrid);
         a_1311 = this.a_3965();
         a_1309 = 60 - IceEggBoilerDefence.a_3966(m_iSkillDegree);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return 500;
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
         return width + 60;
      }
      
      override protected function a_3956() : Number
      {
         return -40;
      }
      
      override protected function a_3965() : int
      {
         var iStarDegreeEffect:int = 7;
         switch(a_1094)
         {
            case 0:
               iStarDegreeEffect = 70;
               break;
            case 1:
               iStarDegreeEffect = 90;
               break;
            case 2:
               iStarDegreeEffect = 110;
               break;
            case 3:
               iStarDegreeEffect = 120;
               break;
            case 4:
               iStarDegreeEffect = 150;
               break;
            case 5:
               iStarDegreeEffect = 180;
               break;
            case 6:
               iStarDegreeEffect = 210;
               break;
            case 7:
               iStarDegreeEffect = 250;
               break;
            case 8:
               iStarDegreeEffect = 290;
               break;
            case 9:
               iStarDegreeEffect = 330;
               break;
            case 10:
               iStarDegreeEffect = 380;
               break;
            case 11:
               iStarDegreeEffect = 430;
               break;
            case 12:
               iStarDegreeEffect = 480;
               break;
            case 13:
               iStarDegreeEffect = 530;
               break;
            case 14:
               iStarDegreeEffect = 580;
               break;
            case 15:
               iStarDegreeEffect = 630;
               break;
            case 16:
               iStarDegreeEffect = 680;
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

