package com.aurora.protocol.hallserver.mota
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CGetTowCardInfo implements CMessageBody
   {
      
      public var m_iCardID:int;
      
      public var m_iCardLv:int;
      
      public var m_iCardGradeLv:int;
      
      public var m_iCardCount:int;
      
      public function CGetTowCardInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iCardID = a_2664.decode_int32(byte_array);
         this.m_iCardLv = a_2664.decode_int8(byte_array);
         this.m_iCardCount = a_2664.decode_int8(byte_array);
         this.m_iCardGradeLv = a_2664.decode_int8(byte_array);
         return false;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

