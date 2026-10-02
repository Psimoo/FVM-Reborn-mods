package com.aurora.ui.maogoutd.resource.defender.libra
{
   import a_4718.b_183;
   
   public class LibraBothWayDefine
   {
      
      internal static const DEFENSE_PRICE:int = 150;
      
      public function LibraBothWayDefine()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_LibraBothWayShot;
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         if(iSkillDegree == 8)
         {
            return 28 - iSkillDegree - 1;
         }
         return 28 - iSkillDegree;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 12;
               break;
            case 1:
               iStarDegreeEffect = 14;
               break;
            case 2:
               iStarDegreeEffect = 16;
               break;
            case 3:
               iStarDegreeEffect = 18;
               break;
            case 4:
               iStarDegreeEffect = 20;
               break;
            case 5:
               iStarDegreeEffect = 22;
               break;
            case 6:
               iStarDegreeEffect = 26;
               break;
            case 7:
               iStarDegreeEffect = 32;
               break;
            case 8:
               iStarDegreeEffect = 40;
               break;
            case 9:
               iStarDegreeEffect = 55;
               break;
            case 10:
               iStarDegreeEffect = 70;
               break;
            case 11:
               iStarDegreeEffect = 85;
               break;
            case 12:
               iStarDegreeEffect = 100;
               break;
            case 13:
               iStarDegreeEffect = 120;
               break;
            case 14:
               iStarDegreeEffect = 140;
               break;
            case 15:
               iStarDegreeEffect = 160;
               break;
            case 16:
               iStarDegreeEffect = 185;
         }
         return iStarDegreeEffect;
      }
   }
}

