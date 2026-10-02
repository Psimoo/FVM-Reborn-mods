package com.aurora.protocol.task
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2989 implements CMessageBody
   {
      
      public var itemID:int;
      
      public var uiDate:int;
      
      public var iUserCount:int;
      
      public var unCount:int;
      
      public var cIsBind:int;
      
      public function a_2989()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["itemID","int32"],["uiDate","int32"],["iUserCount","int32"],["unCount","int16"],["cIsBind","int8"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["itemID","int32"],["uiDate","int32"],["iUserCount","int32"],["unCount","int16"],["cIsBind","int8"]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

