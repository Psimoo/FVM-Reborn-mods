package com.aurora.ui.maogoutd.PayAward
{
   import a_4723.a_1767;
   import com.aurora.ui.maogoutd.ServiceOpenCarnival.Data.HalfPriceData;
   import flash.utils.Dictionary;
   
   public class HolidayExchangeXML
   {
      
      public var m_vHalfPriceItem:Vector.<HalfPriceData>;
      
      public var m_vExchangeItem:Vector.<ExchangeItem>;
      
      public var m_vCurrentItem:Vector.<ExchangeItem>;
      
      private var m_dictTypeData:Dictionary;
      
      private var m_iCurrentCheckTime:int;
      
      public function HolidayExchangeXML()
      {
         super();
         this.m_iCurrentCheckTime = 0;
         this.m_vHalfPriceItem = new Vector.<HalfPriceData>();
         this.m_vExchangeItem = new Vector.<ExchangeItem>();
         this.m_dictTypeData = new Dictionary();
      }
      
      public function AnalysisXML(stXML:XML) : void
      {
         var stItemXML:XML = null;
         var stExchangeItem:ExchangeItem = null;
         var stHalfPrice:HalfPriceData = null;
         var item:XML = null;
         var stAwardData:AwardData = null;
         this.m_vExchangeItem.length = 0;
         var systemTime:Date = new Date();
         for each(stItemXML in stXML.exchange)
         {
            stExchangeItem = new ExchangeItem();
            stExchangeItem.AnalysisXML(stItemXML);
            this.m_vExchangeItem.push(stExchangeItem);
            if(stItemXML.@type == "9")
            {
               stHalfPrice = new HalfPriceData();
               stHalfPrice.m_iConfgID = stItemXML.@id;
               stHalfPrice.m_iAllCount = stItemXML.@count;
               stHalfPrice.m_iPriceValue = stItemXML.need[0].point[0].@value;
               stHalfPrice.m_vAwardData = new Vector.<AwardData>();
               for each(item in stItemXML.award.item)
               {
                  stAwardData = new AwardData();
                  stAwardData.AnalysisXML(item);
                  stHalfPrice.m_vAwardData.push(stAwardData);
               }
               this.m_vHalfPriceItem.push(stHalfPrice);
            }
         }
      }
      
      public function set CurrentExchangeItemList(value:Vector.<ExchangeItem>) : void
      {
      }
      
      public function get CurrentExchangeItemList() : Vector.<ExchangeItem>
      {
         var vItem:Vector.<ExchangeItem> = null;
         var i:int = 0;
         var systemTime:int = a_1767.getInstance().SystemTime;
         if(systemTime != this.m_iCurrentCheckTime || null == this.m_vCurrentItem)
         {
            this.m_vCurrentItem = this.m_vCurrentItem || new Vector.<ExchangeItem>();
            this.m_vCurrentItem.length = 0;
            vItem = new Vector.<ExchangeItem>();
            for(i = 0; i < this.m_vExchangeItem.length; i++)
            {
               if(this.m_vExchangeItem[i].m_iExchangeEndTime >= systemTime)
               {
                  vItem.push(this.m_vExchangeItem[i]);
                  if(this.m_vExchangeItem[i].m_iExchangeStartTime <= systemTime && systemTime <= this.m_vExchangeItem[i].m_iExchangeEndTime)
                  {
                     this.m_vCurrentItem.push(this.m_vExchangeItem[i]);
                     this.m_vCurrentItem[this.m_vCurrentItem.length - 1].m_iPosID = this.m_vCurrentItem.length;
                  }
               }
            }
            this.m_vExchangeItem = vItem;
            this.m_iCurrentCheckTime = systemTime;
            return this.m_vCurrentItem;
         }
         return this.m_vCurrentItem;
      }
      
      public function GetNumByType(iType:int) : int
      {
         return this.GetExchangeItemByType(iType).length;
      }
      
      public function GetExchangeItemByType(iType:int) : Vector.<ExchangeItem>
      {
         var vItem:Vector.<ExchangeItem> = null;
         var stExchangeItem:ExchangeItem = null;
         var systemTime:int = a_1767.getInstance().SystemTime;
         if(systemTime != this.m_iCurrentCheckTime || null == this.m_dictTypeData[iType])
         {
            vItem = new Vector.<ExchangeItem>();
            for each(stExchangeItem in this.CurrentExchangeItemList)
            {
               if(stExchangeItem.m_iType == iType)
               {
                  vItem.push(stExchangeItem);
               }
            }
            this.m_dictTypeData[iType] = vItem;
         }
         return this.m_dictTypeData[iType];
      }
      
      public function GetAwardItemByPosID(iPosID:int) : Array
      {
         var i:int = 0;
         var m_ResArray:Array = new Array();
         m_ResArray = [];
         for(var j:int = 0; j < this.m_vExchangeItem.length; j++)
         {
            if(this.m_vExchangeItem[j].m_iPosID == iPosID)
            {
               for(i = 0; i < this.m_vExchangeItem[j].m_vAward.length; i++)
               {
                  m_ResArray.push(this.m_vExchangeItem[j].m_vAward[i].m_iItemID);
               }
               return m_ResArray;
            }
         }
         return null;
      }
      
      public function GetExchangeItemByPosID(iPosID:int) : Vector.<AwardData>
      {
         for(var j:int = 0; j < this.m_vExchangeItem.length; j++)
         {
            if(this.m_vExchangeItem[j].m_iPosID == iPosID)
            {
               this.m_vExchangeItem[j].m_vNeed;
               return this.m_vExchangeItem[j].m_vNeed;
            }
         }
         return null;
      }
      
      public function GetAwardItemByExchangeID(iPosID:int) : int
      {
         for(var j:int = 0; j < this.m_vExchangeItem.length; j++)
         {
            if(this.m_vExchangeItem[j].m_iPosID == iPosID)
            {
               return this.m_vExchangeItem[j].m_iExchangeID;
            }
         }
         return 0;
      }
   }
}

