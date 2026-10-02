package com.aurora.ui.maogoutd.resource.defender.HorseYear.OceanGoddess
{
   import com.aurora.ui.maogoutd.game.Util.BattleVOUtil;
   import flash.utils.Dictionary;
   
   public class OceanGoddessAuxiliaryDefine
   {
      
      internal static const DEFENSE_PRICE:int = 360;
      
      private static const m_SingleStraightShotCard:Array = [286402144,286402158,286402159,286402368,286402382,286402383,286402570,286402571,286402572,286402573];
      
      private static const m_SingleStraightShotDic:Dictionary = BattleVOUtil.buildLookup(m_SingleStraightShotCard);
      
      public function OceanGoddessAuxiliaryDefine()
      {
         super();
      }
      
      internal static function a_3964(iSkillDegree:int) : int
      {
         return a_3966(iSkillDegree);
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 40;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 40;
               break;
            case 1:
               iSkillDegreeEffect = 38;
               break;
            case 2:
               iSkillDegreeEffect = 36;
               break;
            case 3:
               iSkillDegreeEffect = 33;
               break;
            case 4:
               iSkillDegreeEffect = 29;
               break;
            case 5:
               iSkillDegreeEffect = 25;
               break;
            case 6:
               iSkillDegreeEffect = 21;
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
               iStarDegreeEffect = 1.6;
               break;
            case 1:
               iStarDegreeEffect = 1.7;
               break;
            case 2:
               iStarDegreeEffect = 1.8;
               break;
            case 3:
               iStarDegreeEffect = 1.9;
               break;
            case 4:
               iStarDegreeEffect = 2;
               break;
            case 5:
               iStarDegreeEffect = 2.2;
               break;
            case 6:
               iStarDegreeEffect = 2.4;
               break;
            case 7:
               iStarDegreeEffect = 2.6;
               break;
            case 8:
               iStarDegreeEffect = 2.8;
               break;
            case 9:
               iStarDegreeEffect = 3;
               break;
            case 10:
               iStarDegreeEffect = 3.3;
               break;
            case 11:
               iStarDegreeEffect = 3.6;
               break;
            case 12:
               iStarDegreeEffect = 4;
               break;
            case 13:
               iStarDegreeEffect = 4.5;
               break;
            case 14:
               iStarDegreeEffect = 5;
               break;
            case 15:
               iStarDegreeEffect = 5.5;
               break;
            case 16:
               iStarDegreeEffect = 6;
               break;
            case 17:
               iStarDegreeEffect = 6.5;
               break;
            case 18:
               iStarDegreeEffect = 7;
         }
         return iStarDegreeEffect;
      }
      
      internal static function IsSingleStraightShotCard(iDefenseTypeID:int) : Boolean
      {
         return m_SingleStraightShotDic[iDefenseTypeID] === true;
      }
   }
}

