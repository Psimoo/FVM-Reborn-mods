package com.aurora.ui.maogoutd.resource.defender.TigerYear.ElectricTiger
{
   public class ElectricTigerDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const DEFENSE_PRICE:int = 335;
      
      internal static const FIRSTTRANS_ADDITION:Number = 0.1;
      
      public function ElectricTigerDefine()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 75;
               break;
            case 1:
               iStarDegreeEffect = 90;
               break;
            case 2:
               iStarDegreeEffect = 105;
               break;
            case 3:
               iStarDegreeEffect = 120;
               break;
            case 4:
               iStarDegreeEffect = 150;
               break;
            case 5:
               iStarDegreeEffect = 180;
               break;
            case 6:
               iStarDegreeEffect = 210;
               break;
            case 7:
               iStarDegreeEffect = 255;
               break;
            case 8:
               iStarDegreeEffect = 300;
               break;
            case 9:
               iStarDegreeEffect = 345;
               break;
            case 10:
               iStarDegreeEffect = 405;
               break;
            case 11:
               iStarDegreeEffect = 465;
               break;
            case 12:
               iStarDegreeEffect = 525;
               break;
            case 13:
               iStarDegreeEffect = 585;
               break;
            case 14:
               iStarDegreeEffect = 645;
               break;
            case 15:
               iStarDegreeEffect = 705;
               break;
            case 16:
               iStarDegreeEffect = 780;
         }
         return iStarDegreeEffect;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 2.5;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 2.5;
               break;
            case 1:
               iSkillDegreeEffect = 2.45;
               break;
            case 2:
               iSkillDegreeEffect = 2.4;
               break;
            case 3:
               iSkillDegreeEffect = 2.35;
               break;
            case 4:
               iSkillDegreeEffect = 2.3;
               break;
            case 5:
               iSkillDegreeEffect = 2.2;
               break;
            case 6:
               iSkillDegreeEffect = 2.1;
               break;
            case 7:
               iSkillDegreeEffect = 2;
               break;
            case 8:
               iSkillDegreeEffect = 1.5;
         }
         return iSkillDegreeEffect * 20;
      }
   }
}

