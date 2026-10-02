package com.aurora.protocol.game.maogoutd
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2707 implements CMessageBody
   {
      
      public var m_byPlayerSeatID:int;
      
      public var m_uiUseTimeCount:int;
      
      public var m_byYGridNo:int;
      
      public var m_byXGridNo:int;
      
      public var m_iGamePropID:int;
      
      public var m_nIntruderGlobalID:int;
      
      public function a_2707()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_byPlayerSeatID","int8"],["m_uiUseTimeCount","int32"],["m_byYGridNo","int8"],["m_byXGridNo","int8"],["m_iGamePropID","int32"],["m_nIntruderGlobalID","int16"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_byPlayerSeatID","int8"],["m_uiUseTimeCount","int32"],["m_byYGridNo","int8"],["m_byXGridNo","int8"],["m_iGamePropID","int32"],["m_nIntruderGlobalID","int16"]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

