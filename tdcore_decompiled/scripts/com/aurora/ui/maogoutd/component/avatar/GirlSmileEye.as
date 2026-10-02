package com.aurora.ui.maogoutd.component.avatar
{
   import flash.display.BitmapData;
   
   public class GirlSmileEye extends BitmapData
   {
      
      private static var instance:GirlSmileEye;
      
      public function GirlSmileEye(width:int, height:int)
      {
         super(width,height);
      }
      
      public static function getInstance() : GirlSmileEye
      {
         if(instance == null)
         {
            instance = new GirlSmileEye(0,0);
         }
         return instance;
      }
   }
}

