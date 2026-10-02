package com.aurora.ui.maogoutd.component.avatar
{
   import flash.display.BitmapData;
   
   public class BoyBaseClothes extends BitmapData
   {
      
      private static var instance:BoyBaseClothes;
      
      public function BoyBaseClothes(width:int, height:int)
      {
         super(width,height);
      }
      
      public static function getInstance() : BoyBaseClothes
      {
         if(instance == null)
         {
            instance = new BoyBaseClothes(0,0);
         }
         return instance;
      }
   }
}

