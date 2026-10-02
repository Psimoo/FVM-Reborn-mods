package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.WorldBoss
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class FastFoodChangeStepEffect extends a_3909
   {
      
      private var m_stTiemr:Timer;
      
      public function FastFoodChangeStepEffect()
      {
         super();
         a_1279 = 0;
         m_iYDisplayCenterPos = 0;
         this.m_stTiemr = new Timer(100);
      }
      
      public static function a_3926() : FastFoodChangeStepEffect
      {
         return PoolManager.getInstance().CheckOutOne(FastFoodChangeStepEffect) as FastFoodChangeStepEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return FastFoodChangeStepEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean) : Boolean
      {
         a_1283 = isReseaved;
         a_1271 = true;
         this.m_stTiemr.addEventListener(TimerEvent.TIMER,this.a_4003);
         a_1275 = 0;
         this.visible = true;
         gotoAndStop(1);
         this.play();
         this.SetAnimation2(0);
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
      
      public function SetAnimationOnce2Loop2(onceAnimIdx:int, loopAnimIdx:int) : void
      {
         a_1275 = loopAnimIdx;
         gotoAndStop((a_1276[onceAnimIdx] as FrameLabel).frame);
         a_3419();
      }
      
      public function Change2Step2() : void
      {
         this.SetAnimationOnce2Loop2(1,2);
      }
      
      public function Change2Step3() : void
      {
         this.SetAnimationOnce2Loop2(3,4);
      }
      
      private function a_4003(a_4730:Event) : void
      {
         visible = !(a_1273 == 0 || a_1273 == 1 || a_1273 == 16 || a_1273 == 17 || a_1273 == 35 || a_1273 == 36);
         nextFrame();
         if(a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
      }
      
      public function SetAnimation2(animIdx:int) : void
      {
         if(a_1275 != animIdx)
         {
            a_1275 = animIdx;
            gotoAndStop((a_1276[animIdx] as FrameLabel).frame);
            a_3419();
         }
      }
   }
}

