package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.DietaryFarm
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class DietaryFarmCupNightMoveIntruder extends DietaryFarmCupMoveIntruder
   {
      
      public function DietaryFarmCupNightMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : DietaryFarmCupNightMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(DietaryFarmCupNightMoveIntruder) as DietaryFarmCupNightMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return DietaryFarmCupNightMoveIntruderMovie;
      }
      
      override public function a_3940() : Boolean
      {
         PoolManager.getInstance().CheckInOne(this);
         super.a_3940();
         return true;
      }
   }
}

