package com.aurora.ui.maogoutd.resource.defender.PigYear.Engineer
{
   import a_4718.b_183;
   
   public class EngineerPigDefine
   {
      
      internal static const DEFENSE_PRICE:int = 225;
      
      public function EngineerPigDefine()
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
         var iStarDegreeEffect:int = 5;
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
               iStarDegreeEffect = 12;
               break;
            case 8:
               iStarDegreeEffect = 13;
               break;
            case 9:
               iStarDegreeEffect = 15;
               break;
            case 10:
               iStarDegreeEffect = 18;
               break;
            case 11:
               iStarDegreeEffect = 21;
               break;
            case 12:
               iStarDegreeEffect = 24;
               break;
            case 13:
               iStarDegreeEffect = 28;
               break;
            case 14:
               iStarDegreeEffect = 33;
               break;
            case 15:
               iStarDegreeEffect = 38;
               break;
            case 16:
               iStarDegreeEffect = 45;
         }
         return iStarDegreeEffect * 10;
      }
   }
}

