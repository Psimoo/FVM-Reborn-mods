package a_4770
{
   import a_4716.b_154;
   import a_4728.a_1778;
   import a_4729.EventType;
   import a_4729.a_1789;
   import a_4759.b_167;
   import a_4760.a_2256;
   import a_4763.a_2445;
   import a_4771.a_2650;
   import a_4788.a_4648;
   import com.aurora.protocol.common.a_2670;
   import com.aurora.protocol.game.CPlayerDetail;
   import com.aurora.protocol.logicserver.a_2913;
   import com.aurora.protocol.logicserver.a_2914;
   import com.aurora.protocol.logicserver.a_2919;
   import com.aurora.protocol.logicserver.a_2923;
   import com.aurora.protocol.logicserver.a_2937;
   import com.aurora.protocol.logicserver.a_2938;
   import com.aurora.protocol.logicserver.a_2939;
   import com.aurora.protocol.logicserver.a_2944;
   import com.aurora.protocol.logicserver.a_2948;
   import com.aurora.protocol.logicserver.a_2962;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   
   public class a_2610 extends b_167
   {
      
      private static var a_847:a_2610;
      
      private var currTime:Number;
      
      public function a_2610()
      {
         super();
         a_2247(b_154.a_128,this.a_2611);
         a_2247(b_154.a_129,this.a_2612);
         a_2247(b_154.a_144,this.a_2613);
         a_2247(b_154.a_145,this.a_2614);
         a_2247(b_154.a_147,this.a_2615);
      }
      
      public static function getInstance() : a_2610
      {
         if(null == a_847)
         {
            a_847 = new a_2610();
         }
         return a_847;
      }
      
      public function a_2483(iServerID:int, iRoomID:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var enterRoomRequest:a_2913 = new a_2913();
         enterRoomRequest.m_iACT = 0;
         enterRoomRequest.m_iRoomID = iRoomID;
         enterRoomRequest.encode(encodeBuffer,encodeLengh);
         enterRoomRequest = null;
         var logicConn:a_2650 = a_2256.getInstance().a_2258(iServerID);
         a_4648.a_4649("EnterRoom.ip=" + logicConn.host + ",iServerID=" + iServerID + ",iRoomID=" + iRoomID + ",time=" + getTimer());
         return pBaseProtocol.a_2201(logicConn,b_154.a_128,encodeBuffer);
      }
      
      public function a_2484(serverId:int, roomId:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var leaveRoomRequest:a_2919 = new a_2919();
         leaveRoomRequest.m_iRoomID = roomId;
         leaveRoomRequest.encode(encodeBuffer,encodeLengh);
         leaveRoomRequest = null;
         var logicConn:a_2650 = a_2256.getInstance().a_2258(serverId);
         return pBaseProtocol.a_2201(logicConn,b_154.a_129,encodeBuffer);
      }
      
      public function a_2486(serverId:int, matchId:int, iRoomID:int = -1) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var matchSignUpRequest:a_2923 = new a_2923();
         matchSignUpRequest.m_bAct = 0;
         matchSignUpRequest.m_iRoomID = iRoomID;
         matchSignUpRequest.m_iMatchID = matchId;
         matchSignUpRequest.encode(encodeBuffer,encodeLengh);
         matchSignUpRequest = null;
         var logicConn:a_2650 = a_2256.getInstance().a_2258(serverId);
         return pBaseProtocol.a_2201(logicConn,b_154.a_144,encodeBuffer);
      }
      
      public function a_2487(serverId:int, matchId:int, roomId:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var exitMatchRequest:a_2914 = new a_2914();
         exitMatchRequest.m_iMatchID = matchId;
         exitMatchRequest.m_iRoomID = roomId;
         exitMatchRequest.encode(encodeBuffer,encodeLengh);
         exitMatchRequest = null;
         var logicConn:a_2650 = a_2256.getInstance().a_2258(serverId);
         return pBaseProtocol.a_2201(logicConn,b_154.a_145,encodeBuffer);
      }
      
      public function a_2488(serverId:int, matchId:int) : Boolean
      {
         var encodeLengh:int = 0;
         var encodeBuffer:ByteArray = new ByteArray();
         var viewMatchPlayerNumRequest:a_2937 = new a_2937();
         viewMatchPlayerNumRequest.m_byAct = 0;
         viewMatchPlayerNumRequest.m_iMatchID = matchId;
         viewMatchPlayerNumRequest.encode(encodeBuffer,encodeLengh);
         viewMatchPlayerNumRequest = null;
         var logicConn:a_2650 = a_2256.getInstance().a_2258(serverId);
         return pBaseProtocol.a_2201(logicConn,b_154.a_147,encodeBuffer);
      }
      
      private function a_2611(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var enterRoomResponse:a_2938 = new a_2938();
         if(!enterRoomResponse.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode enterRoomResponse failed.");
            return;
         }
         a_4648.a_4649("OnEnterRoom.iServerID=" + a_787.m_iServerID + ",iRoomID=" + enterRoomResponse.m_iRoomID + ",nResultID=" + enterRoomResponse.m_nResultID + ",msg=" + enterRoomResponse.m_szReasonMsg + ",time=" + getTimer());
         var playdetail:CPlayerDetail = enterRoomResponse.m_stPlayerDetail;
         if(playdetail != null)
         {
            a_4648.a_4649("CPlayerDetail.iUin=" + playdetail.m_iUin + ",szPlayerName=" + playdetail.m_szPlayerName);
            trace("LobbyAdapterHandler.AddOrUpdateMyplayerDetail for RoomID:[" + enterRoomResponse.m_iRoomID + "].");
         }
         a_2445.a_2447(enterRoomResponse.m_iRoomID,enterRoomResponse.m_stPlayerDetail);
         var dataEvent:a_1778 = new a_1778(EventType.a_574);
         dataEvent.dataObject = {
            "iServerID":null,
            "iRoomID":null,
            "iHeadTableID":null,
            "iTailTableID":null
         };
         dataEvent.dataObject.iServerID = a_787.m_iServerID;
         dataEvent.dataObject.iRoomID = enterRoomResponse.m_iRoomID;
         dataEvent.dataObject.iHeadTableID = enterRoomResponse.m_iHeadTableID;
         dataEvent.dataObject.iTailTableID = enterRoomResponse.m_iTailTableID;
         dataEvent.dataObject.m_stPlayerDetail = enterRoomResponse.m_stPlayerDetail;
         dataEvent.dataObject.m_nResultID = enterRoomResponse.m_nResultID;
         dataEvent.dataObject.m_szReasonMsg = enterRoomResponse.m_szReasonMsg;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2612(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var leaveRoomResponse:a_2944 = new a_2944();
         if(!leaveRoomResponse.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode leaveRoomResponse failed.");
            return;
         }
         if(0 == leaveRoomResponse.m_nResultID)
         {
            trace(leaveRoomResponse);
            dataEvent = new a_1778(EventType.a_575);
            dataEvent.dataObject = {
               "iServerID":null,
               "iRoomID":null
            };
            dataEvent.dataObject.iServerID = a_787.m_iServerID;
            dataEvent.dataObject.iRoomID = leaveRoomResponse.m_iRoomID;
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
         else
         {
            trace("退房失败:" + leaveRoomResponse.m_nResultID);
         }
      }
      
      private function a_2613(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         csPackageHeader.nPlayerID;
         var matchSignUpResponse:a_2948 = new a_2948();
         if(!matchSignUpResponse.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode matchSignUpResponse failed.");
            return;
         }
         if(0 == matchSignUpResponse.m_nResultID)
         {
            trace(matchSignUpResponse);
            trace("LobbyAdapterHandler.AddOrUpdateMyplayerDetail for RoomID:[" + matchSignUpResponse.m_iRoomID + "].");
            a_2445.a_2447(matchSignUpResponse.m_iRoomID,matchSignUpResponse.m_stPlayerDetail);
            dataEvent = new a_1778(EventType.a_570);
            dataEvent.dataObject = {
               "iServerID":null,
               "iMatchId":null,
               "iRoomID":null,
               "iLeftTime":null,
               "iBestScoreTimes":null,
               "iBestScoreNum":null
            };
            dataEvent.dataObject.iServerID = a_787.m_iServerID;
            dataEvent.dataObject.iMatchId = matchSignUpResponse.m_iMatchID;
            dataEvent.dataObject.iRoomID = matchSignUpResponse.m_iRoomID;
            dataEvent.dataObject.iLeftTime = matchSignUpResponse.m_iLeftTime;
            dataEvent.dataObject.iBestScoreTimes = matchSignUpResponse.m_stPlayerDetail.m_i51VIPLevel;
            dataEvent.dataObject.iBestScoreNum = matchSignUpResponse.m_stPlayerDetail.m_i51Score;
            a_1789.getInstance().dispatchEvent(dataEvent);
            a_2445.a_821[matchSignUpResponse.m_iRoomID] = matchSignUpResponse.m_iMatchID;
         }
         else
         {
            dataEvent = new a_1778(EventType.a_596);
            dataEvent.dataObject = {
               "nResultId":null,
               "iServerID":null,
               "iMatchId":null,
               "iRoomID":null,
               "szErrorMsg":null
            };
            dataEvent.dataObject.nResultId = matchSignUpResponse.m_nResultID;
            dataEvent.dataObject.iServerID = a_787.m_iServerID;
            dataEvent.dataObject.iMatchId = matchSignUpResponse.m_iMatchID;
            dataEvent.dataObject.iRoomID = matchSignUpResponse.m_iRoomID;
            dataEvent.dataObject.szErrorMsg = matchSignUpResponse.m_szReasonMsg;
            a_1789.getInstance().dispatchEvent(dataEvent);
            trace("比赛报名失败:" + matchSignUpResponse.m_szReasonMsg);
         }
      }
      
      private function a_2614(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         csPackageHeader.nPlayerID;
         var exitMatchResponse:a_2939 = new a_2939();
         if(!exitMatchResponse.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode exitMatchResponse failed.");
            return;
         }
         if(0 == exitMatchResponse.m_nResultID)
         {
            trace(exitMatchResponse);
            dataEvent = new a_1778(EventType.a_571);
            dataEvent.dataObject = {
               "iServerID":null,
               "iMatchId":null,
               "iRoomID":null
            };
            dataEvent.dataObject.iServerID = a_787.m_iServerID;
            dataEvent.dataObject.iMatchId = exitMatchResponse.m_iMatchID;
            dataEvent.dataObject.iRoomID = exitMatchResponse.m_iRoomID;
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
         else
         {
            trace("退赛失败:" + exitMatchResponse.m_szReasonMsg);
            dataEvent = new a_1778(EventType.a_600);
            dataEvent.dataObject = {
               "nResultId":null,
               "iServerID":null,
               "iMatchId":null,
               "iRoomID":null,
               "szErrorMsg":null
            };
            dataEvent.dataObject.nResultId = exitMatchResponse.m_nResultID;
            dataEvent.dataObject.iServerID = a_787.m_iServerID;
            dataEvent.dataObject.iMatchId = exitMatchResponse.m_iMatchID;
            dataEvent.dataObject.iRoomID = exitMatchResponse.m_iRoomID;
            dataEvent.dataObject.szErrorMsg = exitMatchResponse.m_szReasonMsg;
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
      }
      
      private function a_2615(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var viewMatchPlayerNumResponse:a_2962 = new a_2962();
         if(!viewMatchPlayerNumResponse.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode viewMatchPlayerNumResponse failed.");
            return;
         }
         if(0 == viewMatchPlayerNumResponse.m_nResultID)
         {
            trace(viewMatchPlayerNumResponse);
            dataEvent = new a_1778(EventType.a_583);
            dataEvent.dataObject = {
               "iServerID":null,
               "iMatchId":null,
               "iRoomID":null,
               "iSumPlayerMM":null,
               "iSumPlayerOther":null,
               "iRoomPlayerMM":null,
               "iRoomPlayerOther":null,
               "iBeginReestTime":null
            };
            dataEvent.dataObject.iServerID = a_787.m_iServerID;
            dataEvent.dataObject.iMatchId = viewMatchPlayerNumResponse.m_iMatchID;
            dataEvent.dataObject.iRoomID = viewMatchPlayerNumResponse.m_iRoomID;
            dataEvent.dataObject.iSumPlayerMM = viewMatchPlayerNumResponse.m_iSumPlayerMMCount;
            dataEvent.dataObject.iSumPlayerOther = viewMatchPlayerNumResponse.m_iSumPlayerOtherCount;
            dataEvent.dataObject.iRoomPlayerMM = viewMatchPlayerNumResponse.m_iRoomPlayerMMCount;
            dataEvent.dataObject.iRoomPlayerOther = viewMatchPlayerNumResponse.m_iRoomPlayerOtherCount;
            dataEvent.dataObject.iBeginReestTime = viewMatchPlayerNumResponse.m_iMatchBeginRestTime;
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
         else
         {
            dataEvent = new a_1778(EventType.a_598);
            dataEvent.dataObject = {
               "nResultId":null,
               "iServerID":null,
               "iMatchId":null,
               "szErrorMsg":null
            };
            dataEvent.dataObject.nResultId = viewMatchPlayerNumResponse.m_nResultID;
            dataEvent.dataObject.iServerID = a_787.m_iServerID;
            dataEvent.dataObject.iMatchId = viewMatchPlayerNumResponse.m_iMatchID;
            dataEvent.dataObject.szErrorMsg = viewMatchPlayerNumResponse.m_szReasonMsg;
            a_1789.getInstance().dispatchEvent(dataEvent);
            trace("查看报名人数失败:" + viewMatchPlayerNumResponse.m_szReasonMsg);
         }
      }
   }
}

