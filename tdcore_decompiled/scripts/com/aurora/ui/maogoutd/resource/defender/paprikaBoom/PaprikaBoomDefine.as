package com.aurora.ui.maogoutd.resource.defender.paprikaBoom
{
   public class PaprikaBoomDefine
   {
      
      internal static const DEFENSE_PRICE:int = 10;
      
      public function PaprikaBoomDefine()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int) : int
      {
         return 300 - iSkillDegree * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         return 25 + iStarDegree;
      }
   }
}

