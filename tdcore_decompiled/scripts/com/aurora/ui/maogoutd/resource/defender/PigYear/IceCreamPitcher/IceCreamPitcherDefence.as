package com.aurora.ui.maogoutd.resource.defender.PigYear.IceCreamPitcher
{
   import a_4718.b_183;
   
   public class IceCreamPitcherDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 135;
      
      internal static const LIFEVALUE:int = 50;
      
      public function IceCreamPitcherDefence()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_AthenaShot;
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 2.5;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 2.5;
               break;
            case 1:
               iSkillDegreeEffect = 2.45;
               break;
            case 2:
               iSkillDegreeEffect = 2.4;
               break;
            case 3:
               iSkillDegreeEffect = 2.35;
               break;
            case 4:
               iSkillDegreeEffect = 2.3;
               break;
            case 5:
               iSkillDegreeEffect = 2.25;
               break;
            case 6:
               iSkillDegreeEffect = 2.2;
               break;
            case 7:
               iSkillDegreeEffect = 2.1;
               break;
            case 8:
               iSkillDegreeEffect = 1.95;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 4.5;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 4.5;
               break;
            case 1:
               iStarDegreeEffect = 5.5;
               break;
            case 2:
               iStarDegreeEffect = 6.5;
               break;
            case 3:
               iStarDegreeEffect = 7;
               break;
            case 4:
               iStarDegreeEffect = 9;
               break;
            case 5:
               iStarDegreeEffect = 11;
               break;
            case 6:
               iStarDegreeEffect = 14;
               break;
            case 7:
               iStarDegreeEffect = 17;
               break;
            case 8:
               iStarDegreeEffect = 20;
               break;
            case 9:
               iStarDegreeEffect = 23;
               break;
            case 10:
               iStarDegreeEffect = 28;
               break;
            case 11:
               iStarDegreeEffect = 36;
               break;
            case 12:
               iStarDegreeEffect = 45;
               break;
            case 13:
               iStarDegreeEffect = 55;
               break;
            case 14:
               iStarDegreeEffect = 66;
               break;
            case 15:
               iStarDegreeEffect = 78;
               break;
            case 16:
               iStarDegreeEffect = 90;
         }
         return iStarDegreeEffect * 10;
      }
   }
}

