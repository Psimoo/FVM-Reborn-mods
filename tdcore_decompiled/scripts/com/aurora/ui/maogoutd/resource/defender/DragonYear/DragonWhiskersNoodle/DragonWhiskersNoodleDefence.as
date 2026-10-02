package com.aurora.ui.maogoutd.resource.defender.DragonYear.DragonWhiskersNoodle
{
   import a_4718.b_183;
   
   public class DragonWhiskersNoodleDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 260;
      
      public function DragonWhiskersNoodleDefence()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_AthenaShot;
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return a_3966(iSkillDegree);
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 40;
               break;
            case 1:
               iSkillDegreeEffect = 37;
               break;
            case 2:
               iSkillDegreeEffect = 34;
               break;
            case 3:
               iSkillDegreeEffect = 31;
               break;
            case 4:
               iSkillDegreeEffect = 28;
               break;
            case 5:
               iSkillDegreeEffect = 25;
               break;
            case 6:
               iSkillDegreeEffect = 22;
               break;
            case 7:
               iSkillDegreeEffect = 19;
               break;
            case 8:
               iSkillDegreeEffect = 15;
         }
         return iSkillDegreeEffect * 10;
      }
      
      internal static function a_3965(iStarDegree:int) : Number
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 1.02;
               break;
            case 1:
               iStarDegreeEffect = 1.03;
               break;
            case 2:
               iStarDegreeEffect = 1.04;
               break;
            case 3:
               iStarDegreeEffect = 1.05;
               break;
            case 4:
               iStarDegreeEffect = 1.07;
               break;
            case 5:
               iStarDegreeEffect = 1.09;
               break;
            case 6:
               iStarDegreeEffect = 1.11;
               break;
            case 7:
               iStarDegreeEffect = 1.13;
               break;
            case 8:
               iStarDegreeEffect = 1.15;
               break;
            case 9:
               iStarDegreeEffect = 1.17;
               break;
            case 10:
               iStarDegreeEffect = 1.19;
               break;
            case 11:
               iStarDegreeEffect = 1.21;
               break;
            case 12:
               iStarDegreeEffect = 1.23;
               break;
            case 13:
               iStarDegreeEffect = 1.25;
               break;
            case 14:
               iStarDegreeEffect = 1.3;
               break;
            case 15:
               iStarDegreeEffect = 1.5;
               break;
            case 16:
               iStarDegreeEffect = 1.7;
         }
         return iStarDegreeEffect;
      }
   }
}

