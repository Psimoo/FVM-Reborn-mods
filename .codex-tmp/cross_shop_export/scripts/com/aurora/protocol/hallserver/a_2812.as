package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2812 implements CMessageBody
   {
      
      public var m_iSrcRoleUin:int;
      
      public var m_szSrcRoleName:String;
      
      public var m_iDstRoleUin:int;
      
      public var m_szDstRoleName:String;
      
      public var m_cVipLevel:int;
      
      public var m_nPaymentMode:int;
      
      public var m_iClientIP:int;
      
      public var m_iCommodityCoinPrice:int;
      
      public var m_iCommodityHappyBeanPrice:int;
      
      public var m_iCommodityLotteryPrice:int;
      
      public var m_iCommodityCharmPrice:int;
      
      public var m_nCommodityCount:int;
      
      public var m_aryCommodityData:Array;
      
      public var m_szWord:String;
      
      private var stCommodityData:CSCommodityData;
      
      public function a_2812()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [];
         propertyArray.push(["m_iSrcRoleUin","int32"]);
         propertyArray.push(["m_szSrcRoleName","string",32]);
         propertyArray.push(["m_iDstRoleUin","int32"]);
         propertyArray.push(["m_szDstRoleName","string",32]);
         propertyArray.push(["m_cVipLevel","int8"]);
         propertyArray.push(["m_nPaymentMode","int16"]);
         propertyArray.push(["m_iClientIP","int32"]);
         propertyArray.push(["m_iCommodityCoinPrice","int32"]);
         propertyArray.push(["m_iCommodityHappyBeanPrice","int64"]);
         propertyArray.push(["m_iCommodityLotteryPrice","int32"]);
         propertyArray.push(["m_iCommodityCharmPrice","int32"]);
         propertyArray.push(["m_nCommodityCount","int16"]);
         propertyArray.push(["m_aryCommodityData",["object","com.aurora.protocol.hallserver.CSCommodityData"]]);
         propertyArray.push(["m_szWord","string",302]);
         return a_2664.a_2665(this,propertyArray,byte_array,encode_length);
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var propertyArray:Array = [];
         propertyArray.push(["m_iSrcRoleUin","int32"]);
         propertyArray.push(["m_szSrcRoleName","string",32]);
         propertyArray.push(["m_iDstRoleUin","int32"]);
         propertyArray.push(["m_szDstRoleName","string",32]);
         propertyArray.push(["m_cVipLevel","int32"]);
         propertyArray.push(["m_nPaymentMode","int32"]);
         propertyArray.push(["m_iClientIP","int32"]);
         propertyArray.push(["m_iCommodityCoinPrice","int32"]);
         propertyArray.push(["m_iCommodityHappyBeanPrice","int32"]);
         propertyArray.push(["m_iCommodityLotteryPrice","int32"]);
         propertyArray.push(["m_iCommodityCharmPrice","int32"]);
         propertyArray.push(["m_nCommodityCount","int32"]);
         propertyArray.push(["m_aryCommodityData",["object","com.aurora.protocol.hallserver.CSCommodityData"]]);
         propertyArray.push(["m_szWord","string",302]);
         return a_2664.a_2666(this,propertyArray,byte_array,decode_length);
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

