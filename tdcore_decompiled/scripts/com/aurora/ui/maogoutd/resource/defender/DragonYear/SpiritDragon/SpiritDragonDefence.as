package com.aurora.ui.maogoutd.resource.defender.DragonYear.SpiritDragon
{
   import a_4718.b_183;
   
   public class SpiritDragonDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 285;
      
      internal static const m_NormalFollowingShotDefense:Array = new Array(286392608,286392622,286392623,286392848,286392862,286392863,286394416,286394430,286394431,294846608,294846622,294846623,294846618,294846619,294846620,294846621,286392618,286392619,286392620,286392621,286400912,286400926,286400927,286458272,286458286,286458287,286401120,286401134,286401135,286401552,286401566,286401567,286402192,286402206,286402207);
      
      public function SpiritDragonDefence()
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
               iSkillDegreeEffect = 38;
               break;
            case 1:
               iSkillDegreeEffect = 35;
               break;
            case 2:
               iSkillDegreeEffect = 32;
               break;
            case 3:
               iSkillDegreeEffect = 29;
               break;
            case 4:
               iSkillDegreeEffect = 26;
               break;
            case 5:
               iSkillDegreeEffect = 23;
               break;
            case 6:
               iSkillDegreeEffect = 20;
               break;
            case 7:
               iSkillDegreeEffect = 17;
               break;
            case 8:
               iSkillDegreeEffect = 12;
         }
         return iSkillDegreeEffect * 10;
      }
      
      internal static function a_3965(iStarDegree:int) : Number
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 1.03;
               break;
            case 1:
               iStarDegreeEffect = 1.04;
               break;
            case 2:
               iStarDegreeEffect = 1.05;
               break;
            case 3:
               iStarDegreeEffect = 1.1;
               break;
            case 4:
               iStarDegreeEffect = 1.15;
               break;
            case 5:
               iStarDegreeEffect = 1.2;
               break;
            case 6:
               iStarDegreeEffect = 1.25;
               break;
            case 7:
               iStarDegreeEffect = 1.3;
               break;
            case 8:
               iStarDegreeEffect = 1.4;
               break;
            case 9:
               iStarDegreeEffect = 1.5;
               break;
            case 10:
               iStarDegreeEffect = 1.6;
               break;
            case 11:
               iStarDegreeEffect = 1.8;
               break;
            case 12:
               iStarDegreeEffect = 2;
               break;
            case 13:
               iStarDegreeEffect = 2.2;
               break;
            case 14:
               iStarDegreeEffect = 2.5;
               break;
            case 15:
               iStarDegreeEffect = 2.8;
               break;
            case 16:
               iStarDegreeEffect = 3.1;
         }
         return iStarDegreeEffect;
      }
   }
}

