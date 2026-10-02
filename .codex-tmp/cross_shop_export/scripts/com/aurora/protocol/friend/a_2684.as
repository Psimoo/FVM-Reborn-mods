package com.aurora.protocol.friend
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2684 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_stFriendInfo:ClientProfile;
      
      public var m_iTagID:int;
      
      public var m_szTagName:String;
      
      public var m_szRemarks:String;
      
      public var m_iGroupFlag:int;
      
      public var m_szReasonMessage:String;
      
      public function a_2684()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nResultID","int16"]];
         if(this.m_nResultID == 0)
         {
            propertyArray.push(["m_stFriendInfo","object","com.aurora.protocol.friend.ClientProfile","nosize"]);
            propertyArray.push(["m_iTagID","int32"]);
            propertyArray.push(["m_szTagName","string",16]);
            propertyArray.push(["m_szRemarks","string",16]);
            propertyArray.push(["m_iGroupFlag","int32"]);
         }
         else
         {
            propertyArray.push(["m_szReasonMessage","string",2048]);
         }
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_nResultID = a_2664.decode_int16(byte_array);
         var propertyArray:Array = [];
         if(this.m_nResultID == 0)
         {
            propertyArray.push(["m_stFriendInfo","object","com.aurora.protocol.friend.ClientProfile","nosize"]);
            propertyArray.push(["m_iTagID","int32"]);
            propertyArray.push(["m_szTagName","string",16]);
            propertyArray.push(["m_szRemarks","string",16]);
            propertyArray.push(["m_iGroupFlag","int32"]);
         }
         else
         {
            propertyArray.push(["m_szReasonMessage","string",2048]);
         }
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

