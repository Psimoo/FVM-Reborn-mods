package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class FloorCrackEffect extends a_4108
   {
      
      public function FloorCrackEffect()
      {
         super();
      }
      
      public static function a_3926() : FloorCrackEffect
      {
         return PoolManager.getInstance().CheckOutOne(FloorCrackEffect) as FloorCrackEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return FloorCrackEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         return super.a_1797(isReversed);
      }
   }
}

