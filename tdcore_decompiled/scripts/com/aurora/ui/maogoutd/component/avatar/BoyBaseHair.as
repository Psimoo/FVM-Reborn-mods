package com.aurora.ui.maogoutd.component.avatar
{
   import flash.display.BitmapData;
   
   public class BoyBaseHair extends BitmapData
   {
      
      private static var instance:BoyBaseHair;
      
      public function BoyBaseHair(width:int, height:int)
      {
         super(width,height);
      }
      
      public static function getInstance() : BoyBaseHair
      {
         if(instance == null)
         {
            instance = new BoyBaseHair(0,0);
         }
         return instance;
      }
   }
}

