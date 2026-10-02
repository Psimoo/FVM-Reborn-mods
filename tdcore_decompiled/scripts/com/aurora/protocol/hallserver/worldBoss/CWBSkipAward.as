package com.aurora.protocol.hallserver.worldBoss
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CWBSkipAward implements CMessageBody
   {
      
      public var size:int;
      
      public var cardIDAry:Array;
      
      public var countAry:Array;
      
      public function CWBSkipAward()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.size = a_2664.decode_int16(byte_array);
         this.cardIDAry = [];
         this.countAry = [];
         var i:int = 0;
         for(i = 0; i < this.size; i++)
         {
            this.cardIDAry[i] = a_2664.decode_int32(byte_array);
            this.countAry[i] = a_2664.decode_int16(byte_array);
         }
         return false;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

