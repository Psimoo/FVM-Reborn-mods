package com.aurora.ui.maogoutd.crossserver
{
   import a_4716.a_1730;
   import a_4720.a_1748;
   import a_4723.a_1767;
   import a_4728.a_1778;
   import a_4729.EventType;
   import a_4729.a_1789;
   import a_4731.CommonEvent;
   import a_4752.a_2018;
   import a_4754.a_2161;
   import a_4767.b_176;
   import a_4789.a_4657;
   import com.aurora.protocol.hallserver.CAchievements;
   import com.aurora.protocol.hallserver.crossserver.CCSResponseBuyCrossDropCount;
   import com.aurora.protocol.logicserver.CNotifySendChatMsg;
   import com.aurora.protocol.logicserver.crossserver.CCSResponseCrossDropCount;
   import com.aurora.protocol.logicserver.crossserver.CNotifyCrossTableCreate;
   import com.aurora.protocol.logicserver.crossserver.CNotifyCrossTableStatusChange;
   import com.aurora.protocol.logicserver.crossserver.CResponseCrossGameResultGet;
   import com.aurora.protocol.logicserver.crossserver.CResponseCrossRoomList;
   import com.aurora.protocol.logicserver.crossserver.CrossRoomInfo;
   import com.aurora.protocol.logicserver.crossserver.GameResult;
   import com.aurora.protocol.logicserver.crossserver.TableStatusInfo;
   import com.aurora.ui.maogoutd.ClientLog.MessageTipHandler;
   import com.aurora.ui.maogoutd.component.a_3228;
   import com.aurora.ui.maogoutd.crossserver.data.ChatRoleInfo;
   import com.aurora.ui.maogoutd.crossserver.data.DetailRoomInfo;
   import com.aurora.ui.maogoutd.crossserver.data.MapItemData;
   import com.aurora.ui.maogoutd.role.a_4463;
   import com.u321.go.xutils.ObjectPool;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   
   public class CrossServerHandler
   {
      
      private static var m_pInstance:CrossServerHandler;
      
      private var m_iChatChannel:int = 2;
      
      private var m_pUpdateCallback:Function;
      
      private var m_pDIYUpdateCallback:Function;
      
      private var m_pShowPassWord:Function;
      
      private var m_vChatList:Vector.<CNotifySendChatMsg>;
      
      private var m_dictChatChannelList:Dictionary;
      
      private var m_bChatSizeIsMax:Boolean = false;
      
      private var m_iMyPlatformID:int = 0;
      
      private var m_stRole:a_4463;
      
      private var a_751:b_176;
      
      private var m_dictCrossRoomList:Dictionary;
      
      public var m_vNotifyCrossRoomInfo:Vector.<CrossRoomInfo>;
      
      private var m_vTempNotifyCrossRoomInfo:Vector.<CrossRoomInfo>;
      
      private var m_arrRoleAchievements:Array;
      
      public var m_iLogicRoomID:int = 0;
      
      public var m_bIsCrossServer:Boolean = false;
      
      private var m_iGroupID:int;
      
      public var m_strPlatFormName:String = "";
      
      private var m_iPlatform:int = -1;
      
      private var m_vCardWeight:Vector.<int>;
      
      private var m_iCardMaxLevel:int;
      
      private var m_iCardMaxLevelCnt:int;
      
      public var m_stCResponseCrossGameResultGet:CResponseCrossGameResultGet;
      
      private var m_vMapProgress:Vector.<MapItemData>;
      
      private var m_stPrivateChatRoleInfo:ChatRoleInfo = new ChatRoleInfo();
      
      private var m_iDataUpdateTime:int;
      
      private var m_iPingTime:Number;
      
      public var m_iUpdateFlag:int = 0;
      
      public var m_stCCSResponseCrossDropCount:CCSResponseCrossDropCount = new CCSResponseCrossDropCount();
      
      private var m_iCurrentProgressMapType:int = 0;
      
      private var m_dictRequestRoomListTime:Dictionary = new Dictionary();
      
      private var m_vTempRoomList:Vector.<CrossRoomInfo> = new Vector.<CrossRoomInfo>();
      
      public var m_sitdownInfo:Object;
      
      private var m_bIsFastRoom:Boolean;
      
      private var m_iServerTime:int = 0;
      
      public function CrossServerHandler()
      {
         super();
         this.m_vChatList = new Vector.<CNotifySendChatMsg>();
         this.m_dictChatChannelList = new Dictionary();
         this.m_dictCrossRoomList = new Dictionary();
         this.m_vNotifyCrossRoomInfo = new Vector.<CrossRoomInfo>();
         this.m_vTempNotifyCrossRoomInfo = new Vector.<CrossRoomInfo>();
         this.m_vMapProgress = new Vector.<MapItemData>(8);
         this.m_dictCrossRoomList[CrossServerDefine.ROOM_LIST_LEFT] = this.m_vNotifyCrossRoomInfo;
         this.m_dictCrossRoomList[CrossServerDefine.ROOM_LIST_LEFT_TEMP] = this.m_vTempNotifyCrossRoomInfo;
         a_1789.getInstance().addEventListener(EventType.a_574,this.a_3138);
         a_1789.getInstance().addEventListener(EventType.a_576,this.SitDownSuccessHandler);
         a_1789.getInstance().addEventListener(EventType.a_591,this.a_2547);
         a_1789.getInstance().addEventListener(EventType.a_601,this.OnStandUp_Success);
         a_1789.getInstance().addEventListener(EventType.CROSS_NOTIFY_CHAT_MSG,this.OnCNotifySendChatMsg);
         a_1789.getInstance().addEventListener(EventType.CROSS_ROOM_LIST,this.OnCResponseCrossRoomList);
         a_1789.getInstance().addEventListener(EventType.CROSS_GAME_RESULT,this.OnCResponseCrossGameResultGet);
         a_1789.getInstance().addEventListener(EventType.NOTIFY_CROSS_ROOM_STATE,this.OnCNotifyCrossTableStatusChange);
         a_1789.getInstance().addEventListener(EventType.NOTIFY_CROSS_ROOM_INFO_LIST,this.OnCNotifyCrossTableCreate);
         a_1789.getInstance().addEventListener(EventType.CROSS_DROP_COUNT,this.OnCCSResponseCrossDropCount);
         a_1789.getInstance().addEventListener(EventType.CROSS_BUY_DROP_COUNT,this.OnResponseBuyCrossDropCount);
         this.m_iGroupID = a_2161.e.getEnterRoom().m_iGroupID;
         this.m_vCardWeight = new Vector.<int>(20);
         for(var i:int = 0; i < 20; i++)
         {
            this.m_vCardWeight[i] = 0;
         }
      }
      
      public static function Get() : CrossServerHandler
      {
         if(!m_pInstance)
         {
            m_pInstance = new CrossServerHandler();
         }
         return m_pInstance;
      }
      
      public function get PrivateRoleInfo() : ChatRoleInfo
      {
         return this.m_stPrivateChatRoleInfo;
      }
      
      private function a_3138(e:a_1778) : void
      {
         var showEvent:CommonEvent = null;
         var vRoomInfo:Vector.<CrossRoomInfo> = null;
         var info:CrossRoomInfo = null;
         this.m_iGroupID = a_2161.e.getEnterRoom().m_iGroupID;
         if(this.m_iLogicRoomID != e.dataObject.iRoomID)
         {
            this.m_iLogicRoomID = e.dataObject.iRoomID;
            this.m_bIsCrossServer = a_2018.SetCrossServerState(this.m_iLogicRoomID);
            if(this.m_bIsCrossServer)
            {
               for each(vRoomInfo in this.m_dictCrossRoomList)
               {
                  while(vRoomInfo.length > 0)
                  {
                     info = vRoomInfo.pop();
                     ObjectPool.CheckIn(info);
                  }
               }
               this.ClearUpChat();
               this.UpdateData();
               this.OnCRequestCrossRoomList(CrossServerDefine.ROOM_LIST_RIGHT,0,true);
               this.OnRequestGameResult();
               this.OnCCSRequestCrossDropCount();
            }
            showEvent = new CommonEvent(EventType.SHOW_SYSTEM_MESSAGE_BANNER);
            showEvent.Data = this.m_bIsCrossServer;
            a_1789.getInstance().dispatchEvent(showEvent);
         }
      }
      
      public function GetRoleAchievements() : Array
      {
         if(null == this.m_arrRoleAchievements)
         {
            this.m_arrRoleAchievements = a_2161.e.GetRoleAchievements() as Array;
            return this.m_arrRoleAchievements;
         }
         if(this.m_iDataUpdateTime != a_1767.getInstance().SystemTime)
         {
            this.m_arrRoleAchievements = a_2161.e.GetRoleAchievements() as Array;
         }
         else
         {
            this.m_iDataUpdateTime = a_1767.getInstance().SystemTime;
         }
         return this.m_arrRoleAchievements;
      }
      
      public function GetAchievementStateByMapID(iMapID:int) : CAchievements
      {
         var achievement:CAchievements = null;
         this.m_arrRoleAchievements = this.GetRoleAchievements();
         for each(achievement in this.m_arrRoleAchievements)
         {
            if(achievement.m_nMapID == iMapID)
            {
               return achievement;
            }
         }
         return null;
      }
      
      public function a_2346() : a_4463
      {
         if(null == this.m_stRole)
         {
            this.m_stRole = a_2161.e.GetCurrentRole() as a_4463;
         }
         return this.m_stRole;
      }
      
      public function SetCallback(pFunc:Function, pShowPassWord:Function) : void
      {
         this.m_pUpdateCallback = pFunc;
         if(null != pFunc)
         {
            this.OnCCSRequestCrossDropCount();
         }
         this.m_pShowPassWord = pShowPassWord;
      }
      
      private function OnCNotifySendChatMsg(e:CommonEvent) : void
      {
         ++this.m_iUpdateFlag;
         var stNotify:CNotifySendChatMsg = e.Data as CNotifySendChatMsg;
         if(stNotify.m_iUin == this.a_2346().m_iRoleUin)
         {
            trace("ping:",getTimer() - this.m_iPingTime,"ms");
         }
         if(null == this.m_dictChatChannelList[stNotify.m_iType])
         {
            this.m_dictChatChannelList[stNotify.m_iType] = new Vector.<CNotifySendChatMsg>();
         }
         this.m_dictChatChannelList[stNotify.m_iType].push(stNotify);
         if(this.m_dictChatChannelList[stNotify.m_iType].length > 50)
         {
            while(this.m_dictChatChannelList[stNotify.m_iType].length > 20)
            {
               ObjectPool.CheckIn(this.m_dictChatChannelList[stNotify.m_iType].shift());
            }
         }
         this.UpdateData();
      }
      
      public function GetMsg(iType:int) : Vector.<CNotifySendChatMsg>
      {
         if(null == this.m_dictChatChannelList[iType])
         {
            this.m_dictChatChannelList[iType] = new Vector.<CNotifySendChatMsg>();
         }
         return this.m_dictChatChannelList[iType];
      }
      
      public function ChatResetSize(bMax:Boolean) : void
      {
         if(bMax == this.m_bChatSizeIsMax)
         {
            return;
         }
         this.m_bChatSizeIsMax = bMax;
         this.UpdateData();
      }
      
      public function get ChatSizeIsMax() : Boolean
      {
         return this.m_bChatSizeIsMax;
      }
      
      public function ClearUpChat() : void
      {
         ++this.m_iUpdateFlag;
         this.m_vChatList.length = 0;
         if(null != this.m_dictChatChannelList[this.m_iChatChannel])
         {
            this.m_dictChatChannelList[this.m_iChatChannel].length = 0;
         }
         this.UpdateData();
      }
      
      public function get CurrentChatChannel() : int
      {
         return this.m_iChatChannel;
      }
      
      public function SwitchChannel(iType:int) : void
      {
         if(CrossServerDefine.CHAT_COMMON != iType)
         {
            MessageTipHandler.Get().a_3146("该功能暂未开启！");
            return;
         }
         this.m_iChatChannel = iType;
         this.UpdateData();
      }
      
      public function SetDIYCallBack(pFunc:Function) : void
      {
         this.m_pDIYUpdateCallback = pFunc;
      }
      
      private function UpdateData() : void
      {
         if(null != this.m_pUpdateCallback)
         {
            if(this.m_bIsCrossServer)
            {
               this.m_pUpdateCallback();
            }
         }
         if(null != this.m_pDIYUpdateCallback)
         {
            this.m_pDIYUpdateCallback();
         }
      }
      
      private function OnResponseBuyCrossDropCount(e:CommonEvent) : void
      {
         var response:CCSResponseBuyCrossDropCount = e.Data;
         if(response.m_iRequestID == 0)
         {
            MessageTipHandler.Get().a_3146("购买成功");
            this.OnCCSRequestCrossDropCount();
         }
         else
         {
            MessageTipHandler.Get().a_3146("购买失败");
         }
      }
      
      public function OnBuyTime() : void
      {
         var iMoney:int = CrossXml.Get().GetBuyTimeMoney(this.m_stCCSResponseCrossDropCount.m_iBuyCount);
         a_2161.e.notify("OnRequestBuyCrossDropCount",this.a_2346().m_iRoleUin);
      }
      
      public function OnCCSRequestCrossDropCount() : void
      {
         if(this.m_bIsCrossServer)
         {
            a_4657.getInstance().execute("OnCCSRequestCrossDropCount",this,this.a_2346().m_iRoleUin);
         }
      }
      
      private function OnCCSResponseCrossDropCount(e:CommonEvent) : void
      {
         this.m_stCCSResponseCrossDropCount = e.Data;
         this.UpdateData();
      }
      
      public function OnRequestGameResult() : void
      {
         if(this.m_bIsCrossServer)
         {
            a_4657.getInstance().execute("OnRequestGameResult",this,this.a_2346().m_iRoleUin);
            this.m_iPingTime = getTimer();
            this.m_stCResponseCrossGameResultGet = null;
         }
      }
      
      public function get CurrentMapType() : int
      {
         return this.m_iCurrentProgressMapType;
      }
      
      public function GetSelectedIndexByMapType(iType:int) : int
      {
         var vMapList:Vector.<MapItemData> = CrossXml.Get().GetMapDataListByType(iType);
         vMapList.sort(this.sortFunction);
         if(null == this.m_stCResponseCrossGameResultGet || this.m_stCResponseCrossGameResultGet.m_nGameResultCount == 0 || 0 == CrossXml.Get().GetMapDataList().length)
         {
            return iType == 0 ? vMapList[0].m_iID : 0;
         }
         if(null == this.m_vMapProgress[iType])
         {
            if(iType == 1)
            {
               return vMapList[0].m_iID;
            }
            if(iType - 1 > 0 && this.m_vMapProgress[iType - 1] == null)
            {
               return 0;
            }
            return 0;
         }
         return this.m_vMapProgress[iType].NextID;
      }
      
      private function sortFunction(a:MapItemData, b:MapItemData) : int
      {
         return a.m_iPreID - b.m_iPreID;
      }
      
      public function GetProgressIDByMapType(iType:int) : int
      {
         var mapInfo:MapItemData = null;
         var nextInfo:MapItemData = null;
         var result:GameResult = null;
         if(null == this.m_stCResponseCrossGameResultGet || 0 == CrossXml.Get().GetMapDataList().length)
         {
            return 0;
         }
         if(null == this.m_vMapProgress[iType])
         {
            for each(result in this.m_stCResponseCrossGameResultGet.m_vGameResult)
            {
               mapInfo = CrossXml.Get().GetMapDataByMapID(result.m_iMapID);
               if(null != mapInfo)
               {
                  if(mapInfo.NextID > 0)
                  {
                     nextInfo = CrossXml.Get().GetMapDataByID(mapInfo.NextID);
                     if(null == this.m_vMapProgress[mapInfo.m_iMapType])
                     {
                        this.m_vMapProgress[mapInfo.m_iMapType] = mapInfo;
                     }
                     if(null == this.m_vMapProgress[nextInfo.m_iMapType])
                     {
                        this.m_vMapProgress[nextInfo.m_iMapType] = nextInfo;
                     }
                     if(Boolean(this.m_vMapProgress[mapInfo.m_iMapType]) && this.m_vMapProgress[mapInfo.m_iMapType].m_iPreID < mapInfo.m_iPreID)
                     {
                        this.m_vMapProgress[mapInfo.m_iMapType] = mapInfo;
                     }
                     if(Boolean(this.m_vMapProgress[nextInfo.m_iMapType]) && this.m_vMapProgress[nextInfo.m_iMapType].m_iPreID < nextInfo.m_iPreID)
                     {
                        this.m_vMapProgress[nextInfo.m_iMapType] = nextInfo;
                     }
                  }
                  else if(null == this.m_vMapProgress[mapInfo.m_iMapType])
                  {
                     this.m_vMapProgress[mapInfo.m_iMapType] = mapInfo;
                  }
                  else if(this.m_vMapProgress[mapInfo.m_iMapType].m_iPreID < mapInfo.m_iPreID)
                  {
                     this.m_vMapProgress[mapInfo.m_iMapType] = mapInfo;
                  }
               }
            }
         }
         if(null == this.m_vMapProgress[iType])
         {
            return 0;
         }
         return this.m_vMapProgress[iType].NextID;
      }
      
      private function OnCResponseCrossGameResultGet(e:CommonEvent) : void
      {
         var mapInfo:MapItemData = null;
         var result:GameResult = null;
         trace("ping:",getTimer() - this.m_iPingTime,"ms","OnCResponseCrossGameResultGet");
         this.m_stCResponseCrossGameResultGet = e.Data as CResponseCrossGameResultGet;
         if(0 == CrossXml.Get().GetMapDataList().length)
         {
            return;
         }
         for each(result in this.m_stCResponseCrossGameResultGet.m_vGameResult)
         {
            mapInfo = CrossXml.Get().GetMapDataByMapID(result.m_iMapID);
            if(null != mapInfo)
            {
               if(null == this.m_vMapProgress[mapInfo.m_iMapType])
               {
                  this.m_vMapProgress[mapInfo.m_iMapType] = mapInfo;
               }
               else if(this.m_vMapProgress[mapInfo.m_iMapType].m_iPreID < mapInfo.m_iPreID)
               {
                  this.m_vMapProgress[mapInfo.m_iMapType] = mapInfo;
               }
               if(this.m_iCurrentProgressMapType < mapInfo.m_iMapType)
               {
                  this.m_iCurrentProgressMapType = mapInfo.m_iMapType;
               }
            }
         }
         this.UpdateData();
      }
      
      private function NoRoom(iRoomID:int) : void
      {
         var vRoomInfo:Vector.<CrossRoomInfo> = null;
         var info:CrossRoomInfo = null;
         var i:int = 0;
         var len:int = 0;
         for each(vRoomInfo in this.m_dictCrossRoomList)
         {
            i = 0;
            len = int(vRoomInfo.length);
            i = 0;
            len = int(vRoomInfo.length);
            while(i < len)
            {
               info = vRoomInfo[i];
               if(info.m_iRoomID == iRoomID)
               {
                  vRoomInfo[i] = vRoomInfo[vRoomInfo.length - 1];
                  vRoomInfo.pop();
                  len = int(vRoomInfo.length);
                  ObjectPool.CheckIn(info);
               }
               else
               {
                  i++;
               }
            }
         }
      }
      
      private function OnCNotifyCrossTableStatusChange(e:CommonEvent) : void
      {
         var status:TableStatusInfo = null;
         var vRoomInfo:Vector.<CrossRoomInfo> = null;
         var info:CrossRoomInfo = null;
         var flag:Boolean = false;
         var bHasSeat:Boolean = false;
         var i:int = 0;
         var len:int = 0;
         var vTableStatusInfo:Vector.<TableStatusInfo> = (e.Data as CNotifyCrossTableStatusChange).m_vTableStatusInfo;
         this.m_dictCrossRoomList[CrossServerDefine.ROOM_LIST_LEFT] = this.m_vNotifyCrossRoomInfo;
         for each(vRoomInfo in this.m_dictCrossRoomList)
         {
            i = 0;
            len = int(vRoomInfo.length);
            while(i < len)
            {
               info = vRoomInfo[i];
               for each(status in vTableStatusInfo)
               {
                  if(status.m_iTableID == info.m_iRoomID)
                  {
                     if(info.m_iGameState != status.m_iGameState)
                     {
                        if(status.m_iGameState == CrossServerDefine.GAME_STATE_IN_GAME)
                        {
                           info.m_iPriority -= 20000000;
                        }
                        else if(info.m_iPriority < -10000000 && status.m_iGameState != CrossServerDefine.GAME_STATE_WAITING)
                        {
                           info.m_iPriority += 20000000;
                        }
                     }
                     if(info.m_iTeamState != status.m_iTeamState)
                     {
                        bHasSeat = Boolean(status.m_iTeamState % 4 * int(status.m_iTeamState / 4) == 0);
                        if(!bHasSeat)
                        {
                           info.m_iPriority -= 2000000;
                        }
                        else if(info.m_iPriority < -1000000 && bHasSeat)
                        {
                           info.m_iPriority += 2000000;
                        }
                     }
                     info.m_iTeamState = status.m_iTeamState;
                     info.m_iGameState = status.m_iGameState;
                  }
               }
               i++;
            }
            i = 0;
            len = int(vRoomInfo.length);
            while(i < len)
            {
               info = vRoomInfo[i];
               bHasSeat = Boolean(info.m_iTeamState % 4 * int(info.m_iTeamState / 4) == 0);
               if(info.m_iGameState == CrossServerDefine.GAME_STATE_PDESTROY)
               {
                  vRoomInfo[i] = vRoomInfo[vRoomInfo.length - 1];
                  vRoomInfo.pop();
                  len = int(vRoomInfo.length);
                  ObjectPool.CheckIn(info);
               }
               else if((vRoomInfo == this.m_vNotifyCrossRoomInfo || vRoomInfo == this.m_vTempNotifyCrossRoomInfo) && info.m_iGameState == CrossServerDefine.GAME_STATE_IN_GAME)
               {
                  vRoomInfo[i] = vRoomInfo[vRoomInfo.length - 1];
                  vRoomInfo.pop();
                  len = int(vRoomInfo.length);
                  ObjectPool.CheckIn(info);
               }
               else
               {
                  i++;
               }
            }
         }
         while(vTableStatusInfo.length > 0)
         {
            status = vTableStatusInfo.pop();
            ObjectPool.CheckIn(status);
         }
         ObjectPool.CheckIn(e.Data);
         this.UpdateData();
      }
      
      public function GetGameResult(data:MapItemData) : GameResult
      {
         var game:GameResult = null;
         if(null == this.m_stCResponseCrossGameResultGet)
         {
            return null;
         }
         for each(game in this.m_stCResponseCrossGameResultGet.m_vGameResult)
         {
            if(game.m_iMapID == data.m_iMapID)
            {
               return game;
            }
         }
         return null;
      }
      
      public function IsOpenByMapID(data:MapItemData) : Boolean
      {
         var game:GameResult = null;
         if(null == this.m_stCResponseCrossGameResultGet)
         {
            return false;
         }
         for each(game in this.m_stCResponseCrossGameResultGet.m_vGameResult)
         {
            if(game.m_iMapID == data.m_iPreMapID && data.m_iNeedCnt <= this.m_vCardWeight[data.m_iMinDefStar])
            {
               return true;
            }
         }
         return false;
      }
      
      public function SendMsg(msg:String) : void
      {
         if(msg == "" || msg == null)
         {
            return;
         }
         if(this.m_iChatChannel == CrossServerDefine.CHAT_PRIVATE)
         {
            if(this.m_iMyPlatformID == this.m_stPrivateChatRoleInfo.m_iPlatformID)
            {
            }
         }
         this.OnRequestSendChatMsg(2,this.a_2346().m_iRoleUin,this.m_iGroupID,0,msg);
      }
      
      public function SendMsgSpeaker(msg:String) : void
      {
         if(msg == "" || msg == null)
         {
            return;
         }
         if(this.m_iChatChannel == CrossServerDefine.CHAT_PRIVATE)
         {
            if(this.m_iMyPlatformID == this.m_stPrivateChatRoleInfo.m_iPlatformID)
            {
            }
         }
         this.OnRequestSendChatMsg(5,this.a_2346().m_iRoleUin,this.m_iGroupID,0,msg);
      }
      
      public function SendWorldBossMsg(msg:String) : void
      {
         if(msg == "" || msg == null)
         {
            return;
         }
         this.OnRequestSendChatMsg(4,this.a_2346().m_iRoleUin,this.m_iGroupID,0,msg);
      }
      
      private function OnRequestSendChatMsg(iType:int, iUin:int, iGroupID:int, iPlatformID:int, strMsg:String, iDstUin:int = 0, iDstGroupID:int = 0, iDstPlatformID:int = 0) : void
      {
         if(this.m_bIsCrossServer)
         {
            a_4657.getInstance().execute("OnRequestSendChatMsg",this,iType,iUin,iGroupID,iPlatformID,strMsg,iDstUin,iDstGroupID,iDstPlatformID);
            this.m_iPingTime = getTimer();
            return;
         }
      }
      
      public function OnCRequestCrossRoomList(iType:int, iSearchID:int = 0, bRefresh:Boolean = false) : void
      {
         var time:Number = NaN;
         if(!this.m_bIsCrossServer)
         {
            return;
         }
         if(!bRefresh)
         {
            if(null == this.m_dictRequestRoomListTime[iType])
            {
               this.m_dictRequestRoomListTime[iType] = getTimer();
            }
            else
            {
               time = Number(this.m_dictRequestRoomListTime[iType]);
               if(getTimer() - time < 500)
               {
                  return;
               }
            }
         }
         this.m_dictRequestRoomListTime[iType] = getTimer();
         a_4657.getInstance().execute("OnCRequestCrossRoomList",this,this.a_2346().m_iRoleUin,this.m_iLogicRoomID,iType,iSearchID);
         this.m_iPingTime = getTimer();
      }
      
      private function OnCNotifyCrossTableCreate(e:CommonEvent) : void
      {
         var stCrossRoomInfo:CrossRoomInfo = null;
         var stMapData:MapItemData = null;
         var bIsFilterable:Boolean = false;
         var notify:CNotifyCrossTableCreate = e.Data as CNotifyCrossTableCreate;
         if(CrossXml.Get().GetMapDataList().length == 0)
         {
            return;
         }
         while(notify.m_vCrossRoomInfo.length > 0)
         {
            bIsFilterable = false;
            stMapData = CrossXml.Get().GetMapDataByMapID(notify.m_vCrossRoomInfo[0].m_iMapID);
            if(stMapData.m_iTeamMinDefStar > this.m_iCardMaxLevel)
            {
               bIsFilterable = true;
            }
            else
            {
               for each(stCrossRoomInfo in this.m_vNotifyCrossRoomInfo)
               {
                  if(notify.m_vCrossRoomInfo[0].m_iRoomID == stCrossRoomInfo.m_iRoomID)
                  {
                     bIsFilterable = true;
                     break;
                  }
               }
               for each(stCrossRoomInfo in this.m_vTempNotifyCrossRoomInfo)
               {
                  if(notify.m_vCrossRoomInfo[0].m_iRoomID == stCrossRoomInfo.m_iRoomID)
                  {
                     bIsFilterable = true;
                     break;
                  }
               }
            }
            if(bIsFilterable)
            {
               ObjectPool.CheckIn(notify.m_vCrossRoomInfo.shift());
            }
            else
            {
               this.m_vNotifyCrossRoomInfo.unshift(notify.m_vCrossRoomInfo.shift());
            }
         }
         while(this.m_vNotifyCrossRoomInfo.length > 30)
         {
            ObjectPool.CheckIn(this.m_vNotifyCrossRoomInfo.pop());
         }
         while(this.m_vTempNotifyCrossRoomInfo.length > 30)
         {
            ObjectPool.CheckIn(this.m_vTempNotifyCrossRoomInfo.pop());
         }
         ObjectPool.CheckIn(notify);
         this.UpdateData();
      }
      
      private function OnCResponseCrossRoomList(e:CommonEvent) : void
      {
         var response:CResponseCrossRoomList = e.Data as CResponseCrossRoomList;
         if(response.m_nResultID != 0)
         {
            trace("拉取房间列表失败",response.m_nResultID);
            return;
         }
         this.SortRoomList(response);
         this.m_dictCrossRoomList[response.m_iType] = response.m_vRoomInfo;
         this.UpdateData();
      }
      
      public function GetCrossRoomList(iType:int, iSearchID:int = 0) : Vector.<CrossRoomInfo>
      {
         if(null == this.m_dictCrossRoomList[iType])
         {
            return this.m_vTempRoomList;
         }
         return this.m_dictCrossRoomList[iType] as Vector.<CrossRoomInfo>;
      }
      
      public function set TDLobbyLogic(value:b_176) : void
      {
         this.a_751 = value;
      }
      
      protected function OnStandUp_Success(e:a_1778) : void
      {
         if(false == CrossServerDefine.m_bSelfExit && this.m_bIsCrossServer)
         {
            MessageTipHandler.Get().a_3146("房主已退出，房间强制解散！");
         }
      }
      
      private function SitDownSuccessHandler(e:a_1778) : void
      {
         this.m_sitdownInfo = e.dataObject;
      }
      
      private function a_2547(e:a_1778) : void
      {
         if(this.m_bIsCrossServer)
         {
            if(e.dataObject.m_nResultID == 2069)
            {
               if(!this.m_bIsFastRoom)
               {
                  MessageTipHandler.Get().a_3146("密码错误!");
               }
               this.m_pShowPassWord(null);
               this.m_bIsFastRoom = false;
               this.UpdateData();
               return;
            }
            if(2052 == e.dataObject.m_nResultID)
            {
            }
            if(!MessageTipHandler.Get().ShowServerError(e.dataObject.m_nResultID))
            {
               MessageTipHandler.Get().a_3146("进房失败!");
            }
         }
      }
      
      public function a_2485(iMapID:int, strPassword:String) : void
      {
         CrossServerDefine.m_bSelfExit = false;
         if(CrossXml.Get().GetMapDataByMapID(iMapID).m_iMapType == 7)
         {
            this.a_751.a_2485(-1,-1,-1,0,"跨服竞技uin:" + this.a_2346().m_iRoleUin,strPassword,[iMapID],a_1748.enmGameMode_vs | 0x010000);
         }
         else
         {
            this.a_751.a_2485(-1,-1,-1,0,"跨服竞技uin:" + this.a_2346().m_iRoleUin,strPassword,[iMapID],a_1748.enmGameMode_vComputer | 0x010000);
         }
      }
      
      public function a_2483(info:DetailRoomInfo, bPassword:Boolean = false) : void
      {
         if(!bPassword && info.m_bLock)
         {
            this.m_pShowPassWord(info);
            this.UpdateData();
            return;
         }
         CrossServerDefine.m_bSelfExit = false;
         if(CrossXml.Get().GetMapDataByMapID(info.m_iMapID).m_iMapType == 7)
         {
            this.a_751.a_2485(-1,-1,info.m_iRoomID,-1,"跨服竞技uin:" + this.a_2346().m_iRoleUin,info.m_strPassword,[info.m_iMapID],a_1748.enmGameMode_vs | 0x010000);
         }
         else
         {
            this.a_751.a_2485(-1,-1,info.m_iRoomID,-1,"跨服竞技uin:" + this.a_2346().m_iRoleUin,info.m_strPassword,[info.m_iMapID],a_1748.enmGameMode_vComputer | 0x010000);
         }
      }
      
      public function FastEnterRoom(iRoomID:int = -2) : void
      {
         if(iRoomID > 0)
         {
            this.m_bIsFastRoom = true;
         }
         CrossServerDefine.m_bSelfExit = false;
         if(this.m_iLogicRoomID == 26)
         {
            this.a_751.a_2485(-1,-1,iRoomID,-1,"跨服竞技uin:" + this.a_2346().m_iRoleUin,"",[],a_1748.enmGameMode_vs | 0x010000);
         }
         else
         {
            this.a_751.a_2485(-1,-1,iRoomID,-1,"跨服竞技uin:" + this.a_2346().m_iRoleUin,"",[],a_1748.enmGameMode_vComputer | 0x010000);
         }
      }
      
      public function GetDetailRoomInfo(info:CrossRoomInfo) : DetailRoomInfo
      {
         var detailRoomInfo:DetailRoomInfo = ObjectPool.CheckOut(DetailRoomInfo) as DetailRoomInfo;
         detailRoomInfo.m_iRoomID = info.m_iRoomID;
         detailRoomInfo.m_iMapID = info.m_iMapID;
         detailRoomInfo.m_iGroupID = info.m_iGroupID;
         detailRoomInfo.m_szName = info.m_szName;
         detailRoomInfo.m_bLock = info.m_bLock;
         detailRoomInfo.m_strPassword = info.m_strPassword;
         detailRoomInfo.m_iGameState = info.m_iGameState;
         detailRoomInfo.m_iTeamState = info.m_iTeamState;
         detailRoomInfo.m_iCreateTime = info.m_iCreateTime;
         detailRoomInfo.m_strPlatformName = "platform:".concat(info.m_iPlatformID);
         detailRoomInfo.m_iStar = 0;
         detailRoomInfo.m_iCnt = 1;
         detailRoomInfo.m_strMapName = "0x".concat(info.m_iMapID.toString(16));
         detailRoomInfo.m_iMapLevel = 1;
         var mapData:MapItemData = CrossXml.Get().GetMapDataByMapID(info.m_iMapID);
         if(null == mapData)
         {
            return detailRoomInfo;
         }
         detailRoomInfo.m_iStar = mapData.m_iTeamMinDefStar;
         detailRoomInfo.m_iCnt = mapData.m_iTeamNeedCnt;
         detailRoomInfo.m_strMapName = mapData.m_strMapName;
         detailRoomInfo.m_iMapLevel = mapData.m_iMapLevel;
         detailRoomInfo.m_strPlatformName = CrossXml.Get().GetPlatformName(info.m_iPlatformID);
         return detailRoomInfo;
      }
      
      private function SortRoomList(response:CResponseCrossRoomList) : void
      {
         var arrDefCards:Array = null;
         var cardAttr:a_3228 = null;
         if(this.m_iPlatform == -1)
         {
            this.m_iPlatform = CrossXml.Get().GetPlatformID(this.m_strPlatFormName);
         }
         var i:int = 0;
         var iLevel:int = 0;
         if(this.m_iCardMaxLevel == 0 || this.m_iServerTime != a_1767.getInstance().SystemTime)
         {
            this.m_iCardMaxLevel = 0;
            arrDefCards = a_2161.e.GetCardsByType(a_1730.card_slot_package_game_card) as Array;
            for each(cardAttr in arrDefCards)
            {
               if(cardAttr.Type == 10 && this.m_iCardMaxLevel < cardAttr.TypeValue)
               {
                  this.m_iCardMaxLevel = cardAttr.TypeValue;
                  this.m_iCardMaxLevelCnt = 1;
               }
               else if(this.m_iCardMaxLevel > 0 && cardAttr.Type == 10 && this.m_iCardMaxLevel == cardAttr.TypeValue)
               {
                  ++this.m_iCardMaxLevelCnt;
               }
               if(cardAttr.Type == 10)
               {
                  iLevel = cardAttr.TypeValue;
                  for(i = 8; i <= iLevel; i++)
                  {
                     this.m_vCardWeight[i] += Math.pow(2,iLevel - i);
                  }
               }
            }
            this.m_iServerTime = a_1767.getInstance().SystemTime;
         }
         response.m_vRoomInfo.sort(this.SortByTime);
         var len:int = int(response.m_vRoomInfo.length);
         for(i = 0; i < len; i++)
         {
            response.m_vRoomInfo[i].m_iPriority = response.m_vRoomInfo.length - i;
            this.SetPriority(response.m_vRoomInfo[i]);
         }
         response.m_vRoomInfo.sort(this.SortByPriority);
      }
      
      private function SortByPriority(info1:CrossRoomInfo, info2:CrossRoomInfo) : int
      {
         if(info1.m_iPriority > info2.m_iPriority)
         {
            return -1;
         }
         if(info1.m_iPriority < info2.m_iPriority)
         {
            return 1;
         }
         return 0;
      }
      
      private function SortByTime(info1:CrossRoomInfo, info2:CrossRoomInfo) : int
      {
         if(info1.m_iCreateTime > info2.m_iCreateTime)
         {
            return 1;
         }
         if(info1.m_iCreateTime < info2.m_iCreateTime)
         {
            return -1;
         }
         return 0;
      }
      
      private function SetPriority(info:CrossRoomInfo) : void
      {
         var bHasSeat:Boolean = false;
         if(info.m_iGameState == CrossServerDefine.GAME_STATE_IN_GAME)
         {
            info.m_iPriority -= 20000000;
         }
         bHasSeat = Boolean(info.m_iTeamState % 4 * int(info.m_iTeamState / 4) == 0);
         if(!bHasSeat)
         {
            info.m_iPriority -= 2000000;
         }
         if(this.m_iGroupID == info.m_iGroupID && this.m_iPlatform == info.m_iPlatformID)
         {
            info.m_iPriority += 100000;
         }
         else if(this.m_iPlatform == info.m_iPlatformID)
         {
            info.m_iPriority += 10000;
         }
         var mapData:MapItemData = CrossXml.Get().GetMapDataByMapID(info.m_iMapID);
         if(null == mapData)
         {
            return;
         }
         if(this.m_iCardMaxLevel == mapData.m_iMinDefStar)
         {
            info.m_iPriority += 1000;
         }
         else if(this.m_iCardMaxLevel > mapData.m_iMinDefStar)
         {
            info.m_iPriority += 100;
         }
      }
   }
}

