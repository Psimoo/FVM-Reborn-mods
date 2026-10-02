package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseGetPlayerRechargeActivityInfo implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iSystemTimeStamp:int;
      
      public var m_iAccPay:int;
      
      public var m_iCurrAccPay:int;
      
      public var m_iFlagAccumulate:int;
      
      public var m_iFlagFirst:int;
      
      public var m_iHolidayAccumulatePay:int;
      
      public var m_iHolidayMask:int;
      
      public var m_iHolidaySingleCnt:int;
      
      public var m_vHolidaySingleReceieveNum:Vector.<int>;
      
      public function CResponseGetPlayerRechargeActivityInfo()
      {
         super();
         this.m_vHolidaySingleReceieveNum = new Vector.<int>();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var i:int = 0;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         var propertyArray:Array = [];
         this.m_vHolidaySingleReceieveNum.length = 0;
         if(0 == this.m_nResultID)
         {
            this.m_iUin = a_2664.decode_int32(byte_array);
            this.m_iSystemTimeStamp = a_2664.decode_int32(byte_array);
            this.m_iAccPay = a_2664.decode_int32(byte_array);
            this.m_iCurrAccPay = a_2664.decode_int32(byte_array);
            this.m_iFlagAccumulate = a_2664.decode_int32(byte_array);
            this.m_iFlagFirst = a_2664.decode_int32(byte_array);
            this.m_iHolidayAccumulatePay = a_2664.decode_int32(byte_array);
            this.m_iHolidayMask = a_2664.decode_int32(byte_array);
            this.m_iHolidaySingleCnt = a_2664.decode_int32(byte_array);
            for(i = 0; i < this.m_iHolidaySingleCnt; i++)
            {
               this.m_vHolidaySingleReceieveNum.push(a_2664.decode_int32(byte_array));
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

