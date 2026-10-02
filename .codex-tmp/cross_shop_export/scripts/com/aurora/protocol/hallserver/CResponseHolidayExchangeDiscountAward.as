package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class CResponseHolidayExchangeDiscountAward
   {
      
      public var m_nResult:int;
      
      public var m_iUin:int;
      
      public var m_iID:int;
      
      public function CResponseHolidayExchangeDiscountAward()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_nResult = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iID = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

