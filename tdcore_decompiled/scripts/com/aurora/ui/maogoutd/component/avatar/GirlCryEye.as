package com.aurora.ui.maogoutd.component.avatar
{
   import flash.display.BitmapData;
   
   public class GirlCryEye extends BitmapData
   {
      
      private static var instance:GirlCryEye;
      
      public function GirlCryEye(width:int, height:int)
      {
         super(width,height);
      }
      
      public static function getInstance() : GirlCryEye
      {
         if(instance == null)
         {
            instance = new GirlCryEye(0,0);
         }
         return instance;
      }
   }
}

