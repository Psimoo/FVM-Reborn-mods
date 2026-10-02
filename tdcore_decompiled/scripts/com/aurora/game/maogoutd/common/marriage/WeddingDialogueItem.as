package com.aurora.game.maogoutd.common.marriage
{
   public class WeddingDialogueItem
   {
      
      public var m_iID:int;
      
      public var m_strContent:String;
      
      public function WeddingDialogueItem()
      {
         super();
      }
      
      public function AnalysisXML(stXML:XML) : void
      {
         this.m_iID = stXML.@id;
         this.m_strContent = stXML.@content;
      }
   }
}

