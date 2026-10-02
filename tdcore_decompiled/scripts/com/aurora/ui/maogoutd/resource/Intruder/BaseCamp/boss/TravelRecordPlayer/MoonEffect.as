package com.aurora.ui.maogoutd.resource.Intruder.BaseCamp.boss.TravelRecordPlayer
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class MoonEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public var stTargetFieldGrid:a_3491;
      
      private var m_iWaitTime:int;
      
      public function MoonEffect()
      {
         super();
         a_1279 = 0;
         m_iYDisplayCenterPos = 0;
      }
      
      public static function a_3926() : MoonEffect
      {
         return PoolManager.getInstance().CheckOutOne(MoonEffect) as MoonEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return MoonEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         this.m_iStartTime = 0;
         a_1275 = 0;
         return true;
      }
      
      public function get WaitTime() : int
      {
         return this.m_iWaitTime;
      }
      
      public function set WaitTime(iWaitTime:int) : void
      {
         this.m_iWaitTime = iWaitTime;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         if(a_1273 == a_1274)
         {
            a_3940();
         }
         ++this.m_iStartTime;
         if(this.m_iStartTime > this.m_iWaitTime * 10)
         {
            if(a_1275 != 1)
            {
               a_1275 = 1;
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
      }
   }
}

