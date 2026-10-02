package com.aurora.ui.maogoutd.resource.defender.Pandora
{
   public class PandoraBombDefine
   {
      
      internal static const DEFENSE_PRICE:int = 255;
      
      internal static const FIRSTTRANS_DEFENSE_PRICE:int = 255;
      
      internal static const SECONDTRANS_DEFENSE_PRICE:int = 255;
      
      internal static const POISON_ADD_HURT_VALUE:int = 35;
      
      internal static const MAX_LIFE_VALUE:int = 20000;
      
      public function PandoraBombDefine()
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
         else if(iStarDegree > 9)
         {
            iStarDegreeEffect = 2 * 6 + 3 * 3 + 3 * (iStarDegree - 9);
         }
         return 10 * iStarDegreeEffect;
      }
   }
}

