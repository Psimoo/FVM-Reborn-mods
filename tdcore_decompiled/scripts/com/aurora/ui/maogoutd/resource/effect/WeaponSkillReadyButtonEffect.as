package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class WeaponSkillReadyButtonEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      public function WeaponSkillReadyButtonEffect()
      {
         super();
         this.m_stTiemr = new Timer(100);
         mouseEnabled = false;
      }
      
      public static function a_3926() : WeaponSkillReadyButtonEffect
      {
         return PoolManager.getInstance().CheckOutOne(WeaponSkillReadyButtonEffect) as WeaponSkillReadyButtonEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return WeaponSkillReadyButtonEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         gotoAndStop(1);
         this.play();
         return true;
      }
      
      public function a_3940() : Boolean
      {
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
            gotoAndStop(1);
         }
      }
   }
}

