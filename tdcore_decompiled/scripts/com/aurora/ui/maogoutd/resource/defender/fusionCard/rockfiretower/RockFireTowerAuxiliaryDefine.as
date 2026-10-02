package com.aurora.ui.maogoutd.resource.defender.fusionCard.rockfiretower
{
   public class RockFireTowerAuxiliaryDefine
   {
      
      internal static const DEFENSE_PRICE:int = 175;
      
      internal static const REDUCE_DEFENSE_PRICE:int = 50;
      
      internal static const HURT_ADDITION:Number = 0.1;
      
      internal static const LIFE_VALUE:int = 250;
      
      public function RockFireTowerAuxiliaryDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         return 28 - iSkillDegree;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 0;
               break;
            case 1:
               iStarDegreeEffect = 0;
               break;
            case 2:
               iStarDegreeEffect = 1;
               break;
            case 3:
               iStarDegreeEffect = 1;
               break;
            case 4:
               iStarDegreeEffect = 2;
               break;
            case 5:
               iStarDegreeEffect = 2;
               break;
            case 6:
               iStarDegreeEffect = 3;
               break;
            case 7:
               iStarDegreeEffect = 3;
               break;
            case 8:
               iStarDegreeEffect = 4;
               break;
            case 9:
               iStarDegreeEffect = 5;
               break;
            case 10:
               iStarDegreeEffect = 7;
               break;
            case 11:
               iStarDegreeEffect = 9;
               break;
            case 12:
               iStarDegreeEffect = 11;
               break;
            case 13:
               iStarDegreeEffect = 13;
               break;
            case 14:
               iStarDegreeEffect = 15;
               break;
            case 15:
               iStarDegreeEffect = 17;
               break;
            case 16:
               iStarDegreeEffect = 19;
         }
         return iStarDegreeEffect;
      }
      
      internal static function GetCardPrimaryValueByGradeDegree(iGradeDegree:int) : Number
      {
         var iGradeDegreeValue:Number = 0;
         switch(iGradeDegree)
         {
            case 1:
               iGradeDegreeValue = 0.6;
               break;
            case 2:
               iGradeDegreeValue = 0.65;
               break;
            case 3:
               iGradeDegreeValue = 0.7;
               break;
            case 4:
               iGradeDegreeValue = 0.75;
               break;
            case 5:
               iGradeDegreeValue = 0.8;
               break;
            case 6:
               iGradeDegreeValue = 0.85;
               break;
            case 7:
               iGradeDegreeValue = 0.9;
               break;
            case 8:
               iGradeDegreeValue = 0.95;
               break;
            case 9:
               iGradeDegreeValue = 1;
               break;
            case 10:
               iGradeDegreeValue = 1.1;
               break;
            case 11:
               iGradeDegreeValue = 1.2;
               break;
            case 12:
               iGradeDegreeValue = 1.3;
               break;
            case 13:
               iGradeDegreeValue = 1.4;
               break;
            case 14:
               iGradeDegreeValue = 1.5;
               break;
            case 15:
               iGradeDegreeValue = 1.6;
               break;
            case 16:
               iGradeDegreeValue = 1.7;
         }
         return iGradeDegreeValue;
      }
      
      internal static function GetCardDeepShotIntervalByGradeDegree(iGradeDegree:int) : int
      {
         var iGradeDegreeValue:Number = 0;
         switch(iGradeDegree)
         {
            case 1:
               iGradeDegreeValue = 45;
               break;
            case 2:
               iGradeDegreeValue = 45;
               break;
            case 3:
               iGradeDegreeValue = 45;
               break;
            case 4:
               iGradeDegreeValue = 45;
               break;
            case 5:
               iGradeDegreeValue = 45;
               break;
            case 6:
               iGradeDegreeValue = 45;
               break;
            case 7:
               iGradeDegreeValue = 45;
               break;
            case 8:
               iGradeDegreeValue = 45;
               break;
            case 9:
               iGradeDegreeValue = 45;
               break;
            case 10:
               iGradeDegreeValue = 42;
               break;
            case 11:
               iGradeDegreeValue = 39;
               break;
            case 12:
               iGradeDegreeValue = 36;
               break;
            case 13:
               iGradeDegreeValue = 33;
               break;
            case 14:
               iGradeDegreeValue = 30;
               break;
            case 15:
               iGradeDegreeValue = 25;
               break;
            case 16:
               iGradeDegreeValue = 18;
         }
         return 20 * iGradeDegreeValue;
      }
      
      internal static function GetCardDeepOnceValueByGradeDegree(iGradeDegree:int) : int
      {
         var iGradeDegreeValue:Number = 0;
         switch(iGradeDegree)
         {
            case 1:
               iGradeDegreeValue = 4.8;
               break;
            case 2:
               iGradeDegreeValue = 5.6;
               break;
            case 3:
               iGradeDegreeValue = 6.4;
               break;
            case 4:
               iGradeDegreeValue = 8;
               break;
            case 5:
               iGradeDegreeValue = 9.6;
               break;
            case 6:
               iGradeDegreeValue = 11.2;
               break;
            case 7:
               iGradeDegreeValue = 13.6;
               break;
            case 8:
               iGradeDegreeValue = 16;
               break;
            case 9:
               iGradeDegreeValue = 18.4;
               break;
            case 10:
               iGradeDegreeValue = 21.6;
               break;
            case 11:
               iGradeDegreeValue = 24.8;
               break;
            case 12:
               iGradeDegreeValue = 28;
               break;
            case 13:
               iGradeDegreeValue = 31.2;
               break;
            case 14:
               iGradeDegreeValue = 34.4;
               break;
            case 15:
               iGradeDegreeValue = 37.6;
               break;
            case 16:
               iGradeDegreeValue = 40.8;
         }
         return 10 * iGradeDegreeValue;
      }
      
      internal static function GetCardSoulValueByGradeDegree(iGradeDegree:int) : Number
      {
         var iGradeDegreeValue:Number = 0;
         switch(iGradeDegree)
         {
            case 1:
               iGradeDegreeValue = 0.6;
               break;
            case 2:
               iGradeDegreeValue = 0.65;
               break;
            case 3:
               iGradeDegreeValue = 0.7;
               break;
            case 4:
               iGradeDegreeValue = 0.75;
               break;
            case 5:
               iGradeDegreeValue = 0.8;
               break;
            case 6:
               iGradeDegreeValue = 0.85;
               break;
            case 7:
               iGradeDegreeValue = 0.9;
               break;
            case 8:
               iGradeDegreeValue = 0.95;
               break;
            case 9:
               iGradeDegreeValue = 1;
               break;
            case 10:
               iGradeDegreeValue = 1.1;
               break;
            case 11:
               iGradeDegreeValue = 1.2;
               break;
            case 12:
               iGradeDegreeValue = 1.3;
               break;
            case 13:
               iGradeDegreeValue = 1.4;
               break;
            case 14:
               iGradeDegreeValue = 1.5;
               break;
            case 15:
               iGradeDegreeValue = 1.6;
               break;
            case 16:
               iGradeDegreeValue = 1.7;
         }
         return iGradeDegreeValue;
      }
   }
}

