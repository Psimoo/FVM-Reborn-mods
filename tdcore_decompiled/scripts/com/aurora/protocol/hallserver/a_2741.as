package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2741 implements CMessageBody
   {
      
      public var m_nControlCMD:int;
      
      public var m_iSrcUIN:int;
      
      public var m_szSrcAccount:String;
      
      public var m_szSrcNick:String;
      
      public var m_cSrcGender:int;
      
      public var m_szMessage:String;
      
      public function a_2741()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [];
         propertyArray.push(["m_nControlCMD","int16"]);
         propertyArray.push(["m_iSrcUIN","int32"]);
         propertyArray.push(["m_szSrcAccount","string",48]);
         propertyArray.push(["m_szSrcNick","string",64]);
         propertyArray.push(["m_cSrcGender","int8"]);
         propertyArray.push(["m_szMessage","string",302]);
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

