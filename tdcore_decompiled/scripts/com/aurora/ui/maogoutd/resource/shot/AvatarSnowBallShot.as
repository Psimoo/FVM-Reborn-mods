package com.aurora.ui.maogoutd.resource.shot
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class AvatarSnowBallShot extends a_4348
   {
      
      public function AvatarSnowBallShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1573 = 1;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(AvatarSnowBallShot) as AvatarSnowBallShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return AvatarSnowBallShotMovie;
      }
   }
}

