package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CCardExtraAttr implements CMessageBody
   {
      
      public var m_cAttrType:int;
      
      public var m_iAttrAdd:int;
      
      public var m_nAttrUsedCount:int;
      
      public var m_iExpiredTime:int;
      
      public function CCardExtraAttr()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_cAttrType","int8"],["m_iAttrAdd","int32"],["m_nAttrUsedCount","int16"],["m_iExpiredTime","int32"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var body_size:int = a_2664.decode_int16(byte_array);
         this.m_cAttrType = a_2664.decode_int8(byte_array);
         this.m_iAttrAdd = a_2664.decode_int32(byte_array);
         this.m_nAttrUsedCount = a_2664.decode_int16(byte_array);
         this.m_iExpiredTime = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

