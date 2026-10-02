package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseBuyMiShiUsdNum implements CMessageBody
   {
      
      public var m_iResult:int;
      
      public var m_iUin:int;
      
      public var m_iCurrentMoney:int;
      
      public var m_iDeltaMoney:int;
      
      public var m_iInstanceCount:int;
      
      public var m_iInstanceType:int;
      
      public var m_iReasonMessage:String;
      
      public function CResponseBuyMiShiUsdNum()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iResult = a_2664.decode_int16(byte_array);
         if(0 == this.m_iResult)
         {
            this.m_iUin = a_2664.decode_int32(byte_array);
            this.m_iCurrentMoney = a_2664.decode_int32(byte_array);
            this.m_iDeltaMoney = a_2664.decode_int32(byte_array);
            this.m_iInstanceCount = a_2664.decode_int32(byte_array);
            this.m_iInstanceType = a_2664.decode_int8(byte_array);
         }
         else
         {
            this.m_iReasonMessage = a_2664.decode_string(byte_array,2048);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

