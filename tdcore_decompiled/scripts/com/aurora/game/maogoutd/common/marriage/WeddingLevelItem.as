package com.aurora.game.maogoutd.common.marriage
{
   import com.aurora.ui.maogoutd.PayAward.AwardData;
   
   public class WeddingLevelItem
   {
      
      public var m_iWeddingLevel:int;
      
      public var m_strWeddingName:String;
      
      public var m_iNeedMarriageLevel:int;
      
      public var m_iCanChooseMaxDress:int;
      
      public var m_iNeedMoney:int;
      
      public var m_vPrivileges:Vector.<AwardData>;
      
      public var m_vKeepSakes:Vector.<AwardData>;
      
      public function WeddingLevelItem()
      {
         super();
         this.m_vPrivileges = new Vector.<AwardData>();
         this.m_vKeepSakes = new Vector.<AwardData>();
      }
      
      public function AnalysisXML(stXML:XML) : void
      {
         var stItemXML:XML = null;
         var stAwardData:AwardData = null;
         this.m_iWeddingLevel = stXML.@level;
         this.m_strWeddingName = stXML.@weddingName;
         this.m_iNeedMarriageLevel = stXML.@needMarriageLevel;
         this.m_iCanChooseMaxDress = stXML.@canChooseMaxDress;
         this.m_iNeedMoney = stXML.@needMoney;
         this.m_vPrivileges.length = 0;
         for each(stItemXML in stXML.privileges.element)
         {
            stAwardData = new AwardData();
            stAwardData.AnalysisXML(stItemXML);
            this.m_vPrivileges.push(stAwardData);
         }
         this.m_vKeepSakes.length = 0;
         for each(stItemXML in stXML.keepSakes.element)
         {
            stAwardData = new AwardData();
            stAwardData.AnalysisXML(stItemXML);
            this.m_vKeepSakes.push(stAwardData);
         }
      }
   }
}

