package com.aurora.ui.maogoutd.component.scrollBar
{
   import a_4802.a_4706;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.getDefinitionByName;
   
   public class a_3282
   {
      
      private static var dictSkin:Dictionary;
      
      public function a_3282()
      {
         super();
      }
      
      public static function create(id:String = "default", ScrollThumb_A:String = null, ScrollThumb_B:String = null, ScrollThumb_C:String = null, ScrollThumb_D:String = null, ScrollTrack:String = null, ScrollArrowDown:String = null, ScrollArrowUp:String = null) : a_4706
      {
         if(dictSkin == null)
         {
            dictSkin = new Dictionary();
         }
         if(dictSkin[id] == null)
         {
            if(ScrollThumb_A == null || ScrollThumb_B == null || ScrollThumb_C == null || ScrollThumb_D == null || ScrollTrack == null || ScrollArrowDown == null || ScrollArrowUp == null)
            {
               id = "default";
               ScrollThumb_A = "com.aurora.ui.maogoutd.component.scrollBar.ScrollThumb_A";
               ScrollThumb_B = "com.aurora.ui.maogoutd.component.scrollBar.ScrollThumb_B";
               ScrollThumb_C = "com.aurora.ui.maogoutd.component.scrollBar.ScrollThumb_C";
               ScrollThumb_D = "com.aurora.ui.maogoutd.component.scrollBar.ScrollThumb_D";
               ScrollTrack = "com.aurora.ui.maogoutd.component.scrollBar.ScrollTrack";
               ScrollArrowDown = "com.aurora.ui.maogoutd.component.scrollBar.ScrollArrowDown";
               ScrollArrowUp = "com.aurora.ui.maogoutd.component.scrollBar.ScrollArrowUp";
            }
            if(dictSkin[id] == null)
            {
               dictSkin[id] = a_3283(ScrollThumb_A,ScrollThumb_B,ScrollThumb_C,ScrollThumb_D,ScrollTrack,ScrollArrowDown,ScrollArrowUp);
            }
         }
         return createHandle(dictSkin[id]);
      }
      
      public static function destory(id:String) : void
      {
         var k:String = null;
         if(dictSkin == null)
         {
            return;
         }
         if(dictSkin[id] == null)
         {
            return;
         }
         var dict:Dictionary = dictSkin[id];
         for(k in dict)
         {
            dict[k].dispose();
         }
         delete dictSkin[id];
      }
      
      private static function a_3283(ScrollThumb_A:String = null, ScrollThumb_B:String = null, ScrollThumb_C:String = null, ScrollThumb_D:String = null, ScrollTrack:String = null, ScrollArrowDown:String = null, ScrollArrowUp:String = null) : Dictionary
      {
         var dict:Dictionary = new Dictionary(true);
         dict["Thumb_A"] = getInstance(ScrollThumb_A);
         dict["Thumb_B"] = getInstance(ScrollThumb_B);
         dict["Thumb_C"] = getInstance(ScrollThumb_C);
         dict["Thumb_D"] = getInstance(ScrollThumb_D);
         dict["Track"] = getInstance(ScrollTrack);
         dict["ArrowDown"] = getInstance(ScrollArrowDown);
         dict["ArrowUp"] = getInstance(ScrollArrowUp);
         return dict;
      }
      
      private static function getInstance(className:String) : BitmapData
      {
         var bmd:BitmapData = null;
         var RefClass:Object = getDefinitionByName(className);
         var obj:* = new RefClass();
         if(!(obj is BitmapData))
         {
            bmd = new BitmapData(obj.width,obj.height,true,16777215);
            obj = bmd.draw(obj);
         }
         return obj as BitmapData;
      }
      
      private static function createHandle(dictSkin:Dictionary) : a_4706
      {
         var dict:Dictionary = null;
         var j:int = 0;
         var bmd:BitmapData = null;
         var tmp:* = undefined;
         var arrowDown:Dictionary = v3cutImg(dictSkin["ArrowDown"]);
         var arrowUp:Dictionary = v3cutImg(dictSkin["ArrowUp"]);
         var thumb:Dictionary = new Dictionary(true);
         var thumbPro:Array = new Array("upState","overState","downState","disabledState");
         var statePro:Array = new Array("a","b","c","d");
         var bmds:Array = new Array(4);
         bmds[0] = dictSkin["Thumb_A"];
         bmds[1] = dictSkin["Thumb_B"];
         bmds[2] = dictSkin["Thumb_C"];
         for(var i:int = 0; i < 4; i++)
         {
            dict = new Dictionary(true);
            for(j = 0; j < 4; j++)
            {
               if(i == 3)
               {
                  dict[statePro[j]] = new Bitmap();
               }
               else
               {
                  if(j == 3)
                  {
                     bmd = dictSkin["Thumb_D"];
                  }
                  else
                  {
                     tmp = bmds[j];
                     bmd = getBmd(tmp as BitmapData,new Rectangle(0,tmp.height * i / 3,tmp.width,tmp.height / 3));
                  }
                  dict[statePro[j]] = new Bitmap(bmd);
               }
            }
            thumb[thumbPro[i]] = dict;
         }
         var track:Dictionary = new Dictionary(true);
         track.upState = new Bitmap(dictSkin["Track"]);
         track.overState = new Bitmap(dictSkin["Track"]);
         track.downState = new Bitmap(dictSkin["Track"]);
         track.disabledState = new Bitmap();
         return new a_4706(arrowDown,arrowUp,thumb,track);
      }
      
      private static function getV3StateSkin(source:BitmapData) : Dictionary
      {
         var bmd:BitmapData = null;
         var w:Number = NaN;
         var h:Number = NaN;
         var ba:ByteArray = null;
         var dict:Dictionary = new Dictionary(true);
         var states:Array = ["upState","overState","downState","disabledState"];
         var i:int = 0;
         var len:int = int(states.length);
         while(i < len - 1)
         {
            w = source.width;
            h = source.height / 3;
            ba = source.getPixels(new Rectangle(0,h * i,w,h));
            ba.position = 0;
            bmd = new BitmapData(w,h,true);
            bmd.setPixels(new Rectangle(0,0,w,h),ba);
            dict[states[i]] = new Bitmap(bmd);
            i++;
         }
         source.dispose();
         return dict;
      }
      
      private static function get1StateSkin(source:BitmapData) : Dictionary
      {
         var dict:Dictionary = new Dictionary();
         var states:Array = ["upState","overState","downState","disabledState"];
         var i:int = 0;
         var len:int = int(states.length);
         while(i < len)
         {
            dict[states[i]] = new Bitmap(source);
            i++;
         }
         return dict;
      }
      
      private static function getBmd(source:BitmapData, rect:Rectangle) : BitmapData
      {
         var ba:ByteArray = source.getPixels(rect);
         ba.position = 0;
         var bmd:BitmapData = new BitmapData(rect.width,rect.height,true);
         bmd.setPixels(new Rectangle(0,0,rect.width,rect.height),ba);
         return bmd;
      }
      
      private static function v3cutImg(source:BitmapData) : Dictionary
      {
         var bmd:BitmapData = null;
         var dict:Dictionary = new Dictionary(true);
         var thumbPro:Array = new Array("upState","overState","downState","disabledState");
         var w:int = source.width;
         var h:int = source.height / 3;
         for(var i:int = 0; i < 4; i++)
         {
            if(i < 3)
            {
               bmd = getBmd(source,new Rectangle(0,h * i,w,h));
            }
            dict[thumbPro[i]] = new Bitmap(bmd);
         }
         return dict;
      }
   }
}

