package com.aurora.ui.maogoutd.birthdayActivity.conf
{
   import com.aurora.ui.maogoutd.PayAward.AwardData;
   
   public class BirthdayActivityMailConf
   {
      
      public var contentRowAry:Vector.<String>;
      
      public var itemAry:Vector.<AwardData>;
      
      public function BirthdayActivityMailConf()
      {
         super();
         this.contentRowAry = new Vector.<String>();
         this.itemAry = new Vector.<AwardData>();
      }
      
      public function parseXml(xml:XML) : void
      {
         var rowXml:XML = null;
         var itemXml:XML = null;
         var conf:AwardData = null;
         var contentXml:XML = xml.content[0];
         var mailMsg:String = "";
         for each(rowXml in contentXml.row)
         {
            this.contentRowAry.push(rowXml.toString());
         }
         for each(itemXml in xml.award[0].item)
         {
            conf = new AwardData();
            conf.AnalysisXML(itemXml);
            this.itemAry.push(conf);
         }
      }
   }
}

