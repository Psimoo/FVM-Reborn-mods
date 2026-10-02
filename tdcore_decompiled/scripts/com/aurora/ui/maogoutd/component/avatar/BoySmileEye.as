package com.aurora.ui.maogoutd.component.avatar
{
   import flash.display.BitmapData;
   
   public class BoySmileEye extends BitmapData
   {
      
      private static var instance:BoySmileEye;
      
      public function BoySmileEye(width:int, height:int)
      {
         super(width,height);
      }
      
      public static function getInstance() : BoySmileEye
      {
         if(instance == null)
         {
            instance = new BoySmileEye(0,0);
         }
         return instance;
      }
   }
}

