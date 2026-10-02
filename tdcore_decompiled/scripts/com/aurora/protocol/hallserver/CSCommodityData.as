package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CSCommodityData implements CMessageBody
   {
      
      public var m_iID:int;
      
      public var m_shCount:int;
      
      public var m_cBuyType:int;
      
      public var m_iExpiryDate:int;
      
      public var m_iUsedCount:int;
      
      public var m_iCurrencytype:int;
      
      public function CSCommodityData()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [];
         propertyArray.push(["m_iID","int32"]);
         propertyArray.push(["m_shCount","int16"]);
         propertyArray.push(["m_cBuyType","int8"]);
         propertyArray.push(["m_iExpiryDate","int32"]);
         propertyArray.push(["m_iUsedCount","int32"]);
         propertyArray.push(["m_iCurrencytype","int32"]);
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [];
         propertyArray.push(["m_iID","int32"]);
         propertyArray.push(["m_shCount","int16"]);
         propertyArray.push(["m_cBuyType","int8"]);
         propertyArray.push(["m_iExpiryDate","int32"]);
         propertyArray.push(["m_iUsedCount","int32"]);
         propertyArray.push(["m_iCurrencytype","int32"]);
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

