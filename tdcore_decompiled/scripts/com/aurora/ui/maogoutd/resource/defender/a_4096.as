package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   
   public class a_4096 extends a_3909
   {
      
      public function a_4096()
      {
         super();
      }
      
      public static function a_3926() : a_4096
      {
         return PoolManager.getInstance().CheckOutOne(a_4096) as a_4096;
      }
      
      override protected function getBindMovie() : Class
      {
         return WatermelonGuardProtectorBacksideMovie;
      }
      
      public function a_1797(isReserved:Boolean) : Boolean
      {
         this.visible = true;
         a_1283 = isReserved;
         a_1275 = 1;
         gotoAndStop(1);
         return true;
      }
      
      public function a_3940() : Boolean
      {
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
   }
}

