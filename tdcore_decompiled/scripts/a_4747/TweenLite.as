package a_4747
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.ColorTransform;
   import flash.media.SoundChannel;
   import flash.utils.*;
   
   public class TweenLite
   {
      
      protected static var _curTime:uint;
      
      private static var _classInitted:Boolean;
      
      private static var _listening:Boolean;
      
      public static var version:Number = 6.21;
      
      public static var killDelayedCallsTo:Function = killTweensOf;
      
      public static var defaultEase:Function = TweenLite.easeOut;
      
      protected static var _all:Dictionary = new Dictionary();
      
      private static var _sprite:Sprite = new Sprite();
      
      private static var _timer:Timer = new Timer(2000);
      
      public var duration:Number;
      
      public var vars:Object;
      
      public var delay:Number;
      
      public var startTime:int;
      
      public var initTime:int;
      
      public var tweens:Array;
      
      public var target:Object;
      
      protected var _active:Boolean;
      
      protected var _subTweens:Array;
      
      protected var _hst:Boolean;
      
      protected var _initted:Boolean;
      
      public function TweenLite($target:Object, $duration:Number, $vars:Object)
      {
         super();
         if($target == null)
         {
            return;
         }
         if($vars.overwrite != false && $target != null || _all[$target] == undefined)
         {
            delete _all[$target];
            _all[$target] = new Dictionary();
         }
         _all[$target][this] = this;
         this.vars = $vars;
         this.duration = $duration || 0.001;
         this.delay = Number($vars.delay) || 0;
         this.target = $target;
         if(!(this.vars.ease is Function))
         {
            this.vars.ease = defaultEase;
         }
         if(this.vars.easeParams != null)
         {
            this.vars.proxiedEase = this.vars.ease;
            this.vars.ease = this.easeProxy;
         }
         if(!isNaN(Number(this.vars.autoAlpha)))
         {
            this.vars.alpha = Number(this.vars.autoAlpha);
         }
         this.tweens = [];
         this._subTweens = [];
         this._hst = this._initted = false;
         this._active = $duration == 0 && this.delay == 0;
         if(!_classInitted)
         {
            _curTime = getTimer();
            _sprite.addEventListener(Event.ENTER_FRAME,executeAll);
            _classInitted = true;
         }
         this.initTime = _curTime;
         if(this.vars.runBackwards == true && this.vars.renderOnStart != true || this._active)
         {
            this.initTweenVals();
            this.startTime = _curTime;
            if(this._active)
            {
               this.render(this.startTime + 1);
            }
            else
            {
               this.render(this.startTime);
            }
         }
         if(!_listening && !this._active)
         {
            _timer.addEventListener("timer",killGarbage);
            _timer.start();
            _listening = true;
         }
      }
      
      public static function to($target:Object, $duration:Number, $vars:Object) : TweenLite
      {
         return new TweenLite($target,$duration,$vars);
      }
      
      public static function from($target:Object, $duration:Number, $vars:Object) : TweenLite
      {
         $vars.runBackwards = true;
         return new TweenLite($target,$duration,$vars);
      }
      
      public static function delayedCall($delay:Number, $onComplete:Function, $onCompleteParams:Array = null, $onCompleteScope:* = null) : TweenLite
      {
         return new TweenLite($onComplete,0,{
            "delay":$delay,
            "onComplete":$onComplete,
            "onCompleteParams":$onCompleteParams,
            "onCompleteScope":$onCompleteScope,
            "overwrite":false
         });
      }
      
      public static function executeAll($e:Event = null) : void
      {
         var a:Dictionary = null;
         var p:Object = null;
         var tw:Object = null;
         var t:uint = _curTime = getTimer();
         if(_listening)
         {
            a = _all;
            for each(p in a)
            {
               for(tw in p)
               {
                  if(p[tw] != undefined && Boolean(p[tw].active))
                  {
                     p[tw].render(t);
                  }
               }
            }
         }
      }
      
      public static function removeTween($t:TweenLite = null) : void
      {
         if($t != null && _all[$t.target] != undefined)
         {
            delete _all[$t.target][$t];
         }
      }
      
      public static function killTweensOf($tg:Object = null, $complete:Boolean = false) : void
      {
         var o:Object = null;
         var tw:* = undefined;
         if($tg != null && _all[$tg] != undefined)
         {
            if($complete)
            {
               o = _all[$tg];
               for(tw in o)
               {
                  o[tw].complete(false);
               }
            }
            delete _all[$tg];
         }
      }
      
      public static function killGarbage($e:TimerEvent) : void
      {
         var found:Boolean = false;
         var p:Object = null;
         var twp:Object = null;
         var tw:Object = null;
         var tg_cnt:uint = 0;
         for(p in _all)
         {
            found = false;
            var _loc9_:int = 0;
            var _loc10_:* = _all[p];
            for(twp in _loc10_)
            {
               found = true;
            }
            if(!found)
            {
               delete _all[p];
            }
            else
            {
               tg_cnt++;
            }
         }
         if(tg_cnt == 0)
         {
            _timer.removeEventListener("timer",killGarbage);
            _timer.stop();
            _listening = false;
         }
      }
      
      public static function easeOut($t:Number, $b:Number, $c:Number, $d:Number) : Number
      {
         return -$c * ($t = $t / $d) * ($t - 2) + $b;
      }
      
      public static function tintProxy($o:Object) : void
      {
         var n:Number = Number($o.target.progress);
         var r:Number = 1 - n;
         var sc:Object = $o.info.color;
         var ec:Object = $o.info.endColor;
         $o.info.target.transform.colorTransform = new ColorTransform(sc.redMultiplier * r + ec.redMultiplier * n,sc.greenMultiplier * r + ec.greenMultiplier * n,sc.blueMultiplier * r + ec.blueMultiplier * n,sc.alphaMultiplier * r + ec.alphaMultiplier * n,sc.redOffset * r + ec.redOffset * n,sc.greenOffset * r + ec.greenOffset * n,sc.blueOffset * r + ec.blueOffset * n,sc.alphaOffset * r + ec.alphaOffset * n);
      }
      
      public static function frameProxy($o:Object) : void
      {
         $o.info.target.gotoAndStop(Math.round($o.target.frame));
      }
      
      public static function volumeProxy($o:Object) : void
      {
         $o.info.target.soundTransform = $o.target;
      }
      
      public function initTweenVals($hrp:Boolean = false, $reservedProps:String = "") : void
      {
         var p:String = null;
         var i:* = 0;
         var endArray:Array = null;
         var clr:ColorTransform = null;
         var endClr:ColorTransform = null;
         var tp:Object = null;
         var isDO:Boolean = this.target is DisplayObject;
         if(this.target is Array)
         {
            endArray = this.vars.endArray || [];
            for(i = 0; i < endArray.length; i++)
            {
               if(this.target[i] != endArray[i] && this.target[i] != undefined)
               {
                  this.tweens.push({
                     "o":this.target,
                     "p":i.toString(),
                     "s":this.target[i],
                     "c":endArray[i] - this.target[i]
                  });
               }
            }
         }
         else
         {
            for(p in this.vars)
            {
               if(!(p == "ease" || p == "delay" || p == "overwrite" || p == "onComplete" || p == "onCompleteParams" || p == "onCompleteScope" || p == "runBackwards" || p == "onUpdate" || p == "onUpdateParams" || p == "onUpdateScope" || p == "autoAlpha" || p == "onStart" || p == "onStartParams" || p == "onStartScope" || p == "renderOnStart" || p == "proxiedEase" || p == "easeParams" || $hrp && $reservedProps.indexOf(" " + p + " ") != -1))
               {
                  if(p == "tint" && isDO)
                  {
                     clr = this.target.transform.colorTransform;
                     endClr = new ColorTransform();
                     if(this.vars.alpha != undefined)
                     {
                        endClr.alphaMultiplier = this.vars.alpha;
                        delete this.vars.alpha;
                        for(i = int(this.tweens.length - 1); i > -1; i--)
                        {
                           if(this.tweens[i].p == "alpha")
                           {
                              this.tweens.splice(i,1);
                              break;
                           }
                        }
                     }
                     else
                     {
                        endClr.alphaMultiplier = this.target.alpha;
                     }
                     if(this.vars[p] != null && this.vars[p] != "" || this.vars[p] == 0)
                     {
                        endClr.color = this.vars[p];
                     }
                     this.addSubTween(tintProxy,{"progress":0},{"progress":1},{
                        "target":this.target,
                        "color":clr,
                        "endColor":endClr
                     });
                  }
                  else if(p == "frame" && isDO)
                  {
                     this.addSubTween(frameProxy,{"frame":this.target.currentFrame},{"frame":this.vars[p]},{"target":this.target});
                  }
                  else if(p == "volume" && (isDO || this.target is SoundChannel))
                  {
                     this.addSubTween(volumeProxy,this.target.soundTransform,{"volume":this.vars[p]},{"target":this.target});
                  }
                  else if(this.target.hasOwnProperty(p))
                  {
                     if(typeof this.vars[p] == "number")
                     {
                        this.tweens.push({
                           "o":this.target,
                           "p":p,
                           "s":this.target[p],
                           "c":this.vars[p] - this.target[p]
                        });
                     }
                     else
                     {
                        this.tweens.push({
                           "o":this.target,
                           "p":p,
                           "s":this.target[p],
                           "c":Number(this.vars[p])
                        });
                     }
                  }
               }
            }
         }
         if(this.vars.runBackwards == true)
         {
            for(i = int(this.tweens.length - 1); i > -1; i--)
            {
               tp = this.tweens[i];
               tp.s += tp.c;
               tp.c *= -1;
            }
         }
         if(typeof this.vars.autoAlpha == "number")
         {
            this.target.visible = !(this.vars.runBackwards == true && this.target.alpha == 0);
         }
         this._initted = true;
      }
      
      protected function addSubTween($proxy:Function, $target:Object, $props:Object, $info:Object = null) : void
      {
         var p:String = null;
         var sub:Object = {
            "proxy":$proxy,
            "target":$target,
            "info":$info
         };
         this._subTweens.push(sub);
         for(p in $props)
         {
            if($target.hasOwnProperty(p))
            {
               if(typeof $props[p] == "number")
               {
                  this.tweens.push({
                     "o":$target,
                     "p":p,
                     "s":$target[p],
                     "c":$props[p] - $target[p],
                     "sub":sub
                  });
               }
               else
               {
                  this.tweens.push({
                     "o":$target,
                     "p":p,
                     "s":$target[p],
                     "c":Number($props[p]),
                     "sub":sub
                  });
               }
            }
         }
         this._hst = true;
      }
      
      public function render($t:uint) : void
      {
         var tp:Object = null;
         var i:* = 0;
         var time:Number = ($t - this.startTime) / 1000;
         if(time > this.duration)
         {
            time = this.duration;
         }
         var factor:Number = Number(this.vars.ease(time,0,1,this.duration));
         for(i = int(this.tweens.length - 1); i > -1; i--)
         {
            tp = this.tweens[i];
            tp.o[tp.p] = tp.s + factor * tp.c;
         }
         if(this._hst)
         {
            for(i = int(this._subTweens.length - 1); i > -1; i--)
            {
               this._subTweens[i].proxy(this._subTweens[i]);
            }
         }
         if(this.vars.onUpdate != null)
         {
            this.vars.onUpdate.apply(this.vars.onUpdateScope,this.vars.onUpdateParams);
         }
         if(time == this.duration)
         {
            this.complete(true);
         }
      }
      
      public function complete($skipRender:Boolean = false) : void
      {
         if(!$skipRender)
         {
            if(!this._initted)
            {
               this.initTweenVals();
            }
            this.startTime = _curTime - this.duration * 1000;
            this.render(_curTime);
            return;
         }
         if(typeof this.vars.autoAlpha == "number" && this.target.alpha == 0)
         {
            this.target.visible = false;
         }
         if(this.vars.onComplete != null)
         {
            this.vars.onComplete.apply(this.vars.onCompleteScope,this.vars.onCompleteParams);
         }
         removeTween(this);
      }
      
      protected function easeProxy($t:Number, $b:Number, $c:Number, $d:Number) : Number
      {
         return this.vars.proxiedEase.apply(null,arguments.concat(this.vars.easeParams));
      }
      
      public function get active() : Boolean
      {
         if(this._active)
         {
            return true;
         }
         if((_curTime - this.initTime) / 1000 > this.delay)
         {
            this._active = true;
            this.startTime = this.initTime + this.delay * 1000;
            if(!this._initted)
            {
               this.initTweenVals();
            }
            else if(typeof this.vars.autoAlpha == "number")
            {
               this.target.visible = true;
            }
            if(this.vars.onStart != null)
            {
               this.vars.onStart.apply(this.vars.onStartScope,this.vars.onStartParams);
            }
            if(this.duration == 0.001)
            {
               --this.startTime;
            }
            return true;
         }
         return false;
      }
   }
}

