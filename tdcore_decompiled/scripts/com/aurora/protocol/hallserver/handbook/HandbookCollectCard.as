package com.aurora.protocol.hallserver.handbook
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class HandbookCollectCard implements CMessageBody
   {
      
      public var m_cType:int;
      
      public var m_cClassify:int;
      
      public var m_iID:int;
      
      public var m_cCollect:int;
      
      public var m_iCollectTime:int;
      
      public var m_cPoint:int;
      
      public function HandbookCollectCard()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_cType = a_2664.decode_int16(byte_array);
         this.m_cClassify = a_2664.decode_int16(byte_array);
         this.m_iID = a_2664.decode_int32(byte_array);
         this.m_cCollect = a_2664.decode_int8(byte_array);
         this.m_iCollectTime = a_2664.decode_int32(byte_array);
         this.m_cPoint = a_2664.decode_int8(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

