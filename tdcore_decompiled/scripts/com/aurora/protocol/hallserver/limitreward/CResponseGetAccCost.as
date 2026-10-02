package com.aurora.protocol.hallserver.limitreward
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseGetAccCost implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iAccCost:int;
      
      public var m_iAccCostAwardPage:int;
      
      public var m_iAccCostAwardFlag:uint;
      
      public var m_iLastCostTime:int;
      
      public function CResponseGetAccCost()
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
         this.m_iAccCost = a_2664.decode_int32(byte_array);
         this.m_iAccCostAwardPage = a_2664.decode_int16(byte_array);
         this.m_iAccCostAwardFlag = a_2664.decode_uint16(byte_array);
         this.m_iLastCostTime = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function getCurWaveId() : int
      {
         return this.m_iAccCostAwardPage + 1;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

