package com.aurora.ui.maogoutd.resource.pet
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.aurora.ui.maogoutd.resource.shot.a_4388;
   
   public class GradeSSPet extends BasePet
   {
      
      public function GradeSSPet()
      {
         super();
      }
      
      public static function a_3926() : BasePet
      {
         return PoolManager.getInstance().CheckOutOne(GradeSSPet) as GradeSSPet;
      }
      
      override protected function getBindMovie() : Class
      {
         return GradeSSPetMovie;
      }
      
      override protected function a_4389() : a_4348
      {
         return a_4388.getInstance().a_4389(b_183.b_184);
      }
   }
}

