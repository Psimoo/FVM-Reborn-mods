package com.aurora.protocol.hallserver.consortia
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2788 implements CMessageBody
   {
      
      public var m_iUIN:int;
      
      public var m_czName:String;
      
      public var m_szComment:String;
      
      public var m_iTimestamp:int;
      
      public var m_cFlag:int;
      
      public function a_2788()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var body_size:int = a_2664.decode_int16(byte_array);
         this.m_iUIN = a_2664.decode_int32(byte_array);
         this.m_czName = a_2664.decode_string(byte_array,32);
         this.m_szComment = a_2664.decode_string(byte_array,128);
         this.m_iTimestamp = a_2664.decode_int32(byte_array);
         this.m_cFlag = a_2664.decode_int8(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

