package com.aurora.ui.maogoutd.resource.defender.DragonYear.IceCrystalDragon
{
   import a_4718.b_183;
   
   public class IceCrystalDragonDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 300;
      
      internal static const REDUEC_DEFENSE_PRICE:int = 100;
      
      public function IceCrystalDragonDefence()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_AthenaShot;
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return 150;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 0;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 6;
               break;
            case 1:
               iSkillDegreeEffect = 5.8;
               break;
            case 2:
               iSkillDegreeEffect = 5.6;
               break;
            case 3:
               iSkillDegreeEffect = 5.4;
               break;
            case 4:
               iSkillDegreeEffect = 5.2;
               break;
            case 5:
               iSkillDegreeEffect = 5;
               break;
            case 6:
               iSkillDegreeEffect = 4.8;
               break;
            case 7:
               iSkillDegreeEffect = 4.6;
               break;
            case 8:
               iSkillDegreeEffect = 4.3;
         }
         return iSkillDegreeEffect * 20;
      }
      
      internal static function a_3965(iStarDegree:int) : Number
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 8;
               break;
            case 1:
               iStarDegreeEffect = 10;
               break;
            case 2:
               iStarDegreeEffect = 12;
               break;
            case 3:
               iStarDegreeEffect = 14;
               break;
            case 4:
               iStarDegreeEffect = 16;
               break;
            case 5:
               iStarDegreeEffect = 19;
               break;
            case 6:
               iStarDegreeEffect = 22;
               break;
            case 7:
               iStarDegreeEffect = 26;
               break;
            case 8:
               iStarDegreeEffect = 30;
               break;
            case 9:
               iStarDegreeEffect = 35;
               break;
            case 10:
               iStarDegreeEffect = 40;
               break;
            case 11:
               iStarDegreeEffect = 46;
               break;
            case 12:
               iStarDegreeEffect = 52;
               break;
            case 13:
               iStarDegreeEffect = 66;
               break;
            case 14:
               iStarDegreeEffect = 92;
               break;
            case 15:
               iStarDegreeEffect = 118;
               break;
            case 16:
               iStarDegreeEffect = 158;
         }
         return iStarDegreeEffect * 10;
      }
   }
}

