package com.aurora.ui.maogoutd.resource.defender.SnakeYear.GoldFateGoddesses
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   import com.aurora.ui.maogoutd.resource.defender.a_4012;
   
   public class GoldFateGoddessesDefence
   {
      
      internal static const SHOT_DELAY_TIMENUM:int = 10;
      
      internal static const CONTINUE_SHOT_INTERVAL:int = 8;
      
      internal static const DEFENSE_PRICE:int = 400;
      
      public static var ms_arrBoomCard:Array = new Array(286394688,286394702,286394703,286458144,294846544,286457950,286457983,286392336,286392350,286392351);
      
      public static var ms_arrToolCard:Array = new Array(288817204,288817214,288817189,288817198,288817199,288817248,288817262,288817264,288817278,288817279,292552848,292552862,292552863);
      
      public function GoldFateGoddessesDefence()
      {
         super();
      }
      
      internal static function GetShotTypeID(iType:int = 0) : uint
      {
         return b_183.enm_AthenaShot;
      }
      
      internal static function a_3964(iSkillDegree:int = 0) : int
      {
         return a_3965(iSkillDegree);
      }
      
      internal static function a_3966(iSkillDegree:int) : int
      {
         var iSkillDegreeEffect:Number = 60;
         switch(iSkillDegree)
         {
            case 0:
               iSkillDegreeEffect = 60;
               break;
            case 1:
               iSkillDegreeEffect = 65;
               break;
            case 2:
               iSkillDegreeEffect = 70;
               break;
            case 3:
               iSkillDegreeEffect = 75;
               break;
            case 4:
               iSkillDegreeEffect = 80;
               break;
            case 5:
               iSkillDegreeEffect = 85;
               break;
            case 6:
               iSkillDegreeEffect = 95;
               break;
            case 7:
               iSkillDegreeEffect = 105;
               break;
            case 8:
               iSkillDegreeEffect = 120;
         }
         return iSkillDegreeEffect * 1000;
      }
      
      internal static function a_3965(iStarDegree:int) : int
      {
         var iStarDegreeEffect:Number = 0;
         switch(iStarDegree)
         {
            case 0:
               iStarDegreeEffect = 60;
               break;
            case 1:
               iStarDegreeEffect = 59;
               break;
            case 2:
               iStarDegreeEffect = 58;
               break;
            case 3:
               iStarDegreeEffect = 57;
               break;
            case 4:
               iStarDegreeEffect = 55;
               break;
            case 5:
               iStarDegreeEffect = 53;
               break;
            case 6:
               iStarDegreeEffect = 50;
               break;
            case 7:
               iStarDegreeEffect = 47;
               break;
            case 8:
               iStarDegreeEffect = 44;
               break;
            case 9:
               iStarDegreeEffect = 41;
               break;
            case 10:
               iStarDegreeEffect = 38;
               break;
            case 11:
               iStarDegreeEffect = 35;
               break;
            case 12:
               iStarDegreeEffect = 32;
               break;
            case 13:
               iStarDegreeEffect = 29;
               break;
            case 14:
               iStarDegreeEffect = 26;
               break;
            case 15:
               iStarDegreeEffect = 23;
               break;
            case 16:
               iStarDegreeEffect = 20;
         }
         return 10 * iStarDegreeEffect;
      }
      
      public static function getUpgradeDefenseArr(stFieldGrid:a_3491) : Array
      {
         var arr:Array = [];
         if(stFieldGrid == null)
         {
            return arr;
         }
         if(stFieldGrid.m_isShowFrozen == true && stFieldGrid.m_bShowFrozenEffect == false)
         {
            return arr;
         }
         var stNewDefense:a_3962 = null;
         if(stFieldGrid.m_stTrayDefense != null)
         {
            stNewDefense = a_4012.getInstance().a_4013(stFieldGrid.m_stTrayDefense.a_3512()) as a_3962;
         }
         if(stFieldGrid.m_stTrayDefense != null && stNewDefense != null)
         {
            arr.push(stFieldGrid.m_stTrayDefense);
         }
         if(stFieldGrid.m_stOceanGoddessToolDefense)
         {
            arr.push(stFieldGrid.m_stOceanGoddessToolDefense);
         }
         if(stFieldGrid.m_stAttackFighter != null && stFieldGrid.m_stAttackFighter.CanBeUpGrade() && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            arr.push(stFieldGrid.m_stAttackFighter);
         }
         if(stFieldGrid.m_stBattleFlagHorseDefense != null)
         {
            arr.push(stFieldGrid.m_stBattleFlagHorseDefense);
         }
         if(stFieldGrid.m_stBattleBarrierHorseDefense != null)
         {
            arr.push(stFieldGrid.m_stBattleBarrierHorseDefense);
         }
         if(stFieldGrid.m_stFlowerDefense != null)
         {
            arr.push(stFieldGrid.m_stFlowerDefense);
         }
         if(stFieldGrid.m_stBaseAuxiliaryFighter != null)
         {
            arr.push(stFieldGrid.m_stBaseAuxiliaryFighter);
         }
         if(stFieldGrid.m_stBoomDefense != null && ms_arrBoomCard.indexOf(stFieldGrid.m_stBoomDefense.a_3512()) != -1)
         {
            arr.push(stFieldGrid.m_stBoomDefense);
         }
         if(stFieldGrid.m_stProtector != null)
         {
            arr.push(stFieldGrid.m_stProtector);
         }
         if(stFieldGrid.m_stHoneyTrapBaseDefense != null)
         {
            arr.push(stFieldGrid.m_stHoneyTrapBaseDefense);
         }
         if(stFieldGrid.m_stBaseToolDefense != null && ms_arrToolCard.indexOf(stFieldGrid.m_stBaseToolDefense.a_3512()) != -1)
         {
            stFieldGrid.m_stBaseToolDefense.tagCom.AddTag(30039);
            arr.push(stFieldGrid.m_stBaseToolDefense);
         }
         return arr;
      }
      
      public static function getUpgradeDefense(stFieldGrid:a_3491) : a_3962
      {
         var arr:Array = getUpgradeDefenseArr(stFieldGrid);
         return arr.length > 0 ? arr[0] : null;
      }
   }
}

