package com.aurora.protocol.hallserver.limitstore
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseExploreDiaryInfo implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_nCompleteIsland:int;
      
      public var m_iUin:int;
      
      public var m_iAward:int;
      
      public var m_iRecordCount:int;
      
      public var m_astAdvBattleRecord:Array;
      
      public function CResponseExploreDiaryInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var i:int = 0;
         var stAch:DiaryBattleRecord = null;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_nCompleteIsland = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iAward = a_2664.decode_int32(byte_array);
         this.m_iRecordCount = a_2664.decode_int16(byte_array);
         this.m_astAdvBattleRecord = [];
         if(this.m_nResultID == 0)
         {
            for(i = 0; i < this.m_iRecordCount; i++)
            {
               stAch = new DiaryBattleRecord();
               stAch.decode(byte_array,decode_length);
               this.m_astAdvBattleRecord.push(stAch);
            }
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

