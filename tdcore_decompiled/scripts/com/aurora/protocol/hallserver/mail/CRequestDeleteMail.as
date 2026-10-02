package com.aurora.protocol.hallserver.mail
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CRequestDeleteMail implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_iGroupID:int;
      
      public var m_iMailIDHigh:int;
      
      public var m_iMailIDLow:int;
      
      public function CRequestDeleteMail()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iUin);
         a_2664.encode_int32(byte_array,this.m_iGroupID);
         a_2664.encode_int32(byte_array,this.m_iMailIDHigh);
         a_2664.encode_int32(byte_array,this.m_iMailIDLow);
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

