package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.BurgerKingBoss
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class BurgerkingThinkEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      private var m_iAnimIdx:int = 0;
      
      private var m_iTick:int = 0;
      
      public function BurgerkingThinkEffect()
      {
         super();
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : BurgerkingThinkEffect
      {
         return PoolManager.getInstance().CheckOutOne(BurgerkingThinkEffect) as BurgerkingThinkEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return BurgerkingThinkEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean, iAnimIdx:int) : Boolean
      {
         this.m_iTick = 10 * 2;
         this.m_iAnimIdx = iAnimIdx;
         a_1283 = isReseaved;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         gotoAndStop(iAnimIdx * 6 + 1);
         this.play();
         return true;
      }
      
      protected function a_3940() : Boolean
      {
         this.visible = false;
         gotoAndStop(1);
         this.m_stTiemr.removeEventListener(TimerEvent.TIMER,this.a_4003);
         this.m_stTiemr.stop();
         PoolManager.getInstance().CheckInOne(this);
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
         return true;
      }
      
      public function play() : void
      {
         this.m_stTiemr.start();
      }
      
      public function stop() : void
      {
         this.m_stTiemr.stop();
         this.a_3940();
      }
      
      private function a_4003(a_4730:Event) : void
      {
         nextFrame();
         --this.m_iTick;
         if(a_1273 == a_1274 || a_1278 != null)
         {
            gotoAndStop((a_1276[this.m_iAnimIdx] as FrameLabel).frame);
         }
         if(this.m_iTick <= 0)
         {
            this.a_3940();
         }
      }
   }
}

