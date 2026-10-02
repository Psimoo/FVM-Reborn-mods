package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CCardUpdateInfo implements CMessageBody
   {
      
      public var m_iCardID:int;
      
      public var m_iCardSeq:int;
      
      public var m_nCardCount:int;
      
      public var m_nCardUsedCount:int;
      
      public var m_cTimeFlag:int;
      
      public var m_iExpiredTime:int;
      
      public var m_cIsBind:int;
      
      public var m_nUpdateMode:int;
      
      public function CCardUpdateInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iCardID","int32"],["m_iCardSeq","int32"],["m_nCardCount","int16"],["m_nCardUsedCount","int16"],["m_cTimeFlag","int8"],["m_iExpiredTime","int32"],["m_cIsBind","int8"],["m_nUpdateMode","int8"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iCardID","int32"],["m_iCardSeq","int32"],["m_nCardCount","int16"],["m_nCardUsedCount","int16"],["m_cTimeFlag","int8"],["m_iExpiredTime","int32"],["m_cIsBind","int8"],["m_nUpdateMode","int8"]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

