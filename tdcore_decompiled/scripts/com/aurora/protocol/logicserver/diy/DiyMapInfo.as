package com.aurora.protocol.logicserver.diy
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class DiyMapInfo implements CMessageBody
   {
      
      public var m_iMapID:int;
      
      public var m_iResult:int;
      
      public var m_iVersion:int;
      
      public var m_iLastChallengeTime:int;
      
      public var m_iSupport:int;
      
      public var m_iLastPassTime:int;
      
      public function DiyMapInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iMapID = a_2664.decode_int32(byte_array);
         this.m_iResult = a_2664.decode_int32(byte_array);
         this.m_iVersion = a_2664.decode_int32(byte_array);
         this.m_iLastChallengeTime = a_2664.decode_int32(byte_array);
         this.m_iSupport = a_2664.decode_int16(byte_array);
         this.m_iLastPassTime = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

