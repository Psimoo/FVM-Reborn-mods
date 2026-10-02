package com.aurora.protocol.hallserver.vow
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2890 implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_nLevel:int;
      
      public var m_nCount:int;
      
      public var m_iBoxID:int;
      
      public var m_iSymbol:int;
      
      public var m_iItemID:int;
      
      public function a_2890()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iUin);
         a_2664.encode_int16(byte_array,this.m_nLevel);
         a_2664.encode_int16(byte_array,this.m_nCount);
         a_2664.encode_int32(byte_array,this.m_iBoxID);
         a_2664.encode_int32(byte_array,this.m_iSymbol);
         a_2664.encode_int32(byte_array,this.m_iItemID);
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

