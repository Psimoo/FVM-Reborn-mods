package com.aurora.protocol.task
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2994 implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_stSaveTask:a_3001;
      
      public function a_2994()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iUin);
         this.m_stSaveTask.encode(byte_array,encode_length);
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_stSaveTask = new a_3001();
         this.m_stSaveTask.decode(byte_array,decode_length);
         return false;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

