package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import com.aurora.protocol.logicserver.CCardUpdateInfoRes;
   import flash.utils.ByteArray;
   
   public class a_2830 implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iSrcRoleUin:int;
      
      public var m_szSrcRoleName:String;
      
      public var m_iDstRoleUin:int;
      
      public var m_szDstRoleName:String;
      
      public var m_iCommodityCoinPrice:int;
      
      public var m_lCommodityHappyBeanPrice:int;
      
      public var m_iCommodityLotteryPrice:int;
      
      public var m_iCommodityCharmPrice:int;
      
      public var m_iCommodityCharmCoinPrice:int;
      
      public var m_iCurrentCoin:int;
      
      public var m_lCurrentHappyBean:int;
      
      public var m_iCurrentLottery:int;
      
      public var m_iCurrentCharm:int;
      
      public var m_iCurrentCharmCoin:int;
      
      public var m_nCardDataCount:int;
      
      public var m_aryCardData:Array;
      
      public var m_nHeroItemDataCount:int;
      
      public var m_aryHeroItemData:Array;
      
      public var m_szReasonMessage:String;
      
      private var stCardUpdateInfoL:CCardUpdateInfoRes;
      
      private var stUpdateHeroInfo:CUpdateHeroInfoRes;
      
      public function a_2830()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var propertyArray:Array = [];
         propertyArray.push(["m_nResultID","int16"]);
         if(this.m_nResultID == 0)
         {
            propertyArray.push(["m_iSrcRoleUin","int32"]);
            propertyArray.push(["m_szSrcRoleName","string",32]);
            propertyArray.push(["m_iDstRoleUin","int32"]);
            propertyArray.push(["m_szDstRoleName","string",32]);
            propertyArray.push(["m_iCommodityCoinPrice","int32"]);
            propertyArray.push(["m_lCommodityHappyBeanPrice","int64"]);
            propertyArray.push(["m_iCommodityLotteryPrice","int32"]);
            propertyArray.push(["m_iCommodityCharmPrice","int32"]);
            propertyArray.push(["m_iCommodityCharmCoinPrice","int32"]);
            propertyArray.push(["m_iCurrentCoin","int32"]);
            propertyArray.push(["m_lCurrentHappyBean","int64"]);
            propertyArray.push(["m_iCurrentLottery","int32"]);
            propertyArray.push(["m_iCurrentCharm","int32"]);
            propertyArray.push(["m_iCurrentCharmCoin","int32"]);
            propertyArray.push(["m_nCardDataCount","int16"]);
            propertyArray.push(["m_aryCardData",["object","com.aurora.protocol.logicserver.CCardUpdateInfoRes"]]);
            propertyArray.push(["m_nHeroItemDataCount","int16"]);
            propertyArray.push(["m_aryHeroItemData",["object","com.aurora.protocol.hallserver.CUpdateHeroInfoRes"]]);
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
            propertyArray.push(["m_iSrcRoleUin","int32"]);
            propertyArray.push(["m_szSrcRoleName","string",32]);
            propertyArray.push(["m_iDstRoleUin","int32"]);
            propertyArray.push(["m_szDstRoleName","string",32]);
            propertyArray.push(["m_iCommodityCoinPrice","int32"]);
            propertyArray.push(["m_lCommodityHappyBeanPrice","int64"]);
            propertyArray.push(["m_iCommodityLotteryPrice","int32"]);
            propertyArray.push(["m_iCommodityCharmPrice","int32"]);
            propertyArray.push(["m_iCommodityCharmCoinPrice","int32"]);
            propertyArray.push(["m_iCurrentCoin","int32"]);
            propertyArray.push(["m_lCurrentHappyBean","int64"]);
            propertyArray.push(["m_iCurrentLottery","int32"]);
            propertyArray.push(["m_iCurrentCharm","int32"]);
            propertyArray.push(["m_iCurrentCharmCoin","int32"]);
            propertyArray.push(["m_nCardDataCount","int16"]);
            propertyArray.push(["m_aryCardData",["object","com.aurora.protocol.logicserver.CCardUpdateInfoRes"]]);
            propertyArray.push(["m_nHeroItemDataCount","int16"]);
            propertyArray.push(["m_aryHeroItemData",["object","com.aurora.protocol.hallserver.CUpdateHeroInfoRes"]]);
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

