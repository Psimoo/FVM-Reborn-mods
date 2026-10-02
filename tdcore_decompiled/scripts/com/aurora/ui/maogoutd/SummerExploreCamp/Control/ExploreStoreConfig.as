package com.aurora.ui.maogoutd.SummerExploreCamp.Control
{
   import com.aurora.ui.maogoutd.store.limit.xml.LimitItemInfo;
   
   public class ExploreStoreConfig
   {
      
      private static var m_pInstance:ExploreStoreConfig;
      
      public var m_vLimitStore:Vector.<Vector.<LimitItemInfo>>;
      
      public var m_vLimitTime:Vector.<Object>;
      
      public var m_GoldCoinNum:int;
      
      public function ExploreStoreConfig()
      {
         super();
      }
      
      public static function Get() : ExploreStoreConfig
      {
         if(!m_pInstance)
         {
            m_pInstance = new ExploreStoreConfig();
         }
         return m_pInstance;
      }
      
      public function GetLimitItem(systemTime:int) : Vector.<LimitItemInfo>
      {
         var day:int = systemTime;
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
         var day:int = systemTime;
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
         for each(data in xml.advshop)
         {
            vLimitItemArray = new Vector.<LimitItemInfo>();
            for each(perdata in data.item)
            {
               temp = new LimitItemInfo();
               temp.m_iID = int(perdata.@id);
               temp.m_iName = String(perdata.@name);
               temp.m_iItemID = int(perdata.@itemid);
               temp.m_iNum = int(perdata.@num);
               temp.m_iPrice = int(perdata.@price);
               temp.m_iLevel = int(perdata.@level);
               temp.m_iTime = int(perdata.@time);
               temp.m_iIsBind = int(perdata.@isBind);
               temp.m_iSex = int(perdata.@sex);
               temp.m_iCount = int(perdata.@limitcount);
               temp.m_iType = 1;
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

