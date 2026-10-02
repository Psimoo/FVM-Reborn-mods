package com.aurora.ui.maogoutd.resource.defender.SnakeYear.magicWandSnake
{
   import com.aurora.ui.maogoutd.game.Util.BattleVOUtil;
   import flash.utils.Dictionary;
   
   public class magicWandSnakeAuxiliaryDefine
   {
      
      internal static const DEFENSE_PRICE:int = 310;
      
      internal static const REDUCE_DEFENSE_PRICE:int = 50;
      
      internal static const HURT_ADDITION:Number = 0.2;
      
      internal static const FIRSTTRANS_LIFEADD:int = 24;
      
      internal static const LIFE_VALUE:int = 60;
      
      private static const m_MagicSnakeExtraArr:Array = [286402144,286402158,286402159,286402368,286402382,286402383,286402570,286402571,286402572,286402573];
      
      private static const m_MagicSnakeExtraDic:Dictionary = BattleVOUtil.buildLookup(m_MagicSnakeExtraArr);
      
      public function magicWandSnakeAuxiliaryDefine()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int) : int
      {
         return a_3966(iSkillDegree);
      }
      
      internal static function a_3965(iStarDegree:int) : Number
      {
         var iStarDegreeEffect:Number = 0;
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
               iStarDegreeEffect = 1.3;
               break;
            case 5:
               iStarDegreeEffect = 1.4;
               break;
            case 6:
               iStarDegreeEffect = 1.5;
               break;
            case 7:
               iStarDegreeEffect = 1.6;
               break;
            case 8:
               iStarDegreeEffect = 1.7;
               break;
            case 9:
               iStarDegreeEffect = 1.9;
               break;
            case 10:
               iStarDegreeEffect = 2.1;
               break;
            case 11:
               iStarDegreeEffect = 2.3;
               break;
            case 12:
               iStarDegreeEffect = 2.5;
               break;
            case 13:
               iStarDegreeEffect = 2.8;
               break;
            case 14:
               iStarDegreeEffect = 3.1;
               break;
            case 15:
               iStarDegreeEffect = 3.4;
               break;
            case 16:
               iStarDegreeEffect = 3.7;
         }
         return iStarDegreeEffect;
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 42;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 42;
               break;
            case 1:
               iSkillDegreeEffect = 39;
               break;
            case 2:
               iSkillDegreeEffect = 36;
               break;
            case 3:
               iSkillDegreeEffect = 33;
               break;
            case 4:
               iSkillDegreeEffect = 30;
               break;
            case 5:
               iSkillDegreeEffect = 27;
               break;
            case 6:
               iSkillDegreeEffect = 24;
               break;
            case 7:
               iSkillDegreeEffect = 20;
               break;
            case 8:
               iSkillDegreeEffect = 15;
         }
         return iSkillDegreeEffect * 10;
      }
      
      internal static function IsMagicSnakeTargetDefense(iDefenseTypeID:int) : Boolean
      {
         return BattleVOUtil.IsRotateShotCard(iDefenseTypeID) || m_MagicSnakeExtraDic[iDefenseTypeID] === true;
      }
   }
}

