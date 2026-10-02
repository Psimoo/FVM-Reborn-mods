package com.aurora.ui.maogoutd.resource.defender.SnakeYear.mageSnake
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class MageSnakeIntruderPoisonEffect extends a_3909
   {
      
      public var stTargetMouveIntruder:a_4206;
      
      private var m_stTiemr:Timer;
      
      public function MageSnakeIntruderPoisonEffect()
      {
         a_1271 = true;
         super();
         this.m_stTiemr = new Timer(100);
         a_1279 = -16;
         m_iYDisplayCenterPos = -20;
      }
      
      public static function a_3926() : MageSnakeIntruderPoisonEffect
      {
         return PoolManager.getInstance().CheckOutOne(MageSnakeIntruderPoisonEffect) as MageSnakeIntruderPoisonEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return MageSnakeIntruderPoisonEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean = false) : Boolean
      {
         a_1283 = isReseaved;
         this.visible = true;
         gotoAndStop(1);
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.play();
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
      
      public function a_4003(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == a_1274)
         {
            this.a_3940();
         }
      }
      
      public function a_3940() : Boolean
      {
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
         gotoAndStop(1);
         if(this.stTargetMouveIntruder != null && Boolean(this.stTargetMouveIntruder.m_stSnakePoisonEffect))
         {
            this.stTargetMouveIntruder.m_stSnakePoisonEffect = null;
            this.stTargetMouveIntruder = null;
         }
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
   }
}

