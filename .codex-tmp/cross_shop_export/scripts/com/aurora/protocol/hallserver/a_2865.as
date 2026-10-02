package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2865 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iSrcRoleUin:int;
      
      public var m_szSrcRoleName:String;
      
      public var m_iRenewCoinPrice:int;
      
      public var m_lRenewHappyBeanPrice:int;
      
      public var m_iRenewLotteryPrice:int;
      
      public var m_iRenewCharmPrice:int;
      
      public var m_szReasonMessage:String;
      
      public function a_2865()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [["m_nResultID","int16"],["m_iSrcRoleUin","int32"],["m_szSrcRoleName","string",32],["m_iRenewCoinPrice","int32"],["m_lRenewHappyBeanPrice","int64"],["m_iRenewLotteryPrice","int32"],["m_iRenewCharmPrice","int32"],["m_szReasonMessage","string",4096]];
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [];
         this.m_nResultID = a_2664.decode_int16(byte_array);
         if(this.m_nResultID == 0)
         {
            propertyArray.push(["m_iSrcRoleUin","int32"]);
            propertyArray.push(["m_szSrcRoleName","string",32]);
            propertyArray.push(["m_iRenewCoinPrice","int32"]);
            propertyArray.push(["m_lRenewHappyBeanPrice","int64"]);
            propertyArray.push(["m_iRenewLotteryPrice","int32"]);
            propertyArray.push(["m_iRenewCharmPrice","int32"]);
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

