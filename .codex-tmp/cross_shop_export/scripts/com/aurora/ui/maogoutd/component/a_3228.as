package com.aurora.ui.maogoutd.component
{
   import a_4723.a_1767;
   import a_4781.Tool;
   import flash.display.Bitmap;
   import flash.utils.Dictionary;
   
   public class a_3228
   {
      
      public var CardID:int;
      
      public var CardSeq:int;
      
      public var CardCount:int;
      
      public var UsedCount:int;
      
      public var ExpiredTime:int;
      
      public var CardPositionID:int;
      
      public var Type:int;
      
      public var TypeValue:int;
      
      public var Image:Bitmap;
      
      public var IsBind:int;
      
      public var DeltaTime:int;
      
      public var Name:String;
      
      public var UseNumber:String;
      
      public var DictExtraAttr:Dictionary;
      
      public var m_arrExtraAttr:Array;
      
      public var m_nItemSlotNum:int;
      
      public var m_bIsEquip:Boolean;
      
      public var m_bIsClick:Boolean;
      
      public function a_3228()
      {
         super();
         this.CardID = 0;
         this.CardPositionID = -1;
         this.CardCount = 0;
         this.ExpiredTime = -1;
         this.UseNumber = "0";
         this.Name = "";
         this.IsBind = 2;
         this.DictExtraAttr = new Dictionary(true);
         this.m_arrExtraAttr = [];
         this.m_bIsEquip = false;
      }
      
      public function set URL(m_CardID:String) : void
      {
         this.CardID = Number(m_CardID);
      }
      
      public function get ID() : String
      {
         return this.CardID + "-" + this.CardSeq;
      }
      
      public function get URLID() : String
      {
         var _urlID:int = 0;
         if((this.CardID & 0xFF000000) == 335544320 && (this.CardID & 0xFFF00000) != 343932928 && (this.CardID & 0xFFF00000) != 344981504)
         {
            _urlID = this.CardID & 0x0FFFFFFF | 0x20000000;
         }
         else
         {
            _urlID = this.CardID;
         }
         return _urlID.toString(16);
      }
      
      public function get URL() : String
      {
         var url:String = "0x0.png";
         if((this.CardID & 0xFF000000) == 335544320 && (this.CardID & 0xFFF00000) != 343932928 && (this.CardID & 0xFFF00000) != 344981504)
         {
            url = "images/2/4/0x" + this.URLID + ".png";
         }
         else
         {
            url = "images/" + this.GoodsType + "/" + this.GoodsCardType + "/0x" + this.URLID + ".png";
         }
         return url;
      }
      
      public function get IsExpiredTime() : Boolean
      {
         var systemTime:int = a_1767.getInstance().SystemTime;
         return this.ExpiredTime != -2 && this.ExpiredTime != -1 && this.ExpiredTime < systemTime;
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
      
      public function get DefCardType() : int
      {
         return (this.CardID & 0xF000) >> 12;
      }
      
      public function get CardFightProps() : int
      {
         return (this.CardID & 0xF00000) >> 20;
      }
      
      public function get CardFightPropsType() : int
      {
         return (this.CardID & 0x0F0000) >> 16;
      }
      
      public function get EquipmentGender() : int
      {
         return (this.CardID & 0xF0) >> 4;
      }
      
      public function cloneImage() : Bitmap
      {
         if(!this.Image)
         {
            return null;
         }
         var target:Bitmap = new Bitmap(this.Image.bitmapData.clone());
         target.smoothing = true;
         target.filters = this.Image.filters;
         return target;
      }
      
      public function toIDString() : String
      {
         return this.CardID + "," + this.CardPositionID + "," + this.CardSeq;
      }
      
      public function format(itemContent:String) : void
      {
         var arrItem:Array = null;
         if(itemContent != null)
         {
            arrItem = itemContent.split(",");
            this.CardID = arrItem[0];
            this.CardPositionID = arrItem[1];
            this.CardSeq = arrItem[2];
         }
      }
      
      public function clone() : a_3228
      {
         var attr:a_3228 = new a_3228();
         attr.CardID = this.CardID;
         attr.CardSeq = this.CardSeq;
         attr.CardCount = this.CardCount;
         attr.UsedCount = this.UsedCount;
         attr.ExpiredTime = this.ExpiredTime;
         attr.CardPositionID = this.CardPositionID;
         attr.Type = this.Type;
         attr.TypeValue = this.TypeValue;
         attr.Image = this.cloneImage();
         attr.UseNumber = this.UseNumber;
         attr.IsBind = this.IsBind;
         attr.DeltaTime = this.DeltaTime;
         attr.Name = this.Name;
         attr.DictExtraAttr = Tool.a_4653(this.DictExtraAttr) as Dictionary;
         attr.m_arrExtraAttr = Tool.a_4653(this.m_arrExtraAttr) as Array;
         attr.m_nItemSlotNum = this.m_nItemSlotNum;
         return attr;
      }
   }
}

