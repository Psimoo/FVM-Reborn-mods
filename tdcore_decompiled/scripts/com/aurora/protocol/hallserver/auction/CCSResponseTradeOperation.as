package com.aurora.protocol.hallserver.auction
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CCSResponseTradeOperation implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_iOperateType:int;
      
      public var m_iResultID:int;
      
      public var m_iTradeIDHigh:int;
      
      public var m_iTradeIDLow:int;
      
      public var m_szReason:String;
      
      public function CCSResponseTradeOperation()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iOperateType = a_2664.decode_int32(byte_array);
         this.m_iResultID = a_2664.decode_int32(byte_array);
         this.m_iTradeIDHigh = a_2664.decode_int32(byte_array);
         this.m_iTradeIDLow = a_2664.decode_int32(byte_array);
         this.m_szReason = a_2664.decode_string(byte_array,128);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

