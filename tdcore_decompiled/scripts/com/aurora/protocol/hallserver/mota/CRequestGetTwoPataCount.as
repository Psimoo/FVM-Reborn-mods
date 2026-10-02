package com.aurora.protocol.hallserver.mota
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CRequestGetTwoPataCount implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_iFrom:int;
      
      public var m_iTo:int;
      
      public function CRequestGetTwoPataCount()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iUin);
         a_2664.encode_int32(byte_array,this.m_iFrom);
         a_2664.encode_int32(byte_array,this.m_iTo);
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

