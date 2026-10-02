package a_4770
{
   import a_4716.b_101;
   import a_4716.b_154;
   import a_4717.EnmEnterTableMode;
   import a_4717.EnmGameInitializeDataType;
   import a_4717.EnmProxyCmd;
   import a_4717.EnmRankingDataType;
   import a_4717.EnmSendToGameDataType;
   import a_4726.a_1770;
   import a_4728.a_1778;
   import a_4729.EventType;
   import a_4729.a_1789;
   import a_4759.b_167;
   import a_4760.a_2256;
   import a_4763.a_2445;
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.a_2670;
   import com.aurora.protocol.common.a_2671;
   import com.aurora.protocol.friend.a_2673;
   import com.aurora.protocol.friend.a_2674;
   import com.aurora.protocol.game.CPlayerDetail;
   import com.aurora.protocol.logicserver.CGameEvent;
   import com.aurora.protocol.logicserver.a_2902;
   import com.aurora.protocol.logicserver.a_2903;
   import com.aurora.protocol.logicserver.a_2904;
   import com.aurora.protocol.logicserver.a_2905;
   import com.aurora.protocol.logicserver.a_2906;
   import com.aurora.protocol.logicserver.a_2907;
   import com.aurora.protocol.match.a_2975;
   import flash.events.IEventDispatcher;
   import flash.utils.ByteArray;
   
   public class b_178 extends b_167
   {
      
      private static var a_850:b_178;
      
      public function b_178(target:IEventDispatcher = null)
      {
         super(target);
         a_2247(b_154.a_161,this.a_2637);
         a_2247(b_154.a_146,this.a_2638);
         a_2247(b_154.a_154,this.a_2639);
         a_2247(b_154.a_239,this.a_2641);
         a_2247(b_154.a_133,this.a_2642);
         a_2247(b_154.a_160,this.a_2640);
         a_2247(b_154.a_240,this.a_2589);
         a_2247(b_154.a_165,this.a_2643);
         a_2247(b_154.a_163,this.a_2644);
         a_2247(b_154.a_136,this.a_2645);
         a_2247(b_154.a_142,this.a_2646);
      }
      
      public static function getInstance() : b_178
      {
         if(null == a_850)
         {
            a_850 = new b_178();
         }
         return a_850;
      }
      
      public function a_2637(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var notifyCallPlayer:a_2902 = new a_2902();
         if(notifyCallPlayer.decode(protocalBuffer,decode_length))
         {
            trace(notifyCallPlayer);
         }
      }
      
      public function a_2638(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
      }
      
      public function a_2639(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var gameDataNotify:a_2903 = null;
         var decode_length:int = 0;
         var lgBodyBuffer:ByteArray = null;
         var gameEvent:CGameEvent = null;
         gameDataNotify = new a_2903();
         if(!gameDataNotify.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CNotifyGameData failed.");
            return;
         }
         var connInfo:a_1770 = new a_1770();
         connInfo.m_iServerID = a_787.m_iServerID;
         connInfo.m_iGameID = a_2256.getInstance().a_2259(a_787.m_iServerID,gameDataNotify.m_iRoomID);
         connInfo.m_iRoomID = gameDataNotify.m_iRoomID;
         connInfo.m_iTableID = gameDataNotify.m_iTableID;
         var lobbyHandler:a_2445 = a_2445.getLobbyAdapterHandlerByConnInfo(connInfo);
         if(null == lobbyHandler)
         {
            trace("Error: lobbyHandler[serverID:" + connInfo.m_iServerID + ", RoomID:" + connInfo.m_iRoomID + "] is null OnGameDataNotify failed");
            return;
         }
         var glPackageHeader:a_2671 = new a_2671();
         glPackageHeader.shMessageID = b_101.a_464;
         for each(gameEvent in gameDataNotify.m_stGameEvents)
         {
            lgBodyBuffer = new ByteArray();
            lgBodyBuffer.writeBytes(gameEvent.m_szGameData,0,gameEvent.m_szGameData.length);
            lobbyHandler.a_2456(glPackageHeader,lgBodyBuffer);
         }
      }
      
      public function a_2640(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var szGameData:ByteArray = null;
         var rankData:Array = null;
         var byDataType:int = 0;
         var matchInfoSize:* = 0;
         var iPlayerId:int = 0;
         var iScore:int = 0;
         var nickName:String = null;
         var gameDataNotify:a_2903 = new a_2903();
         if(!gameDataNotify.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CNotifyGameData failed.");
            return;
         }
         var connInfo:a_1770 = new a_1770();
         connInfo.m_iServerID = a_787.m_iServerID;
         connInfo.m_iGameID = a_2256.getInstance().a_2259(a_787.m_iServerID,gameDataNotify.m_iRoomID);
         connInfo.m_iRoomID = gameDataNotify.m_iRoomID;
         connInfo.m_iTableID = gameDataNotify.m_iTableID;
         var lobbyHandler:a_2445 = a_2445.getLobbyAdapterHandlerByConnInfo(connInfo);
         if(null == lobbyHandler)
         {
            trace("Error: lobbyHandler[serverID:" + connInfo.m_iServerID + ", RoomID:" + connInfo.m_iRoomID + "] is null OnRankingDataNotify failed.");
            return;
         }
         var gameEvent:CGameEvent = gameDataNotify.m_stGameEvents[0];
         if(null != gameEvent && gameEvent.m_szGameData is ByteArray)
         {
            szGameData = gameEvent.m_szGameData;
            szGameData.position = 0;
            byDataType = a_2664.decode_int8(szGameData);
            switch(byDataType)
            {
               case EnmRankingDataType.enm_player_rank_all:
                  rankData = new Array();
                  rankData["type"] = EnmRankingDataType.enm_player_rank_all;
                  matchInfoSize = a_2664.decode_int32(szGameData);
                  while(matchInfoSize-- > 0)
                  {
                     iPlayerId = a_2664.decode_int32(szGameData);
                     iScore = a_2664.decode_int32(szGameData);
                     nickName = a_2664.decode_string(szGameData,500);
                     rankData.push([iPlayerId,iScore,nickName]);
                  }
                  lobbyHandler.a_2467(rankData);
                  break;
               case EnmRankingDataType.enm_player_rank_part:
                  rankData = new Array();
                  rankData["type"] = EnmRankingDataType.enm_player_rank_part;
                  matchInfoSize = a_2664.decode_int32(szGameData);
                  while(matchInfoSize-- > 0)
                  {
                     iPlayerId = a_2664.decode_int32(szGameData);
                     iScore = a_2664.decode_int32(szGameData);
                     rankData.push([iPlayerId,iScore]);
                  }
                  lobbyHandler.a_2467(rankData);
                  break;
               case EnmRankingDataType.enm_player_rank_kicked:
                  rankData = new Array();
                  rankData["type"] = EnmRankingDataType.enm_player_rank_kicked;
                  matchInfoSize = a_2664.decode_int32(szGameData);
                  while(matchInfoSize-- > 0)
                  {
                     iPlayerId = a_2664.decode_int32(szGameData);
                     rankData.push([iPlayerId]);
                  }
                  lobbyHandler.a_2467(rankData);
            }
         }
      }
      
      public function a_2641(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var connInfo:a_1770 = null;
         var lobbyHandler:a_2445 = null;
         var glPackageHeader:a_2671 = null;
         var lgBodyBuffer:ByteArray = null;
         var stMysPlayerDetail:CPlayerDetail = null;
         var encode_length:int = 0;
         var stOtherPlayerDetail:CPlayerDetail = null;
         var iMatchID:int = 0;
         var szMatchName:String = null;
         var dataEvent:a_1778 = null;
         var replayNotify:a_2906 = new a_2906();
         if(!replayNotify.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CNotifyReplay failed.");
            return;
         }
         if(0 == replayNotify.m_nResultID)
         {
            connInfo = new a_1770();
            connInfo.m_iServerID = a_787.m_iServerID;
            connInfo.m_iGameID = a_2256.getInstance().a_2259(a_787.m_iServerID,replayNotify.m_iRoomID);
            connInfo.m_iRoomID = replayNotify.m_iRoomID;
            connInfo.m_iTableID = replayNotify.m_iTableID;
            lobbyHandler = a_2445.getInstance(connInfo);
            glPackageHeader = new a_2671();
            glPackageHeader.shMessageID = b_101.a_446;
            lgBodyBuffer = new ByteArray();
            a_2664.encode_int8(lgBodyBuffer,2);
            a_2664.encode_int8(lgBodyBuffer,EnmGameInitializeDataType.enmGameInitializeDataType_MyPlayerDetail);
            stMysPlayerDetail = a_2445.a_2449(replayNotify.m_iRoomID);
            if(null == stMysPlayerDetail)
            {
               trace("Error Can not GetMyPlayerDetail for RoomID:[" + replayNotify.m_iRoomID + "] failed");
               stMysPlayerDetail = new CPlayerDetail();
            }
            stMysPlayerDetail.m_iTableID = replayNotify.m_iTableID;
            stMysPlayerDetail.m_bySeat = replayNotify.m_bySeatID;
            trace("Decode replayNotify replayNotify.m_iTableID:[" + replayNotify.m_iTableID + "], replayNotify.m_bySeatID:[" + replayNotify.m_bySeatID + "]");
            if(null != stMysPlayerDetail)
            {
               stMysPlayerDetail.encode(lgBodyBuffer,encode_length);
               a_2664.encode_int8(lgBodyBuffer,EnmGameInitializeDataType.enmGameInitializeDataType_GameFlag);
               a_2664.encode_int8(lgBodyBuffer,EnmEnterTableMode.enmEnterTableMode_Replay);
               lobbyHandler.a_2456(glPackageHeader,lgBodyBuffer);
            }
            glPackageHeader.shMessageID = b_101.a_447;
            lgBodyBuffer = new ByteArray();
            a_2664.encode_int8(lgBodyBuffer,replayNotify.m_stPlayers.length);
            for each(stOtherPlayerDetail in replayNotify.m_stPlayers)
            {
               stOtherPlayerDetail.encode(lgBodyBuffer,encode_length);
            }
            lobbyHandler.a_2456(glPackageHeader,lgBodyBuffer);
            glPackageHeader.shMessageID = b_101.a_487;
            iMatchID = int(a_2445.a_821[replayNotify.m_iRoomID]);
            szMatchName = a_2256.getInstance().a_2260(a_787.m_iServerID,iMatchID);
            lgBodyBuffer = new ByteArray();
            a_2664.encode_int8(lgBodyBuffer,EnmProxyCmd.a_401);
            a_2664.encode_int32(lgBodyBuffer,EnmSendToGameDataType.enm_match_name);
            a_2664.encode_int32(lgBodyBuffer,iMatchID);
            a_2664.encode_string(lgBodyBuffer,szMatchName,100);
            lobbyHandler.a_2456(glPackageHeader,lgBodyBuffer);
            dataEvent = new a_1778(EventType.a_577);
            dataEvent.dataObject = connInfo;
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
         else
         {
            trace("重回失败:" + replayNotify.m_szReasonMsg);
         }
      }
      
      public function a_2642(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var roomEventNotify:a_2907 = new a_2907();
         if(!roomEventNotify.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CNotifyRoomEvent failed.");
            return;
         }
         if(roomEventNotify.m_arrRoomEvents.length > 0)
         {
            dataEvent = new a_1778(EventType.a_637);
            dataEvent.dataObject = roomEventNotify.m_arrRoomEvents;
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
      }
      
      public function a_2589(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var beKickedNotify:a_2905 = new a_2905();
         if(!beKickedNotify.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CNotifyPlayerBeKicked failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_663);
         dataEvent.dataObject = beKickedNotify;
         a_1789.getInstance().dispatchEvent(dataEvent);
         var connInfo:a_1770 = new a_1770();
         connInfo.m_iServerID = a_787.m_iServerID;
         connInfo.m_iGameID = a_2256.getInstance().a_2259(a_787.m_iServerID,beKickedNotify.m_iRoomID);
         connInfo.m_iRoomID = beKickedNotify.m_iRoomID;
         var lobbyHandler:a_2445 = a_2445.getLobbyAdapterHandlerByConnInfo(connInfo);
         if(null == lobbyHandler)
         {
            trace("Error: lobbyHandler[serverID:" + connInfo.m_iServerID + ", RoomID:" + connInfo.m_iRoomID + "] is null OnBeKickedNotify failed");
            return;
         }
         var glPackageHeader:a_2671 = new a_2671();
         glPackageHeader.shMessageID = b_101.a_487;
         var lgBodyBuffer:ByteArray = new ByteArray();
         a_2664.encode_int8(lgBodyBuffer,EnmProxyCmd.a_401);
         a_2664.encode_int32(lgBodyBuffer,EnmSendToGameDataType.enm_player_standup);
         lobbyHandler.a_2456(glPackageHeader,lgBodyBuffer);
      }
      
      public function a_2643(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var roomMessageNotify:a_2674 = new a_2674();
         if(!roomMessageNotify.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CNotifyRoomMessage failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_617);
         dataEvent.dataObject = roomMessageNotify.m_szMessage;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function a_2644(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var notify:a_2673 = new a_2673();
         if(!notify.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CNotifyMessageOnTable failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_618);
         dataEvent.dataObject = notify.m_szMessage;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function a_2645(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var notify:a_2904 = new a_2904();
         if(!notify.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode OnGameStateNotify failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_603);
         dataEvent.dataObject = notify.m_byGameState;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function a_2646(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var notify:a_2975 = new a_2975();
         if(!notify.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode OnGameStateNotify failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_698);
         dataEvent.dataObject = notify;
         a_1789.getInstance().dispatchEvent(dataEvent);
         dataEvent = new a_1778(EventType.Notfiy_MiBaoKuGameData);
         dataEvent.dataObject = notify;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
   }
}

