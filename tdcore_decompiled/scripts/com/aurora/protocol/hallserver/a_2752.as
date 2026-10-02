package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2752 implements CMessageBody
   {
      
      public var a_1233:int;
      
      public var m_iCumulativeOffLine:int;
      
      public var m_iTimestamp:int;
      
      public function a_2752()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.a_1233 = a_2664.decode_int32(byte_array);
         this.m_iCumulativeOffLine = a_2664.decode_int32(byte_array);
         this.m_iTimestamp = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

