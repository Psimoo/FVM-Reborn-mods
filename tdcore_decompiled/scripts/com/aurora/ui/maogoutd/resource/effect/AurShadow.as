package com.aurora.ui.maogoutd.resource.effect
{
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   
   public class AurShadow extends Sprite
   {
      
      private static var a_1402:BitmapData;
      
      private static var a_1260:Sprite = new Sprite();
      
      public function AurShadow()
      {
         super();
      }
      
      public static function a_4106() : BitmapData
      {
         var stAurShadow:AurShadow = null;
         var stBoundes:Rectangle = null;
         if(null == a_1402)
         {
            stAurShadow = new AurShadow();
            a_1402 = new BitmapData(stAurShadow.width,stAurShadow.height,true,0);
            a_1260.addChild(stAurShadow);
            stBoundes = a_1260.getBounds(stAurShadow);
            a_1402.draw(stAurShadow,new Matrix(1,0,0,1,-stBoundes.x,-stBoundes.y));
            a_1260.removeChild(stAurShadow);
         }
         return a_1402;
      }
   }
}

