package com.aurora.ui.maogoutd.resource.shot
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   
   public class ElectricBatonLightingShot extends a_4348
   {
      
      public function ElectricBatonLightingShot()
      {
         super();
         a_1279 = 0;
         a_1573 = 1;
         a_1576 = false;
         a_1577 = false;
         a_1575 = true;
         a_1588 = false;
         a_1275 = 0;
         a_1587 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(ElectricBatonLightingShot) as ElectricBatonLightingShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return ElectricBatonLightingShotMovie;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         nextFrame();
         if(a_1273 == a_1274)
         {
            this.a_4351();
            a_3940();
            return;
         }
      }
      
      override protected function a_4351() : void
      {
         var stMoveIntruder:a_4206 = null;
         var arrMoveIntruder:Array = a_1584.a_1511.slice();
         for each(stMoveIntruder in arrMoveIntruder)
         {
            stMoveIntruder.a_4210();
         }
      }
   }
}

