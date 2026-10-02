package com.aurora.ui.maogoutd.birthdayActivity.conf
{
   import com.aurora.ui.maogoutd.PayAward.AwardData;
   
   public class BirthdayActivityDailyTaskAwardConf
   {
      
      public var day:int;
      
      public var cakeIconId:int;
      
      public var cakeValue:int;
      
      public var awardAry:Vector.<AwardData>;
      
      public function BirthdayActivityDailyTaskAwardConf()
      {
         super();
         this.awardAry = new Vector.<AwardData>();
      }
      
      public function parseXml(xml:XML) : void
      {
         var conf:AwardData = null;
         var itemXml:XML = null;
         this.day = xml.@id;
         this.cakeIconId = xml.@cakeIcon;
         this.cakeValue = xml.@cakeValue;
         var cakeAward:AwardData = new AwardData();
         cakeAward.m_iItemID = this.cakeIconId;
         cakeAward.m_iNum = this.cakeValue;
         cakeAward.m_stCardAttr = AwardData.AwardData2CardAttr(cakeAward);
         this.awardAry.push(cakeAward);
         for each(itemXml in xml.item)
         {
            conf = new AwardData();
            conf.AnalysisXML(itemXml);
            this.awardAry.push(conf);
         }
      }
   }
}

