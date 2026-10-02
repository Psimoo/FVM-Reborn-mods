package com.aurora.ui.maogoutd.ThunderCity
{
   import flash.utils.Dictionary;
   
   public class ThunderCityConfig
   {
      
      private static var m_pInstance:ThunderCityConfig;
      
      private var m_mapList:Array = new Array();
      
      private var HappyHolidayMapList:Dictionary = new Dictionary();
      
      private var TestMapList:Dictionary = new Dictionary();
      
      public function ThunderCityConfig()
      {
         super();
      }
      
      public static function Get() : ThunderCityConfig
      {
         if(!m_pInstance)
         {
            m_pInstance = new ThunderCityConfig();
         }
         return m_pInstance;
      }
      
      public function a_2040(xml:XML) : void
      {
         var ele:XML = null;
         var item:XML = null;
         var obj:Object = null;
         var mapName:String = null;
         var testMapName:String = null;
         if(xml == null)
         {
            return;
         }
         this.mapList = new Array();
         for each(ele in xml.ThunderCityList)
         {
            for each(item in ele.item)
            {
               obj = new Object();
               obj.mapId = int(item.@mapId);
               obj.m_land = int(item.@land).toString(8);
               obj.needLevel = int(item.@needLevel);
               obj.openBoolean = item.@open.toString() == "1" ? true : false;
               this.mapList.push(obj);
            }
         }
         for each(ele in xml.HappyHoliday)
         {
            for each(item in ele.item)
            {
               mapName = this.IntToStringFormat(item.@mapId);
               this.HappyHolidayMapList[mapName] = item.@mapId;
            }
         }
         for each(ele in xml.TestMapList)
         {
            for each(item in ele.item)
            {
               testMapName = this.IntToStringFormat(item.@mapId);
               this.TestMapList[testMapName] = item.@mapId;
            }
         }
      }
      
      public function get mapList() : Array
      {
         return this.m_mapList;
      }
      
      public function set mapList(value:Array) : void
      {
         this.m_mapList = value;
      }
      
      public function GetNianMapID(iType:int) : int
      {
         iType.toString();
         if(iType >= 1 && iType <= this.mapList.length)
         {
            return this.mapList[iType - 1].mapId;
         }
         return 0;
      }
      
      public function GetNianMapLand(iType:int) : int
      {
         iType.toString();
         if(iType >= 1 && iType <= this.mapList.length)
         {
            return this.mapList[iType - 1].m_land;
         }
         return 0;
      }
      
      public function GetMapInfoByID(mapID:int) : Object
      {
         for(var i:int = 0; i < this.mapList.length; i++)
         {
            if(this.mapList[i].mapId == mapID)
            {
               return this.mapList[i];
            }
         }
         return null;
      }
      
      public function IntToStringFormat(mapID:int) : String
      {
         var idStr:String = mapID.toString(16);
         switch(idStr.length)
         {
            case 1:
               return "0x000" + idStr;
            case 2:
               return "0x00" + idStr;
            case 3:
               return "0x0" + idStr;
            case 4:
               return "0x" + idStr;
            default:
               return "0x0000";
         }
      }
      
      public function isHappyHolidayMap(iMapID:int) : Boolean
      {
         if(this.HappyHolidayMapList[this.IntToStringFormat(iMapID)] != null)
         {
            return true;
         }
         return false;
      }
      
      public function isTestMap(iMapID:int) : Boolean
      {
         if(this.TestMapList[this.IntToStringFormat(iMapID)] != null)
         {
            return true;
         }
         return false;
      }
      
      public function getHappyHolidayMapID() : String
      {
         var i:String = null;
         var _loc2_:int = 0;
         var _loc3_:* = this.HappyHolidayMapList;
         for each(i in _loc3_)
         {
            return i;
         }
         return "0x0000";
      }
   }
}

