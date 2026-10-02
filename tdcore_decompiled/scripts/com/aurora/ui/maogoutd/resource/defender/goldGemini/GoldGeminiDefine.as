package com.aurora.ui.maogoutd.resource.defender.goldGemini
{
   public class GoldGeminiDefine
   {
      
      internal static const DEFENSE_PRICE:int = 200;
      
      public function GoldGeminiDefine()
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
         if(iSkillDegree == 8)
         {
            return 25 + iSkillDegree + 2;
         }
         return 25 + iSkillDegree;
      }
   }
}

