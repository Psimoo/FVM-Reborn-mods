package com.aurora.ui.maogoutd.resource.shot
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class AvatarPowerGunShot extends a_4348
   {
      
      public function AvatarPowerGunShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1304 = b_183.b_200;
         a_1573 = 1;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(AvatarPowerGunShot) as AvatarPowerGunShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return AvatarPowerGunShotMovie;
      }
   }
}

