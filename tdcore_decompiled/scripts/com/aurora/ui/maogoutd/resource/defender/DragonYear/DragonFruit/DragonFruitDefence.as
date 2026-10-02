package com.aurora.ui.maogoutd.resource.defender.DragonYear.DragonFruit
{
   import a_4718.b_183;
   
   public class DragonFruitDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 385;
      
      internal static const MAX_LIFE_VALUE:int = 300;
      
      public function DragonFruitDefence()
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
               iSkillDegreeEffect = 58;
               break;
            case 1:
               iSkillDegreeEffect = 55;
               break;
            case 2:
               iSkillDegreeEffect = 52;
               break;
            case 3:
               iSkillDegreeEffect = 47;
               break;
            case 4:
               iSkillDegreeEffect = 42;
               break;
            case 5:
               iSkillDegreeEffect = 37;
               break;
            case 6:
               iSkillDegreeEffect = 32;
               break;
            case 7:
               iSkillDegreeEffect = 27;
               break;
            case 8:
               iSkillDegreeEffect = 22;
         }
         return iSkillDegreeEffect * 10;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 27.3;
               break;
            case 1:
               iStarDegreeEffect = 35.1;
               break;
            case 2:
               iStarDegreeEffect = 42.9;
               break;
            case 3:
               iStarDegreeEffect = 46.8;
               break;
            case 4:
               iStarDegreeEffect = 58.5;
               break;
            case 5:
               iStarDegreeEffect = 70.2;
               break;
            case 6:
               iStarDegreeEffect = 81.9;
               break;
            case 7:
               iStarDegreeEffect = 97.5;
               break;
            case 8:
               iStarDegreeEffect = 113.1;
               break;
            case 9:
               iStarDegreeEffect = 128.7;
               break;
            case 10:
               iStarDegreeEffect = 148.2;
               break;
            case 11:
               iStarDegreeEffect = 167.7;
               break;
            case 12:
               iStarDegreeEffect = 187.2;
               break;
            case 13:
               iStarDegreeEffect = 206.7;
               break;
            case 14:
               iStarDegreeEffect = 226.2;
               break;
            case 15:
               iStarDegreeEffect = 245.7;
               break;
            case 16:
               iStarDegreeEffect = 265.2;
         }
         return 10 * iStarDegreeEffect;
      }
   }
}

