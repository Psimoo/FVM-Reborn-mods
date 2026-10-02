package com.aurora.protocol.common
{
   import com.aurora.protocol.a_2664;
   import flash.utils.ByteArray;
   
   public class a_2671 implements CMessageBody
   {
      
      public var nPackageLength:uint;
      
      public var shHeaderLength:uint;
      
      public var shMessageID:uint;
      
      public var nSequence:int;
      
      public var nFlag:int;
      
      public function a_2671()
      {
         super();
      }
      
      public static function size() : int
      {
         return 4 * 3 + 2 * 2 + 1;
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.nPackageLength);
         a_2664.encode_int16(byte_array,this.shHeaderLength);
         a_2664.encode_int16(byte_array,this.shMessageID);
         a_2664.encode_int32(byte_array,this.nSequence);
         a_2664.encode_int32(byte_array,this.nFlag);
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.nPackageLength = a_2664.decode_int32(byte_array);
         this.shHeaderLength = a_2664.decode_int16(byte_array);
         this.shMessageID = a_2664.decode_int16(byte_array);
         this.nSequence = a_2664.decode_int32(byte_array);
         this.nFlag = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return true;
      }
   }
}

