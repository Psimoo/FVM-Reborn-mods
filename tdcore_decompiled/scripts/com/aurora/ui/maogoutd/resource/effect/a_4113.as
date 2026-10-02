package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.events.Event;
   
   public class a_4113 extends a_3909
   {
      
      public function a_4113()
      {
         a_1271 = true;
         super();
      }
      
      public static function a_3926() : a_4113
      {
         return PoolManager.getInstance().CheckOutOne(a_4113) as a_4113;
      }
      
      override protected function getBindMovie() : Class
      {
         return DizzinessStarMovie;
      }
      
      public function a_1797(isReseaved:Boolean = false) : Boolean
      {
         a_1283 = isReseaved;
         this.visible = true;
         gotoAndStop(1);
         return true;
      }
      
      public function a_3940() : Boolean
      {
         gotoAndStop(1);
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      public function a_4003(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == a_1274)
         {
            gotoAndStop(1);
         }
      }
   }
}

