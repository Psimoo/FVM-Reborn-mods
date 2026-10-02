package com.aurora.protocol.hallserver.newmargintree
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class SendFlowerRecord implements CMessageBody
   {
      
      public var m_iTimestamp:int;
      
      public var m_szName:String;
      
      public var m_iCharmGet:int;
      
      public function SendFlowerRecord()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iTimestamp = a_2664.decode_int32(byte_array);
         this.m_szName = a_2664.decode_string(byte_array,32);
         this.m_iCharmGet = a_2664.decode_int32(byte_array);
         return false;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

