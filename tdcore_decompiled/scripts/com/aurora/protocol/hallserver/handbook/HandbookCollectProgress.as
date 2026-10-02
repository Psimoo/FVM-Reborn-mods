package com.aurora.protocol.hallserver.handbook
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class HandbookCollectProgress implements CMessageBody
   {
      
      public var m_cCollectType:int;
      
      public var m_nCollectPoint:int;
      
      public var m_cCollectAward:int;
      
      public function HandbookCollectProgress()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_cCollectType = a_2664.decode_int16(byte_array);
         this.m_nCollectPoint = a_2664.decode_int16(byte_array);
         this.m_cCollectAward = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

