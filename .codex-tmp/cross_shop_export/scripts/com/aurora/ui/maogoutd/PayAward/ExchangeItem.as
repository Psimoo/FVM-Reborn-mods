package com.aurora.ui.maogoutd.PayAward
{
   public class ExchangeItem
   {
      
      public var m_iExchangeID:int;
      
      public var m_iPosID:int;
      
      public var m_iExchangeStartTime:int;
      
      public var m_iExchangeEndTime:int;
      
      public var m_iExchangeCount:int;
      
      public var m_iType:int;
      
      public var m_vNeed:Vector.<AwardData>;
      
      public var m_vAward:Vector.<AwardData>;
      
      public function ExchangeItem()
      {
         super();
         this.m_vNeed = new Vector.<AwardData>();
         this.m_vAward = new Vector.<AwardData>();
      }
      
      public function AnalysisXML(stXML:XML) : void
      {
         var stItemXML:XML = null;
         var stNeedPoint:AwardData = null;
         var stNeedItem:AwardData = null;
         var stAwardItem:AwardData = null;
         this.m_iExchangeID = stXML.@id;
         this.m_iExchangeStartTime = stXML.@startTime;
         this.m_iExchangeEndTime = stXML.@endTime;
         this.m_iExchangeCount = stXML.@count;
         if(stXML.@count < 0)
         {
            this.m_iExchangeCount = 999;
         }
         else
         {
            this.m_iExchangeCount = stXML.@count;
         }
         this.m_iType = stXML.@type;
         this.m_vNeed.length = 0;
         for each(stItemXML in stXML.need.point)
         {
            stNeedPoint = new AwardData();
            stNeedPoint.AnalysisCoinXML(stItemXML);
            this.m_vNeed.push(stNeedPoint);
         }
         for each(stItemXML in stXML.need.item)
         {
            stNeedItem = new AwardData();
            stNeedItem.AnalysisXML(stItemXML);
            this.m_vNeed.push(stNeedItem);
         }
         this.m_vAward.length = 0;
         for each(stItemXML in stXML.award.item)
         {
            stAwardItem = new AwardData();
            stAwardItem.AnalysisXML(stItemXML);
            this.m_vAward.push(stAwardItem);
         }
      }
      
      public function GetAwardDataBySex(sex:int) : Vector.<AwardData>
      {
         var res:Vector.<AwardData> = new Vector.<AwardData>();
         for(var i:int = 0; i < this.m_vNeed.length; i++)
         {
            res.push(this.m_vNeed[i]);
         }
         for(i = 0; i < this.m_vAward.length; i++)
         {
            if(sex == this.m_vAward[i].m_iSex || this.m_vAward[i].m_iSex == 0)
            {
               res.push(this.m_vAward[i]);
            }
         }
         return res;
      }
   }
}

