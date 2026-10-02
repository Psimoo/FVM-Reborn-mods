package com.aurora.ui.maogoutd.resource.defender.doubleZhuan
{
   public class DoubleZhuanDefine
   {
      
      internal static const DEFENSE_PRICE:int = 200;
      
      public function DoubleZhuanDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 350;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         if(iSkillDegree == 7)
         {
            return 36 - iSkillDegree - 1;
         }
         if(iSkillDegree == 8)
         {
            return 36 - iSkillDegree - 2;
         }
         return 36 - iSkillDegree;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 25;
               break;
            case 1:
               iStarDegreeEffect = 29;
               break;
            case 2:
               iStarDegreeEffect = 33;
               break;
            case 3:
               iStarDegreeEffect = 37;
               break;
            case 4:
               iStarDegreeEffect = 41;
               break;
            case 5:
               iStarDegreeEffect = 45;
               break;
            case 6:
               iStarDegreeEffect = 49;
               break;
            case 7:
               iStarDegreeEffect = 55;
               break;
            case 8:
               iStarDegreeEffect = 65;
               break;
            case 9:
               iStarDegreeEffect = 75;
               break;
            case 10:
               iStarDegreeEffect = 95;
               break;
            case 11:
               iStarDegreeEffect = 115;
               break;
            case 12:
               iStarDegreeEffect = 135;
               break;
            case 13:
               iStarDegreeEffect = 155;
               break;
            case 14:
               iStarDegreeEffect = 175;
               break;
            case 15:
               iStarDegreeEffect = 195;
               break;
            case 16:
               iStarDegreeEffect = 225;
         }
         return iStarDegreeEffect;
      }
   }
}

