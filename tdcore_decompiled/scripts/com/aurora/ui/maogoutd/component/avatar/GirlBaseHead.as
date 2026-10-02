package com.aurora.ui.maogoutd.component.avatar
{
   import flash.display.BitmapData;
   
   public class GirlBaseHead extends BitmapData
   {
      
      private static var instance:GirlBaseHead;
      
      public function GirlBaseHead(width:int, height:int)
      {
         super(width,height);
      }
      
      public static function getInstance() : GirlBaseHead
      {
         if(instance == null)
         {
            instance = new GirlBaseHead(0,0);
         }
         return instance;
      }
   }
}

