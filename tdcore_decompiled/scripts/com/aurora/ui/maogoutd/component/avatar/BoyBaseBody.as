package com.aurora.ui.maogoutd.component.avatar
{
   import flash.display.BitmapData;
   
   public class BoyBaseBody extends BitmapData
   {
      
      private static var instance:BoyBaseBody;
      
      public function BoyBaseBody(width:int, height:int)
      {
         super(width,height);
      }
      
      public static function getInstance() : BoyBaseBody
      {
         if(instance == null)
         {
            instance = new BoyBaseBody(0,0);
         }
         return instance;
      }
   }
}

