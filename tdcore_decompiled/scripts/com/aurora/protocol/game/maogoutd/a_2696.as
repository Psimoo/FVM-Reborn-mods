package com.aurora.protocol.game.maogoutd
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2696 implements CMessageBody
   {
      
      public var m_byDropBattleID:int;
      
      public var m_byRow:uint;
      
      public var m_byColumn:uint;
      
      public var m_iGoldNum:int;
      
      public var m_nDropPropSequence:int;
      
      public var m_uiPropID:int;
      
      public function a_2696()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_byDropBattleID","uint8"],["m_byRow","uint8"],["m_byColumn","uint8"],["m_iGoldNum","int32"],["m_nDropPropSequence","int16"],["m_uiPropID","uint32"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_byDropBattleID","uint8"],["m_byRow","uint8"],["m_byColumn","uint8"],["m_iGoldNum","int32"],["m_nDropPropSequence","int16"],["m_uiPropID","uint32"]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

