package com.aurora.ui.maogoutd.component.avatar
{
   import flash.display.BitmapData;
   
   public class BoyCryEye extends BitmapData
   {
      
      private static var instance:BoyCryEye;
      
      public function BoyCryEye(width:int, height:int)
      {
         super(width,height);
      }
      
      public static function getInstance() : BoyCryEye
      {
         if(instance == null)
         {
            instance = new BoyCryEye(0,0);
         }
         return instance;
      }
   }
}

