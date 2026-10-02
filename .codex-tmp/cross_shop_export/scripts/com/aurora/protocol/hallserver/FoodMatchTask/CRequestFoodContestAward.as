package com.aurora.protocol.hallserver.FoodMatchTask
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CRequestFoodContestAward implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_iType:int;
      
      public var m_iExp:int;
      
      public var m_iItemID:int;
      
      public var m_iID:int;
      
      public var m_iUniqueID:int;
      
      public var m_iAddExp:int;
      
      public function CRequestFoodContestAward()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iUin);
         a_2664.encode_int32(byte_array,this.m_iType);
         a_2664.encode_int32(byte_array,this.m_iExp);
         a_2664.encode_int32(byte_array,this.m_iItemID);
         a_2664.encode_int32(byte_array,this.m_iID);
         a_2664.encode_int32(byte_array,this.m_iUniqueID);
         a_2664.encode_int32(byte_array,this.m_iAddExp);
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

