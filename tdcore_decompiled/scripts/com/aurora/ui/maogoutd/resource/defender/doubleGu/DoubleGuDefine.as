package com.aurora.ui.maogoutd.resource.defender.doubleGu
{
   public class DoubleGuDefine
   {
      
      internal static const DEFENSE_PRICE:int = 75;
      
      public function DoubleGuDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 250;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         if(iSkillDegree == 8)
         {
            return 25 + iSkillDegree + 1;
         }
         return 25 + iSkillDegree;
      }
      
      internal static function GetCardSkillEffectMinValue(iSkillDegree:int) : int
      {
         if(iSkillDegree == 1)
         {
            return 15 + iSkillDegree;
         }
         if(iSkillDegree == 2)
         {
            return 15 + iSkillDegree;
         }
         if(iSkillDegree == 3)
         {
            return 15 + iSkillDegree;
         }
         if(iSkillDegree == 4)
         {
            return 15 + iSkillDegree + 1;
         }
         if(iSkillDegree == 5)
         {
            return 15 + iSkillDegree + 2;
         }
         if(iSkillDegree == 6)
         {
            return 15 + iSkillDegree + 4;
         }
         if(iSkillDegree == 7)
         {
            return 15 + iSkillDegree + 6;
         }
         if(iSkillDegree == 8)
         {
            return 15 + iSkillDegree + 9;
         }
         return 15 + iSkillDegree;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         return 500 - 20 * iStarDegree;
      }
   }
}

