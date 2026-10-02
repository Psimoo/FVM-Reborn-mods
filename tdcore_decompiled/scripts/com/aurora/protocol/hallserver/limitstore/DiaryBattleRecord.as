package com.aurora.protocol.hallserver.limitstore
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class DiaryBattleRecord implements CMessageBody
   {
      
      public var m_iMapID:int;
      
      public var m_cBestGrade:int;
      
      public var m_iBestScore:int;
      
      public var m_iBestScoreUsedTime:int;
      
      public var m_iBestScoreDestroyFromMouse:int;
      
      public function DiaryBattleRecord()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iMapID = a_2664.decode_int16(byte_array);
         this.m_cBestGrade = a_2664.decode_int8(byte_array);
         this.m_iBestScore = a_2664.decode_int16(byte_array);
         this.m_iBestScoreUsedTime = a_2664.decode_int16(byte_array);
         this.m_iBestScoreDestroyFromMouse = a_2664.decode_int16(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

