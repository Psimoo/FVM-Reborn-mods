package com.aurora.ui.maogoutd.resource.defender.TigerYear.AcidLemonBomb
{
   public class AcidLemonBombDefine
   {
      
      internal static const DEFENSE_PRICE:int = 275;
      
      internal static const FIRSTTRANS_DEFENSE_PRICE:int = 225;
      
      internal static const MAX_LIFE_VALUE:int = 20000;
      
      public function AcidLemonBombDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 31;
               break;
            case 1:
               iStarDegreeEffect = 30;
               break;
            case 2:
               iStarDegreeEffect = 29;
               break;
            case 3:
               iStarDegreeEffect = 28;
               break;
            case 4:
               iStarDegreeEffect = 27;
               break;
            case 5:
               iStarDegreeEffect = 26;
               break;
            case 6:
               iStarDegreeEffect = 25;
               break;
            case 7:
               iStarDegreeEffect = 24;
               break;
            case 8:
               iStarDegreeEffect = 23;
               break;
            case 9:
               iStarDegreeEffect = 22;
               break;
            case 10:
               iStarDegreeEffect = 20;
               break;
            case 11:
               iStarDegreeEffect = 18;
               break;
            case 12:
               iStarDegreeEffect = 16;
               break;
            case 13:
               iStarDegreeEffect = 14;
               break;
            case 14:
               iStarDegreeEffect = 12;
               break;
            case 15:
               iStarDegreeEffect = 10;
               break;
            case 16:
               iStarDegreeEffect = 7;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 0;
               break;
            case 1:
               iStarDegreeEffect = 1;
               break;
            case 2:
               iStarDegreeEffect = 2;
               break;
            case 3:
               iStarDegreeEffect = 3;
               break;
            case 4:
               iStarDegreeEffect = 4;
               break;
            case 5:
               iStarDegreeEffect = 5;
               break;
            case 6:
               iStarDegreeEffect = 6;
               break;
            case 7:
               iStarDegreeEffect = 7;
               break;
            case 8:
               iStarDegreeEffect = 8;
               break;
            case 9:
               iStarDegreeEffect = 10;
               break;
            case 10:
               iStarDegreeEffect = 12;
               break;
            case 11:
               iStarDegreeEffect = 14;
               break;
            case 12:
               iStarDegreeEffect = 16;
               break;
            case 13:
               iStarDegreeEffect = 18;
               break;
            case 14:
               iStarDegreeEffect = 20;
               break;
            case 15:
               iStarDegreeEffect = 23;
               break;
            case 16:
               iStarDegreeEffect = 26;
         }
         return iStarDegreeEffect * (5 + 5);
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 5;
               break;
            case 1:
               iSkillDegreeEffect = 6;
               break;
            case 2:
               iSkillDegreeEffect = 7;
               break;
            case 3:
               iSkillDegreeEffect = 8;
               break;
            case 4:
               iSkillDegreeEffect = 9;
               break;
            case 5:
               iSkillDegreeEffect = 10;
               break;
            case 6:
               iSkillDegreeEffect = 11;
               break;
            case 7:
               iSkillDegreeEffect = 12;
               break;
            case 8:
               iSkillDegreeEffect = 15;
         }
         return iSkillDegreeEffect;
      }
   }
}

