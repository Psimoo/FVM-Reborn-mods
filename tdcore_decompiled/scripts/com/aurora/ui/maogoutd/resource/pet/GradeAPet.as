package com.aurora.ui.maogoutd.resource.pet
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.shot.PetGradeAShot;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class GradeAPet extends BasePet
   {
      
      public function GradeAPet()
      {
         super();
      }
      
      public static function a_3926() : BasePet
      {
         return PoolManager.getInstance().CheckOutOne(GradeAPet) as GradeAPet;
      }
      
      override protected function getBindMovie() : Class
      {
         return GradeAPetMovie;
      }
      
      override public function a_1797() : Boolean
      {
         super.a_1797();
         a_1312 = 15;
         a_1310 = 10;
         a_1311 = this.a_3965();
         a_1309 = 60;
         return true;
      }
      
      override protected function a_4389() : a_4348
      {
         return PetGradeAShot.a_4344();
      }
      
      override protected function a_3965() : int
      {
         var _loc_1:int = 100;
         if(a_1094 == 1)
         {
            _loc_1 = 100;
         }
         else if(a_1094 == 2)
         {
            _loc_1 = 120;
         }
         else if(a_1094 == 3)
         {
            _loc_1 = 140;
         }
         else if(a_1094 == 4)
         {
            _loc_1 = 170;
         }
         else if(a_1094 == 5)
         {
            _loc_1 = 200;
         }
         else if(a_1094 == 6)
         {
            _loc_1 = 230;
         }
         else if(a_1094 == 7)
         {
            _loc_1 = 270;
         }
         else if(a_1094 == 8)
         {
            _loc_1 = 310;
         }
         else if(a_1094 == 9)
         {
            _loc_1 = 350;
         }
         else if(a_1094 >= 10)
         {
            _loc_1 = 390;
         }
         return _loc_1;
      }
   }
}

