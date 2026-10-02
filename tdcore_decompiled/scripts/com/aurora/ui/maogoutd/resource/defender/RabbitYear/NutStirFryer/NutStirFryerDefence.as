package com.aurora.ui.maogoutd.resource.defender.RabbitYear.NutStirFryer
{
   import a_4718.b_183;
   
   public class NutStirFryerDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 215;
      
      public function NutStirFryerDefence()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_AthenaShot;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 1.5;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 1.5;
               break;
            case 1:
               iSkillDegreeEffect = 1.45;
               break;
            case 2:
               iSkillDegreeEffect = 1.4;
               break;
            case 3:
               iSkillDegreeEffect = 1.35;
               break;
            case 4:
               iSkillDegreeEffect = 1.3;
               break;
            case 5:
               iSkillDegreeEffect = 1.25;
               break;
            case 6:
               iSkillDegreeEffect = 1.2;
               break;
            case 7:
               iSkillDegreeEffect = 1.15;
               break;
            case 8:
               iSkillDegreeEffect = 1.1;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 2.5;
               break;
            case 1:
               iStarDegreeEffect = 2.9;
               break;
            case 2:
               iStarDegreeEffect = 3.3;
               break;
            case 3:
               iStarDegreeEffect = 3.8;
               break;
            case 4:
               iStarDegreeEffect = 4.3;
               break;
            case 5:
               iStarDegreeEffect = 4.8;
               break;
            case 6:
               iStarDegreeEffect = 6;
               break;
            case 7:
               iStarDegreeEffect = 7.2;
               break;
            case 8:
               iStarDegreeEffect = 8.4;
               break;
            case 9:
               iStarDegreeEffect = 10.2;
               break;
            case 10:
               iStarDegreeEffect = 14;
               break;
            case 11:
               iStarDegreeEffect = 17.8;
               break;
            case 12:
               iStarDegreeEffect = 23;
               break;
            case 13:
               iStarDegreeEffect = 30;
               break;
            case 14:
               iStarDegreeEffect = 39;
               break;
            case 15:
               iStarDegreeEffect = 48;
               break;
            case 16:
               iStarDegreeEffect = 57;
         }
         return 10 * iStarDegreeEffect;
      }
   }
}

