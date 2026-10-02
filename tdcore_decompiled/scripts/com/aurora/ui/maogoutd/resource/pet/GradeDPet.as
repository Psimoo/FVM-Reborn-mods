package com.aurora.ui.maogoutd.resource.pet
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.shot.PetGradeDShot;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class GradeDPet extends BasePet
   {
      
      public function GradeDPet()
      {
         super();
      }
      
      public static function a_3926() : BasePet
      {
         return PoolManager.getInstance().CheckOutOne(GradeDPet) as GradeDPet;
      }
      
      override protected function getBindMovie() : Class
      {
         return GradeDPetMovie;
      }
      
      override protected function a_4389() : a_4348
      {
         return PetGradeDShot.a_4344();
      }
   }
}

