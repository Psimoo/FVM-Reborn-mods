package com.aurora.game.maogoutd.common.marriage
{
   import flash.utils.Dictionary;
   
   public class WeddingFireWorkItem
   {
      
      public var m_iLevel:int;
      
      public var m_iNeedMoney:int;
      
      public var m_iMoneyType:int;
      
      public var m_dictManagerFreeNum:Dictionary;
      
      public function WeddingFireWorkItem()
      {
         super();
      }
      
      public function AnalysisXML(stXML:XML) : void
      {
         var child:XML = null;
         var iWeddingLevel:int = 0;
         var iManagerFreeNum:int = 0;
         this.m_iLevel = stXML.@level;
         this.m_iNeedMoney = stXML.@needMoney;
         this.m_iMoneyType = stXML.@moneyType;
         this.m_dictManagerFreeNum = new Dictionary(true);
         for each(child in stXML.element)
         {
            iWeddingLevel = int(child.@weddingLevel);
            iManagerFreeNum = int(child.@managerFreeNum);
            this.m_dictManagerFreeNum[iWeddingLevel] = iManagerFreeNum;
         }
      }
   }
}

