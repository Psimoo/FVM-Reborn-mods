package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2826 implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_iRoleUin:int;
      
      public var m_iLogicServerId:int;
      
      public var m_iRoomId:int;
      
      public function a_2826()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iUin","int32"],["m_iRoleUin","int32"],["m_iLogicServerId","int32"],["m_iRoomId","int32"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iUin","int32"],["m_iRoleUin","int32"],["m_iLogicServerId","int32"],["m_iRoomId","int32"]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

