package com.aurora.ui.maogoutd.resource.shot.Corn
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class CornGunShot extends a_4348
   {
      
      public function CornGunShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1573 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(CornGunShot,CornGunShotMovie) as CornGunShot;
      }
      
      public static function GetFreeShot1() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(CornGunShot,CornGunShot1Movie) as CornGunShot;
      }
      
      public static function GetFreeShot2() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(CornGunShot,CornGunShot2Movie) as CornGunShot;
      }
   }
}

