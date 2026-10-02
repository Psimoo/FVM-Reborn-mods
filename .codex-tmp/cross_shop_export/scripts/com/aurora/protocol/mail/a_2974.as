package com.aurora.protocol.mail
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2974 implements CMessageBody
   {
      
      public var m_iSrcUin:int;
      
      public var m_iDstUin:int;
      
      public var m_nResultID:int;
      
      public var m_cExpiredType:int;
      
      public var m_cExtraFeeFlag:int;
      
      public var m_nExtraFee:int;
      
      public var m_nExtraCount:int;
      
      public var m_arrMailExtraInfo:Array;
      
      public var m_szMailTitle:String;
      
      public var m_szMailContent:String;
      
      public var m_szReasonMessage:String;
      
      private var stMailExtraInfo:ItemBaseWithCount;
      
      public function a_2974()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [];
         propertyArray.push(["m_iSrcUin","int32"]);
         propertyArray.push(["m_iDstUin","int32"]);
         propertyArray.push(["m_nResultID","int16"]);
         if(this.m_nResultID == 0)
         {
            propertyArray.push(["m_cExpiredType","int8"]);
            propertyArray.push(["m_cExtraFeeFlag","int8"]);
            propertyArray.push(["m_nExtraFee","int32"]);
            propertyArray.push(["m_nExtraCount","int16"]);
            propertyArray.push(["m_arrMailExtraInfo",["object","com.aurora.protocol.mail.ItemBaseWithCount"]]);
            propertyArray.push(["m_szMailTitle","string",256]);
            propertyArray.push(["m_szMailContent","string",2048]);
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
         this.m_iSrcUin = a_2664.decode_int32(byte_array);
         this.m_iDstUin = a_2664.decode_int32(byte_array);
         this.m_nResultID = a_2664.decode_int16(byte_array);
         if(this.m_nResultID == 0)
         {
            propertyArray.push(["m_cExpiredType","int8"]);
            propertyArray.push(["m_cExtraFeeFlag","int8"]);
            propertyArray.push(["m_nExtraFee","int32"]);
            propertyArray.push(["m_nExtraCount","int16"]);
            propertyArray.push(["m_arrMailExtraInfo",["object","com.aurora.protocol.mail.ItemBaseWithCount"]]);
            propertyArray.push(["m_szMailTitle","string",256]);
            propertyArray.push(["m_szMailContent","string",2048]);
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

