package com.aurora.ui.maogoutd.resource.defender.CattleYear.Mustard
{
   public class MustardBoomDefine
   {
      
      internal static const DEFENSE_PRICE:int = 215;
      
      internal static const FIRSTTRANS_DEFENSE_PRICE:int = 215 - 50;
      
      internal static const SECONDTRANS_DEFENSE_PRICE:int = 225;
      
      internal static const MAX_LIFE_VALUE:int = 20000;
      
      public function MustardBoomDefine()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int) : int
      {
         return a_3966(iSkillDegree);
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 5;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 5;
               break;
            case 1:
               iStarDegreeEffect = 5;
               break;
            case 2:
               iStarDegreeEffect = 5;
               break;
            case 3:
               iStarDegreeEffect = 10;
               break;
            case 4:
               iStarDegreeEffect = 10;
               break;
            case 5:
               iStarDegreeEffect = 10;
               break;
            case 6:
               iStarDegreeEffect = 15;
               break;
            case 7:
               iStarDegreeEffect = 15;
               break;
            case 8:
               iStarDegreeEffect = 15;
               break;
            case 9:
               iStarDegreeEffect = 20;
               break;
            case 10:
               iStarDegreeEffect = 20;
               break;
            case 11:
               iStarDegreeEffect = 20;
               break;
            case 12:
               iStarDegreeEffect = 25;
               break;
            case 13:
               iStarDegreeEffect = 30;
               break;
            case 14:
               iStarDegreeEffect = 35;
               break;
            case 15:
               iStarDegreeEffect = 40;
               break;
            case 16:
               iStarDegreeEffect = 45;
         }
         return iStarDegreeEffect;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 50;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 50;
               break;
            case 1:
               iSkillDegreeEffect = 47;
               break;
            case 2:
               iSkillDegreeEffect = 44;
               break;
            case 3:
               iSkillDegreeEffect = 41;
               break;
            case 4:
               iSkillDegreeEffect = 38;
               break;
            case 5:
               iSkillDegreeEffect = 34;
               break;
            case 6:
               iSkillDegreeEffect = 30;
               break;
            case 7:
               iSkillDegreeEffect = 25;
               break;
            case 8:
               iSkillDegreeEffect = 20;
         }
         return iSkillDegreeEffect * 10;
      }
   }
}

