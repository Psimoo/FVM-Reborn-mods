package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.laborDay
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class LaborBubbleEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      public function LaborBubbleEffect()
      {
         super();
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : LaborBubbleEffect
      {
         return PoolManager.getInstance().CheckOutOne(LaborBubbleEffect) as LaborBubbleEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return LaborBubbleEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         a_1279 = 2;
         m_iYDisplayCenterPos = 5;
         this.visible = true;
         gotoAndStop(1);
         this.m_stTiemr.start();
         this.SetAnimationOnce2Loop(0,1);
         return true;
      }
      
      public function PlayRelease() : void
      {
         this.SetAnimation(2);
      }
      
      public function a_3940() : Boolean
      {
         gotoAndStop(1);
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      private function a_4003(a_4730:Event) : void
      {
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(a_1273 == a_1274)
         {
            this.a_3940();
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

