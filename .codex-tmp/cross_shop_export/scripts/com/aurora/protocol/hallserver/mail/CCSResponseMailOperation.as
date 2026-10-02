package com.aurora.protocol.hallserver.mail
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CCSResponseMailOperation implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_iOperateType:int;
      
      public var m_iResultID:int;
      
      public var m_iMailIDHigh:int;
      
      public var m_iMailIDLow:int;
      
      public var m_szReason:String;
      
      public function CCSResponseMailOperation()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iOperateType = a_2664.decode_int32(byte_array);
         this.m_iResultID = a_2664.decode_int32(byte_array);
         this.m_iMailIDHigh = a_2664.decode_int32(byte_array);
         this.m_iMailIDLow = a_2664.decode_int32(byte_array);
         this.m_szReason = a_2664.decode_string(byte_array,128);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

