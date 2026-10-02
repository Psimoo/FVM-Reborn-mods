package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class a_4122 extends a_3909
   {
      
      private var a_1109:Timer = new Timer(100);
      
      public function a_4122()
      {
         a_1271 = true;
         super();
         this.a_1109.addEventListener(TimerEvent.TIMER,this.a_4003);
      }
      
      public static function a_3926() : a_4122
      {
         return PoolManager.getInstance().CheckOutOne(a_4122) as a_4122;
      }
      
      override protected function getBindMovie() : Class
      {
         return FlyBossStrafeShotEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean = false) : Boolean
      {
         a_1283 = isReseaved;
         this.visible = true;
         gotoAndStop(1);
         this.a_1109.start();
         return true;
      }
      
      public function a_3940() : Boolean
      {
         gotoAndStop(1);
         PoolManager.getInstance().CheckInOne(this);
         this.a_1109.stop();
         return true;
      }
      
      public function a_4003(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == a_1274)
         {
            this.a_3940();
         }
      }
   }
}

