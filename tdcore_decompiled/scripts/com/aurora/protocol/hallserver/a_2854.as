package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2854 implements CMessageBody
   {
      
      public var m_iServiceID:int;
      
      public var m_iExpireTime:int;
      
      public function a_2854()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var siez:int = a_2664.decode_int16(byte_array);
         this.m_iServiceID = a_2664.decode_int32(byte_array);
         this.m_iExpireTime = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

