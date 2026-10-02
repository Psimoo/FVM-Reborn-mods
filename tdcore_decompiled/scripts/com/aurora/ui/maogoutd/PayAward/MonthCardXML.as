package com.aurora.ui.maogoutd.PayAward
{
   public class MonthCardXML
   {
      
      public var m_iItem:Vector.<AwardData>;
      
      public function MonthCardXML()
      {
         super();
         this.m_iItem = new Vector.<AwardData>();
      }
      
      public function AnalysisXML(stXML:XML) : void
      {
         var stItemXML:XML = null;
         var stAwardItem:AwardData = null;
         this.m_iItem.length = 0;
         for each(stItemXML in stXML.award.item)
         {
            stAwardItem = new AwardData();
            stAwardItem.AnalysisXML(stItemXML);
            this.m_iItem.push(stAwardItem);
         }
      }
   }
}

