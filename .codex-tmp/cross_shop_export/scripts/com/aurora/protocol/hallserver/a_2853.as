package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2853 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iID:int;
      
      public var m_iSeq:int;
      
      public var m_nBookLevel:int;
      
      public var m_iAddPoint:int;
      
      public var m_iMaxPoint:int;
      
      public var m_szReasonMessage:String;
      
      public function a_2853()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nResultID","int16"]];
         if(this.m_nResultID == 0)
         {
            propertyArray.push(["m_iID","int32"]);
            propertyArray.push(["m_iSeq","int32"]);
            propertyArray.push(["m_nBookLevel","int16"]);
            propertyArray.push(["m_iAddPoint","int32"]);
            propertyArray.push(["m_iMaxPoint","int32"]);
         }
         else
         {
            propertyArray.push(["m_szReasonMessage","string",4096]);
         }
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_nResultID = a_2664.decode_int16(byte_array);
         var propertyArray:Array = [];
         propertyArray.push(["m_iID","int32"]);
         propertyArray.push(["m_iSeq","int32"]);
         if(this.m_nResultID == 0)
         {
            propertyArray.push(["m_nBookLevel","int16"]);
            propertyArray.push(["m_iAddPoint","int32"]);
            propertyArray.push(["m_iMaxPoint","int32"]);
         }
         else
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

