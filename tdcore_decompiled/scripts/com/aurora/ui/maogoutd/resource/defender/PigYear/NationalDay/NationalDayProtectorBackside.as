package com.aurora.ui.maogoutd.resource.defender.PigYear.NationalDay
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   
   public class NationalDayProtectorBackside extends a_3909
   {
      
      public function NationalDayProtectorBackside()
      {
         super();
      }
      
      public static function a_3926() : NationalDayProtectorBackside
      {
         return PoolManager.getInstance().CheckOutOne(NationalDayProtectorBackside) as NationalDayProtectorBackside;
      }
      
      override protected function getBindMovie() : Class
      {
         return NationalDayProtectorBacksideMovie;
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

