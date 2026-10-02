package com.aurora.game.maogoutd.common.marriage
{
   import com.aurora.ui.maogoutd.PayAward.AwardData;
   
   public class WelfareAwardItem
   {
      
      public var m_iID:int;
      
      public var m_vAwards:Vector.<AwardData>;
      
      public function WelfareAwardItem()
      {
         super();
         this.m_vAwards = new Vector.<AwardData>();
      }
      
      public function AnalysisXML(stXML:XML) : void
      {
         var stItem:XML = null;
         var stAwardData:AwardData = null;
         this.m_iID = stXML.@id;
         this.m_vAwards.length = 0;
         for each(stItem in stXML.item)
         {
            stAwardData = new AwardData();
            stAwardData.AnalysisXML(stItem);
            this.m_vAwards.push(stAwardData);
         }
      }
   }
}

