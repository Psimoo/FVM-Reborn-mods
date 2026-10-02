package com.aurora.protocol.hallserver.worldBoss
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CCSRequestCheckWorldBossPlayerInfo implements CMessageBody
   {
      
      public var m_cPlatform:int;
      
      public var m_nGroup:int;
      
      public var m_iTargetUin:int;
      
      public function CCSRequestCheckWorldBossPlayerInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int8(byte_array,this.m_cPlatform);
         a_2664.encode_int16(byte_array,this.m_nGroup);
         a_2664.encode_int32(byte_array,this.m_iTargetUin);
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

