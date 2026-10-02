package com.aurora.ui.maogoutd.resource.defender.HorseYear.ChanXinMa
{
   import a_4718.b_180;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import com.aurora.ui.maogoutd.resource.energy.a_4157;
   import com.aurora.ui.maogoutd.resource.energy.a_4162;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.setTimeout;
   
   public class ChanXinMaBaseDefense extends a_3976
   {
      
      private static const MAX_WAVE_COUNT:int = 3;
      
      private static const ENERGY_PER_WAVE:int = 4;
      
      private var m_stTiemr:Timer;
      
      private var refundRatio:Number;
      
      private var m_OutArray:Array = [[12,-62],[-8,-62],[-28,-62],[-48,-62]];
      
      private var m_arrEnergyBySlot:Array = null;
      
      public function ChanXinMaBaseDefense()
      {
         super();
         a_1095 = ChanXinMaDefine.DEFENSE_PRICE;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : ChanXinMaBaseDefense
      {
         return PoolManager.getInstance().CheckOutOne(ChanXinMaBaseDefense) as ChanXinMaBaseDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return ChanXinMaBaseDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         if(m_bServerIssued)
         {
            this.m_stTiemr.reset();
            this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
            this.play();
            this.refundRatio = ChanXinMaDefine.GetRefundRatio(a_1094);
         }
         return super.a_1797(stFieldGrid);
      }
      
      override protected function a_3964() : int
      {
         return ChanXinMaDefine.a_3964(m_iSkillDegree);
      }
      
      override public function a_3940() : Boolean
      {
         if(m_bServerIssued)
         {
            this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
            this.m_stTiemr.stop();
         }
         return super.a_3940();
      }
      
      public function play() : void
      {
         this.m_stTiemr.start();
      }
      
      private function a_4003(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == 8)
         {
            this.PrepareEnergySlots();
         }
         else if(a_1273 == 10)
         {
            this.ProdudeEnergyByWave(0);
         }
         else if(a_1273 == 12)
         {
            this.ProdudeEnergyByWave(1);
         }
         else if(a_1273 == 15)
         {
            this.ProdudeEnergyByWave(2);
         }
         if(a_1273 == a_1274)
         {
            a_3969(this.iLifeValue);
         }
      }
      
      private function PrepareEnergySlots() : void
      {
         var iAllEnergyValue:int = ChanXinMaDefine.CollectRefundEnergy(a_1334,1,this.refundRatio,false);
         if(iAllEnergyValue > ChanXinMaDefine.BASE_MAX_FIRE)
         {
            iAllEnergyValue = ChanXinMaDefine.BASE_MAX_FIRE;
         }
         if(iAllEnergyValue <= 0 || !a_1334 || !a_1334.m_stCurrentBattbleFieldView)
         {
            this.m_arrEnergyBySlot = null;
            return;
         }
         var iMaxCellCount:int = MAX_WAVE_COUNT * ENERGY_PER_WAVE;
         this.m_arrEnergyBySlot = [];
         for(var iInit:int = 0; iInit < iMaxCellCount; iInit++)
         {
            this.m_arrEnergyBySlot.push(0);
         }
         var iAvgEnergy:int = int(iAllEnergyValue / iMaxCellCount);
         var iRemainEnergy:* = int(iAllEnergyValue % iMaxCellCount);
         for(var iFillIndex:* = 0; iFillIndex < iMaxCellCount; iFillIndex++)
         {
            this.m_arrEnergyBySlot[iFillIndex] = iAvgEnergy;
         }
         for(iFillIndex = int(iMaxCellCount - 1); iFillIndex >= 0; iFillIndex--)
         {
            if(iRemainEnergy <= 0)
            {
               break;
            }
            this.m_arrEnergyBySlot[iFillIndex] += 1;
            iRemainEnergy--;
         }
      }
      
      private function ProdudeEnergyByWave(iWaveIndex:int) : void
      {
         var iSlotIndex:int = 0;
         var iProduceEnergy:int = 0;
         var stFreeEnergy:a_4157 = null;
         var posX:int = 0;
         var posY:int = 0;
         var iEnergyValue:int = 0;
         if(!this.m_arrEnergyBySlot || !a_1334 || !a_1334.m_stCurrentBattbleFieldView)
         {
            return;
         }
         var iStartIndex:int = iWaveIndex * ENERGY_PER_WAVE;
         for(var iIndex:int = 0; iIndex < ENERGY_PER_WAVE; iIndex++)
         {
            iSlotIndex = iStartIndex + iIndex;
            if(iSlotIndex >= this.m_arrEnergyBySlot.length || iIndex >= this.m_OutArray.length)
            {
               break;
            }
            iProduceEnergy = int(this.m_arrEnergyBySlot[iSlotIndex]);
            stFreeEnergy = a_4162.getInstance().a_4163(b_180.a_420);
            if(null != stFreeEnergy)
            {
               stFreeEnergy.m_stCurrentBattleField = a_1334.m_stCurrentBattbleFieldView;
               posX = x + int(this.m_OutArray[iIndex][0]);
               posY = y + int(this.m_OutArray[iIndex][1]);
               iEnergyValue = a_1334.m_stCurrentBattbleFieldView.isOwnBattleField ? iProduceEnergy : 5;
               stFreeEnergy.a_1797(0,iEnergyValue,posX,posY);
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

