package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseGetCrmInfo implements CMessageBody
   {
      
      public var m_iUIN:int;
      
      public var m_iCurCount:int;
      
      public var m_iTyoe:int;
      
      public function CResponseGetCrmInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iUIN = a_2664.decode_int32(byte_array);
         this.m_iCurCount = a_2664.decode_int8(byte_array);
         this.m_iTyoe = a_2664.decode_int8(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

