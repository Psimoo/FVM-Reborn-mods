package com.aurora.ui.maogoutd.lobby
{
   import a_4723.a_1767;
   import a_4752.a_2037;
   import flash.utils.Dictionary;
   
   public class WorldRoamingXML
   {
      
      public static const MAP_TYPE_MEISHI:int = 1090519040;
      
      public static const MAP_TYPE_HUOSHAN:int = 1107296256;
      
      public static const MAP_TYPE_SKYCASTLE:int = 1124073472;
      
      public static const MAP_TYPE_SEAFLOOR_WHIRLPOOL:int = 34628173824;
      
      public static const MAP_TYPE_NIAN_BOSS_MEISHI:int = 1140850688;
      
      public static const MAP_TYPE_NIAN_BOSS_HUOSHAN:int = 1157627904;
      
      public static const MAP_TYPE_NIAN_BOSS_SKYCASTLE:int = 1174405120;
      
      public static const MAP_TYPE_STAR_TRAVEL:int = 1191182336;
      
      public static const MAP_TYPE_NIAN_BOSS_SEAFLOOR_WHIRLPOOL:int = 2181038080;
      
      private static var m_pInstance:WorldRoamingXML = new WorldRoamingXML();
      
      private var m_iLoopCnt:int;
      
      private var m_iStartTime:int;
      
      private var m_iLoopDay:int;
      
      private var m_vWorldRoamingData:Vector.<WorldRoamingData>;
      
      private var m_dictMapMouse:Dictionary;
      
      public function WorldRoamingXML()
      {
         super();
         this.m_vWorldRoamingData = new Vector.<WorldRoamingData>();
      }
      
      public static function Get() : WorldRoamingXML
      {
         return m_pInstance;
      }
      
      public function GetMapIDByType(iType:int) : int
      {
         var stMapData:WorldRoamingData = null;
         var iID:int = int((a_1767.getInstance().SystemTime - this.m_iStartTime) / (86400 * this.m_iLoopDay)) % this.m_iLoopCnt + 1;
         for each(stMapData in this.m_vWorldRoamingData)
         {
            if(iID == stMapData.m_iID && iType == stMapData.m_iType)
            {
               return stMapData.m_iMapID;
            }
         }
         return 0;
      }
      
      public function GetMapData(iMapID:int) : WorldRoamingData
      {
         var stMapData:WorldRoamingData = null;
         for each(stMapData in this.m_vWorldRoamingData)
         {
            if(iMapID == stMapData.m_iMapID)
            {
               return stMapData;
            }
         }
         return null;
      }
      
      public function IsNianBossType(iMapID:int) : Boolean
      {
         var stMapData:WorldRoamingData = null;
         for each(stMapData in this.m_vWorldRoamingData)
         {
            if(iMapID == stMapData.m_iMapID && (stMapData.m_iType == MAP_TYPE_NIAN_BOSS_MEISHI || stMapData.m_iType == MAP_TYPE_NIAN_BOSS_HUOSHAN || stMapData.m_iType == MAP_TYPE_NIAN_BOSS_SKYCASTLE || stMapData.m_iType == MAP_TYPE_NIAN_BOSS_SEAFLOOR_WHIRLPOOL || stMapData.m_iType == MAP_TYPE_STAR_TRAVEL))
            {
               return true;
            }
         }
         return false;
      }
      
      public function IsWorldRoamingType(iMapID:int) : Boolean
      {
         var stMapData:WorldRoamingData = null;
         for each(stMapData in this.m_vWorldRoamingData)
         {
            if(iMapID == stMapData.m_iMapID && (stMapData.m_iType == MAP_TYPE_MEISHI || stMapData.m_iType == MAP_TYPE_HUOSHAN || stMapData.m_iType == MAP_TYPE_SKYCASTLE || stMapData.m_iType == MAP_TYPE_SEAFLOOR_WHIRLPOOL))
            {
               return true;
            }
         }
         return false;
      }
      
      public function a_2040(xml:XML) : void
      {
         var item:XML = null;
         var iIslandType:int = 0;
         var stMapData:WorldRoamingData = null;
         var id:int = 0;
         var iMapID:int = 0;
         var stMap:XML = null;
         this.m_iStartTime = xml.world_roaming.@loop_start_time;
         this.m_iLoopCnt = xml.world_roaming.@loop_cnt;
         this.m_iLoopDay = xml.world_roaming.@loop_day;
         for each(item in xml.loop)
         {
            iIslandType = int(item.@island_type);
            for each(stMap in item.map)
            {
               stMapData = new WorldRoamingData();
               stMapData.m_iType = iIslandType;
               stMapData.m_iID = int(stMap.@id);
               stMapData.m_iMapID = int(stMap.@map_id);
               this.CheckMapID(stMapData.m_iMapID);
               stMapData.m_strTheme = String(stMap.@theme);
               this.m_vWorldRoamingData.push(stMapData);
            }
         }
      }
      
      private function CheckMapID(id:int) : void
      {
         if(!this.m_dictMapMouse)
         {
            this.m_dictMapMouse = a_2037.getInstance().m_dictMapMouse;
         }
         if(null == this.m_dictMapMouse[id])
         {
            throw new Error("map_mouse.xml 没有该地图ID：0x" + id.toString(16));
         }
      }
   }
}

