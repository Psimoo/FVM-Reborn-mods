package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class IronManLaserBombEffect extends a_3909
   {
      
      private var a_1109:Timer;
      
      public function IronManLaserBombEffect()
      {
         super();
         this.a_1109 = new Timer(50);
         this.a_1109.addEventListener(TimerEvent.TIMER,this.a_4109);
      }
      
      public static function a_3926() : IronManLaserBombEffect
      {
         return PoolManager.getInstance().CheckOutOne(IronManLaserBombEffect) as IronManLaserBombEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return IronManLaserBombEffectMovie;
      }
      
      public function a_1797(isReversed:Boolean) : Boolean
      {
         a_1283 = isReversed;
         visible = true;
         gotoAndStop(1);
         this.stop();
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
      
      public function a_3940() : Boolean
      {
         this.stop();
         gotoAndStop(1);
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == a_1274)
         {
            this.a_3940();
         }
      }
   }
}

