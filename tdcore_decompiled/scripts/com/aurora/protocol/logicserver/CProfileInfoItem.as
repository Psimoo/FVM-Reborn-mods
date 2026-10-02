package com.aurora.protocol.logicserver
{
   import a_4716.EnmPlayerProfileInfoType;
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CProfileInfoItem implements CMessageBody
   {
      
      public var m_byProfileInfoType:int;
      
      public var m_stWebBaseInfo:CWebBaseInfo;
      
      public function CProfileInfoItem()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_byProfileInfoType","int8"]];
         if(EnmPlayerProfileInfoType.enmPlayerProfileInfoType_webbaseinfo == this.m_byProfileInfoType)
         {
            propertyArray.push(["m_stWebBaseInfo","object","com.aurora.protocol.logicserver.CWebBaseInfo"]);
         }
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_byProfileInfoType = a_2664.decode_int8(byte_array);
         var propertyArray:Array = [];
         if(EnmPlayerProfileInfoType.enmPlayerProfileInfoType_webbaseinfo == this.m_byProfileInfoType)
         {
            propertyArray.push(["m_stWebBaseInfo","object","com.aurora.protocol.logicserver.CWebBaseInfo"]);
         }
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

