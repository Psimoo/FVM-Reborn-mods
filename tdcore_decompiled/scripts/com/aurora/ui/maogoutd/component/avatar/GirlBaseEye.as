package com.aurora.ui.maogoutd.component.avatar
{
   import flash.display.BitmapData;
   
   public class GirlBaseEye extends BitmapData
   {
      
      private static var instance:GirlBaseEye;
      
      public function GirlBaseEye(width:int, height:int)
      {
         super(width,height);
      }
      
      public static function getInstance() : GirlBaseEye
      {
         if(instance == null)
         {
            instance = new GirlBaseEye(0,0);
         }
         return instance;
      }
   }
}

