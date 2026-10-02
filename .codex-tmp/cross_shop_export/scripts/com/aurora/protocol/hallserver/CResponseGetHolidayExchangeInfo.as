package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class CResponseGetHolidayExchangeInfo
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iCount:int;
      
      public var m_stHolidayExchangeInfo:Array;
      
      public function CResponseGetHolidayExchangeInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var obj:Object = null;
         var m_iConfigID:int = 0;
         var m_iCounts:int = 0;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iCount = a_2664.decode_int16(byte_array);
         this.m_stHolidayExchangeInfo = [];
         for(var i:int = 0; i < this.m_iCount; i++)
         {
            obj = {};
            m_iConfigID = a_2664.decode_int32(byte_array);
            m_iCounts = a_2664.decode_int32(byte_array);
            obj.m_iConfigID = m_iConfigID;
            obj.m_iCount = m_iCounts;
            this.m_stHolidayExchangeInfo.push(obj);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

