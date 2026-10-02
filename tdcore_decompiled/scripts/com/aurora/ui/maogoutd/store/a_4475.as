package com.aurora.ui.maogoutd.store
{
   public class a_4475
   {
      
      public var g_goodsID:int;
      
      public var itemCardID:int;
      
      public var itemCount:int;
      
      public var i_expiry_date:int;
      
      public var i_time_flag:int;
      
      public var i_is_bind:int;
      
      public var i_used_count:int;
      
      public var i_desc:String;
      
      public var i_comm_currency_type:int = -1;
      
      public var i_comm_price:Number;
      
      public var i_vip_price:Number;
      
      public var i_discount_price:Number;
      
      public var i_renew_price:Number;
      
      public var i_buy_type:Number;
      
      public var i_is_visible:int;
      
      public var i_attr_type:int;
      
      public var i_attr_value:int;
      
      public var i_is_level:int;
      
      public function a_4475()
      {
         super();
      }
      
      public function clone() : a_4475
      {
         var item:a_4475 = new a_4475();
         item.g_goodsID = this.g_goodsID;
         item.itemCardID = this.itemCardID;
         item.itemCount = this.itemCount;
         item.i_expiry_date = this.i_expiry_date;
         item.i_time_flag = this.i_time_flag;
         item.i_is_bind = this.i_is_bind;
         item.i_used_count = this.i_used_count;
         item.i_desc = this.i_desc;
         item.i_comm_currency_type = this.i_comm_currency_type;
         item.i_comm_price = this.i_comm_price;
         item.i_vip_price = this.i_vip_price;
         item.i_discount_price = this.i_discount_price;
         item.i_renew_price = this.i_renew_price;
         item.i_buy_type = this.i_buy_type;
         item.i_is_visible = this.i_is_visible;
         item.i_attr_type = this.i_attr_type;
         item.i_attr_value = this.i_attr_value;
         return item;
      }
   }
}

