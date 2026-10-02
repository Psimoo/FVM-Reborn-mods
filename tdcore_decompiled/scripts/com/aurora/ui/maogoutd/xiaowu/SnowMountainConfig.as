package com.aurora.ui.maogoutd.xiaowu
{
   public class SnowMountainConfig
   {
      
      private static var m_pInstance:SnowMountainConfig;
      
      private var m_mapList:Array = new Array();
      
      public function SnowMountainConfig()
      {
         super();
      }
      
      public static function Get() : SnowMountainConfig
      {
         if(!m_pInstance)
         {
            m_pInstance = new SnowMountainConfig();
         }
         return m_pInstance;
      }
      
      public function a_2040(xml:XML) : void
      {
         var ele:XML = null;
         var item:XML = null;
         var obj:Object = null;
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
   }
}

