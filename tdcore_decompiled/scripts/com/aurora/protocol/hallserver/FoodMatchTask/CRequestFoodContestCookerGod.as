package com.aurora.protocol.hallserver.FoodMatchTask
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CRequestFoodContestCookerGod implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_iType:int;
      
      public var m_iPrice:int;
      
      public var m_iEndTime:int;
      
      public function CRequestFoodContestCookerGod()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iUin);
         a_2664.encode_int32(byte_array,this.m_iType);
         a_2664.encode_int32(byte_array,this.m_iPrice);
         a_2664.encode_int32(byte_array,this.m_iEndTime);
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

