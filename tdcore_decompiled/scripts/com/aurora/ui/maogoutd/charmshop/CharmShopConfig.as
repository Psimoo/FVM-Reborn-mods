package com.aurora.ui.maogoutd.charmshop
{
   public class CharmShopConfig
   {
      
      private static var m_pInstance:CharmShopConfig = new CharmShopConfig();
      
      public var m_vCharmShopData:Vector.<CharmShopData>;
      
      public function CharmShopConfig()
      {
         super();
      }
      
      public static function Get() : CharmShopConfig
      {
         return m_pInstance;
      }
      
      public function AnalysisXML(stXML:XML) : void
      {
         var stCharmShopData:CharmShopData = null;
         var stItemXML:XML = null;
         if(!this.m_vCharmShopData)
         {
            this.m_vCharmShopData = new Vector.<CharmShopData>();
         }
         this.m_vCharmShopData.length = 0;
         for each(stItemXML in stXML.charmshop.item)
         {
            stCharmShopData = new CharmShopData();
            this.m_vCharmShopData.push(stCharmShopData);
            stCharmShopData.m_iID = stItemXML.@id;
            stCharmShopData.m_iItemID = stItemXML.@itemid;
            stCharmShopData.m_iType = stItemXML.@type;
            stCharmShopData.m_strName = stItemXML.@name;
            stCharmShopData.m_iLevel = stItemXML.@level;
            stCharmShopData.m_iTime = stItemXML.@time;
            stCharmShopData.m_iNum = stItemXML.@num;
            stCharmShopData.m_iPrice = stItemXML.@price;
            stCharmShopData.m_iSex = stItemXML.@sex;
            stCharmShopData.m_iIsband = stItemXML.@isband;
         }
      }
      
      public function GetListByItemID(iItemID:int) : Array
      {
         var stCharmShopData:CharmShopData = null;
         var arrList:Array = [];
         for each(stCharmShopData in this.m_vCharmShopData)
         {
            if(stCharmShopData.m_iItemID == iItemID)
            {
               arrList.push(stCharmShopData);
            }
         }
         return arrList;
      }
   }
}

