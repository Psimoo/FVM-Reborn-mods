package com.aurora.ui.maogoutd.resource.shot
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   
   public class a_4397 extends a_4348
   {
      
      private static var a_1608:Array = new Array();
      
      public function a_4397()
      {
         super();
         a_1279 = -width * 0.5;
         a_1304 = b_183.b_197;
         a_1573 = 1;
         a_1576 = false;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(a_4397) as a_4397;
      }
      
      override protected function getBindMovie() : Class
      {
         return ThreeRowShotMovie;
      }
   }
}

