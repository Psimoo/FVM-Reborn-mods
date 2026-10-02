package com.aurora.protocol.game.maogoutd
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CNotifyGameStep implements CMessageBody
   {
      
      public var m_GameStep:int;
      
      public function CNotifyGameStep()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_GameStep);
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_GameStep = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

