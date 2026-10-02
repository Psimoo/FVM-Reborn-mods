package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2742 implements CMessageBody
   {
      
      public var m_nControlCMD:int;
      
      public var m_iDestUIN:int;
      
      public var m_szMessage:String;
      
      public function a_2742()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [];
         propertyArray.push(["m_nControlCMD","int16"]);
         propertyArray.push(["m_iDestUIN","int32"]);
         propertyArray.push(["m_szMessage","string",302]);
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         return false;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

