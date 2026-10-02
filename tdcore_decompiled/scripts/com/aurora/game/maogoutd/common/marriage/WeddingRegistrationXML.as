package com.aurora.game.maogoutd.common.marriage
{
   public class WeddingRegistrationXML
   {
      
      public var m_iWeekWeddingMaxCount:int;
      
      public var m_vSelectDayItems:Vector.<SelectDayItem>;
      
      public var m_vWeddingLevelItems:Vector.<WeddingLevelItem>;
      
      public var m_vDressInfoItems:Vector.<DressInfoItem>;
      
      public function WeddingRegistrationXML()
      {
         super();
         this.m_vSelectDayItems = new Vector.<SelectDayItem>();
         this.m_vWeddingLevelItems = new Vector.<WeddingLevelItem>();
         this.m_vDressInfoItems = new Vector.<DressInfoItem>();
      }
      
      public function GetWeddingLevelItemByLevel(iLevel:int) : WeddingLevelItem
      {
         var stItem:WeddingLevelItem = null;
         for each(stItem in this.m_vWeddingLevelItems)
         {
            if(stItem.m_iWeddingLevel == iLevel)
            {
               return stItem;
            }
         }
         return null;
      }
      
      public function GetShowDescByDay(iDay:int) : String
      {
         var stItem:SelectDayItem = null;
         for each(stItem in this.m_vSelectDayItems)
         {
            if(stItem.m_iDay == iDay)
            {
               return stItem.m_strShowDesc;
            }
         }
         return null;
      }
      
      public function AnalysisXML(stXML:XML) : void
      {
         var stItemXML:XML = null;
         var stSelectDayItem:SelectDayItem = null;
         var stWeddingLevelItem:WeddingLevelItem = null;
         var stDressInfoItem:DressInfoItem = null;
         this.m_iWeekWeddingMaxCount = stXML.@max_registration_count_per_week;
         this.m_vSelectDayItems.length = 0;
         for each(stItemXML in stXML.selectDay.item)
         {
            stSelectDayItem = new SelectDayItem();
            stSelectDayItem.AnalysisXML(stItemXML);
            this.m_vSelectDayItems.push(stSelectDayItem);
         }
         this.m_vWeddingLevelItems.length = 0;
         for each(stItemXML in stXML.weddingLevel.item)
         {
            stWeddingLevelItem = new WeddingLevelItem();
            stWeddingLevelItem.AnalysisXML(stItemXML);
            this.m_vWeddingLevelItems.push(stWeddingLevelItem);
         }
         this.m_vDressInfoItems.length = 0;
         for each(stItemXML in stXML.dress.item)
         {
            stDressInfoItem = new DressInfoItem();
            stDressInfoItem.AnalysisXML(stItemXML);
            this.m_vDressInfoItems.push(stDressInfoItem);
         }
         this.m_vDressInfoItems.sort(this.SortDressInfoItem);
      }
      
      private function SortDressInfoItem(a:DressInfoItem, b:DressInfoItem) : int
      {
         return a.m_iDressType - b.m_iDressType;
      }
   }
}

