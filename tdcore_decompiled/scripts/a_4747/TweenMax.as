package a_4747
{
   import flash.utils.*;
   
   public class TweenMax extends TweenFilterLite
   {
      
      public static var version:Number = 1.13;
      
      protected static const RAD2DEG:Number = 180 / Math.PI;
      
      public static var killTweensOf:Function = TweenLite.killTweensOf;
      
      public static var killDelayedCallsTo:Function = TweenLite.killDelayedCallsTo;
      
      public static var removeTween:Function = TweenLite.removeTween;
      
      public static var defaultEase:Function = TweenLite.defaultEase;
      
      protected var _pauseTime:Number;
      
      public function TweenMax($target:Object, $duration:Number, $vars:Object)
      {
         super($target,$duration,$vars);
         this._pauseTime = -1;
         if(TweenFilterLite.version < 7.12 || isNaN(TweenFilterLite.version))
         {
            trace("TweenMax error! Please update your TweenFilterLite class. TweenMax requires a more recent version. Download updates at http://www.TweenMax.com.");
         }
      }
      
      public static function to($target:Object, $duration:Number, $vars:Object) : TweenMax
      {
         return new TweenMax($target,$duration,$vars);
      }
      
      public static function from($target:Object, $duration:Number, $vars:Object) : TweenMax
      {
         $vars.runBackwards = true;
         return new TweenMax($target,$duration,$vars);
      }
      
      public static function allTo($targets:Array, $duration:Number, $vars:Object) : Array
      {
         var i:int = 0;
         var v:Object = null;
         var p:String = null;
         var dl:Number = NaN;
         var lastVars:Object = null;
         if($targets.length == 0)
         {
            return [];
         }
         var a:Array = [];
         var dli:Number = Number(Number($vars.delayIncrement) || 0);
         delete $vars.delayIncrement;
         if($vars.onCompleteAll == undefined)
         {
            lastVars = $vars;
         }
         else
         {
            lastVars = {};
            for(p in $vars)
            {
               lastVars[p] = $vars[p];
            }
            lastVars.onCompleteParams = [[$vars.onComplete,$vars.onCompleteAll],[$vars.onCompleteParams,$vars.onCompleteAllParams]];
            lastVars.onComplete = TweenMax.callbackProxy;
            delete $vars.onCompleteAll;
         }
         delete $vars.onCompleteAllParams;
         if(dli == 0)
         {
            for(i = 0; i < $targets.length - 1; i++)
            {
               v = {};
               for(p in $vars)
               {
                  v[p] = $vars[p];
               }
               a.push(new TweenMax($targets[i],$duration,v));
            }
         }
         else
         {
            dl = Number(Number($vars.delay) || 0);
            for(i = 0; i < $targets.length - 1; i++)
            {
               v = {};
               for(p in $vars)
               {
                  v[p] = $vars[p];
               }
               v.delay = dl + i * dli;
               a.push(new TweenMax($targets[i],$duration,v));
            }
            lastVars.delay = dl + ($targets.length - 1) * dli;
         }
         a.push(new TweenMax($targets[$targets.length - 1],$duration,lastVars));
         return a;
      }
      
      public static function allFrom($targets:Array, $duration:Number, $vars:Object) : Array
      {
         $vars.runBackwards = true;
         return allTo($targets,$duration,$vars);
      }
      
      public static function callbackProxy($functions:Array, $params:Array = null) : void
      {
         for(var i:uint = 0; i < $functions.length; i++)
         {
            if($functions[i] != undefined)
            {
               $functions[i].apply(null,$params[i]);
            }
         }
      }
      
      public static function sequence($target:Object, $tweens:Array) : Array
      {
         var dl:Number = NaN;
         var t:Number = NaN;
         var i:uint = 0;
         var overwrite:Boolean = true;
         if($tweens[0].overwrite == false)
         {
            overwrite = false;
         }
         var a:Array = [];
         var totalDelay:Number = 0;
         for(i = 0; i < $tweens.length; i++)
         {
            t = Number(Number($tweens[i].time) || 0);
            delete $tweens[i].time;
            dl = Number(Number($tweens[i].delay) || 0);
            $tweens[i].delay = totalDelay + dl;
            $tweens[i].overwrite = overwrite;
            a.push(new TweenMax($target,t,$tweens[i]));
            totalDelay += t + dl;
            overwrite = false;
         }
         return a;
      }
      
      public static function delayedCall($delay:Number, $onComplete:Function, $onCompleteParams:Array = null, $onCompleteScope:* = null) : TweenMax
      {
         return new TweenMax($onComplete,0,{
            "delay":$delay,
            "onComplete":$onComplete,
            "onCompleteParams":$onCompleteParams,
            "onCompleteScope":$onCompleteScope,
            "overwrite":false
         });
      }
      
      public static function parseBeziers($props:Object, $through:Boolean = false) : Object
      {
         var i:int = 0;
         var a:Array = null;
         var b:Object = null;
         var p:String = null;
         var all:Object = {};
         if($through)
         {
            for(p in $props)
            {
               a = $props[p];
               all[p] = b = [];
               if(a.length > 2)
               {
                  b.push({
                     "s":a[0],
                     "cp":a[1] - (a[2] - a[0]) / 4,
                     "e":a[1]
                  });
                  for(i = 1; i < a.length - 1; i++)
                  {
                     b.push({
                        "s":a[i],
                        "cp":a[i] + (a[i] - b[i - 1].cp),
                        "e":a[i + 1]
                     });
                  }
               }
               else
               {
                  b.push({
                     "s":a[0],
                     "cp":(a[0] + a[1]) / 2,
                     "e":a[1]
                  });
               }
            }
         }
         else
         {
            for(p in $props)
            {
               a = $props[p];
               all[p] = b = [];
               if(a.length > 3)
               {
                  b.push({
                     "s":a[0],
                     "cp":a[1],
                     "e":(a[1] + a[2]) / 2
                  });
                  for(i = 2; i < a.length - 2; i++)
                  {
                     b.push({
                        "s":b[i - 2].e,
                        "cp":a[i],
                        "e":(a[i] + a[i + 1]) / 2
                     });
                  }
                  b.push({
                     "s":b[b.length - 1].e,
                     "cp":a[a.length - 2],
                     "e":a[a.length - 1]
                  });
               }
               else if(a.length == 3)
               {
                  b.push({
                     "s":a[0],
                     "cp":a[1],
                     "e":a[2]
                  });
               }
               else if(a.length == 2)
               {
                  b.push({
                     "s":a[0],
                     "cp":(a[0] + a[1]) / 2,
                     "e":a[1]
                  });
               }
            }
         }
         return all;
      }
      
      public static function getTweensOf($target:Object) : Array
      {
         var p:Object = null;
         var t:Dictionary = _all[$target];
         var a:Array = [];
         if(t != null)
         {
            for(p in t)
            {
               if(t[p].tweens != undefined)
               {
                  a.push(t[p]);
               }
            }
         }
         return a;
      }
      
      public static function isTweening($target:Object) : Boolean
      {
         var a:Array = getTweensOf($target);
         for(var i:* = int(a.length - 1); i > -1; i--)
         {
            if(a[i].active)
            {
               return true;
            }
         }
         return false;
      }
      
      public static function getAllTweens() : Array
      {
         var p:Object = null;
         var tw:Object = null;
         var a:Dictionary = _all;
         var all:Array = [];
         for(p in a)
         {
            for(tw in a[p])
            {
               if(a[p][tw] != undefined)
               {
                  all.push(a[p][tw]);
               }
            }
         }
         return all;
      }
      
      public static function killAllTweens($complete:Boolean = false) : void
      {
         killAll($complete,true,false);
      }
      
      public static function killAllDelayedCalls($complete:Boolean = false) : void
      {
         killAll($complete,false,true);
      }
      
      public static function killAll($complete:Boolean = false, $tweens:Boolean = true, $delayedCalls:Boolean = true) : void
      {
         var a:Array = getAllTweens();
         for(var i:* = int(a.length - 1); i > -1; i--)
         {
            if(a[i].target is Function == $delayedCalls || a[i].target is Function != $tweens)
            {
               if($complete)
               {
                  a[i].complete();
               }
               else
               {
                  TweenLite.removeTween(a[i]);
               }
            }
         }
      }
      
      public static function pauseAll($tweens:Boolean = true, $delayedCalls:Boolean = false) : void
      {
         changePause(true,$tweens,$delayedCalls);
      }
      
      public static function resumeAll($tweens:Boolean = true, $delayedCalls:Boolean = false) : void
      {
         changePause(false,$tweens,$delayedCalls);
      }
      
      public static function changePause($pause:Boolean, $tweens:Boolean = true, $delayedCalls:Boolean = false) : void
      {
         var a:Array = getAllTweens();
         for(var i:* = int(a.length - 1); i > -1; i--)
         {
            if(a[i].target is Function == $delayedCalls || a[i].target is Function != $tweens)
            {
               a[i].paused = $pause;
            }
         }
      }
      
      public static function hexColorsProxy($o:Object) : void
      {
         $o.info.target[$o.info.prop] = $o.target.r << 16 | $o.target.g << 8 | $o.target.b;
      }
      
      public static function bezierProxy($o:Object) : void
      {
         var i:int = 0;
         var p:String = null;
         var b:Object = null;
         var t:Number = NaN;
         var segments:uint = 0;
         var factor:Number = Number($o.target.t);
         var props:Object = $o.info.props;
         var tg:Object = $o.info.target;
         for(p in props)
         {
            segments = uint(props[p].length);
            if(factor < 0)
            {
               i = 0;
            }
            else if(factor >= 1)
            {
               i = segments - 1;
            }
            else
            {
               i = int(segments * factor);
            }
            t = (factor - i * (1 / segments)) * segments;
            b = props[p][i];
            tg[p] = b.s + t * (2 * (1 - t) * (b.cp - b.s) + t * (b.e - b.s));
         }
      }
      
      public static function bezierProxy2($o:Object) : void
      {
         var a:Number = NaN;
         var dx:Number = NaN;
         var dy:Number = NaN;
         var cotb:Array = null;
         var toAdd:Number = NaN;
         bezierProxy($o);
         var future:Object = {};
         var tg:Object = $o.info.target;
         $o.info.target = future;
         $o.target.t += 0.01;
         bezierProxy($o);
         var otb:Array = $o.info.orientToBezier;
         for(var i:uint = 0; i < otb.length; i++)
         {
            cotb = otb[i];
            toAdd = Number(Number(cotb[3]) || 0);
            dx = future[cotb[0]] - tg[cotb[0]];
            dy = future[cotb[1]] - tg[cotb[1]];
            tg[cotb[2]] = Math.atan2(dy,dx) * RAD2DEG + toAdd;
         }
         $o.info.target = tg;
         $o.target.t -= 0.01;
      }
      
      override public function initTweenVals($hrp:Boolean = false, $reservedProps:String = "") : void
      {
         var p:String = null;
         var i:int = 0;
         var curProp:Object = null;
         var props:Object = null;
         var b:Array = null;
         $reservedProps += " hexColors bezier bezierThrough orientToBezier ";
         var bProxy:Function = bezierProxy;
         if(this.vars.orientToBezier == true)
         {
            this.vars.orientToBezier = [["x","y","rotation",0]];
            bProxy = bezierProxy2;
         }
         else if(this.vars.orientToBezier is Array)
         {
            bProxy = bezierProxy2;
         }
         if(this.vars.bezier != undefined && this.vars.bezier is Array)
         {
            props = {};
            b = this.vars.bezier;
            for(i = 0; i < b.length; i++)
            {
               for(p in b[i])
               {
                  if(props[p] == undefined)
                  {
                     props[p] = [this.target[p]];
                  }
                  if(typeof b[i][p] == "number")
                  {
                     props[p].push(b[i][p]);
                  }
                  else
                  {
                     props[p].push(this.target[p] + Number(b[i][p]));
                  }
               }
            }
            for(p in props)
            {
               if(typeof this.vars[p] == "number")
               {
                  props[p].push(this.vars[p]);
               }
               else
               {
                  props[p].push(this.target[p] + Number(this.vars[p]));
               }
               delete this.vars[p];
            }
            addSubTween(bProxy,{"t":0},{"t":1},{
               "props":parseBeziers(props,false),
               "target":this.target,
               "orientToBezier":this.vars.orientToBezier
            });
         }
         if(this.vars.bezierThrough != undefined && this.vars.bezierThrough is Array)
         {
            props = {};
            b = this.vars.bezierThrough;
            for(i = 0; i < b.length; i++)
            {
               for(p in b[i])
               {
                  if(props[p] == undefined)
                  {
                     props[p] = [this.target[p]];
                  }
                  if(typeof b[i][p] == "number")
                  {
                     props[p].push(b[i][p]);
                  }
                  else
                  {
                     props[p].push(this.target[p] + Number(b[i][p]));
                  }
               }
            }
            for(p in props)
            {
               if(typeof this.vars[p] == "number")
               {
                  props[p].push(this.vars[p]);
               }
               else
               {
                  props[p].push(this.target[p] + Number(this.vars[p]));
               }
               delete this.vars[p];
            }
            addSubTween(bProxy,{"t":0},{"t":1},{
               "props":parseBeziers(props,true),
               "target":this.target,
               "orientToBezier":this.vars.orientToBezier
            });
         }
         if(this.vars.hexColors != undefined && typeof this.vars.hexColors == "object")
         {
            for(p in this.vars.hexColors)
            {
               addSubTween(hexColorsProxy,{
                  "r":this.target[p] >> 16,
                  "g":this.target[p] >> 8 & 0xFF,
                  "b":this.target[p] & 0xFF
               },{
                  "r":this.vars.hexColors[p] >> 16,
                  "g":this.vars.hexColors[p] >> 8 & 0xFF,
                  "b":this.vars.hexColors[p] & 0xFF
               },{
                  "prop":p,
                  "target":this.target
               });
            }
         }
         super.initTweenVals(true,$reservedProps);
      }
      
      public function pause() : void
      {
         if(this._pauseTime == -1)
         {
            this._pauseTime = _curTime;
            _active = false;
         }
      }
      
      public function resume() : void
      {
         var gap:Number = NaN;
         if(this._pauseTime != -1)
         {
            gap = _curTime - this._pauseTime;
            this.initTime += gap;
            if(!isNaN(this.startTime))
            {
               this.startTime += gap;
            }
            this._pauseTime = -1;
            if((_curTime - this.initTime) / 1000 > this.delay)
            {
               _active = true;
            }
         }
      }
      
      override public function get active() : Boolean
      {
         if(_active)
         {
            return true;
         }
         if(this._pauseTime != -1)
         {
            return false;
         }
         if((_curTime - this.initTime) / 1000 > this.delay)
         {
            _active = true;
            this.startTime = this.initTime + this.delay * 1000;
            if(!_initted)
            {
               this.initTweenVals();
            }
            else if(typeof this.vars.autoAlpha == "number")
            {
               this.target.visible = true;
            }
            if(this.vars.onStart != null)
            {
               this.vars.onStart.apply(null,this.vars.onStartParams);
            }
            if(this.duration == 0.001)
            {
               --this.startTime;
            }
            return true;
         }
         return false;
      }
      
      public function get paused() : Boolean
      {
         if(this._pauseTime != -1)
         {
            return true;
         }
         return false;
      }
      
      public function set paused($b:Boolean) : void
      {
         if($b)
         {
            this.pause();
         }
         else
         {
            this.resume();
         }
      }
      
      public function get progress() : Number
      {
         var n:Number = Number((_curTime - this.startTime) / 1000 / this.duration || 0);
         if(n > 1)
         {
            return 1;
         }
         return n;
      }
      
      public function set progress($n:Number) : void
      {
         var t:Number = _curTime - this.duration * $n * 1000;
         this.initTime = t - this.delay * 1000;
         var s:Boolean = this.active;
         this.startTime = t;
         render(_curTime);
      }
   }
}

