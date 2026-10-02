package com.aurora.ui.maogoutd.resource.wave
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class a_4454 extends a_4450
   {
      
      public function a_4454()
      {
         super();
      }
      
      public static function a_3926() : a_4454
      {
         var wave:a_4454 = null;
         wave = PoolManager.getInstance().CheckOutOne(a_4454,TwoRowWaterWaveMovie) as a_4454;
         wave.x = 0;
         wave.y = 0;
         return wave;
      }
   }
}

