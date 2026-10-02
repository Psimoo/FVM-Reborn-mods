package com.aurora.ui.maogoutd.resource.defender.CattleYear.MaltDust
{
   import a_4718.b_183;
   
   public class MaltDustDefense
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 55;
      
      public function MaltDustDefense()
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
               iSkillDegreeEffect = 7;
               break;
            case 1:
               iSkillDegreeEffect = 6.5;
               break;
            case 2:
               iSkillDegreeEffect = 6;
               break;
            case 3:
               iSkillDegreeEffect = 5.5;
               break;
            case 4:
               iSkillDegreeEffect = 5;
               break;
            case 5:
               iSkillDegreeEffect = 4.5;
               break;
            case 6:
               iSkillDegreeEffect = 4;
               break;
            case 7:
               iSkillDegreeEffect = 3.5;
               break;
            case 8:
               iSkillDegreeEffect = 3;
         }
         return iSkillDegreeEffect * 10;
      }
      
      internal static function a_3965(a_1094:int) : Number
      {
         var iStarDegreeEffect:int = 3600;
         switch(a_1094)
         {
            case 0:
               iStarDegreeEffect = 3600;
               break;
            case 1:
               iStarDegreeEffect = 3800;
               break;
            case 2:
               iStarDegreeEffect = 4000;
               break;
            case 3:
               iStarDegreeEffect = 4200;
               break;
            case 4:
               iStarDegreeEffect = 4500;
               break;
            case 5:
               iStarDegreeEffect = 4800;
               break;
            case 6:
               iStarDegreeEffect = 5100;
               break;
            case 7:
               iStarDegreeEffect = 5700;
               break;
            case 8:
               iStarDegreeEffect = 6300;
               break;
            case 9:
               iStarDegreeEffect = 6900;
               break;
            case 10:
               iStarDegreeEffect = 7700;
               break;
            case 11:
               iStarDegreeEffect = 8500;
               break;
            case 12:
               iStarDegreeEffect = 9300;
               break;
            case 13:
               iStarDegreeEffect = 10100;
               break;
            case 14:
               iStarDegreeEffect = 10900;
               break;
            case 15:
               iStarDegreeEffect = 11700;
               break;
            case 16:
               iStarDegreeEffect = 12500;
         }
         return iStarDegreeEffect * 10;
      }
   }
}

