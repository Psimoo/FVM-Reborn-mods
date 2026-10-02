package com.aurora.ui.maogoutd.resource.shot
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class a_4380 extends a_4348
   {
      
      public function a_4380()
      {
         super();
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(a_4380) as a_4380;
      }
      
      override protected function getBindMovie() : Class
      {
         return a_4381;
      }
   }
}

