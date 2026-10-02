package com.aurora.ui.maogoutd.PayAward
{
   public class HolidayRechargeXML extends CumulativeRechargeXML
   {
      
      public var m_iID:int;
      
      public var m_iEndTime:int;
      
      public function HolidayRechargeXML()
      {
         super();
      }
      
      override public function AnalysisXML(stXML:XML) : void
      {
         this.m_iID = stXML.@id;
         this.m_iEndTime = stXML.@endTime;
         super.AnalysisXML(stXML);
      }
   }
}

