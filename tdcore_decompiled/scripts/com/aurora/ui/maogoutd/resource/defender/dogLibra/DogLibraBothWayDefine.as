package com.aurora.ui.maogoutd.resource.defender.dogLibra
{
   import a_4718.b_183;
   
   public class DogLibraBothWayDefine
   {
      
      internal static const DEFENSE_PRICE:int = 125;
      
      public function DogLibraBothWayDefine()
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
            return 25 - iSkillDegree - 1;
         }
         return 25 - iSkillDegree;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 12;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 11;
               break;
            case 1:
               iStarDegreeEffect = 13;
               break;
            case 2:
               iStarDegreeEffect = 15;
               break;
            case 3:
               iStarDegreeEffect = 17;
               break;
            case 4:
               iStarDegreeEffect = 19;
               break;
            case 5:
               iStarDegreeEffect = 21;
               break;
            case 6:
               iStarDegreeEffect = 23;
               break;
            case 7:
               iStarDegreeEffect = 27;
               break;
            case 8:
               iStarDegreeEffect = 35;
               break;
            case 9:
               iStarDegreeEffect = 45;
               break;
            case 10:
               iStarDegreeEffect = 60;
               break;
            case 11:
               iStarDegreeEffect = 75;
               break;
            case 12:
               iStarDegreeEffect = 90;
               break;
            case 13:
               iStarDegreeEffect = 110;
               break;
            case 14:
               iStarDegreeEffect = 130;
               break;
            case 15:
               iStarDegreeEffect = 150;
               break;
            case 16:
               iStarDegreeEffect = 175;
         }
         return iStarDegreeEffect;
      }
   }
}

