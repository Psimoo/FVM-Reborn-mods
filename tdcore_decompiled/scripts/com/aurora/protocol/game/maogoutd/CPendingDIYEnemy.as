package com.aurora.protocol.game.maogoutd
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CPendingDIYEnemy implements CMessageBody
   {
      
      public var m_nEnemySequence:int;
      
      public var m_uiEnemyTypeID:int;
      
      public var m_byRow:int;
      
      public var m_iLife:int;
      
      public var m_uiTimeTickCount:int;
      
      public function CPendingDIYEnemy()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nEnemySequence","uint16"],["m_uiEnemyTypeID","uint32"],["m_byRow","uint8"],["m_iLife","uint32"],["m_uiTimeTickCount","uint32"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nEnemySequence","uint16"],["m_uiEnemyTypeID","uint32"],["m_byRow","uint8"],["m_iLife","uint32"],["m_uiTimeTickCount","uint32"]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

