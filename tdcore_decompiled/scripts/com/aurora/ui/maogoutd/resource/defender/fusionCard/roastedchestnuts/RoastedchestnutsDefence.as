package com.aurora.ui.maogoutd.resource.defender.fusionCard.roastedchestnuts
{
   public class RoastedchestnutsDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 14;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 160;
      
      public function RoastedchestnutsDefence()
      {
         super();
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
      
      internal static function GetCardPrimaryValueByGradeDegree(iGradeDegree:int) : Number
      {
         var iGradeDegreeValue:Number = 0;
         switch(iGradeDegree)
         {
            case 1:
               iGradeDegreeValue = 2.2;
               break;
            case 2:
               iGradeDegreeValue = 2.7;
               break;
            case 3:
               iGradeDegreeValue = 3.2;
               break;
            case 4:
               iGradeDegreeValue = 4;
               break;
            case 5:
               iGradeDegreeValue = 4.8;
               break;
            case 6:
               iGradeDegreeValue = 5.6;
               break;
            case 7:
               iGradeDegreeValue = 6.6;
               break;
            case 8:
               iGradeDegreeValue = 7.6;
               break;
            case 9:
               iGradeDegreeValue = 8.6;
               break;
            case 10:
               iGradeDegreeValue = 10;
               break;
            case 11:
               iGradeDegreeValue = 12;
               break;
            case 12:
               iGradeDegreeValue = 14;
               break;
            case 13:
               iGradeDegreeValue = 16;
               break;
            case 14:
               iGradeDegreeValue = 18;
               break;
            case 15:
               iGradeDegreeValue = 20;
               break;
            case 16:
               iGradeDegreeValue = 22;
         }
         return iGradeDegreeValue;
      }
      
      internal static function GetCardDeepValueByGradeDegree(iGradeDegree:int) : int
      {
         var iGradeDegreeValue:Number = 0;
         switch(iGradeDegree)
         {
            case 1:
               iGradeDegreeValue = 900;
               break;
            case 2:
               iGradeDegreeValue = 900;
               break;
            case 3:
               iGradeDegreeValue = 900;
               break;
            case 4:
               iGradeDegreeValue = 900;
               break;
            case 5:
               iGradeDegreeValue = 900;
               break;
            case 6:
               iGradeDegreeValue = 900;
               break;
            case 7:
               iGradeDegreeValue = 900;
               break;
            case 8:
               iGradeDegreeValue = 900;
               break;
            case 9:
               iGradeDegreeValue = 900;
               break;
            case 10:
               iGradeDegreeValue = 920;
               break;
            case 11:
               iGradeDegreeValue = 930;
               break;
            case 12:
               iGradeDegreeValue = 950;
               break;
            case 13:
               iGradeDegreeValue = 970;
               break;
            case 14:
               iGradeDegreeValue = 1000;
               break;
            case 15:
               iGradeDegreeValue = 1100;
               break;
            case 16:
               iGradeDegreeValue = 1200;
         }
         return iGradeDegreeValue;
      }
      
      internal static function GetCardSoulValueByGradeDegree(iGradeDegree:int) : int
      {
         var iGradeDegreeValue:Number = 0;
         switch(iGradeDegree)
         {
            case 1:
               iGradeDegreeValue = 2.7;
               break;
            case 2:
               iGradeDegreeValue = 3.2;
               break;
            case 3:
               iGradeDegreeValue = 4;
               break;
            case 4:
               iGradeDegreeValue = 4.8;
               break;
            case 5:
               iGradeDegreeValue = 5.6;
               break;
            case 6:
               iGradeDegreeValue = 6.6;
               break;
            case 7:
               iGradeDegreeValue = 7.6;
               break;
            case 8:
               iGradeDegreeValue = 8.6;
               break;
            case 9:
               iGradeDegreeValue = 10;
               break;
            case 10:
               iGradeDegreeValue = 12;
               break;
            case 11:
               iGradeDegreeValue = 14;
               break;
            case 12:
               iGradeDegreeValue = 16;
               break;
            case 13:
               iGradeDegreeValue = 18;
               break;
            case 14:
               iGradeDegreeValue = 20;
               break;
            case 15:
               iGradeDegreeValue = 22;
               break;
            case 16:
               iGradeDegreeValue = 25;
         }
         return iGradeDegreeValue;
      }
      
      internal static function GetBoomIntervalByGradeDegree(iGradeDegree:int) : int
      {
         var iGradeDegreeValue:Number = 0;
         switch(iGradeDegree)
         {
            case 1:
               iGradeDegreeValue = 6;
               break;
            case 2:
               iGradeDegreeValue = 6;
               break;
            case 3:
               iGradeDegreeValue = 6;
               break;
            case 4:
               iGradeDegreeValue = 6;
               break;
            case 5:
               iGradeDegreeValue = 6;
               break;
            case 6:
               iGradeDegreeValue = 6;
               break;
            case 7:
               iGradeDegreeValue = 6;
               break;
            case 8:
               iGradeDegreeValue = 6;
               break;
            case 9:
               iGradeDegreeValue = 6;
               break;
            case 10:
               iGradeDegreeValue = 6;
               break;
            case 11:
               iGradeDegreeValue = 5;
               break;
            case 12:
               iGradeDegreeValue = 5;
               break;
            case 13:
               iGradeDegreeValue = 5;
               break;
            case 14:
               iGradeDegreeValue = 4;
               break;
            case 15:
               iGradeDegreeValue = 3;
               break;
            case 16:
               iGradeDegreeValue = 2;
         }
         return iGradeDegreeValue + 1;
      }
   }
}

