package com.aurora.ui.maogoutd.resource.shot
{
   import a_4718.b_183;
   
   public class AvatarStarGunShot extends a_4348
   {
      
      private static var ms_stAvatarStarGunShotVector:Array = new Array();
      
      public function AvatarStarGunShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1304 = b_183.b_202;
         a_1573 = 1;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         var stAvatarStarGunShot:AvatarStarGunShot = ms_stAvatarStarGunShotVector.pop();
         if(null == stAvatarStarGunShot)
         {
            stAvatarStarGunShot = new AvatarStarGunShot();
         }
         return stAvatarStarGunShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return AvatarStarGunShotMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_stAvatarStarGunShotVector.indexOf(this))
         {
            ms_stAvatarStarGunShotVector.push(this);
         }
         return true;
      }
   }
}

