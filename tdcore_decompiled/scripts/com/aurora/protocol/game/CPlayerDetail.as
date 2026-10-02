package com.aurora.protocol.game
{
   import a_4717.EnmFaceMask;
   import a_4717.EnmPlayerDetailSection;
   import a_4717.EnmPlayerStatus;
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.CMessageBody;
   import flash.utils.ByteArray;
   
   public class CPlayerDetail implements CMessageBody
   {
      
      public var m_iUin:int = -1;
      
      public var m_iPlayerID:int;
      
      public var m_szAccount:String;
      
      public var m_szPlayerName:String;
      
      public var m_nFlag:uint;
      
      public var m_iIdentity:int;
      
      public var m_iTableID:int = -1;
      
      public var m_bySeat:int = -1;
      
      public var m_byAge:int;
      
      public var m_iSitdownSequence:int;
      
      public var m_iBirthDay:int;
      
      public var m_byIconType:uint;
      
      public var m_szFaceVersion:String;
      
      public var m_szIconURL:String;
      
      public var m_szZoneInfo:String;
      
      public var m_byStatus:uint;
      
      public var m_byLevel:int;
      
      public var m_iPoint:Number;
      
      public var m_iWinRound:int;
      
      public var m_iLoseRound:int;
      
      public var m_iDrawRound:int;
      
      public var m_iEscapeRound:int;
      
      public var m_iOfflineRound:int;
      
      public var m_iMoney:int;
      
      public var m_iCharming:int;
      
      public var m_iExperiencePoint:int;
      
      public var m_iAchievement:int;
      
      public var m_lHappyBean:Number;
      
      public var m_i51VIPScore:int;
      
      public var m_i51VIPLevel:int;
      
      public var m_i51Score:int;
      
      public var m_i51Level:int;
      
      public var m_iFlowerCount:int;
      
      public var m_szFaceURL50:String;
      
      public var m_szFaceURL130:String;
      
      public var m_szExtraUid:String;
      
      public var m_iGoodId:int;
      
      public var m_iGameVIPScore:int;
      
      public var m_iGameVIPLevel:int;
      
      public function CPlayerDetail()
      {
         super();
      }
      
      public function get stUserBaseInfo() : a_2729
      {
         var userBaseInfo:a_2729 = new a_2729();
         userBaseInfo.uin = this.m_iUin;
         userBaseInfo.szUID = this.m_szAccount;
         userBaseInfo.szNick = this.m_szPlayerName;
         userBaseInfo.unIdentity = this.m_iIdentity;
         userBaseInfo.nFlag = this.m_nFlag;
         userBaseInfo.stFace.byFaceType = this.m_byIconType;
         userBaseInfo.stFace.szFaceURL = this.m_szIconURL;
         userBaseInfo.stFace.szFaceURL50 = this.m_szFaceURL50;
         userBaseInfo.stFace.szFaceURL130 = this.m_szFaceURL130;
         userBaseInfo.stFace.szFaceVersion = this.m_szFaceVersion;
         userBaseInfo.iCharm = this.m_iCharming;
         userBaseInfo.iAchievement = this.m_iAchievement;
         userBaseInfo.iBirthday = this.m_iBirthDay;
         userBaseInfo.iHappyBean = this.m_lHappyBean;
         userBaseInfo.szZoneInfo = this.m_szZoneInfo;
         userBaseInfo.iUser51Score = this.m_i51Score;
         userBaseInfo.iUser51Level = this.m_i51Level;
         userBaseInfo.iUser51VipScore = this.m_i51VIPScore;
         userBaseInfo.iUser51VIPLevel = this.m_i51VIPLevel;
         return userBaseInfo;
      }
      
      public function get stUserGameInfo() : a_2736
      {
         var userGameInfo:a_2736 = new a_2736();
         userGameInfo.iPlayerID = this.m_iPlayerID;
         userGameInfo.iTableID = this.m_iTableID;
         userGameInfo.iSeatID = this.m_bySeat;
         userGameInfo.iStatus = this.m_byStatus;
         userGameInfo.iSitDownSequence = this.m_iSitdownSequence;
         userGameInfo.iScore = this.m_iPoint;
         userGameInfo.iWin = this.m_iWinRound;
         userGameInfo.iLost = this.m_iLoseRound;
         userGameInfo.iDraw = this.m_iDrawRound;
         userGameInfo.iEscape = this.m_iEscapeRound;
         userGameInfo.iBreak = this.m_iOfflineRound;
         userGameInfo.iMoney = this.m_iMoney;
         return userGameInfo;
      }
      
      public function encode(byte_array:ByteArray, encode_length:int) : Boolean
      {
         var start:int = int(byte_array.position);
         a_2664.encode_int16(byte_array,0);
         a_2664.encode_int32(byte_array,this.m_iUin);
         a_2664.encode_string(byte_array,this.m_szAccount,32);
         a_2664.encode_string(byte_array,this.m_szPlayerName,32);
         a_2664.encode_int16(byte_array,this.m_nFlag);
         a_2664.encode_int32(byte_array,this.m_iIdentity);
         a_2664.encode_int32(byte_array,this.m_iBirthDay);
         a_2664.encode_int8(byte_array,this.m_byIconType);
         if(Boolean(EnmFaceMask.enmFaceMask_51Picture & this.m_byIconType) || Boolean(EnmFaceMask.enmFaceMask_GamePicture & this.m_byIconType))
         {
            a_2664.encode_string(byte_array,this.m_szFaceVersion,32);
            a_2664.encode_string(byte_array,this.m_szIconURL,96);
         }
         a_2664.encode_string(byte_array,this.m_szZoneInfo,40);
         a_2664.encode_int32(byte_array,this.m_iCharming);
         a_2664.encode_int32(byte_array,this.m_iAchievement);
         a_2664.encode_int32(byte_array,this.m_lHappyBean);
         a_2664.encode_int32(byte_array,this.m_iExperiencePoint);
         a_2664.encode_int32(byte_array,this.m_i51VIPScore);
         a_2664.encode_int32(byte_array,this.m_i51Level);
         a_2664.encode_int32(byte_array,this.m_i51VIPLevel);
         a_2664.encode_int32(byte_array,this.m_iPlayerID);
         a_2664.encode_int32(byte_array,this.m_iTableID);
         if(this.m_iTableID >= 0)
         {
            a_2664.encode_int8(byte_array,this.m_bySeat);
            a_2664.encode_int8(byte_array,this.m_byStatus);
            if(EnmPlayerStatus.enmPlayerStatus_Free != this.m_byStatus && EnmPlayerStatus.enmPlayerStatus_Observing != this.m_byStatus)
            {
               a_2664.encode_int32(byte_array,this.m_iSitdownSequence);
            }
         }
         a_2664.encode_uint64(byte_array,this.m_iPoint);
         a_2664.encode_int32(byte_array,this.m_iWinRound);
         a_2664.encode_int32(byte_array,this.m_iLoseRound);
         a_2664.encode_int32(byte_array,this.m_iDrawRound);
         a_2664.encode_int32(byte_array,this.m_iEscapeRound);
         a_2664.encode_int32(byte_array,this.m_iOfflineRound);
         a_2664.encode_int32(byte_array,this.m_iMoney);
         a_2664.encode_int32(byte_array,this.m_iFlowerCount);
         if(Boolean(EnmFaceMask.enmFaceMask_51Picture & this.m_byIconType) || Boolean(EnmFaceMask.enmFaceMask_GamePicture & this.m_byIconType))
         {
            a_2664.encode_string(byte_array,this.m_szFaceURL50,96);
            a_2664.encode_string(byte_array,this.m_szFaceURL130,96);
         }
         a_2664.encode_string(byte_array,this.m_szExtraUid,32);
         a_2664.encode_int32(byte_array,this.m_iGoodId);
         a_2664.encode_int32(byte_array,this.m_iGameVIPScore);
         a_2664.encode_int32(byte_array,this.m_iGameVIPLevel);
         var current:int = int(byte_array.position);
         byte_array.position = start;
         a_2664.encode_int16(byte_array,current - start - 2);
         byte_array.position = current;
         return true;
      }
      
      public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var playerDetailSize:int = a_2664.decode_int16(byte_array);
         var start:int = int(byte_array.position);
         if(byte_array.bytesAvailable < playerDetailSize)
         {
            return false;
         }
         this.m_iUin = a_2664.decode_int32(byte_array);
         this.m_szAccount = a_2664.decode_string(byte_array,32);
         this.m_szPlayerName = a_2664.decode_string(byte_array,32);
         this.m_nFlag = a_2664.decode_int16(byte_array);
         this.m_iIdentity = a_2664.decode_int32(byte_array);
         this.m_iBirthDay = a_2664.decode_int32(byte_array);
         this.m_byIconType = a_2664.decode_int8(byte_array);
         if(Boolean(EnmFaceMask.enmFaceMask_51Picture & this.m_byIconType) || Boolean(EnmFaceMask.enmFaceMask_GamePicture & this.m_byIconType))
         {
            this.m_szFaceVersion = a_2664.decode_string(byte_array,32);
            this.m_szIconURL = a_2664.decode_string(byte_array,96);
         }
         this.m_szZoneInfo = a_2664.decode_string(byte_array,40);
         this.m_iCharming = a_2664.decode_int32(byte_array);
         this.m_iAchievement = a_2664.decode_int32(byte_array);
         this.m_lHappyBean = a_2664.decode_int32(byte_array);
         this.m_iExperiencePoint = a_2664.decode_int32(byte_array);
         this.m_i51VIPScore = a_2664.decode_int32(byte_array);
         this.m_i51Level = a_2664.decode_int32(byte_array);
         this.m_i51VIPLevel = a_2664.decode_int32(byte_array);
         this.m_iPlayerID = a_2664.decode_int32(byte_array);
         this.m_iTableID = a_2664.decode_int32(byte_array);
         if(this.m_iTableID >= 0)
         {
            this.m_bySeat = a_2664.decode_int8(byte_array);
            this.m_byStatus = a_2664.decode_int8(byte_array);
            if(EnmPlayerStatus.enmPlayerStatus_Free != this.m_byStatus && EnmPlayerStatus.enmPlayerStatus_Observing != this.m_byStatus)
            {
               this.m_iSitdownSequence = a_2664.decode_int32(byte_array);
            }
         }
         this.m_iPoint = a_2664.decode_uint64(byte_array);
         this.m_iWinRound = a_2664.decode_int32(byte_array);
         this.m_iLoseRound = a_2664.decode_int32(byte_array);
         this.m_iDrawRound = a_2664.decode_int32(byte_array);
         this.m_iEscapeRound = a_2664.decode_int32(byte_array);
         this.m_iOfflineRound = a_2664.decode_int32(byte_array);
         this.m_iMoney = a_2664.decode_int32(byte_array);
         this.m_iFlowerCount = a_2664.decode_int32(byte_array);
         if(Boolean(EnmFaceMask.enmFaceMask_51Picture & this.m_byIconType) || Boolean(EnmFaceMask.enmFaceMask_GamePicture & this.m_byIconType))
         {
            this.m_szFaceURL50 = a_2664.decode_string(byte_array,96);
            this.m_szFaceURL130 = a_2664.decode_string(byte_array,96);
         }
         this.m_szExtraUid = a_2664.decode_string(byte_array,32);
         this.m_iGoodId = a_2664.decode_int32(byte_array);
         this.m_iGameVIPScore = a_2664.decode_int32(byte_array);
         this.m_iGameVIPLevel = a_2664.decode_int32(byte_array);
         if(byte_array.position - start > playerDetailSize)
         {
            return false;
         }
         byte_array.position = start + playerDetailSize;
         return true;
      }
      
      public function dump() : Boolean
      {
         return false;
      }
      
      public function a_2690(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var bySectionLength:int = 0;
         var propertyArray:Array = null;
         var dest_buffer:ByteArray = null;
         var nIsAdministrator:int = 0;
         var nIsGameVip:int = 0;
         var nIsCameraUser:int = 0;
         var byPlayerDetailSection:int = EnmPlayerDetailSection.enmPlayerDetailSection_Finish;
         var start:int = int(byte_array.position);
         byPlayerDetailSection = a_2664.decode_int8(byte_array);
         while(byPlayerDetailSection != EnmPlayerDetailSection.enmPlayerDetailSection_Finish)
         {
            bySectionLength = a_2664.decode_int8(byte_array);
            switch(byPlayerDetailSection)
            {
               case EnmPlayerDetailSection.enmPlayerDetailSection_Base:
                  propertyArray = [["m_byStatus","int8"],["m_iPoint","uint64"],["m_iMoney","int32"],["m_lHappyBean","int32"],["m_iCharming","int32"]];
                  break;
               case EnmPlayerDetailSection.enmPlayerDetailSection_Intrinsic:
                  this.m_iPlayerID = a_2664.decode_int32(byte_array);
                  dest_buffer = new ByteArray();
                  a_2664.decode_memory(byte_array,dest_buffer,32);
                  dest_buffer.position = 0;
                  this.m_szAccount = dest_buffer.readUTFBytes(32);
                  dest_buffer = new ByteArray();
                  a_2664.decode_memory(byte_array,dest_buffer,32);
                  dest_buffer.position = 0;
                  this.m_szPlayerName = dest_buffer.readUTFBytes(32);
                  propertyArray = [["m_nFlag","int16"],["m_byAge","int8"],["m_iBirthDay","int32"]];
                  break;
               case EnmPlayerDetailSection.enmPlayerDetailSection_Statistics:
                  propertyArray = [["m_iWinRound","int32"],["m_iLoseRound","int32"],["m_iDrawRound","int32"],["m_iEscapeRound","int32"],["m_iOfflineRound","int32"]];
                  break;
               case EnmPlayerDetailSection.enmPlayerDetailSection_Identity:
                  nIsAdministrator = a_2664.decode_int8(byte_array);
                  nIsGameVip = a_2664.decode_int8(byte_array);
                  nIsCameraUser = a_2664.decode_int8(byte_array);
                  propertyArray = null;
                  break;
               case EnmPlayerDetailSection.enmPlayerDetailSection_Table:
                  propertyArray = [["m_iTableID","int32"],["m_bySeat","int8"]];
                  break;
               case EnmPlayerDetailSection.enmPlayerDetailSection_SitdownSequence:
                  propertyArray = [["m_iSitdownSequence","int32"]];
                  break;
               case EnmPlayerDetailSection.enmPlayerDetailSection_Profile:
                  propertyArray = [["m_szIconURL","string",96]];
                  break;
               default:
                  byte_array.readUTFBytes(bySectionLength);
            }
            if(propertyArray is Array && !a_2664.a_2666(this,propertyArray,byte_array,decode_length))
            {
               return false;
            }
            if(byPlayerDetailSection == EnmPlayerDetailSection.enmPlayerDetailSection_Intrinsic)
            {
               this.m_szAccount = this.m_szAccount;
               this.m_nFlag |= this.m_nFlag;
            }
            byPlayerDetailSection = a_2664.decode_int8(byte_array);
         }
         return true;
      }
   }
}

