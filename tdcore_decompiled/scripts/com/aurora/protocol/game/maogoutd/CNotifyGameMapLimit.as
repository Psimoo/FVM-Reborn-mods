package com.aurora.protocol.game.maogoutd
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CNotifyGameMapLimit implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_iErrorID:int;
      
      public var m_cReason:String;
      
      public function CNotifyGameMapLimit()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iErrorID = a_2664.decode_int8(byte_array);
         this.m_cReason = a_2664.decode_string(byte_array,256);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

