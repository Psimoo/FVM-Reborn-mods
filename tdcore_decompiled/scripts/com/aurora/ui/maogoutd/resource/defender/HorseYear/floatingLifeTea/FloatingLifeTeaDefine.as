package com.aurora.ui.maogoutd.resource.defender.HorseYear.floatingLifeTea
{
   import com.aurora.ui.maogoutd.game.Util.BattleVOUtil;
   import flash.utils.Dictionary;
   
   public class FloatingLifeTeaDefine
   {
      
      internal static const DEFENSE_PRICE:int = 265;
      
      private static const FIXED_TRAJECTORY_TYPE_IDS:Array = [286401680,286401694,286401695,286401536,286401550,286401551,286402314,286402315,286402316,286402317,286402432,286402446,286402447,286402688,286402702,286402703,286402640,286402654,286402655];
      
      private static const m_FixedTrajectoryLookup:Dictionary = BattleVOUtil.buildLookup(FIXED_TRAJECTORY_TYPE_IDS);
      
      public function FloatingLifeTeaDefine()
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
               iSkillDegreeEffect = 50;
               break;
            case 1:
               iSkillDegreeEffect = 48;
               break;
            case 2:
               iSkillDegreeEffect = 46;
               break;
            case 3:
               iSkillDegreeEffect = 44;
               break;
            case 4:
               iSkillDegreeEffect = 40;
               break;
            case 5:
               iSkillDegreeEffect = 35;
               break;
            case 6:
               iSkillDegreeEffect = 30;
               break;
            case 7:
               iSkillDegreeEffect = 25;
               break;
            case 8:
               iSkillDegreeEffect = 18;
         }
         return iSkillDegreeEffect * 10;
      }
      
      internal static function a_3965(iStarDegree:int) : Number
      {
         var iStarDegreeEffect:Number = 1.05;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 1.05;
               break;
            case 1:
               iStarDegreeEffect = 1.1;
               break;
            case 2:
               iStarDegreeEffect = 1.15;
               break;
            case 3:
               iStarDegreeEffect = 1.2;
               break;
            case 4:
               iStarDegreeEffect = 1.25;
               break;
            case 5:
               iStarDegreeEffect = 1.3;
               break;
            case 6:
               iStarDegreeEffect = 1.35;
               break;
            case 7:
               iStarDegreeEffect = 1.4;
               break;
            case 8:
               iStarDegreeEffect = 1.45;
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
               iStarDegreeEffect = 2.4;
               break;
            case 15:
               iStarDegreeEffect = 2.7;
               break;
            case 16:
               iStarDegreeEffect = 3;
         }
         return Math.round((iStarDegreeEffect - 1) * 10) / 10;
      }
      
      internal static function IsFixedTrajectoryDefense(iDefenseTypeID:int) : Boolean
      {
         return m_FixedTrajectoryLookup[iDefenseTypeID];
      }
   }
}

