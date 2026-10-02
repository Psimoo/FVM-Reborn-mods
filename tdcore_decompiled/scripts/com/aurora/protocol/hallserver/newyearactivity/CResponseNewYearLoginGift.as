package com.aurora.protocol.hallserver.newyearactivity
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseNewYearLoginGift implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iBeginKey:int;
      
      public var m_iLoginGiftCount:int;
      
      public var m_arrLoginGift:Array;
      
      public var m_iLoginSumCount:int;
      
      public var m_arrLoginSum:Array;
      
      public function CResponseNewYearLoginGift()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var temp:int = 0;
         var tempa:int = 0;
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iBeginKey = a_2664.decode_int32(byte_array);
         this.m_iLoginGiftCount = a_2664.decode_int32(byte_array);
         this.m_arrLoginGift = [];
         for(var i:int = 0; i < this.m_iLoginGiftCount; i++)
         {
            temp = 0;
            temp = a_2664.decode_int32(byte_array);
            this.m_arrLoginGift.push(temp);
         }
         this.m_iLoginSumCount = a_2664.decode_int32(byte_array);
         this.m_arrLoginSum = [];
         for(i = 0; i < this.m_iLoginSumCount; i++)
         {
            tempa = 0;
            tempa = a_2664.decode_int32(byte_array);
            this.m_arrLoginSum.push(tempa);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

