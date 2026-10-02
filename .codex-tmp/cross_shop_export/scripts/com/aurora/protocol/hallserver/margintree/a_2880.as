package com.aurora.protocol.hallserver.margintree
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2880 implements CMessageBody
   {
      
      public var m_iStart:int;
      
      public var m_iEnd:int;
      
      public var m_cSex:int;
      
      public function a_2880()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iStart);
         a_2664.encode_int32(byte_array,this.m_iEnd);
         a_2664.encode_int8(byte_array,this.m_cSex);
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

