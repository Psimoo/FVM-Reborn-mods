package com.aurora.ui.maogoutd.resource.defender.HorseYear.luban
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class LuBanFinalShot extends LuBanNormalShot
   {
      
      public function LuBanFinalShot()
      {
         super();
      }
      
      public static function a_4344() : LuBanFinalShot
      {
         return PoolManager.getInstance().CheckOutOne(LuBanFinalShot) as LuBanFinalShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return LuBanFinalShotMovie;
      }
   }
}

