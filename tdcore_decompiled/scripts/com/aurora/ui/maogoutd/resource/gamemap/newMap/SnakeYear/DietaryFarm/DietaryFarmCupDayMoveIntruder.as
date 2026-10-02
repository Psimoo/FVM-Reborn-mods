package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.DietaryFarm
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class DietaryFarmCupDayMoveIntruder extends DietaryFarmCupMoveIntruder
   {
      
      public function DietaryFarmCupDayMoveIntruder()
      {
         super();
      }
      
      public static function a_3926() : DietaryFarmCupDayMoveIntruder
      {
         return PoolManager.getInstance().CheckOutOne(DietaryFarmCupDayMoveIntruder) as DietaryFarmCupDayMoveIntruder;
      }
      
      override protected function getBindMovie() : Class
      {
         return DietaryFarmCupDayMoveIntruderMovie;
      }
      
      override public function a_3940() : Boolean
      {
         PoolManager.getInstance().CheckInOne(this);
         super.a_3940();
         return true;
      }
   }
}

