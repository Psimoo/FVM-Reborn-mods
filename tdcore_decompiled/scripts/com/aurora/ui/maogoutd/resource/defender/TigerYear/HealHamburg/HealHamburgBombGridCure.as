package com.aurora.ui.maogoutd.resource.defender.TigerYear.HealHamburg
{
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.defender.PigYear.CureMeow.AddDefBloodEffect;
   import com.aurora.ui.maogoutd.resource.defender.a_3962;
   
   public final class HealHamburgBombGridCure
   {
      
      public function HealHamburgBombGridCure()
      {
         super();
      }
      
      internal static function GetGridCureDefense(stFieldGrid:a_3491) : a_3962
      {
         if(stFieldGrid.m_stOceanGoddessToolDefense != null)
         {
            return stFieldGrid.m_stOceanGoddessToolDefense;
         }
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
      
      internal static function CureFieldGridDefenseForHealHamburgBomb(stFieldGrid:a_3491, value:int = 10, TransType:int = 0) : Boolean
      {
         var stAddDefBloodEffect:AddDefBloodEffect = null;
         if(!stFieldGrid)
         {
            return false;
         }
         var cureTarget:a_3962 = GetGridCureDefense(stFieldGrid);
         if(!cureTarget)
         {
            return false;
         }
         if(CheckCanAddLife(cureTarget.a_3512()))
         {
            return false;
         }
         if(stFieldGrid.a_3492() && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stAddDefBloodEffect = AddDefBloodEffect.a_3926();
            stAddDefBloodEffect.a_1797(false);
            stAddDefBloodEffect.x = stFieldGrid.m_iXGridNo * a_3491.a_1080 + 0.5 * (a_3491.a_1080 - stAddDefBloodEffect.width);
            stAddDefBloodEffect.y = stFieldGrid.m_iYGridNo * a_3491.a_1081 + 0.5 * (a_3491.a_1081 - stAddDefBloodEffect.height);
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stAddDefBloodEffect,BattleLayerDefine.EFFECTS_TOP_TYPE);
         }
         if(TransType == 2)
         {
            TryCureDefenseToFullLife(cureTarget);
         }
         TryDieReduceOnDefense(cureTarget,value);
         return true;
      }
      
      internal static function TryDieReduceOnDefense(unit:a_3962, value:int) : Boolean
      {
         if(unit == null)
         {
            return false;
         }
         unit.m_iDieType = 1;
         unit.a_3969(value);
         return true;
      }
      
      internal static function TryCureDefenseToFullLife(unit:a_3962) : Boolean
      {
         if(unit == null)
         {
            return false;
         }
         var healAmount:int = unit.iInitialLifeValue - unit.iLifeValue;
         unit.m_iDieType = 1;
         unit.a_3969(-healAmount);
         return true;
      }
      
      internal static function CheckCanAddLife(id:uint) : Boolean
      {
         return id == 286394224 || id == 286394238 || id == 286394239 || id == 286392704 || id == 286392718 || id == 286392719;
      }
   }
}

