package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2754 implements CMessageBody
   {
      
      public var m_iSrcUIN:int;
      
      public var m_nCommandID:int;
      
      public var m_nCommandLength:int;
      
      public var m_szCommandData:ByteArray;
      
      public function a_2754()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [];
         propertyArray.push(["m_iSrcUIN","int32"]);
         propertyArray.push(["m_nCommandID","int16"]);
         propertyArray.push(["m_nCommandLength","int16"]);
         propertyArray.push(["m_szCommandData","memory"]);
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [];
         propertyArray.push(["m_iSrcUIN","int32"]);
         propertyArray.push(["m_nCommandID","int16"]);
         propertyArray.push(["m_nCommandLength","int16"]);
         propertyArray.push(["m_szCommandData","memory"]);
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

