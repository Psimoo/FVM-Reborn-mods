package com.aurora.ui.maogoutd.diy.xml
{
   import com.aurora.ui.maogoutd.compositemap.data.ComMapData;
   import com.aurora.ui.maogoutd.compositemap.data.FieldGridData;
   import com.aurora.ui.maogoutd.diy.myEditor.data.BossData;
   import com.aurora.ui.maogoutd.diy.myEditor.data.BossLevelData;
   import com.aurora.ui.maogoutd.diy.myEditor.data.DegreeValue;
   import com.aurora.ui.maogoutd.diy.myEditor.data.DescData;
   import com.aurora.ui.maogoutd.diy.myEditor.data.LandItemData;
   import com.aurora.ui.maogoutd.diy.myEditor.data.MapData;
   import com.aurora.ui.maogoutd.diy.myEditor.data.MapformData;
   import com.aurora.ui.maogoutd.diy.myEditor.data.MonsterData;
   import com.aurora.ui.maogoutd.diy.myEditor.data.MouseLinesChatBubblesData;
   import com.aurora.ui.maogoutd.diy.myEditor.data.MouseLinesTalkMouseData;
   import com.aurora.ui.maogoutd.diy.myEditor.data.ShopData;
   import flash.utils.Dictionary;
   
   public class DIYConfigData
   {
      
      public static var m_pInstance:DIYConfigData;
      
      public var m_vMapData:Vector.<MapData>;
      
      public var m_vMonsterData:Vector.<MonsterData>;
      
      public var m_vBossData:Vector.<BossData>;
      
      public var m_vBossLevelData:Vector.<BossLevelData>;
      
      public var m_vShopData:Vector.<ShopData>;
      
      public var m_vDegreeValue:Vector.<DegreeValue>;
      
      public var m_vDesc:Vector.<DescData>;
      
      public var m_vLandform:Vector.<LandItemData>;
      
      public var m_vMapform:Vector.<MapformData>;
      
      public var m_dictMonseLife:Dictionary;
      
      public var m_dictMouseSummon:Dictionary;
      
      public var m_iCurrentMapID:int = 0;
      
      public var m_arrBarrir:Array = [];
      
      public var m_iDraftsLot:int;
      
      public var m_iPublishsLot:int;
      
      public var m_iMinAdapterRatio:int;
      
      public var m_iMaxAdapterRatio:int;
      
      public var m_vMouseLinesChatBubblesData:Vector.<MouseLinesChatBubblesData>;
      
      public var m_vMouseLinesTalkMouseData:Vector.<MouseLinesTalkMouseData>;
      
      public function DIYConfigData()
      {
         super();
      }
      
      public static function Get() : DIYConfigData
      {
         if(!m_pInstance)
         {
            m_pInstance = new DIYConfigData();
         }
         return m_pInstance;
      }
      
      public function a_2040(xml:XML) : void
      {
         var map:XML = null;
         var grid:XML = null;
         var mapData:MapData = null;
         var gridData:FieldGridData = null;
         var monster:XML = null;
         var monsterData:MonsterData = null;
         var boss:XML = null;
         var bossData:BossData = null;
         var bossLevel:XML = null;
         var bossLevelData:BossLevelData = null;
         var shop:XML = null;
         var shopData:ShopData = null;
         var hot:XML = null;
         var hotData:DegreeValue = null;
         var desc:XML = null;
         var descData:DescData = null;
         var land:XML = null;
         var landItem:LandItemData = null;
         var mapform:XML = null;
         var mapformItem:MapformData = null;
         var summon:XML = null;
         var item:XML = null;
         var i:int = 0;
         var arr:Array = null;
         if(!xml)
         {
            return;
         }
         this.m_vMapData = new Vector.<MapData>();
         this.m_vMonsterData = new Vector.<MonsterData>();
         this.m_vBossData = new Vector.<BossData>();
         this.m_vBossLevelData = new Vector.<BossLevelData>();
         this.m_vShopData = new Vector.<ShopData>();
         this.m_vDegreeValue = new Vector.<DegreeValue>();
         this.m_dictMonseLife = new Dictionary();
         this.m_dictMouseSummon = new Dictionary();
         this.m_vDesc = new Vector.<DescData>();
         this.m_vLandform = new Vector.<LandItemData>();
         this.m_vMapform = new Vector.<MapformData>();
         this.m_vMouseLinesChatBubblesData = new Vector.<MouseLinesChatBubblesData>();
         this.m_vMouseLinesTalkMouseData = new Vector.<MouseLinesTalkMouseData>();
         for each(map in xml.mapelement.map)
         {
            mapData = new MapData();
            mapData.iMapID = int(map.@map_id);
            mapData.sMapName = String(map.@map_name);
            mapData.strBGUrl = String(map.@bg_url);
            mapData.strInsideBGUrl = String(map.@show_inside_bg);
            mapData.strShowBGUrl = String(map.@show_bg);
            mapData.strShowInsideBGUrl = String(map.@show_inside_bg);
            mapData.strSoundBGUrl = String(map.@sound_url);
            mapData.strBossSoundBGUrl = String(map.@boss_sound_url);
            mapData.iAirTime = int(map.@air_time);
            mapData.iNight = int(map.@stage_type);
            mapData.iWater = 0;
            for each(grid in map.field_grid)
            {
               gridData = new FieldGridData();
               gridData.m_iGridType = int(grid.@grid_type);
               gridData.x = int(grid.@x);
               gridData.y = int(grid.@y);
               if(gridData.m_iGridType == 1)
               {
                  mapData.iWater = 1;
               }
               gridData.m_strResUrl = String(grid.@res_url);
               mapData.vGridData.push(gridData);
            }
            this.m_vMapData.push(mapData);
         }
         for each(monster in xml.monsterelement.item)
         {
            monsterData = new MonsterData();
            monsterData.iMonsterID = int(monster.@monsterid);
            monsterData.sMonsterName = String(monster.@monstername);
            monsterData.sUrl = String(monster.@monsterurl);
            monsterData.iMonsterBlood = int(monster.@life);
            monsterData.iType = int(monster.@type);
            this.m_vMonsterData.push(monsterData);
            this.m_dictMonseLife[monsterData.iMonsterID] = monsterData.iMonsterBlood;
         }
         for each(boss in xml.bosselement.item)
         {
            bossData = new BossData();
            bossData.iBossID = int(boss.@bossid);
            bossData.sBossName = String(boss.@bossname);
            bossData.sBossHeadUrl = String(boss.@bossheadurl);
            bossData.sBossUrl = String(boss.@bossurl);
            this.m_vBossData.push(bossData);
         }
         for each(bossLevel in xml.bosslevel.item)
         {
            bossLevelData = new BossLevelData();
            bossLevelData.iBossLevel = int(bossLevel.@bosslevel);
            bossLevelData.sLevelDesc = String(bossLevel.@leveldesc);
            bossLevelData.iMinBlood = int(bossLevel.@minbloodnum);
            bossLevelData.iMaxBlood = int(bossLevel.@maxbloodnum);
            this.m_vBossLevelData.push(bossLevelData);
         }
         for each(shop in xml.shop.item)
         {
            shopData = new ShopData();
            shopData.iShopID = int(shop.@id);
            shopData.iType = int(shop.@type);
            shopData.iRealID = int(shop.@realid);
            shopData.iDIYPrice = int(shop.@diyprice);
            shopData.iChallegePrice = int(shop.@challengeprice);
            shopData.iMaxNum = int(shop.@maxnum);
            this.m_vShopData.push(shopData);
         }
         for each(hot in xml.hotvalue.level)
         {
            hotData = new DegreeValue();
            hotData.iID = int(hot.@id);
            hotData.iMax = int(hot.@max);
            hotData.iMin = int(hot.@min);
            this.m_vDegreeValue.push(hotData);
         }
         for each(desc in xml.desc.item)
         {
            descData = new DescData();
            descData.iID = parseInt(desc.@id);
            descData.sContent1 = String(desc.@text1);
            descData.sContent2 = String(desc.@text2);
            this.m_vDesc.push(descData);
         }
         for each(land in xml.landform.item)
         {
            landItem = new LandItemData();
            landItem.iID = parseInt(land.@id);
            landItem.iType = parseInt(land.@type);
            landItem.iCardID = parseInt(land.@cardid);
            landItem.res_url = String(land.@res_url);
            this.m_vLandform.push(landItem);
         }
         for each(mapform in xml.mapcanuseform.item)
         {
            mapformItem = new MapformData();
            mapformItem.iMapID = parseInt(mapform.@mapid);
            mapformItem.iLimitNum = parseInt(mapform.@landlimit);
            mapformItem.sFormstring = String(mapform.@formstring);
            this.m_vMapform.push(mapformItem);
         }
         this.m_iDraftsLot = xml.initslot.@draftslot;
         this.m_iPublishsLot = xml.initslot.@publishslot;
         this.m_iMinAdapterRatio = int(xml.mousedetail.@minhper);
         this.m_iMaxAdapterRatio = int(xml.mousedetail.@maxhper);
         for each(summon in xml.mousesummon.item)
         {
            arr = new Array();
            for each(item in summon.summon)
            {
               arr.push(int(item.@id));
            }
            this.m_dictMouseSummon[int(summon.@mouse_id)] = arr;
         }
         i = 0;
         this.m_vMouseLinesChatBubblesData.length = 0;
         for each(item in xml.mouse_lines.chat_bubbles.item)
         {
            this.m_vMouseLinesChatBubblesData[i] = new MouseLinesChatBubblesData();
            this.m_vMouseLinesChatBubblesData[i].m_iID = int(item.@id);
            this.m_vMouseLinesChatBubblesData[i].m_strResUrl = String(item.@res_url);
            this.m_vMouseLinesChatBubblesData[i].m_strThumbnailResUrl = String(item.@thumbnail_res_url);
            i++;
         }
         i = 0;
         this.m_vMouseLinesTalkMouseData.length = 0;
         for each(item in xml.mouse_lines.talk_mouse.item)
         {
            this.m_vMouseLinesTalkMouseData[i] = new MouseLinesTalkMouseData();
            this.m_vMouseLinesTalkMouseData[i].m_iID = int(item.@id);
            this.m_vMouseLinesTalkMouseData[i].m_bIsBoss = Boolean(int(item.@is_boss) == 1);
            this.m_vMouseLinesTalkMouseData[i].m_iMonsterOrBossID = int(item.@monsterOrBossID);
            i++;
         }
      }
      
      public function GetMapElement(id:int) : LandItemData
      {
         for(var i:int = 0; i < this.m_vLandform.length; i++)
         {
            if(id == this.m_vLandform[i].iID)
            {
               return this.m_vLandform[i];
            }
         }
         return null;
      }
      
      public function GetMapElementByCardID(id:int) : LandItemData
      {
         for(var i:int = 0; i < this.m_vLandform.length; i++)
         {
            if(id == this.m_vLandform[i].iCardID)
            {
               return this.m_vLandform[i];
            }
         }
         return null;
      }
      
      public function GetMapInfo(id:int) : MapformData
      {
         for(var i:int = 0; i < this.m_vMapform.length; i++)
         {
            if(id == this.m_vMapform[i].iMapID)
            {
               return this.m_vMapform[i];
            }
         }
         return null;
      }
      
      public function GetBattleMapData(iIndex:int, iRealMapID:int = 0) : ComMapData
      {
         var grid:FieldGridData = null;
         var gridData:FieldGridData = null;
         var obj:Object = null;
         var retMap:ComMapData = new ComMapData();
         retMap.m_iMapID = this.m_vMapData[iIndex].iMapID;
         retMap.m_iStageType = this.m_vMapData[iIndex].iNight;
         retMap.m_strBGUrl = this.m_vMapData[iIndex].strBGUrl;
         retMap.m_strSoundBGUrl = this.m_vMapData[iIndex].strSoundBGUrl;
         retMap.m_strBossSoundBGUrl = this.m_vMapData[iIndex].strBossSoundBGUrl;
         retMap.m_iAirTime = this.m_vMapData[iIndex].iAirTime;
         for each(grid in this.m_vMapData[iIndex].vGridData)
         {
            gridData = new FieldGridData();
            gridData.m_iGridType = grid.m_iGridType;
            gridData.x = grid.x;
            gridData.y = grid.y;
            gridData.m_strResUrl = grid.m_strResUrl;
            retMap.m_vGridData.push(gridData);
         }
         if((iRealMapID & 0xF0000000) == 1610612736 && iRealMapID == this.m_iCurrentMapID)
         {
            if(this.m_arrBarrir != null && this.m_arrBarrir.length > 0)
            {
               for each(obj in this.m_arrBarrir)
               {
                  gridData = new FieldGridData();
                  gridData.m_iGridType = this.GetMapElement(obj.value).iCardID;
                  gridData.x = obj.x;
                  gridData.y = obj.y;
                  gridData.m_strResUrl = this.GetMapElement(obj.value).res_url;
                  retMap.m_vGridData.push(gridData);
               }
            }
         }
         return retMap;
      }
      
      public function GetHotLevel(iHot:int) : int
      {
         for(var i:* = int(this.m_vDegreeValue.length - 1); i >= 0; i--)
         {
            if(iHot >= this.m_vDegreeValue[i].iMin)
            {
               return i + 1;
            }
         }
         return 1;
      }
      
      public function GetMapData(iMapID:int) : MapData
      {
         var iLen:int = int(this.m_vMapData.length);
         for(var i:int = 0; i < iLen; i++)
         {
            if(iMapID == this.m_vMapData[i].iMapID)
            {
               return this.m_vMapData[i];
            }
         }
         return null;
      }
      
      public function GetMonsterData(iMonsterID:int) : MonsterData
      {
         var iLen:int = int(this.m_vMonsterData.length);
         for(var i:int = 0; i < iLen; i++)
         {
            if(iMonsterID == this.m_vMonsterData[i].iMonsterID)
            {
               return this.m_vMonsterData[i];
            }
         }
         return null;
      }
      
      public function GetBossData(iBossID:int) : BossData
      {
         var iLen:int = int(this.m_vBossData.length);
         for(var i:int = 0; i < iLen; i++)
         {
            if(iBossID == this.m_vBossData[i].iBossID)
            {
               return this.m_vBossData[i];
            }
         }
         return null;
      }
      
      public function GetMouseLinesTalkMouseData(iID:int) : MouseLinesTalkMouseData
      {
         for(var i:int = 0; i < this.m_vMouseLinesTalkMouseData.length; i++)
         {
            if(this.m_vMouseLinesTalkMouseData[i].m_iID == iID)
            {
               return this.m_vMouseLinesTalkMouseData[i];
            }
         }
         return null;
      }
      
      public function GetMouseLinesChatBubblesData(iID:int) : MouseLinesChatBubblesData
      {
         for(var i:int = 0; i < this.m_vMouseLinesChatBubblesData.length; i++)
         {
            if(this.m_vMouseLinesChatBubblesData[i].m_iID == iID)
            {
               return this.m_vMouseLinesChatBubblesData[i];
            }
         }
         return null;
      }
      
      public function GetBossLevelData(iBossLevelID:int) : BossLevelData
      {
         var iLen:int = int(this.m_vBossLevelData.length);
         for(var i:int = 0; i < iLen; i++)
         {
            if(iBossLevelID == this.m_vBossLevelData[i].iBossLevel)
            {
               return this.m_vBossLevelData[i];
            }
         }
         return null;
      }
      
      public function GetShopData(iShopID:int) : ShopData
      {
         var iLen:int = int(this.m_vShopData.length);
         for(var i:int = 0; i < iLen; i++)
         {
            if(iShopID == this.m_vShopData[i].iShopID)
            {
               return this.m_vShopData[i];
            }
         }
         return null;
      }
      
      public function GetMapIndex(m_iScenes:int) : int
      {
         var iLen:int = int(this.m_vMapData.length);
         for(var i:int = 0; i < iLen; i++)
         {
            if(m_iScenes == this.m_vMapData[i].iMapID)
            {
               return i;
            }
         }
         return 0;
      }
      
      public function GetDesc(iCurrentRankType:int) : String
      {
         for(var i:int = 0; i < this.m_vDesc.length; i++)
         {
            if((iCurrentRankType & 0x0F) == 0)
            {
               if(iCurrentRankType == (this.m_vDesc[i].iID & 0xF0))
               {
                  return this.m_vDesc[i].sContent1;
               }
            }
            else if(iCurrentRankType == this.m_vDesc[i].iID)
            {
               return this.m_vDesc[i].sContent2;
            }
         }
         return "";
      }
      
      public function GetDescIndex(m_iIndex:int) : int
      {
         for(var i:int = 0; i < this.m_vDesc.length; i++)
         {
            if(m_iIndex == (this.m_vDesc[i].iID & 0xF0))
            {
               return this.m_vDesc[i].iID & 0x0F;
            }
         }
         return 4;
      }
      
      public function IsExistBarrier(iRow:int, iCol:int, jIndex:*) : int
      {
         var grid:FieldGridData = null;
         var iIndex:int = jIndex;
         for each(grid in this.m_vMapData[iIndex].vGridData)
         {
            if(-1 == grid.x)
            {
               if(grid.y == iRow)
               {
                  return grid.m_iGridType;
               }
            }
            else if(-1 == grid.y)
            {
               if(grid.x == iCol)
               {
                  return grid.m_iGridType;
               }
            }
            else if(grid.y == iRow && grid.x == iCol)
            {
               return grid.m_iGridType;
            }
         }
         return 0;
      }
      
      public function GetMapLimit(iScene:int) : int
      {
         var temp:MapformData = this.GetMapInfo(iScene);
         if(temp)
         {
            return temp.iLimitNum;
         }
         return 0;
      }
   }
}

