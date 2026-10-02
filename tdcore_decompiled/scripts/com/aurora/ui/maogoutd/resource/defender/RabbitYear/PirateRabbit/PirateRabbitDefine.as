package com.aurora.ui.maogoutd.resource.defender.RabbitYear.PirateRabbit
{
   import a_4718.b_183;
   
   public class PirateRabbitDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 6;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 4;
      
      internal static const DEFENSE_PRICE:int = 200;
      
      public function PirateRabbitDefine()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int) : int
      {
         return 200;
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_CancerFollow;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 3.4;
               break;
            case 1:
               iSkillDegreeEffect = 3.35;
               break;
            case 2:
               iSkillDegreeEffect = 3.3;
               break;
            case 3:
               iSkillDegreeEffect = 3.25;
               break;
            case 4:
               iSkillDegreeEffect = 3.2;
               break;
            case 5:
               iSkillDegreeEffect = 3.15;
               break;
            case 6:
               iSkillDegreeEffect = 3.1;
               break;
            case 7:
               iSkillDegreeEffect = 2.95;
               break;
            case 8:
               iSkillDegreeEffect = 2.8;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 15;
               break;
            case 1:
               iStarDegreeEffect = 18;
               break;
            case 2:
               iStarDegreeEffect = 21;
               break;
            case 3:
               iStarDegreeEffect = 24;
               break;
            case 4:
               iStarDegreeEffect = 27;
               break;
            case 5:
               iStarDegreeEffect = 30;
               break;
            case 6:
               iStarDegreeEffect = 33;
               break;
            case 7:
               iStarDegreeEffect = 36;
               break;
            case 8:
               iStarDegreeEffect = 42;
               break;
            case 9:
               iStarDegreeEffect = 52;
               break;
            case 10:
               iStarDegreeEffect = 70;
               break;
            case 11:
               iStarDegreeEffect = 88;
               break;
            case 12:
               iStarDegreeEffect = 108;
               break;
            case 13:
               iStarDegreeEffect = 126;
               break;
            case 14:
               iStarDegreeEffect = 146;
               break;
            case 15:
               iStarDegreeEffect = 166;
               break;
            case 16:
               iStarDegreeEffect = 190;
         }
         return int(iStarDegreeEffect);
      }
   }
}

