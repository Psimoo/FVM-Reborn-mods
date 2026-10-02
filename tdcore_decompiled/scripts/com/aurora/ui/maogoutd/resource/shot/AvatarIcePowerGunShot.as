package com.aurora.ui.maogoutd.resource.shot
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class AvatarIcePowerGunShot extends a_4348
   {
      
      public function AvatarIcePowerGunShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1573 = 1;
         a_1574 = 200;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(AvatarIcePowerGunShot) as AvatarIcePowerGunShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return AvatarIcePowerGunShotMovie;
      }
   }
}

