package com.aurora.ui.maogoutd.resource.defender.doubleHuan
{
   import a_4728.a_1778;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.defender.a_3976;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class DoubleHuanCoolDownDefense extends a_3976
   {
      
      private var m_stTiemr:Timer;
      
      public function DoubleHuanCoolDownDefense()
      {
         a_1271 = true;
         super();
         a_1095 = DoubleHuanDefine.DEFENSE_PRICE;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : DoubleHuanCoolDownDefense
      {
         return PoolManager.getInstance().CheckOutOne(DoubleHuanCoolDownDefense) as DoubleHuanCoolDownDefense;
      }
      
      override protected function getBindMovie() : Class
      {
         return DoubleHuanCoolDownDefenseMovie;
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
         return DoubleHuanDefine.a_3964(a_1094);
      }
      
      override public function a_3940() : Boolean
      {
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
         m_iBeOtherPlaced = false;
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
         var stAurDataEvent:a_1778 = null;
         nextFrame();
         if(a_1273 == a_1274)
         {
            if(Boolean(a_1334.m_stCurrentBattbleFieldView.isOwnBattleField) && Boolean(root) && !m_iBeOtherPlaced)
            {
               stAurDataEvent = new a_1778("GameCardCopy");
               stAurDataEvent.dataObject = a_1334.m_iInitialXGridNo + "_" + a_1334.m_iInitialYGridNo + "_" + m_iPlaceTimeIntervals;
               root.dispatchEvent(stAurDataEvent);
            }
            if(this.parent)
            {
               this.parent.removeChild(this);
            }
            this.a_3940();
            return;
         }
      }
      
      override protected function a_3965() : int
      {
         return DoubleHuanDefine.a_3965(a_1094);
      }
   }
}

