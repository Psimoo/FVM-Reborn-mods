package com.aurora.ui.maogoutd.resource.defender.CattleYear.IcePowder
{
   import a_4718.b_183;
   
   public class IcePowderAuxiliaryDefine
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 125;
      
      public function IcePowderAuxiliaryDefine()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_AthenaShot;
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 100;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:int = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 7;
               break;
            case 1:
               iStarDegreeEffect = 8;
               break;
            case 2:
               iStarDegreeEffect = 9;
               break;
            case 3:
               iStarDegreeEffect = 10;
               break;
            case 4:
               iStarDegreeEffect = 11;
               break;
            case 5:
               iStarDegreeEffect = 12;
               break;
            case 6:
               iStarDegreeEffect = 13;
               break;
            case 7:
               iStarDegreeEffect = 15;
               break;
            case 8:
               iStarDegreeEffect = 17;
               break;
            case 9:
               iStarDegreeEffect = 19;
               break;
            case 10:
               iStarDegreeEffect = 22;
               break;
            case 11:
               iStarDegreeEffect = 25;
               break;
            case 12:
               iStarDegreeEffect = 29;
               break;
            case 13:
               iStarDegreeEffect = 33;
               break;
            case 14:
               iStarDegreeEffect = 37;
               break;
            case 15:
               iStarDegreeEffect = 41;
               break;
            case 16:
               iStarDegreeEffect = 45;
         }
         return iStarDegreeEffect * 10;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 1.3;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 1.3;
               break;
            case 1:
               iSkillDegreeEffect = 1.25;
               break;
            case 2:
               iSkillDegreeEffect = 1.2;
               break;
            case 3:
               iSkillDegreeEffect = 1.15;
               break;
            case 4:
               iSkillDegreeEffect = 1.1;
               break;
            case 5:
               iSkillDegreeEffect = 1.05;
               break;
            case 6:
               iSkillDegreeEffect = 1;
               break;
            case 7:
               iSkillDegreeEffect = 0.95;
               break;
            case 8:
               iSkillDegreeEffect = 0.9;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function GetAttackAddend(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 0.8;
               break;
            case 1:
               iStarDegreeEffect = 0.9;
               break;
            case 2:
               iStarDegreeEffect = 1;
               break;
            case 3:
               iStarDegreeEffect = 1.2;
               break;
            case 4:
               iStarDegreeEffect = 1.3;
               break;
            case 5:
               iStarDegreeEffect = 1.4;
               break;
            case 6:
               iStarDegreeEffect = 1.7;
               break;
            case 7:
               iStarDegreeEffect = 2.1;
               break;
            case 8:
               iStarDegreeEffect = 2.6;
               break;
            case 9:
               iStarDegreeEffect = 3.6;
               break;
            case 10:
               iStarDegreeEffect = 4.6;
               break;
            case 11:
               iStarDegreeEffect = 5.6;
               break;
            case 12:
               iStarDegreeEffect = 6.6;
               break;
            case 13:
               iStarDegreeEffect = 7.8;
               break;
            case 14:
               iStarDegreeEffect = 9.1;
               break;
            case 15:
               iStarDegreeEffect = 10.4;
               break;
            case 16:
               iStarDegreeEffect = 11.8;
         }
         return iStarDegreeEffect * 10;
      }
   }
}

