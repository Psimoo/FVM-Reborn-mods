package com.aurora.ui.maogoutd.resource.defender.PigYear.Tsao
{
   public class TsaoBabaDefine
   {
      
      internal static const DEFENSE_PRICE:int = 95;
      
      public function TsaoBabaDefine()
      {
         super();
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 5;
               break;
            case 1:
               iStarDegreeEffect = 6;
               break;
            case 2:
               iStarDegreeEffect = 7;
               break;
            case 3:
               iStarDegreeEffect = 8;
               break;
            case 4:
               iStarDegreeEffect = 9;
               break;
            case 5:
               iStarDegreeEffect = 10;
               break;
            case 6:
               iStarDegreeEffect = 11;
               break;
            case 7:
               iStarDegreeEffect = 13;
               break;
            case 8:
               iStarDegreeEffect = 15;
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
      
      internal static function GetAttackAddend(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 0.3;
               break;
            case 1:
               iStarDegreeEffect = 0.35;
               break;
            case 2:
               iStarDegreeEffect = 0.4;
               break;
            case 3:
               iStarDegreeEffect = 0.45;
               break;
            case 4:
               iStarDegreeEffect = 0.5;
               break;
            case 5:
               iStarDegreeEffect = 0.55;
               break;
            case 6:
               iStarDegreeEffect = 0.6;
               break;
            case 7:
               iStarDegreeEffect = 0.65;
               break;
            case 8:
               iStarDegreeEffect = 0.7;
               break;
            case 9:
               iStarDegreeEffect = 1;
               break;
            case 10:
               iStarDegreeEffect = 1.3;
               break;
            case 11:
               iStarDegreeEffect = 1.6;
               break;
            case 12:
               iStarDegreeEffect = 2;
               break;
            case 13:
               iStarDegreeEffect = 2.4;
               break;
            case 14:
               iStarDegreeEffect = 2.8;
               break;
            case 15:
               iStarDegreeEffect = 3.2;
               break;
            case 16:
               iStarDegreeEffect = 3.6;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return a_3966(iSkillDegree);
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 16;
               break;
            case 1:
               iSkillDegreeEffect = 15;
               break;
            case 2:
               iSkillDegreeEffect = 14;
               break;
            case 3:
               iSkillDegreeEffect = 13;
               break;
            case 4:
               iSkillDegreeEffect = 12;
               break;
            case 5:
               iSkillDegreeEffect = 11;
               break;
            case 6:
               iSkillDegreeEffect = 10;
               break;
            case 7:
               iSkillDegreeEffect = 9;
               break;
            case 8:
               iSkillDegreeEffect = 7;
         }
         return iSkillDegreeEffect * 10;
      }
   }
}

