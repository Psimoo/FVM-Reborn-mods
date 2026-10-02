package com.aurora.protocol.hallserver.newmargintree
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CCSResponseSendFlowers implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iUin:int;
      
      public var m_iDstUin:int;
      
      public var m_iFreeFlowerTimes:int;
      
      public var m_iSendFlowerTimes:int;
      
      public var m_iCoinFlowerTimes:int;
      
      public var m_iActuallyCharmChg:int;
      
      public var m_iActuallySenderCharmChg:int;
      
      public var m_iSelfCharm:int;
      
      public var m_iDstCharm:int;
      
      public function CCSResponseSendFlowers()
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
         this.m_iDstUin = a_2664.decode_int32(byte_array);
         this.m_iFreeFlowerTimes = a_2664.decode_int8(byte_array);
         this.m_iSendFlowerTimes = a_2664.decode_int8(byte_array);
         this.m_iCoinFlowerTimes = a_2664.decode_int8(byte_array);
         this.m_iActuallyCharmChg = a_2664.decode_int32(byte_array);
         this.m_iActuallySenderCharmChg = a_2664.decode_int32(byte_array);
         this.m_iSelfCharm = a_2664.decode_int32(byte_array);
         this.m_iDstCharm = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

