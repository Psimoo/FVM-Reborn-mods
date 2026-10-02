package com.aurora.ui.maogoutd.resource.tools
{
   import com.aurora.ui.maogoutd.game.Util.BitMapManager;
   import flash.display.BitmapData;
   
   public class a_4440 extends a_4408
   {
      
      private static var a_1630:Array = new Array();
      
      public function a_4440(bitmapData:BitmapData = null, pixelSnapping:String = "auto", smoothing:Boolean = false)
      {
         super(bitmapData,pixelSnapping,smoothing);
         alpha = 1;
      }
      
      public static function a_3926() : a_4408
      {
         var stRedDangerFieldAlarm:a_4440 = null;
         stRedDangerFieldAlarm = a_1630.pop();
         if(null == stRedDangerFieldAlarm)
         {
            stRedDangerFieldAlarm = new a_4440(BitMapManager.getInstance().GetRedDangerFieldAlarmBitmapData());
         }
         stRedDangerFieldAlarm.visible = true;
         return stRedDangerFieldAlarm;
      }
      
      override public function a_3940() : Boolean
      {
         if(Boolean(parent) && parent.contains(this))
         {
            parent.removeChild(this);
         }
         if(-1 == a_1630.indexOf(this))
         {
            a_1630.push(this);
         }
         return true;
      }
   }
}

