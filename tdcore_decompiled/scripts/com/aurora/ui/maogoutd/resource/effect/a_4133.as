package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class a_4133 extends a_4108
   {
      
      public function a_4133()
      {
         super();
      }
      
      public static function a_3926() : a_4133
      {
         return PoolManager.getInstance().CheckOutOne(a_4133) as a_4133;
      }
      
      override protected function getBindMovie() : Class
      {
         return MouseComeUpEarthEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         return true;
      }
   }
}

