package a_4764
{
   import a_4716.EnmConsortia;
   import a_4720.EnmGameIM;
   import a_4728.a_1778;
   import a_4729.EventType;
   import a_4729.a_1779;
   import a_4729.a_1789;
   import a_4752.GameStringManager;
   import a_4752.a_2033;
   import a_4763.IPlayersCommonData;
   import a_4763.a_2608;
   import a_4789.IModulesBridge;
   import a_4789.a_4657;
   import com.aurora.protocol.hallserver.consortia.ConsortiaInfo;
   import com.aurora.ui.maogoutd.consortia.a_3340;
   import com.aurora.ui.maogoutd.im.IMUtil;
   import flash.utils.Dictionary;
   
   public class a_2332 implements b_175
   {
      
      private static var sign:Boolean;
      
      private static var _instance:a_2332;
      
      private var serverDataProtocol:b_174;
      
      private var playersCommonData:IPlayersCommonData;
      
      private var mBridge:IModulesBridge;
      
      private var membersDataFlag:Boolean = false;
      
      public function a_2332()
      {
         super();
         if(!sign)
         {
            throw new Error("请通过getInstance()方法获取引用！");
         }
         this.init();
      }
      
      public static function getInstance() : a_2332
      {
         if(null == _instance)
         {
            sign = true;
            _instance = new a_2332();
            sign = false;
         }
         return _instance;
      }
      
      public function a_1797(serverDataProtocol:b_174) : void
      {
         this.serverDataProtocol = serverDataProtocol;
         if(this.mBridge == null)
         {
            this.mBridge = a_4657.getInstance();
            this.mBridge.addListener(this);
            this.playersCommonData = a_2608.getInstance();
         }
      }
      
      public function onSetPlayersCommonData(dict:Dictionary) : void
      {
         var objData:Object = null;
         var obj:Object = null;
         var consortiaInfo:Object = a_2307.getInstance().getConsortiaInfo();
         if(consortiaInfo == null)
         {
            return;
         }
         if(consortiaInfo.m_stJoinInfo == null)
         {
            return;
         }
         if(consortiaInfo.m_stJoinInfo.m_iID == 0)
         {
            return;
         }
         var iUin:int = -1;
         var arrChangedMemberUin:Array = [];
         var arrChangeProposerUin:Array = [];
         for each(obj in dict)
         {
            objData = this.getUpdatePlayerData(obj);
            if(objData.arrPro.length > 0)
            {
               iUin = a_2307.getInstance().updateConsortiaMemberInfo(obj.m_iRoleUin,consortiaInfo.m_stConsortiaInfo.m_aryMember,objData.arrPro,objData.arrVal);
               if(iUin > -1)
               {
                  arrChangedMemberUin.push(iUin);
               }
               iUin = a_2307.getInstance().updateConsortiaMemberInfo(obj.m_iRoleUin,consortiaInfo.m_stConsortiaInfo.m_aryProposer,objData.arrPro,objData.arrVal);
               if(iUin > -1)
               {
                  arrChangeProposerUin.push(iUin);
               }
            }
         }
         if(arrChangedMemberUin.length > 0)
         {
            this.mBridge.execute("onUpdateConsortiaMemberInfo",this,null);
            iUin = int(a_2307.getInstance().getConsortiaInfo().m_stConsortiaInfo.m_iChairmanUIN);
            if(arrChangedMemberUin.indexOf(iUin) > -1)
            {
               this.mBridge.execute("onCommonDataChangeNotify",this,null);
            }
         }
         if(arrChangeProposerUin.length > 0)
         {
            this.mBridge.execute("onUpdateConsortiaProposer",this,null);
         }
      }
      
      public function getConsortiaUserData(arrUin:Array = null) : void
      {
         var arrMembers:Array = null;
         var arrProposers:Array = null;
         var len:int = 0;
         var myUin:int = 0;
         var iUin:int = 0;
         var i:int = 0;
         var obj:Object = null;
         if(arrUin != null)
         {
            this.playersCommonData.getPlayersCommonData(arrUin);
            return;
         }
         if(this.membersDataFlag)
         {
            return;
         }
         var consortiaInfo:Object = a_2307.getInstance().getConsortiaInfo();
         if(null != consortiaInfo.m_stConsortiaInfo && consortiaInfo.m_stJoinInfo.m_iID > 0)
         {
            if(consortiaInfo.m_stConsortiaInfo.m_nMemberNum > 0)
            {
               arrUin = [];
               arrMembers = consortiaInfo.m_stConsortiaInfo.m_aryMember;
               arrProposers = consortiaInfo.m_stConsortiaInfo.m_aryProposer;
               len = Math.max(arrMembers.length,arrProposers.length);
               myUin = a_2307.getInstance().getCurrentRoleUin();
               for(i = 0; i < len; i++)
               {
                  if(i < arrMembers.length)
                  {
                     obj = arrMembers[i];
                     iUin = int(obj.m_iUIN);
                     if(iUin != myUin)
                     {
                        if(isNaN(obj.m_iGamePoint * 1) || isNaN(obj.m_iUserSex * 1))
                        {
                           if(-1 == arrUin.indexOf(iUin))
                           {
                              arrUin.push(iUin);
                           }
                        }
                     }
                  }
                  if(i < arrProposers.length)
                  {
                     obj = arrProposers[i];
                     iUin = int(obj.m_iUIN);
                     if(iUin != myUin)
                     {
                        if(!(EnmConsortia.enm_request != arrProposers[i].m_cFlag && EnmConsortia.enm_invite != arrProposers[i].m_cFlag))
                        {
                           if(isNaN(obj.m_iGamePoint * 1) || isNaN(obj.m_iUserSex * 1))
                           {
                              if(-1 == arrUin.indexOf(iUin))
                              {
                                 arrUin.push(iUin);
                              }
                           }
                        }
                     }
                  }
               }
               this.membersDataFlag = arrUin.length == 0;
               if(!this.membersDataFlag)
               {
                  this.playersCommonData.getPlayersCommonData(arrUin);
               }
            }
         }
      }
      
      public function createConsortiaRequest(pData:Object) : Boolean
      {
         return this.serverDataProtocol.createConsortiaRequest(pData);
      }
      
      public function disengageConsortiaRequest(pData:Object) : Boolean
      {
         return this.serverDataProtocol.disengageConsortiaRequest(pData);
      }
      
      public function getConsortiaInfoRequest(pData:Object) : Boolean
      {
         return this.serverDataProtocol.getConsortiaInfoRequest(pData);
      }
      
      public function updateConsortiaInfoRequest(pData:Object) : Boolean
      {
         return this.serverDataProtocol.updateConsortiaInfoRequest(pData);
      }
      
      public function requestJoinConsortiaRequest(pData:Object) : Boolean
      {
         return this.serverDataProtocol.requestJoinConsortiaRequest(pData);
      }
      
      public function responseJoinConsortiaRequest(pData:Object) : Boolean
      {
         return this.serverDataProtocol.responseJoinConsortiaRequest(pData);
      }
      
      public function getConsortiaBriefRequest(pData:Object, iType:int = 0) : Boolean
      {
         return this.serverDataProtocol.getConsortiaBriefRequest(pData,iType);
      }
      
      public function kickConsortiaMemberRequest(pData:Object) : Boolean
      {
         return this.serverDataProtocol.kickConsortiaMemberRequest(pData);
      }
      
      public function setConsortiaAdminRequest(pData:Object) : Boolean
      {
         return this.serverDataProtocol.setConsortiaAdminRequest(pData);
      }
      
      public function consortiaSetNotifyRequest(pData:Object) : Boolean
      {
         return this.serverDataProtocol.consortiaSetNotifyRequest(pData);
      }
      
      public function requestSearchConsortia(pData:*) : Boolean
      {
         return this.getConsortiaBriefRequest(pData);
      }
      
      public function updatePlayConsortiaDataRequest(pData:Object) : Boolean
      {
         return true;
      }
      
      public function consortiaGetProposerListRequest(pData:Object) : Boolean
      {
         return this.serverDataProtocol.consortiaGetProposerListRequest(pData);
      }
      
      public function consortiaSetEnounceRequest(pData:Object) : Boolean
      {
         return this.serverDataProtocol.consortiaSetEnounceRequest(pData);
      }
      
      public function consortiaUpgradeRequest(pData:Object) : Boolean
      {
         return this.serverDataProtocol.consortiaUpgradeRequest(pData);
      }
      
      public function consortiaSetMemberTitleRequest(pData:Object) : Boolean
      {
         return this.serverDataProtocol.consortiaSetMemberTitleRequest(pData);
      }
      
      public function getJoinConsortiaInfoRequest(pData:Object) : Boolean
      {
         return this.serverDataProtocol.getJoinConsortiaInfoRequest(pData);
      }
      
      public function transferConsortiaMsgRequest(pData:Object) : Boolean
      {
         return this.serverDataProtocol.transferConsortiaMsgRequest(pData);
      }
      
      public function upgradeConsortiaEstablishmentRequest(pData:Object) : Boolean
      {
         return this.serverDataProtocol.upgradeConsortiaEstablishmentRequest(pData);
      }
      
      public function setConsortiaEstablishmentRequest(pData:Object) : Boolean
      {
         return this.serverDataProtocol.setConsortiaEstablishmentRequest(pData);
      }
      
      public function inviteJoinConsortiaRequest(pData:Object) : Boolean
      {
         return this.serverDataProtocol.inviteJoinConsortiaRequest(pData);
      }
      
      public function consortiaContributeRequest(pData:Object) : Boolean
      {
         return this.serverDataProtocol.consortiaContributeRequest(pData);
      }
      
      private function init() : void
      {
         this.eventsInit();
      }
      
      private function eventsInit() : void
      {
         var a_841:a_1779 = a_1789.getInstance();
         a_841.addEventListener(EventType.a_665,this.onCreateConsortiaResponse);
         a_841.addEventListener(EventType.a_666,this.onDisengageConsortiaResponse);
         a_841.addEventListener(EventType.a_667,this.onGetConsortiaInfoResponse);
         a_841.addEventListener(EventType.a_668,this.onUpdateConsortiaInfoResponse);
         a_841.addEventListener(EventType.a_669,this.onRequestJoinConsortiaResponse);
         a_841.addEventListener(EventType.a_670,this.onResponseJoinConsortiaResponse);
         a_841.addEventListener(EventType.a_671,this.onGetConsortiaBriefResponse);
         a_841.addEventListener(EventType.a_672,this.onKickConsortiaMemberResponse);
         a_841.addEventListener(EventType.a_673,this.onSetConsortiaAdminResponse);
         a_841.addEventListener(EventType.a_677,this.onSetConsortiaNotifyResponse);
         a_841.addEventListener(EventType.a_678,this.onSetConsortiaEnounceResponse);
         a_841.addEventListener(EventType.a_679,this.onUpgradeConsortiaResponse);
         a_841.addEventListener(EventType.a_680,this.onSetConsortiaMemberTitleResponse);
         a_841.addEventListener(EventType.a_681,this.onGetJoinConsortiaInfoResponse);
         a_841.addEventListener(EventType.a_682,this.onNotifyConsortiaEvent);
         a_841.addEventListener(EventType.a_684,this.onNotifyTransferConsortiaMsg);
         a_841.addEventListener(EventType.a_685,this.onUpgradeConsortiaEstablishmentResponse);
         a_841.addEventListener(EventType.a_686,this.onSetConsortiaEstablishmentResponse);
         a_841.addEventListener(EventType.a_687,this.onInviteJoinConsortiaResponse);
         a_841.addEventListener(EventType.a_688,this.onConsortiaContributeResponse);
         a_841.addEventListener(EventType.a_689,this.onGetValidConsortiaIDsResponse);
      }
      
      private function onCreateConsortiaResponse(a_4730:a_1778) : void
      {
         if(0 == a_4730.dataObject.m_nResult)
         {
            this.getJoinConsortiaInfoRequest(a_2307.getInstance().getCurrentRoleUin());
         }
         this.mBridge.execute("onCreateConsortiaResponse",this,a_4730.dataObject);
      }
      
      private function onDisengageConsortiaResponse(a_4730:a_1778) : void
      {
         if(0 == a_4730.dataObject.m_nResult)
         {
            this.getJoinConsortiaInfoRequest(a_2307.getInstance().getCurrentRoleUin());
         }
         this.mBridge.execute("onDisengageConsortiaResponse",this,a_4730.dataObject);
      }
      
      private function onGetConsortiaInfoResponse(a_4730:a_1778) : void
      {
         var m_stConsortiaInfo:ConsortiaInfo = null;
         var arrUin:Array = null;
         if(a_4730.dataObject.m_nResult == 0)
         {
            m_stConsortiaInfo = a_4730.dataObject.m_stConsortiaInfo as ConsortiaInfo;
            if(m_stConsortiaInfo)
            {
               if(m_stConsortiaInfo.m_iFlag & EnmConsortia.a_364)
               {
                  arrUin = a_2307.getInstance().setConsortiaProposerList(m_stConsortiaInfo);
                  this.playersCommonData.getPlayersCommonData(arrUin);
               }
            }
         }
      }
      
      private function onUpdateConsortiaInfoResponse(a_4730:a_1778) : void
      {
      }
      
      private function onRequestJoinConsortiaResponse(a_4730:a_1778) : void
      {
         var info:Object = null;
         var brief:Object = null;
         var k:* = undefined;
         var data:Object = a_4730.dataObject;
         if(0 == data.m_nResult)
         {
            info = {};
            info.m_iConsortiaID = data.m_iConsortiaID;
            info.m_cFlag = data.m_cCmd;
            info.m_cCmd = data.m_cCmd;
            if(EnmConsortia.enm_request == info.m_cCmd)
            {
               info.m_iTime = int(new Date().time / 1000);
               brief = a_2307.getInstance().getConsortiaInfo().m_dictConsortiaBrief[data.m_iConsortiaID];
               if(null == brief)
               {
                  this.getConsortiaBriefRequest([data.m_iConsortiaID]);
               }
               else
               {
                  for(k in brief)
                  {
                     info[k] = brief[k];
                  }
               }
            }
            a_2307.getInstance().updateConsortiaApplyInfo(info);
         }
         this.mBridge.execute("onRequestJoinConsortiaResponse",this,data);
      }
      
      private function onResponseJoinConsortiaResponse(a_4730:a_1778) : void
      {
         var data:Object = a_4730.dataObject;
         a_2307.getInstance().deleteProposersData(data);
         this.mBridge.execute("onResponseJoinConsortiaResponse",this,data);
      }
      
      private function onGetConsortiaBriefResponse(a_4730:a_1778) : void
      {
         var data:Object = a_4730.dataObject;
         if(0 == a_4730.dataObject.m_nResult && 0 == a_4730.dataObject.m_nAdjust)
         {
            data = a_2307.getInstance().updateByConsortiaBrief(a_4730.dataObject);
         }
         this.mBridge.execute("onGetConsortiaBriefResponse",this,data);
      }
      
      private function onKickConsortiaMemberResponse(a_4730:a_1778) : void
      {
         this.mBridge.execute("onKickConsortiaMemberResponse",this,a_4730.dataObject);
      }
      
      private function onSetConsortiaAdminResponse(a_4730:a_1778) : void
      {
         this.mBridge.execute("onSetConsortiaAdminResponse",this,a_4730.dataObject);
      }
      
      private function onSetConsortiaNotifyResponse(a_4730:a_1778) : void
      {
         this.mBridge.execute("onSetConsortiaNotifyResponse",this,a_4730.dataObject);
      }
      
      private function onSetConsortiaEnounceResponse(a_4730:a_1778) : void
      {
         this.mBridge.execute("onSetConsortiaEnounceResponse",this,a_4730.dataObject);
      }
      
      private function onUpgradeConsortiaResponse(a_4730:a_1778) : void
      {
         this.mBridge.execute("onUpgradeConsortiaResponse",this,a_4730.dataObject);
      }
      
      private function onSetConsortiaMemberTitleResponse(a_4730:a_1778) : void
      {
         this.mBridge.execute("onSetConsortiaMemberTitleResponse",this,a_4730.dataObject);
      }
      
      private function onGetJoinConsortiaInfoResponse(a_4730:a_1778) : void
      {
         var i:int = 0;
         var len:int = 0;
         var dictApplyInfo:Dictionary = null;
         var arrApplyInfo:Array = null;
         var applyInfo:Object = null;
         var obj:Object = a_4730.dataObject;
         a_2307.getInstance().setConsortiaInfo(obj);
         this.membersDataFlag = false;
         var consortiaInfo:Object = a_2307.getInstance().getConsortiaInfo();
         if(0 == obj.m_nResult)
         {
            if(0 == obj.m_stJoinInfo.m_iID)
            {
               dictApplyInfo = consortiaInfo.m_dictApplyInfo;
               if(null != dictApplyInfo)
               {
                  arrApplyInfo = new Array();
                  for each(applyInfo in dictApplyInfo)
                  {
                     arrApplyInfo.push(applyInfo.m_iConsortiaID);
                  }
                  if(0 < arrApplyInfo.length)
                  {
                     this.getConsortiaBriefRequest(arrApplyInfo);
                  }
               }
               this.getValidConsortiaIDs({
                  "m_iStart":1,
                  "m_iEnd":Math.min(consortiaInfo.m_iMaxConsortiaID + 1,10000)
               });
            }
         }
         this.mBridge.execute("onGetJoinConsortiaInfoResponse",this,a_4730.dataObject);
      }
      
      private function onNotifyConsortiaEvent(a_4730:a_1778) : void
      {
         var obj:Object = null;
         var iUin:int = 0;
         var consortiaInfo:Object = null;
         var systemMsg:String = null;
         var strUserName:String = null;
         var member:Object = null;
         var consortiaEvent:Object = null;
         var objApplyInfo:Object = null;
         var kickMember:Object = null;
         var beKickedMember:Object = null;
         var kickMemberName:String = null;
         var beKickedMemberName:String = null;
         var proposer:Object = null;
         var playerCommonData:Object = null;
         var objData:Object = null;
         var tempName:String = null;
         var brief:Object = null;
         var k:* = undefined;
         var objUpgradeConsortiaData:Object = null;
         var prevTitle:int = 0;
         obj = a_4730.dataObject;
         var len:int = int(obj.m_nEventCount);
         consortiaInfo = a_2307.getInstance().getConsortiaInfo();
         var dictJobTitle:Dictionary = a_3340.getJobTitle();
         var dictEstablishmentName:Dictionary = a_3340.getEstablishmentName();
         var dictTemp:Dictionary = new Dictionary(true);
         for(var i:int = 0; i < len; i++)
         {
            consortiaEvent = obj.m_stEvent[i];
            switch(consortiaEvent.m_nEvent)
            {
               case EnmConsortia.enm_accept_join:
                  if(0 == consortiaInfo.m_stJoinInfo.m_iID)
                  {
                     this.mBridge.execute("onJoinRequestHandlerNotify",this,{
                        "m_iValue":consortiaEvent.m_iValue,
                        "m_iRefuse":EnmConsortia.enm_accept
                     });
                  }
                  break;
               case EnmConsortia.enm_refuse_join:
                  if(0 == consortiaInfo.m_stJoinInfo.m_iID)
                  {
                     a_2307.getInstance().updateConsortiaApplyInfo({
                        "m_cCmd":EnmConsortia.enm_cancel,
                        "m_iConsortiaID":obj.m_iConsortiaID
                     });
                     this.mBridge.execute("onJoinRequestHandlerNotify",this,{
                        "m_iValue":consortiaEvent.m_iValue,
                        "m_iRefuse":EnmConsortia.enm_refuse
                     });
                  }
                  break;
               case EnmConsortia.enm_disengage:
                  if(0 != consortiaInfo.m_stJoinInfo.m_iID)
                  {
                     member = a_2307.getInstance().deleteConsortiaMember(consortiaEvent.m_iValue);
                     if(null != member)
                     {
                        this.mBridge.execute("onSomebodyJoinOrDisengageNotify",this,member,EnmConsortia.enm_disengage);
                        this.mBridge.execute("onUpdateConsortiaMemberInfo",this,null);
                        strUserName = IMUtil.showUserInMsgFormat(member.m_iUIN,member.m_czName);
                        systemMsg = GameStringManager.getInstance().getString(135456,[strUserName]);
                        systemMsg = IMUtil.sendMsgFormat({
                           "tag":EnmGameIM.a_507,
                           "msg":systemMsg
                        });
                        this.mBridge.execute("onSystemMessageNotify",this,systemMsg);
                     }
                  }
                  break;
               case EnmConsortia.enm_dismiss:
                  if(consortiaEvent.m_iValue != a_2307.getInstance().getCurrentRoleUin())
                  {
                     if(0 != consortiaInfo.m_stJoinInfo.m_iID)
                     {
                        this.mBridge.execute("onDismissConsortiaNotify",this);
                        this.mBridge.execute("onBeKickedNotify",this,EnmConsortia.enm_dismiss);
                     }
                  }
                  break;
               case EnmConsortia.enm_kick_member:
                  if(0 != consortiaInfo.m_stJoinInfo.m_iID)
                  {
                     if(a_2307.getInstance().getCurrentRoleUin() == consortiaEvent.m_stBeKicked.m_iDstUIN)
                     {
                        this.mBridge.execute("onBeKickedNotify",this,EnmConsortia.enm_kick_member);
                     }
                     else
                     {
                        kickMember = a_2307.getInstance().getConsortiaMember(consortiaEvent.m_stBeKicked.m_iSrcUIN);
                        beKickedMember = a_2307.getInstance().deleteConsortiaMember(consortiaEvent.m_stBeKicked.m_iDstUIN);
                        kickMemberName = IMUtil.showUserInMsgFormat(kickMember.m_iUIN,kickMember.m_czName);
                        beKickedMemberName = IMUtil.showUserInMsgFormat(beKickedMember.m_iUIN,beKickedMember.m_czName);
                        systemMsg = GameStringManager.getInstance().getString(135457,[beKickedMemberName,kickMemberName]);
                        systemMsg = IMUtil.sendMsgFormat({
                           "tag":EnmGameIM.a_507,
                           "msg":systemMsg
                        });
                        this.mBridge.execute("onSystemMessageNotify",this,systemMsg);
                        this.mBridge.execute("onSomebodyJoinOrDisengageNotify",this,beKickedMember,EnmConsortia.enm_disengage);
                        this.mBridge.execute("onUpdateConsortiaMemberInfo",this,null);
                     }
                  }
                  break;
               case EnmConsortia.enm_endow:
                  if(0 != consortiaInfo.m_stJoinInfo.m_iID)
                  {
                     iUin = a_2307.getInstance().updateEndow(consortiaEvent.m_stContribute);
                     this.mBridge.execute("onUpdateConsortiaMemberInfo",this,null);
                     this.mBridge.execute("onCommonDataChangeNotify",this,null);
                     this.mBridge.execute("onEndowChangedNotify",this,iUin);
                     member = a_2307.getInstance().getConsortiaMember(iUin);
                     strUserName = IMUtil.showUserInMsgFormat(member.m_iUIN,member.m_czName);
                     systemMsg = GameStringManager.getInstance().getString(135458,[strUserName,consortiaEvent.m_stContribute.m_iPoint,consortiaEvent.m_stContribute.m_iCoin]);
                     systemMsg = IMUtil.sendMsgFormat({
                        "tag":EnmGameIM.a_507,
                        "msg":systemMsg
                     });
                     this.mBridge.execute("onSystemMessageNotify",this,systemMsg);
                  }
                  break;
               case EnmConsortia.enm_refresh_establishment:
                  if(0 != consortiaInfo.m_stJoinInfo.m_iID)
                  {
                     if(a_2307.getInstance().refreshEstablishment(consortiaEvent.m_stEstablismentSetting))
                     {
                        member = a_2307.getInstance().getConsortiaMember(consortiaEvent.m_stEstablismentSetting.m_iSrcUIN);
                        this.mBridge.execute("onRefreshEstablishmentNotify",this,consortiaEvent.m_stEstablismentSetting);
                        strUserName = IMUtil.showUserInMsgFormat(0,member.m_czName);
                        systemMsg = GameStringManager.getInstance().getString(135459,[dictJobTitle[member.m_cTitle] + strUserName,dictEstablishmentName[consortiaEvent.m_stEstablismentSetting.m_iEstablisment]]);
                        systemMsg = IMUtil.sendMsgFormat({
                           "tag":EnmGameIM.a_507,
                           "msg":systemMsg
                        });
                        this.mBridge.execute("onSystemMessageNotify",this,systemMsg);
                     }
                  }
                  break;
               case EnmConsortia.enm_request_join:
                  if(0 != consortiaInfo.m_stJoinInfo.m_iID)
                  {
                     consortiaEvent.m_stRequestJoin.m_cFlag = EnmConsortia.enm_request;
                     iUin = int(consortiaEvent.m_stRequestJoin.m_iSrcUIN);
                     proposer = a_2307.getInstance().addNewProposer(consortiaEvent.m_stRequestJoin);
                     playerCommonData = a_2608.getInstance().getAllPlayersCommonData()[iUin];
                     if(playerCommonData)
                     {
                        objData = this.getUpdatePlayerData(playerCommonData);
                        a_2307.getInstance().updateConsortiaMemberInfo(iUin,consortiaInfo.m_stConsortiaInfo.m_aryProposer,objData.arrPro,objData.arrVal);
                        if(consortiaInfo.m_stJoinInfo.m_cTitle == EnmConsortia.a_350 || consortiaInfo.m_stJoinInfo.m_cTitle == EnmConsortia.a_351)
                        {
                           this.mBridge.execute("onJoinConsortiaRequestNotify",this,true);
                        }
                        this.mBridge.execute("onUpdateConsortiaProposer",this,null);
                        this.mBridge.execute("onRequestJoinNotify",this,proposer);
                     }
                     else
                     {
                        this.playersCommonData.getPlayersCommonData([iUin]);
                     }
                  }
                  break;
               case EnmConsortia.enm_cancel_admin:
                  if(0 != consortiaInfo.m_stJoinInfo.m_iID)
                  {
                     iUin = int(consortiaEvent.m_iValue);
                     a_2307.getInstance().changeConsortiaAdmin({
                        "m_iFlag":EnmConsortia.a_358,
                        "m_iUin":iUin
                     });
                     this.mBridge.execute("onChangeAdminNotify",this,{
                        "m_iFlag":EnmConsortia.a_358,
                        "m_iUin":iUin
                     });
                     member = a_2307.getInstance().getConsortiaMember(iUin);
                     strUserName = IMUtil.showUserInMsgFormat(member.m_iUIN,member.m_czName);
                     systemMsg = GameStringManager.getInstance().getString(135460,[strUserName,dictJobTitle[member.m_cTitle]]);
                     systemMsg = IMUtil.sendMsgFormat({
                        "tag":EnmGameIM.a_507,
                        "msg":systemMsg
                     });
                     this.mBridge.execute("onSystemMessageNotify",this,systemMsg);
                  }
                  break;
               case EnmConsortia.enm_set_admin:
                  if(0 != consortiaInfo.m_stJoinInfo.m_iID)
                  {
                     iUin = int(consortiaEvent.m_iValue);
                     a_2307.getInstance().changeConsortiaAdmin({
                        "m_iFlag":EnmConsortia.a_357,
                        "m_iUin":iUin
                     });
                     this.mBridge.execute("onChangeAdminNotify",this,{
                        "m_iFlag":EnmConsortia.a_357,
                        "m_iUin":iUin
                     });
                     member = a_2307.getInstance().getConsortiaMember(iUin);
                     strUserName = IMUtil.showUserInMsgFormat(member.m_iUIN,member.m_czName);
                     systemMsg = GameStringManager.getInstance().getString(135461,[strUserName]);
                     systemMsg = IMUtil.sendMsgFormat({
                        "tag":EnmGameIM.a_507,
                        "msg":systemMsg
                     });
                     this.mBridge.execute("onSystemMessageNotify",this,systemMsg);
                  }
                  break;
               case EnmConsortia.enm_set_sysadmin:
                  if(0 != consortiaInfo.m_stJoinInfo.m_iID)
                  {
                     iUin = int(consortiaEvent.m_iValue);
                     tempName = IMUtil.showUserInMsgFormat(iUin,consortiaInfo.m_stConsortiaInfo.m_czChairmanName);
                     a_2307.getInstance().changeConsortiaAdmin({
                        "m_iFlag":EnmConsortia.a_359,
                        "m_iUin":iUin
                     });
                     this.mBridge.execute("onChangeAdminNotify",this,{
                        "m_iFlag":EnmConsortia.a_359,
                        "m_iUin":iUin
                     });
                     member = a_2307.getInstance().getConsortiaMember(iUin);
                     strUserName = IMUtil.showUserInMsgFormat(member.m_iUIN,member.m_czName);
                     systemMsg = GameStringManager.getInstance().getString(135462,[tempName,strUserName]);
                     systemMsg = IMUtil.sendMsgFormat({
                        "tag":EnmGameIM.a_507,
                        "msg":systemMsg
                     });
                     this.mBridge.execute("onSystemMessageNotify",this,systemMsg);
                  }
                  break;
               case EnmConsortia.enm_somebody_join:
                  if(0 != consortiaInfo.m_stJoinInfo.m_iID)
                  {
                     a_2307.getInstance().addNewConsortiaMember(consortiaEvent.m_stSomebodyJoin);
                     this.playersCommonData.getPlayersCommonData([consortiaEvent.m_stSomebodyJoin.m_iSrcUIN]);
                     this.mBridge.execute("onSomebodyJoinOrDisengageNotify",this,consortiaEvent.m_stSomebodyJoin,EnmConsortia.enm_somebody_join);
                     this.mBridge.execute("onUpdateConsortiaMemberInfo",this,null);
                     strUserName = IMUtil.showUserInMsgFormat(consortiaEvent.m_stSomebodyJoin.m_iSrcUIN,consortiaEvent.m_stSomebodyJoin.m_szRoleName);
                     systemMsg = GameStringManager.getInstance().getString(135463,[strUserName]);
                     systemMsg = IMUtil.sendMsgFormat({
                        "tag":EnmGameIM.a_507,
                        "msg":systemMsg
                     });
                     this.mBridge.execute("onSystemMessageNotify",this,systemMsg);
                  }
                  break;
               case EnmConsortia.enm_invite_join:
                  if(0 == consortiaInfo.m_stJoinInfo.m_iID)
                  {
                     objApplyInfo = consortiaInfo.m_dictApplyInfo[obj.m_iConsortiaID + "-" + EnmConsortia.enm_invite];
                     if(null == objApplyInfo)
                     {
                        objApplyInfo = {};
                        objApplyInfo.m_iConsortiaID = obj.m_iConsortiaID;
                        objApplyInfo.m_cFlag = EnmConsortia.enm_invite;
                        objApplyInfo.m_cCmd = EnmConsortia.enm_invite;
                        objApplyInfo.m_iTime = int(new Date().time / 1000);
                        brief = consortiaInfo.m_dictConsortiaBrief[obj.m_iConsortiaID];
                        if(null == brief)
                        {
                           this.getConsortiaBriefRequest([obj.m_iConsortiaID]);
                        }
                        else
                        {
                           for(k in brief)
                           {
                              objApplyInfo[k] = brief[k];
                           }
                        }
                     }
                     consortiaInfo.m_dictApplyInfo[obj.m_iConsortiaID + "-" + EnmConsortia.enm_invite] = objApplyInfo;
                     this.mBridge.execute("onInviteJoinNotify",this,{
                        "requestInfo":consortiaEvent.m_stInviteJoin,
                        "replyInfo":objApplyInfo
                     });
                  }
                  break;
               case EnmConsortia.enm_state_change:
                  if(0 != consortiaInfo.m_stJoinInfo.m_iID)
                  {
                     consortiaInfo.m_nFlag = consortiaEvent.m_iValue;
                     this.mBridge.execute("onConsortiaStateChangeNotify",this,consortiaEvent.m_iValue);
                  }
                  break;
               case EnmConsortia.enm_upgrade:
                  if(0 != consortiaInfo.m_stJoinInfo.m_iID)
                  {
                     member = a_2307.getInstance().getConsortiaMember(consortiaEvent.m_stConsortiaLevel.m_iSrcUIN);
                     objUpgradeConsortiaData = {
                        "m_iEstablisment":EnmConsortia.CONSORTIA,
                        "m_nLevel":consortiaEvent.m_stConsortiaLevel.m_nLevel
                     };
                     a_2307.getInstance().upgradeEstablistmentLevel(objUpgradeConsortiaData);
                     this.mBridge.execute("onUpgradeEstablistmentNotify",this,objUpgradeConsortiaData);
                     strUserName = IMUtil.showUserInMsgFormat(0,member.m_czName);
                     systemMsg = GameStringManager.getInstance().getString(135464,[dictJobTitle[member.m_cTitle] + strUserName,dictEstablishmentName[EnmConsortia.CONSORTIA],consortiaEvent.m_stConsortiaLevel.m_nLevel]);
                     systemMsg = IMUtil.sendMsgFormat({
                        "tag":EnmGameIM.a_507,
                        "msg":systemMsg
                     });
                     this.mBridge.execute("onSystemMessageNotify",this,systemMsg);
                  }
                  break;
               case EnmConsortia.enm_upgrade_establishment:
                  if(0 != consortiaInfo.m_stJoinInfo.m_iID)
                  {
                     member = a_2307.getInstance().getConsortiaMember(consortiaEvent.m_stEstablismentLevel.m_iSrcUIN);
                     a_2307.getInstance().upgradeEstablistmentLevel(consortiaEvent.m_stEstablismentLevel);
                     this.mBridge.execute("onUpgradeEstablistmentNotify",this,consortiaEvent.m_stEstablismentLevel);
                     strUserName = IMUtil.showUserInMsgFormat(0,member.m_czName);
                     systemMsg = GameStringManager.getInstance().getString(135464,[dictJobTitle[member.m_cTitle] + strUserName,dictEstablishmentName[consortiaEvent.m_stEstablismentLevel.m_iEstablisment],consortiaEvent.m_stEstablismentLevel.m_nLevel]);
                     systemMsg = IMUtil.sendMsgFormat({
                        "tag":EnmGameIM.a_507,
                        "msg":systemMsg
                     });
                     this.mBridge.execute("onSystemMessageNotify",this,systemMsg);
                  }
                  break;
               case EnmConsortia.enm_online:
                  break;
               case EnmConsortia.enm_notify_change:
                  if(0 != consortiaInfo.m_stJoinInfo.m_iID)
                  {
                     a_2307.getInstance().updateConsortiaNotify(consortiaEvent.m_stNotifyChange);
                     this.mBridge.execute("onConsortiaNotifyNotify",this,consortiaEvent.m_stNotifyChange.m_czContent);
                     member = a_2307.getInstance().getConsortiaMember(consortiaEvent.m_stNotifyChange.m_iSrcUIN);
                     strUserName = IMUtil.showUserInMsgFormat(member.m_iUIN,member.m_czName);
                     systemMsg = GameStringManager.getInstance().getString(135465,[dictJobTitle[member.m_cTitle] + strUserName]);
                     systemMsg = IMUtil.sendMsgFormat({
                        "tag":EnmGameIM.a_507,
                        "msg":systemMsg
                     });
                     this.mBridge.execute("onSystemMessageNotify",this,systemMsg);
                  }
                  break;
               case EnmConsortia.enm_enounce_change:
                  if(0 != consortiaInfo.m_stJoinInfo.m_iID)
                  {
                     a_2307.getInstance().updateConsortiaEnounce(consortiaEvent.m_stEnounceChange);
                     this.mBridge.execute("onConsortiaEnounceNotify",this,consortiaEvent.m_stEnounceChange.m_czContent);
                  }
                  break;
               case EnmConsortia.enm_commondata_change:
                  if(0 != consortiaInfo.m_stJoinInfo.m_iID)
                  {
                     a_2307.getInstance().updateCommonData(consortiaEvent.m_stCommonData);
                     this.mBridge.execute("onCommonDataChangeNotify",this,consortiaEvent.m_stCommonData);
                  }
                  break;
               case EnmConsortia.enm_set_title:
                  if(0 != consortiaInfo.m_stJoinInfo.m_iID)
                  {
                     member = a_2307.getInstance().getConsortiaMember(consortiaEvent.m_stTitleData.m_iSrcUIN);
                     prevTitle = int(member.m_cTitle);
                     a_2307.getInstance().changeMemberTitle(consortiaEvent.m_stTitleData);
                     this.mBridge.execute("onChangeMemberTitleNotify",this,consortiaEvent.m_stTitleData);
                     strUserName = IMUtil.showUserInMsgFormat(member.m_iUIN,member.m_czName);
                     if(prevTitle < consortiaEvent.m_stTitleData.m_cTitle)
                     {
                        systemMsg = GameStringManager.getInstance().getString(135466,[strUserName,dictJobTitle[consortiaEvent.m_stTitleData.m_cTitle]]);
                     }
                     else
                     {
                        systemMsg = GameStringManager.getInstance().getString(135460,[strUserName,dictJobTitle[consortiaEvent.m_stTitleData.m_cTitle]]);
                     }
                     systemMsg = IMUtil.sendMsgFormat({
                        "tag":EnmGameIM.a_507,
                        "msg":systemMsg
                     });
                     this.mBridge.execute("onSystemMessageNotify",this,systemMsg);
                  }
                  break;
               case EnmConsortia.enm_off_line:
                  break;
               case EnmConsortia.enm_player_data:
                  if(0 != consortiaInfo.m_stJoinInfo.m_iID)
                  {
                     iUin = a_2307.getInstance().updatePlayerData(consortiaEvent.m_stPlayerData);
                     this.mBridge.execute("onUpdateConsortiaMemberInfo",this,null);
                     this.mBridge.execute("onCommonDataChangeNotify",this,null);
                     this.mBridge.execute("onEndowChangedNotify",this,iUin);
                     member = a_2307.getInstance().getConsortiaMember(iUin);
                     strUserName = IMUtil.showUserInMsgFormat(member.m_iUIN,member.m_czName);
                     systemMsg = GameStringManager.getInstance().getString(135467,[strUserName,consortiaEvent.m_stPlayerData.m_iPoint,consortiaEvent.m_stPlayerData.m_iScore]);
                     systemMsg = IMUtil.sendMsgFormat({
                        "tag":EnmGameIM.a_507,
                        "msg":systemMsg
                     });
                     this.mBridge.execute("onSystemMessageNotify",this,systemMsg);
                  }
                  break;
               default:
                  trace("错误的公会事件>>id=" + consortiaEvent.m_nEvent);
            }
         }
      }
      
      private function onNotifyTransferConsortiaMsg(a_4730:a_1778) : void
      {
         this.mBridge.execute("onConsortiaTalkNotify",this,a_4730.dataObject);
      }
      
      private function onUpgradeConsortiaEstablishmentResponse(a_4730:a_1778) : void
      {
         this.mBridge.execute("onUpgradeConsortiaEstablishmentResponse",this,a_4730.dataObject);
      }
      
      private function onSetConsortiaEstablishmentResponse(a_4730:a_1778) : void
      {
         this.mBridge.execute("onSetConsortiaEstablishmentResponse",this,a_4730.dataObject);
      }
      
      private function onInviteJoinConsortiaResponse(a_4730:a_1778) : void
      {
         var objInviteJoin:Object = null;
         var proposer:Object = null;
         var playerCommonData:Object = null;
         var objData:Object = null;
         if(a_4730.dataObject.m_nResult == 0)
         {
            objInviteJoin = {};
            objInviteJoin.m_iSrcUIN = a_4730.dataObject.m_iDstUIN;
            objInviteJoin.m_cFlag = EnmConsortia.enm_invite;
            proposer = a_2307.getInstance().addNewProposer(objInviteJoin);
            playerCommonData = a_2608.getInstance().getAllPlayersCommonData()[objInviteJoin.m_iSrcUIN];
            if(playerCommonData)
            {
               objData = this.getUpdatePlayerData(playerCommonData);
               a_2307.getInstance().updateConsortiaMemberInfo(objInviteJoin.m_iSrcUIN,a_2307.getInstance().getConsortiaInfo().m_stConsortiaInfo.m_aryProposer,objData.arrPro,objData.arrVal);
               this.mBridge.execute("onUpdateConsortiaProposer",this,null);
            }
            else
            {
               this.playersCommonData.getPlayersCommonData([objInviteJoin.m_iSrcUIN]);
            }
         }
         else if(a_4730.dataObject.m_nResult == EnmConsortia.result_id_consortia_proposer_full)
         {
            this.getConsortiaInfoRequest({
               "m_iConsortiaID":a_2307.getInstance().getConsortiaInfo().m_stJoinInfo.m_iID,
               "m_iFlag":EnmConsortia.a_364
            });
         }
         this.mBridge.execute("onInviteJoinConsortiaResponse",this,a_4730.dataObject);
      }
      
      private function onConsortiaContributeResponse(a_4730:a_1778) : void
      {
         this.mBridge.execute("onConsortiaContributeResponse",this,a_4730.dataObject);
      }
      
      private function getValidConsortiaIDs(data:Object) : Boolean
      {
         return this.serverDataProtocol.getValidConsortiaIDsRequest(data);
      }
      
      private function onGetValidConsortiaIDsResponse(a_4730:a_1778) : void
      {
         if(a_4730.dataObject.m_nResult == 0)
         {
            if(a_4730.dataObject.m_iStart == 1)
            {
               a_3340.resetRandomSeed();
            }
            a_3340.appendRandomNums(a_4730.dataObject.m_aryIDS.concat());
            a_4730.dataObject.m_aryIDS.splice(0);
            if(a_4730.dataObject.m_iStart == 1)
            {
               this.mBridge.execute("onGetValidConsortiaIDsResponse",this,a_4730.dataObject.m_iStart,a_4730.dataObject.m_iEnd);
            }
            if(a_4730.dataObject.m_iEnd < a_4730.dataObject.m_iMaxConsortiaID)
            {
               this.getValidConsortiaIDs({
                  "m_iStart":a_4730.dataObject.m_iEnd + 1,
                  "m_iEnd":a_4730.dataObject.m_iMaxConsortiaID + 1
               });
            }
         }
         else
         {
            this.getValidConsortiaIDs({
               "m_iStart":a_4730.dataObject.m_iStart,
               "m_iEnd":a_4730.dataObject.m_iEnd
            });
         }
         a_4730.dataObject = null;
      }
      
      private function getUpdatePlayerData(playerCommonData:Object) : Object
      {
         var arrPro:Array = [];
         var arrVal:Array = [];
         var objLevel:Object = null;
         if(!isNaN(playerCommonData.m_iGamePoint * 1))
         {
            arrPro.push("m_iLevel","m_iPoint");
            objLevel = a_2033.getInstance().getGameLevel(playerCommonData.m_iGamePoint);
            arrVal.push(objLevel.iLevel,playerCommonData.m_iGamePoint);
         }
         if(!isNaN(playerCommonData.m_iVsExp * 1))
         {
            arrPro.push("m_iVSLevel","m_iVsExp");
            objLevel = a_2033.getInstance().getVsLevel(playerCommonData.m_iVsExp);
            arrVal.push(objLevel.iLevel,playerCommonData.m_iVsExp);
         }
         if(!isNaN(playerCommonData.m_iUserSex * 1))
         {
            arrPro.push("m_iUserSex");
            arrVal.push(playerCommonData.m_iUserSex);
         }
         if(playerCommonData.m_szRoleName)
         {
            arrPro.push("m_czName");
            arrVal.push(playerCommonData.m_szRoleName);
         }
         return {
            "arrPro":arrPro,
            "arrVal":arrVal
         };
      }
   }
}

