package com.aurora.ui.maogoutd.resource.tools
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.bitmap.a_3935;
   import flash.display.BitmapData;
   
   public class a_4413 extends a_4409
   {
      
      private static var a_1614:BitmapData = new a_3935(38,64);
      
      public function a_4413(bitmapData:BitmapData = null, pixelSnapping:String = "auto", smoothing:Boolean = false)
      {
         super(bitmapData,pixelSnapping,smoothing);
      }
      
      public static function a_3926() : a_4409
      {
         return PoolManager.getInstance().CheckOutOne(a_4413) as a_4413;
      }
      
      override public function a_3940() : Boolean
      {
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
   }
}

