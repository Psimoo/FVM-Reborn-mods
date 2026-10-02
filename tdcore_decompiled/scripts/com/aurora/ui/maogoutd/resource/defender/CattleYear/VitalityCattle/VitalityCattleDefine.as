package com.aurora.ui.maogoutd.resource.defender.CattleYear.VitalityCattle
{
   public class VitalityCattleDefine
   {
      
      internal static const DEFENSE_PRICE:int = 225;
      
      public function VitalityCattleDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 300;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 1.8;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 1.8;
               break;
            case 1:
               iSkillDegreeEffect = 1.75;
               break;
            case 2:
               iSkillDegreeEffect = 1.7;
               break;
            case 3:
               iSkillDegreeEffect = 1.65;
               break;
            case 4:
               iSkillDegreeEffect = 1.6;
               break;
            case 5:
               iSkillDegreeEffect = 1.55;
               break;
            case 6:
               iSkillDegreeEffect = 1.5;
               break;
            case 7:
               iSkillDegreeEffect = 1.45;
               break;
            case 8:
               iSkillDegreeEffect = 1.4;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 2.5;
               break;
            case 1:
               iStarDegreeEffect = 2.9;
               break;
            case 2:
               iStarDegreeEffect = 3.3;
               break;
            case 3:
               iStarDegreeEffect = 3.7;
               break;
            case 4:
               iStarDegreeEffect = 4.1;
               break;
            case 5:
               iStarDegreeEffect = 4.5;
               break;
            case 6:
               iStarDegreeEffect = 4.9;
               break;
            case 7:
               iStarDegreeEffect = 5.5;
               break;
            case 8:
               iStarDegreeEffect = 6.5;
               break;
            case 9:
               iStarDegreeEffect = 7.5;
               break;
            case 10:
               iStarDegreeEffect = 9.5;
               break;
            case 11:
               iStarDegreeEffect = 11.5;
               break;
            case 12:
               iStarDegreeEffect = 13.5;
               break;
            case 13:
               iStarDegreeEffect = 15.5;
               break;
            case 14:
               iStarDegreeEffect = 17.5;
               break;
            case 15:
               iStarDegreeEffect = 19.5;
               break;
            case 16:
               iStarDegreeEffect = 22.5;
         }
         return iStarDegreeEffect * 10;
      }
   }
}

