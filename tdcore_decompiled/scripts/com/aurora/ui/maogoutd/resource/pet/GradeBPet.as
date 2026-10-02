package com.aurora.ui.maogoutd.resource.pet
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.shot.PetGradeBShot;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class GradeBPet extends BasePet
   {
      
      public function GradeBPet()
      {
         super();
      }
      
      public static function a_3926() : BasePet
      {
         return PoolManager.getInstance().CheckOutOne(GradeBPet) as GradeBPet;
      }
      
      override protected function getBindMovie() : Class
      {
         return GradeBPetMovie;
      }
      
      override public function a_1797() : Boolean
      {
         super.a_1797();
         a_1313 = true;
         a_1310 = 14;
         a_1316 = true;
         a_1317 = 2;
         return true;
      }
      
      override protected function a_4389() : a_4348
      {
         return PetGradeBShot.a_4344();
      }
   }
}

