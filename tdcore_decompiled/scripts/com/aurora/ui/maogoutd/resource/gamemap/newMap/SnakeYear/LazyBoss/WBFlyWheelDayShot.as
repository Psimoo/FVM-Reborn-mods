package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.LazyBoss
{
   public class WBFlyWheelDayShot extends WBFlyWheelShot
   {
      
      private static var ms_stWBFlyWheelDayShotVector:Array = new Array();
      
      public function WBFlyWheelDayShot()
      {
         super();
      }
      
      public static function a_4344() : WBFlyWheelShot
      {
         var stWBFlyWheelDayShot:WBFlyWheelDayShot = ms_stWBFlyWheelDayShotVector.pop();
         if(null == stWBFlyWheelDayShot)
         {
            stWBFlyWheelDayShot = new WBFlyWheelDayShot();
         }
         return stWBFlyWheelDayShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return WBFlyWheelDayShotMovie;
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_stWBFlyWheelDayShotVector.indexOf(this))
         {
            ms_stWBFlyWheelDayShotVector.push(this);
         }
         return true;
      }
   }
}

