package com.aurora.ui.maogoutd.consortia
{
   import a_4716.EnmConsortia;
   import a_4752.GameStringManager;
   import a_4781.a_4713;
   import flash.utils.Dictionary;
   
   public class a_3340
   {
      
      private static var _config:Dictionary;
      
      private static var _arrRandomSeed:Array;
      
      private static var _dictJobTitle:Dictionary;
      
      private static var _dictEstablishmentName:Dictionary;
      
      public function a_3340()
      {
         super();
      }
      
      public static function setConfig(xmlData:XML) : void
      {
         parseXML(xmlData);
      }
      
      public static function getConfig() : Dictionary
      {
         return _config;
      }
      
      public static function resetRandomSeed() : void
      {
         if(null != _arrRandomSeed)
         {
            _arrRandomSeed.splice(0);
         }
         _arrRandomSeed = [];
      }
      
      public static function produceRandomSeed(startNum:int = 0, endNum:int = -1) : void
      {
      }
      
      public static function getRandomNum(num:int = 1) : Array
      {
         var id:int = 0;
         var arr:Array = new Array();
         while(num > 0)
         {
            if(0 == _arrRandomSeed.length)
            {
               break;
            }
            id = int(Math.random() * (_arrRandomSeed.length - 1));
            arr.push(_arrRandomSeed.splice(id,1)[0]);
            num--;
         }
         return arr;
      }
      
      public static function appendRandomNums(arrNum:Array) : void
      {
         var v:int = 0;
         if(null == _arrRandomSeed)
         {
            _arrRandomSeed = [];
         }
         var i:int = 0;
         var len:int = int(arrNum.length);
         while(i < len)
         {
            v = int(arrNum[i]);
            if(-1 == _arrRandomSeed.indexOf(v))
            {
               _arrRandomSeed.push(v);
            }
            i++;
         }
      }
      
      public static function deleteRandomNums(arrNum:Array) : void
      {
         var id:int = 0;
         if(null == _arrRandomSeed || 0 == _arrRandomSeed.length)
         {
            return;
         }
         var i:int = 0;
         var len:int = int(arrNum.length);
         while(i < len)
         {
            id = _arrRandomSeed.indexOf(arrNum[i]);
            if(id > -1)
            {
               _arrRandomSeed.splice(id,1);
            }
            i++;
         }
      }
      
      public static function getJobTitle() : Dictionary
      {
         if(null == _dictJobTitle)
         {
            initJobTitle();
         }
         return _dictJobTitle;
      }
      
      public static function getEstablishmentName() : Dictionary
      {
         if(null == _dictEstablishmentName)
         {
            initEstablishmentName();
         }
         return _dictEstablishmentName;
      }
      
      private static function parseXML(xmlData:XML) : void
      {
         var id:int = 0;
         _config = new Dictionary();
         _config["contribute"] = a_4713.getNodeAttributes(xmlData..contribute[0]);
         _config["upgrade"] = {};
         _config["upgrade"]["main"] = getNodeChildren(xmlData..main.item,"level");
         _config["upgrade"]["establishment"] = new Dictionary();
         var items:XMLList = xmlData..establishment.item;
         var i:int = 0;
         var len:int = items.length();
         while(i < len)
         {
            id = parseInt(items[i].@id);
            _config["upgrade"]["establishment"][id] = getNodeChildren(items[i].item,"level");
            i++;
         }
      }
      
      private static function getNodeChildren(node:XMLList, key:String) : Dictionary
      {
         var obj:Object = null;
         var len:int = node.length();
         var dict:Dictionary = new Dictionary();
         for(var i:int = 0; i < len; i++)
         {
            obj = a_4713.getNodeAttributes(node[i] as XML);
            dict[parseInt(obj[key])] = obj;
         }
         return dict;
      }
      
      private static function initJobTitle() : void
      {
         _dictJobTitle = new Dictionary();
         _dictJobTitle[EnmConsortia.a_351] = GameStringManager.getInstance().getString(4310);
         _dictJobTitle[EnmConsortia.a_350] = GameStringManager.getInstance().getString(4311);
         _dictJobTitle[EnmConsortia.a_355] = GameStringManager.getInstance().getString(4312);
         _dictJobTitle[EnmConsortia.a_354] = GameStringManager.getInstance().getString(4313);
         _dictJobTitle[EnmConsortia.a_353] = GameStringManager.getInstance().getString(4314);
      }
      
      private static function initEstablishmentName() : void
      {
         _dictEstablishmentName = new Dictionary();
         _dictEstablishmentName[EnmConsortia.CONSORTIA] = GameStringManager.getInstance().getString(4288);
         _dictEstablishmentName[EnmConsortia.a_380] = GameStringManager.getInstance().getString(4289);
         _dictEstablishmentName[EnmConsortia.a_379] = GameStringManager.getInstance().getString(4290);
         _dictEstablishmentName[EnmConsortia.a_381] = GameStringManager.getInstance().getString(4291);
      }
   }
}

