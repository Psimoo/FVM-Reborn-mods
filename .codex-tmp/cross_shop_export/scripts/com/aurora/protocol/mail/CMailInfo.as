package com.aurora.protocol.mail
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CMailInfo implements CMessageBody
   {
      
      public var m_iMailID:int;
      
      public var m_iSrcUin:int;
      
      public var m_szSrcAccount:String;
      
      public var m_iDstUin:int;
      
      public var m_szDstAccount:String;
      
      public var m_iSendTime:int;
      
      public var m_iExpiredTime:int;
      
      public var m_cReadFlag:int;
      
      public var m_cMailFlag:int;
      
      public var m_cExtraFlag:int;
      
      public var m_cExtraFeeFlag:int;
      
      public var m_nExtraFee:int;
      
      public var m_nExtraCount:int;
      
      public var m_arrMailExtra:Array;
      
      public var m_szTitle:String;
      
      public var m_szContent:String;
      
      private var stMailExtraInfo:MailExtraInfo;
      
      public function CMailInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iMailID","int32"],["m_iSrcUin","int32"],["m_szSrcAccount","string",32],["m_iDstUin","int32"],["m_szDstAccount","string",32],["m_iSendTime","int32"],["m_iExpiredTime","int32"],["m_cReadFlag","int8"],["m_cMailFlag","int8"],["m_cExtraFlag","int8"],["m_cExtraFeeFlag","int8"],["m_nExtraFee","int32"],["m_nExtraCount","int16"],["m_arrMailExtra",["object","com.aurora.protocol.mail.MailExtraInfo"]],["m_szTitle","string",256],["m_szContent","string",2048]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iMailID","int32"],["m_iSrcUin","int32"],["m_szSrcAccount","string",32],["m_iDstUin","int32"],["m_szDstAccount","string",32],["m_iSendTime","int32"],["m_iExpiredTime","int32"],["m_cReadFlag","int8"],["m_cMailFlag","int8"],["m_cExtraFlag","int8"],["m_cExtraFeeFlag","int8"],["m_nExtraFee","int32"],["m_nExtraCount","int16"],["m_arrMailExtra",["object","com.aurora.protocol.mail.MailExtraInfo"]],["m_szTitle","string",256],["m_szContent","string",2048]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

