package com.aurora.protocol.mail
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class UpdateMailInfo implements CMessageBody
   {
      
      public var m_iMailID:int;
      
      public var m_iSrcUin:int;
      
      public var m_iDstUin:int;
      
      public var m_cUpdateFlag:int;
      
      public var m_cProcessType:int;
      
      public function UpdateMailInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iMailID","int32"],["m_iSrcUin","int32"],["m_iDstUin","int32"],["m_cUpdateFlag","int8"],["m_cProcessType","int8"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iMailID","int32"],["m_iSrcUin","int32"],["m_iDstUin","int32"],["m_cUpdateFlag","int8"],["m_cProcessType","int8"]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

