package com.aurora.protocol.hallserver.monthcard
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseMonthCardShopInfo implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iCount:int;
      
      public var m_iBuyItemList:Array;
      
      public function CResponseMonthCardShopInfo()
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
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iCount = a_2664.decode_int16(byte_array);
         this.m_iBuyItemList = [];
         for(var i:int = 0; i < this.m_iCount; i++)
         {
            obj = {};
            obj.m_iID = a_2664.decode_int32(byte_array);
            obj.m_cBuyed = a_2664.decode_int8(byte_array);
            this.m_iBuyItemList.push(obj);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

