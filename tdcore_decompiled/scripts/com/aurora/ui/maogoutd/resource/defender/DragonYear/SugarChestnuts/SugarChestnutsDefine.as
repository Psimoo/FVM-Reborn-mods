package com.aurora.ui.maogoutd.resource.defender.DragonYear.SugarChestnuts
{
   public class SugarChestnutsDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 14;
      
      internal static const DEFENSE_PRICE:int = 160;
      
      internal static const FIRSTTRANS_ADDITION:Number = 0.3;
      
      public function SugarChestnutsDefine()
      {
         super();
      }
      
      internal static function a_3965(iStarDegree:int) : Number
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 6.5;
               break;
            case 1:
               iStarDegreeEffect = 7.5;
               break;
            case 2:
               iStarDegreeEffect = 8.5;
               break;
            case 3:
               iStarDegreeEffect = 11;
               break;
            case 4:
               iStarDegreeEffect = 13.5;
               break;
            case 5:
               iStarDegreeEffect = 16;
               break;
            case 6:
               iStarDegreeEffect = 19;
               break;
            case 7:
               iStarDegreeEffect = 22;
               break;
            case 8:
               iStarDegreeEffect = 26;
               break;
            case 9:
               iStarDegreeEffect = 30;
               break;
            case 10:
               iStarDegreeEffect = 35;
               break;
            case 11:
               iStarDegreeEffect = 40;
               break;
            case 12:
               iStarDegreeEffect = 47;
               break;
            case 13:
               iStarDegreeEffect = 54;
               break;
            case 14:
               iStarDegreeEffect = 61;
               break;
            case 15:
               iStarDegreeEffect = 68;
               break;
            case 16:
               iStarDegreeEffect = 75;
         }
         return iStarDegreeEffect;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 3.8;
               break;
            case 1:
               iSkillDegreeEffect = 3.7;
               break;
            case 2:
               iSkillDegreeEffect = 3.5;
               break;
            case 3:
               iSkillDegreeEffect = 3.3;
               break;
            case 4:
               iSkillDegreeEffect = 3.1;
               break;
            case 5:
               iSkillDegreeEffect = 2.9;
               break;
            case 6:
               iSkillDegreeEffect = 2.7;
               break;
            case 7:
               iSkillDegreeEffect = 2.5;
               break;
            case 8:
               iSkillDegreeEffect = 2.2;
         }
         return iSkillDegreeEffect * 20;
      }
   }
}

