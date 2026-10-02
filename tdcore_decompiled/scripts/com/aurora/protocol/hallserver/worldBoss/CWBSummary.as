package com.aurora.protocol.hallserver.worldBoss
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CWBSummary implements CMessageBody
   {
      
      public var m_nSeasonID:int;
      
      public var m_cCrossRank:int;
      
      public var m_cGroupRank:int;
      
      public var m_cConsRank:int;
      
      public var m_iBattleCount:int;
      
      public var m_iRecordTime:int;
      
      public var m_iBossHP:int;
      
      public var m_cLevel:int;
      
      public var m_cgrade:int;
      
      public var m_cLevelChange:int;
      
      public function CWBSummary()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_nSeasonID = a_2664.decode_int16(byte_array);
         this.m_cCrossRank = a_2664.decode_uint8(byte_array);
         this.m_cGroupRank = a_2664.decode_uint8(byte_array);
         this.m_cConsRank = a_2664.decode_uint8(byte_array);
         this.m_iBattleCount = a_2664.decode_int32(byte_array);
         this.m_iRecordTime = a_2664.decode_int32(byte_array);
         this.m_iBossHP = a_2664.decode_int32(byte_array);
         this.m_cLevel = a_2664.decode_int8(byte_array);
         this.m_cgrade = a_2664.decode_int8(byte_array);
         this.m_cLevelChange = a_2664.decode_int8(byte_array);
         return false;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

