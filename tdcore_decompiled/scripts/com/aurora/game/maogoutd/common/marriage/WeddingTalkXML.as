package com.aurora.game.maogoutd.common.marriage
{
   public class WeddingTalkXML
   {
      
      public var m_vRidicules:Vector.<WeddingDialogueItem>;
      
      public var m_vPriests:Vector.<WeddingDialogueItem>;
      
      public var m_vGrooms:Vector.<WeddingDialogueItem>;
      
      public var m_vBrides:Vector.<WeddingDialogueItem>;
      
      public function WeddingTalkXML()
      {
         super();
         this.m_vRidicules = new Vector.<WeddingDialogueItem>();
         this.m_vPriests = new Vector.<WeddingDialogueItem>();
         this.m_vGrooms = new Vector.<WeddingDialogueItem>();
         this.m_vBrides = new Vector.<WeddingDialogueItem>();
      }
      
      public function AnalysisXML(stXML:XML) : void
      {
         this.Analysis(stXML.ridicule[0],this.m_vRidicules);
         this.Analysis(stXML.priest[0],this.m_vPriests);
         this.Analysis(stXML.groom[0],this.m_vGrooms);
         this.Analysis(stXML.bride[0],this.m_vBrides);
      }
      
      private function Analysis(stXML:XML, vItems:Vector.<WeddingDialogueItem>) : void
      {
         var child:XML = null;
         var stItem:WeddingDialogueItem = null;
         vItems.length = 0;
         for each(child in stXML.element)
         {
            stItem = new WeddingDialogueItem();
            stItem.AnalysisXML(child);
            vItems.push(stItem);
         }
      }
   }
}

