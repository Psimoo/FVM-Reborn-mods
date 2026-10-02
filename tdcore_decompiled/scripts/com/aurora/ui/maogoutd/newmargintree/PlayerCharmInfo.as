package com.aurora.ui.maogoutd.newmargintree
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class PlayerCharmInfo implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_iCharmCurrWeek:int;
      
      public var m_iRankCurrWeek:int;
      
      public var m_iCharmCoinAward:int;
      
      public function PlayerCharmInfo()
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
         this.m_iCharmCurrWeek = a_2664.decode_int32(byte_array);
         this.m_iRankCurrWeek = a_2664.decode_int32(byte_array);
         this.m_iCharmCoinAward = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

