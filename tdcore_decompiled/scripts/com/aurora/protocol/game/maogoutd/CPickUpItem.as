package com.aurora.protocol.game.maogoutd
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CPickUpItem implements CMessageBody
   {
      
      public var m_nItemIndex:int;
      
      public var m_iItemID:int;
      
      public var m_byIsDouble:int;
      
      public var m_iItemCount:int;
      
      public function CPickUpItem()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nItemIndex","int16"],["m_iItemID","int32"],["m_byIsDouble","int8"],["m_iItemCount","int8"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nItemIndex","int16"],["m_iItemID","int32"],["m_byIsDouble","int8"],["m_iItemCount","int8"]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

