package com.aurora.protocol.hallserver.FoodMatchTask
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CRequestFoodBuyExp implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_iCurLevel:int;
      
      public var m_iTargetLevel:int;
      
      public var m_iAddExp:int;
      
      public var m_iPrice:int;
      
      public function CRequestFoodBuyExp()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iUin);
         a_2664.encode_int32(byte_array,this.m_iCurLevel);
         a_2664.encode_int32(byte_array,this.m_iTargetLevel);
         a_2664.encode_int32(byte_array,this.m_iAddExp);
         a_2664.encode_int32(byte_array,this.m_iPrice);
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

