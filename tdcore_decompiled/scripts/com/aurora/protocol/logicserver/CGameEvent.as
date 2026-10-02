package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CGameEvent implements CMessageBody
   {
      
      public var m_iGameEventSequence:int;
      
      public var m_iGameDataLength:int;
      
      public var m_szGameData:ByteArray;
      
      public function CGameEvent()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iGameEventSequence);
         a_2664.encode_int32(byte_array,this.m_iGameDataLength);
         a_2664.encode_memory(byte_array,this.m_szGameData,4096);
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iGameEventSequence = a_2664.decode_int32(byte_array);
         this.m_iGameDataLength = a_2664.decode_int32(byte_array);
         this.m_szGameData = new ByteArray();
         a_2664.decode_memory(byte_array,this.m_szGameData,this.m_iGameDataLength);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

