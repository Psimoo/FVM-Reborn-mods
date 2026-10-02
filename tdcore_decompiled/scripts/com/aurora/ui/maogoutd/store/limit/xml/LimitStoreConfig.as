package com.aurora.ui.maogoutd.store.limit.xml
{
   public class LimitStoreConfig
   {
      
      private static var m_pInstance:LimitStoreConfig;
      
      public var m_vLimitStore:Vector.<Vector.<LimitItemInfo>>;
      
      public var m_vLimitTime:Vector.<Object>;
      
      public function LimitStoreConfig()
      {
         super();
      }
      
      public static function Get() : LimitStoreConfig
      {
         if(!m_pInstance)
         {
            m_pInstance = new LimitStoreConfig();
         }
         return m_pInstance;
      }
      
      public function GetLimitItem(systemTime:int) : Vector.<LimitItemInfo>
      {
         var date:Date = new Date(systemTime * 1000);
         var day:int = 0;
         day = date.fullYear * 10000;
         day += (date.month + 1) * 100;
         day += date.date;
         for(var i:int = 0; i < this.m_vLimitTime.length; i++)
         {
            if(day >= this.m_vLimitTime[i].m_dStartDay && day <= this.m_vLimitTime[i].m_dEndDay)
            {
               return this.m_vLimitStore[i];
            }
         }
         return this.m_vLimitStore[0];
      }
      
      public function GetLimitTime(systemTime:int) : Object
      {
         var date:Date = new Date(systemTime * 1000);
         var day:int = 0;
         day = date.fullYear * 10000;
         day += (date.month + 1) * 100;
         day += date.date;
         for(var i:int = 0; i < this.m_vLimitTime.length; i++)
         {
            if(day >= this.m_vLimitTime[i].m_dStartDay && day <= this.m_vLimitTime[i].m_dEndDay)
            {
               return this.m_vLimitTime[i];
            }
         }
         return this.m_vLimitTime[0];
      }
      
      public function a_2040(xml:XML) : void
      {
         var temp:LimitItemInfo = null;
         var vLimitItemArray:Vector.<LimitItemInfo> = null;
         var obj:Object = null;
         if(xml == null)
         {
            return;
         }
         var data:XML = null;
         var perdata:XML = null;
         var eachAward:XML = null;
         this.m_vLimitStore = new Vector.<Vector.<LimitItemInfo>>();
         this.m_vLimitTime = new Vector.<Object>();
         for each(data in xml.limitshop)
         {
            vLimitItemArray = new Vector.<LimitItemInfo>();
            for each(perdata in data.countlimit)
            {
               temp = new LimitItemInfo();
               temp.m_iCount = int(perdata.@count);
               temp.m_iIsBind = int(perdata.@isbind);
               temp.m_iItemID = int(perdata.@itemid);
               temp.m_iLevel = int(perdata.@level);
               temp.m_iNum = int(perdata.@num);
               temp.m_iPrice = int(perdata.@price);
               temp.m_iSex = int(perdata.@sex);
               temp.m_iTime = int(perdata.@time);
               temp.m_iName = String(perdata.@name);
               temp.m_iType = 1;
               vLimitItemArray.push(temp);
            }
            for each(perdata in data.timelimit)
            {
               temp = new LimitItemInfo();
               temp.m_iCount = -1;
               temp.m_iIsBind = int(perdata.@isbind);
               temp.m_iItemID = int(perdata.@itemid);
               temp.m_iLevel = int(perdata.@level);
               temp.m_iNum = int(perdata.@num);
               temp.m_iPrice = int(perdata.@price);
               temp.m_iSex = int(perdata.@sex);
               temp.m_iTime = int(perdata.@time);
               temp.m_iName = String(perdata.@name);
               temp.m_iType = 2;
               vLimitItemArray.push(temp);
            }
            this.m_vLimitStore.push(vLimitItemArray);
            obj = {};
            obj.m_dStartDay = data.@startday;
            obj.m_dEndDay = data.@endday;
            this.m_vLimitTime.push(obj);
         }
      }
   }
}

