package com.aurora.ui.maogoutd.resource.defender.DragonYear.FlowerFireDragon
{
   import a_4718.b_180;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3960;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import com.aurora.ui.maogoutd.resource.energy.a_4162;
   import flash.display.FrameLabel;
   import flash.events.MouseEvent;
   import flash.utils.setTimeout;
   
   public class FlowerFireDragonFirstBombAttackFighter extends a_3960
   {
      
      private static const PRODUCE_ENERGY_NUM:uint = 2;
      
      private var a_1345:int;
      
      private var a_1343:int;
      
      private var appearedTimes:int = 0;
      
      private var m_OutArray:Array = new Array([-35,-78],[11,-80],[-18,-110]);
      
      public function FlowerFireDragonFirstBombAttackFighter()
      {
         super();
         a_1095 = FlowerFireDragonBombDefine.DEFENSE_PRICE;
         a_1330 = 0;
         a_1333 = true;
      }
      
      public static function a_3926() : a_3960
      {
         return PoolManager.getInstance().CheckOutOne(FlowerFireDragonFirstBombAttackFighter) as FlowerFireDragonFirstBombAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return FlowerFireDragonFirstBombAttackFighterMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         super.a_1797(stFieldGrid);
         a_1339 = FlowerFireDragonBombDefine.MAX_LIFE_VALUE;
         this.a_1345 = FlowerFireDragonBombDefine.a_3965(a_1094);
         this.a_1343 = FlowerFireDragonBombDefine.a_3966(m_iSkillDegree);
         this.appearedTimes = -1;
         a_1275 = 0;
         gotoAndStop((a_1276[0] as FrameLabel).frame);
         return true;
      }
      
      override protected function a_3964() : int
      {
         return FlowerFireDragonBombDefine.a_3964(a_1094);
      }
      
      override public function a_3961(iCurrentTime:int) : Boolean
      {
         super.a_3961(iCurrentTime);
         if(this.appearedTimes == -1)
         {
            this.appearedTimes = iCurrentTime;
            this.ProdudeBorenEnergy();
         }
         if(iCurrentTime - this.appearedTimes >= this.a_1343)
         {
            if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[1] as FrameLabel).frame);
            }
         }
         if(iCurrentTime % 2 == 0)
         {
            trace("m_iCurrentFrame::" + a_1273);
            if(a_1273 == 17)
            {
               this.ProdudeEnergy(0);
            }
            else if(a_1273 == 20)
            {
               this.ProdudeEnergy(1);
            }
            else if(a_1273 == 25)
            {
               this.ProdudeEnergy(2);
            }
            else if(a_1273 == a_1274)
            {
               super.a_3969(a_1339);
               a_3940();
            }
         }
         return true;
      }
      
      private function ProdudeEnergy(pIndex:int) : void
      {
         var offect:int = 0;
         var stFreeEnergy:a_4157 = null;
         var iProduceEnergy:int = 0;
         var iEnergyValue:int = 0;
         for(var iIndex:int = 0; iIndex < PRODUCE_ENERGY_NUM; iIndex++)
         {
            offect = iIndex == 1 ? 1 : -1;
            stFreeEnergy = a_4162.getInstance().a_4163(b_180.a_420);
            if(null != stFreeEnergy)
            {
               iProduceEnergy = int(1 * this.a_1345);
               iEnergyValue = a_1334.m_stCurrentBattbleFieldView.isOwnBattleField ? iProduceEnergy : 5;
               stFreeEnergy.m_stCurrentBattleField = a_1334.m_stCurrentBattbleFieldView;
               stFreeEnergy.a_1797(0,iEnergyValue,x + this.m_OutArray[pIndex][0] + offect * 10,y + this.m_OutArray[pIndex][1]);
               stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stFreeEnergy,BattleLayerDefine.EFFECTS_TOP_TYPE);
               setTimeout(this.onDispathEvent,500,stFreeEnergy);
            }
         }
      }
      
      private function ProdudeBorenEnergy() : void
      {
         var offect:int = 0;
         var stFreeEnergy:a_4157 = null;
         var iProduceEnergy:int = 0;
         var iEnergyValue:int = 0;
         for(var iIndex:int = 1; iIndex < 2; iIndex++)
         {
            offect = iIndex == 1 ? 0 : 1;
            stFreeEnergy = a_4162.getInstance().a_4163(b_180.a_420);
            if(null != stFreeEnergy)
            {
               iProduceEnergy = FlowerFireDragonBombDefine.DEFENSE_PRICE;
               iEnergyValue = a_1334.m_stCurrentBattbleFieldView.isOwnBattleField ? iProduceEnergy : 5;
               stFreeEnergy.m_stCurrentBattleField = a_1334.m_stCurrentBattbleFieldView;
               stFreeEnergy.a_1797(0,iEnergyValue,x - 20 + (iIndex - 1) * 20,y - 107 - offect * 15);
               stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stFreeEnergy,BattleLayerDefine.EFFECTS_TOP_TYPE);
               setTimeout(this.onDispathEvent,500,stFreeEnergy);
            }
         }
      }
      
      private function onDispathEvent(stFreeEnergy:a_4157) : void
      {
         stFreeEnergy.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_OVER));
      }
   }
}

