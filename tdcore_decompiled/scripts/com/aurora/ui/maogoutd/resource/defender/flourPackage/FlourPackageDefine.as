package com.aurora.ui.maogoutd.resource.defender.flourPackage
{
   public class FlourPackageDefine
   {
      
      internal static const DEFENSE_PRICE:int = 50;
      
      internal static const FIRSTTRANS_DEFENSE_PRICE:int = 75;
      
      internal static const SECONDTRANS_DEFENSE_PRICE:int = 100;
      
      internal static const MAX_LIFE_VALUE:int = 20000;
      
      public function FlourPackageDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return 300 - a_3965(iStarDegree);
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
            iStarDegreeEffect = 1 * 3 + 1 * (iStarDegree - 3);
         }
         else if(iStarDegree > 6 && iStarDegree <= 9)
         {
            iStarDegreeEffect = 1 * 3 + 1 * 3 + 2 * (iStarDegree - 6);
         }
         else if(iStarDegree > 9 && iStarDegree <= 14)
         {
            iStarDegreeEffect = 1 * 3 + 1 * 3 + 2 * 3 + 2 * (iStarDegree - 9);
         }
         else if(iStarDegree == 15)
         {
            iStarDegreeEffect = 1 * 3 + 1 * 3 + 2 * 3 + 2 * 5 - 1 * (iStarDegree - 14);
         }
         else if(iStarDegree == 16)
         {
            iStarDegreeEffect = 23;
         }
         return 10 * iStarDegreeEffect;
      }
   }
}

