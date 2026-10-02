package com.aurora.protocol.hallserver.mail
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseUpdatePlayerMailList implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_iGroupID:int;
      
      public var m_iResultID:int;
      
      public var m_iUnRead:int;
      
      public function CResponseUpdatePlayerMailList()
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
         this.m_iGroupID = a_2664.decode_int32(byte_array);
         this.m_iResultID = a_2664.decode_int32(byte_array);
         this.m_iUnRead = a_2664.decode_int32(byte_array);
         return false;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

