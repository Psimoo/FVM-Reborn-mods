package com.aurora.protocol.game.maogoutd
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2708 implements CMessageBody
   {
      
      public var m_uiTickCount:uint;
      
      public var m_uiGlobalID:uint;
      
      public var m_iDefenderTypeID:int;
      
      public var m_byYGridNo:int;
      
      public var m_byXGridNo:int;
      
      public var m_byExistOwnerSeatID:int;
      
      public var m_iExistDefenderTypeID:int;
      
      public var m_IsCaclueCoolDown:int;
      
      public var a_1094:int;
      
      public function a_2708()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_uiTickCount","uint32"],["m_uiGlobalID","uint32"],["m_iDefenderTypeID","int32"],["m_byYGridNo","int8"],["m_byXGridNo","int8"],["m_byExistOwnerSeatID","int8"],["m_iExistDefenderTypeID","int32"],["m_IsCaclueCoolDown","int8"],["a_1094","int8"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_uiTickCount","uint32"],["m_uiGlobalID","uint32"],["m_iDefenderTypeID","int32"],["m_byYGridNo","int8"],["m_byXGridNo","int8"],["m_byExistOwnerSeatID","int8"],["m_iExistDefenderTypeID","int32"],["m_IsCaclueCoolDown","int8"],["a_1094","int8"]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

