package com.aurora.ui.maogoutd.resource.defender.PigYear.qianGuanZhu
{
   import a_4718.b_180;
   import a_4728.a_1778;
   import a_4729.a_1789;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import com.aurora.ui.maogoutd.resource.energy.a_4162;
   import flash.display.FrameLabel;
   
   public class QianGuanZhuFirstDefence extends a_3960
   {
      
      private static const PRODUCE_ENERGY_NUM:uint = 4;
      
      private var m_allEnergyValue:int = 0;
      
      private var m_bIsStartBoom:Boolean;
      
      private var m_arrPos:Array = [[0,0]];
      
      public function QianGuanZhuFirstDefence()
      {
         super();
         a_1330 = 2;
         a_1333 = true;
         m_iBoomType = 1;
         this.m_bIsStartBoom = false;
         a_1339 = 2;
         a_1095 = QianGuanZhuDefence.DEFENSE_PRICE;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(QianGuanZhuFirstDefence) as QianGuanZhuFirstDefence;
      }
      
      override protected function a_3964() : int
      {
         return QianGuanZhuDefence.a_3964(m_iSkillDegree);
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         a_1789.getInstance().removeEventListener("AddEnergyValue",this.OnAddEnergyValue);
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return QianGuanZhuFirstDefenceMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         this.m_bIsStartBoom = false;
         this.m_allEnergyValue = 0;
         a_1095 = QianGuanZhuDefence.DEFENSE_PRICE;
         a_1789.getInstance().addEventListener("AddEnergyValue",this.OnAddEnergyValue);
         return true;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         if(a_1339 <= 1)
         {
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         return true;
      }
      
      override protected function a_3965() : int
      {
         return QianGuanZhuDefence.a_3965(a_1094);
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         if(0 == (iCurrentTime & 1))
         {
            return false;
         }
         super.a_3961(iCurrentTime);
         if(!this.m_bIsStartBoom && null != a_1334 && a_1334.m_isOccupy && a_1334.a_1511.length > 0)
         {
            this.m_bIsStartBoom = true;
            gotoAndStop((a_1276[2] as FrameLabel).frame);
         }
         if(this.m_bIsStartBoom && a_1273 == a_1274 - 4)
         {
            this.ProdudeEnergy();
         }
         else if(this.m_bIsStartBoom && a_1273 == a_1274)
         {
            super.a_3969(iLifeValue);
         }
         return true;
      }
      
      private function OnAddEnergyValue(stDataEvent:a_1778) : void
      {
         this.m_allEnergyValue += stDataEvent.dataObject;
      }
      
      private function ProdudeEnergy() : void
      {
         var stFreeEnergy:a_4157 = null;
         var iEnergyValue:int = 0;
         var iAllEnergyValue:int = this.m_allEnergyValue * QianGuanZhuDefence.a_3965(a_1094);
         iAllEnergyValue = iAllEnergyValue > 1000 ? 1000 : iAllEnergyValue;
         for(var iIndex:int = 0; iIndex < PRODUCE_ENERGY_NUM; iIndex++)
         {
            stFreeEnergy = a_4162.getInstance().a_4163(b_180.a_420);
            if(null != stFreeEnergy)
            {
               iEnergyValue = iAllEnergyValue / PRODUCE_ENERGY_NUM;
               stFreeEnergy.m_stCurrentBattleField = a_1334.m_stCurrentBattbleFieldView;
               stFreeEnergy.a_1797(0,iEnergyValue,x - 15 * iIndex,y);
               stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stFreeEnergy,BattleLayerDefine.EFFECTS_TOP_TYPE);
            }
         }
      }
      
      protected function a_3955() : Number
      {
         return width * 0.1;
      }
      
      protected function a_3956() : Number
      {
         return 0.25 * height;
      }
   }
}

