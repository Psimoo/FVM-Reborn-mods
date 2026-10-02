package com.aurora.ui.maogoutd.component.avatar
{
   import flash.display.BitmapData;
   
   public class GirlBaseClothes extends BitmapData
   {
      
      private static var instance:GirlBaseClothes;
      
      public function GirlBaseClothes(width:int, height:int)
      {
         super(width,height);
      }
      
      public static function getInstance() : GirlBaseClothes
      {
         if(instance == null)
         {
            instance = new GirlBaseClothes(0,0);
         }
         return instance;
      }
   }
}

