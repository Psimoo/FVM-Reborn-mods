package com.aurora.ui.maogoutd.resource.shot
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class a_4345 extends a_4348
   {
      
      public function a_4345()
      {
         super();
         a_1279 = -width * 0.5;
         a_1304 = b_183.b_184;
         a_1573 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(a_4345) as a_4345;
      }
      
      override protected function getBindMovie() : Class
      {
         return BaoZhiShotMovie;
      }
   }
}

