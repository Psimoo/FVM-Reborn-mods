package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2912 implements CMessageBody
   {
      
      public var m_iHealthStatus:int;
      
      public var m_iStartTime:int;
      
      public function a_2912()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int8(byte_array,this.m_iHealthStatus);
         a_2664.encode_int64(byte_array,this.m_iStartTime);
         return false;
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

