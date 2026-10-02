package com.aurora.ui.maogoutd.component.avatar
{
   import flash.display.BitmapData;
   
   public class BoyBaseEye extends BitmapData
   {
      
      private static var instance:BoyBaseEye;
      
      public function BoyBaseEye(width:int, height:int)
      {
         super(width,height);
      }
      
      public static function getInstance() : BoyBaseEye
      {
         if(instance == null)
         {
            instance = new BoyBaseEye(0,0);
         }
         return instance;
      }
   }
}

