package com.aurora.ui.maogoutd.resource.defender.HorseYear.qiaotouNoodles
{
   public class QiaotouRiceNoodlesDefine
   {
      
      public function QiaotouRiceNoodlesDefine()
      {
         super();
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 2.1;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 2.1;
               break;
            case 1:
               iSkillDegreeEffect = 2.05;
               break;
            case 2:
               iSkillDegreeEffect = 2;
               break;
            case 3:
               iSkillDegreeEffect = 1.95;
               break;
            case 4:
               iSkillDegreeEffect = 1.9;
               break;
            case 5:
               iSkillDegreeEffect = 1.85;
               break;
            case 6:
               iSkillDegreeEffect = 1.8;
               break;
            case 7:
               iSkillDegreeEffect = 1.7;
               break;
            case 8:
               iSkillDegreeEffect = 1.5;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 4;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 4.2;
               break;
            case 1:
               iStarDegreeEffect = 5;
               break;
            case 2:
               iStarDegreeEffect = 5.8;
               break;
            case 3:
               iStarDegreeEffect = 6.6;
               break;
            case 4:
               iStarDegreeEffect = 8.2;
               break;
            case 5:
               iStarDegreeEffect = 9.8;
               break;
            case 6:
               iStarDegreeEffect = 11.4;
               break;
            case 7:
               iStarDegreeEffect = 13.8;
               break;
            case 8:
               iStarDegreeEffect = 16.2;
               break;
            case 9:
               iStarDegreeEffect = 18.6;
               break;
            case 10:
               iStarDegreeEffect = 22;
               break;
            case 11:
               iStarDegreeEffect = 27;
               break;
            case 12:
               iStarDegreeEffect = 32;
               break;
            case 13:
               iStarDegreeEffect = 37;
               break;
            case 14:
               iStarDegreeEffect = 42;
               break;
            case 15:
               iStarDegreeEffect = 47;
               break;
            case 16:
               iStarDegreeEffect = 55;
         }
         return iStarDegreeEffect * 10;
      }
   }
}

