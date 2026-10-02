package com.aurora.protocol.hallserver.compose
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CSRequestItemGemDecompose implements CMessageBody
   {
      
      public var m_iSrcUin:int;
      
      public var m_iItemID:int;
      
      public var m_iItemSeq:int;
      
      public function CSRequestItemGemDecompose()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iSrcUin);
         a_2664.encode_int32(byte_array,this.m_iItemID);
         a_2664.encode_int32(byte_array,this.m_iItemSeq);
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

