package a_4770
{
   import a_4716.b_101;
   import a_4716.b_154;
   import a_4717.EnmEnterTableMode;
   import a_4717.EnmGameInitializeDataType;
   import a_4717.EnmProxyCmd;
   import a_4717.EnmSendToGameDataType;
   import a_4726.a_1770;
   import a_4728.a_1778;
   import a_4729.EventType;
   import a_4729.a_1789;
   import a_4731.CommonEvent;
   import a_4752.a_2033;
   import a_4754.a_2161;
   import a_4759.b_167;
   import a_4760.a_2256;
   import a_4763.a_2439;
   import a_4763.a_2445;
   import a_4771.a_2650;
   import a_4788.a_4648;
   import a_4789.a_4657;
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.a_2670;
   import com.aurora.protocol.common.a_2671;
   import com.aurora.protocol.friend.a_2681;
   import com.aurora.protocol.friend.a_2682;
   import com.aurora.protocol.friend.a_2688;
   import com.aurora.protocol.friend.a_2689;
   import com.aurora.protocol.game.CPlayerDetail;
   import com.aurora.protocol.hallserver.CRequestGetClimbTowerRank;
   import com.aurora.protocol.hallserver.CResponseGetClimbTowerRank;
   import com.aurora.protocol.hallserver.mota.CRequestGetTowRankInfo;
   import com.aurora.protocol.hallserver.mota.CRequestGetTwoPataCount;
   import com.aurora.protocol.hallserver.mota.CResponseGetTowRankInfo;
   import com.aurora.protocol.hallserver.mota.CResponseGetTwoPataCount;
   import com.aurora.protocol.hallserver.mota.CResponseGetTwoPataLevel;
   import com.aurora.protocol.hallserver.mota.CResponseGetTwoPataRank;
   import com.aurora.protocol.hallserver.worldBoss.CCSRequestCheckWorldBossPlayerInfo;
   import com.aurora.protocol.hallserver.worldBoss.CCSRequestGetWorldBossInfo;
   import com.aurora.protocol.hallserver.worldBoss.CCSRequestGetWorldBossMap;
   import com.aurora.protocol.hallserver.worldBoss.CCSRequestGetWorldBossRank;
   import com.aurora.protocol.hallserver.worldBoss.CCSResponseCheckWorldBossPlayerInfo;
   import com.aurora.protocol.hallserver.worldBoss.CCSResponseGetWorldBossInfo;
   import com.aurora.protocol.hallserver.worldBoss.CCSResponseGetWorldBossMap;
   import com.aurora.protocol.hallserver.worldBoss.CCSResponseGetWorldBossRank;
   import com.aurora.protocol.hallserver.worldBoss.CRequestGetWorldBossRecord;
   import com.aurora.protocol.hallserver.worldBoss.CRequestGetWorldBossSummary;
   import com.aurora.protocol.hallserver.worldBoss.CRequestMsgWorldBossSkip;
   import com.aurora.protocol.hallserver.worldBoss.CResponseGetWorldBossRecord;
   import com.aurora.protocol.hallserver.worldBoss.CResponseGetWorldBossSummary;
   import com.aurora.protocol.hallserver.worldBoss.CResponseMsgWorldBossSkip;
   import com.aurora.protocol.logicserver.CNotifySendChatMsg;
   import com.aurora.protocol.logicserver.CRequestSendChatMsg;
   import com.aurora.protocol.logicserver.CResponseSendChatMsg;
   import com.aurora.protocol.logicserver.a_2911;
   import com.aurora.protocol.logicserver.a_2912;
   import com.aurora.protocol.logicserver.a_2916;
   import com.aurora.protocol.logicserver.a_2917;
   import com.aurora.protocol.logicserver.a_2927;
   import com.aurora.protocol.logicserver.a_2928;
   import com.aurora.protocol.logicserver.a_2936;
   import com.aurora.protocol.logicserver.a_2941;
   import com.aurora.protocol.logicserver.a_2942;
   import com.aurora.protocol.logicserver.a_2943;
   import com.aurora.protocol.logicserver.a_2951;
   import com.aurora.protocol.logicserver.a_2952;
   import com.aurora.protocol.logicserver.a_2953;
   import com.aurora.protocol.logicserver.a_2954;
   import com.aurora.protocol.logicserver.a_2955;
   import com.aurora.protocol.logicserver.a_2956;
   import com.aurora.protocol.logicserver.a_2961;
   import com.aurora.protocol.logicserver.crossserver.CCSRequestCrossDropCount;
   import com.aurora.protocol.logicserver.crossserver.CCSResponseCrossDropCount;
   import com.aurora.protocol.logicserver.crossserver.CNotifyCrossTableCreate;
   import com.aurora.protocol.logicserver.crossserver.CNotifyCrossTableStatusChange;
   import com.aurora.protocol.logicserver.crossserver.CNotifyPlayerGroupInfo;
   import com.aurora.protocol.logicserver.crossserver.CRequestCrossGetTableInfo;
   import com.aurora.protocol.logicserver.crossserver.CRequestCrossRoomList;
   import com.aurora.protocol.logicserver.crossserver.CResponseCrossGameResultGet;
   import com.aurora.protocol.logicserver.crossserver.CResponseCrossGetTableInfo;
   import com.aurora.protocol.logicserver.crossserver.CResponseCrossRoomList;
   import com.aurora.protocol.logicserver.crossserver.RequestGameResult;
   import com.aurora.protocol.logicserver.diy.CCSRequestAppraiseDIYMap;
   import com.aurora.protocol.logicserver.diy.CCSRequestReceiveDIYCoin;
   import com.aurora.protocol.logicserver.diy.CCSResponseAppraiseDIYMap;
   import com.aurora.protocol.logicserver.diy.CCSResponseReceiveDIYCoin;
   import com.aurora.protocol.logicserver.diy.CRequestDiyCreateMap;
   import com.aurora.protocol.logicserver.diy.CRequestDiyDelMap;
   import com.aurora.protocol.logicserver.diy.CRequestDiyGetMapInfo;
   import com.aurora.protocol.logicserver.diy.CRequestDiyGetMapList;
   import com.aurora.protocol.logicserver.diy.CRequestDiyGetMapWave;
   import com.aurora.protocol.logicserver.diy.CRequestDiyGetSelfMap;
   import com.aurora.protocol.logicserver.diy.CRequestDiyPublishMap;
   import com.aurora.protocol.logicserver.diy.CRequestDiyUpdateMapInfo;
   import com.aurora.protocol.logicserver.diy.CRequestDiyUpdateMapWave;
   import com.aurora.protocol.logicserver.diy.CRequestGetDiyPlayerMapData;
   import com.aurora.protocol.logicserver.diy.CRequestGetDiyStoreInfo;
   import com.aurora.protocol.logicserver.diy.CRequestGetDiyTerrain;
   import com.aurora.protocol.logicserver.diy.CRequestUpdateDiyTerrain;
   import com.aurora.protocol.logicserver.diy.CResponseDiyCreateMap;
   import com.aurora.protocol.logicserver.diy.CResponseDiyDelMap;
   import com.aurora.protocol.logicserver.diy.CResponseDiyGetMapInfo;
   import com.aurora.protocol.logicserver.diy.CResponseDiyGetMapList;
   import com.aurora.protocol.logicserver.diy.CResponseDiyGetMapMouse;
   import com.aurora.protocol.logicserver.diy.CResponseDiyGetMapWave;
   import com.aurora.protocol.logicserver.diy.CResponseDiyGetSelfMap;
   import com.aurora.protocol.logicserver.diy.CResponseDiyPublishMap;
   import com.aurora.protocol.logicserver.diy.CResponseDiyUpdateMapInfo;
   import com.aurora.protocol.logicserver.diy.CResponseDiyUpdateMapWave;
   import com.aurora.protocol.logicserver.diy.CResponseGetDiyPlayerMapData;
   import com.aurora.protocol.logicserver.diy.CResponseGetDiyStoreInfo;
   import com.aurora.protocol.logicserver.diy.CResponseGetDiyTerrain;
   import com.aurora.protocol.logicserver.diy.CResponseUpdateDiyTerrain;
   import com.aurora.protocol.match.a_2976;
   import com.aurora.ui.maogoutd.role.a_4463;
   import com.u321.go.xutils.ObjectPool;
   import flash.events.IEventDispatcher;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   
   public class b_177 extends b_167
   {
      
      private static var a_848:b_177;
      
      public function b_177(target:IEventDispatcher = null)
      {
         super(target);
         a_2247(b_154.a_148,this.a_2621);
         a_2247(b_154.MSG_CROSS_SITDOWN,this.a_2621);
         a_2247(b_154.a_149,this.a_2622);
         a_2247(b_154.a_153,this.a_2623);
         a_2247(b_154.a_152,this.a_2624);
         a_2247(b_154.a_215,this.a_2352);
         a_2247(b_154.a_135,this.a_2625);
         a_2247(b_154.a_218,this.a_2353);
         a_2247(b_154.a_220,this.a_2626);
         a_2247(b_154.a_162,this.a_2628);
         a_2247(b_154.a_131,this.a_2629);
         a_2247(b_154.a_137,this.a_2630);
         a_2247(b_154.MSG_LOGIC_GET_CLIMB_TOWER_RANK,this.OnResponseGetClimbTowerRank);
         a_2247(b_154.MSG_LOGIC_SEND_CROSS_CHAT_MSG,this.OnCResponseSendChatMsg);
         a_2247(b_154.MSG_LOGIC_NOTIFY_CROSS_CHAT_MSG,this.OnCNotifySendChatMsg);
         a_2247(b_154.MSG_CROSS_ROOM_LIST,this.OnCResponseCrossRoomList);
         a_2247(b_154.MSG_CROSS_MAP_INFO,this.OnCResponseCrossGameResultGet);
         a_2247(b_154.MSG_NOTIFY_CROSS_TABLE_STATUS_CHANGE,this.OnCNotifyCrossTableStatusChange);
         a_2247(b_154.MSG_CROSS_NOTIFY_TABLE_CREATE,this.OnCNotifyCrossTableCreate);
         a_2247(b_154.MSG_CROSS_DROP_COUNT,this.OnCCSResponseCrossDropCount);
         a_2247(b_154.MSG_NOTIFY_CROSS_PLAYER_GROUP_INFO,this.OnCNotifyPlayerGroupInfo);
         a_2247(b_154.MSG_CROSS_GET_TABLE_INFO,this.OnCResponseCrossGetTableInfo);
         a_2247(b_154.MSG_DIY_GET_SELF_MAP,this.OnCResponseDiyGetSelfMap);
         a_2247(b_154.MSG_DIY_STORE_INFO,this.OnCResponseGetDiyStoreInfo);
         a_2247(b_154.MSG_DIY_CREATE_MAP,this.OnCResponseDiyCreateMap);
         a_2247(b_154.MSG_DIY_GET_MAP_INFO,this.OnCResponseDiyGetMapInfo);
         a_2247(b_154.MSG_DIY_UPDATE_MAP_INFO,this.OnCResponseDiyUpdateMapInfo);
         a_2247(b_154.MSG_DIY_UPDATE_MAP_WAVE,this.OnCResponseDiyUpdateMapWave);
         a_2247(b_154.MSG_DIY_GET_MAP_WAVE,this.OnCResponseDiyGetMapWave);
         a_2247(b_154.MSG_DIY_PUBLISH_MAP,this.OnCResponseDiyPublishMap);
         a_2247(b_154.MSG_DIY_DEL_MAP,this.OnCResponseDiyDelMap);
         a_2247(b_154.MSG_DIY_GET_MAP_LIST,this.OnCResponseDiyGetMapList);
         a_2247(b_154.MSG_DIY_GET_PLAYER_MAP_DATA,this.OnCResponseGetDiyPlayerMapData);
         a_2247(b_154.MSG_NOTIFY_DIY_MAP_INFO,this.OnCResponseNotifyDiyMapInfo);
         a_2247(b_154.MSG_NOTIFY_DIY_MAP_MOUSE,this.OnCResponseNotifyDiyMapMouse);
         a_2247(b_154.MSG_DIY_APPRAISE_MAP,this.OnCCSResponseAppraiseDIYMap);
         a_2247(b_154.MSG_DIY_RECEIVE_DIYB,this.OnCCSResponseReceiveDIYCoin);
         a_2247(b_154.MSG_DIY_GET_TERRAIN,this.OnCResponseGetDiyTerrain);
         a_2247(b_154.MSG_DIY_UPDATE_TERRAIN,this.OnCResponseUpdateDiyTerrain);
         a_2247(b_154.MSG_NOTIFY_DIY_MAP_TERRAIN,this.OnCRequestNotifyDiyTerrain);
         a_2247(b_154.MSG_GET_TWO_PATA_COUNT,this.OnCCSResponseGetTwoPataCount);
         a_2247(b_154.MSG_GET_TWO_PATA_LEVEL,this.OnCCSResponseGetTwoPataLevel);
         a_2247(b_154.MSG_GET_TWO_PATA_RANK,this.OnCCSResponseGetTwoPataRank);
         a_2247(b_154.MSG_GET_TWO_PATA_RANK_INFO,this.OnCCSResponseGetTwoPataRankInfo);
         a_2247(b_154.MSG_GET_WORLD_BOSS_INFO,this.onCCSResponseGetWorldBossInfo);
         a_2247(b_154.MSG_GET_WORLD_BOSS_RANK,this.onCCSResponseGetWorldBossRank);
         a_2247(b_154.MSG_GET_CHECK_WORLD_BOSS_PLAYER_INFO,this.onCCSResponeCheckWorldBossPlayerInfo);
         a_2247(b_154.MSG_GET_WORLDBOSS_RECORD,this.onCCSResponseGetWorldBossRecord);
         a_2247(b_154.MSG_GET_WORLDBOSS_SUMMARY,this.onCCSResponseGetWorldBossSummary);
         a_2247(b_154.MSG_WORLDBOSS_FAST_PK,this.onCCSResponseMsgWorldBossSkip);
         a_2247(b_154.MSG_REQUEST_GET_WORLDBOSS_MAP,this.onCCSResponseGetWorldBossMap);
      }
      
      public static function getInstance() : b_177
      {
         if(null == a_848)
         {
            a_848 = new b_177();
         }
         return a_848;
      }
      
      public function a_2485(iServerID:int, iRoomID:int, iTableID:int, iSeatID:int, szTableName:String = "", szTableKey:String = "", iGameMapID:Array = null, byGameMod:int = -1, iPlayerCount:int = -1, byLevel:int = 0) : Boolean
      {
         var encodeLengh:int = 0;
         var id:int = 0;
         var enterRoom:Object = a_2161.e.getEnterRoom();
         var encodeBuffer:ByteArray = new ByteArray();
         var sitdownRequest:a_2928 = new a_2928();
         sitdownRequest.m_byACT = 0;
         sitdownRequest.m_iRoomID = iRoomID;
         sitdownRequest.m_iTableID = iTableID;
         sitdownRequest.m_bySeatID = iSeatID;
         sitdownRequest.m_byCanAdjust = 0;
         sitdownRequest.m_bLevel = byLevel;
         sitdownRequest.m_szTableKey = szTableKey;
         sitdownRequest.m_szTableName = szTableName;
         sitdownRequest.m_iFcm = 0;
         if(iGameMapID == null || iGameMapID.length == 0)
         {
            sitdownRequest.m_iGameMapID = -1;
            iGameMapID = [];
         }
         else
         {
            sitdownRequest.m_iGameMapID = iGameMapID[0];
         }
         var bCrossServer:Boolean = Boolean((byGameMod & 0x010000) == 65536);
         byGameMod &= 65535;
         sitdownRequest.m_byGameMod = byGameMod;
         sitdownRequest.m_byPlayerCount = iPlayerCount;
         this.mapIDFormat(iGameMapID,a_2928.a_868);
         sitdownRequest.m_nMapListCount = iGameMapID.length;
         sitdownRequest.m_aryMapList = iGameMapID;
         sitdownRequest.encode(encodeBuffer,encodeLengh);
         sitdownRequest = null;
         var logicConn:a_2650 = a_2256.getInstance().a_2258(iServerID);
         a_4648.a_4649("SitDown.ip=" + logicConn.host + ",iServerID=" + iServerID + ",iRoomID=" + iRoomID + ",iTableID=" + iTableID + ",szTableName=" + szTableName + ",iSeatID" + iSeatID + ",byGameMod=" + byGameMod + ",byLevel=" + byLevel + ",time=" + getTimer());
         if(iGameMapID != null)
         {
            for each(id in iGameMapID)
            {
               a_4648.a_4649("iGameMapID=" + id);
            }
         }
         if(bCrossServer)
         {
            return pBaseProtocol.a_2201(logicConn,b_154.MSG_CROSS_SITDOWN,encodeBuffer);
         }
         return pBaseProtocol.a_2201(logicConn,b_154.a_148,encodeBuffer);
      }
      
      private function mapIDFormat(maps:Array, maxSize:int) : void
      {
         var id:int = 0;
         while(maps.length > maxSize)
         {
            id = int(Math.random() * (maps.length - 1));
            maps.splice(id,1);
         }
      }
      
      public function a_2616(iServerID:int, iRoomID:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var getTableInfoRequest:a_2917 = new a_2917();
         getTableInfoRequest.m_iRoomID = iRoomID;
         getTableInfoRequest.m_iRequiredTableStart = -1;
         getTableInfoRequest.m_iRequiredTableEnd = -1;
         getTableInfoRequest.encode(encodeBuffer,encodeLengh);
         getTableInfoRequest = null;
         var logicConn:a_2650 = a_2256.getInstance().a_2258(iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.a_135,encodeBuffer);
      }
      
      public function a_2476(iServerID:int, iRoomID:int, iTableID:int, iSeatID:int, seatStatus:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var requestSetSeatState:a_2927 = new a_2927();
         requestSetSeatState.m_iRoomID = iRoomID;
         requestSetSeatState.m_iTableID = iTableID;
         requestSetSeatState.m_bSeatID = iSeatID;
         requestSetSeatState.m_bState = seatStatus;
         requestSetSeatState.encode(encodeBuffer,encodeLengh);
         requestSetSeatState = null;
         var logicConn:a_2650 = a_2256.getInstance().a_2258(iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.a_220,encodeBuffer);
      }
      
      public function a_2617(iServerID:int, iRoomID:int, iDstUin:int, szMessage:String) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var talkInRoomRequest:a_2681 = new a_2681();
         var stMysPlayerDetail:CPlayerDetail = a_2445.a_2449(iRoomID);
         talkInRoomRequest.m_iDstPlayerID = stMysPlayerDetail.m_iPlayerID;
         talkInRoomRequest.m_iDstUin = iDstUin;
         talkInRoomRequest.m_iRoomID = iRoomID;
         talkInRoomRequest.m_szMessage = szMessage;
         talkInRoomRequest.encode(encodeBuffer,encodeLengh);
         talkInRoomRequest = null;
         var logicConn:a_2650 = a_2256.getInstance().a_2258(iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.a_164,encodeBuffer);
      }
      
      public function a_2618(iServerID:int, iRoomID:int, iTableID:int, szMessage:String) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var talkOnTalbeRequest:a_2682 = new a_2682();
         talkOnTalbeRequest.m_iTableID = iTableID;
         talkOnTalbeRequest.m_iRoomID = iRoomID;
         talkOnTalbeRequest.m_szMessages = szMessage;
         talkOnTalbeRequest.encode(encodeBuffer,encodeLengh);
         talkOnTalbeRequest = null;
         var logicConn:a_2650 = a_2256.getInstance().a_2258(iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.a_162,encodeBuffer);
      }
      
      public function a_2508(iServerID:int, iRoomID:int, iNewViewStart:int, iNewViewEnd:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2936 = new a_2936();
         request.m_iRoomID = iRoomID;
         request.m_iNewViewStart = iNewViewStart;
         request.m_iNewViewEnd = iNewViewEnd;
         request.m_iRequiredTableStart = -1;
         request.m_iRequiredTableEnd = -1;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var logicConn:a_2650 = a_2256.getInstance().a_2258(iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.a_131,encodeBuffer);
      }
      
      public function a_2619(iServerID:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2916 = new a_2916();
         request.m_iServerID = iServerID;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var logicConn:a_2650 = a_2256.getInstance().a_2258(iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.a_137,encodeBuffer);
      }
      
      public function a_2620(iServerID:int, iRoomID:int, matchGameData:ByteArray) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2976 = new a_2976();
         request.m_iRoomID = iRoomID;
         request.m_nGameDataLength = matchGameData.length;
         request.m_szGameData = matchGameData;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var logicConn:a_2650 = a_2256.getInstance().a_2258(iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.a_143,encodeBuffer);
      }
      
      public function a_2517(iServerID:int, iRoomID:int, iHealthStatus:int, iStartTime:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:a_2912 = new a_2912();
         request.m_iHealthStatus = iHealthStatus;
         request.m_iStartTime = iStartTime;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var logicConn:a_2650 = a_2256.getInstance().a_2258(iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.a_156,encodeBuffer);
      }
      
      public function RequestGetClimbTowerRank(iFlag:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CRequestGetClimbTowerRank = new CRequestGetClimbTowerRank();
         var m_iRoleUin:int = a_2439.getInstance().m_currentRoleUin;
         request.m_iFlag = iFlag;
         request.m_iUin = m_iRoleUin;
         request.encode(encodeBuffer,encodeLengh);
         request = null;
         var logicConn:a_2650 = a_2256.getInstance().a_2258(a_787.m_iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.MSG_LOGIC_GET_CLIMB_TOWER_RANK,encodeBuffer);
      }
      
      private function a_2621(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var connInfo:a_1770 = null;
         var lobbyHandler:a_2445 = null;
         var glPackageHeader:a_2671 = null;
         var lgBodyBuffer:ByteArray = null;
         var stMysPlayerDetail:CPlayerDetail = null;
         var encode_length:int = 0;
         var stOtherPlayerDetail:CPlayerDetail = null;
         var dataEvent1:a_1778 = null;
         var sitdownResponse:a_2953 = new a_2953();
         if(!sitdownResponse.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode sitdownResponse failed.");
            return;
         }
         if(0 == sitdownResponse.m_nResultID)
         {
            connInfo = new a_1770();
            connInfo.m_iServerID = a_787.m_iServerID;
            connInfo.m_iGameID = a_2256.getInstance().a_2259(a_787.m_iServerID,sitdownResponse.m_iRoomID);
            connInfo.m_iRoomID = sitdownResponse.m_iRoomID;
            connInfo.m_iTableID = sitdownResponse.m_iTableID;
            connInfo.m_iCrossID = sitdownResponse.m_iCrossID;
            a_4648.a_4649("OnSitDown.iServerID=" + connInfo.m_iServerID + ",iRoomID=" + connInfo.m_iRoomID + ",iTableID=" + connInfo.m_iTableID + ",time=" + getTimer());
            a_2439.getInstance().a_2483.m_iTableID = connInfo.m_iTableID;
            a_2439.getInstance().setSitDown(sitdownResponse);
            a_4657.getInstance().execute("SetCrossMapID",this,sitdownResponse.m_iMapID);
            lobbyHandler = a_2445.getInstance(connInfo);
            glPackageHeader = new a_2671();
            glPackageHeader.shMessageID = b_101.a_446;
            lgBodyBuffer = new ByteArray();
            a_2664.encode_int8(lgBodyBuffer,2);
            a_2664.encode_int8(lgBodyBuffer,EnmGameInitializeDataType.enmGameInitializeDataType_MyPlayerDetail);
            stMysPlayerDetail = a_2445.a_2449(sitdownResponse.m_iRoomID);
            if(null == stMysPlayerDetail)
            {
               trace("Error Can not GetMyPlayerDetail for RoomID:[" + sitdownResponse.m_iRoomID + "] failed");
               stMysPlayerDetail = new CPlayerDetail();
            }
            stMysPlayerDetail.m_iTableID = sitdownResponse.m_iTableID;
            stMysPlayerDetail.m_bySeat = sitdownResponse.m_bySeatID;
            trace("Decode sitdownResponse sitdownResponse.m_iTableID:[" + sitdownResponse.m_iTableID + "], sitdownResponse.m_bySeatID:[" + sitdownResponse.m_bySeatID + "]");
            if(null != stMysPlayerDetail)
            {
               stMysPlayerDetail.encode(lgBodyBuffer,encode_length);
               a_2664.encode_int8(lgBodyBuffer,EnmGameInitializeDataType.enmGameInitializeDataType_GameFlag);
               a_2664.encode_int8(lgBodyBuffer,EnmEnterTableMode.enmEnterTableMode_SitDown);
               lobbyHandler.a_2456(glPackageHeader,lgBodyBuffer);
            }
            glPackageHeader.shMessageID = b_101.a_447;
            lgBodyBuffer = new ByteArray();
            a_2664.encode_int8(lgBodyBuffer,sitdownResponse.m_stPlayers.length);
            for each(stOtherPlayerDetail in sitdownResponse.m_stPlayers)
            {
               stOtherPlayerDetail.encode(lgBodyBuffer,encode_length);
            }
            lobbyHandler.a_2456(glPackageHeader,lgBodyBuffer);
            dataEvent = new a_1778(EventType.a_576);
            dataEvent.dataObject = connInfo;
            a_1789.getInstance().dispatchEvent(dataEvent);
            if(connInfo.m_iRoomID == 27)
            {
               dataEvent1 = new a_1778(EventType.Diy_SitDown_Success);
               dataEvent1.dataObject = connInfo;
               a_1789.getInstance().dispatchEvent(dataEvent1);
            }
            glPackageHeader.shMessageID = b_101.a_487;
            lgBodyBuffer = new ByteArray();
            a_2664.encode_int8(lgBodyBuffer,EnmProxyCmd.a_401);
            a_2664.encode_int32(lgBodyBuffer,EnmSendToGameDataType.enm_td_game_current_game_data);
            lgBodyBuffer.writeObject(a_2439.getInstance().GetSitDown());
            lobbyHandler.a_2456(glPackageHeader,lgBodyBuffer);
         }
         else
         {
            a_4648.a_4649("坐下失败:" + sitdownResponse.m_szReasonMsg + ",time=" + getTimer());
            dataEvent = new a_1778(EventType.a_591);
            dataEvent.dataObject = sitdownResponse;
            a_1789.getInstance().dispatchEvent(dataEvent);
            if(sitdownResponse.m_iRoomID == 27)
            {
               dataEvent = new a_1778(EventType.Diy_SitDown_Failed);
               dataEvent.dataObject = sitdownResponse;
               a_1789.getInstance().dispatchEvent(dataEvent);
            }
         }
      }
      
      private function a_2622(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var connInfo:a_1770 = null;
         var lobbyHandler:a_2445 = null;
         var glPackageHeader:a_2671 = null;
         var lgBodyBuffer:ByteArray = null;
         var dataEvent:a_1778 = null;
         var standUpResponse:a_2954 = new a_2954();
         if(!standUpResponse.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode standUpResponse failed.");
            return;
         }
         if(0 == standUpResponse.m_nResultID)
         {
            connInfo = new a_1770();
            connInfo.m_iServerID = a_787.m_iServerID;
            connInfo.m_iGameID = a_2256.getInstance().a_2259(a_787.m_iServerID,standUpResponse.m_iRoomID);
            connInfo.m_iRoomID = standUpResponse.m_iRoomID;
            connInfo.m_iTableID = standUpResponse.m_iTableID;
            lobbyHandler = a_2445.getLobbyAdapterHandlerByConnInfo(connInfo);
            if(null == lobbyHandler)
            {
               trace("Error: lobbyHandler[serverID:" + connInfo.m_iServerID + ", RoomID:" + connInfo.m_iRoomID + "] is null OnStandUpResponse failed");
               return;
            }
            glPackageHeader = new a_2671();
            glPackageHeader.shMessageID = b_101.a_487;
            lgBodyBuffer = new ByteArray();
            a_2664.encode_int8(lgBodyBuffer,EnmProxyCmd.a_401);
            a_2664.encode_int32(lgBodyBuffer,EnmSendToGameDataType.enm_player_standup);
            lobbyHandler.a_2456(glPackageHeader,lgBodyBuffer);
            dataEvent = new a_1778(EventType.a_601);
            dataEvent.dataObject = connInfo;
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
      }
      
      private function a_2623(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var connInfo:a_1770 = null;
         var lobbyHandler:a_2445 = null;
         var dataEvent:a_1778 = null;
         var startGameResponse:a_2955 = new a_2955();
         if(!startGameResponse.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CResponseStartGame failed.");
            return;
         }
         if(0 == startGameResponse.m_nResultID)
         {
            connInfo = new a_1770();
            connInfo.m_iServerID = a_787.m_iServerID;
            connInfo.m_iGameID = a_2256.getInstance().a_2259(a_787.m_iServerID,startGameResponse.m_iRoomID);
            connInfo.m_iRoomID = startGameResponse.m_iRoomID;
            lobbyHandler = a_2445.getLobbyAdapterHandlerByConnInfo(connInfo);
            dataEvent = new a_1778(EventType.a_602);
            dataEvent.dataObject = connInfo;
            a_1789.getInstance().dispatchEvent(dataEvent);
            if(null == lobbyHandler)
            {
               trace("Error: lobbyHandler[serverID:" + connInfo.m_iServerID + ", RoomID:" + connInfo.m_iRoomID + "] is null OnStartGameResponse failed");
               return;
            }
         }
      }
      
      private function a_2624(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var sendGameDataResponse:a_2951 = new a_2951();
         if(!sendGameDataResponse.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CResponseSendGameData failed.");
            return;
         }
         if(0 == sendGameDataResponse.m_nResultID)
         {
         }
         trace(sendGameDataResponse + sendGameDataResponse.m_nResultID);
      }
      
      private function a_2625(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var getTableInfoResponse:a_2942 = new a_2942();
         if(!getTableInfoResponse.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode getTableInfoResponse failed.");
            return;
         }
         if(0 == getTableInfoResponse.m_nResultID)
         {
            dataEvent = new a_1778(EventType.a_586);
            a_2439.getInstance().initTDTalbeInfo(getTableInfoResponse.m_arrTableInfo);
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
         else
         {
            trace("GetTableInfo failed:" + getTableInfoResponse.m_szReasonMsg);
            dataEvent = new a_1778(EventType.a_654);
            dataEvent.dataObject = getTableInfoResponse.m_szReasonMsg;
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
      }
      
      private function a_2352(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var getTDCardsResponse:a_2943 = new a_2943();
         if(!getTDCardsResponse.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode getTDCardsResponse failed.");
            return;
         }
         if(0 != getTDCardsResponse.m_nResultID)
         {
            trace("GetTDCardsResponse failed:" + getTDCardsResponse.m_nResultID);
         }
      }
      
      private function a_2353(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var connInfo:a_1770 = null;
         var lobbyHandler:a_2445 = null;
         var glPackageHeader:a_2671 = null;
         var lgBodyBuffer:ByteArray = null;
         var responseUpdateCardList:a_2956 = new a_2956();
         if(!responseUpdateCardList.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode OnUpdateTDFavoriteCardsResponse failed.");
            return;
         }
         if(0 == responseUpdateCardList.m_nResultID)
         {
            a_2439.getInstance().setTDFavouriteCardInfo(responseUpdateCardList.m_aryCardList);
            connInfo = new a_1770();
            connInfo.m_iServerID = a_787.m_iServerID;
            connInfo.m_iRoomID = responseUpdateCardList.m_iRoomID;
            lobbyHandler = a_2445.getLobbyAdapterHandlerByConnInfo(connInfo);
            if(lobbyHandler != null)
            {
               glPackageHeader = new a_2671();
               glPackageHeader.shMessageID = b_101.a_487;
               lgBodyBuffer = new ByteArray();
               a_2664.encode_int8(lgBodyBuffer,EnmProxyCmd.a_401);
               a_2664.encode_int32(lgBodyBuffer,EnmSendToGameDataType.enm_td_game_favorite_cards_info);
               lgBodyBuffer.writeObject(responseUpdateCardList.m_aryCardList);
               lobbyHandler.a_2456(glPackageHeader,lgBodyBuffer);
               trace("GetTDCardsResponse success:" + responseUpdateCardList.m_nResultID);
            }
         }
         else
         {
            trace("GetTDCardsResponse failed:" + responseUpdateCardList.m_nResultID);
         }
      }
      
      private function a_2626(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var iSeatID:int = 0;
         var iStatus:int = 0;
         var connInfo:a_1770 = null;
         var lobbyHandler:a_2445 = null;
         var glPackageHeader:a_2671 = null;
         var lgBodyBuffer:ByteArray = null;
         var responseSetSeatState:a_2952 = new a_2952();
         if(!responseSetSeatState.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode getTDCardsResponse failed.");
            return;
         }
         if(0 == responseSetSeatState.m_nResultID)
         {
            iSeatID = responseSetSeatState.m_bSeatID;
            iStatus = responseSetSeatState.m_bState;
            connInfo = new a_1770();
            connInfo.m_iServerID = a_787.m_iServerID;
            connInfo.m_iRoomID = responseSetSeatState.m_iRoomID;
            lobbyHandler = a_2445.getLobbyAdapterHandlerByConnInfo(connInfo);
            glPackageHeader = new a_2671();
            glPackageHeader.shMessageID = b_101.a_487;
            lgBodyBuffer = new ByteArray();
            a_2664.encode_int8(lgBodyBuffer,EnmProxyCmd.a_401);
            a_2664.encode_int32(lgBodyBuffer,EnmSendToGameDataType.enm_td_game_set_seat_status);
            a_2664.encode_int8(lgBodyBuffer,iSeatID);
            a_2664.encode_int8(lgBodyBuffer,iStatus);
            lobbyHandler.a_2456(glPackageHeader,lgBodyBuffer);
            trace("GetTDCardsResponse success:" + responseSetSeatState.m_nResultID);
         }
         else
         {
            trace("GetTDCardsResponse failed:" + responseSetSeatState.m_nResultID);
         }
      }
      
      private function a_2627(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var responseTalkRoom:a_2688 = new a_2688();
         if(!responseTalkRoom.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode getTDCardsResponse failed.");
            return;
         }
         if(0 == responseTalkRoom.m_nResultID)
         {
            trace("GetTDCardsResponse success:" + responseTalkRoom.m_nResultID);
         }
         else
         {
            trace("GetTDCardsResponse failed:" + responseTalkRoom.m_nResultID);
         }
      }
      
      private function a_2628(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var responseTalkTalbe:a_2689 = new a_2689();
         if(!responseTalkTalbe.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode OnTalkOnTableResponse failed.");
            return;
         }
         if(0 == responseTalkTalbe.m_nResultID)
         {
            trace("OnTalkOnTableResponse success:" + responseTalkTalbe.m_nResultID);
         }
         else
         {
            trace("OnTalkOnTableResponse failed:" + responseTalkTalbe.m_nResultID);
         }
      }
      
      private function a_2629(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var role:a_4463 = null;
         var i:int = 0;
         var detail:a_2911 = null;
         var level:Object = null;
         var VIPlevel:int = 0;
         var response:a_2961 = new a_2961();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CResponseUpdateViewArea failed.");
            return;
         }
         if(0 == response.m_nResultID)
         {
            role = a_2161.e.GetCurrentRole() as a_4463;
            a_4648.a_4649("start拉取房间" + response.m_iRoomID + "玩家列表");
            for(i = 0; i < response.m_nPlayerCount; i++)
            {
               detail = response.m_arrPlayerInfo[i];
               if(detail.m_iUin != role.m_iRoleUin)
               {
                  level = a_2033.getInstance().getGameLevel(detail.m_iPoint);
                  VIPlevel = this.getVipLevel(detail.m_iVipScore);
                  trace("m_iRoleUin::" + detail.m_iUin + " m_szPlayerName::" + detail.m_szPlayerName + " m_iLevel::" + level.iLevel + " VIPlevel::" + VIPlevel);
                  a_4648.a_4649("m_iRoleUin::" + detail.m_iUin + " m_szPlayerName:: " + detail.m_szPlayerName + " m_iLevel::" + level.iLevel + " VIPlevel::" + VIPlevel);
               }
            }
            a_4648.a_4649("end拉取房间" + response.m_iRoomID + "玩家列表");
            dataEvent = new a_1778(EventType.a_638);
            dataEvent.dataObject = response.m_arrPlayerInfo;
            a_2439.getInstance().setLobbyRoomUser(response.m_arrPlayerInfo);
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
         else
         {
            trace("CResponseUpdateViewArea failed:" + response.m_nResultID);
         }
      }
      
      private function a_2630(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var response:a_2941 = new a_2941();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CResponseGetRoomPlayerCount failed.");
            return;
         }
         if(0 == response.m_nResultID)
         {
            dataEvent = new a_1778(EventType.a_639);
            dataEvent.dataObject = response;
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
         else
         {
            trace("CResponseGetRoomPlayerCount failed:" + response.m_nResultID);
         }
      }
      
      private function OnResponseGetClimbTowerRank(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var response:CResponseGetClimbTowerRank = new CResponseGetClimbTowerRank();
         if(!response.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CResponseBuyClimbTowerCount failed.");
            return;
         }
         a_4657.getInstance().execute("onGetClimbTowerRank",this,response);
      }
      
      public function OnRequestSendChatMsg(iType:int, iUin:int, iGroupID:int, iPlatformID:int, strMsg:String, iDstUin:int = 0, iDstGroupID:int = 0, iDstPlatformID:int = 0) : Boolean
      {
         trace("OnRequestSendChatMsg：",iType,iUin,iGroupID,strMsg);
         var encodeBuffer:ByteArray = new ByteArray();
         var reques:CRequestSendChatMsg = new CRequestSendChatMsg();
         reques.m_iType = iType;
         reques.m_iUin = iUin;
         reques.m_iGroupID = iGroupID;
         reques.m_iPlatformID = iPlatformID;
         reques.m_iDstUin = iDstUin;
         reques.m_iDstGroupID = iDstGroupID;
         reques.m_iDstPlatformID = iDstPlatformID;
         reques.m_szMsg = strMsg;
         reques.encode(encodeBuffer,0);
         var logicConn:a_2650 = a_2256.getInstance().a_2258(a_787.m_iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.MSG_LOGIC_SEND_CROSS_CHAT_MSG,encodeBuffer);
      }
      
      private function OnCResponseSendChatMsg(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseSendChatMsg = new CResponseSendChatMsg();
         response.decode(protocalBuffer,0);
         var dataEvent:CommonEvent = new CommonEvent(EventType.CROSS_SEND_CHAT_MSG);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function OnCNotifySendChatMsg(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var type:String = null;
         var response:CNotifySendChatMsg = ObjectPool.CheckOut(CNotifySendChatMsg) as CNotifySendChatMsg;
         response.decode(protocalBuffer,0);
         if(response.m_iType == 4)
         {
            type = EventType.WORLD_BOSS_SYSTEM_MSG;
         }
         else
         {
            type = EventType.CROSS_NOTIFY_CHAT_MSG;
         }
         var dataEvent:CommonEvent = new CommonEvent(type);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
         trace("收到聊天内容:" + response.m_szMsg);
      }
      
      public function OnCRequestCrossRoomList(iUin:int, iRoomID:int, iType:int, iSearchID:int) : Boolean
      {
         var enterRoom:Object = a_2161.e.getEnterRoom();
         var strServerID:String = "null" + "区";
         if(enterRoom)
         {
            strServerID = enterRoom.m_iRoomID + "区";
         }
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CRequestCrossRoomList = new CRequestCrossRoomList();
         request.m_iPlatformID = 0;
         request.m_iGroupID = 0;
         request.m_iUin = iUin;
         request.m_iRoomID = iRoomID;
         request.m_iStar = 0;
         request.m_iType = iType;
         request.m_iSearchID = iSearchID;
         request.encode(encodeBuffer,0);
         var logicConn:a_2650 = a_2256.getInstance().a_2258(a_787.m_iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.MSG_CROSS_ROOM_LIST,encodeBuffer);
      }
      
      private function OnCResponseCrossRoomList(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var diyEvent:CommonEvent = null;
         var response:CResponseCrossRoomList = new CResponseCrossRoomList();
         response.decode(protocalBuffer,0);
         var dataEvent:CommonEvent = new CommonEvent(EventType.CROSS_ROOM_LIST);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
         if(response.m_iType == 5)
         {
            diyEvent = new CommonEvent(EventType.DIY_ROOM_LIST);
            diyEvent.Data = response;
            a_1789.getInstance().dispatchEvent(diyEvent);
         }
      }
      
      public function OnRequestGameResult(iUin:int) : Boolean
      {
         var encodeBuffer:ByteArray = new ByteArray();
         var request:RequestGameResult = new RequestGameResult();
         request.m_iUin = iUin;
         request.encode(encodeBuffer,0);
         var logicConn:a_2650 = a_2256.getInstance().a_2258(a_787.m_iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.MSG_CROSS_MAP_INFO,encodeBuffer);
      }
      
      private function OnCResponseCrossGameResultGet(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseCrossGameResultGet = new CResponseCrossGameResultGet();
         response.decode(protocalBuffer,0);
         var dataEvent:CommonEvent = new CommonEvent(EventType.CROSS_GAME_RESULT);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function OnCNotifyCrossTableStatusChange(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var diyEvent:CommonEvent = null;
         var dataEvent:CommonEvent = null;
         var response:CNotifyCrossTableStatusChange = ObjectPool.CheckOut(CNotifyCrossTableStatusChange) as CNotifyCrossTableStatusChange;
         response.decode(protocalBuffer,0);
         if(response.m_nCount > 0 && response.m_vTableStatusInfo[0].m_iTableID >= 60000)
         {
            diyEvent = new CommonEvent(EventType.NOTIFY_DIY_ROOM_STATE);
            diyEvent.Data = response;
            a_1789.getInstance().dispatchEvent(diyEvent);
         }
         else
         {
            dataEvent = new CommonEvent(EventType.NOTIFY_CROSS_ROOM_STATE);
            dataEvent.Data = response;
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
      }
      
      private function OnCNotifyCrossTableCreate(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var diyEvent:CommonEvent = null;
         var dataEvent:CommonEvent = null;
         var response:CNotifyCrossTableCreate = ObjectPool.CheckOut(CNotifyCrossTableCreate) as CNotifyCrossTableCreate;
         response.decode(protocalBuffer,0);
         if(response.m_nCount > 0 && response.m_vCrossRoomInfo[0].m_iRoomID >= 60000)
         {
            diyEvent = new CommonEvent(EventType.NOTIFY_DIY_ROOM_INFO_LIST);
            diyEvent.Data = response;
            a_1789.getInstance().dispatchEvent(diyEvent);
         }
         else
         {
            dataEvent = new CommonEvent(EventType.NOTIFY_CROSS_ROOM_INFO_LIST);
            dataEvent.Data = response;
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
      }
      
      public function OnCCSRequestCrossDropCount(iUin:int) : Boolean
      {
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CCSRequestCrossDropCount = new CCSRequestCrossDropCount();
         request.m_iUin = iUin;
         request.encode(encodeBuffer,0);
         var logicConn:a_2650 = a_2256.getInstance().a_2258(a_787.m_iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.MSG_CROSS_DROP_COUNT,encodeBuffer);
      }
      
      private function OnCCSResponseCrossDropCount(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CCSResponseCrossDropCount = new CCSResponseCrossDropCount();
         response.decode(protocalBuffer,0);
         var dataEvent:CommonEvent = new CommonEvent(EventType.CROSS_DROP_COUNT);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function OnCNotifyPlayerGroupInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CNotifyPlayerGroupInfo = new CNotifyPlayerGroupInfo();
         response.decode(protocalBuffer,0);
         var dataEvent:CommonEvent = new CommonEvent(EventType.NOTIFY_CROSS_PLAYER_GROUP_INFO);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestCrossGetTableInfo(iTableId:int) : Boolean
      {
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CRequestCrossGetTableInfo = new CRequestCrossGetTableInfo();
         request.m_iTableID = iTableId;
         request.encode(encodeBuffer,0);
         var logicConn:a_2650 = a_2256.getInstance().a_2258(a_787.m_iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.MSG_CROSS_GET_TABLE_INFO,encodeBuffer);
      }
      
      private function OnCResponseCrossGetTableInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseCrossGetTableInfo = new CResponseCrossGetTableInfo();
         response.decode(protocalBuffer,0);
         var dataEvent:CommonEvent = new CommonEvent(EventType.CROSS_GET_TABLE_INFO);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestDiyGetSelfMap(iUin:int, iType:int, iFrom:int, iNum:int) : Boolean
      {
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CRequestDiyGetSelfMap = new CRequestDiyGetSelfMap();
         request.m_iUin = iUin;
         request.m_iType = iType;
         request.m_iFrom = iFrom;
         request.m_iNum = iNum;
         request.encode(encodeBuffer,0);
         var logicConn:a_2650 = a_2256.getInstance().a_2258(a_787.m_iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.MSG_DIY_GET_SELF_MAP,encodeBuffer);
      }
      
      private function OnCResponseDiyGetSelfMap(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseDiyGetSelfMap = new CResponseDiyGetSelfMap();
         response.decode(protocalBuffer,0);
         var dataEvent:CommonEvent = new CommonEvent(EventType.DIY_GET_SELF_MAP);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestGetDiyStoreInfo(iUin:int, iId:int = -1) : Boolean
      {
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CRequestGetDiyStoreInfo = new CRequestGetDiyStoreInfo();
         request.m_iUin = iUin;
         request.m_iId = iId;
         request.encode(encodeBuffer,0);
         var logicConn:a_2650 = a_2256.getInstance().a_2258(a_787.m_iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.MSG_DIY_STORE_INFO,encodeBuffer);
      }
      
      private function OnCResponseGetDiyStoreInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseGetDiyStoreInfo = new CResponseGetDiyStoreInfo();
         response.decode(protocalBuffer,0);
         var dataEvent:CommonEvent = new CommonEvent(EventType.DIY_STORE_INFO);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestDiyCreateMap(iUin:int, iMapId:int = 0) : Boolean
      {
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CRequestDiyCreateMap = new CRequestDiyCreateMap();
         request.m_iUin = iUin;
         request.m_szAuthorName = "";
         request.m_iMapID = iMapId;
         request.encode(encodeBuffer,0);
         var logicConn:a_2650 = a_2256.getInstance().a_2258(a_787.m_iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.MSG_DIY_CREATE_MAP,encodeBuffer);
      }
      
      private function OnCResponseDiyCreateMap(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseDiyCreateMap = new CResponseDiyCreateMap();
         response.decode(protocalBuffer,0);
         var dataEvent:CommonEvent = new CommonEvent(EventType.DIY_CREATE_MAP);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestDiyGetMapInfo(iUin:int, iMapId:int) : Boolean
      {
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CRequestDiyGetMapInfo = new CRequestDiyGetMapInfo();
         request.m_iUin = iUin;
         request.m_iMapID = iMapId;
         request.encode(encodeBuffer,0);
         var logicConn:a_2650 = a_2256.getInstance().a_2258(a_787.m_iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.MSG_DIY_GET_MAP_INFO,encodeBuffer);
      }
      
      private function OnCResponseDiyGetMapInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseDiyGetMapInfo = new CResponseDiyGetMapInfo();
         response.decode(protocalBuffer,0);
         var dataEvent:CommonEvent = new CommonEvent(EventType.DIY_GET_MAP_INFO);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function OnCResponseNotifyDiyMapInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseDiyGetMapInfo = new CResponseDiyGetMapInfo();
         response.decode(protocalBuffer,0);
         var dataEvent:CommonEvent = new CommonEvent(EventType.NOTIFY_DIY_MAP_INFO);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
         a_2439.getInstance().setDIYInfo(response);
      }
      
      private function OnCResponseNotifyDiyMapMouse(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseDiyGetMapMouse = new CResponseDiyGetMapMouse();
         response.decode(protocalBuffer,0);
         a_2439.getInstance().setDIYMouseInfo(response);
      }
      
      public function OnCRequestDiyUpdateMapInfo(iUin:int, iMapID:int, obj:Object) : Boolean
      {
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CRequestDiyUpdateMapInfo = new CRequestDiyUpdateMapInfo();
         request.m_iUin = iUin;
         request.m_iMapID = iMapID;
         request.m_sName = obj.m_sName;
         request.m_sDesc = obj.m_sDesc;
         request.a_1119 = obj.a_1119;
         request.m_iReadyTime = obj.m_iReadyTime;
         request.m_iMaxCardStar = obj.m_iMaxCardStar;
         request.m_iTimeLimit = obj.m_iTimeLimit;
         request.m_bIsBanPet = obj.m_bIsBanPet;
         request.m_bIsBanEquip = obj.m_bIsBanEquip;
         request.m_bPlayerLimit = obj.m_bPlayerLimit;
         request.m_iFireNum = obj.m_iFireNum;
         request.m_iMouseLevel = obj.m_iMouseLevel;
         request.m_iScenes = obj.m_iScenes;
         request.encode(encodeBuffer,0);
         var logicConn:a_2650 = a_2256.getInstance().a_2258(a_787.m_iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.MSG_DIY_UPDATE_MAP_INFO,encodeBuffer);
      }
      
      public function OnCResponseDiyUpdateMapInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseDiyUpdateMapInfo = new CResponseDiyUpdateMapInfo();
         response.decode(protocalBuffer,0);
         var dataEvent:CommonEvent = new CommonEvent(EventType.DIY_UPDATE_MAP_INFO);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestDiyUpdateMapWave(iUin:int, iMapID:int, iWaveID:int, iDataSize:int, szData:ByteArray) : Boolean
      {
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CRequestDiyUpdateMapWave = new CRequestDiyUpdateMapWave();
         request.m_iUin = iUin;
         request.m_iMapID = iMapID;
         request.m_iWaveID = iWaveID;
         request.m_iDataSize = iDataSize;
         request.m_szData = szData;
         request.encode(encodeBuffer,0);
         var logicConn:a_2650 = a_2256.getInstance().a_2258(a_787.m_iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.MSG_DIY_UPDATE_MAP_WAVE,encodeBuffer);
      }
      
      public function OnCResponseDiyUpdateMapWave(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseDiyUpdateMapWave = new CResponseDiyUpdateMapWave();
         response.decode(protocalBuffer,0);
         var dataEvent:CommonEvent = new CommonEvent(EventType.DIY_UPDATE_MAP_WAVE_INFO);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestDiyGetMapWave(iUin:int, iMapID:int, iWaveID:int, iUsage:int) : Boolean
      {
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CRequestDiyGetMapWave = new CRequestDiyGetMapWave();
         request.m_iUin = iUin;
         request.m_iMapID = iMapID;
         request.m_iWaveID = iWaveID;
         request.m_iUsage = iUsage;
         request.encode(encodeBuffer,0);
         var logicConn:a_2650 = a_2256.getInstance().a_2258(a_787.m_iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.MSG_DIY_GET_MAP_WAVE,encodeBuffer);
      }
      
      public function OnCResponseDiyGetMapWave(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseDiyGetMapWave = new CResponseDiyGetMapWave();
         response.decode(protocalBuffer,0);
         var dataEvent:CommonEvent = new CommonEvent(EventType.DIY_GET_MAP_WAVE_INFO);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestDiyPublishMap(iUin:int, iMapId:int, szName:String, szDesc:String) : Boolean
      {
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CRequestDiyPublishMap = new CRequestDiyPublishMap();
         request.m_iUin = iUin;
         request.m_iDraftMapId = iMapId;
         request.m_szName = szName;
         request.m_szDesz = szDesc;
         request.encode(encodeBuffer,0);
         var logicConn:a_2650 = a_2256.getInstance().a_2258(a_787.m_iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.MSG_DIY_PUBLISH_MAP,encodeBuffer);
      }
      
      private function OnCResponseDiyPublishMap(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseDiyPublishMap = new CResponseDiyPublishMap();
         response.decode(protocalBuffer,0);
         var dataEvent:CommonEvent = new CommonEvent(EventType.DIY_PUBLISH_MAP);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestDiyDelMap(iUin:int, iMapId:int) : Boolean
      {
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CRequestDiyDelMap = new CRequestDiyDelMap();
         request.m_iUin = iUin;
         request.m_iMapID = iMapId;
         request.encode(encodeBuffer,0);
         var logicConn:a_2650 = a_2256.getInstance().a_2258(a_787.m_iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.MSG_DIY_DEL_MAP,encodeBuffer);
      }
      
      private function OnCResponseDiyDelMap(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseDiyDelMap = new CResponseDiyDelMap();
         response.decode(protocalBuffer,0);
         var dataEvent:CommonEvent = new CommonEvent(EventType.DIY_DEL_MAP);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestDiyGetMapList(iUin:int, iType:int, m_szSearch:String) : Boolean
      {
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CRequestDiyGetMapList = new CRequestDiyGetMapList();
         request.m_iUin = iUin;
         request.m_iType = iType;
         request.m_szSearch = m_szSearch;
         request.encode(encodeBuffer,0);
         var logicConn:a_2650 = a_2256.getInstance().a_2258(a_787.m_iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.MSG_DIY_GET_MAP_LIST,encodeBuffer);
      }
      
      private function OnCResponseDiyGetMapList(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseDiyGetMapList = new CResponseDiyGetMapList();
         response.decode(protocalBuffer,0);
         var dataEvent:CommonEvent = new CommonEvent(EventType.DIY_GET_MAP_LIST);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestGetDiyPlayerMapData(iUin:int, vMapID:Vector.<int>) : Boolean
      {
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CRequestGetDiyPlayerMapData = new CRequestGetDiyPlayerMapData();
         request.m_iUin = iUin;
         request.m_iMapIDCount = vMapID.length;
         request.m_vMapID = vMapID;
         request.encode(encodeBuffer,0);
         var logicConn:a_2650 = a_2256.getInstance().a_2258(a_787.m_iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.MSG_DIY_GET_PLAYER_MAP_DATA,encodeBuffer);
      }
      
      private function OnCResponseGetDiyPlayerMapData(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseGetDiyPlayerMapData = new CResponseGetDiyPlayerMapData();
         response.decode(protocalBuffer,0);
         var dataEvent:CommonEvent = new CommonEvent(EventType.DIY_GET_PLAYER_MAP_DATA);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCCSRequestAppraiseDIYMap(iUin:int, iMapId:int, iOpt:int) : Boolean
      {
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CCSRequestAppraiseDIYMap = new CCSRequestAppraiseDIYMap();
         request.m_iUin = iUin;
         request.m_iOpt = iOpt;
         request.m_iMapID = iMapId;
         request.encode(encodeBuffer,0);
         var logicConn:a_2650 = a_2256.getInstance().a_2258(a_787.m_iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.MSG_DIY_APPRAISE_MAP,encodeBuffer);
      }
      
      private function OnCCSResponseAppraiseDIYMap(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CCSResponseAppraiseDIYMap = new CCSResponseAppraiseDIYMap();
         response.decode(protocalBuffer,0);
         var dataEvent:CommonEvent = new CommonEvent(EventType.DIY_APPRAISE_MAP);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCCSRequestReceiveDIYCoin(iUin:int, iMapId:int) : Boolean
      {
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CCSRequestReceiveDIYCoin = new CCSRequestReceiveDIYCoin();
         request.m_iUin = iUin;
         request.m_iMapID = iMapId;
         request.encode(encodeBuffer,0);
         var logicConn:a_2650 = a_2256.getInstance().a_2258(a_787.m_iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.MSG_DIY_RECEIVE_DIYB,encodeBuffer);
      }
      
      private function OnCCSResponseReceiveDIYCoin(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CCSResponseReceiveDIYCoin = new CCSResponseReceiveDIYCoin();
         response.decode(protocalBuffer,0);
         var dataEvent:CommonEvent = new CommonEvent(EventType.DIY_GET_COIN);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCCSRequestGetTwoPataCount(iUin:int) : Boolean
      {
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CRequestGetTwoPataCount = new CRequestGetTwoPataCount();
         request.m_iUin = iUin;
         request.encode(encodeBuffer,0);
         var logicConn:a_2650 = a_2256.getInstance().a_2258(a_787.m_iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.MSG_GET_TWO_PATA_COUNT,encodeBuffer);
      }
      
      public function OnCCRequestGetTowRankInfo(iUin:int, iMode:int) : Boolean
      {
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CRequestGetTowRankInfo = new CRequestGetTowRankInfo();
         request.m_iUin = iUin;
         request.m_mod = iMode;
         request.encode(encodeBuffer,0);
         var logicConn:a_2650 = a_2256.getInstance().a_2258(a_787.m_iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.MSG_GET_TWO_PATA_RANK_INFO,encodeBuffer);
      }
      
      private function OnCCSResponseGetTwoPataCount(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseGetTwoPataCount = new CResponseGetTwoPataCount();
         response.decode(protocalBuffer,0);
         var dataEvent:CommonEvent = new CommonEvent(EventType.GET_TWO_PATA_COUNT);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCCSRequestGetTwoPataLevel(iUin:int) : Boolean
      {
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CRequestGetTwoPataCount = new CRequestGetTwoPataCount();
         request.m_iUin = iUin;
         request.encode(encodeBuffer,0);
         var logicConn:a_2650 = a_2256.getInstance().a_2258(a_787.m_iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.MSG_GET_TWO_PATA_LEVEL,encodeBuffer);
      }
      
      private function OnCCSResponseGetTwoPataLevel(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseGetTwoPataLevel = new CResponseGetTwoPataLevel();
         response.decode(protocalBuffer,0);
         var dataEvent:CommonEvent = new CommonEvent(EventType.GET_TWO_PATA_LEVEL);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCCSRequestGetTwoPataRank(iUin:int, m_iFrom:int, m_iTo:int) : Boolean
      {
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CRequestGetTwoPataCount = new CRequestGetTwoPataCount();
         request.m_iUin = iUin;
         request.m_iFrom = m_iFrom;
         request.m_iTo = m_iTo;
         request.encode(encodeBuffer,0);
         var logicConn:a_2650 = a_2256.getInstance().a_2258(a_787.m_iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.MSG_GET_TWO_PATA_RANK,encodeBuffer);
      }
      
      private function OnCCSResponseGetTwoPataRank(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseGetTwoPataRank = new CResponseGetTwoPataRank();
         response.decode(protocalBuffer,0);
         var dataEvent:CommonEvent = new CommonEvent(EventType.GET_TWO_PATA_RANK);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function OnCCSResponseGetTwoPataRankInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseGetTowRankInfo = new CResponseGetTowRankInfo();
         response.decode(protocalBuffer,0);
         var dataEvent:CommonEvent = new CommonEvent(EventType.GET_TWO_PATA_RANK_INFO);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestGetDiyTerrain(iUin:int, iMapID:int, iUsage:int) : Boolean
      {
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CRequestGetDiyTerrain = new CRequestGetDiyTerrain();
         request.m_iUin = iUin;
         request.m_iMapID = iMapID;
         request.m_iUsage = iUsage;
         request.encode(encodeBuffer,0);
         var logicConn:a_2650 = a_2256.getInstance().a_2258(a_787.m_iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.MSG_DIY_GET_TERRAIN,encodeBuffer);
      }
      
      private function OnCResponseGetDiyTerrain(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseGetDiyTerrain = new CResponseGetDiyTerrain();
         response.decode(protocalBuffer,0);
         var dataEvent:CommonEvent = new CommonEvent(EventType.DIY_GET_MAP_LAND_FORM);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function OnCRequestNotifyDiyTerrain(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseGetDiyTerrain = new CResponseGetDiyTerrain();
         response.decode(protocalBuffer,0);
         var dataEvent:CommonEvent = new CommonEvent(EventType.DIY_NOTIFY_MAP_LAND_FORM);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCRequestUpdateDiyTerrain(iUin:int, iMapID:int, iDataSize:int, szData:ByteArray) : Boolean
      {
         var encodeBuffer:ByteArray = new ByteArray();
         var request:CRequestUpdateDiyTerrain = new CRequestUpdateDiyTerrain();
         request.m_iUin = iUin;
         request.m_iMapID = iMapID;
         request.m_iDataSize = iDataSize;
         request.m_szData = szData;
         request.encode(encodeBuffer,0);
         var logicConn:a_2650 = a_2256.getInstance().a_2258(a_787.m_iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.MSG_DIY_UPDATE_TERRAIN,encodeBuffer);
      }
      
      private function OnCResponseUpdateDiyTerrain(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseUpdateDiyTerrain = new CResponseUpdateDiyTerrain();
         response.decode(protocalBuffer,0);
         var dataEvent:CommonEvent = new CommonEvent(EventType.DIY_UPDATE_MAP_LAND_FORM);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCCSRequestGetWorldBossInfo(iUin:int) : Boolean
      {
         var request:CCSRequestGetWorldBossInfo = new CCSRequestGetWorldBossInfo();
         request.m_iUin = iUin;
         var encodeBuffer:ByteArray = new ByteArray();
         request.encode(encodeBuffer,0);
         var logicConn:a_2650 = a_2256.getInstance().a_2258(a_787.m_iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.MSG_GET_WORLD_BOSS_INFO,encodeBuffer);
      }
      
      public function onCCSResponseGetWorldBossInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CCSResponseGetWorldBossInfo = new CCSResponseGetWorldBossInfo();
         response.decode(protocalBuffer,0);
         var dataEvent:CommonEvent = new CommonEvent(EventType.GET_WORLD_BOSS_INFO);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function OnCCSRequestGetWorldBossRank(type:int, platform:int, serverId:int, targetId:int, seasonId:int) : Boolean
      {
         var iLength:int = 0;
         var request:CCSRequestGetWorldBossRank = new CCSRequestGetWorldBossRank();
         request.m_cType = type;
         request.m_cPlatform = platform;
         request.m_nGroupID = serverId;
         request.m_iTargetID = targetId;
         request.m_nSeason = seasonId;
         var encodeBuffer:ByteArray = new ByteArray();
         request.encode(encodeBuffer,iLength);
         var logicConn:a_2650 = a_2256.getInstance().a_2258(a_787.m_iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.MSG_GET_WORLD_BOSS_RANK,encodeBuffer);
      }
      
      public function onCCSResponseGetWorldBossRank(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var dataEvent:CommonEvent = null;
         var response:CCSResponseGetWorldBossRank = new CCSResponseGetWorldBossRank();
         response.decode(protocalBuffer,0);
         if(0 == response.m_nResultID)
         {
            dataEvent = new CommonEvent(EventType.GET_WORLD_BOSS_RANK);
            dataEvent.Data = response;
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
      }
      
      public function OnCCSRequestCheckWorldBossPlayerInfo(plat:int, group:int, targetUin:int) : Boolean
      {
         var iLength:int = 0;
         var request:CCSRequestCheckWorldBossPlayerInfo = new CCSRequestCheckWorldBossPlayerInfo();
         request.m_cPlatform = plat;
         request.m_nGroup = group;
         request.m_iTargetUin = targetUin;
         var encodeBuffer:ByteArray = new ByteArray();
         request.encode(encodeBuffer,iLength);
         var logicConn:a_2650 = a_2256.getInstance().a_2258(a_787.m_iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.MSG_GET_CHECK_WORLD_BOSS_PLAYER_INFO,encodeBuffer);
      }
      
      public function onCCSResponeCheckWorldBossPlayerInfo(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var dataEvent:CommonEvent = null;
         var response:CCSResponseCheckWorldBossPlayerInfo = new CCSResponseCheckWorldBossPlayerInfo();
         response.decode(protocalBuffer,0);
         if(0 == response.m_nResultID)
         {
            dataEvent = new CommonEvent(EventType.GET_WORLD_BOSS_LEVEL_USER_PK_INFO);
            dataEvent.Data = response;
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
      }
      
      public function onCCSRequestGetWorldBossRecord(m_iUin:int) : Boolean
      {
         var iLength:int = 0;
         var request:CRequestGetWorldBossRecord = new CRequestGetWorldBossRecord();
         request.m_iUin = m_iUin;
         var encodeBuffer:ByteArray = new ByteArray();
         request.encode(encodeBuffer,iLength);
         var logicConn:a_2650 = a_2256.getInstance().a_2258(a_787.m_iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.MSG_GET_WORLDBOSS_RECORD,encodeBuffer);
      }
      
      public function onCCSResponseGetWorldBossRecord(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var dataEvent:CommonEvent = null;
         var response:CResponseGetWorldBossRecord = new CResponseGetWorldBossRecord();
         response.decode(protocalBuffer,0);
         if(0 == response.m_nResultID)
         {
            dataEvent = new CommonEvent(EventType.GET_MSG_WORLDBOSS_RECORD);
            dataEvent.Data = response;
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
      }
      
      public function onCCSRequestMsgWorldBossSkip(m_iUin:int, m_nCount:int) : Boolean
      {
         var iLength:int = 0;
         var request:CRequestMsgWorldBossSkip = new CRequestMsgWorldBossSkip();
         request.m_iUin = m_iUin;
         request.m_nCount = m_nCount;
         var encodeBuffer:ByteArray = new ByteArray();
         request.encode(encodeBuffer,iLength);
         var logicConn:a_2650 = a_2256.getInstance().a_2258(a_787.m_iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.MSG_WORLDBOSS_FAST_PK,encodeBuffer);
      }
      
      public function onCCSResponseMsgWorldBossSkip(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CResponseMsgWorldBossSkip = new CResponseMsgWorldBossSkip();
         response.decode(protocalBuffer,0);
         var dataEvent:CommonEvent = new CommonEvent(EventType.GET_MSG_WORLDBOSS_FAST_PK);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function onCCSRequestGetWorldBossSummary(m_iUin:int) : Boolean
      {
         var iLength:int = 0;
         var request:CRequestGetWorldBossSummary = new CRequestGetWorldBossSummary();
         request.m_iUin = m_iUin;
         var encodeBuffer:ByteArray = new ByteArray();
         request.encode(encodeBuffer,iLength);
         var logicConn:a_2650 = a_2256.getInstance().a_2258(a_787.m_iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.MSG_GET_WORLDBOSS_SUMMARY,encodeBuffer);
      }
      
      public function onCCSResponseGetWorldBossSummary(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var dataEvent:CommonEvent = null;
         var response:CResponseGetWorldBossSummary = new CResponseGetWorldBossSummary();
         response.decode(protocalBuffer,0);
         if(0 == response.m_nResultID)
         {
            dataEvent = new CommonEvent(EventType.GET_MSG_WORLDBOSS_SUMMARY);
            dataEvent.Data = response;
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
      }
      
      public function onCCSRequestGetWorldBossMap(m_iUin:int, m_nBossID:int, m_cBuffID:int) : Boolean
      {
         var iLength:int = 0;
         var request:CCSRequestGetWorldBossMap = new CCSRequestGetWorldBossMap();
         request.m_iUin = m_iUin;
         request.m_nBossID = m_nBossID;
         request.m_cBuffID = m_cBuffID;
         var encodeBuffer:ByteArray = new ByteArray();
         request.encode(encodeBuffer,iLength);
         var logicConn:a_2650 = a_2256.getInstance().a_2258(a_787.m_iServerID);
         return pBaseProtocol.a_2201(logicConn,b_154.MSG_REQUEST_GET_WORLDBOSS_MAP,encodeBuffer);
      }
      
      public function onCCSResponseGetWorldBossMap(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var response:CCSResponseGetWorldBossMap = new CCSResponseGetWorldBossMap();
         response.decode(protocalBuffer,0);
         var dataEvent:CommonEvent = new CommonEvent(EventType.RESPONSE_WORLD_BOSS_GET_TRAIN_MAP_ID);
         dataEvent.Data = response;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function getVipLevel(iScore:int) : int
      {
         var level:Number = 0;
         if(iScore >= 14000000)
         {
            level = 15;
         }
         else if(iScore >= 9500000)
         {
            level = 14 + (iScore - 9500000) / 4500000;
         }
         else if(iScore >= 6000000)
         {
            level = 13 + (iScore - 6000000) / 3500000;
         }
         else if(iScore >= 3500000)
         {
            level = 12 + (iScore - 3500000) / 2500000;
         }
         else if(iScore >= 2000000)
         {
            level = 11 + (iScore - 2000000) / 1500000;
         }
         else if(iScore >= 1000000)
         {
            level = 10 + (iScore - 1000000) / 1000000;
         }
         else if(iScore >= 500000)
         {
            level = 9 + (iScore - 500000) / 500000;
         }
         else if(iScore >= 200000)
         {
            level = 8 + (iScore - 200000) / 300000;
         }
         else if(iScore >= 100000)
         {
            level = 7 + (iScore - 100000) / 100000;
         }
         else if(iScore >= 50000)
         {
            level = 6 + (iScore - 50000) / 50000;
         }
         else if(iScore >= 20000)
         {
            level = 5 + (iScore - 20000) / 30000;
         }
         else if(iScore >= 10000)
         {
            level = 4 + (iScore - 10000) / 10000;
         }
         else if(iScore >= 5000)
         {
            level = 3 + (iScore - 5000) / 5000;
         }
         else if(iScore >= 2000)
         {
            level = 2 + (iScore - 2000) / 3000;
         }
         else if(iScore >= 500)
         {
            level = 1 + (iScore - 500) / 1500;
         }
         else
         {
            level = iScore / 500;
         }
         return int(level);
      }
   }
}

