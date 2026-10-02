package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CRole implements CMessageBody
   {
      
      public var m_iRoleUin:int;
      
      public var m_szRoleName:String;
      
      public var m_cState:int;
      
      public var m_iLogicServerID:int;
      
      public var m_iRoomID:int;
      
      public var m_iLastLoginTime:int;
      
      public function CRole()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iRoleUin","int32"],["m_szRoleName","string",32],["m_cState","int8"],["m_iLogicServerID","int32"],["m_iRoomID","int32"],["m_iLastLoginTime","int32"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iRoleUin = a_2664.decode_int32(byte_array);
         this.m_szRoleName = a_2664.decode_string(byte_array,32);
         this.m_cState = a_2664.decode_int8(byte_array);
         this.m_iLogicServerID = a_2664.decode_int32(byte_array);
         this.m_iRoomID = a_2664.decode_int32(byte_array);
         this.m_iLastLoginTime = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

