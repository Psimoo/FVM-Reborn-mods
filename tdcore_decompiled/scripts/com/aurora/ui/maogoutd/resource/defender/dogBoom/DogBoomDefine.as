package com.aurora.ui.maogoutd.resource.defender.dogBoom
{
   public class DogBoomDefine
   {
      
      internal static const DEFENSE_PRICE:int = 10;
      
      public function DogBoomDefine()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int) : int
      {
         if(0 == iSkillDegree)
         {
            return 300 - iSkillDegree * 10;
         }
         if(1 == iSkillDegree)
         {
            return 300 - iSkillDegree * 10;
         }
         if(2 == iSkillDegree)
         {
            return 300 - iSkillDegree * 10;
         }
         if(3 == iSkillDegree)
         {
            return 300 - iSkillDegree * 10;
         }
         if(4 == iSkillDegree)
         {
            return 300 - (iSkillDegree + 1) * 10;
         }
         if(5 == iSkillDegree)
         {
            return 300 - (iSkillDegree + 2) * 10;
         }
         if(6 == iSkillDegree)
         {
            return 300 - (iSkillDegree + 4) * 10;
         }
         if(7 == iSkillDegree)
         {
            return 300 - (iSkillDegree + 6) * 10;
         }
         if(8 == iSkillDegree)
         {
            return 300 - (iSkillDegree + 9) * 10;
         }
         return 300;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         if(iStarDegree == 16)
         {
            return 45;
         }
         return 28 + iStarDegree;
      }
   }
}

