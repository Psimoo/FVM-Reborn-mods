package com.aurora.protocol.friend
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2673 implements CMessageBody
   {
      
      public var m_iRoomID:int;
      
      public var m_iTableID:int;
      
      public var m_iSrcPlayer:int;
      
      public var m_iSrcUin:int;
      
      public var m_szMessage:String;
      
      public function a_2673()
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
         this.m_iTableID = a_2664.decode_int32(byte_array);
         this.m_iSrcPlayer = a_2664.decode_int32(byte_array);
         this.m_iSrcUin = a_2664.decode_int32(byte_array);
         this.m_szMessage = a_2664.decode_string(byte_array,1024);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

