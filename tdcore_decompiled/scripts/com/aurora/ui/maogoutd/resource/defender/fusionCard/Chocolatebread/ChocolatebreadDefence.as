package com.aurora.ui.maogoutd.resource.defender.fusionCard.Chocolatebread
{
   public class ChocolatebreadDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 150;
      
      public function ChocolatebreadDefence()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return a_3966(iSkillDegree);
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 50;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 50;
               break;
            case 1:
               iSkillDegreeEffect = 48;
               break;
            case 2:
               iSkillDegreeEffect = 45;
               break;
            case 3:
               iSkillDegreeEffect = 42;
               break;
            case 4:
               iSkillDegreeEffect = 38;
               break;
            case 5:
               iSkillDegreeEffect = 34;
               break;
            case 6:
               iSkillDegreeEffect = 30;
               break;
            case 7:
               iSkillDegreeEffect = 25;
               break;
            case 8:
               iSkillDegreeEffect = 20;
         }
         return iSkillDegreeEffect * 10;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 4.5;
               break;
            case 1:
               iStarDegreeEffect = 5.4;
               break;
            case 2:
               iStarDegreeEffect = 6.3;
               break;
            case 3:
               iStarDegreeEffect = 7.2;
               break;
            case 4:
               iStarDegreeEffect = 9;
               break;
            case 5:
               iStarDegreeEffect = 10.8;
               break;
            case 6:
               iStarDegreeEffect = 12.6;
               break;
            case 7:
               iStarDegreeEffect = 15.3;
               break;
            case 8:
               iStarDegreeEffect = 18;
               break;
            case 9:
               iStarDegreeEffect = 20.7;
               break;
            case 10:
               iStarDegreeEffect = 25.2;
               break;
            case 11:
               iStarDegreeEffect = 32.4;
               break;
            case 12:
               iStarDegreeEffect = 40.5;
               break;
            case 13:
               iStarDegreeEffect = 49.5;
               break;
            case 14:
               iStarDegreeEffect = 59.4;
               break;
            case 15:
               iStarDegreeEffect = 70.2;
               break;
            case 16:
               iStarDegreeEffect = 81;
         }
         return 10 * iStarDegreeEffect;
      }
      
      internal static function GetCardPrimaryValueByGradeDegree(iGradeDegree:int) : int
      {
         var iGradeDegreeValue:Number = 0;
         switch(iGradeDegree)
         {
            case 1:
               iGradeDegreeValue = 10;
               break;
            case 2:
               iGradeDegreeValue = 12;
               break;
            case 3:
               iGradeDegreeValue = 14;
               break;
            case 4:
               iGradeDegreeValue = 16;
               break;
            case 5:
               iGradeDegreeValue = 18;
               break;
            case 6:
               iGradeDegreeValue = 20;
               break;
            case 7:
               iGradeDegreeValue = 22;
               break;
            case 8:
               iGradeDegreeValue = 24;
               break;
            case 9:
               iGradeDegreeValue = 26;
               break;
            case 10:
               iGradeDegreeValue = 28;
               break;
            case 11:
               iGradeDegreeValue = 30;
               break;
            case 12:
               iGradeDegreeValue = 35;
               break;
            case 13:
               iGradeDegreeValue = 40;
               break;
            case 14:
               iGradeDegreeValue = 45;
               break;
            case 15:
               iGradeDegreeValue = 50;
               break;
            case 16:
               iGradeDegreeValue = 55;
         }
         return iGradeDegreeValue;
      }
      
      internal static function GetCardDeepValueByGradeDegree(iGradeDegree:int) : int
      {
         var iGradeDegreeValue:Number = 0;
         switch(iGradeDegree)
         {
            case 1:
               iGradeDegreeValue = 6;
               break;
            case 2:
               iGradeDegreeValue = 7;
               break;
            case 3:
               iGradeDegreeValue = 8;
               break;
            case 4:
               iGradeDegreeValue = 10;
               break;
            case 5:
               iGradeDegreeValue = 12;
               break;
            case 6:
               iGradeDegreeValue = 14;
               break;
            case 7:
               iGradeDegreeValue = 17;
               break;
            case 8:
               iGradeDegreeValue = 20;
               break;
            case 9:
               iGradeDegreeValue = 23;
               break;
            case 10:
               iGradeDegreeValue = 27;
               break;
            case 11:
               iGradeDegreeValue = 31;
               break;
            case 12:
               iGradeDegreeValue = 35;
               break;
            case 13:
               iGradeDegreeValue = 39;
               break;
            case 14:
               iGradeDegreeValue = 43;
               break;
            case 15:
               iGradeDegreeValue = 47;
               break;
            case 16:
               iGradeDegreeValue = 51;
         }
         return 10 * iGradeDegreeValue;
      }
      
      internal static function GetCardSoulValueByGradeDegree(iGradeDegree:int) : int
      {
         var iGradeDegreeValue:Number = 0;
         switch(iGradeDegree)
         {
            case 1:
               iGradeDegreeValue = 1.2;
               break;
            case 2:
               iGradeDegreeValue = 1.4;
               break;
            case 3:
               iGradeDegreeValue = 1.6;
               break;
            case 4:
               iGradeDegreeValue = 1.8;
               break;
            case 5:
               iGradeDegreeValue = 2;
               break;
            case 6:
               iGradeDegreeValue = 2.2;
               break;
            case 7:
               iGradeDegreeValue = 2.6;
               break;
            case 8:
               iGradeDegreeValue = 3.2;
               break;
            case 9:
               iGradeDegreeValue = 4;
               break;
            case 10:
               iGradeDegreeValue = 5.5;
               break;
            case 11:
               iGradeDegreeValue = 7;
               break;
            case 12:
               iGradeDegreeValue = 8.5;
               break;
            case 13:
               iGradeDegreeValue = 10;
               break;
            case 14:
               iGradeDegreeValue = 11.5;
               break;
            case 15:
               iGradeDegreeValue = 13;
               break;
            case 16:
               iGradeDegreeValue = 14.5;
         }
         return 10 * iGradeDegreeValue;
      }
   }
}

