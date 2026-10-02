package com.aurora.ui.maogoutd.resource.tools
{
   import com.aurora.ui.maogoutd.resource.bitmap.MapPuddleBitmapData;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   
   public class MapPuddleBitmap extends Bitmap
   {
      
      private static var ms_stMapPuddleBitmapVector:Array = new Array();
      
      private static var ms_stMapPuddleBitmapBitmapData:BitmapData = new MapPuddleBitmapData(81,75);
      
      public function MapPuddleBitmap(bitmapData:BitmapData = null, pixelSnapping:String = "auto", smoothing:Boolean = false)
      {
         super(bitmapData,pixelSnapping,smoothing);
      }
      
      public static function a_3926() : MapPuddleBitmap
      {
         var stMapPuddleBitmap:MapPuddleBitmap = null;
         stMapPuddleBitmap = ms_stMapPuddleBitmapVector.pop();
         if(null == stMapPuddleBitmap)
         {
            stMapPuddleBitmap = new MapPuddleBitmap(ms_stMapPuddleBitmapBitmapData);
         }
         stMapPuddleBitmap.visible = true;
         return stMapPuddleBitmap;
      }
      
      public function a_3940() : Boolean
      {
         visible = false;
         if(Boolean(parent) && parent.contains(this))
         {
            parent.removeChild(this);
         }
         if(-1 == ms_stMapPuddleBitmapVector.indexOf(this))
         {
            ms_stMapPuddleBitmapVector.push(this);
         }
         return true;
      }
   }
}

