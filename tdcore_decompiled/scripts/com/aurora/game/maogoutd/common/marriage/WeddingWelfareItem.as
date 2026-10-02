package com.aurora.game.maogoutd.common.marriage
{
   import com.aurora.ui.maogoutd.PayAward.AwardData;
   
   public class WeddingWelfareItem
   {
      
      public static const ID_HERO:int = 0;
      
      public static const ID_DEF:int = 1;
      
      public static const ID_PROP:int = 2;
      
      public static const ID_NUM:int = 3;
      
      public var m_iLevel:int;
      
      public var m_iNeedWeddingLevel:int;
      
      public var m_iNeedMoney:int;
      
      public var m_iSuperFeedbackSpreeNum:int;
      
      public var m_iReveievedCnt:int;
      
      public var m_iManagerFreeNum:int;
      
      public var m_strRedName:String;
      
      public var m_strCandyName:String;
      
      public var m_vMyselfReveieveRewards:Vector.<WelfareAwardItem>;
      
      public var m_vOthersReveieveRewards:Vector.<WelfareAwardItem>;
      
      public var m_vFeedbackSprees:Vector.<WelfareAwardItem>;
      
      public function WeddingWelfareItem()
      {
         super();
         this.m_vMyselfReveieveRewards = new Vector.<WelfareAwardItem>();
         this.m_vOthersReveieveRewards = new Vector.<WelfareAwardItem>();
         this.m_vFeedbackSprees = new Vector.<WelfareAwardItem>();
      }
      
      public static function GetIDByType(iType:int) : int
      {
         var iID:int = -1;
         if(ID_DEF == iType)
         {
            iID = 285212672;
         }
         else if(ID_PROP == iType)
         {
            iID = 301989888;
         }
         else if(ID_HERO == iType)
         {
            iID = 318767104;
         }
         return iID;
      }
      
      public function AnalysisXML(stXML:XML) : void
      {
         this.m_iLevel = stXML.@level;
         this.m_iNeedWeddingLevel = stXML.@needWeddingLevel;
         this.m_iNeedMoney = stXML.@needMoney;
         this.m_iSuperFeedbackSpreeNum = stXML.@superFeedbackSpreeNum;
         this.m_iReveievedCnt = stXML.@reveievedCnt;
         this.m_iManagerFreeNum = stXML.@managerFreeNum;
         this.m_strRedName = stXML.@redName;
         this.m_strCandyName = stXML.@candyName;
         if(this.m_iSuperFeedbackSpreeNum > this.m_iReveievedCnt)
         {
            throw new Error("m_iLevel = " + this.m_iLevel + "  m_iSuperFeedbackSpreeNum = " + this.m_iSuperFeedbackSpreeNum + "  m_iReveievedCnt = " + this.m_iReveievedCnt + "  wedding.xml m_iSuperFeedbackSpreeNum数量太大");
         }
         this.AnalysisAward(stXML.myselfReveieveReward[0],this.m_vMyselfReveieveRewards);
         this.AnalysisAward(stXML.othersReveieveReward[0],this.m_vOthersReveieveRewards);
         this.AnalysisAward(stXML.feedbackSpree[0],this.m_vFeedbackSprees);
      }
      
      private function AnalysisAward(stXML:XML, vItems:Vector.<WelfareAwardItem>) : void
      {
         var child:XML = null;
         var stItem:WelfareAwardItem = null;
         vItems.length = 0;
         for each(child in stXML.element)
         {
            stItem = new WelfareAwardItem();
            stItem.AnalysisXML(child);
            vItems.push(stItem);
         }
      }
      
      private function TransData(vItems:Vector.<WelfareAwardItem>, arrItemID:Array) : void
      {
         var i:int = 0;
         var stItem:WelfareAwardItem = null;
         var arrCurID:Array = null;
         var stAwardData:AwardData = null;
         var iLen:int = 0;
         var iID:int = 0;
         var j:int = 0;
         var arrCountID:Array = [];
         for each(stItem in vItems)
         {
            arrCurID = [];
            for each(stAwardData in stItem.m_vAwards)
            {
               ++arrCurID[this.GetIDType(stAwardData.m_iItemID)];
            }
            for(i = 0; i < ID_NUM; i++)
            {
               if(arrCountID[i] < arrCurID[i])
               {
                  arrCountID[i] = arrCurID[i];
               }
            }
         }
         arrItemID.length = 0;
         for(i = 0; i < ID_NUM; i++)
         {
            iLen = int(arrCountID[i]);
            iID = GetIDByType(i);
            for(j = 0; j < iLen; j++)
            {
               arrItemID.push(iID);
            }
         }
      }
      
      private function InitIDVector(vItemIDNum:Vector.<int>) : void
      {
         for(var i:int = 0; i < ID_NUM; i++)
         {
            vItemIDNum[i] = 0;
         }
      }
      
      private function GetIDType(iItemID:int) : int
      {
         var iType:int = -1;
         var iIDFF:int = iItemID & 0xFF000000;
         if(285212672 == iIDFF)
         {
            iType = ID_DEF;
         }
         else if(301989888 == iIDFF)
         {
            iType = ID_PROP;
         }
         else if(318767104 == iIDFF || 335544320 == iIDFF)
         {
            iType = ID_HERO;
         }
         return iType;
      }
   }
}

