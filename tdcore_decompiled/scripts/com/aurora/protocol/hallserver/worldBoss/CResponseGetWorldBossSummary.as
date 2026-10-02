package com.aurora.protocol.hallserver.worldBoss
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseGetWorldBossSummary implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_cSeasonCount:int;
      
      public var m_aryWBSummary:Array;
      
      public function CResponseGetWorldBossSummary()
      {
         super();
         this.m_aryWBSummary = [];
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var wbSummary:CWBSummary = null;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_cSeasonCount = a_2664.decode_int8(byte_array);
         for(var i:int = 0; i < this.m_cSeasonCount; i++)
         {
            wbSummary = new CWBSummary();
            wbSummary.decode(byte_array,0);
            this.m_aryWBSummary[i] = wbSummary;
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

