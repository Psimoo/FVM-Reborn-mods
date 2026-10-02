package com.aurora.protocol.mail
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class MailExtraInfo implements CMessageBody
   {
      
      public var m_iItemID:int;
      
      public var m_nItemCount:int;
      
      public var m_iExpiredTime:int;
      
      public var m_nItemAttrLevel:int;
      
      public var m_iExtraExpiredTime:int;
      
      public function MailExtraInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iItemID","int32"],["m_nItemCount","int16"],["m_iExpiredTime","int32"],["m_nItemAttrLevel","int16"],["m_iExtraExpiredTime","int32"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iItemID","int32"],["m_nItemCount","int16"],["m_iExpiredTime","int32"],["m_nItemAttrLevel","int16"],["m_iExtraExpiredTime","int32"]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

