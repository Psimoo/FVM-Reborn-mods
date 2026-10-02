package com.aurora.ui.maogoutd.resource.defender.HorseYear.luban
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class LuBanSecondShot extends LuBanNormalShot
   {
      
      public function LuBanSecondShot()
      {
         super();
      }
      
      public static function a_4344() : LuBanSecondShot
      {
         return PoolManager.getInstance().CheckOutOne(LuBanSecondShot) as LuBanSecondShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return LuBanSecondShotMovie;
      }
   }
}

