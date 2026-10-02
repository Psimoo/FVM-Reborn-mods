package com.aurora.ui.maogoutd.resource.defender.PigYear.NationalDay
{
   public class NationalDayDefine
   {
      
      internal static const DEFENSE_PRICE:int = 155;
      
      internal static const FIRSTTRANS_DEFENSE_PRICE:int = 175;
      
      internal static const SECONDTRANS_DEFENSE_PRICE:int = 225;
      
      internal static const MAX_LIFE_VALUE:int = 20000;
      
      public function NationalDayDefine()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int) : int
      {
         return 250;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 25;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 25;
               break;
            case 1:
               iSkillDegreeEffect = 27;
               break;
            case 2:
               iSkillDegreeEffect = 29;
               break;
            case 3:
               iSkillDegreeEffect = 31;
               break;
            case 4:
               iSkillDegreeEffect = 33;
               break;
            case 5:
               iSkillDegreeEffect = 37;
               break;
            case 6:
               iSkillDegreeEffect = 41;
               break;
            case 7:
               iSkillDegreeEffect = 45;
               break;
            case 8:
               iSkillDegreeEffect = 49;
         }
         return iSkillDegreeEffect;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 25;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 25;
               break;
            case 1:
               iStarDegreeEffect = 24;
               break;
            case 2:
               iStarDegreeEffect = 23;
               break;
            case 3:
               iStarDegreeEffect = 22;
               break;
            case 4:
               iStarDegreeEffect = 21;
               break;
            case 5:
               iStarDegreeEffect = 20;
               break;
            case 6:
               iStarDegreeEffect = 19;
               break;
            case 7:
               iStarDegreeEffect = 18;
               break;
            case 8:
               iStarDegreeEffect = 17;
               break;
            case 9:
               iStarDegreeEffect = 16;
               break;
            case 10:
               iStarDegreeEffect = 15;
               break;
            case 11:
               iStarDegreeEffect = 14;
               break;
            case 12:
               iStarDegreeEffect = 13;
               break;
            case 13:
               iStarDegreeEffect = 12;
               break;
            case 14:
               iStarDegreeEffect = 11;
               break;
            case 15:
               iStarDegreeEffect = 10;
               break;
            case 16:
               iStarDegreeEffect = 8;
         }
         return iStarDegreeEffect * 20;
      }
   }
}

