package com.aurora.ui.maogoutd.resource.defender.PigYear.CatProtector
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   
   public class CatStoveSecondTransProtectorBackside extends a_3909
   {
      
      public function CatStoveSecondTransProtectorBackside()
      {
         super();
      }
      
      public static function a_3926() : CatStoveSecondTransProtectorBackside
      {
         return PoolManager.getInstance().CheckOutOne(CatStoveSecondTransProtectorBackside) as CatStoveSecondTransProtectorBackside;
      }
      
      override protected function getBindMovie() : Class
      {
         return CatStoveSecondTransProtectorBacksideMovie;
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

