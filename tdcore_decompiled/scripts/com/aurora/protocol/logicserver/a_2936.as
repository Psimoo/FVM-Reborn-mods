package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2936 implements CMessageBody
   {
      
      public var m_iRoomID:int;
      
      public var m_iNewViewStart:int;
      
      public var m_iNewViewEnd:int;
      
      public var m_iRequiredTableStart:int;
      
      public var m_iRequiredTableEnd:int;
      
      public function a_2936()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iRoomID","int32"],["m_iNewViewStart","int32"],["m_iNewViewEnd","int32"],["m_iRequiredTableStart","int32"],["m_iRequiredTableEnd","int32"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iRoomID","int32"],["m_iNewViewStart","int32"],["m_iNewViewEnd","int32"],["m_iRequiredTableStart","int32"],["m_iRequiredTableEnd","int32"]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

