package com.aurora.protocol.hallserver.crystal
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CCSRequestCrystoneUpgrade implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_iCrystoneID:int;
      
      public var m_iSeq:int;
      
      public var m_iSafe:int;
      
      public function CCSRequestCrystoneUpgrade()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_iUin);
         a_2664.encode_int32(byte_array,this.m_iCrystoneID);
         a_2664.encode_int32(byte_array,this.m_iSeq);
         a_2664.encode_int8(byte_array,this.m_iSafe);
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         return false;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

