package com.aurora.protocol.hallserver.loverTask
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseGetProtectorInfo implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iLoveBuff:int;
      
      public var m_iLoveBuffTime:int;
      
      public var m_iLoveRate:int;
      
      public function CResponseGetProtectorInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iLoveBuff = a_2664.decode_int32(byte_array);
         this.m_iLoveBuffTime = a_2664.decode_int32(byte_array);
         this.m_iLoveRate = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

