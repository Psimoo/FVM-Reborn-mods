package com.aurora.ui.maogoutd.PayAward
{
   import com.aurora.ui.maogoutd.ServiceOpenBags.Data.NewSvrGiftData;
   
   public class NewSvrGiftConfig
   {
      
      private static var m_stServerOpenBagsConfig:NewSvrGiftConfig;
      
      private var m_vGifts:Vector.<NewSvrGiftData>;
      
      public function NewSvrGiftConfig()
      {
         super();
         if(m_stServerOpenBagsConfig)
         {
            throw Error("RechargeActivityConfig 是单例模式 不能重复实例化！！！");
         }
      }
      
      public static function GetInstance() : NewSvrGiftConfig
      {
         if(null == m_stServerOpenBagsConfig)
         {
            m_stServerOpenBagsConfig = new NewSvrGiftConfig();
         }
         return m_stServerOpenBagsConfig;
      }
      
      public function AnalysisXML(stXML:XML) : void
      {
         var gift:XML = null;
         var stBags:NewSvrGiftData = null;
         var item:XML = null;
         var stAwardData:AwardData = null;
         this.m_vGifts = new Vector.<NewSvrGiftData>();
         for each(gift in stXML.newSvrGift.gift)
         {
            stBags = new NewSvrGiftData();
            stBags.m_iId = gift.@id;
            stBags.m_iReceiveCount = gift.@receiveCount;
            stBags.m_strDesc = gift.@desc;
            stBags.m_vAwardData = new Vector.<AwardData>();
            for each(item in gift.item)
            {
               stAwardData = new AwardData();
               stAwardData.AnalysisXML(item);
               stBags.m_vAwardData.push(stAwardData);
            }
            this.m_vGifts.push(stBags);
         }
      }
      
      public function GetGiftDataList() : Vector.<NewSvrGiftData>
      {
         return this.m_vGifts;
      }
   }
}

