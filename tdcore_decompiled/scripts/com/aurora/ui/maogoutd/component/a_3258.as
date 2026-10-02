package com.aurora.ui.maogoutd.component
{
   import com.aurora.ui.maogoutd.store.a_4475;
   import flash.display.Bitmap;
   
   public class a_3258
   {
      
      public var CardID:int;
      
      public var CardSeq:int;
      
      public var CardCount:int;
      
      public var Image:Bitmap;
      
      public var g_goodsID:int;
      
      public var g_name:String;
      
      public var g_type:int;
      
      public var g_comm_currency_type:int;
      
      public var g_comm_price:Number;
      
      public var g_vip_price:Number;
      
      public var g_discount_price:Number;
      
      public var g_renew_price:Number;
      
      public var g_description:String;
      
      public var i_desc:String;
      
      public var g_expirydate:int;
      
      public var g_used_count:int;
      
      public var g_buy_type:int;
      
      public var g_energy:String;
      
      public var g_hot:int;
      
      public var g_order:int;
      
      public var g_is_visible:int;
      
      public var arrItems:Array;
      
      public var itemType:int;
      
      public var w:Number = 420;
      
      public var h:Number = 68;
      
      public var flag:int;
      
      public var index:int;
      
      public var y:Number;
      
      public function a_3258()
      {
         super();
         this.CardID = 0;
         this.CardCount = 0;
         this.g_order = 0;
      }
      
      public function get ID() : String
      {
         return this.CardID + "-" + this.CardSeq;
      }
      
      public function get URL() : String
      {
         return "images/2/" + this.GoodsCardType + "/0x" + this.CardID.toString(16) + ".png";
      }
      
      public function get GoodsType() : int
      {
         return (this.CardID & 0xF0000000) >> 28;
      }
      
      public function get GoodsCardType() : int
      {
         return (this.CardID & 0x0F000000) >> 24;
      }
      
      public function get CardEquipmentType() : int
      {
         return (this.CardID & 0xF00000) >> 20;
      }
      
      public function get CardComposeProps() : int
      {
         return (this.CardID & 0xF00000) >> 20;
      }
      
      public function get CardComposePropsType() : int
      {
         return (this.CardID & 0x0F0000) >> 16;
      }
      
      public function get CardComposePropsClass() : int
      {
         return (this.CardID & 0x0F00) >> 8;
      }
      
      public function get CardComposePropsLevel() : int
      {
         return (this.CardID & 0xF0) >> 4;
      }
      
      public function get CardFightProps() : int
      {
         return (this.CardID & 0xF00000) >> 20;
      }
      
      public function get CardFightPropsType() : int
      {
         return (this.CardID & 0x0F0000) >> 16;
      }
      
      public function get CardPropssLevelType() : int
      {
         return (this.CardID & 0xF0) >> 4;
      }
      
      public function cloneImage() : Bitmap
      {
         if(!this.Image && this.Image.bitmapData != null)
         {
            return null;
         }
         var target:Bitmap = new Bitmap(this.Image.bitmapData.clone());
         target.smoothing = true;
         target.filters = this.Image.filters;
         return target;
      }
      
      public function clone() : a_3258
      {
         var attr:a_3258 = new a_3258();
         attr.CardID = this.CardID;
         attr.CardSeq = this.CardSeq;
         attr.CardCount = this.CardCount;
         attr.Image = this.Image;
         attr.g_goodsID = this.g_goodsID;
         attr.g_name = this.g_name;
         attr.g_type = this.g_type;
         attr.g_comm_currency_type = this.g_comm_currency_type;
         attr.g_comm_price = this.g_comm_price;
         attr.g_vip_price = this.g_vip_price;
         attr.g_discount_price = this.g_discount_price;
         attr.g_renew_price = this.g_renew_price;
         attr.g_description = this.g_description;
         attr.i_desc = this.i_desc;
         attr.g_expirydate = this.g_expirydate;
         attr.g_used_count = this.g_used_count;
         attr.g_buy_type = this.g_buy_type;
         attr.g_energy = this.g_energy;
         attr.g_order = this.g_order;
         attr.g_hot = this.g_hot;
         attr.arrItems = this.cloneItems();
         attr.itemType = this.itemType;
         attr.w = this.w;
         attr.h = this.h;
         attr.flag = this.flag;
         attr.index = this.index;
         attr.y = this.y;
         return attr;
      }
      
      private function cloneItems() : Array
      {
         var item:a_4475 = null;
         var arrCitems:Array = [];
         if(this.arrItems != null)
         {
            for each(item in this.arrItems)
            {
               arrCitems.push(item.clone());
            }
         }
         return arrCitems;
      }
   }
}

