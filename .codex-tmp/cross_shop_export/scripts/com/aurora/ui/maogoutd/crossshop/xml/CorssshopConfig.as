package com.aurora.ui.maogoutd.crossshop.xml
{
   import com.aurora.ui.maogoutd.PayAward.AwardData;
   import com.aurora.ui.maogoutd.PayAward.ExchangeItem;
   import com.aurora.ui.maogoutd.PayAward.RechargeActivityConfig;
   
   public class CorssshopConfig
   {
      
      private static var m_pInstance:CorssshopConfig;
      
      public var m_stExchangeItems:Vector.<ExchangeItemInfo>;
      
      public var m_arrCall:Array;
      
      public function CorssshopConfig()
      {
         super();
      }
      
      public static function Get() : CorssshopConfig
      {
         if(!m_pInstance)
         {
            m_pInstance = new CorssshopConfig();
         }
         return m_pInstance;
      }
      
      public function GetExchangeItem() : Vector.<ExchangeItemInfo>
      {
         return this.m_stExchangeItems;
      }
      
      public function a_2040() : void
      {
         var tempb:ExchangeItemInfo = null;
         var vExchangeItem:Vector.<ExchangeItem> = new Vector.<ExchangeItem>();
         vExchangeItem = RechargeActivityConfig.GetInstance().GetHolidayExchangeXML().GetExchangeItemByType(8);
         if(vExchangeItem == null)
         {
            return;
         }
         var data:ExchangeItem = null;
         var perdata:AwardData = null;
         var eachAward:AwardData = null;
         this.m_stExchangeItems = new Vector.<ExchangeItemInfo>();
         for each(data in vExchangeItem)
         {
            tempb = new ExchangeItemInfo();
            tempb.m_iID = data.m_iExchangeID;
            for each(perdata in data.m_vNeed)
            {
               tempb.m_iNeedItemID = perdata.m_iItemID;
               tempb.m_iNeedNum = perdata.m_iNum;
            }
            for each(perdata in data.m_vAward)
            {
               tempb.m_iItemID = perdata.m_iItemID;
               tempb.m_iBind = perdata.m_iIsBind;
               tempb.m_iTime = perdata.m_iContinueTime;
               tempb.m_iType = (tempb.m_iItemID & 0x0F000000) >> 24;
               tempb.m_iLevel = perdata.m_iLevel;
            }
            this.m_stExchangeItems.push(tempb);
         }
      }
   }
}

