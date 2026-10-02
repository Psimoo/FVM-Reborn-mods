package com.aurora.ui.maogoutd.birthdayActivity.conf
{
   import com.aurora.ui.maogoutd.PayAward.AwardData;
   
   public class BirthdayActivityDailySignItemConf
   {
      
      public var id:int;
      
      public var itemAry:Vector.<AwardData>;
      
      public function BirthdayActivityDailySignItemConf()
      {
         super();
         this.itemAry = new Vector.<AwardData>();
      }
      
      public function parseXml(xml:XML) : void
      {
         var itemXml:XML = null;
         var conf:AwardData = null;
         this.id = xml.@id;
         for each(itemXml in xml.item)
         {
            conf = new AwardData();
            conf.AnalysisXML(itemXml);
            this.itemAry.push(conf);
         }
      }
   }
}

