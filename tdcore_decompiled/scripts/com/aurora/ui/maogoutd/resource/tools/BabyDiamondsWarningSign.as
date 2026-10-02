package com.aurora.ui.maogoutd.resource.tools
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   
   public class BabyDiamondsWarningSign extends a_3909
   {
      
      public function BabyDiamondsWarningSign()
      {
         super();
      }
      
      public static function a_3926() : BabyDiamondsWarningSign
      {
         return PoolManager.getInstance().CheckOutOne(BabyDiamondsWarningSign) as BabyDiamondsWarningSign;
      }
      
      override protected function getBindMovie() : Class
      {
         return BabyDiamondsWarningSignMovie;
      }
      
      public function a_1797() : Boolean
      {
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

