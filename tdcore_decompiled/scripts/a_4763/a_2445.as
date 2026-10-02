package a_4763
{
   import a_4716.b_101;
   import a_4716.b_154;
   import a_4717.EnmEnterTableMode;
   import a_4717.EnmGameInitializeDataType;
   import a_4717.EnmPlayerStatus;
   import a_4717.EnmProxyCmd;
   import a_4717.EnmSendToGameDataType;
   import a_4722.a_1771;
   import a_4726.a_1770;
   import a_4757.a_2220;
   import a_4758.a_2208;
   import a_4759.b_151;
   import a_4759.b_153;
   import a_4760.a_2256;
   import a_4767.a_2545;
   import a_4771.a_2650;
   import com.aurora.protocol.a_2664;
   import com.aurora.protocol.common.a_2671;
   import com.aurora.protocol.game.CPlayerDetail;
   import com.aurora.protocol.logicserver.a_2919;
   import com.aurora.protocol.logicserver.a_2926;
   import com.aurora.protocol.logicserver.a_2929;
   import com.aurora.protocol.logicserver.a_2930;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestHeader;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.net.navigateToURL;
   import flash.utils.ByteArray;
   
   public class a_2445 implements b_153
   {
      
      private static var _lobbyAdapterHandlerArray:Array = new Array();
      
      private static var _stMyPlayerDetailsArray:Array = new Array();
      
      public static var a_821:Array = new Array();
      
      private var _mapGLRoutines:a_1771 = new a_1771();
      
      private var _pGameInstance:b_151;
      
      private var _pConnInfo:a_1770;
      
      private var _logicConn:a_2650;
      
      private var _pBaseProtocol:a_2220;
      
      private var a_822:Boolean = false;
      
      private var a_823:Boolean = false;
      
      private var a_824:Array = new Array();
      
      public function a_2445(pConnInfo:a_1770)
      {
         super();
         this._pConnInfo = new a_1770();
         this.a_2453(pConnInfo);
         this.a_2455(b_101.a_446,this.a_2457);
         this.a_2455(b_101.a_447,this.a_2458);
         this.a_2455(b_101.a_452,this.a_2459);
         this.a_2455(b_101.a_462,this.a_2461);
         this.a_2455(b_101.a_467,this.a_2462);
         this.a_2455(b_101.a_464,this.a_2464);
         this.a_2455(b_101.a_461,this.a_2460);
         this.a_2455(b_101.a_487,this.a_2468);
         this._pBaseProtocol = a_2220.getInstance();
      }
      
      public static function getInstance(pConnInfo:a_1770) : a_2445
      {
         var szHandlerKey:String = pConnInfo.m_iServerID + "_" + pConnInfo.m_iRoomID;
         if(null == _lobbyAdapterHandlerArray[szHandlerKey])
         {
            _lobbyAdapterHandlerArray[szHandlerKey] = new a_2445(pConnInfo);
         }
         else
         {
            (_lobbyAdapterHandlerArray[szHandlerKey] as a_2445).a_2453(pConnInfo);
         }
         return _lobbyAdapterHandlerArray[szHandlerKey];
      }
      
      public static function a_2446(pConnInfo:a_1770) : void
      {
         var szHandlerKey:String = pConnInfo.m_iServerID + "_" + pConnInfo.m_iRoomID;
         if(null != _lobbyAdapterHandlerArray[szHandlerKey])
         {
            _lobbyAdapterHandlerArray[szHandlerKey] = null;
            trace("LobbyAdapterHandler RemoveHandler  for key:" + szHandlerKey);
         }
      }
      
      public static function a_2447(roomId:int, myPlayerDetail:CPlayerDetail) : Boolean
      {
         _stMyPlayerDetailsArray[roomId] = myPlayerDetail;
         return true;
      }
      
      public static function a_2448(roomId:int) : Boolean
      {
         _stMyPlayerDetailsArray[roomId] = null;
         return true;
      }
      
      public static function a_2449(roomId:int) : CPlayerDetail
      {
         return _stMyPlayerDetailsArray[roomId];
      }
      
      public static function getLobbyAdapterHandlerByConnInfo(pConnInfo:a_1770) : a_2445
      {
         var szHandlerKey:String = pConnInfo.m_iServerID + "_" + pConnInfo.m_iRoomID;
         return _lobbyAdapterHandlerArray[szHandlerKey];
      }
      
      public static function a_2450() : Boolean
      {
         var lobbyHandler:a_2445 = null;
         for each(lobbyHandler in _lobbyAdapterHandlerArray)
         {
            if(lobbyHandler is a_2445)
            {
               lobbyHandler.a_1794();
            }
         }
         return true;
      }
      
      public static function a_2451() : Boolean
      {
         var lobbyHandler:a_2445 = null;
         var glPackageHeader:a_2671 = new a_2671();
         glPackageHeader.shMessageID = b_101.a_487;
         var lgBodyBuffer:ByteArray = new ByteArray();
         a_2664.encode_int8(lgBodyBuffer,EnmProxyCmd.a_401);
         a_2664.encode_int32(lgBodyBuffer,EnmSendToGameDataType.enm_td_rightclick_notify);
         for each(lobbyHandler in _lobbyAdapterHandlerArray)
         {
            if(lobbyHandler is a_2445)
            {
               lobbyHandler.a_2456(glPackageHeader,lgBodyBuffer);
            }
         }
         return true;
      }
      
      private function a_2452(pbyDataBuffer:ByteArray) : Boolean
      {
         var encode_length:int = 0;
         var requestGameData:a_2926 = new a_2926();
         requestGameData.m_iRoomID = this._pConnInfo.m_iRoomID;
         requestGameData.m_iTableID = this._pConnInfo.m_iTableID;
         requestGameData.m_nGameDataLength = pbyDataBuffer.length;
         requestGameData.m_szGameData = pbyDataBuffer;
         var finalBuffer:ByteArray = new ByteArray();
         requestGameData.encode(finalBuffer,encode_length);
         return this._pBaseProtocol.a_2201(this._logicConn,b_154.a_152,finalBuffer);
      }
      
      public function get isInitialized() : Boolean
      {
         return this.a_822;
      }
      
      public function a_2453(stConnInfo:a_1770) : void
      {
         this._pConnInfo.m_iServerID = stConnInfo.m_iServerID;
         this._pConnInfo.m_iGameID = stConnInfo.m_iGameID;
         this._pConnInfo.m_iRoomID = stConnInfo.m_iRoomID;
         this._pConnInfo.m_iTableID = stConnInfo.m_iTableID;
         this._logicConn = a_2256.getInstance().a_2258(this._pConnInfo.m_iServerID);
         if(null == this._logicConn)
         {
            return;
         }
      }
      
      public function a_1797(pGame:b_151, lpszInterProcessName:String) : Boolean
      {
         var lgMessageItem:Array = null;
         trace("LobbyAdapterHandler Initialize, pGame:" + pGame);
         if(pGame == null)
         {
            trace("LobbyAdapterHandler Initialize failed: pGame == null");
            return false;
         }
         this._pGameInstance = pGame;
         this._logicConn = a_2256.getInstance().a_2258(this._pConnInfo.m_iServerID);
         if(null == this._logicConn)
         {
            return false;
         }
         this.a_822 = true;
         while(this.a_824.length > 0)
         {
            lgMessageItem = this.a_824.shift() as Array;
            this.a_2456(lgMessageItem[0] as a_2671,lgMessageItem[1] as ByteArray);
         }
         return true;
      }
      
      public function a_2239() : void
      {
         this._pGameInstance = null;
      }
      
      public function a_2240(pbyDataBuffer:ByteArray) : Boolean
      {
         if(pbyDataBuffer == null || pbyDataBuffer.length <= 0)
         {
            trace("pbyDataBuffer is null or pbyDataBuffer.length <= 0");
            return false;
         }
         return this.a_2452(pbyDataBuffer);
      }
      
      public function a_2241(pbyDataBuffer:ByteArray) : Boolean
      {
         if(pbyDataBuffer == null || pbyDataBuffer.length <= 0)
         {
            trace("pbyDataBuffer is null or pbyDataBuffer.length <= 0");
            return false;
         }
         pbyDataBuffer.position = 0;
         var byDataType:int = int(a_2664.decode_uint16(pbyDataBuffer));
         switch(byDataType)
         {
            case b_101.a_488:
               this.a_2469(pbyDataBuffer);
               break;
            case b_101.a_489:
               this.a_2470(pbyDataBuffer);
               break;
            case b_101.a_490:
               this.a_2471(pbyDataBuffer);
               break;
            case b_101.a_491:
               this.a_2472(pbyDataBuffer);
               break;
            case b_101.a_492:
               this.a_2473(pbyDataBuffer);
               break;
            case b_101.a_496:
               this.a_2474(pbyDataBuffer);
               break;
            case b_101.a_494:
               this.a_2475(pbyDataBuffer);
               break;
            case b_101.a_495:
               this.a_2476(pbyDataBuffer);
               break;
            case b_101.a_497:
               this.a_2477(pbyDataBuffer);
               break;
            case b_101.a_498:
               this.a_2478(pbyDataBuffer);
               break;
            case b_101.a_499:
               this.a_2479(pbyDataBuffer);
               break;
            default:
               trace("Error GameDataType:[" + byDataType + "]");
               return false;
         }
         return true;
      }
      
      public function a_2242() : Boolean
      {
         var encode_length:int = 0;
         var requestStartGame:a_2930 = new a_2930();
         requestStartGame.m_iRoomID = this._pConnInfo.m_iRoomID;
         var finalBuffer:ByteArray = new ByteArray();
         requestStartGame.encode(finalBuffer,encode_length);
         return this._pBaseProtocol.a_2201(this._logicConn,b_154.a_153,finalBuffer);
      }
      
      public function a_2116(eStandUpMode:int) : Boolean
      {
         var encode_length:int = 0;
         var requestStandUp:a_2929 = new a_2929();
         requestStandUp.m_iRoomID = this._pConnInfo.m_iRoomID;
         requestStandUp.m_iTableID = this._pConnInfo.m_iTableID;
         requestStandUp.m_byMode = eStandUpMode;
         var finalBuffer:ByteArray = new ByteArray();
         requestStandUp.encode(finalBuffer,encode_length);
         return this._pBaseProtocol.a_2201(this._logicConn,b_154.a_149,finalBuffer);
      }
      
      public function a_2243(lpszChatMessage:String) : Boolean
      {
         return false;
      }
      
      public function a_2244(uin:uint, eReason:int) : Boolean
      {
         return false;
      }
      
      public function a_2245() : uint
      {
         return 0;
      }
      
      public function a_1794() : Boolean
      {
         return a_2545.getInstance().a_1794(this._pConnInfo.m_iServerID,this._pConnInfo.m_iRoomID);
      }
      
      private function a_2454() : Boolean
      {
         var encode_length:int = 0;
         var requestLeaveRoom:a_2919 = new a_2919();
         requestLeaveRoom.m_iRoomID = this._pConnInfo.m_iRoomID;
         var finalBuffer:ByteArray = new ByteArray();
         requestLeaveRoom.encode(finalBuffer,encode_length);
         return this._pBaseProtocol.a_2201(this._logicConn,b_154.a_129,finalBuffer);
      }
      
      private function a_2455(glMessageID:uint, fnRoutine:Function) : void
      {
         if(!this._mapGLRoutines.insert(glMessageID,fnRoutine))
         {
            trace("GLMessageId:" + glMessageID + " has been binded GL routine, insert failed");
         }
      }
      
      public function a_2456(glPackageHeader:a_2671, protocalBuffer:ByteArray) : void
      {
         var pCopyGlPackageHeader:a_2671 = null;
         var pCopyProtocolBody:ByteArray = null;
         var lgMessageItem:Object = null;
         if(glPackageHeader == null)
         {
            trace("glPackageHeader is null, OnRecieveLGPackage  failed");
         }
         if(!this.a_822)
         {
            pCopyGlPackageHeader = new a_2671();
            pCopyGlPackageHeader.nPackageLength = glPackageHeader.nPackageLength;
            pCopyGlPackageHeader.shHeaderLength = glPackageHeader.shHeaderLength;
            pCopyGlPackageHeader.shMessageID = glPackageHeader.shMessageID;
            pCopyGlPackageHeader.nSequence = glPackageHeader.nSequence;
            pCopyGlPackageHeader.nFlag = glPackageHeader.nFlag;
            pCopyProtocolBody = null;
            if(protocalBuffer is ByteArray)
            {
               pCopyProtocolBody = new ByteArray();
               pCopyProtocolBody.writeBytes(protocalBuffer,0,protocalBuffer.length);
            }
            lgMessageItem = [pCopyGlPackageHeader,protocalBuffer];
            this.a_824.push(lgMessageItem);
            return;
         }
         if(!this.a_823 && b_101.a_446 != glPackageHeader.shMessageID && b_101.a_462 != glPackageHeader.shMessageID && b_101.a_461 != glPackageHeader.shMessageID)
         {
            trace("Not recieve the initialize data before the package reach;");
            return;
         }
         if(null != this._mapGLRoutines[glPackageHeader.shMessageID])
         {
            if(protocalBuffer is ByteArray)
            {
               protocalBuffer.position = 0;
            }
            this._mapGLRoutines[glPackageHeader.shMessageID](glPackageHeader,protocalBuffer);
         }
         else
         {
            trace("Can\'t find the GLRoutine for MessageID:" + glPackageHeader.shMessageID);
         }
         glPackageHeader = null;
         protocalBuffer = null;
      }
      
      private function a_2457(glPackageHeader:a_2671, protocalBuffer:ByteArray) : void
      {
         var byDataType:int = 0;
         var stPlayerDetail:CPlayerDetail = null;
         var decode_lenght:int = 0;
         var byModMask:int = 0;
         var eEnterTableMode:int = 0;
         var byDataCount:* = a_2664.decode_int8(protocalBuffer);
         while(byDataCount-- > 0)
         {
            byDataType = a_2664.decode_int8(protocalBuffer);
            switch(byDataType)
            {
               case EnmGameInitializeDataType.enmGameInitializeDataType_MyPlayerDetail:
                  stPlayerDetail = new CPlayerDetail();
                  stPlayerDetail.decode(protocalBuffer,decode_lenght);
                  this._pGameInstance.a_1834(stPlayerDetail);
                  break;
               case EnmGameInitializeDataType.enmGameInitializeDataType_GameFlag:
                  byModMask = a_2664.decode_int8(protocalBuffer);
                  eEnterTableMode = EnmEnterTableMode.enmEnterTableMode_Invalid;
                  switch(byModMask)
                  {
                     case 1:
                        eEnterTableMode = EnmEnterTableMode.enmEnterTableMode_SitDown;
                        break;
                     case 2:
                        eEnterTableMode = EnmEnterTableMode.enmEnterTableMode_Observe;
                        break;
                     case 3:
                        eEnterTableMode = EnmEnterTableMode.enmEnterTableMode_Replay;
                  }
                  this._pGameInstance.a_1833(eEnterTableMode);
            }
         }
         this.a_823 = true;
      }
      
      private function a_2458(glPackageHeader:a_2671, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var stplayerDetail:CPlayerDetail = null;
         var playerDetailNum:* = a_2664.decode_int8(protocalBuffer);
         var playerDetailArray:Array = new Array();
         while(playerDetailNum-- > 0)
         {
            stplayerDetail = new CPlayerDetail();
            stplayerDetail.decode(protocalBuffer,decode_length);
            playerDetailArray.push(stplayerDetail);
         }
         if(playerDetailArray.length > 0)
         {
            this._pGameInstance.a_1835(playerDetailArray);
            playerDetailArray = null;
         }
      }
      
      private function a_2459(glPackageHeader:a_2671, protocalBuffer:ByteArray) : void
      {
         this._pGameInstance.a_1843();
      }
      
      private function a_2460(glPackageHeader:a_2671, protocalBuffer:ByteArray) : void
      {
         this._pGameInstance.a_1794();
      }
      
      private function a_2461(glPackageHeader:a_2671, protocalBuffer:ByteArray) : void
      {
         var iKickerID:int = a_2664.decode_int32(protocalBuffer);
         var nReason:int = a_2664.decode_int16(protocalBuffer);
         var szReason:String = a_2664.decode_string(protocalBuffer,2048);
         this._pGameInstance.a_1844(iKickerID,nReason,szReason);
      }
      
      private function a_2462(glPackageHeader:a_2671, protocalBuffer:ByteArray) : void
      {
      }
      
      private function a_2463(glPackageHeader:a_2671, protocalBuffer:ByteArray) : void
      {
      }
      
      private function a_2464(glPackageHeader:a_2671, protocalBuffer:ByteArray) : void
      {
         var byCmdType:int = 0;
         var bySeatID:int = 0;
         var byCmdSign:int = protocalBuffer.readByte();
         if(byCmdSign == EnmProxyCmd.a_401)
         {
            byCmdType = protocalBuffer.readByte();
            switch(byCmdType)
            {
               case EnmProxyCmd.enmProxyCmd_SC_UpdatePlayerDetail:
                  break;
               case EnmProxyCmd.enmProxyCmd_SC_StartGame:
                  this._pGameInstance.a_1846();
                  break;
               case EnmProxyCmd.enmProxyCmd_SC_EndGame:
                  this._pGameInstance.a_1847();
                  break;
               case EnmProxyCmd.enmProxyCmd_SC_OtherPlayerSitdown:
                  this.a_2465(protocalBuffer);
                  break;
               case EnmProxyCmd.enmProxyCmd_SC_OtherPlayerStandUp:
                  this.a_2466(protocalBuffer);
                  break;
               case EnmProxyCmd.enmProxyCmd_SC_OtherReady:
                  bySeatID = a_2664.decode_int8(protocalBuffer);
                  this._pGameInstance.a_1838(bySeatID);
                  break;
               case EnmProxyCmd.enmProxyCmd_BothWay_MagicShowMessage:
            }
            return;
         }
         --protocalBuffer.position;
         var iReadByte:int = protocalBuffer.readByte();
         --protocalBuffer.position;
         this._pGameInstance.a_1842(protocalBuffer);
      }
      
      private function a_2465(pbyBuffer:ByteArray) : void
      {
         var uin:int = 0;
         var stPlayerDetail:CPlayerDetail = null;
         var decodeLength:int = 0;
         if(pbyBuffer != null && pbyBuffer.bytesAvailable > 0)
         {
            uin = a_2664.decode_int32(pbyBuffer);
            stPlayerDetail = new CPlayerDetail();
            if(stPlayerDetail.a_2690(pbyBuffer,decodeLength))
            {
               stPlayerDetail.m_iUin = uin;
               if(stPlayerDetail.stUserGameInfo.iStatus == EnmPlayerStatus.enmPlayerStatus_Observing)
               {
                  this._pGameInstance.a_1840(stPlayerDetail);
               }
               else if(stPlayerDetail.stUserGameInfo.iStatus == EnmPlayerStatus.enmPlayerStatus_Seated)
               {
                  this._pGameInstance.a_1836(stPlayerDetail);
               }
               else if(stPlayerDetail.stUserGameInfo.iStatus == EnmPlayerStatus.enmPlayerStatus_ReadyToPlay)
               {
                  this._pGameInstance.a_1836(stPlayerDetail);
                  this._pGameInstance.a_1838(stPlayerDetail.stUserGameInfo.iSeatID);
               }
            }
         }
      }
      
      private function a_2466(pbyBuffer:ByteArray) : void
      {
         var uin:int = 0;
         var bySeatId:int = 0;
         var byObserver:int = 0;
         if(pbyBuffer != null && pbyBuffer.bytesAvailable > 0)
         {
            uin = a_2664.decode_int32(pbyBuffer);
            bySeatId = a_2664.decode_int8(pbyBuffer);
            byObserver = a_2664.decode_int8(pbyBuffer);
            if(byObserver == 1)
            {
               this._pGameInstance.a_1841(uin);
            }
            else
            {
               this._pGameInstance.a_1839(bySeatId);
            }
         }
      }
      
      public function a_2467(rankData:Array) : Boolean
      {
         if(!this.a_822)
         {
            trace("LobbyAdapterHandler not Initialized SetGameRankingData failed");
            return false;
         }
         if(null == rankData)
         {
            trace("rankData is null  SetGameRankingData failed");
            return false;
         }
         trace("SetGameRankingData _pGameInstance:" + this._pGameInstance + "ConnInfo:{serverid:" + this._pConnInfo.m_iServerID + "roomid:" + this._pConnInfo.m_iRoomID + "gameid:" + this._pConnInfo.m_iGameID + "}");
         this._pGameInstance.a_1837(rankData);
         return true;
      }
      
      private function a_2468(glPackageHeader:a_2671, protocalBuffer:ByteArray) : void
      {
         if(protocalBuffer != null && protocalBuffer.bytesAvailable > 0)
         {
            this._pGameInstance.a_1842(protocalBuffer);
         }
      }
      
      private function a_2469(protocalBuffer:ByteArray) : void
      {
         var iMatchID:int = int(a_821[this._pConnInfo.m_iRoomID]);
      }
      
      private function a_2470(protocalBuffer:ByteArray) : void
      {
         var iMatchRank:int = a_2664.decode_int32(protocalBuffer);
         var szCertificateData:ByteArray = new ByteArray();
         a_2664.decode_memory(protocalBuffer,szCertificateData,protocalBuffer.bytesAvailable);
         var iMatchID:int = int(a_821[this._pConnInfo.m_iRoomID]);
         var szMatchName:String = a_2256.getInstance().a_2260(this._pConnInfo.m_iServerID,iMatchID);
         var saveURLRequest:URLRequest = new URLRequest("http://www.123u.com/?c=game_certificate&a=save");
         saveURLRequest.method = URLRequestMethod.POST;
         var paras:URLVariables = new URLVariables();
         paras.uin = a_2208.getInstance().getUin();
         paras.game_id = this._pConnInfo.m_iGameID;
         paras.match_id = iMatchID;
         paras.match_name = szMatchName;
         paras.rank = iMatchRank;
         var stDate:Date = new Date();
         paras.time = stDate.fullYearUTC + "-" + stDate.monthUTC + "-" + stDate.dateUTC + " " + stDate.hoursUTC + ":" + stDate.minutesUTC + ":" + stDate.secondsUTC;
         saveURLRequest.data = paras;
         var loader:URLLoader = new URLLoader();
         loader.load(saveURLRequest);
         var header:URLRequestHeader = new URLRequestHeader("Content-type","application/octet-stream");
         var stNowDate:Date = new Date();
         var szFileName:String = szMatchName + "_第" + iMatchRank + "名_" + stNowDate.fullYear + "-" + stNowDate.month + "-" + stNowDate.date + "_" + stNowDate.hours + ":" + stNowDate.minutes + ".jpg";
         var jpgURLRequest:URLRequest = new URLRequest("export.php?file_name=" + encodeURI(szFileName));
         jpgURLRequest.requestHeaders.push(header);
         jpgURLRequest.method = URLRequestMethod.POST;
         jpgURLRequest.data = szCertificateData;
         navigateToURL(jpgURLRequest);
      }
      
      private function a_2471(protocalBuffer:ByteArray) : void
      {
      }
      
      private function a_2472(protocalBuffer:ByteArray) : void
      {
         var iUin:int = a_2664.decode_int32(protocalBuffer);
      }
      
      private function a_2473(protocalBuffer:ByteArray) : void
      {
      }
      
      private function a_2474(protocalBuffer:ByteArray) : void
      {
         var glPackageHeader:a_2671 = new a_2671();
         glPackageHeader.shMessageID = b_101.a_487;
         var lgBodyBuffer:ByteArray = new ByteArray();
         a_2664.encode_int8(lgBodyBuffer,EnmProxyCmd.a_401);
         a_2664.encode_int32(lgBodyBuffer,EnmSendToGameDataType.enm_td_game_get_currentrole);
         lgBodyBuffer.writeObject(a_2439.getInstance().GetCurrentRole());
         this.a_2456(glPackageHeader,lgBodyBuffer);
      }
      
      private function a_2475(protocalBuffer:ByteArray) : void
      {
      }
      
      private function a_2476(protocalBuffer:ByteArray) : void
      {
         var iSeatID:int = a_2664.decode_int8(protocalBuffer);
         var seatStatus:int = a_2664.decode_int8(protocalBuffer);
         a_2545.getInstance().a_2476(this._pConnInfo.m_iServerID,this._pConnInfo.m_iRoomID,this._pConnInfo.m_iTableID,iSeatID,seatStatus);
      }
      
      private function a_2477(protocalBuffer:ByteArray) : void
      {
         var iDictUIN:int = a_2664.decode_int32(protocalBuffer);
         var iAct:int = a_2664.decode_int16(protocalBuffer);
         var nCommandID:int = a_2664.decode_int32(protocalBuffer);
         var message:String = a_2664.decode_string(protocalBuffer,2048);
      }
      
      private function a_2478(protocalBuffer:ByteArray) : void
      {
         var m_byGameMode:int = a_2664.decode_int8(protocalBuffer);
         var m_iMapID:int = a_2664.decode_int32(protocalBuffer);
         var m_iMyLevel:int = a_2664.decode_int32(protocalBuffer);
         var m_iOppLevel:int = a_2664.decode_int32(protocalBuffer);
         var m_iTeamMateSex:int = a_2664.decode_int8(protocalBuffer);
         var m_iTeamLevel:int = a_2664.decode_int32(protocalBuffer);
         var m_iRoundTime:int = a_2664.decode_int32(protocalBuffer);
         var m_byRoundStep:int = a_2664.decode_int8(protocalBuffer);
         var m_iBossID:int = a_2664.decode_int32(protocalBuffer);
         var m_byLoseTeamID:int = a_2664.decode_int8(protocalBuffer);
         var m_iRemainEnergy:int = a_2664.decode_int32(protocalBuffer);
         var stMyGameResult:Object = protocalBuffer.readObject();
         var stTeamUseCards:Array = protocalBuffer.readObject();
         var mGameResult:Object = new Object();
         mGameResult.byGameMode = m_byGameMode;
         mGameResult.iMapID = m_iMapID;
         mGameResult.iOppLevel = m_iOppLevel;
         mGameResult.iMyLevel = m_iMyLevel;
         mGameResult.iTeamMateSex = m_iTeamMateSex;
         mGameResult.iTeamLevel = m_iTeamLevel;
         mGameResult.iRoundTime = m_iRoundTime;
         mGameResult.iBossID = m_iBossID;
         mGameResult.byRoundStep = m_byRoundStep;
         mGameResult.iWin = 1;
         mGameResult.arrUserCard = stMyGameResult.m_arrUseCardInfos;
         mGameResult.arrKilledMiceInfos = stMyGameResult.m_arrKilledMiceInfos;
         mGameResult.arrPickUpItemInfos = stMyGameResult.m_arrPickUpItemInfos;
         mGameResult.byTeamID = stMyGameResult.m_byTeamID;
         if(m_byLoseTeamID == mGameResult.byTeamID)
         {
            mGameResult.iWin = 0;
         }
         mGameResult.iTotalEnergy = stMyGameResult.m_iTotalEnergy;
         mGameResult.byIsConstraBattle = stMyGameResult.m_byIsConstraBattle;
         mGameResult.byRolePosition = stMyGameResult.m_byRolePosition;
         mGameResult.nGrade = stMyGameResult.m_nGrade;
         mGameResult.nGradeScore = stMyGameResult.m_nGradeScore;
         mGameResult.iCurrentWave = stMyGameResult.m_iCurrentWave;
         mGameResult.nJoinForceBuildingCount = stMyGameResult.m_nJoinForceBuildingCount;
         mGameResult.nDestroyOppBuildingCount = stMyGameResult.m_nDestroyOppBuildingCount;
         mGameResult.nDestroyByEnemyBuildingCount = stMyGameResult.m_nDestroyByEnemyBuildingCount;
         mGameResult.iPickUpCoinCount = stMyGameResult.m_iPickUpCoinCount;
         mGameResult.iExpericeCount = stMyGameResult.m_iExpericeCount;
         mGameResult.iAwardCoinCount = stMyGameResult.m_iAwardCoinCount;
         mGameResult.iHonourCount = stMyGameResult.m_iHonourCount;
         mGameResult.iRestEnergy = m_iRemainEnergy;
         mGameResult.iConstraScore = stMyGameResult.m_iConstraScore;
         mGameResult.iZhenxingtu = 0;
         mGameResult.iServerID = this._pConnInfo.m_iServerID;
         mGameResult.iRoomID = this._pConnInfo.m_iRoomID;
         mGameResult.iTableID = this._pConnInfo.m_iTableID;
         mGameResult.stTeamUseCards = stTeamUseCards;
         a_2545.getInstance().onNotifyGameResult(mGameResult);
      }
      
      private function a_2479(protocalBuffer:ByteArray) : void
      {
         a_2545.getInstance().onNotifyCancelGame();
      }
   }
}

