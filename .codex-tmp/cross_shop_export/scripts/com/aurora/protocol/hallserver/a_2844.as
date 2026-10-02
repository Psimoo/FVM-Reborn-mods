package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2844 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iDestUIN:int;
      
      public var m_iACT:int;
      
      public var m_nCommandID:int;
      
      public var m_szReasonMessage:String;
      
      public function a_2844()
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
         this.m_nResultID = a_2664.decode_int16(byte_array);
         propertyArray.push(["m_iDestUIN","int32"]);
         propertyArray.push(["m_iACT","int16"]);
         propertyArray.push(["m_nCommandID","int32"]);
         if(this.m_nResultID != 0)
         {
            propertyArray.push(["m_szReasonMessage","string",4096]);
         }
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

