package com.aurora.ui.maogoutd.resource.shot
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class PetGradeDShot extends a_4348
   {
      
      public function PetGradeDShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1573 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(PetGradeDShot) as PetGradeDShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return PetGradeDShotMovie;
      }
   }
}

