package com.greensock.plugins
{
   import com.greensock.*;
   import com.greensock.core.*;
   
   public class TweenPlugin
   {
      
      public static const VERSION:Number = 1.31;
      
      public static const API:Number = 1;
      
      public var propName:String;
      
      public var overwriteProps:Array;
      
      public var round:Boolean;
      
      public var priority:int = 0;
      
      public var activeDisable:Boolean;
      
      public var onComplete:Function;
      
      public var onEnable:Function;
      
      public var onDisable:Function;
      
      protected var _tweens:Array = [];
      
      protected var _changeFactor:Number = 0;
      
      public function TweenPlugin()
      {
         super();
      }
      
      private static function onTweenEvent(type:String, tween:TweenLite) : Boolean
      {
         var changed:Boolean = false;
         var tweens:Array = null;
         var i:* = 0;
         var pt:PropTween = tween.cachedPT1;
         if(type == "onInit")
         {
            tweens = [];
            while(pt)
            {
               tweens[tweens.length] = pt;
               pt = pt.nextNode;
            }
            tweens.sortOn("priority",Array.NUMERIC | Array.DESCENDING);
            i = int(tweens.length);
            while(i--)
            {
               PropTween(tweens[i]).nextNode = tweens[i + 1];
               PropTween(tweens[i]).prevNode = tweens[i - 1];
            }
            tween.cachedPT1 = tweens[0];
         }
         else
         {
            while(pt)
            {
               if(pt.isPlugin && Boolean(pt.target[type]))
               {
                  if(pt.target.activeDisable)
                  {
                     changed = true;
                  }
                  pt.target[type]();
               }
               pt = pt.nextNode;
            }
         }
         return changed;
      }
      
      public static function activate(plugins:Array) : Boolean
      {
         var instance:Object = null;
         TweenLite.onPluginEvent = TweenPlugin.onTweenEvent;
         var i:* = int(plugins.length);
         while(i--)
         {
            if(plugins[i].hasOwnProperty("API"))
            {
               instance = new (plugins[i] as Class)();
               TweenLite.plugins[instance.propName] = plugins[i];
            }
         }
         return true;
      }
      
      public function onInitTween(target:Object, value:*, tween:TweenLite) : Boolean
      {
         this.addTween(target,this.propName,target[this.propName],value,this.propName);
         return true;
      }
      
      protected function addTween(object:Object, propName:String, start:Number, end:*, overwriteProp:String = null) : void
      {
         var change:Number = NaN;
         if(end != null)
         {
            change = typeof end == "number" ? Number(end) - start : Number(end);
            if(change != 0)
            {
               this._tweens[this._tweens.length] = new PropTween(object,propName,start,change,overwriteProp || propName,false);
            }
         }
      }
      
      protected function updateTweens(changeFactor:Number) : void
      {
         var pt:PropTween = null;
         var val:Number = NaN;
         var i:* = int(this._tweens.length);
         if(this.round)
         {
            while(i--)
            {
               pt = this._tweens[i];
               val = pt.start + pt.change * changeFactor;
               pt.target[pt.property] = val > 0 ? int(val + 0.5) : int(val - 0.5);
            }
         }
         else
         {
            while(i--)
            {
               pt = this._tweens[i];
               pt.target[pt.property] = pt.start + pt.change * changeFactor;
            }
         }
      }
      
      public function set changeFactor(n:Number) : void
      {
         this.updateTweens(n);
         this._changeFactor = n;
      }
      
      public function get changeFactor() : Number
      {
         return this._changeFactor;
      }
      
      public function killProps(lookup:Object) : void
      {
         var i:* = int(this.overwriteProps.length);
         while(i--)
         {
            if(this.overwriteProps[i] in lookup)
            {
               this.overwriteProps.splice(i,1);
            }
         }
         i = int(this._tweens.length);
         while(i--)
         {
            if(PropTween(this._tweens[i]).name in lookup)
            {
               this._tweens.splice(i,1);
            }
         }
      }
   }
}

