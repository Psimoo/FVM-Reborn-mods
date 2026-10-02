package com.aurora.protocol.common
{
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class a_2667 implements CMessageBody
   {
      
      public var httpHead:int = 0;
      
      public var nPackageLength:int;
      
      public var nUIN:int;
      
      public var shFlag:int;
      
      public var shOptionalLen:int;
      
      public var lpbyOptional:ByteArray;
      
      public var shHeaderLen:int;
      
      public var shMessageID:int;
      
      public var shMessageType:int;
      
      public var shVersion:int;
      
      public var nPlayerID:int;
      
      public var nSequence:int;
      
      public function a_2667()
      {
         super();
      }
      
      public static function size() : uint
      {
         return 28;
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["httpHead","int8"],["nPackageLength","int32"],["nUIN","int32"],["shFlag","int16"],["shOptionalLen","int16"],["lpbyOptional","memory",128],["shHeaderLen","int16"],["shMessageID","int16"],["shMessageType","int16"],["shVersion","int16"],["nPlayerID","int32"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["nPackageLength","int32"],["nUIN","int32"],["shFlag","int16"],["shOptionalLen","int16"],["lpbyOptional","memory",128],["shHeaderLen","int16"],["shMessageID","int16"],["shMessageType","int16"],["shVersion","int16"],["nPlayerID","int32"]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return true;
      }
   }
}

