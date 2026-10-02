package com.aurora.ui.maogoutd.resource.defender.PigYear.MeowTray
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   
   public class MeowTrayHead extends a_3909
   {
      
      public function MeowTrayHead()
      {
         super();
      }
      
      public static function a_3926() : MeowTrayHead
      {
         return PoolManager.getInstance().CheckOutOne(MeowTrayHead) as MeowTrayHead;
      }
      
      override protected function getBindMovie() : Class
      {
         return MeowTrayHeadMovie;
      }
      
      public function a_1797(isReserved:Boolean) : Boolean
      {
         this.visible = true;
         a_1283 = isReserved;
         a_1275 = 1;
         gotoAndStop(1);
         return true;
      }
      
      override public function nextFrame() : void
      {
         super.nextFrame();
         if(a_1278 != null || a_1273 == a_1274)
         {
            gotoAndStop(1);
         }
      }
      
      public function a_3940() : Boolean
      {
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
   }
}

