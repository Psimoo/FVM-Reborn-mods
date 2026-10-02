package com.aurora.ui.maogoutd.game.Util
{
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   
   public class BattleDestroyUtil
   {
      
      public function BattleDestroyUtil()
      {
         super();
      }
      
      public static function DestroyDefense(defense:a_3962) : Boolean
      {
         if(null != defense)
         {
            defense.m_iDieType = 1;
            defense.a_3969(defense.iLifeValue);
            if(defense.iLifeValue <= 0)
            {
               return true;
            }
         }
         return false;
      }
      
      public static function DestroyOneGrid(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         var bClear:Boolean = false;
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924) && DestroyDefense(stFieldGrid.m_stAttackFighter))
         {
            bClear = true;
         }
         if(null != stFieldGrid.m_stBoomDefense && stFieldGrid.m_stBoomDefense.isCanBeEaten && DestroyDefense(stFieldGrid.m_stBoomDefense))
         {
            bClear = true;
         }
         if(DestroyDefense(stFieldGrid.m_stFlowerDefense))
         {
            bClear = true;
         }
         if(DestroyDefense(stFieldGrid.m_stBaseToolDefense))
         {
            bClear = true;
         }
         if(DestroyDefense(stFieldGrid.m_stProtector))
         {
            bClear = true;
         }
         if(DestroyDefense(stFieldGrid.m_stBaseAuxiliaryFighter))
         {
            bClear = true;
         }
         if(DestroyDefense(stFieldGrid.m_stTrayDefense))
         {
            bClear = true;
         }
         return bClear;
      }
      
      public static function ClearOneGrid(stFieldGrid:a_3491) : void
      {
         if(stFieldGrid == null)
         {
            return;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         stFieldGrid.DamageNewSlot(true,0,true,0,1);
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
      }
      
      public static function DestroyCardIgnoreFangYu(defense:a_3962, dieType:int = 1) : void
      {
         if(defense == null)
         {
            return;
         }
         if(defense.m_FangyuBuff != null)
         {
            defense.m_FangyuBuff.a_3940();
            defense.m_FangyuBuff = null;
         }
         defense.m_iDieType = dieType;
         defense.a_3969(defense.iLifeValue);
      }
      
      public static function ClearOneGridIgnoreFangYu(stFieldGrid:a_3491, dieType:int = 1) : void
      {
         if(stFieldGrid == null)
         {
            return;
         }
         DestroyCardIgnoreFangYu(stFieldGrid.m_stProtector,dieType);
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            DestroyCardIgnoreFangYu(stFieldGrid.m_stAttackFighter,dieType);
         }
         DestroyCardIgnoreFangYu(stFieldGrid.m_stBoomDefense,dieType);
         DestroyCardIgnoreFangYu(stFieldGrid.m_stFlowerDefense,dieType);
         DestroyCardIgnoreFangYu(stFieldGrid.m_stBaseAuxiliaryFighter,dieType);
         DestroyCardIgnoreFangYu(stFieldGrid.m_stOceanGoddessToolDefense,dieType);
         DestroyCardIgnoreFangYu(stFieldGrid.m_stHoneyTrapBaseDefense,dieType);
         DestroyCardIgnoreFangYu(stFieldGrid.m_stTrayDefense,dieType);
      }
      
      public static function CanKillDefense(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            return true;
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            return true;
         }
         if(null != stFieldGrid.m_stBoomDefense && stFieldGrid.m_stBoomDefense.isCanBeEaten)
         {
            return true;
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            return true;
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            return true;
         }
         if(null != stFieldGrid.m_stTrayDefense)
         {
            return true;
         }
         return false;
      }
      
      public static function DamageOneGrid(stFieldGrid:a_3491, damage:int) : void
      {
         if(stFieldGrid == null)
         {
            return;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(damage);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(damage);
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(damage);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(damage);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(damage);
         }
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(damage);
         }
      }
      
      public static function HasDefense(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         return !(null == stFieldGrid.m_stProtector && null == stFieldGrid.m_stAttackFighter && null == stFieldGrid.m_stTrayDefense && null == stFieldGrid.m_stBoomDefense && null == stFieldGrid.m_stFlowerDefense && null == stFieldGrid.m_stBaseAuxiliaryFighter);
      }
      
      public static function HasDefenseOnGridForJump(stFieldGrid:a_3491, includeTray:Boolean = true, boomRequireCanBeEaten:Boolean = true) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         if(stFieldGrid.m_stProtector != null)
         {
            return true;
         }
         if(stFieldGrid.m_stAttackFighter != null)
         {
            return true;
         }
         if(stFieldGrid.m_stFlowerDefense != null)
         {
            return true;
         }
         if(stFieldGrid.m_stBaseAuxiliaryFighter != null)
         {
            return true;
         }
         if(stFieldGrid.m_stBoomDefense != null && (!boomRequireCanBeEaten || stFieldGrid.m_stBoomDefense.isCanBeEaten))
         {
            return true;
         }
         if(stFieldGrid.m_stOceanGoddessToolDefense != null)
         {
            return true;
         }
         if(stFieldGrid.m_stHoneyTrapBaseDefense != null)
         {
            return true;
         }
         if(includeTray && stFieldGrid.m_stTrayDefense != null)
         {
            return true;
         }
         return false;
      }
      
      public static function HasDefenseOnGridForJumpWithTool(stFieldGrid:a_3491, includeTray:Boolean = true, boomRequireCanBeEaten:Boolean = true) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         if(stFieldGrid.m_stBaseToolDefense != null)
         {
            return true;
         }
         return HasDefenseOnGridForJump(stFieldGrid,includeTray,boomRequireCanBeEaten);
      }
      
      public static function SkateGetEatTargetDefense(stFieldGrid:a_3491) : a_3962
      {
         if(stFieldGrid == null)
         {
            return null;
         }
         if(isDefenseCanEat(stFieldGrid.m_stProtector))
         {
            return stFieldGrid.m_stProtector;
         }
         if(isDefenseCanEat(stFieldGrid.m_stAttackFighter))
         {
            return stFieldGrid.m_stAttackFighter;
         }
         if(stFieldGrid.m_stBoomDefense != null && stFieldGrid.m_stBoomDefense.isCanBeEaten && isDefenseCanEat(stFieldGrid.m_stBoomDefense))
         {
            return stFieldGrid.m_stBoomDefense;
         }
         if(isDefenseCanEat(stFieldGrid.m_stFlowerDefense))
         {
            return stFieldGrid.m_stFlowerDefense;
         }
         if(isDefenseCanEat(stFieldGrid.m_stBaseAuxiliaryFighter))
         {
            return stFieldGrid.m_stBaseAuxiliaryFighter;
         }
         if(isDefenseCanEat(stFieldGrid.m_stOceanGoddessToolDefense))
         {
            return stFieldGrid.m_stOceanGoddessToolDefense;
         }
         if(isDefenseCanEat(stFieldGrid.m_stHoneyTrapBaseDefense))
         {
            return stFieldGrid.m_stHoneyTrapBaseDefense;
         }
         if(isDefenseCanEat(stFieldGrid.m_stTrayDefense))
         {
            return stFieldGrid.m_stTrayDefense;
         }
         return null;
      }
      
      private static function isDefenseCanEat(stDefense:a_3962) : Boolean
      {
         return stDefense != null && !stDefense.m_isShowFrozen && stDefense.CanBeEat();
      }
      
      public static function HasDefense2(stFieldGrid:a_3491, bCheckHero:Boolean = false) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            return true;
         }
         if(null != stFieldGrid.m_stTrayDefense)
         {
            return true;
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            return true;
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            return true;
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            return true;
         }
         if(null != stFieldGrid.m_stHoneyTrapBaseDefense)
         {
            return true;
         }
         if(null != stFieldGrid.m_stOceanGoddessToolDefense)
         {
            return true;
         }
         if(bCheckHero)
         {
            if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
            {
               return true;
            }
         }
         else if(null != stFieldGrid.m_stAttackFighter)
         {
            return true;
         }
         return false;
      }
      
      public static function BurnFieldGridDefense(stFieldGrid:a_3491, damage:int) : Boolean
      {
         if(null != stFieldGrid.m_stBaseToolDefense)
         {
            stFieldGrid.m_stBaseToolDefense.m_iDieType = 1;
            stFieldGrid.m_stBaseToolDefense.a_3969(damage);
         }
         else if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(damage);
         }
         else if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(damage);
         }
         else if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(damage);
         }
         else if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(damage);
         }
         else if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(damage);
         }
         else if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(damage);
         }
         return true;
      }
      
      public static function ClearMouseHole(stFieldGrid:a_3491, bClearLander:Boolean = true, bClearDefense:Boolean = false) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         var bClear:Boolean = false;
         if(stFieldGrid.m_stMouseEarthHole != null)
         {
            stFieldGrid.m_stMouseEarthHole.a_3940();
            stFieldGrid.m_stMouseEarthHole = null;
            stFieldGrid.m_isExistMouseHole = false;
            bClear = true;
         }
         if(bClearLander && stFieldGrid.m_stBaseLander != null)
         {
            stFieldGrid.m_stBaseLander.a_3940();
            stFieldGrid.m_stBaseLander = null;
         }
         if(bClearDefense)
         {
            stFieldGrid.ClearFieldGridDefenseOnlyFrozen();
         }
         var dataEvent:a_1778 = new a_1778("ClearMouseHole");
         dataEvent.dataObject = [stFieldGrid.m_iXGridNo,stFieldGrid.m_iYGridNo];
         a_1789.getInstance().dispatchEvent(dataEvent);
         return bClear;
      }
      
      public static function ClearChangeDefenseGrid(oldGrid:a_3491, iNoX:int, iNoY:int) : void
      {
         var battleView:BattleFieldView = null;
         var stBaseDefense:a_3953 = null;
         var stInitialFieldGrid:a_3491 = null;
         if(oldGrid == null)
         {
            return;
         }
         ClearOneGridIgnoreFangYu(oldGrid,2);
         battleView = oldGrid.m_stCurrentBattbleFieldView;
         if(battleView == null)
         {
            return;
         }
         var newGrid:a_3491 = battleView.a_3438(iNoX,iNoY);
         stBaseDefense = oldGrid.m_stAttackFighter;
         if(stBaseDefense == null)
         {
            return;
         }
         if(stBaseDefense is a_3924 == false)
         {
            return;
         }
         ClearOneGridIgnoreFangYu(newGrid,2);
         var newStarDegree:int = stBaseDefense.a_1094;
         stBaseDefense.m_iDieType = 2;
         stBaseDefense.a_3969(stBaseDefense.iLifeValue);
         stBaseDefense.m_iPlaceTimeIntervals = battleView.iTimeIntervalNum;
         var addResult:Boolean = newGrid.CheckAddDefense(stBaseDefense);
         if(addResult)
         {
            stInitialFieldGrid = battleView.a_3438(iNoX,iNoY);
            a_3962.a_1088.a_2059(stBaseDefense.m_iDefenseGlobalID,stBaseDefense.a_3512(),stInitialFieldGrid.m_iInitialXGridNo,stInitialFieldGrid.m_iInitialYGridNo,0,1,newStarDegree);
         }
      }
      
      public static function UseFanTool(grid:a_3491) : void
      {
         ClearBook(grid);
      }
      
      public static function ClearBook(grid:a_3491) : void
      {
         var grid2:a_3491 = null;
         var j:int = 0;
         if(grid == null)
         {
            return;
         }
         var battleView:BattleFieldView = grid.m_stCurrentBattbleFieldView;
         if(battleView == null)
         {
            return;
         }
         for(var i:int = 0; i < BattleFieldView.a_1011; i++)
         {
            for(j = 0; j < BattleFieldView.a_1012; j++)
            {
               grid2 = battleView.a_3438(i,j);
               if(grid2 != null)
               {
                  grid2.tagCom.RemoveTag(20040);
               }
            }
         }
      }
      
      public static function BurnFieldGridDefense2(stFieldGrid:a_3491, damage:int) : Boolean
      {
         if(stFieldGrid == null)
         {
            return true;
         }
         if(null != stFieldGrid.m_stBaseToolDefense)
         {
            stFieldGrid.m_stBaseToolDefense.m_iDieType = 1;
            stFieldGrid.m_stBaseToolDefense.a_3969(damage);
         }
         else if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(damage);
         }
         else if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(damage);
         }
         else if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(damage);
         }
         else if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(damage);
         }
         else if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(damage);
         }
         else if(null != stFieldGrid.m_stOceanGoddessToolDefense)
         {
            stFieldGrid.m_stOceanGoddessToolDefense.m_iDieType = 1;
            stFieldGrid.m_stOceanGoddessToolDefense.a_3969(damage);
         }
         else if(null != stFieldGrid.m_stHoneyTrapBaseDefense)
         {
            stFieldGrid.m_stHoneyTrapBaseDefense.m_iDieType = 1;
            stFieldGrid.m_stHoneyTrapBaseDefense.a_3969(damage);
         }
         else if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(damage);
         }
         return true;
      }
      
      public static function AttackFieldGridDefense(stFieldGrid:a_3491, damage:int, bAttackHero:Boolean = true) : Boolean
      {
         if(stFieldGrid == null)
         {
            return false;
         }
         if(null != stFieldGrid.m_stBaseToolDefense)
         {
            stFieldGrid.m_stBaseToolDefense.m_iDieType = 1;
            stFieldGrid.m_stBaseToolDefense.a_3969(damage);
            return true;
         }
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(damage);
            return true;
         }
         if(null != stFieldGrid.m_stAttackFighter)
         {
            if(bAttackHero)
            {
               stFieldGrid.m_stAttackFighter.m_iDieType = 1;
               stFieldGrid.m_stAttackFighter.a_3969(damage);
               return true;
            }
            if(!(stFieldGrid.m_stAttackFighter is a_3924))
            {
               stFieldGrid.m_stAttackFighter.m_iDieType = 1;
               stFieldGrid.m_stAttackFighter.a_3969(damage);
               return true;
            }
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(damage);
            return true;
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(damage);
            return true;
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(damage);
            return true;
         }
         if(null != stFieldGrid.m_stOceanGoddessToolDefense)
         {
            stFieldGrid.m_stOceanGoddessToolDefense.m_iDieType = 1;
            stFieldGrid.m_stOceanGoddessToolDefense.a_3969(damage);
            return true;
         }
         if(null != stFieldGrid.m_stHoneyTrapBaseDefense)
         {
            stFieldGrid.m_stHoneyTrapBaseDefense.m_iDieType = 1;
            stFieldGrid.m_stHoneyTrapBaseDefense.a_3969(damage);
            return true;
         }
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(damage);
            return true;
         }
         return true;
      }
   }
}

