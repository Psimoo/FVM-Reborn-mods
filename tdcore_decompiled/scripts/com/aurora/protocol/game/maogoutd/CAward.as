package com.aurora.protocol.game.maogoutd
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CAward implements CMessageBody
   {
      
      public var m_byIsSelected:int;
      
      public var m_iCardID:int;
      
      public var m_nCount:int;
      
      public var m_byIsBind:int;
      
      public var m_iExpiredTime:int;
      
      public function CAward()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_byIsSelected","int8"],["m_iCardID","int32"],["m_nCount","int16"],["m_byIsBind","int8"],["m_iExpiredTime","int32"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_byIsSelected","int8"],["m_iCardID","int32"],["m_nCount","int16"],["m_byIsBind","int8"],["m_iExpiredTime","int32"]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

