package com.aurora.ui.maogoutd.birthdayActivity.conf
{
   public class BirthdayActivityOpenSpecialConf
   {
      
      public var currencyType:int;
      
      public var price:int;
      
      public var totalRecharge:int;
      
      public function BirthdayActivityOpenSpecialConf()
      {
         super();
      }
      
      public function parseXml(xml:XML) : void
      {
         this.currencyType = xml.@currency_type;
         this.price = xml.@price;
         this.totalRecharge = xml.@total_recharge;
      }
   }
}

