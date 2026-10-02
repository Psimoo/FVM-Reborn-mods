package com.aurora.ui.maogoutd.resource.defender.HorseYear.musicBoxHorse
{
   import com.aurora.ui.maogoutd.game.Util.BattleVOUtil;
   import flash.utils.Dictionary;
   
   public class MusicBoxHorseDefine
   {
      
      internal static const DEFENSE_PRICE:int = 320;
      
      private static const FIXED_TRAJECTORY_TYPE_IDS:Array = [286401680,286401694,286401695,286401536,286401550,286401551,286402314,286402315,286402316,286402317,286402432,286402446,286402447,286402688,286402702,286402703,286402640,286402654,286402655];
      
      private static const m_FixedTrajectoryLookup:Dictionary = BattleVOUtil.buildLookup(FIXED_TRAJECTORY_TYPE_IDS);
      
      public function MusicBoxHorseDefine()
      {
         super();
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
               iSkillDegreeEffect = 45;
               break;
            case 1:
               iSkillDegreeEffect = 43;
               break;
            case 2:
               iSkillDegreeEffect = 41;
               break;
            case 3:
               iSkillDegreeEffect = 39;
               break;
            case 4:
               iSkillDegreeEffect = 37;
               break;
            case 5:
               iSkillDegreeEffect = 34;
               break;
            case 6:
               iSkillDegreeEffect = 30;
               break;
            case 7:
               iSkillDegreeEffect = 25;
               break;
            case 8:
               iSkillDegreeEffect = 15;
         }
         return iSkillDegreeEffect * 10;
      }
      
      internal static function a_3965(iStarDegree:int) : Number
      {
         var iStarDegreeEffect:Number = 1.1;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 1.1;
               break;
            case 1:
               iStarDegreeEffect = 1.2;
               break;
            case 2:
               iStarDegreeEffect = 1.3;
               break;
            case 3:
               iStarDegreeEffect = 1.4;
               break;
            case 4:
               iStarDegreeEffect = 1.5;
               break;
            case 5:
               iStarDegreeEffect = 1.6;
               break;
            case 6:
               iStarDegreeEffect = 1.7;
               break;
            case 7:
               iStarDegreeEffect = 1.8;
               break;
            case 8:
               iStarDegreeEffect = 1.9;
               break;
            case 9:
               iStarDegreeEffect = 2;
               break;
            case 10:
               iStarDegreeEffect = 2.2;
               break;
            case 11:
               iStarDegreeEffect = 2.4;
               break;
            case 12:
               iStarDegreeEffect = 2.6;
               break;
            case 13:
               iStarDegreeEffect = 2.8;
               break;
            case 14:
               iStarDegreeEffect = 3.2;
               break;
            case 15:
               iStarDegreeEffect = 3.6;
               break;
            case 16:
               iStarDegreeEffect = 4;
         }
         return Math.round((iStarDegreeEffect - 1) * 10) / 10;
      }
      
      internal static function IsFixedTrajectoryDefense(iDefenseTypeID:int) : Boolean
      {
         return m_FixedTrajectoryLookup[iDefenseTypeID];
      }
   }
}

