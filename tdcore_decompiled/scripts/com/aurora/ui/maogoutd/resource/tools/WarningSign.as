package com.aurora.ui.maogoutd.resource.tools
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class WarningSign extends a_3909
   {
      
      private static const END_TICK:int = 8;
      
      private var a_1109:Timer;
      
      private var m_iContinueTick:int;
      
      public function WarningSign()
      {
         super();
         this.a_1109 = new Timer(100);
         this.a_1109.addEventListener(TimerEvent.TIMER,this.a_4109);
      }
      
      public static function a_3926() : WarningSign
      {
         return PoolManager.getInstance().CheckOutOne(WarningSign) as WarningSign;
      }
      
      public function a_3940() : Boolean
      {
         this.stop();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      override protected function getBindMovie() : Class
      {
         return WarningSignMovie;
      }
      
      public function a_1797(isReversed:Boolean, iContinueTick:int = -1, iDelay:int = 100) : Boolean
      {
         this.stop();
         a_1283 = isReversed;
         this.m_iContinueTick = iContinueTick;
         if(this.m_iContinueTick < a_1274)
         {
            this.m_iContinueTick = a_1274 - 1;
         }
         this.a_1109.delay = iDelay;
         visible = true;
         gotoAndStop(1);
         this.play();
         return true;
      }
      
      public function play() : void
      {
         this.a_1109.start();
      }
      
      public function stop() : void
      {
         this.a_1109.stop();
      }
      
      protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         --this.m_iContinueTick;
         if(this.m_iContinueTick > END_TICK && null != a_1278)
         {
            gotoAndStop(1);
         }
         else if(a_1273 == a_1274)
         {
            this.a_3940();
         }
      }
   }
}

