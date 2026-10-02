package com.aurora.ui.maogoutd.resource.defender.PigYear.EnergyMeow
{
   public class EnergyMeowAuxiliaryDefine
   {
      
      internal static const DEFENSE_PRICE:int = 225;
      
      internal static const REDUCE_DEFENSE_PRICE:int = 50;
      
      internal static const HURT_ADDITION:Number = 0.15;
      
      internal static const FIRSTTRANS_LIFEADD:int = 24;
      
      internal static const LIFE_VALUE:int = 60;
      
      public function EnergyMeowAuxiliaryDefine()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int) : int
      {
         return 7 * 10;
      }
      
      internal static function GetlifeValueByStarDegree(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 6;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 6;
               break;
            case 1:
               iStarDegreeEffect = 11;
               break;
            case 2:
               iStarDegreeEffect = 16;
               break;
            case 3:
               iStarDegreeEffect = 21;
               break;
            case 4:
               iStarDegreeEffect = 26;
               break;
            case 5:
               iStarDegreeEffect = 31;
               break;
            case 6:
               iStarDegreeEffect = 36;
               break;
            case 7:
               iStarDegreeEffect = 41;
               break;
            case 8:
               iStarDegreeEffect = 46;
               break;
            case 9:
               iStarDegreeEffect = 51;
               break;
            case 10:
               iStarDegreeEffect = 56;
               break;
            case 11:
               iStarDegreeEffect = 61;
               break;
            case 12:
               iStarDegreeEffect = 66;
               break;
            case 13:
               iStarDegreeEffect = 71;
               break;
            case 14:
               iStarDegreeEffect = 76;
               break;
            case 15:
               iStarDegreeEffect = 81;
               break;
            case 16:
               iStarDegreeEffect = 86;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function a_3965(iStarDegree:int) : Number
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 0;
               break;
            case 1:
               iStarDegreeEffect = 1;
               break;
            case 2:
               iStarDegreeEffect = 2;
               break;
            case 3:
               iStarDegreeEffect = 3;
               break;
            case 4:
               iStarDegreeEffect = 4;
               break;
            case 5:
               iStarDegreeEffect = 5;
               break;
            case 6:
               iStarDegreeEffect = 6;
               break;
            case 7:
               iStarDegreeEffect = 7;
               break;
            case 8:
               iStarDegreeEffect = 8;
               break;
            case 9:
               iStarDegreeEffect = 9;
               break;
            case 10:
               iStarDegreeEffect = 10;
               break;
            case 11:
               iStarDegreeEffect = 11;
               break;
            case 12:
               iStarDegreeEffect = 13;
               break;
            case 13:
               iStarDegreeEffect = 15;
               break;
            case 14:
               iStarDegreeEffect = 17;
               break;
            case 15:
               iStarDegreeEffect = 19;
               break;
            case 16:
               iStarDegreeEffect = 21;
         }
         return iStarDegreeEffect;
      }
      
      internal static function GetCardStarDegreeEffectValueParabolaPath(iStarDegree:int) : Number
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 0;
               break;
            case 1:
               iStarDegreeEffect = 1;
               break;
            case 2:
               iStarDegreeEffect = 2;
               break;
            case 3:
               iStarDegreeEffect = 3;
               break;
            case 4:
               iStarDegreeEffect = 4;
               break;
            case 5:
               iStarDegreeEffect = 5;
               break;
            case 6:
               iStarDegreeEffect = 6;
               break;
            case 7:
               iStarDegreeEffect = 7;
               break;
            case 8:
               iStarDegreeEffect = 8;
               break;
            case 9:
               iStarDegreeEffect = 10;
               break;
            case 10:
               iStarDegreeEffect = 12;
               break;
            case 11:
               iStarDegreeEffect = 14;
               break;
            case 12:
               iStarDegreeEffect = 16;
               break;
            case 13:
               iStarDegreeEffect = 19;
               break;
            case 14:
               iStarDegreeEffect = 22;
               break;
            case 15:
               iStarDegreeEffect = 25;
               break;
            case 16:
               iStarDegreeEffect = 28;
         }
         return iStarDegreeEffect;
      }
      
      internal static function GetCardLifeValue(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 30;
               break;
            case 1:
               iStarDegreeEffect = 35;
               break;
            case 2:
               iStarDegreeEffect = 40;
               break;
            case 3:
               iStarDegreeEffect = 45;
               break;
            case 4:
               iStarDegreeEffect = 50;
               break;
            case 5:
               iStarDegreeEffect = 55;
               break;
            case 6:
               iStarDegreeEffect = 60;
               break;
            case 7:
               iStarDegreeEffect = 65;
               break;
            case 8:
               iStarDegreeEffect = 70;
               break;
            case 9:
               iStarDegreeEffect = 75;
               break;
            case 10:
               iStarDegreeEffect = 80;
               break;
            case 11:
               iStarDegreeEffect = 85;
               break;
            case 12:
               iStarDegreeEffect = 90;
               break;
            case 13:
               iStarDegreeEffect = 100;
               break;
            case 14:
               iStarDegreeEffect = 110;
               break;
            case 15:
               iStarDegreeEffect = 120;
               break;
            case 16:
               iStarDegreeEffect = 145;
         }
         return iStarDegreeEffect * 10;
      }
   }
}

