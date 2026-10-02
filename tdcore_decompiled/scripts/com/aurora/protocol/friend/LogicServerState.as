package com.aurora.protocol.friend
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class LogicServerState implements CMessageBody
   {
      
      public var m_cRoomCount:int;
      
      public var m_arrStatus:Array;
      
      private var stUserStatus:CUserStatus;
      
      public function LogicServerState()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [];
         propertyArray.push(["m_cRoomCount","int8"]);
         propertyArray.push(["m_arrStatus",["object","com.aurora.protocol.friend.CUserStatus"]]);
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var userStatus:CUserStatus = null;
         this.m_cRoomCount = a_2664.decode_int8(byte_array);
         this.m_arrStatus = [];
         for(var index:int = 0; index < this.m_cRoomCount; index++)
         {
            userStatus = new CUserStatus();
            userStatus.decode(byte_array,decode_length);
            this.m_arrStatus.push(userStatus);
         }
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

