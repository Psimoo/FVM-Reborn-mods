package com.aurora.protocol.friend
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2677 implements CMessageBody
   {
      
      public var m_nFriendCount:int;
      
      public var m_astFriendInfo:Array;
      
      public var m_iTagID:int;
      
      public var m_szTagName:String;
      
      public var m_szRemarks:String;
      
      public var m_iGroupFlag:int;
      
      public var m_iGameID:int;
      
      private var stClientProfile:ClientProfile;
      
      public function a_2677()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [];
         propertyArray.push(["m_nFriendCount","int16"]);
         propertyArray.push(["m_astFriendInfo",["object","com.aurora.protocol.friend.ClientProfile","nosize"]]);
         propertyArray.push(["m_iTagID","int32"]);
         propertyArray.push(["m_szTagName","string",16]);
         propertyArray.push(["m_szRemarks","string",16]);
         propertyArray.push(["m_iGroupFlag","int32"]);
         propertyArray.push(["m_iGameID","int32"]);
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [];
         propertyArray.push(["m_nFriendCount","int16"]);
         propertyArray.push(["m_astFriendInfo",["object","com.aurora.protocol.friend.ClientProfile","nosize"]]);
         propertyArray.push(["m_iTagID","int32"]);
         propertyArray.push(["m_szTagName","string",32]);
         propertyArray.push(["m_szRemarks","string",32]);
         propertyArray.push(["m_iGroupFlag","int32"]);
         propertyArray.push(["m_iGameID","int32"]);
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

