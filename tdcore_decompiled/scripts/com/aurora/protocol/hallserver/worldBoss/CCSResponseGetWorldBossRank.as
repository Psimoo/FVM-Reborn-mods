package com.aurora.protocol.hallserver.worldBoss
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CCSResponseGetWorldBossRank implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_cType:int;
      
      public var m_cNum:int;
      
      public var m_astPlayerWBRank:Array;
      
      public var m_cConsNum:int;
      
      public var m_astConsWBRank:Array;
      
      public function CCSResponseGetWorldBossRank()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var data:CWBRankInfo = null;
         var unionRankInfo:CWBRankConsInfo = null;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_cType = a_2664.decode_int8(byte_array);
         this.m_cNum = a_2664.decode_uint8(byte_array);
         var i:int = 0;
         this.m_astPlayerWBRank = [];
         for(i = 0; i < this.m_cNum; i++)
         {
            data = new CWBRankInfo();
            data.decode(byte_array,decode_length);
            this.m_astPlayerWBRank.push(data);
         }
         this.m_cConsNum = a_2664.decode_uint8(byte_array);
         this.m_astConsWBRank = [];
         for(i = 0; i < this.m_cConsNum; i++)
         {
            unionRankInfo = new CWBRankConsInfo();
            unionRankInfo.decode(byte_array,decode_length);
            this.m_astConsWBRank[i] = unionRankInfo;
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

