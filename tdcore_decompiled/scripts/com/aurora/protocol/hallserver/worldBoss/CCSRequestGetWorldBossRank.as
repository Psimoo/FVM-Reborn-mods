package com.aurora.protocol.hallserver.worldBoss
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CCSRequestGetWorldBossRank implements CMessageBody
   {
      
      public var m_cType:int;
      
      public var m_cPlatform:int;
      
      public var m_nGroupID:int;
      
      public var m_iTargetID:int;
      
      public var m_nSeason:int;
      
      public function CCSRequestGetWorldBossRank()
      {
         super();
         this.m_cPlatform = 0;
         this.m_nGroupID = 0;
         this.m_iTargetID = 0;
         this.m_nSeason = 0;
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int8(byte_array,this.m_cType);
         a_2664.encode_int8(byte_array,this.m_cPlatform);
         a_2664.encode_int16(byte_array,this.m_nGroupID);
         a_2664.encode_int32(byte_array,this.m_iTargetID);
         a_2664.encode_int16(byte_array,this.m_nSeason);
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

