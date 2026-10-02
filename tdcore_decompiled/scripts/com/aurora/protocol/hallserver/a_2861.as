package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2861 implements CMessageBody
   {
      
      public var m_iSrcRoleUin:int;
      
      public var m_szSrcRoleName:String;
      
      public var m_cVipLevel:int;
      
      public var m_nPaymentMode:int;
      
      public var m_iClientIP:int;
      
      public var m_iRenewCoinPrice:int;
      
      public var m_lRenewHappyBeanPrice:int;
      
      public var m_iRenewLotteryPrice:int;
      
      public var m_iRenewCharmPrice:int;
      
      public var m_iItemID:int;
      
      public var m_iItemSeq:int;
      
      public var m_iRenewDays:int;
      
      public function a_2861()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iSrcRoleUin","int32"],["m_szSrcRoleName","string",32],["m_cVipLevel","int8"],["m_nPaymentMode","int16"],["m_iClientIP","int32"],["m_iRenewCoinPrice","int32"],["m_lRenewHappyBeanPrice","int64"],["m_iRenewLotteryPrice","int32"],["m_iRenewCharmPrice","int32"],["m_iItemID","int32"],["m_iItemSeq","int32"],["m_iRenewDays","int32"]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_iSrcRoleUin","int32"],["m_szSrcRoleName","string",32],["m_cVipLevel","int8"],["m_nPaymentMode","int16"],["m_iClientIP","int32"],["m_iRenewCoinPrice","int32"],["m_lRenewHappyBeanPrice","int64"],["m_iRenewLotteryPrice","int32"],["m_iRenewCharmPrice","int32"],["m_iItemID","int32"],["m_iItemSeq","int32"],["m_iRenewDays","int32"]];
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

