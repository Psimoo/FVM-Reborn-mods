package com.aurora.ui.maogoutd.resource.Intruder.DragonYear.GiantIron
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class GiantIronSkillUpEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      private var m_iTick:int = 0;
      
      public function GiantIronSkillUpEffect()
      {
         super();
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : GiantIronSkillUpEffect
      {
         return PoolManager.getInstance().CheckOutOne(GiantIronSkillUpEffect) as GiantIronSkillUpEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return GiantIronSkillUpEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         this.m_iTick = 10 * 2;
         a_1283 = isReseaved;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         this.visible = true;
         gotoAndStop(1);
         this.SetFrameIndex2(0,1);
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
      
      public function SetFrameIndex(frame:int) : void
      {
         if(a_1275 != frame)
         {
            a_1275 = frame;
            gotoAndStop((a_1276[frame] as FrameLabel).frame);
         }
      }
      
      public function SetFrameIndex2(once:int, loop:int) : void
      {
         a_1275 = loop;
         gotoAndStop((a_1276[once] as FrameLabel).frame);
      }
      
      private function a_4003(a_4730:Event) : void
      {
         nextFrame();
         --this.m_iTick;
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(a_1273 == a_1274)
         {
            this.a_3940();
         }
         if(this.m_iTick <= 0)
         {
            this.SetFrameIndex(2);
         }
      }
   }
}

