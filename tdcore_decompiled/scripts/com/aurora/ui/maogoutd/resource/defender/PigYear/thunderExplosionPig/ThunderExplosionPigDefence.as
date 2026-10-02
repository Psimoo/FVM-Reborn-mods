package com.aurora.ui.maogoutd.resource.defender.PigYear.thunderExplosionPig
{
   import a_4718.b_183;
   
   public class ThunderExplosionPigDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 175;
      
      internal static const SHOTINTERVALTIMENUM:int = 20 * 3;
      
      public function ThunderExplosionPigDefence()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_AthenaShot;
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 550 - GetGrownTimeByStarDegree(iStarDegree);
      }
      
      internal static function GetGrownTimeByStarDegree(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 0;
               break;
            case 1:
               iStarDegreeEffect = 1;
               break;
            case 2:
               iStarDegreeEffect = 2;
               break;
            case 3:
               iStarDegreeEffect = 3;
               break;
            case 4:
               iStarDegreeEffect = 5;
               break;
            case 5:
               iStarDegreeEffect = 7;
               break;
            case 6:
               iStarDegreeEffect = 9;
               break;
            case 7:
               iStarDegreeEffect = 12;
               break;
            case 8:
               iStarDegreeEffect = 14;
               break;
            case 9:
               iStarDegreeEffect = 17;
               break;
            case 10:
               iStarDegreeEffect = 20;
               break;
            case 11:
               iStarDegreeEffect = 23;
               break;
            case 12:
               iStarDegreeEffect = 27;
               break;
            case 13:
               iStarDegreeEffect = 30;
               break;
            case 14:
               iStarDegreeEffect = 33;
               break;
            case 15:
               iStarDegreeEffect = 36;
               break;
            case 16:
               iStarDegreeEffect = 39;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         return 900;
      }
   }
}

