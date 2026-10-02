package com.aurora.ui.maogoutd.PayAward
{
   public class CumulativeRechargeXML
   {
      
      public var m_iStartTime:int;
      
      public var m_strActicityDesc:String;
      
      public var m_vAwardItems:Vector.<RechargeReceieveItem>;
      
      public function CumulativeRechargeXML()
      {
         super();
         this.m_vAwardItems = new Vector.<RechargeReceieveItem>();
      }
      
      public function GetAwardDataBySex(iUserSex:int, iPosID:int) : Vector.<AwardData>
      {
         var stRechargeReceieveItem:RechargeReceieveItem = this.GetItemByPosID(iPosID);
         return stRechargeReceieveItem.GetAwardDataBySex(iUserSex);
      }
      
      public function GetItemByPosID(iPosID:int) : RechargeReceieveItem
      {
         var stItem:RechargeReceieveItem = null;
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
         var stRechargeReceieveItem:RechargeReceieveItem = null;
         var stItemXML:XML = null;
         this.m_iStartTime = stXML.@startTime;
         this.m_strActicityDesc = stXML.@acticityDesc;
         this.m_vAwardItems.length = 0;
         for each(stItemXML in stXML.item)
         {
            stRechargeReceieveItem = new RechargeReceieveItem();
            stRechargeReceieveItem.AnalysisXML(stItemXML);
            this.m_vAwardItems.push(stRechargeReceieveItem);
         }
         this.m_vAwardItems.sort(this.sortBehavior);
      }
      
      private function sortBehavior(stItemA:RechargeReceieveItem, stItemB:RechargeReceieveItem) : int
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

