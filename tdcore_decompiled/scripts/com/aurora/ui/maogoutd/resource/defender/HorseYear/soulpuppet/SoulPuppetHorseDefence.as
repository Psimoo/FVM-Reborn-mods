package com.aurora.ui.maogoutd.resource.defender.HorseYear.soulpuppet
{
   public class SoulPuppetHorseDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 390;
      
      public function SoulPuppetHorseDefence()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return 450;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 15;
               break;
            case 1:
               iSkillDegreeEffect = 16;
               break;
            case 2:
               iSkillDegreeEffect = 17;
               break;
            case 3:
               iSkillDegreeEffect = 18;
               break;
            case 4:
               iSkillDegreeEffect = 20;
               break;
            case 5:
               iSkillDegreeEffect = 22;
               break;
            case 6:
               iSkillDegreeEffect = 24;
               break;
            case 7:
               iSkillDegreeEffect = 28;
               break;
            case 8:
               iSkillDegreeEffect = 35;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : Number
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 0.2;
               break;
            case 1:
               iStarDegreeEffect = 0.21;
               break;
            case 2:
               iStarDegreeEffect = 0.22;
               break;
            case 3:
               iStarDegreeEffect = 0.23;
               break;
            case 4:
               iStarDegreeEffect = 0.24;
               break;
            case 5:
               iStarDegreeEffect = 0.26;
               break;
            case 6:
               iStarDegreeEffect = 0.28;
               break;
            case 7:
               iStarDegreeEffect = 0.3;
               break;
            case 8:
               iStarDegreeEffect = 0.32;
               break;
            case 9:
               iStarDegreeEffect = 0.34;
               break;
            case 10:
               iStarDegreeEffect = 0.36;
               break;
            case 11:
               iStarDegreeEffect = 0.38;
               break;
            case 12:
               iStarDegreeEffect = 0.4;
               break;
            case 13:
               iStarDegreeEffect = 0.45;
               break;
            case 14:
               iStarDegreeEffect = 0.55;
               break;
            case 15:
               iStarDegreeEffect = 0.65;
               break;
            case 16:
               iStarDegreeEffect = 0.75;
         }
         return iStarDegreeEffect;
      }
   }
}

