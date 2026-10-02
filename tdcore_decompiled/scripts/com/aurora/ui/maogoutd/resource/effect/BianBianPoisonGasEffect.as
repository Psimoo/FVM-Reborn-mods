package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class BianBianPoisonGasEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      private var m_iStartTime:int;
      
      public function BianBianPoisonGasEffect()
      {
         super();
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : BianBianPoisonGasEffect
      {
         return PoolManager.getInstance().CheckOutOne(BianBianPoisonGasEffect) as BianBianPoisonGasEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return BianBianPoisonGasEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         gotoAndStop(1);
         this.play();
         this.m_iStartTime = 0;
         a_1275 = 1;
         return true;
      }
      
      protected function a_3940() : Boolean
      {
         this.visible = false;
         gotoAndStop(1);
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
         if(Boolean(parent) && parent.contains(this))
         {
            parent.removeChild(this);
         }
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      public function RealeaseNow() : Boolean
      {
         return this.a_3940();
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
         ++this.m_iStartTime;
         if(this.m_iStartTime > 0)
         {
            nextFrame();
            if(a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         if(this.m_iStartTime > 20)
         {
            a_1275 = 2;
         }
         if(a_1273 == a_1274)
         {
            this.a_3940();
         }
      }
   }
}

