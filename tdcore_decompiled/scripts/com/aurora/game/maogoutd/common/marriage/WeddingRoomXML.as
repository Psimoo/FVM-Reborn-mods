package com.aurora.game.maogoutd.common.marriage
{
   public class WeddingRoomXML
   {
      
      public var m_iAdvanceEntryTime:int;
      
      public var m_iRoomDurationTime:int;
      
      public var m_iMaxParticipateCountWeek:int;
      
      public var m_stTalkXML:WeddingTalkXML;
      
      public var m_stBarrageCDTime:int;
      
      public var m_stWeddingSeatXML:WeddingSeatXML;
      
      public var m_stWeddingFireWorkXML:WeddingFireWorkXML;
      
      public var m_stWeddingWelfareXML:WeddingWelfareXML;
      
      public function WeddingRoomXML()
      {
         super();
         this.m_stTalkXML = new WeddingTalkXML();
         this.m_stWeddingSeatXML = new WeddingSeatXML();
         this.m_stWeddingFireWorkXML = new WeddingFireWorkXML();
         this.m_stWeddingWelfareXML = new WeddingWelfareXML();
      }
      
      public function AnalysisXML(stXML:XML) : void
      {
         this.m_iAdvanceEntryTime = stXML.@advanceEntryTime;
         this.m_iRoomDurationTime = stXML.@durationTime;
         this.m_iMaxParticipateCountWeek = stXML.@max_participate_count_week;
         this.m_stTalkXML.AnalysisXML(stXML.talk[0]);
         this.m_stBarrageCDTime = stXML.barrage.@cdTime;
         this.m_stWeddingSeatXML.AnalysisXML(stXML.seat[0]);
         this.m_stWeddingFireWorkXML.AnalysisXML(stXML.firework[0]);
         this.m_stWeddingWelfareXML.AnalysisXML(stXML.welfares[0]);
      }
   }
}

