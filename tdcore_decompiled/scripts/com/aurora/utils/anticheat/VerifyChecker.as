package com.aurora.utils.anticheat
{
   import com.aurora.ui.maogoutd.ClientLog.MessageTipHandler;
   
   public class VerifyChecker
   {
      
      public function VerifyChecker()
      {
         super();
      }
      
      public static function calculateVariance(values:Array) : Number
      {
         var diff:Number = NaN;
         if(values.length == 0)
         {
            return 0;
         }
         var sum:Number = 0;
         for(var i:int = 0; i < values.length; i++)
         {
            sum += values[i];
         }
         var mean:Number = sum / values.length;
         var squaredDiffs:Number = 0;
         for(i = 0; i < values.length; i++)
         {
            diff = values[i] - mean;
            squaredDiffs += diff * diff;
         }
         return Math.sqrt(squaredDiffs / values.length);
      }
      
      public static function evaluateLinearity(events:Array) : Number
      {
         var p1:Object = null;
         var p2:Object = null;
         var p3:Object = null;
         var x1:Number = NaN;
         var y1:Number = NaN;
         var x2:Number = NaN;
         var y2:Number = NaN;
         var x3:Number = NaN;
         var y3:Number = NaN;
         var distance:Number = NaN;
         if(events.length < 3)
         {
            return 0;
         }
         var deviations:Array = [];
         for(var i:int = 1; i < events.length - 1; i++)
         {
            p1 = events[i - 1].data;
            p2 = events[i].data;
            p3 = events[i + 1].data;
            if(Boolean(p1) && Boolean(p2) && Boolean(p3))
            {
               x1 = Number(p1.x);
               y1 = Number(p1.y);
               x2 = Number(p2.x);
               y2 = Number(p2.y);
               x3 = Number(p3.x);
               y3 = Number(p3.y);
               distance = Math.abs((y2 - y1) * x3 - (x2 - x1) * y3 + x2 * y1 - y2 * x1) / Math.sqrt((y2 - y1) * (y2 - y1) + (x2 - x1) * (x2 - x1));
               deviations.push(distance);
            }
         }
         if(deviations.length == 0)
         {
            return 0;
         }
         return calculateVariance(deviations);
      }
      
      public static function evaluateJitter(events:Array) : Number
      {
         var p1:Object = null;
         var p2:Object = null;
         var dx:Number = NaN;
         var dy:Number = NaN;
         var dist:Number = NaN;
         if(events.length < 3)
         {
            return 0;
         }
         var jitters:Array = [];
         for(var i:int = 1; i < events.length; i++)
         {
            p1 = events[i - 1].data;
            p2 = events[i].data;
            if(Boolean(p1) && Boolean(p2))
            {
               dx = p2.x - p1.x;
               dy = p2.y - p1.y;
               dist = Math.sqrt(dx * dx + dy * dy);
               jitters.push(dist);
            }
         }
         if(jitters.length == 0)
         {
            return 0;
         }
         return calculateVariance(jitters);
      }
      
      public static function evaluateIntervalRegularity(intervals:Array) : Boolean
      {
         if(intervals.length < 3)
         {
            return false;
         }
         var isScript:Boolean = true;
         var firstInterval:Number = Number(intervals[0]);
         for(var i:int = 1; i < intervals.length; i++)
         {
            if(Math.abs(intervals[i] - firstInterval) > 10)
            {
               isScript = false;
               break;
            }
         }
         return isScript;
      }
      
      public static function showOsd(isDebug:Boolean, msg:String, type:String = "") : void
      {
         if(isDebug)
         {
            if(type == "mm")
            {
               msg = "【鼠标移动模式:】" + msg;
            }
            else if(type == "mc")
            {
               msg = "【鼠标点打模式:】" + msg;
            }
            else if(type == "kd")
            {
               msg = "【键盘模式:】" + msg;
            }
            else if(type == "drag")
            {
               msg = "【鼠标drag模式:】" + msg;
            }
            MessageTipHandler.Get().a_3146(msg);
         }
      }
   }
}

