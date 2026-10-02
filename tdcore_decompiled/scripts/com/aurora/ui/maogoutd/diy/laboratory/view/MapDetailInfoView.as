package com.aurora.ui.maogoutd.diy.laboratory.view
{
   import com.aurora.ui.maogoutd.crossserver.CrossXml;
   import com.aurora.ui.maogoutd.diy.DiyHandler;
   import com.aurora.ui.maogoutd.diy.myChapter.data.ChapterData;
   import com.aurora.ui.maogoutd.diy.myEditor.view.element.TipsElement;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   
   public class MapDetailInfoView extends Sprite
   {
      
      private static var m_stMapDetailInfoView:MapDetailInfoView;
      
      public var mapId:int;
      
      public var isHasKey:Boolean;
      
      public var closeBtn:SimpleButton;
      
      public var totalWaveText:TextField;
      
      public var readyTimeText:TextField;
      
      public var starLimitMovie:MovieClip;
      
      public var timeLimitText:TextField;
      
      public var petLimit:MovieClip;
      
      public var equipLimit:MovieClip;
      
      public var playerLimitText:TextField;
      
      public var fireNumText:TextField;
      
      public var mouseLevelText:TextField;
      
      public var mapNameText:TextField;
      
      public var mapDescText:TextField;
      
      public var mapIdText:TextField;
      
      public var authorNameText:TextField;
      
      public var platformGroupText:TextField;
      
      public var createRoomBtn:SimpleButton;
      
      public var quickJoinBtn:SimpleButton;
      
      public var isHasKeyMc:MovieClip;
      
      public var createKeyText:TextField;
      
      public var viewNumText:TextField;
      
      public var passNumText:TextField;
      
      public var praiseNumText:TextField;
      
      public var treadNumText:TextField;
      
      public var m_stNumExplainTip:TipsElement;
      
      public var m_PraiseSp:Sprite;
      
      public var m_TreadSp:Sprite;
      
      public var m_TotalNumSp:Sprite;
      
      public var m_TotalPassNumSp:Sprite;
      
      public function MapDetailInfoView()
      {
         super();
         this.isHasKey = false;
         this.isHasKeyMc.gotoAndStop(2);
         this.createKeyText.type == TextFieldType.DYNAMIC;
         this.createKeyText.text = "";
         this.createKeyText.restrict = "a-zA-Z0-9";
         this.m_stNumExplainTip.visible = false;
         this.authorNameText.selectable = true;
         this.authorNameText.mouseEnabled = true;
         addEventListener(Event.ADDED_TO_STAGE,this.a_4587);
         addEventListener(Event.REMOVED_FROM_STAGE,this.a_4588);
      }
      
      public static function Get() : MapDetailInfoView
      {
         if(null == m_stMapDetailInfoView)
         {
            m_stMapDetailInfoView = new MapDetailInfoView();
         }
         return m_stMapDetailInfoView;
      }
      
      protected function a_4587(a_4730:Event) : void
      {
         addEventListener(MouseEvent.CLICK,this.OnClickHandler);
         this.m_PraiseSp.addEventListener(MouseEvent.MOUSE_OVER,this.OnMouseOverSp);
         this.m_PraiseSp.addEventListener(MouseEvent.MOUSE_OUT,this.OnMouseOutSp);
         this.m_TreadSp.addEventListener(MouseEvent.MOUSE_OVER,this.OnMouseOverSp);
         this.m_TreadSp.addEventListener(MouseEvent.MOUSE_OUT,this.OnMouseOutSp);
         this.m_TotalNumSp.addEventListener(MouseEvent.MOUSE_OVER,this.OnMouseOverSp);
         this.m_TotalNumSp.addEventListener(MouseEvent.MOUSE_OUT,this.OnMouseOutSp);
         this.m_TotalPassNumSp.addEventListener(MouseEvent.MOUSE_OVER,this.OnMouseOverSp);
         this.m_TotalPassNumSp.addEventListener(MouseEvent.MOUSE_OUT,this.OnMouseOutSp);
      }
      
      protected function a_4588(a_4730:Event) : void
      {
         removeEventListener(MouseEvent.CLICK,this.OnClickHandler);
         this.m_PraiseSp.removeEventListener(MouseEvent.MOUSE_OVER,this.OnMouseOverSp);
         this.m_PraiseSp.removeEventListener(MouseEvent.MOUSE_OUT,this.OnMouseOutSp);
         this.m_TreadSp.removeEventListener(MouseEvent.MOUSE_OVER,this.OnMouseOverSp);
         this.m_TreadSp.removeEventListener(MouseEvent.MOUSE_OUT,this.OnMouseOutSp);
         this.m_TotalNumSp.removeEventListener(MouseEvent.MOUSE_OVER,this.OnMouseOverSp);
         this.m_TotalNumSp.removeEventListener(MouseEvent.MOUSE_OUT,this.OnMouseOutSp);
         this.m_TotalPassNumSp.removeEventListener(MouseEvent.MOUSE_OVER,this.OnMouseOverSp);
         this.m_TotalPassNumSp.removeEventListener(MouseEvent.MOUSE_OUT,this.OnMouseOutSp);
      }
      
      private function OnClickHandler(e:MouseEvent) : void
      {
         var keyString:String = null;
         switch(e.target)
         {
            case this.closeBtn:
               if(parent)
               {
                  parent.removeChild(this);
               }
               break;
            case this.isHasKeyMc:
               this.isHasKey = !this.isHasKey;
               if(this.isHasKey)
               {
                  this.isHasKeyMc.gotoAndStop(1);
                  this.createKeyText.type == TextFieldType.INPUT;
                  stage.focus = this.createKeyText;
               }
               else
               {
                  this.isHasKeyMc.gotoAndStop(2);
                  this.createKeyText.type == TextFieldType.DYNAMIC;
               }
               break;
            case this.createRoomBtn:
               if(this.isHasKey)
               {
                  keyString = this.createKeyText.text;
                  DiyHandler.GetInstance().CreateTable(this.mapId,keyString);
               }
               else
               {
                  DiyHandler.GetInstance().CreateTable(this.mapId,"");
               }
               break;
            case this.quickJoinBtn:
               DiyHandler.GetInstance().QuickJoinByMapId(this.mapId);
         }
      }
      
      private function OnMouseOverSp(e:MouseEvent) : void
      {
         if(e.target == this.m_PraiseSp)
         {
            this.m_stNumExplainTip.x = 556;
            this.m_stNumExplainTip.y = 89;
            this.m_stNumExplainTip.visible = true;
            this.m_stNumExplainTip.m_ContentText.htmlText = "点赞人数";
         }
         else if(e.target == this.m_TreadSp)
         {
            this.m_stNumExplainTip.x = 462;
            this.m_stNumExplainTip.y = 89;
            this.m_stNumExplainTip.visible = true;
            this.m_stNumExplainTip.m_ContentText.htmlText = "点踩人数";
         }
         else if(e.target == this.m_TotalNumSp)
         {
            this.m_stNumExplainTip.x = 274;
            this.m_stNumExplainTip.y = 89;
            this.m_stNumExplainTip.visible = true;
            this.m_stNumExplainTip.m_ContentText.htmlText = "试玩次数";
         }
         else if(e.target == this.m_TotalPassNumSp)
         {
            this.m_stNumExplainTip.x = 368;
            this.m_stNumExplainTip.y = 89;
            this.m_stNumExplainTip.visible = true;
            this.m_stNumExplainTip.m_ContentText.htmlText = "通关次数";
         }
      }
      
      private function OnMouseOutSp(e:MouseEvent) : void
      {
         if(e.target == this.m_PraiseSp)
         {
            this.m_stNumExplainTip.visible = false;
            this.m_stNumExplainTip.m_ContentText.htmlText = "";
         }
         else if(e.target == this.m_TreadSp)
         {
            this.m_stNumExplainTip.visible = false;
            this.m_stNumExplainTip.m_ContentText.htmlText = "";
         }
         else if(e.target == this.m_TotalNumSp)
         {
            this.m_stNumExplainTip.visible = false;
            this.m_stNumExplainTip.m_ContentText.htmlText = "";
         }
         else if(e.target == this.m_TotalPassNumSp)
         {
            this.m_stNumExplainTip.visible = false;
            this.m_stNumExplainTip.m_ContentText.htmlText = "";
         }
      }
      
      public function updateView() : void
      {
         var h:int = 0;
         var m:int = 0;
         var data:ChapterData = DiyHandler.GetInstance().m_stCurrentChapterData;
         this.mapId = data.m_iMapID;
         this.mapIdText.text = ("000000" + this.mapId.toString(16)).substr(-6);
         this.mapNameText.text = data.m_szName;
         this.authorNameText.text = data.m_szAuthorName;
         this.platformGroupText.text = CrossXml.Get().GetPlatformName(data.m_iPlatformID) + " " + data.m_iGroupID + "服";
         if(data.m_szDesc == null)
         {
            data.m_szDesc = "";
         }
         this.mapDescText.text = data.m_szDesc;
         this.totalWaveText.text = data.a_1119.toString() + "波";
         this.readyTimeText.text = data.m_iReadyTime.toString() + "秒";
         this.starLimitMovie.gotoAndStop(data.m_iMaxCardStar);
         this.viewNumText.htmlText = data.m_iTotalNum.toString();
         this.passNumText.htmlText = data.m_iTotalPassNum.toString();
         this.praiseNumText.htmlText = data.m_iPraise.toString();
         this.treadNumText.htmlText = data.m_iTread.toString();
         if(data.m_iTimeLimit <= 0)
         {
            this.timeLimitText.text = "不限";
         }
         else
         {
            h = data.m_iTimeLimit / 60;
            m = data.m_iTimeLimit % 60;
            this.timeLimitText.text = ("00" + h.toString()).substr(-2) + ":" + ("00" + m.toString()).substr(-2);
         }
         this.petLimit.gotoAndStop(data.m_bIsBanPet ? 1 : 2);
         this.equipLimit.gotoAndStop(data.m_bIsBanEquip ? 1 : 2);
         this.playerLimitText.text = data.m_bPlayerLimit == 1 ? "单人" : "不限";
         this.fireNumText.text = data.m_iFireNum.toString();
         this.mouseLevelText.text = data.m_iMouseLevel.toString() + "级";
      }
   }
}

