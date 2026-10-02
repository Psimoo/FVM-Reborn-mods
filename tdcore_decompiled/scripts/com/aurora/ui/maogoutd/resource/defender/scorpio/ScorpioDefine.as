package com.aurora.ui.maogoutd.resource.defender.scorpio
{
   import a_4718.b_183;
   
   public class ScorpioDefine
   {
      
      internal static const DEFENSE_PRICE:int = 200;
      
      public function ScorpioDefine()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_ScorpioShot;
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         if(iSkillDegree == 8)
         {
            return 30 - iSkillDegree - 1;
         }
         return 30 - iSkillDegree;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 4;
               break;
            case 1:
               iStarDegreeEffect = 5;
               break;
            case 2:
               iStarDegreeEffect = 6;
               break;
            case 3:
               iStarDegreeEffect = 7;
               break;
            case 4:
               iStarDegreeEffect = 8;
               break;
            case 5:
               iStarDegreeEffect = 9;
               break;
            case 6:
               iStarDegreeEffect = 10;
               break;
            case 7:
               iStarDegreeEffect = 11;
               break;
            case 8:
               iStarDegreeEffect = 12;
               break;
            case 9:
               iStarDegreeEffect = 13;
               break;
            case 10:
               iStarDegreeEffect = 16;
               break;
            case 11:
               iStarDegreeEffect = 19;
               break;
            case 12:
               iStarDegreeEffect = 22;
               break;
            case 13:
               iStarDegreeEffect = 25;
               break;
            case 14:
               iStarDegreeEffect = 28;
               break;
            case 15:
               iStarDegreeEffect = 31;
               break;
            case 16:
               iStarDegreeEffect = 34;
         }
         return iStarDegreeEffect * 10;
      }
   }
}

