package com.aurora.protocol.game.maogoutd
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CPendingEnemy implements CMessageBody
   {
      
      public var m_nEnemySequence:uint;
      
      public var m_uiEnemyTypeID:uint;
      
      public var m_byAppearType:uint;
      
      public var m_byRow:uint;
      
      public var m_byAppearFlag:uint;
      
      public var m_uiTimeTickCount:uint;
      
      public function CPendingEnemy()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nEnemySequence","uint16"],["m_uiEnemyTypeID","uint32"],["m_byAppearType","uint8"],["m_byRow","uint8"],["m_byAppearFlag","uint8"],["m_uiTimeTickCount","uint32"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nEnemySequence","uint16"],["m_uiEnemyTypeID","uint32"],["m_byAppearType","uint8"],["m_byRow","uint8"],["m_byAppearFlag","uint8"],["m_uiTimeTickCount","uint32"]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

