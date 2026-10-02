package com.aurora.ui.maogoutd.consortiaxml
{
   public class ConsortiaActivityConfig
   {
      
      private static var m_pInstance:ConsortiaActivityConfig;
      
      public var m_stGardenConfigs:ConsortiaGardenInfo;
      
      public var m_stCarbenConfigs:Vector.<ConsortiaCarbenInfo>;
      
      public function ConsortiaActivityConfig()
      {
         super();
      }
      
      public static function Get() : ConsortiaActivityConfig
      {
         if(!m_pInstance)
         {
            m_pInstance = new ConsortiaActivityConfig();
         }
         return m_pInstance;
      }
      
      public function GetGarbonConfig() : Vector.<ConsortiaCarbenInfo>
      {
         return this.m_stCarbenConfigs;
      }
      
      public function GetGarbonTime(iGameMapID:int) : int
      {
         var j:int = 0;
         loop0:
         for(var i:int = 0; i < 3; )
         {
            j = 0;
            while(true)
            {
               if(j >= this.m_stCarbenConfigs[i].m_iCarbenItem.length)
               {
                  i++;
                  continue loop0;
               }
               if(this.m_stCarbenConfigs[i].m_iCarbenItem[j].m_iMapID == iGameMapID)
               {
                  break;
               }
               j++;
            }
            return this.m_stCarbenConfigs[i].m_iCarbenItem[j].m_iTime;
         }
         return 0;
      }
      
      public function IsCarbonMap(iGameMapID:int) : int
      {
         var j:int = 0;
         loop0:
         for(var i:int = 0; i < 3; )
         {
            j = 0;
            while(true)
            {
               if(j >= this.m_stCarbenConfigs[i].m_iCarbenItem.length)
               {
                  i++;
                  continue loop0;
               }
               if(this.m_stCarbenConfigs[i].m_iCarbenItem[j].m_iMapID == iGameMapID)
               {
                  break;
               }
               j++;
            }
            return i + 1;
         }
         return 0;
      }
      
      public function a_2040(xml:XML) : void
      {
         var temp:ConsortiaTreeInfo = null;
         var obj:Object = null;
         var temps:ConsortiaGardenLimitInfo = null;
         var objs:Object = null;
         var tempx:ConsortiaGardenLimitInfo = null;
         var objx:Object = null;
         var tempd:ConsortiaGardenOperateInfo = null;
         var tempe:ConsortiaGardenOperateInfo = null;
         var tempf:ConsortiaCarbenInfo = null;
         var carbenItem:ConsortiaCarbenItem = null;
         if(xml == null)
         {
            return;
         }
         var data:XML = null;
         var perdata:XML = null;
         var eachAward:XML = null;
         this.m_stGardenConfigs = new ConsortiaGardenInfo();
         this.m_stGardenConfigs.m_iConsortiaTreeStealPercent = int(xml.garden.treeType.@stealpercent);
         this.m_stGardenConfigs.m_iConsortiaTree = new Vector.<ConsortiaTreeInfo>();
         this.m_stGardenConfigs.m_iConsortiaGardenLimit = new Vector.<ConsortiaGardenLimitInfo>();
         this.m_stGardenConfigs.m_iConsortiaGardenOperate = new Vector.<ConsortiaGardenOperateInfo>();
         for each(data in xml.garden.treeType.type)
         {
            temp = new ConsortiaTreeInfo();
            temp.m_iID = int(data.@id);
            temp.m_iFruitnum = int(data.@fruitnum);
            temp.m_iCost = int(data.@cost);
            temp.m_iGrowthValue = new Vector.<Object>();
            for each(perdata in data.step)
            {
               obj = new Object();
               obj.m_iID = int(perdata.@id);
               obj.m_iExp = int(perdata.@exp);
               temp.m_iGrowthValue.push(obj);
            }
            this.m_stGardenConfigs.m_iConsortiaTree.push(temp);
         }
         for each(data in xml.garden.growLimit.§default§)
         {
            temps = new ConsortiaGardenLimitInfo();
            temps.m_iGrowthLimit = new Vector.<Object>();
            for each(perdata in data.element)
            {
               objs = new Object();
               objs.m_iLimit = int(perdata.@limit);
               objs.m_iLevel = int(perdata.@level);
               temps.m_iGrowthLimit.push(objs);
            }
            this.m_stGardenConfigs.m_iConsortiaGardenLimit.push(temps);
         }
         for each(data in xml.garden.growLimit.activity)
         {
            tempx = new ConsortiaGardenLimitInfo();
            tempx.m_iEndTime = int(data.@endTime);
            tempx.m_iStartTime = int(data.@startTime);
            tempx.m_iGrowthLimit = new Vector.<Object>();
            for each(perdata in data.element)
            {
               objx = new Object();
               objx.m_iLimit = int(perdata.@limit);
               objx.m_iLevel = int(perdata.@level);
               tempx.m_iGrowthLimit.push(objx);
            }
            this.m_stGardenConfigs.m_iConsortiaGardenLimit.push(tempx);
         }
         for each(data in xml.garden.gardenopt.§default§)
         {
            tempd = new ConsortiaGardenOperateInfo();
            tempd.m_iFertilizeExpOne = int(data.manure.@exp1);
            tempd.m_iFertilizeExpTwo = int(data.manure.@exp2);
            tempd.m_iWaterExpOne = int(data.water.@exp1);
            tempd.m_iWaterExpTwo = int(data.water.@exp2);
            tempd.m_iPickCount = int(data.pick.@count);
            tempd.m_iPickLimit = int(data.pick.@limit);
            tempd.m_iManureGold = int(data.manure.@gold);
            tempd.m_iWaterGold = int(data.water.@gold);
            this.m_stGardenConfigs.m_iConsortiaGardenOperate.push(tempd);
         }
         for each(data in xml.garden.gardenopt.activity)
         {
            tempe = new ConsortiaGardenOperateInfo();
            tempe.m_iEndTime = int(data.@endTime);
            tempe.m_iStartTime = int(data.@startTime);
            tempe.m_iFertilizeExpOne = int(data.manure.@exp1);
            tempe.m_iFertilizeExpTwo = int(data.manure.@exp2);
            tempe.m_iWaterExpOne = int(data.water.@exp1);
            tempe.m_iWaterExpTwo = int(data.water.@exp2);
            tempe.m_iPickCount = int(data.pick.@count);
            tempe.m_iPickLimit = int(data.pick.@limit);
            tempe.m_iManureGold = int(data.manure.@gold);
            tempe.m_iWaterGold = int(data.water.@gold);
            this.m_stGardenConfigs.m_iConsortiaGardenOperate.push(tempe);
         }
         this.m_stCarbenConfigs = new Vector.<ConsortiaCarbenInfo>();
         for each(data in xml.consben.map)
         {
            tempf = new ConsortiaCarbenInfo();
            tempf.m_iCarbenID = int(data.@id);
            tempf.m_iPieceID = int(data.@pieceid);
            tempf.m_iAwardID = int(data.@awardid);
            tempf.m_iCarbenItem = new Vector.<ConsortiaCarbenItem>();
            for each(perdata in data.level)
            {
               carbenItem = new ConsortiaCarbenItem();
               carbenItem.m_iLevel = int(perdata.@lv);
               carbenItem.m_iMapID = int(perdata.@mapid);
               carbenItem.m_iNeedPiece = int(perdata.@needpiece);
               carbenItem.m_iTime = int(perdata.@time);
               tempf.m_iCarbenItem.push(carbenItem);
            }
            this.m_stCarbenConfigs.push(tempf);
         }
      }
   }
}

