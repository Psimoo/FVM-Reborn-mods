package com.aurora.ui.maogoutd.resource.defender
{
   import a_4718.b_180;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class FlameDoubleEnergyFirstTransFlower extends a_3971
   {
      
      public function FlameDoubleEnergyFirstTransFlower()
      {
         super();
         a_1343 = 500 - this.a_3965();
         a_1347 = 3;
         a_1335 = 65538;
         a_1095 = 150;
         a_1096 = true;
         a_1344 = b_180.a_420;
      }
      
      public static function a_3926() : a_3971
      {
         return PoolManager.getInstance().CheckOutOne(FlameDoubleEnergyFirstTransFlower) as FlameDoubleEnergyFirstTransFlower;
      }
      
      override protected function getBindMovie() : Class
      {
         return FlameDoubleEnergyFirstTransFlowerMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         a_1343 = 500 - this.a_3965();
         return super.a_1797(stFieldGrid);
      }
      
      override protected function a_3964() : int
      {
         return 500;
      }
      
      override public function a_3969(iRduceLifeValue:int) : Boolean
      {
         super.a_3969(iRduceLifeValue);
         return true;
      }
      
      override public function a_3957(iCurrentTime:int) : void
      {
         if(iCurrentTime % 3 == 0)
         {
            super.a_3957(iCurrentTime);
         }
      }
      
      override protected function a_3956() : Number
      {
         return 0.1 * height;
      }
      
      override protected function a_3965() : int
      {
         return 20 * a_1094;
      }
   }
}

