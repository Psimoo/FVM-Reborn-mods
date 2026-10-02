package com.aurora.ui.maogoutd.component.avatar
{
   import flash.display.BitmapData;
   
   public class GirlBaseHair extends BitmapData
   {
      
      private static var instance:GirlBaseHair;
      
      public function GirlBaseHair(width:int, height:int)
      {
         super(width,height);
      }
      
      public static function getInstance() : GirlBaseHair
      {
         if(instance == null)
         {
            instance = new GirlBaseHair(0,0);
         }
         return instance;
      }
   }
}

