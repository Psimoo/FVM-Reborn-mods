package com.aurora.protocol.match
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2975 implements CMessageBody
   {
      
      public var m_iGameEventSequence:int;
      
      public var m_iGameDataLength:int;
      
      public var m_szGameData:ByteArray;
      
      public var m_iRoomID:int;
      
      public function a_2975()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iGameEventSequence = a_2664.decode_int32(byte_array);
         this.m_iGameDataLength = a_2664.decode_int16(byte_array);
         this.m_szGameData = new ByteArray();
         a_2664.decode_memory(byte_array,this.m_szGameData,this.m_iGameDataLength);
         this.m_iRoomID = a_2664.decode_int32(byte_array);
         trace("CNotifyGameLobbyData.m_iRoomID=" + this.m_iRoomID);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

