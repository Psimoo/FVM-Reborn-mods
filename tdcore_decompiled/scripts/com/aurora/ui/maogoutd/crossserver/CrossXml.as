package com.aurora.ui.maogoutd.crossserver
{
   import com.aurora.ui.maogoutd.crossserver.data.MapItemData;
   import flash.utils.Dictionary;
   
   public class CrossXml
   {
      
      private static var m_pInstance:CrossXml;
      
      private var m_vMapList:Vector.<MapItemData>;
      
      private var m_dictMapList:Dictionary;
      
      private var m_dictPlatform:Dictionary;
      
      private var m_vBuyMoney:Vector.<int>;
      
      private var m_iBuyIncrement:int;
      
      public var m_iTime:Vector.<Object>;
      
      private var m_vTempData:Vector.<MapItemData> = new Vector.<MapItemData>();
      
      public function CrossXml()
      {
         super();
         this.m_vMapList = new Vector.<MapItemData>();
         this.m_dictMapList = new Dictionary();
      }
      
      public static function Get() : CrossXml
      {
         if(!m_pInstance)
         {
            m_pInstance = new CrossXml();
         }
         return m_pInstance;
      }
      
      public function Analy(xml:XML) : void
      {
         var item:XML = null;
         var map:XML = null;
         var stMapData:MapItemData = null;
         var platform:XML = null;
         var buy:XML = null;
         var time:XML = null;
         var arrID:Array = null;
         var i:int = 0;
         var len:int = 0;
         var id:int = 0;
         var obj:Object = null;
         var arrNextID:Array = [];
         var dictData:Dictionary = new Dictionary();
         this.m_iTime = new Vector.<Object>();
         for each(map in xml.map_list.map)
         {
            stMapData = new MapItemData();
            stMapData.m_iID = map.@id;
            stMapData.m_iMapType = map.@map_type;
            stMapData.m_iMapID = map.@map_id;
            stMapData.m_strMapName = map.@map_name;
            stMapData.m_iMinDefStar = map.@def_star;
            stMapData.m_iNeedCnt = map.@cnt;
            stMapData.m_iTeamMinDefStar = map.@team_def_star;
            stMapData.m_iTeamNeedCnt = map.@team_cnt;
            stMapData.m_iMapLevel = map.@map_level;
            stMapData.m_iPreID = int(map.@pre_ids);
            if(stMapData.m_iPreID > 0)
            {
               arrNextID.push([stMapData.m_iPreID,stMapData.m_iID]);
            }
            dictData[stMapData.m_iID] = stMapData;
            stMapData.m_arrDrops = [];
            for each(item in map.item)
            {
               stMapData.m_arrDrops.push(int(item.@id));
            }
            this.m_vMapList.push(stMapData);
            if(null == this.m_dictMapList[stMapData.m_iMapType])
            {
               this.m_dictMapList[stMapData.m_iMapType] = new Vector.<MapItemData>();
            }
            this.m_dictMapList[stMapData.m_iMapType].push(stMapData);
         }
         while(arrNextID.length > 0)
         {
            arrID = arrNextID.pop();
            (dictData[arrID[0]] as MapItemData).NextID = arrID[1];
         }
         for each(stMapData in this.m_vMapList)
         {
            i = 0;
            len = int(this.m_vMapList.length);
            while(i < len)
            {
               if(stMapData.m_iPreID == this.m_vMapList[i].m_iID)
               {
                  stMapData.m_iPreMapID = this.m_vMapList[i].m_iMapID;
               }
               i++;
            }
         }
         this.m_dictPlatform = new Dictionary();
         for each(platform in xml.platforms.platform)
         {
            id = int(platform.@id);
            this.m_dictPlatform[id] = [id,String(platform.@platform_name)];
         }
         this.m_vBuyMoney = new Vector.<int>();
         for each(buy in xml.drop_count.buy)
         {
            this.m_vBuyMoney.push(int(buy.@price));
         }
         this.m_iBuyIncrement = xml.drop_count.@increment;
         for each(time in xml.two_player_award.element)
         {
            obj = {};
            obj.m_iStartTime = int(time.@start);
            obj.m_iEndTime = int(time.@end);
            this.m_iTime.push(obj);
         }
      }
      
      public function GetBuyTimeMoney(iTime:int) : int
      {
         var iMaxTime:int = int(this.m_vBuyMoney.length);
         if(iMaxTime > iTime)
         {
            return this.m_vBuyMoney[iTime];
         }
         return (iTime - iMaxTime + 1) * this.m_iBuyIncrement + this.m_vBuyMoney[iMaxTime - 1];
      }
      
      public function GetMapDataList() : Vector.<MapItemData>
      {
         return this.m_vMapList;
      }
      
      public function GetMapDataListByType(iMapType:int) : Vector.<MapItemData>
      {
         if(null == this.m_dictMapList[iMapType])
         {
            return this.m_vTempData;
         }
         return this.m_dictMapList[iMapType];
      }
      
      public function GetMapDataByID(iID:int) : MapItemData
      {
         var stMapData:MapItemData = null;
         for each(stMapData in this.m_vMapList)
         {
            if(stMapData.m_iID == iID)
            {
               return stMapData;
            }
         }
         return null;
      }
      
      public function GetMapDataByMapID(iMapID:int) : MapItemData
      {
         var stMapData:MapItemData = null;
         for each(stMapData in this.m_vMapList)
         {
            if(stMapData.m_iMapID == iMapID)
            {
               return stMapData;
            }
         }
         return null;
      }
      
      public function GetPlatformName(iID:int) : String
      {
         if(Boolean(this.m_dictPlatform) && null != this.m_dictPlatform[iID])
         {
            return this.m_dictPlatform[iID][1];
         }
         return "测试平台";
      }
      
      public function GetPlatformID(name:String) : int
      {
         var arrPlatform:Array = null;
         for each(arrPlatform in this.m_dictPlatform)
         {
            if(name == arrPlatform[1])
            {
               return arrPlatform[0];
            }
         }
         return 0;
      }
   }
}

