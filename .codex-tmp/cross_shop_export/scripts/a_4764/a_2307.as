package a_4764
{
   import a_4716.EnmConsortia;
   import a_4720.a_1750;
   import a_4720.a_1755;
   import a_4752.a_2033;
   import a_4754.a_2161;
   import a_4789.a_4657;
   import com.aurora.ui.maogoutd.consortia.a_3340;
   import flash.utils.Dictionary;
   
   public class a_2307
   {
      
      private static var sign:Boolean;
      
      private static var _instance:a_2307;
      
      private var consortiaInfo:Object;
      
      private var currentRoleUin:int;
      
      public function a_2307()
      {
         super();
         if(!sign)
         {
            throw new Error("请通过getInstance()方法获取引用！");
         }
      }
      
      public static function getInstance() : a_2307
      {
         if(null == _instance)
         {
            sign = true;
            _instance = new a_2307();
            sign = false;
         }
         return _instance;
      }
      
      public function setCurrentRoleUin(uin:int) : void
      {
         this.currentRoleUin = uin;
      }
      
      public function getCurrentRoleUin() : int
      {
         return this.currentRoleUin;
      }
      
      public function setConsortiaInfo(data:Object) : void
      {
         var i:int = 0;
         var len:int = 0;
         var tempTitle:int = 0;
         var tempUin:int = 0;
         var currentRoleIsAdmin:Boolean = false;
         var currentRoleTitle:int = 0;
         var currentRoleIndex:int = 0;
         var hasNewRequest:Boolean = false;
         var member:Object = null;
         var tempMember:Object = null;
         var level:Object = null;
         var tempProposer:Object = null;
         var proposer:Object = null;
         var tempEstablistmentItem:Object = null;
         var m_iID:int = 0;
         var establistmentItem:Object = null;
         this.consortiaInfo = {};
         this.consortiaInfo.m_arrConsortiaID = new Array();
         this.consortiaInfo.m_dictConsortiaBrief = new Dictionary(true);
         this.consortiaInfo.m_iValidConsortiaCount = 0;
         this.consortiaInfo.m_nResult = data.m_nResult;
         this.consortiaInfo.m_iUIN = data.m_iUIN;
         if(null != data.m_stJoinInfo)
         {
            this.consortiaInfo.m_stJoinInfo = {};
            this.consortiaInfo.m_stJoinInfo.m_iID = data.m_stJoinInfo.m_iID;
            this.consortiaInfo.m_stJoinInfo.m_iFrozen = data.m_stJoinInfo.m_iFrozen;
            this.consortiaInfo.m_stJoinInfo.m_iTimestamp = data.m_stJoinInfo.m_iTimestamp;
            this.consortiaInfo.m_stJoinInfo.m_iContribute = data.m_stJoinInfo.m_iContribute;
            this.consortiaInfo.m_stJoinInfo.m_iScore = data.m_stJoinInfo.m_iScore;
            this.consortiaInfo.m_stJoinInfo.m_iEndow = data.m_stJoinInfo.m_iEndow;
            this.consortiaInfo.m_stJoinInfo.m_cTitle = data.m_stJoinInfo.m_cTitle;
            this.consortiaInfo.m_stJoinInfo.m_iLastActivity = data.m_stJoinInfo.m_iLastActivity;
            this.consortiaInfo.m_stJoinInfo.m_iMonthContribute = data.m_stJoinInfo.m_iMonthContribute;
            this.consortiaInfo.m_stJoinInfo.m_iMonthScore = data.m_stJoinInfo.m_iMonthScore;
            this.consortiaInfo.m_stJoinInfo.m_iCoin = data.m_stJoinInfo.m_iCoin;
         }
         if(null != data.m_stConsortiaInfo)
         {
            currentRoleIsAdmin = false;
            currentRoleTitle = 0;
            this.consortiaInfo.m_stConsortiaInfo = {};
            this.consortiaInfo.m_stConsortiaInfo.m_iID = data.m_stConsortiaInfo.m_iID;
            this.consortiaInfo.m_stConsortiaInfo.m_iFounderUIN = data.m_stConsortiaInfo.m_iFounderUIN;
            this.consortiaInfo.m_stConsortiaInfo.m_czChairmanName = data.m_stConsortiaInfo.m_czChairmanName;
            this.consortiaInfo.m_stConsortiaInfo.m_czConsortiaName = data.m_stConsortiaInfo.m_czConsortiaName;
            this.consortiaInfo.m_stConsortiaInfo.m_iTimestamp = data.m_stConsortiaInfo.m_iTimestamp;
            this.consortiaInfo.m_stConsortiaInfo.m_czConsortiaEnounce = data.m_stConsortiaInfo.m_czConsortiaEnounce;
            this.consortiaInfo.m_stConsortiaInfo.m_czConsortiaNotify = null == data.m_stConsortiaInfo.m_czConsortiaNotify ? "" : data.m_stConsortiaInfo.m_czConsortiaNotify;
            this.consortiaInfo.m_stConsortiaInfo.m_iUIN = this.currentRoleUin;
            this.consortiaInfo.m_stConsortiaInfo.m_dictAdministrators = new Dictionary(true);
            len = int(data.m_stConsortiaInfo.m_aryAdministrators.length);
            for(i = 0; i < len; i++)
            {
               tempUin = int(data.m_stConsortiaInfo.m_aryAdministrators[i]);
               if(i == 0)
               {
                  tempTitle = int(EnmConsortia.a_351);
                  this.consortiaInfo.m_stConsortiaInfo.m_iChairmanUIN = tempUin;
                  if(tempUin == this.currentRoleUin)
                  {
                     this.consortiaInfo.m_stConsortiaInfo.m_czChairmanName = a_2161.e.GetCurrentRole().m_szRoleName;
                  }
               }
               else
               {
                  tempTitle = int(EnmConsortia.a_350);
               }
               this.consortiaInfo.m_stConsortiaInfo.m_dictAdministrators[tempUin] = tempTitle;
               if(this.currentRoleUin == tempUin)
               {
                  currentRoleIsAdmin = true;
                  currentRoleTitle = tempTitle;
               }
            }
            len = int(data.m_stConsortiaInfo.m_nMemberNum);
            this.consortiaInfo.m_stConsortiaInfo.m_nMemberNum = len;
            if(len > 0)
            {
               this.consortiaInfo.m_stConsortiaInfo.m_aryMember = new Array(len);
               for(i = 0; i < len; i++)
               {
                  member = {};
                  tempMember = data.m_stConsortiaInfo.m_aryMember[i];
                  tempUin = int(tempMember.m_iUIN);
                  if(null != this.consortiaInfo.m_stConsortiaInfo.m_dictAdministrators[tempUin])
                  {
                     tempTitle = int(this.consortiaInfo.m_stConsortiaInfo.m_dictAdministrators[tempUin]);
                  }
                  else
                  {
                     tempTitle = int(tempMember.m_cTitle);
                  }
                  member.m_iConsortiaID = this.consortiaInfo.m_stJoinInfo.m_iID;
                  member.m_iUIN = tempUin;
                  member.m_iContribute = tempMember.m_iContribute;
                  if(0 == tempTitle)
                  {
                     tempTitle = int(EnmConsortia.a_353);
                  }
                  if(tempUin == this.currentRoleUin)
                  {
                     this.consortiaInfo.m_stJoinInfo.m_cTitle = tempTitle;
                     this.consortiaInfo.m_stConsortiaInfo.m_cTitle = tempTitle;
                     member.m_bTitleUp = false;
                     member.m_bTitleDown = false;
                     member.m_bBeKickedAbled = false;
                     member.m_iPoint = a_2161.e.GetCurrentRole().m_iGamePoint;
                     member.m_czName = a_2161.e.GetCurrentRole().m_szRoleName;
                     level = a_2033.getInstance().getGameLevel(member.m_iPoint);
                     member.m_iLevel = level.iLevel;
                     member.m_iGameStatus = a_1750.enm_OnlineStatus;
                     currentRoleIndex = i;
                  }
                  else
                  {
                     member.m_iGameStatus = a_1750.enm_LeaveStatus;
                     member.m_czName = tempMember.m_czName;
                     if(currentRoleIsAdmin)
                     {
                        member.m_bTitleUp = tempTitle < EnmConsortia.a_350;
                        member.m_bTitleDown = tempTitle > EnmConsortia.a_353;
                        member.m_bBeKickedAbled = true;
                        if(tempTitle >= currentRoleTitle)
                        {
                           member.m_bTitleUp = false;
                           member.m_bTitleDown = false;
                           member.m_bBeKickedAbled = false;
                        }
                     }
                     else
                     {
                        member.m_bTitleUp = false;
                        member.m_bTitleDown = false;
                        member.m_bBeKickedAbled = false;
                     }
                  }
                  member.m_cTitle = tempTitle;
                  member.m_iLastActivity = tempMember.m_iLastActivity;
                  member.m_iScore = tempMember.m_iScore;
                  member.m_iMonthContribute = tempMember.m_iMonthContribute;
                  member.m_iMonthScore = tempMember.m_iMonthScore;
                  member.m_iJoinTime = tempMember.m_iJoinTime;
                  member.m_iCoin = tempMember.m_iCoin;
                  this.consortiaInfo.m_stConsortiaInfo.m_aryMember[i] = member;
               }
               if(0 != currentRoleIndex)
               {
                  this.consortiaInfo.m_stConsortiaInfo.m_aryMember.unshift(this.consortiaInfo.m_stConsortiaInfo.m_aryMember.splice(currentRoleIndex,1)[0]);
               }
               this.sortMembersData();
            }
            len = int(data.m_stConsortiaInfo.m_nProposerNum);
            this.consortiaInfo.m_stConsortiaInfo.m_aryProposer = new Array();
            hasNewRequest = false;
            if(len > 0)
            {
               for(i = 0; i < len; i++)
               {
                  tempProposer = data.m_stConsortiaInfo.m_aryProposer[i];
                  if(EnmConsortia.enm_request == tempProposer.m_cFlag || EnmConsortia.enm_invite == tempProposer.m_cFlag)
                  {
                     proposer = {};
                     proposer.m_iUIN = tempProposer.m_iUIN;
                     proposer.m_czName = tempProposer.m_czName;
                     proposer.m_szComment = tempProposer.m_szComment;
                     proposer.m_iTimestamp = tempProposer.m_iTimestamp;
                     proposer.m_cFlag = tempProposer.m_cFlag;
                     proposer.m_iConsortiaID = this.consortiaInfo.m_stJoinInfo.m_iID;
                     this.consortiaInfo.m_stConsortiaInfo.m_aryProposer.push(proposer);
                     if(EnmConsortia.enm_request == tempProposer.m_cFlag)
                     {
                        hasNewRequest = true;
                     }
                  }
               }
            }
            this.consortiaInfo.m_stConsortiaInfo.m_iScore = data.m_stConsortiaInfo.m_iScore;
            this.consortiaInfo.m_stConsortiaInfo.m_iLevel = data.m_stConsortiaInfo.m_iLevel;
            if(1 > this.consortiaInfo.m_stConsortiaInfo.m_iLevel)
            {
               this.consortiaInfo.m_stConsortiaInfo.m_iLevel = 1;
            }
            this.consortiaInfo.m_stConsortiaInfo.m_iMoney = data.m_stConsortiaInfo.m_iMoney;
            this.consortiaInfo.m_stConsortiaInfo.m_iCoin = data.m_stConsortiaInfo.m_iCoin;
            this.consortiaInfo.m_stConsortiaInfo.m_nFlag = data.m_stConsortiaInfo.m_nFlag;
            this.consortiaInfo.m_stConsortiaInfo.m_iLeastUpdateTime = data.m_stConsortiaInfo.m_iLeastUpdateTime;
            this.consortiaInfo.m_stConsortiaInfo.m_iLeastBalanceTime = data.m_stConsortiaInfo.m_iLeastBalanceTime;
            if(null != data.m_stConsortiaInfo.m_stEstablishment)
            {
               this.consortiaInfo.m_stConsortiaInfo.m_stEstablishment = new Dictionary(true);
               this.consortiaEstablishmentInit(this.consortiaInfo.m_stConsortiaInfo.m_stEstablishment);
               len = int(data.m_stConsortiaInfo.m_stEstablishment.m_nCount);
               if(len > 0)
               {
                  for(i = 0; i < len; i++)
                  {
                     tempEstablistmentItem = data.m_stConsortiaInfo.m_stEstablishment.m_aryItem[i];
                     m_iID = int(tempEstablistmentItem.m_iID);
                     establistmentItem = this.consortiaInfo.m_stConsortiaInfo.m_stEstablishment[m_iID];
                     establistmentItem.m_iID = tempEstablistmentItem.m_iID;
                     establistmentItem.m_iLevel = tempEstablistmentItem.m_iLevel;
                     establistmentItem.m_iLastModify = tempEstablistmentItem.m_iLastModify;
                     establistmentItem.m_iSign = tempEstablistmentItem.m_iSign;
                     if(null != tempEstablistmentItem.m_arySettings && 5 == tempEstablistmentItem.m_arySettings.length)
                     {
                        establistmentItem.m_arySettings = tempEstablistmentItem.m_arySettings;
                     }
                  }
               }
            }
            this.consortiaInfo.m_stConsortiaInfo.m_stQunInfo = data.m_stConsortiaInfo.m_stQunInfo;
         }
         this.consortiaInfo.m_iUserFlag = data.m_iUserFlag;
         len = int(data.m_nCount);
         this.consortiaInfo.m_dictApplyInfo = new Dictionary(true);
         if(len > 0)
         {
            for(i = 0; i < len; i++)
            {
               if(!(EnmConsortia.enm_request != data.m_arrApplyInfo[i].m_cFlag && EnmConsortia.enm_invite != data.m_arrApplyInfo[i].m_cFlag))
               {
                  this.consortiaInfo.m_dictApplyInfo[data.m_arrApplyInfo[i].m_iConsortiaID + "-" + data.m_arrApplyInfo[i].m_cFlag] = data.m_arrApplyInfo[i];
               }
            }
         }
         this.consortiaInfo.m_iMaxConsortiaID = data.m_iMaxConsortiaID;
         this.consortiaInfo.m_szReasonMessage = data.m_szReasonMessage;
         if(this.consortiaInfo.m_stJoinInfo != null && this.consortiaInfo.m_stJoinInfo.m_iID > 0)
         {
            if(this.consortiaInfo.m_stJoinInfo.m_cTitle == EnmConsortia.a_350 || this.consortiaInfo.m_stJoinInfo.m_cTitle == EnmConsortia.a_351)
            {
               if(hasNewRequest)
               {
                  a_4657.getInstance().execute("onJoinConsortiaRequestNotify",this,false);
               }
            }
         }
      }
      
      private function consortiaEstablishmentInit(dict:Dictionary) : void
      {
         var id:* = undefined;
         var item:Object = null;
         var establishmentConfig:Object = a_3340.getConfig()["upgrade"]["establishment"] as Dictionary;
         for(id in establishmentConfig)
         {
            item = {};
            item.m_iID = id;
            item.m_iLevel = 0;
            item.m_arySettings = [100,100,100,100,100];
            dict[id] = item;
         }
      }
      
      public function getConsortiaInfo() : Object
      {
         return this.consortiaInfo;
      }
      
      public function getConsortiaMembers() : Array
      {
         if(null == this.consortiaInfo)
         {
            return [];
         }
         if(null == this.consortiaInfo.m_stJoinInfo)
         {
            return [];
         }
         if(this.consortiaInfo.m_stJoinInfo.m_iID == 0)
         {
            return [];
         }
         return this.consortiaInfo.m_stConsortiaInfo.m_aryMember;
      }
      
      public function getConsortiaCurrentSkill() : Object
      {
         var lv:int = 0;
         if(null == this.consortiaInfo)
         {
            return null;
         }
         if(null == this.consortiaInfo.m_stJoinInfo)
         {
            return null;
         }
         if(0 == this.consortiaInfo.m_stJoinInfo.m_iID)
         {
            return null;
         }
         var objConfig:Object = a_3340.getConfig()["upgrade"]["establishment"][EnmConsortia.a_381];
         var objEstablishment:Object = this.consortiaInfo.m_stConsortiaInfo.m_stEstablishment[EnmConsortia.a_381];
         var arrSetting:Array = objEstablishment.m_arySettings;
         var myContribute:int = int(this.consortiaInfo.m_stJoinInfo.m_iContribute);
         for(var i:* = int(objEstablishment.m_iLevel - 1); i >= 0; i--)
         {
            if(myContribute >= arrSetting[i])
            {
               lv = i + 1;
               break;
            }
         }
         return objConfig[lv];
      }
      
      public function getConsortiaCurrentCompose() : Object
      {
         var lv:int = 0;
         if(null == this.consortiaInfo)
         {
            return null;
         }
         if(null == this.consortiaInfo.m_stJoinInfo)
         {
            return null;
         }
         if(0 == this.consortiaInfo.m_stJoinInfo.m_iID)
         {
            return null;
         }
         var objConfig:Object = a_3340.getConfig()["upgrade"]["establishment"][EnmConsortia.a_380];
         var objEstablishment:Object = this.consortiaInfo.m_stConsortiaInfo.m_stEstablishment[EnmConsortia.a_380];
         var arrSetting:Array = objEstablishment.m_arySettings;
         var myContribute:int = int(this.consortiaInfo.m_stJoinInfo.m_iContribute);
         for(var i:* = int(objEstablishment.m_iLevel - 1); i >= 0; i--)
         {
            if(myContribute >= arrSetting[i])
            {
               lv = i + 1;
               break;
            }
         }
         return objConfig[lv];
      }
      
      public function getMyConsortiaContribute() : int
      {
         if(null == this.consortiaInfo)
         {
            return 0;
         }
         if(null == this.consortiaInfo.m_stJoinInfo)
         {
            return 0;
         }
         if(0 == this.consortiaInfo.m_stJoinInfo.m_iID)
         {
            return 0;
         }
         return this.consortiaInfo.m_stJoinInfo.m_iContribute;
      }
      
      public function updateByConsortiaBrief(data:Object) : Array
      {
         var ids:Array = null;
         var dictApplyInfo:Dictionary = null;
         var dictConsortiaBrief:Dictionary = null;
         var i:int = 0;
         var len:int = 0;
         var deleteIds:Array = null;
         var objBrief:Object = null;
         var id:int = 0;
         var key:String = null;
         var arrNums:Array = null;
         var prevIMaxConsortiaID:int = 0;
         if(null == this.consortiaInfo)
         {
            return [];
         }
         if(0 == data.m_nResult)
         {
            this.consortiaInfo.m_iValidConsortiaCount = data.m_iValidConsortiaCount;
            if(0 < data.m_nCount)
            {
               ids = new Array();
               dictApplyInfo = this.consortiaInfo.m_dictApplyInfo;
               dictConsortiaBrief = this.consortiaInfo.m_dictConsortiaBrief;
               deleteIds = [];
               i = 0;
               len = int(data.m_nCount);
               while(i < len)
               {
                  objBrief = data.m_aryConsortiaBrief[i];
                  if(0 == objBrief.m_iID)
                  {
                     id = int(this.consortiaInfo.m_arrConsortiaID.indexOf(objBrief.m_iAdjust));
                     if(id != -1)
                     {
                        this.consortiaInfo.m_arrConsortiaID[id] = 0;
                     }
                     deleteIds.push(objBrief.m_iAdjust);
                  }
                  else
                  {
                     key = objBrief.m_iID + "-" + EnmConsortia.enm_request;
                     if(null != dictApplyInfo[key])
                     {
                        this.addBriefToApplyInfo(dictApplyInfo[key],objBrief);
                     }
                     key = objBrief.m_iID + "-" + EnmConsortia.enm_invite;
                     if(null != dictApplyInfo[key])
                     {
                        this.addBriefToApplyInfo(dictApplyInfo[key],objBrief);
                     }
                     dictConsortiaBrief[objBrief.m_iID] = objBrief;
                     ids.push(objBrief.m_iID);
                  }
                  i++;
               }
               if(deleteIds.length > 0)
               {
                  a_3340.deleteRandomNums(deleteIds);
               }
               if(this.consortiaInfo.m_iMaxConsortiaID != data.m_iMaxConsortiaID)
               {
                  arrNums = [];
                  prevIMaxConsortiaID = int(this.consortiaInfo.m_iMaxConsortiaID);
                  this.consortiaInfo.m_iMaxConsortiaID = data.m_iMaxConsortiaID;
                  i = Math.min(prevIMaxConsortiaID,data.m_iMaxConsortiaID);
                  for(len = Math.abs(prevIMaxConsortiaID - data.m_iMaxConsortiaID); i < len; )
                  {
                     arrNums.push(i);
                     i++;
                  }
                  if(prevIMaxConsortiaID < data.m_iMaxConsortiaID)
                  {
                     a_3340.appendRandomNums(arrNums);
                  }
                  else
                  {
                     a_3340.deleteRandomNums(arrNums);
                  }
               }
               if(this.consortiaInfo.m_arrConsortiaID.length != this.consortiaInfo.m_iValidConsortiaCount)
               {
                  this.consortiaInfo.m_arrConsortiaID.length = this.consortiaInfo.m_iValidConsortiaCount;
               }
               return ids;
            }
         }
         return [];
      }
      
      private function addBriefToApplyInfo(info:Object, brief:Object) : void
      {
         var k:* = undefined;
         for(k in brief)
         {
            info[k] = brief[k];
         }
      }
      
      public function clearConsortiaBrief() : void
      {
         var key:* = undefined;
         var dictConsortiaBrief:Dictionary = this.consortiaInfo.m_dictConsortiaBrief;
         if(null == dictConsortiaBrief)
         {
            return;
         }
         for(key in dictConsortiaBrief)
         {
            if(null != dictConsortiaBrief[key])
            {
               delete dictConsortiaBrief[key];
            }
         }
      }
      
      public function updateConsortiaMemberInfo(uin:int, arrMenbers:Array, arrPro:Array, arrValue:Array) : int
      {
         var j:int = 0;
         var len1:int = 0;
         var pro:String = null;
         var len:int = int(arrMenbers.length);
         var flag:Boolean = false;
         for(var i:int = 0; i < len; i++)
         {
            if(uin == arrMenbers[i].m_iUIN)
            {
               j = 0;
               len1 = int(arrPro.length);
               while(j < len1)
               {
                  pro = arrPro[j];
                  if(arrMenbers[i][pro] != arrValue[j])
                  {
                     arrMenbers[i][pro] = arrValue[j];
                     flag = true;
                  }
                  j++;
               }
               if(this.consortiaInfo.m_stConsortiaInfo.m_iChairmanUIN == uin)
               {
                  this.consortiaInfo.m_stConsortiaInfo.m_czChairmanName = arrMenbers[i].m_czName;
               }
               if(flag)
               {
                  return uin;
               }
               break;
            }
         }
         return -1;
      }
      
      public function updateConsortiaApplyInfo(info:Object) : void
      {
         if(EnmConsortia.enm_request == info.m_cCmd)
         {
            this.consortiaInfo.m_dictApplyInfo[info.m_iConsortiaID + "-" + EnmConsortia.enm_request] = info;
         }
         else if(EnmConsortia.enm_cancel == info.m_cCmd)
         {
            if(null != this.consortiaInfo.m_dictApplyInfo[info.m_iConsortiaID + "-" + EnmConsortia.enm_request])
            {
               delete this.consortiaInfo.m_dictApplyInfo[info.m_iConsortiaID + "-" + EnmConsortia.enm_request];
            }
         }
         else if(EnmConsortia.enm_refuse == info.m_cCmd)
         {
            if(null != this.consortiaInfo.m_dictApplyInfo[info.m_iConsortiaID + "-" + EnmConsortia.enm_invite])
            {
               delete this.consortiaInfo.m_dictApplyInfo[info.m_iConsortiaID + "-" + EnmConsortia.enm_invite];
            }
         }
      }
      
      public function setConsortiaProposerList(data:Object) : Array
      {
         var proposer:Object = null;
         var tempProposer:Object = null;
         var arrProposers:Array = data.m_aryProposer;
         var len:int = int(arrProposers.length);
         var iConsortiaID:int = int(this.consortiaInfo.m_stJoinInfo.m_iID);
         var arrUin:Array = [];
         this.consortiaInfo.m_stConsortiaInfo.m_aryProposer = new Array(len);
         for(var i:int = 0; i < len; i++)
         {
            proposer = {};
            tempProposer = arrProposers[i];
            proposer.m_iUIN = tempProposer.m_iUIN;
            proposer.m_czName = tempProposer.m_czName;
            proposer.m_szComment = tempProposer.m_szComment;
            proposer.m_iTimestamp = tempProposer.m_iTimestamp;
            proposer.m_cFlag = tempProposer.m_cFlag;
            proposer.m_iConsortiaID = iConsortiaID;
            this.consortiaInfo.m_stConsortiaInfo.m_aryProposer[i] = proposer;
            arrUin.push(tempProposer.m_iUIN);
         }
         return arrUin;
      }
      
      public function deleteProposersData(data:Object) : void
      {
         var arrProposers:Array = this.consortiaInfo.m_stConsortiaInfo.m_aryProposer;
         var i:int = 0;
         var len:int = int(arrProposers.length);
         while(i < len)
         {
            if(arrProposers[i].m_iUIN == data.m_iProposerUIN)
            {
               arrProposers.splice(i,1);
               break;
            }
            i++;
         }
      }
      
      public function addNewProposer(data:Object) : Object
      {
         var arrProposers:Array = this.consortiaInfo.m_stConsortiaInfo.m_aryProposer;
         var proposer:Object = this.getProposerByUin(data.m_iSrcUIN);
         var iConsortiaID:int = int(this.consortiaInfo.m_stJoinInfo.m_iID);
         if(null != proposer)
         {
            return proposer;
         }
         proposer = {};
         proposer.m_iUIN = data.m_iSrcUIN;
         if(data.m_szRoleName)
         {
            proposer.m_czName = data.m_szRoleName;
         }
         proposer.m_szComment = data.m_szComment;
         proposer.m_iTimestamp = int(new Date().time / 1000);
         proposer.m_cFlag = data.m_cFlag;
         proposer.m_iConsortiaID = iConsortiaID;
         arrProposers.push(proposer);
         return proposer;
      }
      
      public function getProposerByUin(iUin:int) : Object
      {
         if(null == this.consortiaInfo)
         {
            return null;
         }
         if(null == this.consortiaInfo.m_stConsortiaInfo)
         {
            return null;
         }
         if(null == this.consortiaInfo.m_stConsortiaInfo.m_aryProposer)
         {
            return null;
         }
         var arrProposers:Array = this.consortiaInfo.m_stConsortiaInfo.m_aryProposer;
         var i:int = 0;
         var len:int = int(arrProposers.length);
         while(i < len)
         {
            if(arrProposers[i].m_iUIN == iUin)
            {
               return arrProposers[i];
            }
            i++;
         }
         return null;
      }
      
      public function addNewConsortiaMember(data:Object) : void
      {
         if(null == this.consortiaInfo.m_stConsortiaInfo.m_aryMember)
         {
            this.consortiaInfo.m_stConsortiaInfo.m_aryMember = new Array();
         }
         var member:Object = {};
         member.m_iConsortiaID = this.consortiaInfo.m_stJoinInfo.m_iID;
         member.m_iUIN = data.m_iSrcUIN;
         member.m_iContribute = 0;
         member.m_cTitle = EnmConsortia.a_353;
         member.m_bTitleUp = true;
         member.m_bTitleDown = false;
         member.m_bBeKickedAbled = null != this.consortiaInfo.m_stConsortiaInfo.m_dictAdministrators[this.currentRoleUin];
         member.m_czName = data.m_szRoleName;
         member.m_iLastActivity = int(new Date().time / 1000);
         member.m_iScore = 0;
         member.m_iMonthContribute = 0;
         member.m_iMonthScore = 0;
         member.m_iJoinTime = member.m_iLastActivity;
         member.m_iCoin = member.m_iCoin;
         member.m_iGameStatus = a_1750.enm_LeaveStatus;
         this.consortiaInfo.m_stConsortiaInfo.m_aryMember.push(member);
         ++this.consortiaInfo.m_stConsortiaInfo.m_nMemberNum;
         this.sortMembersData();
      }
      
      public function deleteConsortiaMember(iUin:int) : Object
      {
         if(null == this.consortiaInfo.m_stConsortiaInfo.m_aryMember)
         {
            return null;
         }
         var aryMember:Array = this.consortiaInfo.m_stConsortiaInfo.m_aryMember;
         var i:int = 0;
         var len:int = int(aryMember.length);
         while(i < len)
         {
            if(iUin == aryMember[i].m_iUIN)
            {
               --this.consortiaInfo.m_stConsortiaInfo.m_nMemberNum;
               return aryMember.splice(i,1)[0];
            }
            i++;
         }
         return null;
      }
      
      public function getConsortiaMember(iUin:int) : Object
      {
         if(null == this.consortiaInfo)
         {
            return null;
         }
         if(null == this.consortiaInfo.m_stConsortiaInfo)
         {
            return null;
         }
         if(null == this.consortiaInfo.m_stConsortiaInfo.m_aryMember)
         {
            return null;
         }
         var aryMember:Array = this.consortiaInfo.m_stConsortiaInfo.m_aryMember;
         var i:int = 0;
         var len:int = int(aryMember.length);
         while(i < len)
         {
            if(iUin == aryMember[i].m_iUIN)
            {
               return aryMember[i];
            }
            i++;
         }
         return null;
      }
      
      public function updateConsortiaEnounce(info:Object) : void
      {
         this.consortiaInfo.m_stConsortiaInfo.m_czConsortiaEnounce = info.m_czContent;
      }
      
      public function updateConsortiaNotify(info:Object) : void
      {
         this.consortiaInfo.m_stConsortiaInfo.m_czConsortiaNotify = info.m_czContent;
      }
      
      public function upgradeEstablistmentLevel(data:Object) : void
      {
         var item:Object = null;
         if(0 == data.m_iEstablisment)
         {
            this.consortiaInfo.m_stConsortiaInfo.m_iLevel = data.m_nLevel;
         }
         else
         {
            item = this.consortiaInfo.m_stConsortiaInfo.m_stEstablishment[data.m_iEstablisment];
            if(null != item)
            {
               item.m_iLevel = data.m_nLevel;
            }
         }
      }
      
      public function updateEndow(data:Object) : int
      {
         var arrMenbers:Array = this.consortiaInfo.m_stConsortiaInfo.m_aryMember;
         var member:Object = this.getConsortiaMember(data.m_iSrcUIN);
         var iUin:int = this.updateConsortiaMemberInfo(data.m_iSrcUIN,arrMenbers,["m_iContribute","m_iCoin","m_iMonthContribute"],[member.m_iContribute + data.m_iPoint,member.m_iCoin + data.m_iCoin,member.m_iMonthContribute + data.m_iPoint]);
         if(this.currentRoleUin == iUin)
         {
            this.consortiaInfo.m_stJoinInfo.m_iContribute += data.m_iPoint;
            this.consortiaInfo.m_stJoinInfo.data += data.m_iPoint;
            this.consortiaInfo.m_stJoinInfo.m_iCoin += data.m_iCoin;
         }
         this.consortiaInfo.m_stConsortiaInfo.m_iMoney += data.m_iPoint;
         this.consortiaInfo.m_stConsortiaInfo.m_iCoin += data.m_iCoin;
         return iUin;
      }
      
      public function updateCommonData(data:Object) : void
      {
         this.consortiaInfo.m_stConsortiaInfo.m_iMoney = data.m_iPoint;
         this.consortiaInfo.m_stConsortiaInfo.m_iCoin = data.m_iCoin;
      }
      
      public function updatePlayerData(data:Object) : int
      {
         var arrMenbers:Array = this.consortiaInfo.m_stConsortiaInfo.m_aryMember;
         var member:Object = this.getConsortiaMember(data.m_iSrcUIN);
         var iUin:int = this.updateConsortiaMemberInfo(data.m_iSrcUIN,arrMenbers,["m_iContribute","m_iMonthContribute","m_iScore","m_iMonthScore"],[member.m_iContribute + data.m_iPoint,member.m_iMonthContribute + data.m_iPoint,member.m_iScore + data.m_iScore,member.m_iMonthScore + data.m_iScore]);
         if(this.currentRoleUin == iUin)
         {
            this.consortiaInfo.m_stJoinInfo.m_iContribute += data.m_iPoint;
            this.consortiaInfo.m_stJoinInfo.m_iScore += data.m_iScore;
            this.consortiaInfo.m_stJoinInfo.m_iMonthContribute += data.m_iPoint;
            this.consortiaInfo.m_stJoinInfo.m_iMonthScore += data.m_iScore;
         }
         this.consortiaInfo.m_stConsortiaInfo.m_iMoney += data.m_iPoint;
         return iUin;
      }
      
      public function updateMyJoinConsortiaData(data:Object) : void
      {
         var iPoint:int = data.m_iPoint - this.consortiaInfo.m_stJoinInfo.m_iContribute;
         var iScore:int = data.m_iScore - this.consortiaInfo.m_stJoinInfo.m_iScore;
         this.consortiaInfo.m_stConsortiaInfo.m_iMoney += iPoint;
         this.consortiaInfo.m_stConsortiaInfo.m_iScore += iScore;
         var arrMenbers:Array = this.consortiaInfo.m_stConsortiaInfo.m_aryMember;
         this.updateConsortiaMemberInfo(this.currentRoleUin,arrMenbers,["m_iContribute","m_iScore"],[data.m_iPoint,data.m_iScore]);
         this.consortiaInfo.m_stJoinInfo.m_iContribute = data.m_iPoint;
         this.consortiaInfo.m_stJoinInfo.m_iScore = data.m_iScore;
      }
      
      public function refreshEstablishment(data:Object) : Boolean
      {
         var item:Object = this.consortiaInfo.m_stConsortiaInfo.m_stEstablishment[data.m_iEstablisment];
         if(null == item)
         {
            return false;
         }
         item.m_arySettings = data.m_arySettings;
         return true;
      }
      
      public function changeConsortiaAdmin(data:Object) : void
      {
         var cTitle:int = 0;
         var isPromotion:Boolean = true;
         switch(data.m_iFlag)
         {
            case EnmConsortia.a_359:
               cTitle = int(EnmConsortia.a_351);
               break;
            case EnmConsortia.a_358:
               cTitle = int(EnmConsortia.a_355);
               isPromotion = false;
               break;
            default:
               cTitle = int(EnmConsortia.a_350);
         }
         if(this.currentRoleUin == data.m_iUin)
         {
            this.consortiaInfo.m_stJoinInfo.m_cTitle = cTitle;
            this.consortiaInfo.m_stConsortiaInfo.m_cTitle = cTitle;
         }
         var dictAdministrators:Dictionary = this.consortiaInfo.m_stConsortiaInfo.m_dictAdministrators;
         if(isPromotion)
         {
            dictAdministrators[data.m_iUin] = cTitle;
         }
         else
         {
            delete dictAdministrators[data.m_iUin];
         }
         this.changeMemberTitle({
            "m_iSrcUIN":data.m_iUin,
            "m_cTitle":cTitle
         },data.m_iFlag);
      }
      
      public function changeMemberTitle(objTitleData:Object, flag:int = -1) : void
      {
         var member:Object = null;
         var isMyself:Boolean = false;
         var currentRoleIsAdmin:Boolean = false;
         var aryMember:Array = this.consortiaInfo.m_stConsortiaInfo.m_aryMember;
         var len:int = int(aryMember.length);
         for(var i:int = 0; i < len; i++)
         {
            member = aryMember[i];
            if(member.m_iUIN == objTitleData.m_iSrcUIN)
            {
               member.m_cTitle = objTitleData.m_cTitle;
               if(EnmConsortia.a_359 == flag)
               {
                  this.consortiaInfo.m_stConsortiaInfo.m_czChairmanName = member.m_czName;
               }
               isMyself = objTitleData.m_iSrcUIN == this.currentRoleUin;
               if(isMyself)
               {
                  this.consortiaInfo.m_stJoinInfo.m_cTitle = objTitleData.m_cTitle;
                  this.consortiaInfo.m_stConsortiaInfo.m_cTitle = this.consortiaInfo.m_stJoinInfo.m_cTitle;
                  member.m_bTitleUp = false;
                  member.m_bTitleDown = false;
                  member.m_bBeKickAbled = false;
               }
               else
               {
                  currentRoleIsAdmin = null != this.consortiaInfo.m_stConsortiaInfo.m_dictAdministrators[this.currentRoleUin];
                  member.m_bBeKickAbled = currentRoleIsAdmin;
                  if(currentRoleIsAdmin)
                  {
                     if(member.m_cTitle < this.consortiaInfo.m_stJoinInfo.m_cTitle)
                     {
                        member.m_bTitleUp = member.m_cTitle < EnmConsortia.a_350;
                        member.m_bTitleDown = member.m_cTitle > EnmConsortia.a_353;
                     }
                     else
                     {
                        member.m_bTitleUp = false;
                        member.m_bTitleDown = false;
                        member.m_bBeKickAbled = false;
                     }
                  }
                  else
                  {
                     member.m_bTitleUp = false;
                     member.m_bTitleDown = false;
                  }
               }
               this.sortMembersData();
               break;
            }
         }
      }
      
      public function changeConsortiaMemberStatue(objStatue:Object) : Boolean
      {
         if(null == objStatue)
         {
            return false;
         }
         if(null == this.consortiaInfo)
         {
            return false;
         }
         if(null == this.consortiaInfo.m_stConsortiaInfo)
         {
            return false;
         }
         var member:Object = this.getConsortiaMember(objStatue.m_nUin);
         if(null == member)
         {
            return false;
         }
         this.updatePlayerStatus(member,objStatue);
         this.sortMembersData();
         return true;
      }
      
      private function sortMembersData() : void
      {
         var member:Object = null;
         var arrMember:Array = this.consortiaInfo.m_stConsortiaInfo.m_aryMember;
         if(1 < arrMember.length)
         {
            member = arrMember.shift();
            arrMember.sort(this.consortiaMembersortHandle);
            arrMember.unshift(member);
         }
      }
      
      private function consortiaMembersortHandle(a:Object, b:Object) : int
      {
         if(a.m_iGameStatus == a_1750.enm_LeaveStatus && b.m_iGameStatus == a_1750.enm_LeaveStatus || a.m_iGameStatus != a_1750.enm_LeaveStatus && b.m_iGameStatus != a_1750.enm_LeaveStatus)
         {
            if(a.m_cTitle > b.m_cTitle)
            {
               return -1;
            }
            if(a.m_cTitle < b.m_cTitle)
            {
               return 1;
            }
            return 0;
         }
         if(a.m_iGameStatus == a_1750.enm_LeaveStatus)
         {
            return 1;
         }
         if(b.m_iGameStatus == a_1750.enm_LeaveStatus)
         {
            return -1;
         }
         return 0;
      }
      
      private function updatePlayerStatus(objPlayer:Object, objNewStatus:Object) : void
      {
         var stateData:Object = null;
         var userStatus:Object = null;
         var classCount:int = int(objNewStatus.m_byClassCount);
         objPlayer.m_iGameStatus = this.getGameStatusFromPlayerStatus(objNewStatus);
         if(classCount > 0)
         {
            stateData = objNewStatus.m_stStateData[classCount - 1];
            if(stateData != null)
            {
               if(stateData.m_cClass == a_1755.a_523)
               {
                  if(stateData.logicState.m_cRoomCount > 0)
                  {
                     userStatus = stateData.logicState.m_arrStatus[0];
                     objPlayer.m_UserStatus = userStatus;
                     return;
                  }
               }
            }
         }
         objPlayer.m_UserStatus = null;
      }
      
      private function getGameStatusFromPlayerStatus(objNewStatus:Object) : int
      {
         var stateData:Object = null;
         var userStatus:Object = null;
         var classCount:int = int(objNewStatus.m_byClassCount);
         var iGameStatus:int = a_1750.enm_LeaveStatus;
         if(classCount > 0)
         {
            stateData = objNewStatus.m_stStateData[classCount - 1];
            if(stateData != null)
            {
               if(stateData.m_cClass == a_1755.a_523)
               {
                  if(stateData.logicState.m_cRoomCount > 0)
                  {
                     userStatus = stateData.logicState.m_arrStatus[0];
                     if(userStatus != null)
                     {
                        iGameStatus = int(userStatus.m_iState);
                     }
                  }
               }
               else
               {
                  iGameStatus = int(stateData.hallState);
               }
            }
         }
         return iGameStatus;
      }
   }
}

