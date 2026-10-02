package com.aurora.protocol.hallserver.worldBoss
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CCSResponseCheckWorldBossPlayerInfo implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_cPlatform:int;
      
      public var m_nGroup:int;
      
      public var m_iUin:int;
      
      public var m_stPlayerInfo:CWBPlayerInfo;
      
      public function CCSResponseCheckWorldBossPlayerInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_cPlatform = a_2664.decode_int8(byte_array);
         this.m_nGroup = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_stPlayerInfo = new CWBPlayerInfo();
         this.m_stPlayerInfo.decode(byte_array,0);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

