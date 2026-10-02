package com.aurora.protocol.common
{
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class a_2670 implements CMessageBody
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
      
      public function a_2670()
      {
         super();
      }
      
      public static function size() : uint
      {
         return 28;
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int8(byte_array,this.httpHead);
         a_2664.encode_int32(byte_array,this.nPackageLength);
         a_2664.encode_int32(byte_array,this.nUIN);
         a_2664.encode_int16(byte_array,this.shFlag);
         a_2664.encode_int16(byte_array,this.shOptionalLen);
         a_2664.encode_memory(byte_array,this.lpbyOptional,128);
         a_2664.encode_int16(byte_array,this.shHeaderLen);
         a_2664.encode_int16(byte_array,this.shMessageID);
         a_2664.encode_int16(byte_array,this.shMessageType);
         a_2664.encode_int16(byte_array,this.shVersion);
         a_2664.encode_int32(byte_array,this.nPlayerID);
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.nPackageLength = a_2664.decode_int32(byte_array);
         this.nUIN = a_2664.decode_int32(byte_array);
         this.shFlag = a_2664.decode_int16(byte_array);
         this.shOptionalLen = a_2664.decode_int16(byte_array);
         this.lpbyOptional = new ByteArray();
         a_2664.decode_memory(byte_array,this.lpbyOptional,this.shOptionalLen);
         this.shHeaderLen = a_2664.decode_int16(byte_array);
         this.shMessageID = a_2664.decode_int16(byte_array);
         this.shMessageType = a_2664.decode_int16(byte_array);
         this.shVersion = a_2664.decode_int16(byte_array);
         this.nPlayerID = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return true;
      }
   }
}

