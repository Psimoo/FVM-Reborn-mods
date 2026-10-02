package com.aurora.protocol.mail
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2973 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_nUpdateCount:int;
      
      public var m_arrUpdateInfo:Array;
      
      public var m_szReasonMessage:String;
      
      private var stUpdateMailInfo:UpdateMailInfo;
      
      public function a_2973()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [];
         if(this.m_nResultID == 0)
         {
            propertyArray.push(["m_nUpdateCount","int16"]);
            propertyArray.push(["m_arrUpdateInfo",["object","com.aurora.protocol.mail.UpdateMailInfo"]]);
         }
         else
         {
            propertyArray.push(["m_szReasonMessage","string",4096]);
         }
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [];
         this.m_nResultID = a_2664.decode_int16(byte_array);
         if(this.m_nResultID == 0)
         {
            propertyArray.push(["m_nUpdateCount","int16"]);
            propertyArray.push(["m_arrUpdateInfo",["object","com.aurora.protocol.mail.UpdateMailInfo"]]);
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

