package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.CrossServerMouse.ShadowMouse
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class SmallWhirlwindEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      private var _visible:Boolean = false;
      
      public function SmallWhirlwindEffect()
      {
         super();
         this.m_stTiemr = new Timer(80);
      }
      
      public static function a_3926() : SmallWhirlwindEffect
      {
         return PoolManager.getInstance().CheckOutOne(SmallWhirlwindEffect) as SmallWhirlwindEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return SmallWhirlwindEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         m_iYDisplayCenterPos = 24;
         a_1279 = -64;
         this.play();
         return true;
      }
      
      public function a_3940() : Boolean
      {
         this.stop();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      public function play() : void
      {
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.start();
         this.visible = true;
         gotoAndStop(1);
         this.SetAnimation(0);
      }
      
      public function stop() : void
      {
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
         this.visible = false;
         gotoAndStop(1);
      }
      
      private function a_4003(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == a_1274)
         {
            gotoAndStop(1);
         }
      }
      
      public function SetAnimation(frame:int) : void
      {
         if(a_1275 != frame)
         {
            a_1275 = frame;
            gotoAndStop((a_1276[frame] as FrameLabel).frame);
         }
      }
      
      public function SetAnimationOnce2Loop(once:int, loop:int) : void
      {
         a_1275 = loop;
         gotoAndStop((a_1276[once] as FrameLabel).frame);
      }
   }
}

