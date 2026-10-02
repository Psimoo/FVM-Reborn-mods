package com.aurora.protocol.hallserver.worldBoss
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CWBDividePlayerAward implements CMessageBody
   {
      
      public var m_iID:int;
      
      public var m_nCount:int;
      
      public var m_cFlag:int;
      
      public function CWBDividePlayerAward()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iID = a_2664.decode_int32(byte_array);
         this.m_nCount = a_2664.decode_int16(byte_array);
         this.m_cFlag = a_2664.decode_int8(byte_array);
         return false;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

