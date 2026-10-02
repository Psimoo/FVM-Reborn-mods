package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Buff.BattleBuffData;
   import com.aurora.ui.maogoutd.game.Buff.BattleBuffParams;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.maka.MakaBuffMovie;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class CoffeeWakeUpBeanSecondDefense extends a_3976
   {
      
      private static const AWAKE_BUFF_DURATION:int = 10 * 20;
      
      private var m_stTiemr:Timer;
      
      public function CoffeeWakeUpBeanSecondDefense()
      {
         a_1271 = true;
         super();
         a_1338 = -30;
         a_1095 = 0;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : CoffeeWakeUpBeanSecondDefense
      {
         return PoolManager.getInstance().CheckOutOne(CoffeeWakeUpBeanSecondDefense) as CoffeeWakeUpBeanSecondDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return CoffeeWakeUpBeanSecondDefenseMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         gotoAndStop(1);
         this.play();
         return super.a_1797(stFieldGrid);
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
      
      private function a_4003(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == a_1274)
         {
            this.WakeUpCardsInRange();
            if(this.parent)
            {
               this.parent.removeChild(this);
            }
            this.a_3940();
            return;
         }
      }
      
      private function WakeUpCardsInRange() : void
      {
         var xIndex:int = 0;
         var stFieldGrid:a_3491 = null;
         var xStart:int = Math.max(a_1334.m_iXGridNo - 1,0);
         var xEnd:int = Math.min(a_1334.m_iXGridNo + 1,BattleFieldView.a_1011 - 1);
         var yStart:int = Math.max(a_1334.m_iYGridNo - 1,0);
         var yEnd:int = Math.min(a_1334.m_iYGridNo + 1,BattleFieldView.a_1012 - 1);
         for(var yIndex:int = yStart; yIndex <= yEnd; yIndex++)
         {
            for(xIndex = xStart; xIndex <= xEnd; xIndex++)
            {
               stFieldGrid = a_1334.m_stCurrentBattbleFieldView.a_3438(xIndex,yIndex);
               if(null != stFieldGrid)
               {
                  this.WakeUpAndAddBuffToGrid(stFieldGrid);
               }
            }
         }
      }
      
      private function WakeUpAndAddBuffToGrid(stFieldGrid:a_3491) : void
      {
         if(stFieldGrid.m_stAttackFighter)
         {
            stFieldGrid.m_stAttackFighter.a_3970();
            this.AddAwakeBuff(stFieldGrid.m_stAttackFighter);
         }
         else if(stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3970();
            this.AddAwakeBuff(stFieldGrid.m_stBaseAuxiliaryFighter);
         }
         else if(stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.a_3970();
            this.AddAwakeBuff(stFieldGrid.m_stFlowerDefense);
         }
         else if(stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.a_3970();
            this.AddAwakeBuff(stFieldGrid.m_stBoomDefense);
         }
         else if(stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.a_3970();
            this.AddAwakeBuff(stFieldGrid.m_stProtector);
         }
      }
      
      private function AddAwakeBuff(defense:a_3962) : void
      {
         var params:BattleBuffParams = new BattleBuffParams();
         params.gameMoveClipClass = MakaBuffMovie;
         params.y = -4;
         params.x = defense.width * 0.5 - 15;
         params.offsetType = 0;
         var buffData:BattleBuffData = defense.buffCom.AddBuff(30002,AWAKE_BUFF_DURATION,params);
         if(buffData != null && buffData.stEffect != null)
         {
            stFieldGrid.m_stCurrentBattbleFieldView.AddToBattleView(buffData.stEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stFieldGrid);
         }
      }
   }
}

