package com.aurora.ui.maogoutd.resource.defender.gemini
{
   public class GeminiDefine
   {
      
      internal static const DEFENSE_PRICE:int = 200;
      
      public function GeminiDefine()
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
            return 25 + iSkillDegree + 1;
         }
         return 25 + iSkillDegree;
      }
   }
}

