package com.aurora.ui.maogoutd.resource.defender.PigYear.FryMeow
{
   public class FryMeowBoomDefine
   {
      
      internal static const DEFENSE_PRICE:int = 175;
      
      internal static const FIRSTTRANS_DEFENSE_PRICE:int = 150;
      
      internal static const SECONDTRANS_DEFENSE_PRICE:int = 200;
      
      internal static const MAX_LIFE_VALUE:int = 20000;
      
      public function FryMeowBoomDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return 600 - a_3965(iStarDegree);
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         if(iStarDegree <= 8)
         {
            iStarDegreeEffect = 1 * iStarDegree;
         }
         else if(iStarDegree > 8 && iStarDegree <= 11)
         {
            iStarDegreeEffect = 1 * 8 + 2 * (iStarDegree - 8);
         }
         else if(iStarDegree > 11 && iStarDegree <= 15)
         {
            iStarDegreeEffect = 1 * 8 + 2 * 3 + 3 * (iStarDegree - 11);
         }
         else if(iStarDegree > 15)
         {
            iStarDegreeEffect = 30;
         }
         return 10 * iStarDegreeEffect;
      }
   }
}

