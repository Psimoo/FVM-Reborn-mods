package com.aurora.game.maogoutd.common.marriage
{
   public class WeddingFireWorkXML
   {
      
      public var m_iCDTime:int;
      
      public var m_vItems:Vector.<WeddingFireWorkItem>;
      
      public function WeddingFireWorkXML()
      {
         super();
         this.m_vItems = new Vector.<WeddingFireWorkItem>();
      }
      
      public function GetItemByLevel(iLevel:int) : WeddingFireWorkItem
      {
         var stItem:WeddingFireWorkItem = null;
         for each(stItem in this.m_vItems)
         {
            if(stItem.m_iLevel == iLevel)
            {
               return stItem;
            }
         }
         return null;
      }
      
      public function AnalysisXML(stXML:XML) : void
      {
         var child:XML = null;
         var stItem:WeddingFireWorkItem = null;
         this.m_iCDTime = stXML.@cdTime;
         this.m_vItems.length = 0;
         for each(child in stXML.item)
         {
            stItem = new WeddingFireWorkItem();
            stItem.AnalysisXML(child);
            this.m_vItems.push(stItem);
         }
      }
   }
}

