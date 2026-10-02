package com.aurora.protocol.match
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2976 implements CMessageBody
   {
      
      public var m_iRoomID:int;
      
      public var m_nGameDataLength:int;
      
      public var m_szGameData:ByteArray;
      
      public function a_2976()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iRoomID);
         a_2664.encode_int16(byte_array,this.m_nGameDataLength);
         a_2664.encode_memory(byte_array,this.m_szGameData,8192);
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

