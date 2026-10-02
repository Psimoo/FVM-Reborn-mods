package com.aurora.ui.maogoutd.resource
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getTimer;
   
   public class EffectManager
   {
      
      private static var _instance:EffectManager;
      
      private var m_timer:Timer;
      
      private var m_list:Array;
      
      private var m_lastTick:int = -1;
      
      private const TICK_INTERVAL:int = 100;
      
      private var m_dictEffect:Dictionary = new Dictionary();
      
      public var m_arrEffectArray:Array = new Array();
      
      public function EffectManager()
      {
         super();
         this.m_list = [];
         this.m_timer = new Timer(this.TICK_INTERVAL);
         this.m_timer.addEventListener(TimerEvent.TIMER,this.OnTick);
         this.m_timer.start();
      }
      
      public static function getInstance() : EffectManager
      {
         if(_instance == null)
         {
            _instance = new EffectManager();
         }
         return _instance;
      }
      
      public function Add(effect:a_4108) : void
      {
         if(this.m_list.indexOf(effect) == -1)
         {
            this.m_list.push(effect);
         }
      }
      
      public function Remove(effect:a_4108) : void
      {
         var idx:int = this.m_list.indexOf(effect);
         if(idx != -1)
         {
            this.m_list.splice(idx,1);
         }
      }
      
      private function OnTick(e:TimerEvent) : void
      {
         var now:int = getTimer();
         if(this.m_lastTick == -1)
         {
            this.m_lastTick = now;
            return;
         }
         var delta:int = now - this.m_lastTick;
         if(delta < this.TICK_INTERVAL)
         {
            return;
         }
         var tickCount:* = int(delta / this.TICK_INTERVAL);
         tickCount = int(Math.min(tickCount,5));
         this.m_lastTick += tickCount * this.TICK_INTERVAL;
         while(tickCount-- > 0)
         {
            this.OnLogicTick();
         }
      }
      
      private function OnLogicTick() : void
      {
         for(var i:* = int(this.m_list.length - 1); i >= 0; i--)
         {
            if(i < this.m_list.length)
            {
               this.m_list[i].Tick(null);
            }
         }
      }
      
      public function GetMoveClip(gameMoveClipClass:Class) : Object
      {
         var obj:Object = null;
         var moveClip:MovieClip = null;
         var className:String = getQualifiedClassName(gameMoveClipClass);
         if(this.m_dictEffect[className] == null)
         {
            obj = new Object();
            if(gameMoveClipClass == null)
            {
               moveClip = new MovieClip();
               obj.a_1300 = new Vector.<BitmapData>(100);
               obj.a_1301 = new Vector.<Point>(100);
            }
            else
            {
               moveClip = new gameMoveClipClass();
               obj.a_1300 = new Vector.<BitmapData>(moveClip.totalFrames + 1);
               obj.a_1301 = new Vector.<Point>(moveClip.totalFrames + 1);
            }
            obj.moveClip = moveClip;
            this.m_dictEffect[className] = obj;
         }
         return this.m_dictEffect[className];
      }
      
      public function GetMoveClip2(movieClip:GameMovieClip) : Object
      {
         return this.m_dictEffect[getQualifiedClassName(movieClip)];
      }
      
      public function CheckOutEffect(gameMoveClipClass:Class) : BaseGameEffect
      {
         return this.CheckOutOne(BaseGameEffect,gameMoveClipClass);
      }
      
      public function CheckOutOne(effectClass:Class, gameMoveClipClass:Class) : BaseGameEffect
      {
         if(effectClass == null)
         {
            effectClass = BaseGameEffect;
         }
         var effect:BaseGameEffect = PoolManager.getInstance().CheckOutOne(effectClass,gameMoveClipClass) as BaseGameEffect;
         effect.a_1797(false);
         this.m_arrEffectArray.push(effect);
         return effect;
      }
      
      public function ReleaseAll() : void
      {
         var stEffect:BaseGameEffect = null;
         while(this.m_arrEffectArray.length > 0)
         {
            stEffect = this.m_arrEffectArray.pop();
            if(stEffect)
            {
               stEffect.a_3940();
            }
         }
      }
   }
}

