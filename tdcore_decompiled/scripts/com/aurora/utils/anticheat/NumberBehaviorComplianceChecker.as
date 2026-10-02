package com.aurora.utils.anticheat
{
   public class NumberBehaviorComplianceChecker
   {
      
      private var _events:Array = [];
      
      private var isDebug:Boolean;
      
      public function NumberBehaviorComplianceChecker(debug:Boolean)
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
         var clickScore:Number = NaN;
         var keyboardScore:Number = NaN;
         if(this._events.length == 0)
         {
            VerifyChecker.showOsd(this.isDebug,"无事件，视为不正常");
            return false;
         }
         var pass:Boolean = true;
         var mouseScore:Number = this.evaluateMousePattern();
         if(mouseScore < 85)
         {
            clickScore = this.evaluateClickTiming();
            if(clickScore < 85)
            {
               keyboardScore = this.evaluateKeyboardTiming();
               if(keyboardScore >= 85)
               {
                  pass = false;
               }
            }
            else
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
         var intervals:Array = null;
         var intervalVariance:Number = NaN;
         var regularityRisk:Boolean = false;
         var interval:Number = NaN;
         var clickEvents:Array = [];
         for(var i:int = 0; i < this._events.length; i++)
         {
            if(this._events[i].type == "mc")
            {
               clickEvents.push(this._events[i]);
            }
         }
         if(clickEvents.length == 0)
         {
            VerifyChecker.showOsd(this.isDebug,"检测不到点击事件","mc");
            return 100;
         }
         if(clickEvents.length > 3)
         {
            intervals = [];
            for(i = 1; i < clickEvents.length; i++)
            {
               interval = clickEvents[i].t - clickEvents[i - 1].t;
               intervals.push(interval);
            }
            intervalVariance = VerifyChecker.calculateVariance(intervals);
            if(intervalVariance <= 50)
            {
               VerifyChecker.showOsd(this.isDebug,"检测点击事件间隔一致性","mc");
               return 100;
            }
            regularityRisk = VerifyChecker.evaluateIntervalRegularity(intervals);
            if(regularityRisk)
            {
               VerifyChecker.showOsd(this.isDebug,"检测点击事件不按自然规律","mc");
               return 100;
            }
         }
         return 0;
      }
      
      private function evaluateKeyboardTiming() : Number
      {
         var kdData:Object = null;
         var interval:Number = NaN;
         var keyEvents:Array = [];
         for(var i:int = 0; i < this._events.length; i++)
         {
            if(this._events[i].type == "kd")
            {
               keyEvents.push(this._events[i]);
            }
         }
         for(i = 0; i < keyEvents.length; i++)
         {
            kdData = keyEvents[i].data;
            if(kdData)
            {
               if(kdData.pasteAttempt == true)
               {
                  VerifyChecker.showOsd(this.isDebug,"检测键盘按下后，有高风险粘贴操作","kd");
                  return 100;
               }
               if(Boolean(kdData._sub) && kdData._sub == "pasteAttempt")
               {
                  VerifyChecker.showOsd(this.isDebug,"检测键盘按下后，有高风险粘贴操作","kd");
                  return 100;
               }
               if(Boolean(kdData._sub) && kdData._sub == "oneKeyValue")
               {
                  VerifyChecker.showOsd(this.isDebug,"批量操作，有高风险","kd");
                  return 100;
               }
            }
         }
         if(keyEvents.length < 4)
         {
            VerifyChecker.showOsd(this.isDebug,"检测键盘事件数量过少","kd");
            return 100;
         }
         var intervals:Array = [];
         for(i = 1; i < keyEvents.length; i++)
         {
            interval = keyEvents[i].t - keyEvents[i - 1].t;
            intervals.push(interval);
         }
         var variance:Number = VerifyChecker.calculateVariance(intervals);
         if(variance < 40)
         {
            VerifyChecker.showOsd(this.isDebug,"检测每次的键盘事件时间间隔方差过小","kd");
            return 100;
         }
         return 0;
      }
   }
}

