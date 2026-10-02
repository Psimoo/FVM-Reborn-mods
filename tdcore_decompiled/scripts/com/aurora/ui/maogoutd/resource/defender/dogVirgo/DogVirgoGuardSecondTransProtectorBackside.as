package com.aurora.ui.maogoutd.resource.defender.dogVirgo
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   
   public class DogVirgoGuardSecondTransProtectorBackside extends a_3909
   {
      
      public function DogVirgoGuardSecondTransProtectorBackside()
      {
         super();
      }
      
      public static function a_3926() : DogVirgoGuardSecondTransProtectorBackside
      {
         return PoolManager.getInstance().CheckOutOne(DogVirgoGuardSecondTransProtectorBackside) as DogVirgoGuardSecondTransProtectorBackside;
      }
      
      override protected function getBindMovie() : Class
      {
         return DogVirgoGuardSecondTransProtectorBacksideMovie;
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

