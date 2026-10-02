package com.aurora.protocol.mail
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2970 implements CMessageBody
   {
      
      public var m_iSrcUin:int;
      
      public var m_szSrcAccount:String;
      
      public var m_iDstUin:int;
      
      public var m_szDstAccount:String;
      
      public var m_cExpiredType:int;
      
      public var m_cExtraFeeFlag:int;
      
      public var m_nExtraFee:int;
      
      public var m_nExtraCount:int;
      
      public var m_arrMailExtraInfo:Array;
      
      public var m_szMailTitle:String;
      
      public var m_szMailContent:String;
      
      private var stItemBaseWithCount:ItemBaseWithCount;
      
      public function a_2970()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iSrcUin","int32"],["m_szSrcAccount","string",32],["m_iDstUin","int32"],["m_szDstAccount","string",32],["m_cExpiredType","int8"],["m_cExtraFeeFlag","int8"],["m_nExtraFee","int32"],["m_nExtraCount","int16"],["m_arrMailExtraInfo",["object","com.aurora.protocol.mail.ItemBaseWithCount"]],["m_szMailTitle","string",256],["m_szMailContent","string",2048]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iSrcUin","int32"],["m_szSrcAccount","string",32],["m_iDstUin","int32"],["m_szDstAccount","string",32],["m_cExpiredType","int8"],["m_cExtraFeeFlag","int8"],["m_nExtraFee","int32"],["m_nExtraCount","int16"],["m_arrMailExtraInfo",["object","com.aurora.protocol.mail.ItemBaseWithCount"]],["m_szMailTitle","string",256],["m_szMailContent","string",2048]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

