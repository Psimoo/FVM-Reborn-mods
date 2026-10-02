package com.aurora.ui.maogoutd.resource.pet
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.shot.PetGradeCShot;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class GradeCPet extends BasePet
   {
      
      public function GradeCPet()
      {
         super();
         a_1314 = true;
      }
      
      public static function a_3926() : BasePet
      {
         return PoolManager.getInstance().CheckOutOne(GradeCPet) as GradeCPet;
      }
      
      override protected function getBindMovie() : Class
      {
         return GradeCPetMovie;
      }
      
      override protected function a_4389() : a_4348
      {
         return PetGradeCShot.a_4344();
      }
   }
}

