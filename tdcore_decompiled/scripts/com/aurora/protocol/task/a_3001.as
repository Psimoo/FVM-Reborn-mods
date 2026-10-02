package com.aurora.protocol.task
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_3001 implements CMessageBody
   {
      
      public var m_iTaskID:int;
      
      public var m_iTaskStatus:int;
      
      public var m_iAcceptDate:int;
      
      public var m_iAccomplishedDate:int;
      
      public var m_iUserDef1:int;
      
      public function a_3001()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int16(byte_array,0);
         a_2664.encode_int32(byte_array,this.m_iTaskID);
         a_2664.encode_int32(byte_array,this.m_iTaskStatus);
         a_2664.encode_int32(byte_array,this.m_iAcceptDate);
         a_2664.encode_int32(byte_array,this.m_iAccomplishedDate);
         a_2664.encode_int32(byte_array,this.m_iUserDef1);
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var size:int = a_2664.decode_int16(byte_array);
         this.m_iTaskID = a_2664.decode_int32(byte_array);
         this.m_iTaskStatus = a_2664.decode_int32(byte_array);
         this.m_iAcceptDate = a_2664.decode_int32(byte_array);
         this.m_iAccomplishedDate = a_2664.decode_int32(byte_array);
         this.m_iUserDef1 = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

