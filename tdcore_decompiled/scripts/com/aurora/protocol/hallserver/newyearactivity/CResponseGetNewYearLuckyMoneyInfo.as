package com.aurora.protocol.hallserver.newyearactivity
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseGetNewYearLuckyMoneyInfo implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iID:int;
      
      public var m_iNumber:int;
      
      public var m_iReceived:int;
      
      public function CResponseGetNewYearLuckyMoneyInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iID = a_2664.decode_int32(byte_array);
         this.m_iNumber = a_2664.decode_int32(byte_array);
         this.m_iReceived = a_2664.decode_int8(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

