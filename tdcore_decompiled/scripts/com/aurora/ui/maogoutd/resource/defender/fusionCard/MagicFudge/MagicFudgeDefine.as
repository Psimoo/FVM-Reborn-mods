package com.aurora.ui.maogoutd.resource.defender.fusionCard.MagicFudge
{
   public class MagicFudgeDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const DEFENSE_PRICE:int = 25;
      
      internal static const FIRSTTRANS_ADDITION:Number = 0.1;
      
      public function MagicFudgeDefine()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return a_3966(iSkillDegree);
      }
      
      internal static function GetWaterCardStarDegreeEffectValue(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
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
               iStarDegreeEffect = 13;
               break;
            case 8:
               iStarDegreeEffect = 15;
               break;
            case 9:
               iStarDegreeEffect = 17;
               break;
            case 10:
               iStarDegreeEffect = 21;
               break;
            case 11:
               iStarDegreeEffect = 25;
               break;
            case 12:
               iStarDegreeEffect = 29;
               break;
            case 13:
               iStarDegreeEffect = 33;
               break;
            case 14:
               iStarDegreeEffect = 37;
               break;
            case 15:
               iStarDegreeEffect = 41;
               break;
            case 16:
               iStarDegreeEffect = 45;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function GetLandCardStarDegreeEffectValue(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 360;
               break;
            case 1:
               iStarDegreeEffect = 380;
               break;
            case 2:
               iStarDegreeEffect = 400;
               break;
            case 3:
               iStarDegreeEffect = 420;
               break;
            case 4:
               iStarDegreeEffect = 450;
               break;
            case 5:
               iStarDegreeEffect = 480;
               break;
            case 6:
               iStarDegreeEffect = 510;
               break;
            case 7:
               iStarDegreeEffect = 570;
               break;
            case 8:
               iStarDegreeEffect = 630;
               break;
            case 9:
               iStarDegreeEffect = 690;
               break;
            case 10:
               iStarDegreeEffect = 770;
               break;
            case 11:
               iStarDegreeEffect = 850;
               break;
            case 12:
               iStarDegreeEffect = 930;
               break;
            case 13:
               iStarDegreeEffect = 1010;
               break;
            case 14:
               iStarDegreeEffect = 1090;
               break;
            case 15:
               iStarDegreeEffect = 1170;
               break;
            case 16:
               iStarDegreeEffect = 1250;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 7;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 7;
               break;
            case 1:
               iSkillDegreeEffect = 6.5;
               break;
            case 2:
               iSkillDegreeEffect = 6;
               break;
            case 3:
               iSkillDegreeEffect = 5.5;
               break;
            case 4:
               iSkillDegreeEffect = 5;
               break;
            case 5:
               iSkillDegreeEffect = 4.5;
               break;
            case 6:
               iSkillDegreeEffect = 4;
               break;
            case 7:
               iSkillDegreeEffect = 3.5;
               break;
            case 8:
               iSkillDegreeEffect = 3;
         }
         return iSkillDegreeEffect * 10;
      }
      
      internal static function GetCardPrimaryValueByGradeDegree(iGradeDegree:int) : int
      {
         var iGradeDegreeValue:int = 0;
         switch(iGradeDegree)
         {
            case 1:
               iGradeDegreeValue = 16;
               break;
            case 2:
               iGradeDegreeValue = 17;
               break;
            case 3:
               iGradeDegreeValue = 18;
               break;
            case 4:
               iGradeDegreeValue = 19;
               break;
            case 5:
               iGradeDegreeValue = 20;
               break;
            case 6:
               iGradeDegreeValue = 21;
               break;
            case 7:
               iGradeDegreeValue = 22;
               break;
            case 8:
               iGradeDegreeValue = 23;
               break;
            case 9:
               iGradeDegreeValue = 25;
               break;
            case 10:
               iGradeDegreeValue = 27;
               break;
            case 11:
               iGradeDegreeValue = 29;
               break;
            case 12:
               iGradeDegreeValue = 31;
               break;
            case 13:
               iGradeDegreeValue = 34;
               break;
            case 14:
               iGradeDegreeValue = 37;
               break;
            case 15:
               iGradeDegreeValue = 40;
               break;
            case 16:
               iGradeDegreeValue = 45;
         }
         return iGradeDegreeValue * 10;
      }
      
      internal static function GetCardWaterDeepValueByGradeDegree(iGradeDegree:int) : int
      {
         var iGradeDegreeValue:Number = 0;
         switch(iGradeDegree)
         {
            case 1:
               iGradeDegreeValue = 5;
               break;
            case 2:
               iGradeDegreeValue = 8;
               break;
            case 3:
               iGradeDegreeValue = 11;
               break;
            case 4:
               iGradeDegreeValue = 14;
               break;
            case 5:
               iGradeDegreeValue = 17;
               break;
            case 6:
               iGradeDegreeValue = 20;
               break;
            case 7:
               iGradeDegreeValue = 23;
               break;
            case 8:
               iGradeDegreeValue = 26;
               break;
            case 9:
               iGradeDegreeValue = 31;
               break;
            case 10:
               iGradeDegreeValue = 36;
               break;
            case 11:
               iGradeDegreeValue = 41;
               break;
            case 12:
               iGradeDegreeValue = 51;
               break;
            case 13:
               iGradeDegreeValue = 62;
               break;
            case 14:
               iGradeDegreeValue = 75;
               break;
            case 15:
               iGradeDegreeValue = 90;
               break;
            case 16:
               iGradeDegreeValue = 110;
         }
         return 10 * iGradeDegreeValue;
      }
      
      internal static function GetCardLandDeepValueByGradeDegree(iGradeDegree:int) : int
      {
         var iGradeDegreeValue:int = 0;
         switch(iGradeDegree)
         {
            case 1:
               iGradeDegreeValue = 3040;
               break;
            case 2:
               iGradeDegreeValue = 3200;
               break;
            case 3:
               iGradeDegreeValue = 3360;
               break;
            case 4:
               iGradeDegreeValue = 3600;
               break;
            case 5:
               iGradeDegreeValue = 3840;
               break;
            case 6:
               iGradeDegreeValue = 4080;
               break;
            case 7:
               iGradeDegreeValue = 4560;
               break;
            case 8:
               iGradeDegreeValue = 5040;
               break;
            case 9:
               iGradeDegreeValue = 5520;
               break;
            case 10:
               iGradeDegreeValue = 6160;
               break;
            case 11:
               iGradeDegreeValue = 6800;
               break;
            case 12:
               iGradeDegreeValue = 7440;
               break;
            case 13:
               iGradeDegreeValue = 8080;
               break;
            case 14:
               iGradeDegreeValue = 8720;
               break;
            case 15:
               iGradeDegreeValue = 9360;
               break;
            case 16:
               iGradeDegreeValue = 10000;
         }
         return 10 * iGradeDegreeValue;
      }
      
      internal static function GetCardWaterSoulValueByGradeDegree(iGradeDegree:int) : int
      {
         var iGradeDegreeValue:Number = 0;
         switch(iGradeDegree)
         {
            case 1:
               iGradeDegreeValue = 5;
               break;
            case 2:
               iGradeDegreeValue = 8;
               break;
            case 3:
               iGradeDegreeValue = 11;
               break;
            case 4:
               iGradeDegreeValue = 14;
               break;
            case 5:
               iGradeDegreeValue = 17;
               break;
            case 6:
               iGradeDegreeValue = 20;
               break;
            case 7:
               iGradeDegreeValue = 23;
               break;
            case 8:
               iGradeDegreeValue = 26;
               break;
            case 9:
               iGradeDegreeValue = 31;
               break;
            case 10:
               iGradeDegreeValue = 36;
               break;
            case 11:
               iGradeDegreeValue = 41;
               break;
            case 12:
               iGradeDegreeValue = 51;
               break;
            case 13:
               iGradeDegreeValue = 62;
               break;
            case 14:
               iGradeDegreeValue = 75;
               break;
            case 15:
               iGradeDegreeValue = 90;
               break;
            case 16:
               iGradeDegreeValue = 110;
         }
         return 10 * iGradeDegreeValue;
      }
      
      internal static function GetCardLandSoulValueByGradeDegree(iGradeDegree:int) : int
      {
         var iGradeDegreeValue:Number = 0;
         switch(iGradeDegree)
         {
            case 1:
               iGradeDegreeValue = 760;
               break;
            case 2:
               iGradeDegreeValue = 800;
               break;
            case 3:
               iGradeDegreeValue = 840;
               break;
            case 4:
               iGradeDegreeValue = 900;
               break;
            case 5:
               iGradeDegreeValue = 960;
               break;
            case 6:
               iGradeDegreeValue = 1020;
               break;
            case 7:
               iGradeDegreeValue = 1140;
               break;
            case 8:
               iGradeDegreeValue = 1260;
               break;
            case 9:
               iGradeDegreeValue = 1380;
               break;
            case 10:
               iGradeDegreeValue = 1540;
               break;
            case 11:
               iGradeDegreeValue = 1700;
               break;
            case 12:
               iGradeDegreeValue = 1860;
               break;
            case 13:
               iGradeDegreeValue = 2020;
               break;
            case 14:
               iGradeDegreeValue = 2180;
               break;
            case 15:
               iGradeDegreeValue = 2340;
               break;
            case 16:
               iGradeDegreeValue = 2500;
         }
         return 10 * iGradeDegreeValue;
      }
   }
}

