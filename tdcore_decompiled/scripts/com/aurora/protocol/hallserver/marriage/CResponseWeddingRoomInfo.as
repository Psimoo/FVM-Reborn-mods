package com.aurora.protocol.hallserver.marriage
{
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.hallserver.CResponseBase;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   
   public class CResponseWeddingRoomInfo extends CResponseBase
   {
      
      public var m_iUin:int;
      
      public var m_iIsWeddingCeremony:int;
      
      public var m_stWeddingInfoItem:WeddingInfoItem;
      
      public var m_iCreatorSex:int;
      
      public var m_iPlayerNum:int;
      
      public var m_vPlayers:Vector.<CWeddingRoomPlayer>;
      
      public var m_iWelfareTypeCnt:int;
      
      public var m_vWelfareSendCnt:Vector.<int>;
      
      public var m_vWelfareBeGotCnt:Vector.<int>;
      
      public var m_iFireworkTypeCnt:int;
      
      public var m_vFireworkSendCnt:Vector.<int>;
      
      public var m_vLastSendFireworkTimeStamp:Vector.<int>;
      
      public var m_iLastSendBarrageTimeStamp:int;
      
      public var m_iCurServerTimeStamp:int;
      
      public var m_dictPalyersSeat:Dictionary;
      
      public var m_dictManager:Dictionary;
      
      public var m_dictUinToPlayer:Dictionary;
      
      public function CResponseWeddingRoomInfo()
      {
         super();
         this.m_stWeddingInfoItem = new WeddingInfoItem();
         this.m_vPlayers = new Vector.<CWeddingRoomPlayer>();
         this.m_vWelfareSendCnt = new Vector.<int>();
         this.m_vWelfareBeGotCnt = new Vector.<int>();
         this.m_vFireworkSendCnt = new Vector.<int>();
         this.m_vLastSendFireworkTimeStamp = new Vector.<int>();
      }
      
      override public function decode(byte_array:ByteArray, decode_length:int) : Boolean
      {
         var iLen:int = 0;
         var i:int = 0;
         m_nResultID = a_2664.decode_int16(byte_array);
         this.m_dictPalyersSeat = new Dictionary(true);
         this.m_dictManager = new Dictionary(true);
         this.m_dictUinToPlayer = new Dictionary(true);
         if(0 == m_nResultID)
         {
            this.m_iUin = a_2664.decode_int32(byte_array);
            this.m_iIsWeddingCeremony = a_2664.decode_int8(byte_array);
            this.m_stWeddingInfoItem.decode(byte_array,iLen);
            this.m_iPlayerNum = a_2664.decode_int8(byte_array);
            this.m_vPlayers.length = this.m_iPlayerNum;
            for(i = 0; i < this.m_iPlayerNum; i++)
            {
               if(null == this.m_vPlayers[i])
               {
                  this.m_vPlayers[i] = new CWeddingRoomPlayer();
               }
               this.m_vPlayers[i].decode(byte_array,iLen);
               this.AddPlayerInfo(this.m_vPlayers[i]);
            }
            this.m_iWelfareTypeCnt = a_2664.decode_int8(byte_array);
            this.m_vWelfareSendCnt.length = this.m_iWelfareTypeCnt;
            for(i = 0; i < this.m_iWelfareTypeCnt; i++)
            {
               this.m_vWelfareSendCnt[i] = a_2664.decode_int16(byte_array);
            }
            this.m_vWelfareBeGotCnt.length = this.m_iWelfareTypeCnt;
            for(i = 0; i < this.m_iWelfareTypeCnt; i++)
            {
               this.m_vWelfareBeGotCnt[i] = a_2664.decode_int16(byte_array);
            }
            this.m_iFireworkTypeCnt = a_2664.decode_int8(byte_array);
            this.m_vFireworkSendCnt.length = this.m_iFireworkTypeCnt;
            for(i = 0; i < this.m_iFireworkTypeCnt; i++)
            {
               this.m_vFireworkSendCnt[i] = a_2664.decode_int16(byte_array);
            }
            this.m_vLastSendFireworkTimeStamp.length = this.m_iFireworkTypeCnt;
            for(i = 0; i < this.m_iFireworkTypeCnt; i++)
            {
               this.m_vLastSendFireworkTimeStamp[i] = a_2664.decode_int32(byte_array);
            }
            this.m_iLastSendBarrageTimeStamp = a_2664.decode_int32(byte_array);
            this.m_iCurServerTimeStamp = a_2664.decode_int32(byte_array);
         }
         return true;
      }
      
      public function GetPlayerInfoByUin(iUin:int) : Object
      {
         return this.m_dictUinToPlayer[iUin];
      }
      
      public function UpdatePlayerInfo(iUin:int, strProperty:String, iValue:*) : void
      {
         if(null == this.m_dictUinToPlayer[iUin])
         {
            throw Error("UpdatePlayerSeat->m_dictUinToPlayer[" + iUin + "] is null!!!");
         }
         var stPlayer:Object = this.m_dictUinToPlayer[iUin];
         var iOrginiValue:* = stPlayer[strProperty];
         stPlayer[strProperty] = iValue;
         if("m_iSeat" == strProperty)
         {
            if(null == this.m_dictPalyersSeat[iOrginiValue])
            {
               throw Error("UpdatePlayerSeat->m_dictPalyersSeat[" + iOrginiValue + "] is null!!!");
            }
            delete this.m_dictPalyersSeat[iOrginiValue];
            this.m_dictPalyersSeat[iValue] = stPlayer;
         }
      }
      
      public function RemovePlayerInfo(iUin:int) : int
      {
         if(null == this.m_dictUinToPlayer[iUin])
         {
            throw Error("RemovePlayerInfo->m_dictUinToPlayer[" + iUin + "] is null!!!");
         }
         var stPlayer:Object = this.m_dictUinToPlayer[iUin];
         delete this.m_dictUinToPlayer[iUin];
         var iSeatID:int = int(stPlayer.m_iSeat);
         var iSex:int = int(stPlayer.m_iSex);
         if(iSeatID > 0)
         {
            if(null == this.m_dictPalyersSeat[iSeatID])
            {
               throw Error("RemovePlayerInfo->m_dictPalyersSeat[" + iSeatID + "] is null!!!");
            }
            delete this.m_dictPalyersSeat[iSeatID];
         }
         else
         {
            if(null == this.m_dictManager[iSex])
            {
               throw Error("RemovePlayerInfo->m_dictManager[" + iSex + "] is null!!!");
            }
            delete this.m_dictManager[iSex];
         }
         return iSeatID;
      }
      
      public function AddPlayerInfo(stPlayer:Object) : void
      {
         if(stPlayer.m_iUin == this.m_stWeddingInfoItem.m_iCreatorUin)
         {
            this.m_iCreatorSex = stPlayer.m_iSex;
         }
         this.m_dictUinToPlayer[stPlayer.m_iUin] = stPlayer;
         var iSeatID:int = int(stPlayer.m_iSeat);
         if(iSeatID > 0)
         {
            if(null != this.m_dictPalyersSeat[iSeatID])
            {
               throw Error("AddPlayerInfo->m_dictPalyersSeat[" + iSeatID + "] isn\'t null!!!");
            }
            this.m_dictPalyersSeat[iSeatID] = stPlayer;
         }
         else
         {
            if(null != this.m_dictManager[stPlayer.m_iSex])
            {
               throw Error("AddPlayerInfo->m_dictManager[" + stPlayer.m_iSex + "] isn\'t null!!!");
            }
            this.m_dictManager[stPlayer.m_iSex] = stPlayer;
         }
      }
   }
}

