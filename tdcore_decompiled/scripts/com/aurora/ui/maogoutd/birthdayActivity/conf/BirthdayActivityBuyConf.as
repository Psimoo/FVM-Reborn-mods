package com.aurora.ui.maogoutd.birthdayActivity.conf
{
   public class BirthdayActivityBuyConf
   {
      
      public var currencyType:int;
      
      public var price:int;
      
      public function BirthdayActivityBuyConf()
      {
         super();
      }
      
      public function parseXml(xml:XML) : void
      {
         this.currencyType = xml.@currency_type;
         this.price = xml.@price;
      }
   }
}

