package com.aurora.ui.maogoutd.resource.tools
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.bitmap.a_3936;
   import flash.display.BitmapData;
   
   public class a_4414 extends a_4409
   {
      
      private static var a_1616:BitmapData = new a_3936(48,60);
      
      public function a_4414(bitmapData:BitmapData = null, pixelSnapping:String = "auto", smoothing:Boolean = false)
      {
         super(bitmapData,pixelSnapping,smoothing);
      }
      
      public static function a_3926() : a_4409
      {
         return PoolManager.getInstance().CheckOutOne(a_4414) as a_4414;
      }
      
      override public function a_3940() : Boolean
      {
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
   }
}

