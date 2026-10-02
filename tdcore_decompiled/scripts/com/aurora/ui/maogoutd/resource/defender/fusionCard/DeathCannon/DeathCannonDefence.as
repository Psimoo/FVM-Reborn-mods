package com.aurora.ui.maogoutd.resource.defender.fusionCard.DeathCannon
{
   public class DeathCannonDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 300;
      
      public function DeathCannonDefence()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return 500 - a_3966(iSkillDegree);
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         return 30 * iSkillDegree;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         if(iStarDegree <= 3)
         {
            iStarDegreeEffect = 1 * iStarDegree;
         }
         else if(iStarDegree > 3 && iStarDegree <= 6)
         {
            iStarDegreeEffect = 1 * 3 + 2 * (iStarDegree - 3);
         }
         else if(iStarDegree > 6 && iStarDegree <= 9)
         {
            iStarDegreeEffect = 1 * 3 + 2 * 3 + 2 * (iStarDegree - 6);
         }
         else if(iStarDegree > 9)
         {
            iStarDegreeEffect = 1 * 3 + 2 * 3 + 2 * 3 + 2.5 * (iStarDegree - 9);
         }
         return 20 * iStarDegreeEffect;
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
               iGradeDegreeValue = 20;
               break;
            case 3:
               iGradeDegreeValue = 30;
               break;
            case 4:
               iGradeDegreeValue = 40;
               break;
            case 5:
               iGradeDegreeValue = 50;
               break;
            case 6:
               iGradeDegreeValue = 60;
               break;
            case 7:
               iGradeDegreeValue = 70;
               break;
            case 8:
               iGradeDegreeValue = 80;
               break;
            case 9:
               iGradeDegreeValue = 100;
               break;
            case 10:
               iGradeDegreeValue = 120;
               break;
            case 11:
               iGradeDegreeValue = 140;
               break;
            case 12:
               iGradeDegreeValue = 160;
               break;
            case 13:
               iGradeDegreeValue = 180;
               break;
            case 14:
               iGradeDegreeValue = 200;
               break;
            case 15:
               iGradeDegreeValue = 250;
               break;
            case 16:
               iGradeDegreeValue = 300;
         }
         return iGradeDegreeValue * 10;
      }
      
      internal static function GetCardDeepValueByGradeDegree(iGradeDegree:int) : int
      {
         var iGradeDegreeValue:Number = 0;
         switch(iGradeDegree)
         {
            case 1:
               iGradeDegreeValue = 10;
               break;
            case 2:
               iGradeDegreeValue = 20;
               break;
            case 3:
               iGradeDegreeValue = 30;
               break;
            case 4:
               iGradeDegreeValue = 40;
               break;
            case 5:
               iGradeDegreeValue = 50;
               break;
            case 6:
               iGradeDegreeValue = 60;
               break;
            case 7:
               iGradeDegreeValue = 70;
               break;
            case 8:
               iGradeDegreeValue = 80;
               break;
            case 9:
               iGradeDegreeValue = 100;
               break;
            case 10:
               iGradeDegreeValue = 120;
               break;
            case 11:
               iGradeDegreeValue = 140;
               break;
            case 12:
               iGradeDegreeValue = 160;
               break;
            case 13:
               iGradeDegreeValue = 180;
               break;
            case 14:
               iGradeDegreeValue = 200;
               break;
            case 15:
               iGradeDegreeValue = 250;
               break;
            case 16:
               iGradeDegreeValue = 300;
         }
         return iGradeDegreeValue * 10;
      }
      
      internal static function GetCardSoulValueByGradeDegree(iGradeDegree:int) : int
      {
         var iGradeDegreeValue:Number = 0;
         switch(iGradeDegree)
         {
            case 1:
               iGradeDegreeValue = 10;
               break;
            case 2:
               iGradeDegreeValue = 20;
               break;
            case 3:
               iGradeDegreeValue = 30;
               break;
            case 4:
               iGradeDegreeValue = 40;
               break;
            case 5:
               iGradeDegreeValue = 50;
               break;
            case 6:
               iGradeDegreeValue = 60;
               break;
            case 7:
               iGradeDegreeValue = 70;
               break;
            case 8:
               iGradeDegreeValue = 80;
               break;
            case 9:
               iGradeDegreeValue = 100;
               break;
            case 10:
               iGradeDegreeValue = 120;
               break;
            case 11:
               iGradeDegreeValue = 140;
               break;
            case 12:
               iGradeDegreeValue = 160;
               break;
            case 13:
               iGradeDegreeValue = 180;
               break;
            case 14:
               iGradeDegreeValue = 200;
               break;
            case 15:
               iGradeDegreeValue = 250;
               break;
            case 16:
               iGradeDegreeValue = 300;
         }
         return iGradeDegreeValue * 10;
      }
   }
}

