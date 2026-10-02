package com.aurora.ui.maogoutd.resource.defender.dogChief
{
   import a_4718.b_183;
   
   public class DogChiefDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 325;
      
      public function DogChiefDefence()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_AthenaShot;
      }
      
      internal static function a_3964(a_1094:int = 0) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(a_1094)
         {
            case 0:
               iStarDegreeEffect = 0;
               break;
            case 1:
               iStarDegreeEffect = 20;
               break;
            case 2:
               iStarDegreeEffect = 40;
               break;
            case 3:
               iStarDegreeEffect = 60;
               break;
            case 4:
               iStarDegreeEffect = 80;
               break;
            case 5:
               iStarDegreeEffect = 100;
               break;
            case 6:
               iStarDegreeEffect = 120;
               break;
            case 7:
               iStarDegreeEffect = 140;
               break;
            case 8:
               iStarDegreeEffect = 160;
               break;
            case 9:
               iStarDegreeEffect = 190;
               break;
            case 10:
               iStarDegreeEffect = 220;
               break;
            case 11:
               iStarDegreeEffect = 250;
               break;
            case 12:
               iStarDegreeEffect = 280;
               break;
            case 13:
               iStarDegreeEffect = 310;
               break;
            case 14:
               iStarDegreeEffect = 340;
               break;
            case 15:
               iStarDegreeEffect = 370;
               break;
            case 16:
               iStarDegreeEffect = 400;
         }
         return iStarDegreeEffect;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         if(iSkillDegree == 8)
         {
            return 87;
         }
         return 120 - iSkillDegree * 4;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 7;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 7;
               break;
            case 1:
               iStarDegreeEffect = 8.5;
               break;
            case 2:
               iStarDegreeEffect = 10;
               break;
            case 3:
               iStarDegreeEffect = 11.5;
               break;
            case 4:
               iStarDegreeEffect = 13;
               break;
            case 5:
               iStarDegreeEffect = 14.5;
               break;
            case 6:
               iStarDegreeEffect = 16;
               break;
            case 7:
               iStarDegreeEffect = 17.5;
               break;
            case 8:
               iStarDegreeEffect = 19;
               break;
            case 9:
               iStarDegreeEffect = 20.5;
               break;
            case 10:
               iStarDegreeEffect = 22;
               break;
            case 11:
               iStarDegreeEffect = 23.5;
               break;
            case 12:
               iStarDegreeEffect = 25;
               break;
            case 13:
               iStarDegreeEffect = 28;
               break;
            case 14:
               iStarDegreeEffect = 31;
               break;
            case 15:
               iStarDegreeEffect = 34;
               break;
            case 16:
               iStarDegreeEffect = 39;
         }
         return 10 * iStarDegreeEffect;
      }
   }
}

