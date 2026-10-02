package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2963 implements CMessageBody
   {
      
      public var m_iSize:int;
      
      public var m_iTableID:int;
      
      public var m_nTableStatus:int;
      
      public function a_2963()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iSize = a_2664.decode_int8(byte_array);
         this.m_iTableID = a_2664.decode_int32(byte_array);
         this.m_nTableStatus = a_2664.decode_int16(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

