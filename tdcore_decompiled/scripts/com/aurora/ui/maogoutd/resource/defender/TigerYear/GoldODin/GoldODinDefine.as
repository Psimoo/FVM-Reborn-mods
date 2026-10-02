package com.aurora.ui.maogoutd.resource.defender.TigerYear.GoldODin
{
   import a_4718.b_183;
   
   public class GoldODinDefine
   {
      
      internal static const DEFENSE_PRICE:int = 230;
      
      public function GoldODinDefine()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_ScorpioShot;
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 1.3;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 1.3;
               break;
            case 1:
               iSkillDegreeEffect = 1.25;
               break;
            case 2:
               iSkillDegreeEffect = 1.2;
               break;
            case 3:
               iSkillDegreeEffect = 1.15;
               break;
            case 4:
               iSkillDegreeEffect = 1.1;
               break;
            case 5:
               iSkillDegreeEffect = 1.05;
               break;
            case 6:
               iSkillDegreeEffect = 1;
               break;
            case 7:
               iSkillDegreeEffect = 0.9;
               break;
            case 8:
               iSkillDegreeEffect = 0.8;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 5.5;
               break;
            case 1:
               iStarDegreeEffect = 6.5;
               break;
            case 2:
               iStarDegreeEffect = 7.5;
               break;
            case 3:
               iStarDegreeEffect = 8.5;
               break;
            case 4:
               iStarDegreeEffect = 9.5;
               break;
            case 5:
               iStarDegreeEffect = 10.5;
               break;
            case 6:
               iStarDegreeEffect = 11.5;
               break;
            case 7:
               iStarDegreeEffect = 12.5;
               break;
            case 8:
               iStarDegreeEffect = 15.5;
               break;
            case 9:
               iStarDegreeEffect = 20.5;
               break;
            case 10:
               iStarDegreeEffect = 28;
               break;
            case 11:
               iStarDegreeEffect = 36;
               break;
            case 12:
               iStarDegreeEffect = 44;
               break;
            case 13:
               iStarDegreeEffect = 54;
               break;
            case 14:
               iStarDegreeEffect = 69;
               break;
            case 15:
               iStarDegreeEffect = 84;
               break;
            case 16:
               iStarDegreeEffect = 99;
               break;
            case 17:
               iStarDegreeEffect = 135;
               break;
            case 18:
               iStarDegreeEffect = 189;
         }
         return iStarDegreeEffect * 10;
      }
   }
}

