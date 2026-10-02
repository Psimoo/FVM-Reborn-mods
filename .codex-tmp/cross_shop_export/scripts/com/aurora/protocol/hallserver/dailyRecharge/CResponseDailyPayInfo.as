package com.aurora.protocol.hallserver.dailyRecharge
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseDailyPayInfo implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iDailyAcc:int;
      
      public var m_iRefreshTimestamp:int;
      
      public var m_iFlag:int;
      
      public function CResponseDailyPayInfo()
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
         this.m_iDailyAcc = a_2664.decode_int32(byte_array);
         this.m_iRefreshTimestamp = a_2664.decode_int32(byte_array);
         this.m_iFlag = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

