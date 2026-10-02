package com.aurora.ui.maogoutd.resource.defender.HorseYear.luban
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class LuBanFirstShot extends LuBanNormalShot
   {
      
      public function LuBanFirstShot()
      {
         super();
      }
      
      public static function a_4344() : LuBanFirstShot
      {
         return PoolManager.getInstance().CheckOutOne(LuBanFirstShot) as LuBanFirstShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return LuBanFirstShotMovie;
      }
   }
}

