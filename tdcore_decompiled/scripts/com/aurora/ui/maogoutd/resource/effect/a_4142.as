package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class a_4142 extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      public function a_4142()
      {
         super();
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : a_4142
      {
         return PoolManager.getInstance().CheckOutOne(a_4142) as a_4142;
      }
      
      override protected function getBindMovie() : Class
      {
         return PlacementEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean = false) : Boolean
      {
         a_1283 = isReseaved;
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

