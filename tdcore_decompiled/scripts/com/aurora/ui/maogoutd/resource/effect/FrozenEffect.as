package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class FrozenEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      private var m_iStartTime:int;
      
      public function FrozenEffect()
      {
         super();
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : FrozenEffect
      {
         return PoolManager.getInstance().CheckOutOne(FrozenEffect) as FrozenEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return FrozenEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
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
         if(0 == this.m_iStartTime)
         {
            gotoAndStop((a_1276[0] as FrameLabel).frame);
         }
         else if(6 == this.m_iStartTime)
         {
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         else if(this.m_iStartTime > 6 && this.m_iStartTime < 44 && (a_1276[2] as FrameLabel).frame == a_1273 + 1)
         {
            gotoAndStop((a_1276[1] as FrameLabel).frame);
         }
         else if(44 == this.m_iStartTime)
         {
            gotoAndStop((a_1276[2] as FrameLabel).frame);
         }
         else
         {
            nextFrame();
         }
         if(this.m_iStartTime > 50)
         {
            this.a_3940();
         }
         ++this.m_iStartTime;
      }
   }
}

