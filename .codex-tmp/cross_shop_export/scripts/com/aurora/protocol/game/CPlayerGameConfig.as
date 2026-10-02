package com.aurora.protocol.game
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CPlayerGameConfig implements CMessageBody
   {
      
      public var m_iMinPoint:int;
      
      public var m_iMaxPointGap:int;
      
      public var m_byMaxOfflineRate:int;
      
      public var m_byIPBit:int;
      
      public var m_uiBitMap:int;
      
      public var m_byOtherSize:int;
      
      public var m_aiOthers:Array;
      
      public function CPlayerGameConfig()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var other:int = 0;
         var size:int = a_2664.decode_int16(byte_array);
         this.m_iMinPoint = a_2664.decode_int32(byte_array);
         this.m_iMaxPointGap = a_2664.decode_int32(byte_array);
         this.m_byMaxOfflineRate = a_2664.decode_int32(byte_array);
         this.m_byIPBit = a_2664.decode_int8(byte_array);
         this.m_uiBitMap = a_2664.decode_int8(byte_array);
         this.m_byOtherSize = a_2664.decode_int8(byte_array);
         this.m_aiOthers = [];
         for(var index:int = 0; index < this.m_byOtherSize; index++)
         {
            other = a_2664.decode_int8(byte_array);
            this.m_aiOthers.push(other);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

