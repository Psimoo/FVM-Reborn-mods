package com.aurora.ui.maogoutd.resource.defender.doubleNuan
{
   public class DoubleNuanDefine
   {
      
      internal static const DEFENSE_PRICE:int = 125;
      
      public function DoubleNuanDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return 500;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         return 500 - 20 * iStarDegree;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         if(iSkillDegree > 7)
         {
            return 25 + iSkillDegree + 1;
         }
         return 25 + iSkillDegree;
      }
   }
}

