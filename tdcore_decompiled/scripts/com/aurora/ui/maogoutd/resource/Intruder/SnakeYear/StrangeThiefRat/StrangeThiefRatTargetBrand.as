package com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.StrangeThiefRat
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   
   public class StrangeThiefRatTargetBrand extends a_3909
   {
      
      public function StrangeThiefRatTargetBrand()
      {
         super();
      }
      
      public static function a_3926() : StrangeThiefRatTargetBrand
      {
         return PoolManager.getInstance().CheckOutOne(StrangeThiefRatTargetBrand) as StrangeThiefRatTargetBrand;
      }
      
      override protected function getBindMovie() : Class
      {
         return StrangeThiefRatTargetBrandMovie;
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
   }
}

