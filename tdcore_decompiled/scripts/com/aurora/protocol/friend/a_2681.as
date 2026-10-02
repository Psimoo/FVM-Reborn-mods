package com.aurora.protocol.friend
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2681 implements CMessageBody
   {
      
      public var m_iRoomID:int;
      
      public var m_iDstPlayerID:int;
      
      public var m_iDstUin:int;
      
      public var m_szMessage:String;
      
      public function a_2681()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iRoomID);
         a_2664.encode_int32(byte_array,this.m_iDstPlayerID);
         a_2664.encode_int32(byte_array,this.m_iDstUin);
         a_2664.encode_string(byte_array,this.m_szMessage,1024);
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

