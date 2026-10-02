package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2739 implements CMessageBody
   {
      
      public var m_iACT:int;
      
      public var m_sendUin:int;
      
      public var m_sendNick:String;
      
      public var m_getUin:int;
      
      public var m_getNick:String;
      
      public var m_mapID:int;
      
      public var m_gameMode:int;
      
      public var m_iServerID:int;
      
      public var m_iRoomID:int;
      
      public var m_iTableID:int;
      
      public var m_szPassword:String;
      
      public var m_iUnionID:int;
      
      public function a_2739()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [];
         propertyArray.push(["m_iACT","int8"]);
         propertyArray.push(["m_sendUin","int32"]);
         propertyArray.push(["m_sendNick","string",32]);
         propertyArray.push(["m_getUin","int32"]);
         propertyArray.push(["m_getNick","string",32]);
         propertyArray.push(["m_mapID","int32"]);
         propertyArray.push(["m_gameMode","int8"]);
         propertyArray.push(["m_iServerID","int32"]);
         propertyArray.push(["m_iRoomID","int32"]);
         propertyArray.push(["m_iTableID","int32"]);
         propertyArray.push(["m_szPassword","string",32]);
         propertyArray.push(["m_iUnionID","int32"]);
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [];
         propertyArray.push(["m_iACT","int8"]);
         propertyArray.push(["m_sendUin","int32"]);
         propertyArray.push(["m_sendNick","string",32]);
         propertyArray.push(["m_getUin","int32"]);
         propertyArray.push(["m_getNick","string",32]);
         propertyArray.push(["m_mapID","int32"]);
         propertyArray.push(["m_gameMode","int8"]);
         propertyArray.push(["m_iServerID","int32"]);
         propertyArray.push(["m_iRoomID","int32"]);
         propertyArray.push(["m_iTableID","int32"]);
         propertyArray.push(["m_szPassword","string",32]);
         propertyArray.push(["m_iUnionID","int32"]);
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

