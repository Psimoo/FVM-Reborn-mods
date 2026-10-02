package com.aurora.protocol.hallserver.tarot
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CRequestTarot implements CMessageBody
   {
      
      public var m_iUIN:int;
      
      public var m_iType:int;
      
      public var m_iBox:int;
      
      public function CRequestTarot()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iUIN);
         a_2664.encode_int16(byte_array,this.m_iType);
         a_2664.encode_int16(byte_array,this.m_iBox);
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

