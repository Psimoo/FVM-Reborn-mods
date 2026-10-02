package com.aurora.ui.maogoutd.crossshop
{
   import com.aurora.ui.maogoutd.crossshop.xml.CorssshopConfig;
   import com.aurora.ui.maogoutd.crossshop.xml.ExchangeItemInfo;
   import flash.utils.Dictionary;
   
   public class ExchangeDataModel
   {
      
      private static var instance:ExchangeDataModel;
      
      private var m_dictImage:Dictionary;
      
      private var m_vAllData:Vector.<ExchangeItemInfo>;
      
      private var m_vFillterData:Vector.<ExchangeItemInfo>;
      
      public function ExchangeDataModel()
      {
         super();
      }
      
      public static function getinstance() : ExchangeDataModel
      {
         if(!instance)
         {
            instance = new ExchangeDataModel();
         }
         return instance;
      }
      
      public function get dictImage() : Dictionary
      {
         if(this.m_dictImage == null)
         {
            this.m_dictImage = new Dictionary();
         }
         return this.m_dictImage;
      }
      
      private function checkAllData() : void
      {
         if(this.m_vAllData == null)
         {
            CorssshopConfig.Get().a_2040();
            this.m_vAllData = CorssshopConfig.Get().GetExchangeItem();
         }
      }
      
      public function getShopData(iMoneyType:int, iItemType:int) : Vector.<ExchangeItemInfo>
      {
         var info:ExchangeItemInfo = null;
         this.checkAllData();
         this.m_vFillterData = Vector.<ExchangeItemInfo>([]);
         for each(info in this.m_vAllData)
         {
            if(info.m_iNeedItemID == iMoneyType && (info.m_iType == iItemType || iItemType == 0))
            {
               this.m_vFillterData.push(info);
            }
         }
         return this.m_vFillterData;
      }
   }
}

