package com.aurora.utils.anticheat
{
   public class BehaviorCollector
   {
      
      private var _events:Array = [];
      
      private var _ban:Boolean;
      
      private const MAX_EVENTS:int = 1000;
      
      public function BehaviorCollector()
      {
         super();
      }
      
      public function record(type:String, data:Object) : void
      {
         var timestamp:Number = new Date().getTime();
         this._events.push({
            "t":timestamp,
            "type":type,
            "data":data
         });
         if(this._events.length > this.MAX_EVENTS)
         {
            this._events.shift();
         }
      }
      
      public function recordBan(value:Boolean) : void
      {
         this._ban = value;
      }
      
      public function getBanValue() : Boolean
      {
         return this._ban;
      }
      
      public function getEventSequence() : Array
      {
         return this._events.slice();
      }
      
      public function clear() : void
      {
         this._events = [];
      }
      
      public function traceInfo() : void
      {
         trace("#### events:" + this._events.length);
      }
   }
}

