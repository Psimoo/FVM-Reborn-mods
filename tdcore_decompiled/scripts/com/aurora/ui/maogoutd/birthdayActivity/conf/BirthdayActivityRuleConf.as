package com.aurora.ui.maogoutd.birthdayActivity.conf
{
   public class BirthdayActivityRuleConf
   {
      
      public var contentRowAry:Vector.<String>;
      
      public function BirthdayActivityRuleConf()
      {
         super();
         this.contentRowAry = new Vector.<String>();
      }
      
      public function parseXml(xml:XML) : void
      {
         var rowXml:XML = null;
         var contentXml:XML = xml.content[0];
         var mailMsg:String = "";
         for each(rowXml in contentXml.row)
         {
            this.contentRowAry.push(rowXml.toString());
         }
      }
   }
}

