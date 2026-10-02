package com.aurora.protocol.friend
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2672 implements CMessageBody
   {
      
      public var m_iUIN:int;
      
      public var m_szAccount:String;
      
      public var m_szNick:String;
      
      public var m_cGender:int;
      
      public function a_2672()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iUIN","int32"],["m_szAccount","string",32],["m_szNick","string",64],["m_cGender","int8"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iUIN","int32"],["m_szAccount","string",32],["m_szNick","string",64],["m_cGender","int8"]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

