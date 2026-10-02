package com.aurora.protocol.hallserver.Message.stroeBox
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CUpdateBoxInfo implements CMessageBody
   {
      
      public var m_iCardID:int;
      
      public var m_iCardSeq:int;
      
      public var m_nCardPosition:int;
      
      public var m_nCardCount:int;
      
      public var m_cOpt:int;
      
      public function CUpdateBoxInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iCardID);
         a_2664.encode_int32(byte_array,this.m_iCardSeq);
         a_2664.encode_int16(byte_array,this.m_nCardPosition);
         a_2664.encode_int16(byte_array,this.m_nCardCount);
         a_2664.encode_int8(byte_array,this.m_cOpt);
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iCardID = a_2664.decode_int32(byte_array);
         this.m_iCardSeq = a_2664.decode_int32(byte_array);
         this.m_nCardCount = a_2664.decode_int16(byte_array);
         this.m_nCardPosition = a_2664.decode_int16(byte_array);
         this.m_cOpt = a_2664.decode_int8(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

