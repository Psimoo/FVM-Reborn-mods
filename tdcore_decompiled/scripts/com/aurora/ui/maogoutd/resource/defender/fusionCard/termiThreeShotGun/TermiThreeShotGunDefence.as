package com.aurora.ui.maogoutd.resource.defender.fusionCard.termiThreeShotGun
{
   public class TermiThreeShotGunDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 325;
      
      public function TermiThreeShotGunDefence()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
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
               iStarDegreeEffect = 1;
               break;
            case 1:
               iStarDegreeEffect = 1.2;
               break;
            case 2:
               iStarDegreeEffect = 1.4;
               break;
            case 3:
               iStarDegreeEffect = 1.6;
               break;
            case 4:
               iStarDegreeEffect = 1.8;
               break;
            case 5:
               iStarDegreeEffect = 2;
               break;
            case 6:
               iStarDegreeEffect = 2.2;
               break;
            case 7:
               iStarDegreeEffect = 2.6;
               break;
            case 8:
               iStarDegreeEffect = 3.2;
               break;
            case 9:
               iStarDegreeEffect = 4;
               break;
            case 10:
               iStarDegreeEffect = 5.5;
               break;
            case 11:
               iStarDegreeEffect = 7;
               break;
            case 12:
               iStarDegreeEffect = 8.5;
               break;
            case 13:
               iStarDegreeEffect = 10;
               break;
            case 14:
               iStarDegreeEffect = 11.5;
               break;
            case 15:
               iStarDegreeEffect = 13;
               break;
            case 16:
               iStarDegreeEffect = 14.5;
         }
         return 10 * iStarDegreeEffect;
      }
      
      internal static function GetCardPrimaryValueByGradeDegree(iGradeDegree:int) : int
      {
         var iGradeDegreeValue:Number = 0;
         switch(iGradeDegree)
         {
            case 1:
               iGradeDegreeValue = 1.3;
               break;
            case 2:
               iGradeDegreeValue = 1.6;
               break;
            case 3:
               iGradeDegreeValue = 1.9;
               break;
            case 4:
               iGradeDegreeValue = 2.2;
               break;
            case 5:
               iGradeDegreeValue = 2.5;
               break;
            case 6:
               iGradeDegreeValue = 2.8;
               break;
            case 7:
               iGradeDegreeValue = 3.1;
               break;
            case 8:
               iGradeDegreeValue = 3.4;
               break;
            case 9:
               iGradeDegreeValue = 4.2;
               break;
            case 10:
               iGradeDegreeValue = 5;
               break;
            case 11:
               iGradeDegreeValue = 7;
               break;
            case 12:
               iGradeDegreeValue = 9;
               break;
            case 13:
               iGradeDegreeValue = 11;
               break;
            case 14:
               iGradeDegreeValue = 13.5;
               break;
            case 15:
               iGradeDegreeValue = 16;
               break;
            case 16:
               iGradeDegreeValue = 19;
         }
         return iGradeDegreeValue * 10;
      }
      
      internal static function GetCardDeepValueByGradeDegree(iGradeDegree:int) : int
      {
         var iGradeDegreeValue:Number = 0;
         switch(iGradeDegree)
         {
            case 1:
               iGradeDegreeValue = 0.5;
               break;
            case 2:
               iGradeDegreeValue = 0.6;
               break;
            case 3:
               iGradeDegreeValue = 0.7;
               break;
            case 4:
               iGradeDegreeValue = 0.8;
               break;
            case 5:
               iGradeDegreeValue = 0.9;
               break;
            case 6:
               iGradeDegreeValue = 1;
               break;
            case 7:
               iGradeDegreeValue = 1.1;
               break;
            case 8:
               iGradeDegreeValue = 1.3;
               break;
            case 9:
               iGradeDegreeValue = 1.6;
               break;
            case 10:
               iGradeDegreeValue = 2;
               break;
            case 11:
               iGradeDegreeValue = 2.75;
               break;
            case 12:
               iGradeDegreeValue = 3.5;
               break;
            case 13:
               iGradeDegreeValue = 4.25;
               break;
            case 14:
               iGradeDegreeValue = 5.75;
               break;
            case 15:
               iGradeDegreeValue = 6.5;
               break;
            case 16:
               iGradeDegreeValue = 7.25;
         }
         return iGradeDegreeValue * 10;
      }
      
      internal static function GetCardSoulValueByGradeDegree(iGradeDegree:int) : int
      {
         var iGradeDegreeValue:Number = 0;
         switch(iGradeDegree)
         {
            case 1:
               iGradeDegreeValue = 2;
               break;
            case 2:
               iGradeDegreeValue = 2;
               break;
            case 3:
               iGradeDegreeValue = 2;
               break;
            case 4:
               iGradeDegreeValue = 2;
               break;
            case 5:
               iGradeDegreeValue = 2;
               break;
            case 6:
               iGradeDegreeValue = 2;
               break;
            case 7:
               iGradeDegreeValue = 2;
               break;
            case 8:
               iGradeDegreeValue = 2;
               break;
            case 9:
               iGradeDegreeValue = 2;
               break;
            case 10:
               iGradeDegreeValue = 3;
               break;
            case 11:
               iGradeDegreeValue = 4;
               break;
            case 12:
               iGradeDegreeValue = 5;
               break;
            case 13:
               iGradeDegreeValue = 6;
               break;
            case 14:
               iGradeDegreeValue = 8;
               break;
            case 15:
               iGradeDegreeValue = 10;
               break;
            case 16:
               iGradeDegreeValue = 15;
         }
         return iGradeDegreeValue;
      }
   }
}

