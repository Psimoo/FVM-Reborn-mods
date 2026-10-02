package com.aurora.ui.maogoutd.resource.defender.TigerYear.FireflyLantern
{
   public class FireflyDefine
   {
      
      internal static const DEFENSE_PRICE:int = 35;
      
      internal static const REDUCE_DEFENSE_PRICE:int = 50;
      
      internal static const HURT_ADDITION:Number = 0.1;
      
      internal static const FIRSTTRANS_LIFEADD:int = 24;
      
      internal static const LIFE_VALUE:int = 50;
      
      public function FireflyDefine()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int) : int
      {
         return a_3966(iSkillDegree);
      }
      
      internal static function a_3965(iStarDegree:int) : Number
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 30;
               break;
            case 1:
               iStarDegreeEffect = 29;
               break;
            case 2:
               iStarDegreeEffect = 28;
               break;
            case 3:
               iStarDegreeEffect = 27;
               break;
            case 4:
               iStarDegreeEffect = 26;
               break;
            case 5:
               iStarDegreeEffect = 25;
               break;
            case 6:
               iStarDegreeEffect = 23;
               break;
            case 7:
               iStarDegreeEffect = 22;
               break;
            case 8:
               iStarDegreeEffect = 21;
               break;
            case 9:
               iStarDegreeEffect = 20;
               break;
            case 10:
               iStarDegreeEffect = 19;
               break;
            case 11:
               iStarDegreeEffect = 18;
               break;
            case 12:
               iStarDegreeEffect = 17;
               break;
            case 13:
               iStarDegreeEffect = 16;
               break;
            case 14:
               iStarDegreeEffect = 14;
               break;
            case 15:
               iStarDegreeEffect = 12;
               break;
            case 16:
               iStarDegreeEffect = 10;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 30;
               break;
            case 1:
               iSkillDegreeEffect = 35;
               break;
            case 2:
               iSkillDegreeEffect = 40;
               break;
            case 3:
               iSkillDegreeEffect = 45;
               break;
            case 4:
               iSkillDegreeEffect = 50;
               break;
            case 5:
               iSkillDegreeEffect = 55;
               break;
            case 6:
               iSkillDegreeEffect = 60;
               break;
            case 7:
               iSkillDegreeEffect = 70;
               break;
            case 8:
               iSkillDegreeEffect = 90;
         }
         return iSkillDegreeEffect * 10;
      }
   }
}

