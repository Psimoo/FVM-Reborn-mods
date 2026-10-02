package a_4765
{
   import a_4716.b_154;
   import a_4728.a_1778;
   import a_4729.EventType;
   import a_4729.a_1789;
   import a_4754.a_1825;
   import a_4754.a_2158;
   import a_4754.a_2161;
   import a_4758.a_2208;
   import a_4759.b_167;
   import a_4763.a_2439;
   import a_4763.a_2608;
   import com.aurora.game.maogoutd.common.SystemMessage.AnalysisSystemNoticeXml;
   import com.aurora.protocol.common.a_2670;
   import com.aurora.protocol.friend.a_2672;
   import com.aurora.protocol.friend.a_2675;
   import com.aurora.protocol.hallserver.CCSNotifyNewSystemMessage;
   import com.aurora.protocol.hallserver.CSystemMessage;
   import com.aurora.protocol.hallserver.a_2740;
   import com.aurora.protocol.hallserver.a_2741;
   import com.aurora.protocol.hallserver.a_2745;
   import com.aurora.protocol.hallserver.a_2749;
   import com.aurora.protocol.hallserver.a_2750;
   import com.aurora.protocol.hallserver.a_2751;
   import com.aurora.protocol.hallserver.a_2752;
   import com.aurora.protocol.hallserver.a_2754;
   import com.aurora.protocol.hallserver.a_2755;
   import com.aurora.protocol.hallserver.a_2756;
   import com.aurora.protocol.hallserver.a_2757;
   import com.aurora.protocol.hallserver.a_2758;
   import com.aurora.protocol.hallserver.a_2833;
   import com.aurora.protocol.hallserver.a_2856;
   import com.aurora.protocol.hallserver.a_2857;
   import com.aurora.protocol.logicserver.a_2901;
   import com.aurora.protocol.logicserver.a_2909;
   import com.aurora.protocol.logicserver.a_2910;
   import com.aurora.ui.maogoutd.role.a_4463;
   import flash.utils.ByteArray;
   
   public class a_2418 extends b_167
   {
      
      private static var a_805:a_2418;
      
      public function a_2418()
      {
         super();
         a_2247(b_154.a_292,this.a_2419);
         a_2247(b_154.a_295,this.a_2420);
         a_2247(b_154.a_268,this.a_2421);
         a_2247(b_154.a_293,this.a_2422);
         a_2247(b_154.a_175,this.a_2423);
         a_2247(b_154.a_270,this.a_2424);
         a_2247(b_154.a_262,this.a_2425);
         a_2247(b_154.a_286,this.a_2426);
         a_2247(b_154.a_250,this.a_2427);
         a_2247(b_154.a_249,this.a_2428);
         a_2247(b_154.a_108,this.a_2429);
         a_2247(b_154.a_171,this.OnNewSystemMessageNotify);
         a_2247(b_154.MSG_NEW_NOTIFY_SYSTEM_MESSAGE,this.OnNewSystemMessageNotify);
         a_2247(b_154.a_169,this.a_2431);
         a_2247(b_154.a_333,this.a_2432);
         a_2247(b_154.a_335,this.a_2433);
         a_2247(b_154.a_325,this.a_2434);
         a_2247(b_154.a_139,this.a_2436);
         a_2247(b_154.a_140,this.a_2435);
         a_2247(b_154.a_138,this.a_2437);
         a_2247(b_154.a_254,this.a_2438);
      }
      
      public static function getInstance() : a_2418
      {
         if(null == a_805)
         {
            a_805 = new a_2418();
         }
         return a_805;
      }
      
      private function a_2419(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var obj:Object = null;
         var gameData:a_2745 = null;
         var playerCommonInfoNotify:a_2751 = new a_2751();
         if(!playerCommonInfoNotify.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode playerCommonInfoNotify failed.");
            return;
         }
         if(0 == playerCommonInfoNotify.m_nResultID)
         {
            if(a_2208.getInstance().getUin() == playerCommonInfoNotify.m_iUin)
            {
               a_2439.getInstance().PlayerCommon = playerCommonInfoNotify;
            }
            else if(playerCommonInfoNotify.m_arrGameData != null && playerCommonInfoNotify.m_arrGameData.length > 0)
            {
               obj = {};
               obj.m_iRoleUin = playerCommonInfoNotify.m_iUin;
               obj.m_iGamePoint = playerCommonInfoNotify.m_arrGameData[0].m_iPoint;
               obj.m_iVsExp = playerCommonInfoNotify.m_arrGameData[0].m_iExperiencePoint;
               obj.m_stVIP = {};
               obj.m_stVIP.m_iGameVIPScore = playerCommonInfoNotify.m_stVIP.m_iGameVIPScore;
               a_2608.getInstance().setPlayerCommonData(obj.m_iRoleUin,obj);
               gameData = playerCommonInfoNotify.m_arrGameData[0];
               a_2439.getInstance().updateFriendGameInfo(playerCommonInfoNotify.m_iUin,gameData);
            }
            trace("通知用户游戏信息:金币" + playerCommonInfoNotify.m_lHappyBean);
            dataEvent = new a_1778(EventType.a_578);
            dataEvent.dataObject = playerCommonInfoNotify;
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
         else
         {
            trace("获取通知用户游戏信息失败:" + playerCommonInfoNotify.m_szReasonMsg);
         }
      }
      
      private function a_2420(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var updateGameDataNotify:a_2755 = new a_2755();
         if(!updateGameDataNotify.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode updateGameDataNotify failed.");
            return;
         }
         a_2439.getInstance().updateNotifyGameData(updateGameDataNotify);
         var dataEvent:a_1778 = new a_1778(EventType.a_582);
         dataEvent.dataObject = updateGameDataNotify;
         a_1789.getInstance().dispatchEvent(dataEvent);
         trace("通知更新用户游戏信息:金币" + updateGameDataNotify.m_lHappyBean);
      }
      
      private function a_2421(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var updatePlayerDataNotify:a_2756 = new a_2756();
         if(!updatePlayerDataNotify.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode updatePlayerDataNotify failed.");
            return;
         }
         a_2439.getInstance().updatePlayerData(updatePlayerDataNotify);
         var dataEvent:a_1778 = new a_1778(EventType.a_584);
         dataEvent.dataObject = updatePlayerDataNotify;
         a_1789.getInstance().dispatchEvent(dataEvent);
         trace("通知更新用户游戏信息:Uin:" + updatePlayerDataNotify.m_iUin + ",数量" + updatePlayerDataNotify.m_nCount);
      }
      
      private function a_2422(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var userBaseInfoNotify:a_2758 = new a_2758();
         if(!userBaseInfoNotify.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode userBaseInfoNotify failed.");
            return;
         }
         if(0 == userBaseInfoNotify.m_nResultID)
         {
            trace(userBaseInfoNotify);
            if(a_2208.getInstance().getUin() == userBaseInfoNotify.m_iUin)
            {
               a_2208.getInstance().m_stUserBaseProfile = userBaseInfoNotify.m_stUserBaseInfo;
            }
            dataEvent = new a_1778(EventType.a_579);
            dataEvent.dataObject = userBaseInfoNotify.m_stUserBaseInfo;
            a_1789.getInstance().dispatchEvent(dataEvent);
            trace("通知用户用户基本信息:uin" + userBaseInfoNotify.m_iUin + "nickname:" + userBaseInfoNotify.m_stUserBaseInfo.m_szNickName);
         }
         else
         {
            trace("获取通知用户基本信息失败:" + userBaseInfoNotify.m_szReasonMsg);
         }
      }
      
      private function a_2423(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var notify:a_2741 = new a_2741();
         if(!notify.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode OnTalkTransferNotify failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_619);
         dataEvent.dataObject = notify.m_szMessage;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2424(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var notify:a_2754 = new a_2754();
         if(!notify.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode OnTalkTransferNotify failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_625);
         dataEvent.dataObject = notify;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2425(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var notify:a_2757 = new a_2757();
         if(!notify.decode(protocalBuffer,decode_length))
         {
            return;
         }
         a_2439.getInstance().updateNotifyCards(notify.m_arrCardData);
         a_2439.getInstance().updateNotifyHeroCards(notify.m_arrHeroItemData);
         var dataEvent:a_1778 = new a_1778(EventType.a_646);
         dataEvent.dataObject = notify.m_iDstUin;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2426(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var notify:a_2672 = new a_2672();
         if(!notify.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CNotifyBeAddedFriend failed.");
            return;
         }
         var friend:Object = a_2439.getInstance().getFriendByUin(notify.m_iUIN);
         if(friend == null)
         {
            a_2439.getInstance().updateBeFriends(notify);
            dataEvent = new a_1778(EventType.a_620);
            dataEvent.dataObject = notify;
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
      }
      
      private function a_2427(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var notify:a_2675 = new a_2675();
         if(!notify.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CNotifyBeAddedFriend failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_621);
         dataEvent.dataObject = notify.m_stPlayerStatus;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2428(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var dataEvent:a_1778 = null;
         var notify:a_2750 = new a_2750();
         if(!notify.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CNotifyKickPlayer failed.");
            return;
         }
         if(notify.m_nReasonID == 700 || notify.m_nReasonID == 516 || notify.m_nReasonID == 721 || notify.m_nReasonID == 725 || notify.m_nReasonID == 726)
         {
            dataEvent = new a_1778(EventType.a_630);
            dataEvent.dataObject = notify;
            a_1789.getInstance().dispatchEvent(dataEvent);
         }
      }
      
      public function a_2429(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var iServerID:int = a_787.m_iServerID;
         var iServerType:int = a_787.m_iServerType;
         var dataEvent:a_1778 = new a_1778(EventType.a_567);
         dataEvent.dataObject = [iServerID,iServerType];
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2430(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var i:int = 0;
         var dataEvent:a_1778 = null;
         var ba:ByteArray = null;
         var notify:a_2740 = new a_2740();
         if(!notify.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CCSNotifySystemMessag failed.");
            return;
         }
         for(i = 0; i < notify.m_nCount; i++)
         {
            dataEvent = new a_1778(EventType.a_632);
            ba = notify.m_aryMsg[i].m_szSystemMessage as ByteArray;
            ba.position = 0;
            dataEvent.dataObject = ba.readMultiByte(ba.bytesAvailable,"utf-8");
            if("mail_remind_0x7D23" == dataEvent.dataObject as String)
            {
               a_2158.e.notifyMailTip(true);
            }
            else
            {
               ba.clear();
               a_1789.getInstance().dispatchEvent(dataEvent);
            }
         }
         notify = null;
      }
      
      private function OnNewSystemMessageNotify(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var i:int = 0;
         var msg:String = null;
         var mg:CSystemMessage = null;
         var dataEvent:a_1778 = null;
         var notify:CCSNotifyNewSystemMessage = new CCSNotifyNewSystemMessage();
         if(!notify.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CCSNotifySystemMessag failed.");
            return;
         }
         for(i = 0; i < notify.m_SystemMessage.length; i++)
         {
            mg = notify.m_SystemMessage[i] as CSystemMessage;
            if(mg)
            {
               if(mg.FirLevel == 0 && mg.SecLevel == 0)
               {
                  msg = mg.m_szMessage;
               }
               else
               {
                  msg = AnalysisSystemNoticeXml.GetInstance().getMsg(mg.FirLevel,mg.SecLevel,mg.repString,mg.holder);
               }
            }
            else
            {
               msg = notify.m_SystemMessage[i];
            }
            dataEvent = new a_1778(EventType.a_632);
            dataEvent.dataObject = msg;
            if("mail_remind_0x7D23" == dataEvent.dataObject as String)
            {
               a_2158.e.notifyMailTip(true);
            }
            else
            {
               a_1789.getInstance().dispatchEvent(dataEvent);
            }
         }
         notify = null;
      }
      
      private function a_2431(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var notify:a_2857 = new a_2857();
         if(!notify.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CNotifyKickPlayer failed.");
            return;
         }
         var dataEvent:a_1778 = new a_1778(EventType.a_623);
         dataEvent.dataObject = notify;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2432(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var notify:a_2856 = new a_2856();
         if(!notify.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CNotifyKickPlayer failed.");
            return;
         }
         var obj:Object = {};
         obj.m_iRoleUin = notify.m_iSrcUin;
         obj.m_szRoleName = notify.m_szHeroName;
         obj.m_iUserSex = notify.m_cUserSex;
         obj.m_szHeroItem = notify.m_szHeroItem;
         obj.m_iHeroAttack = notify.m_iHeroAttack;
         obj.m_iHeroDefense = notify.m_iHeroDefense;
         obj.SuitShowType = this.getSuitShowType(notify.m_byShowCard);
         obj.m_arrHeroInfo = notify.m_arrHeroInfo;
         a_2608.getInstance().setPlayerCommonData(obj.m_iRoleUin,obj);
         a_2439.getInstance().updateFriendHeroInfo(notify);
         var dataEvent:a_1778 = new a_1778(EventType.a_604);
         dataEvent.dataObject = notify;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function getSuitShowType(m_byShowCard:int) : int
      {
         if(m_byShowCard & 0x40)
         {
            return 3;
         }
         if(m_byShowCard & 0x10)
         {
            return 2;
         }
         if(m_byShowCard & 4)
         {
            return 1;
         }
         return 0;
      }
      
      private function a_2433(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var notify:a_2833 = new a_2833();
         if(!notify.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode OnNotifyRefreshAchievements failed.");
            return;
         }
         a_2439.getInstance().updateRoleAchievements(notify.m_stAchievements);
         var dataEvent:a_1778 = new a_1778(EventType.a_655);
         dataEvent.dataObject = notify.m_stAchievements;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      private function a_2434(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var notify:a_2749 = new a_2749();
         if(!notify.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode OnNotifyItemExtraattrChange failed.");
            return;
         }
         a_2439.getInstance().updateCardAttr(notify);
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         a_1825.e.onNotifyRoleChange(role);
         var dataEvent:a_1778 = new a_1778(EventType.a_646);
         dataEvent.dataObject = role.m_iRoleUin;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function a_2435(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var notify:a_2909 = new a_2909();
         if(!notify.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CNotifyActiveService failed.");
            return;
         }
         a_2439.getInstance().updateSkillLevel(notify);
         var dataEvent:a_1778 = new a_1778(EventType.a_607);
         dataEvent.dataObject = notify.m_iSkillID;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function a_2436(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var notify:a_2910 = new a_2910();
         if(!notify.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CNotifyActiveService failed.");
            return;
         }
         a_2439.getInstance().updateSkillPoint(notify.m_arrUpdateSkillPoint);
         var dataEvent:a_1778 = new a_1778(EventType.a_607);
         dataEvent.dataObject = notify.m_nSkillCount;
         a_1789.getInstance().dispatchEvent(dataEvent);
      }
      
      public function a_2437(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var notify:a_2901 = new a_2901();
         if(!notify.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CNotifyActiveService failed.");
            return;
         }
         a_2439.getInstance().updateActiveService(notify.m_arrService);
      }
      
      public function a_2438(csPackageHeader:a_2670, protocalBuffer:ByteArray) : void
      {
         var decode_length:int = 0;
         var notify:a_2752 = new a_2752();
         if(!notify.decode(protocalBuffer,decode_length))
         {
            trace("Error: Decode CNotifyActiveService failed.");
            return;
         }
         a_2439.getInstance().updatePlayerHealthData(notify);
      }
   }
}

