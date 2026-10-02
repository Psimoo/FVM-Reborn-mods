package com.aurora.protocol.logicserver.diy
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CResponseDiyGetMapInfo implements CMessageBody
   {
      
      public var m_nResultID:int;
      
      public var m_iPlatformID:int;
      
      public var m_iGroupID:int;
      
      public var m_iUin:int;
      
      public var m_iMapID:int;
      
      public var m_iUsage:int;
      
      public var m_bIsDraft:Boolean;
      
      public var m_iDraftDstID:int;
      
      public var m_bIsPassTest:Boolean;
      
      public var m_iVersion:int;
      
      public var m_iReleaseTime:int;
      
      public var m_iCreateTime:int;
      
      public var m_iAuthorPlatformID:int;
      
      public var m_iAuthorGroupID:int;
      
      public var m_iAuthorUin:int;
      
      public var m_szAuthorName:String;
      
      public var m_szName:String;
      
      public var m_szDesc:String;
      
      public var a_1119:int;
      
      public var m_iReadyTime:int;
      
      public var m_iMaxCardStar:int;
      
      public var m_iTimeLimit:int;
      
      public var m_bIsBanPet:Boolean;
      
      public var m_bIsBanEquip:Boolean;
      
      public var m_bPlayerLimit:int;
      
      public var m_iFireNum:int;
      
      public var m_iMouseLevel:int;
      
      public var m_iScenes:int;
      
      public var m_iPraise:int;
      
      public var m_iTread:int;
      
      public var m_iTotalNum:int;
      
      public var m_iTotalPassNum:int;
      
      public var m_iGreatRank:int;
      
      public function CResponseDiyGetMapInfo()
      {
         super();
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         return false;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         this.m_nResultID = a_2664.decode_int16(byte_array);
         this.m_iPlatformID = a_2664.decode_int32(byte_array);
         this.m_iGroupID = a_2664.decode_int32(byte_array);
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_iMapID = a_2664.decode_int32(byte_array);
         this.m_iUsage = a_2664.decode_int32(byte_array);
         this.m_bIsDraft = Boolean(a_2664.decode_int8(byte_array) == 1);
         this.m_iDraftDstID = a_2664.decode_int32(byte_array);
         this.m_bIsPassTest = Boolean(a_2664.decode_int8(byte_array) == 1);
         this.m_iVersion = a_2664.decode_int32(byte_array);
         this.m_iReleaseTime = a_2664.decode_int32(byte_array);
         this.m_iCreateTime = a_2664.decode_int32(byte_array);
         this.m_iAuthorPlatformID = a_2664.decode_int32(byte_array);
         this.m_iAuthorGroupID = a_2664.decode_int32(byte_array);
         this.m_iAuthorUin = a_2664.decode_int32(byte_array);
         this.m_szAuthorName = a_2664.decode_string(byte_array,32);
         this.m_szName = a_2664.decode_string(byte_array,32);
         this.m_szDesc = a_2664.decode_string(byte_array,512);
         this.a_1119 = a_2664.decode_int32(byte_array);
         this.m_iReadyTime = a_2664.decode_int32(byte_array);
         this.m_iMaxCardStar = a_2664.decode_int32(byte_array);
         this.m_iTimeLimit = a_2664.decode_int32(byte_array);
         this.m_bIsBanPet = Boolean(a_2664.decode_int8(byte_array) == 1);
         this.m_bIsBanEquip = Boolean(a_2664.decode_int8(byte_array) == 1);
         this.m_bPlayerLimit = a_2664.decode_int8(byte_array);
         this.m_iFireNum = a_2664.decode_int32(byte_array);
         this.m_iMouseLevel = a_2664.decode_int32(byte_array);
         this.m_iScenes = a_2664.decode_int32(byte_array);
         this.m_iPraise = a_2664.decode_int32(byte_array);
         this.m_iTread = a_2664.decode_int32(byte_array);
         this.m_iTotalNum = a_2664.decode_int32(byte_array);
         this.m_iTotalPassNum = a_2664.decode_int32(byte_array);
         this.m_iGreatRank = a_2664.decode_int32(byte_array);
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
   }
}

