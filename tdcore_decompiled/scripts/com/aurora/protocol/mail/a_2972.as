package com.aurora.protocol.mail
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2972 implements CMessageBody
   {
      
      public var m_iSrcUin:int;
      
      public var m_nResultID:int;
      
      public var m_cGetMailType:int;
      
      public var m_nRecvMailCount:int;
      
      public var m_arrRecvMailInfo:Array;
      
      public var m_nSendMailCount:int;
      
      public var m_arrSendMailInfo:Array;
      
      public var m_szReasonMessage:String;
      
      private var stMailInfo:CMailInfo;
      
      public function a_2972()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [];
         propertyArray.push(["m_iSrcUin","int32"]);
         propertyArray.push(["m_nResultID","int16"]);
         if(this.m_nResultID == 0)
         {
            propertyArray.push(["m_cGetMailType","int8"]);
            propertyArray.push(["m_nRecvMailCount","int16"]);
            propertyArray.push(["m_arrRecvMailInfo",["object","com.aurora.protocol.mail.CMailInfo"]]);
            propertyArray.push(["m_nSendMailCount","int16"]);
            propertyArray.push(["m_arrSendMailInfo",["object","com.aurora.protocol.mail.CMailInfo"]]);
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
         this.m_nResultID = a_2664.decode_int16(byte_array);
         if(this.m_nResultID == 0)
         {
            propertyArray.push(["m_cGetMailType","int8"]);
            propertyArray.push(["m_nRecvMailCount","int16"]);
            propertyArray.push(["m_arrRecvMailInfo",["object","com.aurora.protocol.mail.CMailInfo"]]);
            propertyArray.push(["m_nSendMailCount","int16"]);
            propertyArray.push(["m_arrSendMailInfo",["object","com.aurora.protocol.mail.CMailInfo"]]);
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

