package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2746 implements CMessageBody
   {
      
      public var m_iCardID:int;
      
      public var m_iSeq:int;
      
      public var m_iAttrType:int;
      
      public var m_iAttrAdd:int;
      
      public function a_2746()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iCardID = a_2664.decode_int32(byte_array);
         this.m_iSeq = a_2664.decode_int32(byte_array);
         this.m_iAttrType = a_2664.decode_int32(byte_array);
         this.m_iAttrAdd = a_2664.decode_int32(byte_array);
         return false;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

