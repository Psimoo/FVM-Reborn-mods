package com.aurora.ui.maogoutd.PayAward
{
   public class FirstRechargeXML
   {
      
      public var m_iFreeExchangeNum:int;
      
      public var m_iExchangeNeedPoint:int;
      
      public var m_vAwardItems:Vector.<FirstRechargeReceieveItem>;
      
      public function FirstRechargeXML()
      {
         super();
         this.m_vAwardItems = new Vector.<FirstRechargeReceieveItem>();
      }
      
      public function GetAwardDataBySex(iUserSex:int, iPosID:int) : Vector.<AwardData>
      {
         var stItem:FirstRechargeReceieveItem = this.GetItemByPosID(iPosID);
         return stItem.GetAwardDataBySex(iUserSex);
      }
      
      public function GetItemByPosID(iPosID:int) : FirstRechargeReceieveItem
      {
         var stItem:FirstRechargeReceieveItem = null;
         for each(stItem in this.m_vAwardItems)
         {
            if(stItem.m_iPosID == iPosID)
            {
               return stItem;
            }
         }
         return null;
      }
      
      public function AnalysisXML(stXML:XML) : void
      {
         var stFirstRechargeReceieveItem:FirstRechargeReceieveItem = null;
         var stItemXML:XML = null;
         this.m_iFreeExchangeNum = stXML.@freeExchangeNum;
         this.m_iExchangeNeedPoint = stXML.@exchangePoint;
         this.m_vAwardItems.length = 0;
         for each(stItemXML in stXML.item)
         {
            stFirstRechargeReceieveItem = new FirstRechargeReceieveItem();
            stFirstRechargeReceieveItem.AnalysisXML(stItemXML);
            this.m_vAwardItems.push(stFirstRechargeReceieveItem);
         }
         this.m_vAwardItems.sort(this.sortBehavior);
      }
      
      private function sortBehavior(stItemA:FirstRechargeReceieveItem, stItemB:FirstRechargeReceieveItem) : int
      {
         if(stItemA.m_iPosID < stItemB.m_iPosID)
         {
            return -1;
         }
         if(stItemA.m_iPosID > stItemB.m_iPosID)
         {
            return 1;
         }
         return 0;
      }
   }
}

