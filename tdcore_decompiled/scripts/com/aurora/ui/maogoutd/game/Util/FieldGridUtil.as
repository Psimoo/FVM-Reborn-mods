package com.aurora.ui.maogoutd.game.Util
{
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   
   public class FieldGridUtil
   {
      
      public static const OCEAN_MAP_BURN_DAMAGE:int = 10;
      
      public function FieldGridUtil()
      {
         super();
      }
      
      public static function PushCoolDownDefenseTypeIDs(stFieldGrid:a_3491, typeIdList:Array, iCoolDownSource:int) : void
      {
         if(!stFieldGrid || !typeIdList)
         {
            return;
         }
         pushDefenseTypeID(stFieldGrid.m_stProtector,typeIdList);
         pushDefenseTypeID(stFieldGrid.m_stAttackFighter,typeIdList);
         if(iCoolDownSource == 1)
         {
            pushDefenseTypeID(stFieldGrid.m_stBattleFlagHorseDefense,typeIdList);
            pushDefenseTypeID(stFieldGrid.m_stBattleBarrierHorseDefense,typeIdList);
         }
         pushDefenseTypeID(stFieldGrid.m_stTrayDefense,typeIdList);
         pushDefenseTypeID(stFieldGrid.m_stBoomDefense,typeIdList);
         pushDefenseTypeID(stFieldGrid.m_stFlowerDefense,typeIdList);
         pushDefenseTypeID(stFieldGrid.m_stBaseAuxiliaryFighter,typeIdList);
         if(iCoolDownSource == 1)
         {
            pushDefenseTypeID(stFieldGrid.m_stHoneyTrapBaseDefense,typeIdList);
         }
         pushDefenseTypeID(stFieldGrid.m_stOceanGoddessToolDefense,typeIdList);
      }
      
      public static function BurnOceanFieldGridDefense(stFieldGrid:a_3491, damage:int) : Boolean
      {
         if(!stFieldGrid)
         {
            return false;
         }
         burnOceanDefenseIfNotImmu(getOceanBurnTarget(stFieldGrid),damage);
         return true;
      }
      
      public static function HasOceanImmuDefenseOnGrid(stFieldGrid:a_3491) : Boolean
      {
         if(!stFieldGrid)
         {
            return false;
         }
         return hasOceanImmuOnPrimarySlot(stFieldGrid);
      }
      
      private static function getOceanBurnTarget(stFieldGrid:a_3491) : a_3962
      {
         if(stFieldGrid.m_stBaseToolDefense != null)
         {
            return stFieldGrid.m_stBaseToolDefense;
         }
         if(stFieldGrid.m_stProtector != null)
         {
            return stFieldGrid.m_stProtector;
         }
         if(stFieldGrid.m_stAttackFighter != null && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            return stFieldGrid.m_stAttackFighter;
         }
         if(stFieldGrid.m_stBoomDefense != null)
         {
            return stFieldGrid.m_stBoomDefense;
         }
         if(stFieldGrid.m_stFlowerDefense != null)
         {
            return stFieldGrid.m_stFlowerDefense;
         }
         if(stFieldGrid.m_stBaseAuxiliaryFighter != null)
         {
            return stFieldGrid.m_stBaseAuxiliaryFighter;
         }
         if(stFieldGrid.m_stOceanGoddessToolDefense != null)
         {
            return stFieldGrid.m_stOceanGoddessToolDefense;
         }
         if(stFieldGrid.m_stHoneyTrapBaseDefense != null)
         {
            return stFieldGrid.m_stHoneyTrapBaseDefense;
         }
         if(stFieldGrid.m_stTrayDefense != null)
         {
            return stFieldGrid.m_stTrayDefense;
         }
         return null;
      }
      
      private static function hasOceanImmuOnPrimarySlot(stFieldGrid:a_3491) : Boolean
      {
         if(stFieldGrid.m_stProtector != null)
         {
            return isImmuDefense(stFieldGrid.m_stProtector);
         }
         if(stFieldGrid.m_stAttackFighter != null)
         {
            if(stFieldGrid.m_stAttackFighter is a_3924)
            {
               return true;
            }
            return isImmuDefense(stFieldGrid.m_stAttackFighter);
         }
         if(stFieldGrid.m_stBoomDefense != null)
         {
            return isImmuDefense(stFieldGrid.m_stBoomDefense);
         }
         if(stFieldGrid.m_stFlowerDefense != null)
         {
            return isImmuDefense(stFieldGrid.m_stFlowerDefense);
         }
         if(stFieldGrid.m_stBaseAuxiliaryFighter != null)
         {
            return isImmuDefense(stFieldGrid.m_stBaseAuxiliaryFighter);
         }
         if(stFieldGrid.m_stOceanGoddessToolDefense != null)
         {
            return isImmuDefense(stFieldGrid.m_stOceanGoddessToolDefense);
         }
         if(stFieldGrid.m_stHoneyTrapBaseDefense != null)
         {
            return isImmuDefense(stFieldGrid.m_stHoneyTrapBaseDefense);
         }
         if(stFieldGrid.m_stTrayDefense != null)
         {
            return isImmuDefense(stFieldGrid.m_stTrayDefense);
         }
         return false;
      }
      
      private static function isImmuDefense(stDefense:a_3962) : Boolean
      {
         return BattleVOUtil.IsOceanMapImmuDefense(stDefense.a_3512());
      }
      
      private static function pushDefenseTypeID(stDefense:a_3962, typeIdList:Array) : void
      {
         if(stDefense != null)
         {
            typeIdList.push(stDefense.a_3512());
         }
      }
      
      private static function burnOceanDefenseIfNotImmu(stDefense:a_3962, damage:int) : void
      {
         if(stDefense == null || isImmuDefense(stDefense))
         {
            return;
         }
         stDefense.m_iDieType = 1;
         stDefense.a_3969(damage);
      }
   }
}

