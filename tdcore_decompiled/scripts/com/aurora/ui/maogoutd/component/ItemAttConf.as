package com.aurora.ui.maogoutd.component
{
   public class ItemAttConf
   {
      
      public var m_iID:int;
      
      public var m_iItemID:int;
      
      public var m_iLevel:int;
      
      public var m_iNum:int;
      
      public var m_iContinueTime:int;
      
      public var m_iIsBind:int;
      
      public var m_iSex:int;
      
      public var m_stCardAttr:a_3228;
      
      public function ItemAttConf()
      {
         super();
      }
      
      public static function AwardData2CardAttr(stAwardData:Object) : a_3228
      {
         var stCardAttr:a_3228 = null;
         var itemExtra:Object = null;
         stCardAttr = new a_3228();
         stCardAttr.CardID = stAwardData.m_iItemID;
         stCardAttr.UseNumber = "";
         if((stAwardData.m_iItemID & 0xFFFFF000) != 308314112)
         {
            if(undefined != stAwardData.m_iNum)
            {
               stCardAttr.CardCount = stAwardData.m_iNum;
            }
         }
         else if(undefined != stAwardData.m_iNum)
         {
            stCardAttr.CardCount = 1;
         }
         if(undefined != stAwardData.m_iLevel)
         {
            stCardAttr.TypeValue = stAwardData.m_iLevel;
            itemExtra = {};
            itemExtra.m_cItemType = 0;
            itemExtra.m_iItemAdd = stCardAttr.TypeValue;
            stCardAttr.m_arrExtraAttr = [itemExtra];
         }
         if(undefined != stAwardData.m_iIsBind)
         {
            stCardAttr.IsBind = 1 == stAwardData.m_iIsBind ? 1 : 2;
         }
         if(undefined != stAwardData.m_iContinueTime && -1 != stAwardData.m_iContinueTime)
         {
            stCardAttr.ExpiredTime = -2;
            stCardAttr.DeltaTime = stAwardData.m_iContinueTime;
         }
         return stCardAttr;
      }
      
      public function AnalysisXML(stXML:XML) : void
      {
         this.m_iID = stXML.@id;
         this.m_iItemID = stXML.@itemID;
         if(this.m_iItemID == 0)
         {
            this.m_iItemID = stXML.@itemid;
         }
         this.m_iLevel = stXML.@level;
         this.m_iNum = stXML.@num;
         this.m_iContinueTime = stXML.@time;
         this.m_iIsBind = stXML.@isBind;
         this.m_iSex = stXML.@sex;
         this.m_stCardAttr = AwardData2CardAttr(this);
      }
   }
}

