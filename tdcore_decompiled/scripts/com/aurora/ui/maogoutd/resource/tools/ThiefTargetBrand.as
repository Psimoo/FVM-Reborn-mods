package com.aurora.ui.maogoutd.resource.tools
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   
   public class ThiefTargetBrand extends a_3909
   {
      
      public function ThiefTargetBrand()
      {
         super();
      }
      
      public static function a_3926() : ThiefTargetBrand
      {
         return PoolManager.getInstance().CheckOutOne(ThiefTargetBrand) as ThiefTargetBrand;
      }
      
      override protected function getBindMovie() : Class
      {
         return ThiefTargetBrandMovie;
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

