package com.aurora.ui.maogoutd.compose.Fusion
{
   public class CardFusionItem
   {
      
      public var m_iRecipeID:int;
      
      public var m_iFirstMainID:int;
      
      public var m_iMainLevel:int;
      
      public var m_iMainGrade:int;
      
      public var m_iSubCardID:int;
      
      public var m_iMinSubCardLevel:int;
      
      public var m_iAgentCount:int;
      
      public var m_iSecondMainID:int;
      
      public var m_vecObtainInfos:Vector.<FusionObtainItem> = new Vector.<FusionObtainItem>(0);
      
      public var m_iType:int;
      
      public function CardFusionItem()
      {
         super();
         this.m_iSubCardID = -1;
         this.m_iSecondMainID = -1;
      }
      
      public function isRuleCard(id:int) : Boolean
      {
         return id == this.m_iFirstMainID || id == this.m_iSecondMainID || id == this.m_iSubCardID;
      }
   }
}

