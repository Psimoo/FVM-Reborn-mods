package com.aurora.protocol.logicserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2920 implements CMessageBody
   {
      
      public var m_iLobbyVersion:int;
      
      public var m_szAccount:String;
      
      public var m_profileCount:int;
      
      public var m_iRoleUin:int;
      
      public var m_szRoleName:String;
      
      public var m_iUserSex:int;
      
      public function a_2920()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iLobbyVersion","int32"],["m_szAccount","string",32],["m_profileCount","int8"],["m_iRoleUin","int32"],["m_szRoleName","string",32],["m_iUserSex","int8"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iLobbyVersion","int32"],["m_szAccount","string",32],["m_profileCount","int8"],["m_iRoleUin","int32"],["m_szRoleName","string",32],["m_iUserSex","int8"]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

