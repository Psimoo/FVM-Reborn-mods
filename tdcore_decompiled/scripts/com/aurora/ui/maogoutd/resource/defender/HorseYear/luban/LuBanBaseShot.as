package com.aurora.ui.maogoutd.resource.defender.HorseYear.luban
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class LuBanBaseShot extends LuBanNormalShot
   {
      
      public function LuBanBaseShot()
      {
         super();
      }
      
      public static function a_4344() : LuBanBaseShot
      {
         return PoolManager.getInstance().CheckOutOne(LuBanBaseShot) as LuBanBaseShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return LuBanBaseShotMovie;
      }
   }
}

