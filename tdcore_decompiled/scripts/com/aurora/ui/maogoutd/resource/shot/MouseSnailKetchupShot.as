package com.aurora.ui.maogoutd.resource.shot
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class MouseSnailKetchupShot extends a_4348
   {
      
      public function MouseSnailKetchupShot()
      {
         super();
         a_1279 = 0;
         a_1576 = false;
         a_1577 = false;
         a_1575 = false;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(MouseSnailKetchupShot) as MouseSnailKetchupShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return MouseSnailKetchupShotMovie;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var stBaseMoveIntruder:a_4206 = null;
         if(iCurrentTime % 2 == 0 && a_1273 != a_1274)
         {
            nextFrame();
         }
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
         if(iCurrentTime - a_1447 > 200)
         {
            a_3940();
            return;
         }
         for each(stBaseMoveIntruder in a_1584.a_1511)
         {
            stBaseMoveIntruder.a_4208(b_182.a_436,6);
         }
      }
   }
}

