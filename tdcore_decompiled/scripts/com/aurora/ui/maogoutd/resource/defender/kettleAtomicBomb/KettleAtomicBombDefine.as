package com.aurora.ui.maogoutd.resource.defender.kettleAtomicBomb
{
   public class KettleAtomicBombDefine
   {
      
      internal static const DEFENSE_PRICE:int = 275;
      
      internal static const FIRSTTRANS_DEFENSE_PRICE:int = 300;
      
      internal static const SECONDTRANS_DEFENSE_PRICE:int = 350;
      
      internal static const MAX_LIFE_VALUE:int = 2500;
      
      public function KettleAtomicBombDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return 500 - a_3965(iStarDegree);
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

