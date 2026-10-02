package com.aurora.ui.maogoutd.resource.defender.CattleYear.StrongCattle
{
   import a_4718.b_183;
   
   public class StrongCattleDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 255;
      
      internal static const REDUEC_DEFENSE_PRICE:int = 50;
      
      public function StrongCattleDefine()
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
         var iSkillDegreeEffect:Number = 2;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 2;
               break;
            case 1:
               iSkillDegreeEffect = 1.95;
               break;
            case 2:
               iSkillDegreeEffect = 1.9;
               break;
            case 3:
               iSkillDegreeEffect = 1.85;
               break;
            case 4:
               iSkillDegreeEffect = 1.8;
               break;
            case 5:
               iSkillDegreeEffect = 1.75;
               break;
            case 6:
               iSkillDegreeEffect = 1.7;
               break;
            case 7:
               iSkillDegreeEffect = 1.65;
               break;
            case 8:
               iSkillDegreeEffect = 1.6;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 5;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 5;
               break;
            case 1:
               iStarDegreeEffect = 6;
               break;
            case 2:
               iStarDegreeEffect = 7;
               break;
            case 3:
               iStarDegreeEffect = 8;
               break;
            case 4:
               iStarDegreeEffect = 10;
               break;
            case 5:
               iStarDegreeEffect = 12;
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
               iStarDegreeEffect = 46;
               break;
            case 13:
               iStarDegreeEffect = 57;
               break;
            case 14:
               iStarDegreeEffect = 69;
               break;
            case 15:
               iStarDegreeEffect = 82;
               break;
            case 16:
               iStarDegreeEffect = 96;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function GetCardStarDegreeEffectValueHor(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 1.5;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 1.5;
               break;
            case 1:
               iStarDegreeEffect = 1.8;
               break;
            case 2:
               iStarDegreeEffect = 2.1;
               break;
            case 3:
               iStarDegreeEffect = 2.4;
               break;
            case 4:
               iStarDegreeEffect = 2.7;
               break;
            case 5:
               iStarDegreeEffect = 3;
               break;
            case 6:
               iStarDegreeEffect = 3.3;
               break;
            case 7:
               iStarDegreeEffect = 3.9;
               break;
            case 8:
               iStarDegreeEffect = 4.8;
               break;
            case 9:
               iStarDegreeEffect = 6;
               break;
            case 10:
               iStarDegreeEffect = 8.3;
               break;
            case 11:
               iStarDegreeEffect = 10.5;
               break;
            case 12:
               iStarDegreeEffect = 12.8;
               break;
            case 13:
               iStarDegreeEffect = 15;
               break;
            case 14:
               iStarDegreeEffect = 17.2;
               break;
            case 15:
               iStarDegreeEffect = 19.4;
               break;
            case 16:
               iStarDegreeEffect = 22.5;
         }
         return iStarDegreeEffect * 10;
      }
   }
}

