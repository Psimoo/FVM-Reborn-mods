package com.aurora.protocol.mail
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2969 implements CMessageBody
   {
      
      public var m_nUpdateCount:int;
      
      public var m_arrUpdateInfo:Array;
      
      private var stUpdateMailInfo:UpdateMailInfo;
      
      public function a_2969()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [];
         propertyArray.push(["m_nUpdateCount","int16"]);
         propertyArray.push(["m_arrUpdateInfo",["object","com.aurora.protocol.mail.UpdateMailInfo"]]);
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [];
         propertyArray.push(["m_nUpdateCount","int16"]);
         propertyArray.push(["m_arrUpdateInfo",["object","com.aurora.protocol.mail.UpdateMailInfo"]]);
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

