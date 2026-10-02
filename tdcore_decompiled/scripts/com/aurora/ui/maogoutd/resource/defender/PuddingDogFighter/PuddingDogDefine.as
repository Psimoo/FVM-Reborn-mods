package com.aurora.ui.maogoutd.resource.defender.PuddingDogFighter
{
   public class PuddingDogDefine
   {
      
      internal static const DEFENSE_PRICE:int = 100;
      
      internal static const FIRST_DEFENSE_PRICE:int = 70;
      
      internal static const SECOND_DEFENSE_PRICE:int = 70;
      
      public function PuddingDogDefine()
      {
         super();
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 7;
               break;
            case 1:
               iStarDegreeEffect = 8;
               break;
            case 2:
               iStarDegreeEffect = 9;
               break;
            case 3:
               iStarDegreeEffect = 10;
               break;
            case 4:
               iStarDegreeEffect = 11;
               break;
            case 5:
               iStarDegreeEffect = 12;
               break;
            case 6:
               iStarDegreeEffect = 13;
               break;
            case 7:
               iStarDegreeEffect = 15;
               break;
            case 8:
               iStarDegreeEffect = 17;
               break;
            case 9:
               iStarDegreeEffect = 19;
               break;
            case 10:
               iStarDegreeEffect = 22;
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
               iStarDegreeEffect = 46;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function GetAttackAddend(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 6;
               break;
            case 1:
               iStarDegreeEffect = 7;
               break;
            case 2:
               iStarDegreeEffect = 8;
               break;
            case 3:
               iStarDegreeEffect = 9;
               break;
            case 4:
               iStarDegreeEffect = 10;
               break;
            case 5:
               iStarDegreeEffect = 11;
               break;
            case 6:
               iStarDegreeEffect = 13;
               break;
            case 7:
               iStarDegreeEffect = 16;
               break;
            case 8:
               iStarDegreeEffect = 20;
               break;
            case 9:
               iStarDegreeEffect = 28;
               break;
            case 10:
               iStarDegreeEffect = 35;
               break;
            case 11:
               iStarDegreeEffect = 43;
               break;
            case 12:
               iStarDegreeEffect = 50;
               break;
            case 13:
               iStarDegreeEffect = 60;
               break;
            case 14:
               iStarDegreeEffect = 70;
               break;
            case 15:
               iStarDegreeEffect = 80;
               break;
            case 16:
               iStarDegreeEffect = 100;
         }
         return iStarDegreeEffect;
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 100;
      }
      
      internal static function GetSecondAttackAddend(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 12;
               break;
            case 1:
               iStarDegreeEffect = 14;
               break;
            case 2:
               iStarDegreeEffect = 16;
               break;
            case 3:
               iStarDegreeEffect = 18;
               break;
            case 4:
               iStarDegreeEffect = 20;
               break;
            case 5:
               iStarDegreeEffect = 22;
               break;
            case 6:
               iStarDegreeEffect = 26;
               break;
            case 7:
               iStarDegreeEffect = 32;
               break;
            case 8:
               iStarDegreeEffect = 40;
               break;
            case 9:
               iStarDegreeEffect = 55;
               break;
            case 10:
               iStarDegreeEffect = 70;
               break;
            case 11:
               iStarDegreeEffect = 85;
               break;
            case 12:
               iStarDegreeEffect = 100;
               break;
            case 13:
               iStarDegreeEffect = 120;
               break;
            case 14:
               iStarDegreeEffect = 140;
               break;
            case 15:
               iStarDegreeEffect = 160;
               break;
            case 16:
               iStarDegreeEffect = 190;
         }
         return iStarDegreeEffect;
      }
   }
}

