package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class a_4117 extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      protected var a_1407:a_3953;
      
      protected var a_1408:a_4206;
      
      public function a_4117()
      {
         super();
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : a_4117
      {
         return PoolManager.getInstance().CheckOutOne(a_4117) as a_4117;
      }
      
      override protected function getBindMovie() : Class
      {
         return DropWaterSprayMovie;
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
      
      public function a_4118(stAttackFighter:a_3953, stMoveIntruder:a_4206) : Boolean
      {
         this.a_1407 = stAttackFighter;
         this.a_1408 = stMoveIntruder;
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
         if(Boolean(this.a_1407 && this.a_1408) && Boolean(a_1273 >= 4) && a_1273 <= 6)
         {
            this.a_1407.y += 2;
            this.a_1408.y += 2;
         }
         if(a_1273 == a_1274)
         {
            if(Boolean(this.a_1408) && this.a_1408.visible)
            {
               this.a_1408.m_DropDieType = 1;
               this.a_1408.a_4212();
               this.a_1408.m_DropDieType = 0;
            }
            if(Boolean(this.a_1407) && this.a_1407.visible)
            {
               this.a_1407.a_3969(this.a_1407.iLifeValue);
            }
            this.a_3940();
            return;
         }
      }
   }
}

