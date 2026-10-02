package com.aurora.game.maogoutd.common.marriage
{
   import com.aurora.ui.maogoutd.PayAward.AwardData;
   import flash.utils.Dictionary;
   
   public class WeddingWelfareXML
   {
      
      public var m_iFeedbackSpreeCnt:int;
      
      public var m_iMaxShowWelfareNum:int;
      
      public var m_iDurationMilliSecond:int;
      
      public var m_iDelayMilliSecond:int;
      
      public var m_iStartMilliSecond:int;
      
      public var m_iPackageRestNum:int;
      
      public var m_vItems:Vector.<WeddingWelfareItem>;
      
      private var m_dictAwardID:Dictionary;
      
      public function WeddingWelfareXML()
      {
         super();
         this.m_vItems = new Vector.<WeddingWelfareItem>();
      }
      
      public function GetItemByLevel(iLevel:int) : WeddingWelfareItem
      {
         var stItem:WeddingWelfareItem = null;
         for each(stItem in this.m_vItems)
         {
            if(stItem.m_iLevel == iLevel)
            {
               return stItem;
            }
         }
         return null;
      }
      
      public function AnalysisXML(stXML:XML) : void
      {
         var child:XML = null;
         var stItem:WeddingWelfareItem = null;
         this.m_iFeedbackSpreeCnt = stXML.@feedbackSpreeCnt;
         this.m_iDurationMilliSecond = stXML.@durationTime;
         this.m_iDurationMilliSecond *= 1000;
         var fDelayTime:Number = Number(stXML.@delayTime);
         this.m_iDelayMilliSecond = int(fDelayTime * 1000);
         this.m_iStartMilliSecond = this.m_iDurationMilliSecond - this.m_iDelayMilliSecond;
         this.m_iMaxShowWelfareNum = stXML.@maxWelfareNum;
         this.m_iPackageRestNum = stXML.@packageRestNum;
         this.m_dictAwardID = new Dictionary(true);
         this.m_vItems.length = 0;
         for each(child in stXML.welfare)
         {
            stItem = new WeddingWelfareItem();
            stItem.AnalysisXML(child);
            this.m_vItems.push(stItem);
            this.AddToDict(stItem.m_vFeedbackSprees,this.m_dictAwardID);
            this.AddToDict(stItem.m_vMyselfReveieveRewards,this.m_dictAwardID);
            this.AddToDict(stItem.m_vOthersReveieveRewards,this.m_dictAwardID);
         }
      }
      
      public function GetAwardDataByID(iAwardID:int) : AwardData
      {
         return this.m_dictAwardID[iAwardID];
      }
      
      private function AddToDict(vItems:Vector.<WelfareAwardItem>, dictIDs:Dictionary) : void
      {
         var stItem:WelfareAwardItem = null;
         var stData:AwardData = null;
         loop0:
         for each(stItem in vItems)
         {
            var _loc7_:int = 0;
            var _loc8_:* = stItem.m_vAwards;
            loop1:
            while(true)
            {
               for each(stData in _loc8_)
               {
                  if(null != dictIDs[stData.m_iID])
                  {
                     break loop1;
                  }
                  dictIDs[stData.m_iID] = stData;
               }
               continue loop0;
            }
            throw Error("wedding.xml welfares节点 重复的奖励 id = " + stData.m_iID + "  itemID = " + stData.m_iItemID);
         }
      }
   }
}

