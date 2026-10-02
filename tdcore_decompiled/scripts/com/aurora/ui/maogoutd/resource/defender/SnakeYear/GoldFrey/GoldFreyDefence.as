package com.aurora.ui.maogoutd.resource.defender.SnakeYear.GoldFrey
{
   import a_4718.b_183;
   
   public class GoldFreyDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 300;
      
      public function GoldFreyDefence()
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
               iSkillDegreeEffect = 35;
               break;
            case 1:
               iSkillDegreeEffect = 33;
               break;
            case 2:
               iSkillDegreeEffect = 31;
               break;
            case 3:
               iSkillDegreeEffect = 29;
               break;
            case 4:
               iSkillDegreeEffect = 27;
               break;
            case 5:
               iSkillDegreeEffect = 25;
               break;
            case 6:
               iSkillDegreeEffect = 22;
               break;
            case 7:
               iSkillDegreeEffect = 18;
               break;
            case 8:
               iSkillDegreeEffect = 12;
         }
         return iSkillDegreeEffect * 10;
      }
      
      internal static function a_3965(iStarDegree:int) : Number
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 0.16;
               break;
            case 1:
               iStarDegreeEffect = 0.18;
               break;
            case 2:
               iStarDegreeEffect = 0.2;
               break;
            case 3:
               iStarDegreeEffect = 0.22;
               break;
            case 4:
               iStarDegreeEffect = 0.27;
               break;
            case 5:
               iStarDegreeEffect = 0.32;
               break;
            case 6:
               iStarDegreeEffect = 0.38;
               break;
            case 7:
               iStarDegreeEffect = 0.44;
               break;
            case 8:
               iStarDegreeEffect = 0.5;
               break;
            case 9:
               iStarDegreeEffect = 0.56;
               break;
            case 10:
               iStarDegreeEffect = 0.81;
               break;
            case 11:
               iStarDegreeEffect = 1.26;
               break;
            case 12:
               iStarDegreeEffect = 1.71;
               break;
            case 13:
               iStarDegreeEffect = 2.16;
               break;
            case 14:
               iStarDegreeEffect = 2.61;
               break;
            case 15:
               iStarDegreeEffect = 3.06;
               break;
            case 16:
               iStarDegreeEffect = 3.51;
               break;
            case 17:
               iStarDegreeEffect = 4;
               break;
            case 18:
               iStarDegreeEffect = 4.5;
         }
         return iStarDegreeEffect + 1;
      }
   }
}

