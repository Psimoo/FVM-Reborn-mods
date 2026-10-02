package com.aurora.ui.maogoutd.vow
{
   import a_4781.a_4654;
   import flash.utils.Dictionary;
   
   public class VowConfig
   {
      
      private static var _configData:Object;
      
      public function VowConfig()
      {
         super();
      }
      
      public static function setConfig(ruleData:XML, boxData:XML) : void
      {
         parseData(ruleData,boxData);
      }
      
      public static function getConfig() : Object
      {
         return _configData;
      }
      
      public static function getRuleLevelByValue(value:int) : Object
      {
         var rule:Object = null;
         if(_configData != null)
         {
            return _configData["rule"][value];
         }
         return null;
      }
      
      public static function getLevelItemByCount(items:Array, count:int) : Object
      {
         var i:int = 0;
         var n:int = int(items.length);
         while(i < n)
         {
            if(items[i].nodeAttribute.count == count)
            {
               return items[i];
            }
            i++;
         }
         return null;
      }
      
      public static function getItemElementByID(elements:Array, id:uint) : Object
      {
         var i:int = 0;
         var n:int = int(elements.length);
         while(i < n)
         {
            if(id == elements[i].nodeAttribute.id)
            {
               return elements[i].nodeAttribute;
            }
            i++;
         }
         return null;
      }
      
      public static function getBoxByID(id:int) : Object
      {
         var box:Object = null;
         if(_configData != null)
         {
            box = _configData["box"][id];
            if(box == null)
            {
               return null;
            }
            return box.nodeValue;
         }
         return null;
      }
      
      public static function getItemColorByLevel(level:int) : Object
      {
         var color:Object = null;
         if(_configData != null)
         {
            color = _configData["color"][level];
            if(color == null)
            {
               return null;
            }
            return color.nodeAttribute;
         }
         return null;
      }
      
      public static function getRankGifts() : Dictionary
      {
         var obj:Object = null;
         var nodeDate:Date = null;
         var node:Object = null;
         var gift:Object = _configData["vowGift"];
         var dict:Dictionary = new Dictionary();
         if(gift == null)
         {
            return dict;
         }
         var currentDate:Date = new Date();
         for each(node in gift)
         {
            if(checkGiftTime(node,currentDate))
            {
               obj = {};
               obj.rank = int(node.nodeAttribute.rank);
               obj.gift_id = int(node.nodeAttribute.gift_card);
               dict[obj.rank] = obj;
            }
         }
         return dict;
      }
      
      private static function checkGiftTime(node:Object, curDate:Date) : Boolean
      {
         var sTime:String = String(node.nodeAttribute.s_t);
         var eTime:String = String(node.nodeAttribute.e_t);
         if(sTime == null || sTime == "" || eTime == null || eTime == "")
         {
            return false;
         }
         var sTimes:Array = sTime.split("-");
         var eTimes:Array = eTime.split("-");
         var st:Date = new Date(sTimes[0],sTimes[1] - 1,sTimes[2],0,0,0,0);
         var et:Date = new Date(eTimes[0],eTimes[1] - 1,eTimes[2],"23","59","59",0);
         if(st.time <= curDate.time && et.time >= curDate.time)
         {
            return true;
         }
         return false;
      }
      
      public static function getSymbolData() : Object
      {
         var data:Object = {};
         var obj:Object = _configData["talisman"];
         if(obj == null)
         {
            return null;
         }
         data.mul = int(obj.nodeAttribute.multiple);
         data.mulSp = int(obj.nodeAttribute.mpmax);
         data.muldelta = int(obj.nodeAttribute.mpdelta);
         data.bzSp = int(obj.nodeAttribute.bzmax);
         data.bzdelta = int(obj.nodeAttribute.bzdelta);
         data.minValue = int(obj.nodeAttribute.min);
         return data;
      }
      
      private static function parseData(ruleData:XML, boxData:XML) : void
      {
         _configData = {};
         if(ruleData != null)
         {
            _configData["rule"] = getNodeChildren(ruleData..level,"value");
            _configData["color"] = getNodeChildren(ruleData..color.value,"level");
            _configData["vowGift"] = getNodeChildren(ruleData..vowGift.item,"index");
            _configData["talisman"] = getNodeValue(ruleData..talisman[0]);
         }
         if(boxData != null)
         {
            _configData["box"] = getNodeChildren(boxData..box,"b_id");
         }
      }
      
      private static function getNodeChildren(node:XMLList, key:String, formatHandler:Function = null) : Dictionary
      {
         var obj:Object = null;
         var len:int = node.length();
         var dict:Dictionary = new Dictionary();
         for(var i:int = 0; i < len; i++)
         {
            obj = getNodeValue(node[i] as XML);
            if(obj.nodeAttribute != null)
            {
               dict[obj.nodeAttribute[key]] = obj;
            }
         }
         if(formatHandler != null)
         {
            formatHandler(dict);
         }
         return dict;
      }
      
      private static function getNodeAttributes(node:XML) : Object
      {
         var o:Object = null;
         var i:uint = 0;
         var n:String = null;
         var len:int = node.attributes().length();
         if(len > 0)
         {
            o = {};
            for(i = 0; i < len; i++)
            {
               n = a_4654.trim(node.attributes()[i].name().toString());
               o[n] = a_4654.trim(String(node.attributes()[i]));
               o[n] = node.attributes()[i].toString();
               if(o[n] != "" && !isNaN(o[n] * 1))
               {
                  o[n] *= 1;
               }
            }
         }
         return o;
      }
      
      private static function getNodeValue(node:XML) : Object
      {
         var obj:Object = {};
         obj.nodeAttribute = getNodeAttributes(node);
         obj.nodeValue = parseNodeValue(node);
         obj.nodeName = node.name().toString();
         return obj;
      }
      
      private static function parseNodeValue(node:XML) : *
      {
         var v:* = undefined;
         var children:XMLList = null;
         var n:int = 0;
         var a:Array = null;
         var i:int = 0;
         if(node.hasSimpleContent())
         {
            v = node.toString();
            if(v != "" && !isNaN(v * 1))
            {
               v *= 1;
            }
            return v;
         }
         children = node.children();
         n = children.length();
         a = new Array(n);
         for(i = 0; i < n; i++)
         {
            a[i] = getNodeValue(children[i]);
         }
         return a;
      }
   }
}

