package com.aurora.protocol.hallserver.loverrecipe
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CCrystoneInfo implements CMessageBody
   {
      
      public var m_cPage:int;
      
      public var m_cCount:int;
      
      public function CCrystoneInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_cPage = a_2664.decode_int8(byte_array);
         this.m_cCount = a_2664.decode_int8(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

