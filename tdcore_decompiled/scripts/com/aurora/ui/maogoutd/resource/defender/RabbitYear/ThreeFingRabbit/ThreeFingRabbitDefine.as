package com.aurora.ui.maogoutd.resource.defender.RabbitYear.ThreeFingRabbit
{
   public class ThreeFingRabbitDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const DEFENSE_PRICE:int = 225;
      
      internal static const FIRSTTRANS_ADDITION:Number = 0.1;
      
      public function ThreeFingRabbitDefine()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return a_3966(iSkillDegree);
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 10;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 10;
               break;
            case 1:
               iStarDegreeEffect = 9.5;
               break;
            case 2:
               iStarDegreeEffect = 9;
               break;
            case 3:
               iStarDegreeEffect = 8.5;
               break;
            case 4:
               iStarDegreeEffect = 8;
               break;
            case 5:
               iStarDegreeEffect = 7.5;
               break;
            case 6:
               iStarDegreeEffect = 7;
               break;
            case 7:
               iStarDegreeEffect = 6.5;
               break;
            case 8:
               iStarDegreeEffect = 6;
               break;
            case 9:
               iStarDegreeEffect = 5.5;
               break;
            case 10:
               iStarDegreeEffect = 5;
               break;
            case 11:
               iStarDegreeEffect = 4.5;
               break;
            case 12:
               iStarDegreeEffect = 4;
               break;
            case 13:
               iStarDegreeEffect = 3.5;
               break;
            case 14:
               iStarDegreeEffect = 3;
               break;
            case 15:
               iStarDegreeEffect = 2.5;
               break;
            case 16:
               iStarDegreeEffect = 2;
         }
         return iStarDegreeEffect * 20;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 60;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 57;
               break;
            case 1:
               iSkillDegreeEffect = 54;
               break;
            case 2:
               iSkillDegreeEffect = 54;
               break;
            case 3:
               iSkillDegreeEffect = 51;
               break;
            case 4:
               iSkillDegreeEffect = 47;
               break;
            case 5:
               iSkillDegreeEffect = 43;
               break;
            case 6:
               iSkillDegreeEffect = 38;
               break;
            case 7:
               iSkillDegreeEffect = 33;
               break;
            case 8:
               iSkillDegreeEffect = 25;
         }
         return iSkillDegreeEffect * 10;
      }
   }
}

