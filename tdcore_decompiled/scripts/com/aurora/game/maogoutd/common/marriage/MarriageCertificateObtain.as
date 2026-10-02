package com.aurora.game.maogoutd.common.marriage
{
   import com.aurora.ui.maogoutd.PayAward.AwardData;
   
   public class MarriageCertificateObtain
   {
      
      public var m_iSex:int;
      
      public var m_iCertificateID:int;
      
      public var m_vItem:Vector.<AwardData>;
      
      public function MarriageCertificateObtain()
      {
         super();
         this.m_vItem = new Vector.<AwardData>();
      }
      
      public function AnalysisXML(stXML:XML) : void
      {
         var child:XML = null;
         var stAwardData:AwardData = null;
         this.m_iSex = stXML.@sex;
         this.m_iCertificateID = stXML.@certificateID;
         this.m_vItem.length = 0;
         for each(child in stXML.element)
         {
            stAwardData = new AwardData();
            stAwardData.AnalysisXML(child);
            this.m_vItem.push(stAwardData);
         }
      }
   }
}

