package com.aurora.utils.anticheat
{
   public class PieceBehaviorComplianceChecker
   {
      
      private var _events:Array = [];
      
      private var isDebug:Boolean;
      
      public function PieceBehaviorComplianceChecker(debug:Boolean)
      {
         super();
         this.isDebug = debug;
      }
      
      public function loadEventSequence(events:Array) : void
      {
         this._events = events || [];
      }
      
      public function evaluateCompliance() : Boolean
      {
         var mouseScore:Number = NaN;
         if(this._events.length == 0)
         {
            VerifyChecker.showOsd(this.isDebug,"无事件，视为不正常");
            return false;
         }
         var pass:Boolean = true;
         var clickScore:Number = this.evaluateClickTiming();
         if(clickScore < 85)
         {
            mouseScore = this.evaluateMousePattern();
            if(mouseScore >= 85)
            {
               pass = false;
            }
         }
         else
         {
            pass = false;
         }
         return pass;
      }
      
      private function evaluateMousePattern() : Number
      {
         var prev:Object = null;
         var curr:Object = null;
         var timeDiff:Number = NaN;
         var dx:Number = NaN;
         var dy:Number = NaN;
         var distance:Number = NaN;
         var speed:Number = NaN;
         var mouseEvents:Array = [];
         for(var i:int = 0; i < this._events.length; i++)
         {
            if(this._events[i].type == "mm")
            {
               mouseEvents.push(this._events[i]);
            }
         }
         if(mouseEvents.length < 5)
         {
            VerifyChecker.showOsd(this.isDebug,"鼠标移动事件过少","mm");
            return 100;
         }
         var speeds:Array = [];
         for(i = 1; i < mouseEvents.length; i++)
         {
            prev = mouseEvents[i - 1].data;
            curr = mouseEvents[i].data;
            timeDiff = (mouseEvents[i].t - mouseEvents[i - 1].t) / 1000;
            if(Boolean(timeDiff > 0) && Boolean(prev) && Boolean(curr))
            {
               dx = curr.x - prev.x;
               dy = curr.y - prev.y;
               distance = Math.sqrt(dx * dx + dy * dy);
               speed = distance / timeDiff;
               speeds.push(speed);
            }
         }
         if(speeds.length == 0)
         {
            VerifyChecker.showOsd(this.isDebug,"鼠标移动速度为空","mm");
            return 100;
         }
         var speedVariance:Number = VerifyChecker.calculateVariance(speeds);
         if(speedVariance < 0.5)
         {
            VerifyChecker.showOsd(this.isDebug,"检测不自然的恒定速度","mm");
            return 100;
         }
         var linearityRisk:Number = VerifyChecker.evaluateLinearity(mouseEvents);
         if(linearityRisk < 0.35)
         {
            VerifyChecker.showOsd(this.isDebug,"检测到完美直线","mm");
            return 100;
         }
         var jitterRisk:Number = VerifyChecker.evaluateJitter(mouseEvents);
         if(jitterRisk < 0.35)
         {
            VerifyChecker.showOsd(this.isDebug,"检测不自然的抖动","mm");
            return 100;
         }
         return 0;
      }
      
      private function evaluateClickTiming() : Number
      {
         var clickEvents:Array = [];
         var hasStartDrag:Boolean = false;
         var hasStopDrag:Boolean = false;
         var clickChk1:Boolean = false;
         var clickChk2:Boolean = false;
         var clickChk3:Boolean = false;
         for(var i:int = 0; i < this._events.length; i++)
         {
            if(this._events[i].type == "stopDrag" && !hasStopDrag)
            {
               hasStopDrag = true;
            }
            else if(this._events[i].type == "startDrag" && !hasStartDrag)
            {
               hasStartDrag = true;
            }
            else if(this._events[i].type == "clickChk1")
            {
               clickChk1 = true;
            }
            else if(this._events[i].type == "clickChk2")
            {
               clickChk2 = true;
            }
            else if(this._events[i].type == "clickChk3")
            {
               clickChk3 = true;
            }
         }
         if(clickChk1 || clickChk2 || clickChk3)
         {
            VerifyChecker.showOsd(this.isDebug,"点了不应点的按钮","mc");
            return 100;
         }
         if(!hasStartDrag || !hasStopDrag)
         {
            VerifyChecker.showOsd(this.isDebug,"检测不到drag事件","drag");
            return 100;
         }
         return 0;
      }
   }
}

