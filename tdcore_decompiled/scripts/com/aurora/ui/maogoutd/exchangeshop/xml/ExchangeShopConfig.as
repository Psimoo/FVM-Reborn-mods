package com.aurora.ui.maogoutd.exchangeshop.xml
{
   import flash.utils.Dictionary;
   
   public class ExchangeShopConfig
   {
      
      private static var m_pInstance:ExchangeShopConfig;
      
      public var m_stExchangeItems:Vector.<ExchangeItemInfo>;
      
      public var m_stDecomposeItems:Vector.<DecomposeItemInfo>;
      
      public var m_stCallItems:Vector.<CallItemInfo>;
      
      public var m_dictDecompose:Dictionary;
      
      public var m_arrCall:Array;
      
      public function ExchangeShopConfig()
      {
         super();
         this.m_dictDecompose = new Dictionary();
      }
      
      public static function Get() : ExchangeShopConfig
      {
         if(!m_pInstance)
         {
            m_pInstance = new ExchangeShopConfig();
         }
         return m_pInstance;
      }
      
      public function GetExchangeItem() : Vector.<ExchangeItemInfo>
      {
         return this.m_stExchangeItems;
      }
      
      public function GetDecomposeItem() : Vector.<DecomposeItemInfo>
      {
         return this.m_stDecomposeItems;
      }
      
      public function GetCallItem() : Vector.<CallItemInfo>
      {
         return this.m_stCallItems;
      }
      
      public function a_2040(xml:XML) : void
      {
         var tempa:DecomposeItemInfo = null;
         var tempb:ExchangeItemInfo = null;
         var tempc:CallItemInfo = null;
         if(xml == null)
         {
            return;
         }
         var data:XML = null;
         var perdata:XML = null;
         var eachAward:XML = null;
         this.m_stDecomposeItems = new Vector.<DecomposeItemInfo>();
         for each(data in xml.decompose.item)
         {
            tempa = new DecomposeItemInfo();
            tempa.m_iItemID = int(data.@itemid);
            tempa.m_iNum = int(data.@num);
            this.m_stDecomposeItems.push(tempa);
            this.m_dictDecompose[tempa.m_iItemID] = tempa;
         }
         this.m_stExchangeItems = new Vector.<ExchangeItemInfo>();
         for each(data in xml.exchange.item)
         {
            tempb = new ExchangeItemInfo();
            tempb.m_iItemID = int(data.@itemid);
            tempb.m_iNeedNum = int(data.@neednum);
            tempb.m_iBind = int(data.@bind);
            tempb.m_iTime = int(data.@time);
            tempb.m_iType = (tempb.m_iItemID & 0x0F000000) >> 24;
            this.m_stExchangeItems.push(tempb);
         }
         this.m_arrCall = new Array();
         for each(data in xml.call.set)
         {
            this.m_stCallItems = new Vector.<CallItemInfo>();
            for each(perdata in data.item)
            {
               tempc = new CallItemInfo();
               tempc.m_iItemID = int(perdata.@itemid);
               tempc.m_iNeedNum = int(perdata.@neednum);
               tempc.m_iBind = int(perdata.@bind);
               tempc.m_iTime = int(perdata.@time);
               tempc.m_iID = int(perdata.@id);
               tempc.m_iNeedID = [];
               for each(eachAward in perdata.preneed)
               {
                  tempc.m_iNeedID.push(int(eachAward.@id));
               }
               this.m_stCallItems.push(tempc);
            }
            this.m_arrCall.push(this.m_stCallItems);
         }
      }
   }
}

