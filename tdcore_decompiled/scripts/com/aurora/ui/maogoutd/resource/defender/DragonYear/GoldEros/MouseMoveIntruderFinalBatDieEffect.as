package com.aurora.ui.maogoutd.resource.defender.DragonYear.GoldEros
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class MouseMoveIntruderFinalBatDieEffect extends a_3909
   {
      
      private static var ms_stMouseMoveIntruderFinalBatDieEffectVector:Array = new Array();
      
      private var m_stTiemr:Timer;
      
      public function MouseMoveIntruderFinalBatDieEffect()
      {
         super();
         this.m_stTiemr = new Timer(100);
         a_1279 = -18;
         m_iYDisplayCenterPos = -8;
      }
      
      public static function a_3926() : MouseMoveIntruderFinalBatDieEffect
      {
         return PoolManager.getInstance().CheckOutOne(MouseMoveIntruderFinalBatDieEffect) as MouseMoveIntruderFinalBatDieEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return MouseMoveIntruderFinalBatDieEffectMovie;
      }
      
      public function a_1797(isReversed:Boolean) : Boolean
      {
         a_1283 = isReversed;
         a_1272 = 0;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         gotoAndStop(1);
         this.play();
         return true;
      }
      
      protected function a_3940() : Boolean
      {
         this.visible = false;
         gotoAndStop(1);
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
         PoolManager.getInstance().CheckInOne(this);
         if(Boolean(parent) && parent.contains(this))
         {
            parent.removeChild(this);
         }
         return true;
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
            this.a_3940();
            return;
         }
      }
   }
}

