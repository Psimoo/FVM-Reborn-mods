package com.aurora.protocol.hallserver.FoodMatchTask
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseFoodBuyExp implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iExp:int;
      
      public var m_iPrice:int;
      
      public var m_iAwardCount:int;
      
      public var m_stAwardList:Array;
      
      public function CResponseFoodBuyExp()
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
         this.m_iExp = a_2664.decode_int32(byte_array);
         this.m_iPrice = a_2664.decode_int32(byte_array);
         this.m_iAwardCount = a_2664.decode_int32(byte_array);
         this.m_stAwardList = [];
         for(var j:int = 0; j < this.m_iAwardCount; j++)
         {
            obj = new Object();
            obj.m_iID = a_2664.decode_int32(byte_array);
            obj.m_iAwardType = a_2664.decode_int32(byte_array);
            obj.m_iAwardStatus = a_2664.decode_int32(byte_array);
            obj.m_iExp = a_2664.decode_int32(byte_array);
            obj.m_iItemID = a_2664.decode_int32(byte_array);
            obj.m_iCount = a_2664.decode_int32(byte_array);
            obj.m_iEndTime = a_2664.decode_int32(byte_array);
            this.m_stAwardList.push(obj);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

