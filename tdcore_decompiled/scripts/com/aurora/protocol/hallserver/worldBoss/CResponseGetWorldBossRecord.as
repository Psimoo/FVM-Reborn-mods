package com.aurora.protocol.hallserver.worldBoss
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseGetWorldBossRecord implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_cTopCrossRank:int;
      
      public var m_cTopGroupRank:int;
      
      public var m_cTopCrossConsRank:int;
      
      public var m_cTopGroupConsRank:int;
      
      public var m_sConsName:String;
      
      public var m_iSeasonCount:int;
      
      public var m_iBattleCount:int;
      
      public var m_iWin:int;
      
      public var m_iLose:int;
      
      public var m_iBossID:int;
      
      public var m_iBossHP:int;
      
      public var m_aryLenvelRecord:Array;
      
      public function CResponseGetWorldBossRecord()
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
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_cTopCrossRank = a_2664.decode_uint8(byte_array);
         this.m_cTopGroupRank = a_2664.decode_uint8(byte_array);
         this.m_cTopCrossConsRank = a_2664.decode_uint8(byte_array);
         this.m_cTopGroupConsRank = a_2664.decode_uint8(byte_array);
         this.m_sConsName = a_2664.decode_string(byte_array,64);
         this.m_iSeasonCount = a_2664.decode_int32(byte_array);
         this.m_iBattleCount = a_2664.decode_int32(byte_array);
         this.m_iWin = a_2664.decode_int32(byte_array);
         this.m_iLose = a_2664.decode_int32(byte_array);
         this.m_iBossID = a_2664.decode_int32(byte_array);
         this.m_iBossHP = a_2664.decode_int32(byte_array);
         this.m_aryLenvelRecord = [];
         var len:int = 32;
         for(var i:int = 0; i < len; i++)
         {
            this.m_aryLenvelRecord[i] = a_2664.decode_int16(byte_array);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

