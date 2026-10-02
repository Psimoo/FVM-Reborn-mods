package com.aurora.protocol.hallserver.auction
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CRequestCancelTradeItem implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_iGroupID:int;
      
      public var m_iTradeIDHigh:int;
      
      public var m_iTradeIDLow:int;
      
      public function CRequestCancelTradeItem()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iUin);
         a_2664.encode_int32(byte_array,this.m_iGroupID);
         a_2664.encode_int32(byte_array,this.m_iTradeIDHigh);
         a_2664.encode_int32(byte_array,this.m_iTradeIDLow);
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

