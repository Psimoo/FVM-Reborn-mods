package com.aurora.ui.maogoutd.resource.shot
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class SausageHighAdvanceShot extends a_4348
   {
      
      public var m_isHighShot:Boolean;
      
      public function SausageHighAdvanceShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1573 = 1;
         a_1574 = 100;
         a_1576 = false;
         a_1577 = false;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         var stSausageHighAdvanceShot:SausageHighAdvanceShot = PoolManager.getInstance().CheckOutOne(SausageHighAdvanceShot) as SausageHighAdvanceShot;
         stSausageHighAdvanceShot.m_isShotHighSkySpace = false;
         return stSausageHighAdvanceShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return SausageHighAdvanceShotMovie;
      }
   }
}

