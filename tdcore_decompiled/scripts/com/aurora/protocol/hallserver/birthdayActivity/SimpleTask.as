package com.aurora.protocol.hallserver.birthdayActivity
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class SimpleTask implements CMessageBody
   {
      
      public var m_iTaskID:int;
      
      public var m_iFlag:int;
      
      public function SimpleTask()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iTaskID = a_2664.decode_int32(byte_array);
         this.m_iFlag = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

