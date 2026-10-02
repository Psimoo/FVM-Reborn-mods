package com.aurora.ui.maogoutd.component.tip
{
   import a_4752.GameStringManager;
   import a_4754.a_1825;
   import a_4754.a_2150;
   import a_4754.a_2161;
   import a_4789.a_4657;
   import com.aurora.ui.maogoutd.im.IMUtil;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class UserAvatarTip extends Sprite
   {
      
      public var nameText:TextField;
      
      public var unionText:TextField;
      
      public var consortiaText:TextField;
      
      public var consortiaBtn:SimpleButton;
      
      public var addFirendBtn:SimpleButton;
      
      public var detailBtn:SimpleButton;
      
      public var chatBtn:SimpleButton;
      
      public var achievementBtn:SimpleButton;
      
      public var enterHomeBtn:SimpleButton;
      
      public var m_stSendFlowerBtn:SimpleButton;
      
      public var female:MovieClip;
      
      public var male:MovieClip;
      
      public var tip:MovieClip;
      
      public var tipbg:TipBG;
      
      private var m_role:Object;
      
      private var m_isLocal:Boolean;
      
      public function UserAvatarTip()
      {
         var item:* = undefined;
         super();
         this.addEventListener(MouseEvent.CLICK,this.onMouseClickEvet);
         for(item in this)
         {
            if(item is SimpleButton)
            {
               item.addEventListener(MouseEvent.ROLL_OVER,this.onMouseOverEvent);
               item.addEventListener(MouseEvent.ROLL_OUT,this.onMouseOutEvent);
            }
         }
         this.unionText.text = "";
         this.tip.visible = false;
         this.tip.mouseEnabled = false;
         this.female.visible = false;
         this.male.visible = false;
         this.tipbg.setSize(0,0,160,205);
      }
      
      private function consortiaNameInit() : void
      {
         var objConsortiaInfo:Object = a_2161.e.a_2163();
         if(null != objConsortiaInfo && null != objConsortiaInfo.m_stJoinInfo && 0 < objConsortiaInfo.m_stJoinInfo.m_iID)
         {
            this.consortiaText.text = GameStringManager.getInstance().getString(132452);
         }
         else
         {
            this.consortiaText.text = GameStringManager.getInstance().getString(132452);
         }
      }
      
      private function onMouseClickEvet(a_4730:MouseEvent) : void
      {
         if(a_4730.target.name == "addFirendBtn" && !this.m_isLocal)
         {
            a_2150.e.RequestAddFriend(this.m_role);
         }
         if(a_4730.target.name == "chatBtn")
         {
            if(this.m_role != null && this.m_role.m_iRoleUin != undefined)
            {
               a_4657.getInstance().execute("OnNotifySendTalkTransfer",this,this.m_role.m_iRoleUin,this.m_role.m_szRoleName);
            }
         }
         if(a_4730.target.name == "detailBtn")
         {
            a_1825.e.onShowRoleDetail(this.m_role,this.m_isLocal,true);
         }
         if(a_4730.target.name == "achievementBtn")
         {
            a_1825.e.onShowRoleDetail(this.m_role,this.m_isLocal,false);
         }
         if(a_4730.target.name == "enterHomeBtn" && Boolean(a_4730.target.enabled))
         {
            if(this.m_role != null && this.m_role.m_iRoleUin != undefined)
            {
               a_4657.getInstance().execute("updataHomeInfo",this,this.m_role.m_iRoleUin,this.m_role.m_szRoleName);
            }
            a_1825.e.onSendMail(this.m_role,this.m_isLocal);
         }
         if(a_4730.target.name == "consortiaBtn" && Boolean(a_4730.target.enabled))
         {
            a_1825.e.RequestJoinConsortiaNotify(this.m_role);
         }
         if(a_4730.target.name == "m_stSendFlowerBtn" && Boolean(a_4730.target.enabled))
         {
            a_1825.e.OnShowSendFlowerDialog(this.m_role);
         }
      }
      
      private function onMouseOverEvent(a_4730:MouseEvent) : void
      {
         if(a_4730.target as SimpleButton)
         {
            if(a_4730.target.name == "addFirendBtn" && this.m_isLocal)
            {
               this.tip.visible = false;
            }
            else
            {
               this.tip.x = a_4730.target.x;
               this.tip.y = a_4730.target.y;
               this.tip.visible = true;
            }
         }
      }
      
      private function onMouseOutEvent(a_4730:MouseEvent) : void
      {
         if(a_4730.target as SimpleButton)
         {
            this.tip.visible = false;
         }
      }
      
      public function showUser(role:Object, isLocal:Boolean = false) : void
      {
         this.m_isLocal = isLocal;
         this.m_role = role;
         this.consortiaNameInit();
         if(this.m_role != null)
         {
            if(this.m_role.m_szRoleName != null)
            {
               this.m_role.m_szRoleName = IMUtil.FormatUserNameForShow(this.m_role.m_szRoleName);
               this.nameText.htmlText = "<b>" + this.m_role.m_szRoleName + "<b>";
            }
            if(this.m_role.m_iUserSex == 1)
            {
               this.male.visible = true;
               this.female.visible = false;
            }
            else
            {
               this.male.visible = false;
               this.female.visible = true;
            }
         }
      }
   }
}

