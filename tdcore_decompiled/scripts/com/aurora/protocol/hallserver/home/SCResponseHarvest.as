package com.aurora.protocol.hallserver.home
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class SCResponseHarvest implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iSrcUin:*;
      
      public var m_iOvenID:*;
      
      public var m_iProduceItemID:*;
      
      public var m_iProduceItemCount:*;
      
      public var m_iProduceAttrValue:int;
      
      public var m_szReasonMessage:String;
      
      public function SCResponseHarvest()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_nResultID = a_2664.decode_int16(byte_array);
         if(0 == this.m_nResultID)
         {
            this.m_iSrcUin = a_2664.decode_int32(byte_array);
            this.m_iOvenID = a_2664.decode_int32(byte_array);
            this.m_iProduceItemID = a_2664.decode_int32(byte_array);
            this.m_iProduceItemCount = a_2664.decode_int32(byte_array);
            this.m_iProduceAttrValue = a_2664.decode_int32(byte_array);
            return true;
         }
         this.m_szReasonMessage = a_2664.decode_string(byte_array,4096);
         return false;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

