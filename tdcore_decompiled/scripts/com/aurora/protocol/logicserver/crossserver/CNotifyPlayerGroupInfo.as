package com.aurora.protocol.logicserver.crossserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CNotifyPlayerGroupInfo implements CMessageBody
   {
      
      public var m_iRoomID:int;
      
      public var m_iTableID:int;
      
      public var m_iSeatID:int;
      
      public var m_iPlatformID:int;
      
      public var m_iGroupID:int;
      
      public function CNotifyPlayerGroupInfo()
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
         this.m_iSeatID = a_2664.decode_int32(byte_array);
         this.m_iPlatformID = a_2664.decode_int32(byte_array);
         this.m_iGroupID = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

