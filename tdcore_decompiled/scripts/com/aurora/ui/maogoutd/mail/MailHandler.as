package com.aurora.ui.maogoutd.mail
{
   import a_4729.EventType;
   import a_4729.a_1789;
   import a_4754.a_2155;
   import a_4754.a_2161;
   import com.aurora.event.mail.MailEvent;
   import com.aurora.protocol.hallserver.mail.CCSResponseMailOperation;
   import com.aurora.protocol.hallserver.mail.CMail;
   import com.aurora.protocol.hallserver.mail.CResponsePlayerMailList;
   import com.aurora.ui.maogoutd.iface.ITDMessageTip;
   import com.aurora.ui.maogoutd.role.a_4463;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   
   public class MailHandler
   {
      
      private static var m_pInstance:MailHandler = new MailHandler();
      
      private var m_vMail:Vector.<CMail>;
      
      private var m_stTDMailUI:DisplayObjectContainer;
      
      private var m_iSelfUin:int = 0;
      
      private var m_stGetMailListCallBackFunction:Function;
      
      private var m_stOperationCallBackFunction:Function;
      
      private var m_bInitList:Boolean = false;
      
      public function MailHandler()
      {
         super();
         this.a_3014();
      }
      
      public static function Get() : MailHandler
      {
         return m_pInstance;
      }
      
      private function get SelfUin() : int
      {
         var stRole:a_4463 = null;
         if(0 == this.m_iSelfUin)
         {
            stRole = a_2161.e.GetCurrentRole() as a_4463;
            this.m_iSelfUin = stRole.m_iRoleUin;
         }
         return this.m_iSelfUin;
      }
      
      private function a_3014() : void
      {
         this.m_vMail = new Vector.<CMail>();
         a_1789.getInstance().addEventListener(EventType.MAIL_LIST_RESPONSE,this.OnCResponsePlayerMailList);
         a_1789.getInstance().addEventListener(EventType.MAIL_OPERATE_RESPONSE,this.OnCCSResponseMailOperation);
      }
      
      public function RegisterTDMailUI(stTDMail:Sprite) : void
      {
         this.m_stTDMailUI = stTDMail;
      }
      
      public function OnRequestPlayerMailList(stCallBackFun:Function = null) : void
      {
         if(null != stCallBackFun)
         {
            this.m_stGetMailListCallBackFunction = stCallBackFun;
         }
         a_2161.e.notify("OnCRequestPlayerMailList",this.SelfUin);
      }
      
      public function OnCRequestSendMail(stMail:CMail) : void
      {
         if(stMail.m_stMailItem.m_iItemID == 0)
         {
            stMail.m_iMoneyType = 0;
            stMail.a_1074 = 0;
         }
         a_2161.e.notify("OnCRequestSendMail",this.SelfUin,stMail);
      }
      
      public function OnCRequestUpdatePlayerMailList() : void
      {
         a_2161.e.notify("OnCRequestUpdatePlayerMailList",this.SelfUin);
      }
      
      public function OnUpdateDataCallBack(stCallBackFun:Function) : void
      {
         this.m_stOperationCallBackFunction = stCallBackFun;
      }
      
      public function DeleteMail(iMailIDHigh:int, iMailIDLow:int) : void
      {
         for(var i:int = 0; i < this.m_vMail.length; i++)
         {
            if(this.m_vMail[i].m_iMailIDHigh == iMailIDHigh && this.m_vMail[i].m_iMailIDLow == iMailIDLow)
            {
               a_2161.e.notify("OnCRequestDeleteMail",this.SelfUin,iMailIDHigh,iMailIDLow);
               this.m_vMail.splice(i,1);
            }
         }
      }
      
      public function ReadMail(iMailIDHigh:int, iMailIDLow:int) : void
      {
         a_2161.e.notify("OnCRequestReadMail",this.SelfUin,iMailIDHigh,iMailIDLow);
      }
      
      public function FetchMailItem(iMailIDHigh:int, iMailIDLow:int) : void
      {
         a_2161.e.notify("OnCRequestFetchMailItem",this.SelfUin,iMailIDHigh,iMailIDLow);
      }
      
      public function IsSelf(iUin:int) : Boolean
      {
         return this.SelfUin == iUin;
      }
      
      private function OnCResponsePlayerMailList(e:MailEvent) : void
      {
         var response:CResponsePlayerMailList = e.data as CResponsePlayerMailList;
         if(0 == response.m_iResultID)
         {
            this.m_vMail = response.m_vCMail;
         }
         if(null != this.m_stGetMailListCallBackFunction)
         {
            this.m_stGetMailListCallBackFunction();
         }
      }
      
      private function OnCCSResponseMailOperation(e:MailEvent) : void
      {
         var strMsg:String = null;
         var textTip:ITDMessageTip = null;
         var response:CCSResponseMailOperation = e.data as CCSResponseMailOperation;
         switch(response.m_iOperateType)
         {
            case 0:
               strMsg = "发送邮件";
               break;
            case 1:
               strMsg = "删除邮件";
               this.OnDeleteMail(response);
               break;
            case 2:
               strMsg = "获取邮件附件";
               this.OnFetchMail(response);
         }
         if(Boolean(strMsg) && Boolean(this.m_stTDMailUI))
         {
            if(0 == response.m_iResultID)
            {
               strMsg += "成功";
            }
            else
            {
               strMsg = response.m_szReason;
            }
            textTip = a_2155.e.GetMessageTip() as ITDMessageTip;
            textTip.showTextTip(this.m_stTDMailUI,strMsg,new Rectangle());
         }
         if(null != this.m_stOperationCallBackFunction)
         {
            this.m_stOperationCallBackFunction();
         }
      }
      
      public function GetReceMailList() : Vector.<CMail>
      {
         var vReceMail:Vector.<CMail> = new Vector.<CMail>();
         var vReadMail:Vector.<CMail> = new Vector.<CMail>();
         var vUnReadMail:Vector.<CMail> = new Vector.<CMail>();
         for(var i:int = 0; i < this.m_vMail.length; i++)
         {
            if(this.IsSelf(this.m_vMail[i].m_iDstUin))
            {
               if(this.m_vMail[i].m_iReadTimestamp == 0)
               {
                  vUnReadMail.push(this.m_vMail[i]);
               }
               else
               {
                  vReadMail.push(this.m_vMail[i]);
               }
            }
         }
         vUnReadMail.sort(this.OnSrotMailByCreateTime);
         vReadMail.sort(this.OnSrotMailByCreateTime);
         return vUnReadMail.concat(vReadMail);
      }
      
      public function GetSendMailList() : Vector.<CMail>
      {
         var vSendMail:Vector.<CMail> = new Vector.<CMail>();
         for(var i:int = 0; i < this.m_vMail.length; i++)
         {
            if(this.m_vMail[i].m_iSrcUin == this.SelfUin)
            {
               vSendMail.push(this.m_vMail[i]);
            }
         }
         vSendMail.sort(this.OnSrotMailByCreateTime);
         return vSendMail;
      }
      
      private function OnSrotMailByCreateTime(stMailA:CMail, stMailB:CMail) : Number
      {
         if(stMailA.m_iCreateTimestamp > stMailB.m_iCreateTimestamp)
         {
            return -1;
         }
         if(stMailA.m_iCreateTimestamp == stMailB.m_iCreateTimestamp)
         {
            return 0;
         }
         return 1;
      }
      
      private function OnFetchMail(response:CCSResponseMailOperation) : void
      {
         var stMail:CMail = null;
         if(0 == response.m_iResultID)
         {
            for each(stMail in this.m_vMail)
            {
               if(stMail.m_iMailIDHigh == response.m_iMailIDHigh && stMail.m_iMailIDLow == response.m_iMailIDLow)
               {
                  stMail.m_iFetchItemTimestamp = new Date().time / 1000;
               }
            }
         }
      }
      
      private function OnDeleteMail(response:CCSResponseMailOperation) : void
      {
         var stMail:CMail = null;
         if(0 == response.m_iResultID)
         {
            for each(stMail in this.m_vMail)
            {
               if(stMail.m_iMailIDHigh == response.m_iMailIDHigh && stMail.m_iMailIDLow == response.m_iMailIDLow)
               {
                  stMail.m_iDeleteTimestampSrc = new Date().time / 1000;
               }
            }
         }
      }
   }
}

