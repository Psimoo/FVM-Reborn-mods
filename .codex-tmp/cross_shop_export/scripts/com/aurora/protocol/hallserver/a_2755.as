package com.aurora.protocol.hallserver
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class a_2755 implements CMessageBody
   {
      
      public var m_iUin:int;
      
      public var m_iMoney:int;
      
      public var m_lHappyBean:Number;
      
      public var m_iCharming:int;
      
      public var m_iLottery:int;
      
      public var m_iTotalCharm:int;
      
      public var m_iCharmCoin:int;
      
      public var m_nGameID:int;
      
      public var m_iExperiencePoint:int;
      
      public var m_iAchievement:int;
      
      public var m_iGamePoint:int;
      
      public var m_iWinRound:int;
      
      public var m_iLossRound:int;
      
      public var m_iDrawRound:int;
      
      public var m_iEscapeRound:int;
      
      public var m_iPrestige:int;
      
      public var m_iOrgID:int;
      
      public var m_nPosition:int;
      
      public var m_iVIPScore:int;
      
      public var m_iHeroCount:int;
      
      public var m_oMiShi:Object;
      
      public var m_Reserved:int;
      
      public var m_iWarriorProgress:int;
      
      public var m_iTotalMoneyConsume:int;
      
      public var m_iWishingTalisman:int;
      
      public var m_iDataReversed:int;
      
      public function a_2755()
      {
         super();
         if(!this.m_oMiShi)
         {
            this.m_oMiShi = {};
         }
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iMoney = a_2664.decode_int32(byte_array);
         this.m_lHappyBean = a_2664.decode_int64(byte_array);
         this.m_iCharming = a_2664.decode_int32(byte_array);
         this.m_iLottery = a_2664.decode_int32(byte_array);
         this.m_iTotalCharm = a_2664.decode_int32(byte_array);
         this.m_iCharmCoin = a_2664.decode_int32(byte_array);
         this.m_nGameID = a_2664.decode_int16(byte_array);
         this.m_iExperiencePoint = a_2664.decode_int32(byte_array);
         this.m_iAchievement = a_2664.decode_int32(byte_array);
         this.m_iGamePoint = a_2664.decode_int32(byte_array);
         this.m_iWinRound = a_2664.decode_int32(byte_array);
         this.m_iLossRound = a_2664.decode_int32(byte_array);
         this.m_iDrawRound = a_2664.decode_int32(byte_array);
         this.m_iEscapeRound = a_2664.decode_int32(byte_array);
         this.m_iPrestige = a_2664.decode_int32(byte_array);
         this.m_iOrgID = a_2664.decode_int32(byte_array);
         this.m_nPosition = a_2664.decode_int32(byte_array);
         this.m_iVIPScore = a_2664.decode_int32(byte_array);
         this.m_iHeroCount = a_2664.decode_int32(byte_array);
         this.m_oMiShi.m_iLJSID = a_2664.decode_int32(byte_array);
         this.m_oMiShi.m_iCJGID = a_2664.decode_int32(byte_array);
         this.m_oMiShi.m_iWWWID = a_2664.decode_int32(byte_array);
         this.m_oMiShi.m_iSJGID = a_2664.decode_int32(byte_array);
         this.m_oMiShi.m_iMBKID = a_2664.decode_int32(byte_array);
         this.m_Reserved = a_2664.decode_int32(byte_array);
         this.m_iWarriorProgress = a_2664.decode_int32(byte_array);
         this.m_iTotalMoneyConsume = a_2664.decode_int32(byte_array);
         this.m_iWishingTalisman = a_2664.decode_int32(byte_array);
         this.m_iDataReversed = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

