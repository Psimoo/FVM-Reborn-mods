package com.aurora.protocol.game.maogoutd
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CRequestPostDamageValidate implements CMessageBody
   {
      
      public var m_nDamageValue:int;
      
      public var m_arrItemInfo:Array;
      
      public function CRequestPostDamageValidate()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         a_2664.encode_int32(byte_array,this.m_nDamageValue);
         for(var i:int = 0; i < this.m_arrItemInfo.length; i++)
         {
            a_2664.encode_int32(byte_array,this.m_arrItemInfo[i]);
         }
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

