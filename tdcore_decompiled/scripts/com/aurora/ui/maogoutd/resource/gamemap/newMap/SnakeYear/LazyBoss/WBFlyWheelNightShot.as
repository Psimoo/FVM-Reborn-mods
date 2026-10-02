package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.LazyBoss
{
   public class WBFlyWheelNightShot extends WBFlyWheelShot
   {
      
      private static var ms_stWBFlyWheelNightShotVector:Array = new Array();
      
      public function WBFlyWheelNightShot()
      {
         super();
      }
      
      public static function a_4344() : WBFlyWheelShot
      {
         var stWBFlyWheelNightShot:WBFlyWheelNightShot = ms_stWBFlyWheelNightShotVector.pop();
         if(null == stWBFlyWheelNightShot)
         {
            stWBFlyWheelNightShot = new WBFlyWheelNightShot();
         }
         return stWBFlyWheelNightShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBFlyWheelNightShotMovie;
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_stWBFlyWheelNightShotVector.indexOf(this))
         {
            ms_stWBFlyWheelNightShotVector.push(this);
         }
         return true;
      }
   }
}

