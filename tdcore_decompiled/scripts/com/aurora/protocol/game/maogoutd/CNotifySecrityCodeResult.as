package com.aurora.protocol.game.maogoutd
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CNotifySecrityCodeResult implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_iResultID:int;
      
      public var m_iTime:int;
      
      public function CNotifySecrityCodeResult()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iResultID = a_2664.decode_int8(byte_array);
         this.m_iTime = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

