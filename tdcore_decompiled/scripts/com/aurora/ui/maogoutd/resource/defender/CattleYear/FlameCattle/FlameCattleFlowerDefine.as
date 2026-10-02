package com.aurora.ui.maogoutd.resource.defender.CattleYear.FlameCattle
{
   public class FlameCattleFlowerDefine
   {
      
      internal static const DEFENSE_PRICE:int = 150;
      
      public function FlameCattleFlowerDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return 350;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         return 500 - 20 * iStarDegree;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 55;
               break;
            case 1:
               iSkillDegreeEffect = 61;
               break;
            case 2:
               iSkillDegreeEffect = 67;
               break;
            case 3:
               iSkillDegreeEffect = 73;
               break;
            case 4:
               iSkillDegreeEffect = 79;
               break;
            case 5:
               iSkillDegreeEffect = 85;
               break;
            case 6:
               iSkillDegreeEffect = 91;
               break;
            case 7:
               iSkillDegreeEffect = 97;
               break;
            case 8:
               iSkillDegreeEffect = 108;
         }
         return iSkillDegreeEffect;
      }
   }
}

