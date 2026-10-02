package com.aurora.ui.maogoutd.resource.defender
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class SmellyBeanCurdFirstTransAttackFighter extends a_3953
   {
      
      public function SmellyBeanCurdFirstTransAttackFighter()
      {
         super();
         a_1309 = 60 - this.a_3966();
         a_1311 = this.a_3965();
         a_1312 = 15;
         a_1095 = 150;
         a_1304 = b_183.enm_SmellyBeanCurdShot;
         a_1310 = 8;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(SmellyBeanCurdFirstTransAttackFighter) as SmellyBeanCurdFirstTransAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return SmellyBeanCurdFirstTransAttackFighterMovie;
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
         var numHurt:Number = NaN;
         super.a_3954(iCurrentTime);
         if(iCurrentTime == a_1321)
         {
            numHurt = a_1311 * 0.3 > 15 ? a_1311 * 0.35 : 15;
            a_1322 = int(iCurrentTime * 10000 * Math.PI) % 3 == 0 ? int(numHurt) : 0;
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
         var iStarDegreeEffect:int = 25;
         switch(a_1094)
         {
            case 0:
               iStarDegreeEffect = 25;
               break;
            case 1:
               iStarDegreeEffect = 30;
               break;
            case 2:
               iStarDegreeEffect = 35;
               break;
            case 3:
               iStarDegreeEffect = 40;
               break;
            case 4:
               iStarDegreeEffect = 55;
               break;
            case 5:
               iStarDegreeEffect = 70;
               break;
            case 6:
               iStarDegreeEffect = 85;
               break;
            case 7:
               iStarDegreeEffect = 100;
               break;
            case 8:
               iStarDegreeEffect = 120;
               break;
            case 9:
               iStarDegreeEffect = 140;
               break;
            case 10:
               iStarDegreeEffect = 170;
               break;
            case 11:
               iStarDegreeEffect = 200;
               break;
            case 12:
               iStarDegreeEffect = 230;
               break;
            case 13:
               iStarDegreeEffect = 260;
               break;
            case 14:
               iStarDegreeEffect = 290;
               break;
            case 15:
               iStarDegreeEffect = 320;
               break;
            case 16:
               iStarDegreeEffect = 350;
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

