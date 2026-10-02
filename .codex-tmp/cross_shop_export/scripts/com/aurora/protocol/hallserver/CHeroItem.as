package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CHeroItem implements CMessageBody
   {
      
      public var m_iItemID:int;
      
      public var m_iItemSeq:int;
      
      public var m_nItemCount:int;
      
      public var m_nItemUsedCount:int;
      
      public var m_nItemSlotNum:int;
      
      public var m_iExpiredTime:int;
      
      public var m_nItemPosition:int;
      
      public var m_cIsBind:int;
      
      public var m_cItemColor:int;
      
      public var m_iUsedTime:int;
      
      public var m_iDeltaTime:int;
      
      public var m_nItemExtraAttrCount:int;
      
      public var m_arrExtraAttr:Array;
      
      private var stHeroItemExtraAttr:CHeroItemExtraAttr;
      
      public function CHeroItem()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iItemID","int32"],["m_iItemSeq","int32"],["m_nItemCount","int16"],["m_nItemUsedCount","int16"],["m_nItemSlotNum","int16"],["m_iExpiredTime","int32"],["m_nItemPosition","int16"],["m_cIsBind","int8"],["m_cItemColor","int8"],["m_iUsedTime","int32"],["m_iDeltaTime","int32"],["m_nItemExtraAttrCount","int16"],["m_arrExtraAttr",["object","com.aurora.protocol.hallserver.CHeroItemExtraAttr"]]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var stAttr:CHeroItemExtraAttr = null;
         this.m_iItemID = a_2664.decode_int32(byte_array);
         this.m_iItemSeq = a_2664.decode_int32(byte_array);
         this.m_nItemCount = a_2664.decode_int16(byte_array);
         this.m_nItemUsedCount = a_2664.decode_int16(byte_array);
         this.m_iExpiredTime = a_2664.decode_int32(byte_array);
         this.m_nItemPosition = a_2664.decode_int16(byte_array);
         this.m_cIsBind = a_2664.decode_int8(byte_array);
         this.m_cItemColor = a_2664.decode_int8(byte_array);
         this.m_iUsedTime = a_2664.decode_int32(byte_array);
         this.m_iDeltaTime = a_2664.decode_int32(byte_array);
         this.m_nItemExtraAttrCount = a_2664.decode_int16(byte_array);
         this.m_arrExtraAttr = [];
         for(var i:int = 0; i < this.m_nItemExtraAttrCount; i++)
         {
            stAttr = new CHeroItemExtraAttr();
            a_2664.decode_int16(byte_array);
            stAttr.decode(byte_array,decode_length);
            this.m_arrExtraAttr.push(stAttr);
         }
         this.m_nItemSlotNum = a_2664.decode_int16(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

