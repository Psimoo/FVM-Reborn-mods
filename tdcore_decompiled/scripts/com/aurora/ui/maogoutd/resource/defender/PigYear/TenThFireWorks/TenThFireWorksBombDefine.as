package com.aurora.ui.maogoutd.resource.defender.PigYear.TenThFireWorks
{
   public class TenThFireWorksBombDefine
   {
      
      internal static const DEFENSE_PRICE:int = 180;
      
      internal static const FIRSTTRANS_DEFENSE_PRICE:int = 175;
      
      internal static const SECONDTRANS_DEFENSE_PRICE:int = 225;
      
      internal static const MAX_LIFE_VALUE:int = 20000;
      
      public function TenThFireWorksBombDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 60;
               break;
            case 1:
               iStarDegreeEffect = 59;
               break;
            case 2:
               iStarDegreeEffect = 58;
               break;
            case 3:
               iStarDegreeEffect = 57;
               break;
            case 4:
               iStarDegreeEffect = 55;
               break;
            case 5:
               iStarDegreeEffect = 53;
               break;
            case 6:
               iStarDegreeEffect = 51;
               break;
            case 7:
               iStarDegreeEffect = 48;
               break;
            case 8:
               iStarDegreeEffect = 45;
               break;
            case 9:
               iStarDegreeEffect = 42;
               break;
            case 10:
               iStarDegreeEffect = 39;
               break;
            case 11:
               iStarDegreeEffect = 36;
               break;
            case 12:
               iStarDegreeEffect = 33;
               break;
            case 13:
               iStarDegreeEffect = 30;
               break;
            case 14:
               iStarDegreeEffect = 27;
               break;
            case 15:
               iStarDegreeEffect = 24;
               break;
            case 16:
               iStarDegreeEffect = 21;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         if(iStarDegree <= 6)
         {
            iStarDegreeEffect = 2 * iStarDegree;
         }
         else if(iStarDegree > 6 && iStarDegree <= 9)
         {
            iStarDegreeEffect = 2 * 6 + 3 * (iStarDegree - 6);
         }
         else if(iStarDegree > 9 && iStarDegree <= 15)
         {
            iStarDegreeEffect = 2 * 6 + 3 * 3 + 3 * (iStarDegree - 9);
         }
         else if(iStarDegree > 15)
         {
            iStarDegreeEffect = 43;
         }
         return 10 * iStarDegreeEffect;
      }
   }
}

