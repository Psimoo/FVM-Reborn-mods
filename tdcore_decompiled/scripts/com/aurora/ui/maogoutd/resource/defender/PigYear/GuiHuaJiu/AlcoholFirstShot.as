package com.aurora.ui.maogoutd.resource.defender.PigYear.GuiHuaJiu
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class AlcoholFirstShot extends AlcoholShot
   {
      
      private static var ms_stAlcoholShotVector:Array = new Array();
      
      public function AlcoholFirstShot()
      {
         super();
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(AlcoholFirstShot,AlcoholShotMovie) as AlcoholFirstShot;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         return true;
      }
   }
}

