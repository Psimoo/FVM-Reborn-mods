package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import flash.events.Event;
   
   public class MouseSecondEarthHole extends a_4135
   {
      
      public function MouseSecondEarthHole()
      {
         super();
         m_iYDisplayCenterPos = 1;
         a_1279 = 3;
      }
      
      public static function a_3926() : MouseSecondEarthHole
      {
         return PoolManager.getInstance().CheckOutOne(MouseSecondEarthHole) as MouseSecondEarthHole;
      }
      
      override protected function getBindMovie() : Class
      {
         return MouseSecondEarthHoleMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         return super.a_1797(isReversed);
      }
      
      override public function a_3940() : Boolean
      {
         gotoAndStop(1);
         stop();
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == a_1274)
         {
            stop();
         }
      }
   }
}

