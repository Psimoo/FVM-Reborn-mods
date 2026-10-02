package com.aurora.protocol.game.maogoutd
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CTDPlayerStatusInfo implements CMessageBody
   {
      
      public var m_byTeamNo:int;
      
      public var m_byReadyStatus:int;
      
      public var m_PointStatus:int;
      
      public function CTDPlayerStatusInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_byTeamNo","uint8"],["m_byReadyStatus","uint8"],["m_PointStatus","uint8"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_byTeamNo","uint8"],["m_byReadyStatus","uint8"],["m_PointStatus","uint8"]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

