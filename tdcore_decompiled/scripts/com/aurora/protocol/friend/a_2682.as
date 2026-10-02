package com.aurora.protocol.friend
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2682 implements CMessageBody
   {
      
      public var m_iRoomID:int;
      
      public var m_iTableID:int;
      
      public var m_szMessages:String;
      
      public function a_2682()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iRoomID);
         a_2664.encode_int32(byte_array,this.m_iTableID);
         a_2664.encode_string(byte_array,this.m_szMessages,1024);
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

