package com.aurora.ui.maogoutd.resource.defender.TigerYear.QingMingRice
{
   import a_4718.b_183;
   
   public class QingMingRiceEnergyFlowerDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 30;
      
      public function QingMingRiceEnergyFlowerDefence()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_AthenaShot;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 30;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 30;
               break;
            case 1:
               iSkillDegreeEffect = 28;
               break;
            case 2:
               iSkillDegreeEffect = 26;
               break;
            case 3:
               iSkillDegreeEffect = 24;
               break;
            case 4:
               iSkillDegreeEffect = 22;
               break;
            case 5:
               iSkillDegreeEffect = 20;
               break;
            case 6:
               iSkillDegreeEffect = 17;
               break;
            case 7:
               iSkillDegreeEffect = 14;
               break;
            case 8:
               iSkillDegreeEffect = 9;
         }
         return iSkillDegreeEffect * 10;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         return 25 + iStarDegree;
      }
   }
}

