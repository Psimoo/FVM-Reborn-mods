package com.aurora.protocol.friend
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2674 implements CMessageBody
   {
      
      public var m_iRoomID:int;
      
      public var m_iPlayerID:int;
      
      public var m_iUin:int;
      
      public var m_iDstPlayerID:int;
      
      public var m_iDstUin:int;
      
      public var m_szMessage:String;
      
      public function a_2674()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iRoomID = a_2664.decode_int32(byte_array);
         this.m_iPlayerID = a_2664.decode_int32(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iDstPlayerID = a_2664.decode_int32(byte_array);
         this.m_iDstUin = a_2664.decode_int32(byte_array);
         this.m_szMessage = a_2664.decode_string(byte_array,1024);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

