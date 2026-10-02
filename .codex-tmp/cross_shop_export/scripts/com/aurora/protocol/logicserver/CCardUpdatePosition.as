package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CCardUpdatePosition implements CMessageBody
   {
      
      public var m_iCardID:int;
      
      public var m_iCardSeq:int;
      
      public var m_nCardPostion:int;
      
      public function CCardUpdatePosition()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iCardID","int32"],["m_iCardSeq","int32"],["m_nCardPostion","int16"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iCardID","int32"],["m_iCardSeq","int32"],["m_nCardPostion","int16"]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

