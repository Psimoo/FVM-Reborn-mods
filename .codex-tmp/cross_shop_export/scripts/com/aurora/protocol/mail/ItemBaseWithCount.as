package com.aurora.protocol.mail
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class ItemBaseWithCount implements CMessageBody
   {
      
      public var m_iItemID:int;
      
      public var m_iItemSeq:int;
      
      public var m_nItemCount:int;
      
      public function ItemBaseWithCount()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iItemID","int32"],["m_iItemSeq","int32"],["m_nItemCount","int32"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iItemID","int32"],["m_iItemSeq","int32"],["m_nItemCount","int32"]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

