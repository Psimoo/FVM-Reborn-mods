package com.aurora.ui.maogoutd.resource.defender.CattleYear.AirJetCattle
{
   import a_4718.b_183;
   
   public class AirJetCattleDefine
   {
      
      internal static const DEFENSE_PRICE:int = 245;
      
      public function AirJetCattleDefine()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_ScorpioShot;
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 70;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 1.6;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 1.6;
               break;
            case 1:
               iSkillDegreeEffect = 1.55;
               break;
            case 2:
               iSkillDegreeEffect = 1.5;
               break;
            case 3:
               iSkillDegreeEffect = 1.45;
               break;
            case 4:
               iSkillDegreeEffect = 1.4;
               break;
            case 5:
               iSkillDegreeEffect = 1.35;
               break;
            case 6:
               iSkillDegreeEffect = 1.25;
               break;
            case 7:
               iSkillDegreeEffect = 1.15;
               break;
            case 8:
               iSkillDegreeEffect = 1;
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
               iStarDegreeEffect = 5;
               break;
            case 4:
               iStarDegreeEffect = 5.5;
               break;
            case 5:
               iStarDegreeEffect = 6;
               break;
            case 6:
               iStarDegreeEffect = 7;
               break;
            case 7:
               iStarDegreeEffect = 8;
               break;
            case 8:
               iStarDegreeEffect = 10;
               break;
            case 9:
               iStarDegreeEffect = 12;
               break;
            case 10:
               iStarDegreeEffect = 17;
               break;
            case 11:
               iStarDegreeEffect = 22;
               break;
            case 12:
               iStarDegreeEffect = 27;
               break;
            case 13:
               iStarDegreeEffect = 32;
               break;
            case 14:
               iStarDegreeEffect = 37;
               break;
            case 15:
               iStarDegreeEffect = 42;
               break;
            case 16:
               iStarDegreeEffect = 47;
         }
         return iStarDegreeEffect * 10;
      }
   }
}

