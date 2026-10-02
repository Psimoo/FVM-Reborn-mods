package com.aurora.ui.maogoutd.resource.tools
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class a_4427 extends a_3909
   {
      
      private static var a_1627:Array = new Array();
      
      private var a_1562:Timer;
      
      private var a_1563:int = 0;
      
      private var m_isStoped:Boolean;
      
      public function a_4427()
      {
         super();
         this.a_1562 = new Timer(67);
         this.a_1562.addEventListener(TimerEvent.TIMER,this.a_4333);
         mouseEnabled = false;
      }
      
      public static function a_3926() : a_4427
      {
         return PoolManager.getInstance().CheckOutOne(a_4427) as a_4427;
      }
      
      override protected function getBindMovie() : Class
      {
         return MouseIntruderWaveAlertMovie;
      }
      
      public function a_1797() : Boolean
      {
         a_1272 = 0;
         this.visible = true;
         gotoAndStop(1);
         return true;
      }
      
      public function a_3940() : Boolean
      {
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      public function a_4332(iStartLabelIndex:uint) : void
      {
         if(iStartLabelIndex >= a_1276.length)
         {
            gotoAndStop((a_1276[0] as FrameLabel).frame);
         }
         else
         {
            gotoAndStop((a_1276[iStartLabelIndex] as FrameLabel).frame);
         }
         visible = true;
         this.a_1563 = 0;
         this.m_isStoped = false;
         this.a_1562.start();
      }
      
      private function a_4333(a_4730:Event) : void
      {
         if(!this.m_isStoped)
         {
            nextFrame();
         }
         ++this.a_1563;
         if(this.a_1563 > 30)
         {
            this.a_1562.stop();
            visible = false;
         }
         if(a_1278 != null)
         {
            this.m_isStoped = true;
            gotoAndStop(a_1273 - 1);
         }
         else if(a_1273 == a_1274)
         {
            this.m_isStoped = true;
         }
      }
   }
}

