package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class Earthquake extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      private var m_iStartTime:int;
      
      public function Earthquake()
      {
         super();
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : Earthquake
      {
         return PoolManager.getInstance().CheckOutOne(Earthquake) as Earthquake;
      }
      
      override protected function getBindMovie() : Class
      {
         return EarthquakeMovie;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         scaleX = 1.6;
         scaleY = 1.6;
         this.visible = true;
         a_1275 = 0;
         gotoAndStop((a_1276[0] as FrameLabel).frame);
         this.play();
         this.m_iStartTime = 0;
         return true;
      }
      
      protected function a_3940() : Boolean
      {
         this.visible = false;
         a_1275 = 0;
         gotoAndStop((a_1276[0] as FrameLabel).frame);
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
         }
      }
   }
}

