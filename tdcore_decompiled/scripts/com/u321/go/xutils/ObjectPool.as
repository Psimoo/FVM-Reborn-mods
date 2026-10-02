package com.u321.go.xutils
{
   import flash.display.*;
   import flash.geom.*;
   import flash.net.*;
   import flash.system.*;
   import flash.utils.*;
   
   public final class ObjectPool
   {
      
      private static var classInstances:Dictionary = new Dictionary(false);
      
      public function ObjectPool()
      {
         super();
      }
      
      public static function CheckOut(c:Class) : Object
      {
         if(!classInstances[c])
         {
            classInstances[c] = new Array();
         }
         var instances:Array = classInstances[c];
         if(instances.length == 0)
         {
            instances.push(new c());
         }
         var r:Object = instances.pop();
         if(r is MovieClip)
         {
            (r as MovieClip).gotoAndPlay(1);
         }
         return r;
      }
      
      public static function CheckIn(object:Object) : void
      {
         var m:MovieClip = null;
         var s:Sprite = null;
         var sh:Shape = null;
         var d:DisplayObject = null;
         if(null == object)
         {
            return;
         }
         var c:Class = object.constructor;
         if(object is MovieClip)
         {
            m = object as MovieClip;
            m.gotoAndStop(1);
         }
         if(object is Sprite)
         {
            s = object as Sprite;
            s.graphics.clear();
         }
         if(object is Shape)
         {
            sh = object as Shape;
            sh.graphics.clear();
         }
         if(object is DisplayObject)
         {
            d = object as DisplayObject;
            d.x = 0;
            d.y = 0;
            d.alpha = 1;
            d.blendMode = BlendMode.NORMAL;
            d.cacheAsBitmap = false;
            d.filters = [];
            d.mask = null;
            d.rotation = 0;
            d.scaleX = 1;
            d.scaleY = 1;
            d.scrollRect = null;
            d.visible = true;
            d.transform.matrix = new Matrix();
            d.transform.colorTransform = new ColorTransform();
         }
         if(!classInstances[c])
         {
            classInstances[c] = new Array();
         }
         var instances:Array = classInstances[c];
         instances.push(object);
      }
      
      public static function removes(c:Class = null, isGC:Boolean = false) : void
      {
         var i:* = undefined;
         if(null != c)
         {
            classInstances[c] = null;
         }
         else
         {
            for(i in classInstances)
            {
               classInstances[i] = null;
            }
         }
         if(isGC)
         {
            garbageCollect();
         }
      }
      
      private static function garbageCollect() : void
      {
         var hlcp:LocalConnection = null;
         var hlcs:LocalConnection = null;
         try
         {
            hlcp = new LocalConnection();
            hlcs = new LocalConnection();
            hlcp.connect("name");
            hlcs.connect("name");
         }
         catch(e:Error)
         {
            System.gc();
            System.gc();
         }
      }
   }
}

