package com.aurora.ui.maogoutd.role
{
   import flash.display.Bitmap;
   import flash.utils.Dictionary;
   
   public class a_4461
   {
      
      public var m_iItemID:int;
      
      public var m_iItemSeq:int;
      
      public var m_nItemCount:int;
      
      public var m_nItemUsedCount:int;
      
      public var m_iUsedTime:int;
      
      public var m_nItemPosition:int;
      
      public var m_cIsBind:int;
      
      public var m_cItemColor:int;
      
      public var m_iType:int;
      
      public var m_iTypeValue:int;
      
      public var m_iDeltaTime:int;
      
      public var m_dictExtraAttr:Dictionary;
      
      public var m_arrExtraAttr:Array;
      
      public var m_nItemSlotNum:int;
      
      private var m_image:Bitmap;
      
      private var _attack:int;
      
      private var _defence:int;
      
      public function a_4461()
      {
         super();
         this.m_nItemPosition = -1;
         this.m_dictExtraAttr = new Dictionary(true);
      }
      
      public function get URL() : String
      {
         return "images/1/4/0x" + this.m_iItemID.toString(16) + ".png";
      }
      
      public function get GoodsType() : int
      {
         return (this.m_iItemID & 0xF0000000) >> 28;
      }
      
      public function get GoodsCardType() : int
      {
         return (this.m_iItemID & 0x0F000000) >> 24;
      }
      
      public function get CardEquipmentType() : int
      {
         return (this.m_iItemID & 0xF00000) >> 20;
      }
      
      public function get ID() : String
      {
         return this.m_iItemID + "-" + this.m_iItemSeq;
      }
      
      public function toItemID() : String
      {
         return this.m_iItemID + "-" + this.m_iItemSeq;
      }
      
      public function format(itemContent:String) : void
      {
         var arrItem:Array = null;
         if(itemContent != null)
         {
            arrItem = itemContent.split("-");
            this.m_iItemID = arrItem[0];
            this.m_iItemSeq = arrItem[1];
         }
      }
      
      public function get defence() : int
      {
         if(this.m_iType == 2)
         {
            this._defence += this.m_iTypeValue;
         }
         return this._defence;
      }
      
      public function get attack() : int
      {
         if(this.m_iType == 1)
         {
            this._attack += this.m_iTypeValue;
         }
         return this._attack;
      }
      
      public function set Image(image:Bitmap) : void
      {
         if(image != null && image.bitmapData != null)
         {
            if(this.m_image == null)
            {
               this.m_image = new Bitmap();
            }
            this.m_image.bitmapData = image.bitmapData;
            this.m_image.smoothing = true;
         }
      }
      
      public function get Image() : Bitmap
      {
         return this.m_image;
      }
   }
}

