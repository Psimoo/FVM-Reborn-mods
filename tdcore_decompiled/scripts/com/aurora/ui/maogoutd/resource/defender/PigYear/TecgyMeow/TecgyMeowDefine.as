package com.aurora.ui.maogoutd.resource.defender.PigYear.TecgyMeow
{
   public class TecgyMeowDefine
   {
      
      internal static const DEFENSE_PRICE:int = 225;
      
      internal static const FIRSTTRANS_DEFENSE_PRICE:int = 225;
      
      internal static const MAX_LIFE_VALUE:int = 50;
      
      public function TecgyMeowDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return 70;
      }
      
      internal static function GetHighShotHurtValue(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 5.5;
               break;
            case 1:
               iStarDegreeEffect = 6;
               break;
            case 2:
               iStarDegreeEffect = 6.5;
               break;
            case 3:
               iStarDegreeEffect = 7;
               break;
            case 4:
               iStarDegreeEffect = 8;
               break;
            case 5:
               iStarDegreeEffect = 9;
               break;
            case 6:
               iStarDegreeEffect = 10;
               break;
            case 7:
               iStarDegreeEffect = 12;
               break;
            case 8:
               iStarDegreeEffect = 14;
               break;
            case 9:
               iStarDegreeEffect = 17;
               break;
            case 10:
               iStarDegreeEffect = 20;
               break;
            case 11:
               iStarDegreeEffect = 23;
               break;
            case 12:
               iStarDegreeEffect = 26;
               break;
            case 13:
               iStarDegreeEffect = 29;
               break;
            case 14:
               iStarDegreeEffect = 32;
               break;
            case 15:
               iStarDegreeEffect = 35;
               break;
            case 16:
               iStarDegreeEffect = 38;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function GetLowShotHurtValue(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 5;
               break;
            case 1:
               iStarDegreeEffect = 5.5;
               break;
            case 2:
               iStarDegreeEffect = 6;
               break;
            case 3:
               iStarDegreeEffect = 7;
               break;
            case 4:
               iStarDegreeEffect = 8;
               break;
            case 5:
               iStarDegreeEffect = 9;
               break;
            case 6:
               iStarDegreeEffect = 10;
               break;
            case 7:
               iStarDegreeEffect = 12;
               break;
            case 8:
               iStarDegreeEffect = 14;
               break;
            case 9:
               iStarDegreeEffect = 20;
               break;
            case 10:
               iStarDegreeEffect = 26;
               break;
            case 11:
               iStarDegreeEffect = 32;
               break;
            case 12:
               iStarDegreeEffect = 38;
               break;
            case 13:
               iStarDegreeEffect = 46;
               break;
            case 14:
               iStarDegreeEffect = 54;
               break;
            case 15:
               iStarDegreeEffect = 61;
               break;
            case 16:
               iStarDegreeEffect = 69;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 2;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 2;
               break;
            case 1:
               iSkillDegreeEffect = 1.95;
               break;
            case 2:
               iSkillDegreeEffect = 1.9;
               break;
            case 3:
               iSkillDegreeEffect = 1.85;
               break;
            case 4:
               iSkillDegreeEffect = 1.8;
               break;
            case 5:
               iSkillDegreeEffect = 1.7;
               break;
            case 6:
               iSkillDegreeEffect = 1.6;
               break;
            case 7:
               iSkillDegreeEffect = 1.5;
               break;
            case 8:
               iSkillDegreeEffect = 1.2;
         }
         return iSkillDegreeEffect * 20;
      }
   }
}

