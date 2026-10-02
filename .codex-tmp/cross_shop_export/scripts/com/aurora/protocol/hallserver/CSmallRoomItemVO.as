package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CSmallRoomItemVO implements CMessageBody
   {
      
      public var m_iTypeID:int;
      
      public var m_iID:int;
      
      public var m_iPositonX:int;
      
      public var m_iPositonY:int;
      
      public var m_iDirection:int;
      
      public var m_iBuyTime:int;
      
      public function CSmallRoomItemVO()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iTypeID = a_2664.decode_int32(byte_array);
         this.m_iID = a_2664.decode_int32(byte_array);
         this.m_iPositonX = a_2664.decode_int32(byte_array);
         this.m_iPositonY = a_2664.decode_int32(byte_array);
         this.m_iDirection = a_2664.decode_int32(byte_array);
         this.m_iBuyTime = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

