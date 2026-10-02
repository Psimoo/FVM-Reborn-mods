package com.aurora.ui.maogoutd.resource.defender.RabbitYear.MasterRabbit
{
   import a_4718.b_183;
   
   public class MasterRabbitDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 275;
      
      public function MasterRabbitDefence()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_AthenaShot;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 2.6;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 2.6;
               break;
            case 1:
               iSkillDegreeEffect = 2.55;
               break;
            case 2:
               iSkillDegreeEffect = 2.5;
               break;
            case 3:
               iSkillDegreeEffect = 2.45;
               break;
            case 4:
               iSkillDegreeEffect = 2.4;
               break;
            case 5:
               iSkillDegreeEffect = 2.35;
               break;
            case 6:
               iSkillDegreeEffect = 2.3;
               break;
            case 7:
               iSkillDegreeEffect = 2.2;
               break;
            case 8:
               iSkillDegreeEffect = 2;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 3.5;
               break;
            case 1:
               iStarDegreeEffect = 4;
               break;
            case 2:
               iStarDegreeEffect = 4.5;
               break;
            case 3:
               iStarDegreeEffect = 5.5;
               break;
            case 4:
               iStarDegreeEffect = 6.5;
               break;
            case 5:
               iStarDegreeEffect = 7.5;
               break;
            case 6:
               iStarDegreeEffect = 8.5;
               break;
            case 7:
               iStarDegreeEffect = 9.5;
               break;
            case 8:
               iStarDegreeEffect = 10.5;
               break;
            case 9:
               iStarDegreeEffect = 13.5;
               break;
            case 10:
               iStarDegreeEffect = 16.5;
               break;
            case 11:
               iStarDegreeEffect = 19.5;
               break;
            case 12:
               iStarDegreeEffect = 22.5;
               break;
            case 13:
               iStarDegreeEffect = 34.5;
               break;
            case 14:
               iStarDegreeEffect = 46.5;
               break;
            case 15:
               iStarDegreeEffect = 58.5;
               break;
            case 16:
               iStarDegreeEffect = 70.5;
         }
         return iStarDegreeEffect * 10;
      }
   }
}

