package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class a_4075 extends a_3953
   {
      
      public function a_4075()
      {
         super();
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(a_4075) as a_4075;
      }
      
      override protected function getBindMovie() : Class
      {
         return a_4076;
      }
      
      override public function a_1797(stFieldGrid:a_3491) : Boolean
      {
         a_1339 = 25;
         return super.a_1797(stFieldGrid);
      }
      
      override protected function a_3956() : Number
      {
         return y + 0.3 * height;
      }
   }
}

