package com.aurora.protocol.authen
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2660 implements CMessageBody
   {
      
      public var m_szAccount:String;
      
      public var m_szPassword:String;
      
      public var m_szNickName:String;
      
      public var m_bySex:uint;
      
      public var m_szEmail:String;
      
      public function a_2660()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_szAccount","string",32],["m_szPassword","string",32],["m_szNickName","string",32],["m_bySex","int8"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_szAccount","string",32],["m_szPassword","string",32],["m_szNickName","string",32],["m_bySex","int8"]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

