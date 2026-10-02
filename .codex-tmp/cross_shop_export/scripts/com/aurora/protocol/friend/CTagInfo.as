package com.aurora.protocol.friend
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CTagInfo implements CMessageBody
   {
      
      public var m_iTagID:int;
      
      public var m_szTagName:String;
      
      public var m_iTimestamp:int;
      
      public function CTagInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var size:int = a_2664.decode_int16(byte_array);
         this.m_iTagID = a_2664.decode_int32(byte_array);
         this.m_szTagName = a_2664.decode_string(byte_array,32);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

