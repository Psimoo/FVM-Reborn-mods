package com.aurora.ui.maogoutd.newguide
{
   import com.adobe.serialization.json.JSON;
   import flash.utils.Dictionary;
   
   public class NewGuideConfig
   {
      
      private static var _instance:NewGuideConfig;
      
      private static var _index:int;
      
      private var configDict:Dictionary;
      
      public function NewGuideConfig()
      {
         super();
         if(_index > 0)
         {
            throw new Error("NewGuide Constructed failed!");
         }
         ++_index;
      }
      
      public static function get Instance() : NewGuideConfig
      {
         if(_instance == null)
         {
            _instance = new NewGuideConfig();
         }
         return _instance;
      }
      
      public function parseGuideXML(xml:XML) : void
      {
         if(this.configDict == null)
         {
            this.configDict = new Dictionary(true);
         }
         if(xml == null)
         {
            return;
         }
         this.configDict["islandtap"] = xml.islandTap;
         this.configDict["animation"] = xml.modelGuide;
         this.configDict["modelopen"] = xml.modelOpen;
         this.configDict["newcard"] = xml.newCard;
         this.configDict["storyguide"] = xml.storyGuide;
         this.configDict["levelup"] = xml.levelOpen;
      }
      
      public function getIslandTap() : Dictionary
      {
         var item:XML = null;
         var dict:Dictionary = new Dictionary();
         var xml:XML = this.configDict["islandtap"][0];
         if(xml == null)
         {
            return dict;
         }
         for each(item in xml.island)
         {
            dict[String(item.@value)] = item;
         }
         return dict;
      }
      
      public function getStoryGuideConfig(curGuideId:int) : Dictionary
      {
         var item:XML = null;
         var obj:Object = null;
         var dict:Dictionary = new Dictionary();
         if(this.configDict == null || this.configDict["storyguide"] == null)
         {
            return dict;
         }
         for each(item in this.configDict["storyguide"][0].guide)
         {
            obj = {};
            obj.name = "StoryGuideAnimation";
            item.@guide_id = curGuideId;
            obj.animation = item;
            dict[int(item.@id)] = obj;
         }
         return dict;
      }
      
      public function getStoryGuideConfigByLevel(role_level:int) : Array
      {
         var item:XML = null;
         var sLevel:int = 0;
         var arr:Array = [];
         if(this.configDict == null || this.configDict["storyguide"] == null)
         {
            return arr;
         }
         for each(item in this.configDict["storyguide"][0].guide)
         {
            sLevel = int(item.@level);
            if(item != null && int(item.@level) != -1 && sLevel == role_level)
            {
               arr.push(int(item.@id));
               item.@level = -1;
            }
         }
         return arr;
      }
      
      public function getAnimationConfig() : Dictionary
      {
         var item:XML = null;
         var subItem:XML = null;
         var str:String = null;
         var obj:Object = null;
         var dict:Dictionary = new Dictionary();
         if(this.configDict == null || this.configDict["animation"] == null)
         {
            return dict;
         }
         for each(item in this.configDict["animation"][0].model)
         {
            if(item != null)
            {
               for each(subItem in item.animation)
               {
                  if(subItem != null)
                  {
                     str = String(item.@value).replace("TD","");
                     str = str.replace("UI","");
                     obj = {};
                     obj.name = str + "GuideAnimation";
                     obj.taskID = int(subItem.@guide_task);
                     obj.animation = subItem;
                     obj.id = int(subItem.@id);
                     dict[int(subItem.@id)] = obj;
                  }
               }
            }
         }
         return dict;
      }
      
      public function getModelOpenConfig() : Dictionary
      {
         var item:XML = null;
         var str:String = null;
         var obj:Object = null;
         var dict:Dictionary = new Dictionary();
         if(this.configDict == null || this.configDict["modelopen"] == null)
         {
            return dict;
         }
         for each(item in this.configDict["modelopen"][0].item)
         {
            if(item != null)
            {
               str = String(item.@class_type);
               obj = {};
               obj.name = str + "Animation";
               obj.animation = item;
               dict[int(item.@id)] = obj;
            }
         }
         return dict;
      }
      
      public function getModelOpenIDsByLevel(level:int) : Array
      {
         var item:XML = null;
         var animation_id:Array = [];
         if(level < 0)
         {
            return animation_id;
         }
         if(this.configDict == null || this.configDict["modelopen"] == null)
         {
            return animation_id;
         }
         for each(item in this.configDict["modelopen"][0].item)
         {
            if(item != null && int(item.@open_level) != -1 && int(item.@open_level) == level)
            {
               animation_id.push(int(item.@id));
            }
         }
         return animation_id;
      }
      
      public function getNewCardConfig() : Dictionary
      {
         var item:XML = null;
         var str:String = null;
         var obj:Object = null;
         var dict:Dictionary = new Dictionary();
         if(this.configDict == null || this.configDict["newcard"] == null)
         {
            return dict;
         }
         for each(item in this.configDict["newcard"][0].item)
         {
            if(item != null)
            {
               str = String(item.@class_type);
               obj = {};
               obj.name = str + "Animation";
               obj.id = int(item.@id);
               obj.task_id = int(item.@task_id);
               obj.animation = item;
               dict[int(item.@id)] = obj;
            }
         }
         return dict;
      }
      
      public function getNewCardIDByCardsArr(cards:Array) : int
      {
         var item:XML = null;
         var cardsObj:Object = null;
         var idStr:String = null;
         var i:int = 0;
         var id:int = -1;
         if(cards == null || cards.length == 0)
         {
            return id;
         }
         if(this.configDict == null || this.configDict["newcard"] == null)
         {
            return id;
         }
         var tmpArr:Array = [];
         for each(item in this.configDict["newcard"][0].item)
         {
            tmpArr.splice(0);
            tmpArr = tmpArr.concat(cards);
            if(item != null && int(item.@level) == 1)
            {
               cardsObj = com.adobe.serialization.json.JSON.decode(String(item.@card));
               for each(idStr in cardsObj)
               {
                  i = 0;
                  while(i < tmpArr.length)
                  {
                     if(tmpArr[i] == int(idStr))
                     {
                        tmpArr.splice(i,1);
                        break;
                     }
                     i++;
                  }
               }
            }
            if(tmpArr.length == 0)
            {
               id = int(item.@id);
               break;
            }
         }
         return id;
      }
      
      public function getLevelUpConfig() : Dictionary
      {
         var item:XML = null;
         var obj:Object = null;
         var dict:Dictionary = new Dictionary();
         if(this.configDict == null || this.configDict["levelup"] == null)
         {
            return dict;
         }
         for each(item in this.configDict["levelup"][0].item)
         {
            if(item != null)
            {
               obj = {};
               obj.name = "LevelUpAnimation";
               obj.id = int(item.@id);
               obj.animation = {};
               obj.animation.show_pos = item.@show_pos;
               dict[int(item.@level)] = obj;
            }
         }
         return dict;
      }
   }
}

