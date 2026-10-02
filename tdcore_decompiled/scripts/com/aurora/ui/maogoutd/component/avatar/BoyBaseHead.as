package com.aurora.ui.maogoutd.component.avatar
{
   import flash.display.BitmapData;
   
   public class BoyBaseHead extends BitmapData
   {
      
      private static var instance:BoyBaseHead;
      
      public function BoyBaseHead(width:int, height:int)
      {
         super(width,height);
      }
      
      public static function getInstance() : BoyBaseHead
      {
         if(instance == null)
         {
            instance = new BoyBaseHead(0,0);
         }
         return instance;
      }
   }
}

