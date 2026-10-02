package com.aurora.ui.maogoutd.compositemap
{
   import com.aurora.ui.maogoutd.compositemap.data.ComMapData;
   import com.aurora.ui.maogoutd.compositemap.data.FieldGridData;
   import flash.utils.Dictionary;
   
   public class CompositeMapXML
   {
      
      private static var m_pInstance:CompositeMapXML;
      
      private var m_dictMapData:Dictionary;
      
      public function CompositeMapXML()
      {
         super();
         this.m_dictMapData = new Dictionary();
      }
      
      public static function Get() : CompositeMapXML
      {
         if(null == m_pInstance)
         {
            m_pInstance = new CompositeMapXML();
         }
         return m_pInstance;
      }
      
      public function a_2040(xml:XML) : void
      {
         var map:XML = null;
         var grid:XML = null;
         var mapData:ComMapData = null;
         var gridData:FieldGridData = null;
         for each(map in xml.maps.map)
         {
            mapData = new ComMapData();
            mapData.m_iMapID = map.@map_id;
            mapData.m_iStageType = map.@stage_type;
            mapData.m_strBGUrl = map.@bg_url;
            mapData.m_strInsideBGUrl = map.@inside_bg;
            mapData.m_strShowBGUrl = map.@show_bg;
            mapData.m_strShowInsideBGUrl = map.@show_inside_bg;
            mapData.m_strSoundBGUrl = map.@sound_url;
            mapData.m_strBossSoundBGUrl = map.@boss_sound_url;
            mapData.m_iBattleModeType = map.@battle_mode_type;
            mapData.m_iWeatherType = map.@weather_type;
            mapData.m_iDropType = map.@drop_type;
            mapData.m_iAirTime = map.@air_time;
            if(map.hasOwnProperty("@frozen_time"))
            {
               mapData.m_FrozenTime = map.@frozen_time;
            }
            if(map.hasOwnProperty("@frozenCD_time"))
            {
               mapData.m_FrozenCDTime = map.@frozenCD_time;
            }
            if(map.hasOwnProperty("@sandstorm_restore"))
            {
               mapData.sandstorm_restore = map.@sandstorm_restore;
            }
            if(map.hasOwnProperty("@sandstorm_initial_col"))
            {
               mapData.sandstorm_initial_col = map.@sandstorm_initial_col;
            }
            if(map.hasOwnProperty("@sandstorm_time"))
            {
               mapData.sandstorm_time = map.@sandstorm_time;
            }
            if(map.hasOwnProperty("@sandstormCD_time"))
            {
               mapData.sandstormCD_time = map.@sandstormCD_time;
            }
            if(map.hasOwnProperty("@tornado_time"))
            {
               mapData.tornado_time = map.@tornado_time;
            }
            if(map.hasOwnProperty("@tornado_num"))
            {
               mapData.tornado_num = int(map.@tornado_num);
            }
            for each(grid in map.field_grid)
            {
               gridData = new FieldGridData();
               gridData.m_iGridType = grid.@grid_type;
               gridData.x = grid.@x;
               gridData.y = grid.@y;
               gridData.m_strResUrl = grid.@res_url;
               if(grid.hasOwnProperty("@tornado_group"))
               {
                  gridData.tornado_group = int(grid.@tornado_group);
               }
               if(grid.hasOwnProperty("@tornado_type"))
               {
                  gridData.tornado_type = int(grid.@tornado_type);
               }
               mapData.m_vGridData.push(gridData);
            }
            this.m_dictMapData[mapData.m_iMapID] = mapData;
         }
      }
      
      public function GetMapData(iMapID:int) : ComMapData
      {
         return this.m_dictMapData[iMapID];
      }
   }
}

