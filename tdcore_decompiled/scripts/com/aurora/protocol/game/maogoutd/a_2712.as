package com.aurora.protocol.game.maogoutd
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2712 implements CMessageBody
   {
      
      public var m_uiTickCount:uint;
      
      public var m_byAvatarYGridNo:int;
      
      public var m_byAvatarXGridNo:int;
      
      public function a_2712()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_uiTickCount","int32"],["m_byAvatarYGridNo","int8"],["m_byAvatarXGridNo","int8"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_uiTickCount","int32"],["m_byAvatarYGridNo","int8"],["m_byAvatarXGridNo","int8"]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

