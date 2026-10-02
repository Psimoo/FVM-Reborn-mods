package com.aurora.ui.maogoutd.resource.defender.PigYear.NinthExhaustFan
{
   public class NinthExhaustFanDefense
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 99;
      
      internal static const REDUCE_DEFENSE_PRICE:int = 50;
      
      internal static var m_MouseArr:Array = new Array(8388616,8388722,8388759,8389317,8389022);
      
      public function NinthExhaustFanDefense()
      {
         super();
      }
      
      internal static function a_3964(iStarDegree:int = 0) : int
      {
         return 70;
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
               iSkillDegreeEffect = 0.9;
               break;
            case 8:
               iSkillDegreeEffect = 0.8;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         if(iStarDegree <= 3)
         {
            iStarDegreeEffect = 2 * iStarDegree;
         }
         else if(iStarDegree > 3 && iStarDegree <= 6)
         {
            iStarDegreeEffect = 2 * 3 + 3 * (iStarDegree - 3);
         }
         else if(iStarDegree > 6 && iStarDegree <= 9)
         {
            iStarDegreeEffect = 2 * 3 + 3 * (6 - 3) + 4 * (iStarDegree - 6);
         }
         else if(iStarDegree > 9)
         {
            iStarDegreeEffect = 2 * 3 + 3 * (6 - 3) + 4 * (9 - 6) + 5 * (iStarDegree - 9);
         }
         return 10 * iStarDegreeEffect;
      }
   }
}

