package com.aurora.ui.maogoutd.resource.shot
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class AvatarIceShot extends a_4348
   {
      
      private static var ms_stAvatarIceShotVector:Array = new Array();
      
      public function AvatarIceShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1304 = b_183.b_199;
         a_1573 = 1;
         a_1574 = 200;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(AvatarIceShot) as AvatarIceShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return AvatarIceShotMovie;
      }
   }
}

