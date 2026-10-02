package com.aurora.protocol.hallserver.worldBoss
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CCSRequestGetWorldBossMap implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_nBossID:int;
      
      public var m_cBuffID:int;
      
      public function CCSRequestGetWorldBossMap()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iUin);
         a_2664.encode_int16(byte_array,this.m_nBossID);
         a_2664.encode_int32(byte_array,this.m_cBuffID);
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

