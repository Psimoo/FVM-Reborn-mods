package com.aurora.ui.maogoutd.resource.shot
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class a_4385 extends a_4348
   {
      
      public var m_isHighShot:Boolean;
      
      public function a_4385()
      {
         super();
         a_1279 = -width * 0.5;
         a_1304 = b_183.b_191;
         a_1573 = 1;
         a_1576 = false;
         a_1577 = false;
      }
      
      public static function a_4344() : a_4348
      {
         var stSausageHighShot:a_4385 = PoolManager.getInstance().CheckOutOne(a_4385) as a_4385;
         stSausageHighShot.m_isShotHighSkySpace = false;
         return stSausageHighShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return SausageHighShotMovie;
      }
   }
}

