package com.aurora.protocol.game.maogoutd
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CNotifySecrityCode implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_cCode:String;
      
      public function CNotifySecrityCode()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_cCode = a_2664.decode_string(byte_array,16);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

