package com.aurora.ui.maogoutd.resource.defender.TigerYear.FlamingTiger
{
   import a_4718.b_180;
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3971;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import com.aurora.ui.maogoutd.resource.energy.a_4162;
   
   public class FlamingTigerEnergyFlower extends a_3971
   {
      
      private static const PRODUCE_ENERGY_NUM:uint = 1;
      
      private var m_PickEnergyValue:int = 0;
      
      private var iCellEnergyValue:int = 120;
      
      public function FlamingTigerEnergyFlower()
      {
         super();
         a_1343 = FlamingTigerDefence.GetProduceEnergyTime(a_1094);
         a_1095 = FlamingTigerDefence.DEFENSE_PRICE;
         a_1337 = 0;
         a_1344 = b_180.a_420;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3971
      {
         return PoolManager.getInstance().CheckOutOne(FlamingTigerEnergyFlower) as FlamingTigerEnergyFlower;
      }
      
      override protected function getBindMovie() : Class
      {
         return FlamingTigerEnergyFlowerMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1343 = FlamingTigerDefence.GetProduceEnergyTime(a_1094);
         a_1345 = 35;
         a_1347 = 1;
         this.m_PickEnergyValue = 0;
         a_1789.getInstance().addEventListener("AddEnergyValue",this.OnAddEnergyValue);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return FlamingTigerDefence.a_3964(m_iSkillDegree);
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         if(a_1339 - iRduceLifeValue <= 0)
         {
            this.ProdudeEnergy();
         }
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 3 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         a_1789.getInstance().removeEventListener("AddEnergyValue",this.OnAddEnergyValue);
         this.m_PickEnergyValue = 0;
         return true;
      }
      
      override protected function a_3956() : Number
      {
         return 0.1 * height;
      }
      
      override protected function a_3965() : int
      {
         return 20 * a_1094;
      }
      
      private function OnAddEnergyValue(stDataEvent:a_1778) : void
      {
         this.m_PickEnergyValue += stDataEvent.dataObject;
      }
      
      private function ProdudeEnergy() : void
      {
         var stFreeEnergy:a_4157 = null;
         var iAllEnergyValue:int = this.m_PickEnergyValue * FlamingTigerDefence.a_3965(a_1094);
         iAllEnergyValue = iAllEnergyValue > 1500 ? 1500 : iAllEnergyValue;
         if(iAllEnergyValue <= 0)
         {
            return;
         }
         var iEnergyNum:int = Math.floor(iAllEnergyValue / this.iCellEnergyValue);
         var iRestEnergy:int = iAllEnergyValue - iEnergyNum * this.iCellEnergyValue;
         for(var iIndex:int = 0; iIndex < iEnergyNum; iIndex++)
         {
            stFreeEnergy = a_4162.getInstance().a_4163(b_180.a_420);
            if(null != stFreeEnergy)
            {
               stFreeEnergy.m_stCurrentBattleField = a_1334.m_stCurrentBattbleFieldView;
               stFreeEnergy.a_1797(0,this.iCellEnergyValue,x - 15 * iIndex,y);
               stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stFreeEnergy,BattleLayerDefine.EFFECTS_TOP_TYPE);
            }
         }
         if(iRestEnergy > 0)
         {
            stFreeEnergy = a_4162.getInstance().a_4163(b_180.a_420);
            if(null != stFreeEnergy)
            {
               stFreeEnergy.m_stCurrentBattleField = a_1334.m_stCurrentBattbleFieldView;
               stFreeEnergy.a_1797(0,iRestEnergy,x - 15 * iIndex,y);
               stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stFreeEnergy,BattleLayerDefine.EFFECTS_TOP_TYPE);
            }
         }
      }
   }
}

