package com.aurora.ui.maogoutd.resource.defender
{
   import a_4718.b_180;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class a_4069 extends a_3971
   {
      
      public function a_4069()
      {
         super();
         a_1343 = 500;
         a_1095 = 25;
         a_1344 = b_180.a_420;
         a_1345 = 15;
      }
      
      public static function a_3926() : a_3971
      {
         return PoolManager.getInstance().CheckOutOne(a_4069) as a_4069;
      }
      
      override protected function getBindMovie() : Class
      {
         return NightCandleEnergyFlowerMovie;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         a_1343 = 500 - a_3965();
         return super.a_1797(stFieldGrid);
      }
      
      override protected function a_3964() : int
      {
         return 70;
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
      
      override protected function a_3955() : Number
      {
         return width * 0.4;
      }
      
      override protected function a_3956() : Number
      {
         return -0.2 * height;
      }
   }
}

