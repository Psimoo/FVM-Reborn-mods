package com.aurora.protocol.logicserver.crossserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class TableStatusInfo implements CMessageBody
   {
      
      public var m_iTableID:int;
      
      public var m_iGameState:int;
      
      public var m_iTeamState:int;
      
      public function TableStatusInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iTableID = a_2664.decode_int32(byte_array);
         this.m_iGameState = a_2664.decode_int8(byte_array);
         this.m_iTeamState = a_2664.decode_int8(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

