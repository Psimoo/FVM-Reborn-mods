package com.aurora.ui.maogoutd.resource.defender.SnakeYear.snakeStew
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
   
   public class SnakeStewFirstTransDefense extends a_3976
   {
      
      private var m_stTiemr:Timer;
      
      private var m_iFireCount:int = 0;
      
      private var m_iMAXFireCount:int = 0;
      
      private var m_iEachFireCount:int = 0;
      
      private var m_OutArray:Array = new Array([-35,-78],[11,-80],[-18,-110]);
      
      public function SnakeStewFirstTransDefense()
      {
         a_1271 = true;
         super();
         a_1338 = -10;
         a_1095 = 0;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : SnakeStewFirstTransDefense
      {
         return PoolManager.getInstance().CheckOutOne(SnakeStewFirstTransDefense) as SnakeStewFirstTransDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return SnakeStewFirstTransDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         gotoAndStop(1);
         this.play();
         return super.a_1797(stFieldGrid);
      }
      
      override protected function a_3964() : int
      {
         return SnakeStewDefine.a_3964(a_1094);
      }
      
      override public function a_3940() : Boolean
      {
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
         return super.a_3940();
      }
      
      public function play() : void
      {
         this.m_stTiemr.start();
      }
      
      public function stop() : void
      {
         this.m_stTiemr.stop();
      }
      
      private function GetFireCount() : int
      {
         var id:int = 0;
         var iFireCount:int = 0;
         if(a_1334.m_stAttackFighter)
         {
            iFireCount += a_1334.m_stAttackFighter.GetRealPrice();
         }
         if(a_1334.m_stBaseAuxiliaryFighter)
         {
            iFireCount += a_1334.m_stBaseAuxiliaryFighter.GetRealPrice();
         }
         if(a_1334.m_stFlowerDefense)
         {
            iFireCount += a_1334.m_stFlowerDefense.GetRealPrice();
         }
         if(a_1334.m_stBoomDefense)
         {
            iFireCount += a_1334.m_stBoomDefense.GetRealPrice();
         }
         if(a_1334.m_stProtector)
         {
            iFireCount += a_1334.m_stProtector.GetRealPrice();
         }
         if(a_1334.m_stBaseToolDefense)
         {
            id = a_1334.m_stBaseToolDefense.a_3512();
            if(id != 288950080 && id != 288950094 && id != 288950095)
            {
               iFireCount += a_1334.m_stBaseToolDefense.GetRealPrice();
            }
         }
         return iFireCount;
      }
      
      private function ProdudeEnergy(pIndex:int) : void
      {
         var offect:int = 0;
         var stFreeEnergy:a_4157 = null;
         var iProduceEnergy:int = 0;
         var iEnergyValue:int = 0;
         if(this.m_iMAXFireCount <= 0)
         {
            return;
         }
         for(var iIndex:int = 0; iIndex < 2; iIndex++)
         {
            offect = iIndex == 1 ? 1 : -1;
            stFreeEnergy = a_4162.getInstance().a_4163(b_180.a_420);
            if(null != stFreeEnergy)
            {
               iProduceEnergy = 0;
               if(pIndex == 2 && iIndex == 1)
               {
                  iProduceEnergy = this.m_iFireCount;
                  this.m_iFireCount = 0;
               }
               else
               {
                  iProduceEnergy = this.m_iEachFireCount;
                  this.m_iFireCount -= this.m_iEachFireCount;
               }
               iEnergyValue = a_1334.m_stCurrentBattbleFieldView.isOwnBattleField ? iProduceEnergy : 5;
               stFreeEnergy.m_stCurrentBattleField = a_1334.m_stCurrentBattbleFieldView;
               stFreeEnergy.a_1797(0,iEnergyValue,x + this.m_OutArray[pIndex][0] + offect * 10,y + this.m_OutArray[pIndex][1]);
               stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(stFreeEnergy,BattleLayerDefine.EFFECTS_TOP_TYPE);
               setTimeout(this.onDispathEvent,500,stFreeEnergy);
            }
         }
      }
      
      private function a_4003(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == 2)
         {
            this.m_iMAXFireCount = this.m_iFireCount = this.GetFireCount();
            if(this.m_iFireCount > 0)
            {
               this.m_iEachFireCount = Math.ceil(this.m_iFireCount / 6);
            }
         }
         else if(a_1273 == 5)
         {
            this.ProdudeEnergy(0);
         }
         else if(a_1273 == 9)
         {
            this.ProdudeEnergy(1);
         }
         else if(a_1273 == 12)
         {
            this.ProdudeEnergy(2);
         }
         if(a_1273 == a_1274)
         {
            if(this.parent)
            {
               this.parent.removeChild(this);
            }
            this.a_3940();
            return;
         }
      }
      
      private function onDispathEvent(stFreeEnergy:a_4157) : void
      {
         stFreeEnergy.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_OVER));
      }
   }
}

