package com.aurora.protocol.task
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2993 implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_iTaskID:int;
      
      public var m_cSelect:int;
      
      public function a_2993()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iUin);
         a_2664.encode_int32(byte_array,this.m_iTaskID);
         a_2664.encode_int8(byte_array,this.m_cSelect);
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

