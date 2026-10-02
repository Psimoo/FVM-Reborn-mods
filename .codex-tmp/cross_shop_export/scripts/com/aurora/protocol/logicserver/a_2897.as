package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2897 implements CMessageBody
   {
      
      public var m_iCardID:int;
      
      public var m_iCardSeq:int;
      
      public var m_nCardCount:int;
      
      public var m_nCardUsedCount:int;
      
      public var m_nCardPosition:int;
      
      public var m_iExpiredTime:int;
      
      public var m_iDeltaTime:int;
      
      public var m_iUsedTime:int;
      
      public var m_cIsBind:int;
      
      public function a_2897()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iCardID","int32"],["m_iCardSeq","int32"],["m_nCardCount","int16"],["m_nCardUsedCount","int16"],["m_nCardPosition","int16"],["m_iExpiredTime","int32"],["m_iUsedTime","int32"],["m_iDeltaTime","int32"],["m_cIsBind","int8"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var body_size:int = a_2664.decode_int16(byte_array);
         this.m_iCardID = a_2664.decode_int32(byte_array);
         this.m_iCardSeq = a_2664.decode_int32(byte_array);
         this.m_nCardCount = a_2664.decode_int16(byte_array);
         this.m_nCardUsedCount = a_2664.decode_int16(byte_array);
         this.m_nCardPosition = a_2664.decode_int16(byte_array);
         this.m_iExpiredTime = a_2664.decode_int32(byte_array);
         this.m_iUsedTime = a_2664.decode_int32(byte_array);
         this.m_iDeltaTime = a_2664.decode_int32(byte_array);
         this.m_cIsBind = a_2664.decode_int8(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

