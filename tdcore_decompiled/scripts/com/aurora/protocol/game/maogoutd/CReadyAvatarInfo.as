package com.aurora.protocol.game.maogoutd
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CReadyAvatarInfo implements CMessageBody
   {
      
      public var m_bySeatID:int;
      
      public var m_nMemorySize:uint;
      
      public var m_byarrPlayerAvatarInfoByteArray:ByteArray;
      
      public function CReadyAvatarInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_bySeatID","int8"],["m_nMemorySize","uint16"],["m_byarrPlayerAvatarInfoByteArray","memory"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_bySeatID","int8"],["m_nMemorySize","uint16"],["m_byarrPlayerAvatarInfoByteArray","memory"]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

