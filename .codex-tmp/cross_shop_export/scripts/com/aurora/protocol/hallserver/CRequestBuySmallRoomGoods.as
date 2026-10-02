package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CRequestBuySmallRoomGoods implements CMessageBody
   {
      
      public var m_RoleUin:int;
      
      public var m_ItemID:int;
      
      public var m_ItemType:int;
      
      public function CRequestBuySmallRoomGoods()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_RoleUin);
         a_2664.encode_int32(byte_array,this.m_ItemID);
         a_2664.encode_int32(byte_array,this.m_ItemType);
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         return false;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

