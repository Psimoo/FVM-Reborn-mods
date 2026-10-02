package com.aurora.ui.maogoutd.birthdayActivity.conf
{
   import com.aurora.ui.maogoutd.PayAward.AwardData;
   
   public class BirthdayActivityCakeAwardItemConf
   {
      
      public var id:int;
      
      public var needCakeCnt:int;
      
      public var normalId:int;
      
      public var specialId:int;
      
      public var normalItemAry:Vector.<AwardData>;
      
      public var specialItemAry:Vector.<AwardData>;
      
      public function BirthdayActivityCakeAwardItemConf()
      {
         super();
         this.normalItemAry = new Vector.<AwardData>();
         this.specialItemAry = new Vector.<AwardData>();
      }
      
      public function parseXml(xml:XML) : void
      {
         var conf:AwardData = null;
         var itemXml:XML = null;
         var specialXml:XML = null;
         this.id = xml.@id;
         this.needCakeCnt = xml.@needCakeCnt;
         var normalXml:XML = xml.normal[0];
         for each(itemXml in normalXml.item)
         {
            conf = new AwardData();
            conf.AnalysisXML(itemXml);
            this.normalItemAry.push(conf);
         }
         this.normalId = normalXml.@id;
         specialXml = xml.special[0];
         for each(itemXml in specialXml.item)
         {
            conf = new AwardData();
            conf.AnalysisXML(itemXml);
            this.specialItemAry.push(conf);
         }
         this.specialId = specialXml.@id;
      }
   }
}

