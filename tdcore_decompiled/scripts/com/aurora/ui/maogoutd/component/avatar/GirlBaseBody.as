package com.aurora.ui.maogoutd.component.avatar
{
   import flash.display.BitmapData;
   
   public class GirlBaseBody extends BitmapData
   {
      
      private static var instance:GirlBaseBody;
      
      public function GirlBaseBody(width:int, height:int)
      {
         super(width,height);
      }
      
      public static function getInstance() : GirlBaseBody
      {
         if(instance == null)
         {
            instance = new GirlBaseBody(0,0);
         }
         return instance;
      }
   }
}

