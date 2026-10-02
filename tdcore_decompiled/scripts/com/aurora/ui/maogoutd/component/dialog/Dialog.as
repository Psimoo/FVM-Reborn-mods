package com.aurora.ui.maogoutd.component.dialog
{
   import a_4752.GameStringManager;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.GlowFilter;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.utils.Dictionary;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class Dialog extends Sprite implements IDialog
   {
      
      private static var _instance:IDialog;
      
      private static var sign:Boolean;
      
      private const STAGE_WIDTH:int = 950;
      
      private const STAGE_HEIGHT:int = 600;
      
      public var maskMC:MovieClip;
      
      public var closeBtn:SimpleButton;
      
      public var sureBtn:SimpleButton;
      
      public var cancelBtn:SimpleButton;
      
      public var titleTxt:TextField;
      
      private var _g_tempValue:Object;
      
      private var _content:AbstractContent;
      
      private var _container:DisplayObjectContainer;
      
      private var defaultContent:a_3249;
      
      private var bg:BG;
      
      private var autoHideDelay:int;
      
      private var autoHideTimeout:int;
      
      public var m_bNoTips:Boolean = false;
      
      public var m_stNoTipsMc:MovieClip;
      
      private var m_dictNoTipsList:Dictionary;
      
      private var m_stCurrentSubject:*;
      
      private const NO_TIPS_TYPE:String = "NO_TIPS";
      
      private const TIPS_TYPE:String = "TIPS";
      
      private const SHOW_TIPS_TYPE:String = "SHOW_TIPS";
      
      public function Dialog()
      {
         super();
         if(!sign)
         {
            throw new Error("Dialog不允许实例化，请通过getInstance()获取！");
         }
         this.init();
      }
      
      public static function getInstance() : IDialog
      {
         if(_instance == null)
         {
            sign = true;
            _instance = new Dialog();
            sign = false;
         }
         return _instance;
      }
      
      public static function getTextFilter() : GlowFilter
      {
         var color:Number = 1718616;
         var alpha:Number = 1;
         var blurX:Number = 4;
         var blurY:Number = 4;
         var strength:Number = 18;
         var inner:Boolean = false;
         var knockout:Boolean = false;
         var quality:Number = BitmapFilterQuality.LOW;
         return new GlowFilter(color,alpha,blurX,blurY,strength,quality,inner,knockout);
      }
      
      public function ShowNoTips(pSubject:*) : Boolean
      {
         if(!pSubject)
         {
            return false;
         }
         this.m_stNoTipsMc.visible = true;
         if(null == this.m_dictNoTipsList[pSubject])
         {
            this.m_stNoTipsMc.gotoAndStop(1);
            this.m_dictNoTipsList[pSubject] = this.SHOW_TIPS_TYPE;
         }
         else
         {
            if(this.m_dictNoTipsList[pSubject] == this.NO_TIPS_TYPE)
            {
               this.hideTip();
               this.m_stNoTipsMc.gotoAndStop(2);
               dispatchEvent(new a_3251(a_3251.SURE));
               return true;
            }
            this.m_stNoTipsMc.gotoAndStop(1);
         }
         this.m_stCurrentSubject = pSubject;
         return false;
      }
      
      override public function set visible(b:Boolean) : void
      {
      }
      
      public function set g_tempValue(value:Object) : void
      {
         this._g_tempValue = value;
      }
      
      public function get g_tempValue() : Object
      {
         return this._g_tempValue;
      }
      
      public function set content(ct:*) : void
      {
         var topW:int = 0;
         if(null == ct)
         {
            ct = GameStringManager.getInstance().getString(132445);
         }
         if(ct is String)
         {
            this.defaultContent.setContent(ct);
            ct = this.defaultContent;
         }
         else if(!ct is AbstractContent)
         {
            return;
         }
         if(ct == this._content)
         {
            return;
         }
         if(this._content != null)
         {
            if(this._content.parent == this)
            {
               removeChild(this._content);
            }
         }
         this._content = ct;
         if(this._content != null)
         {
            if(this._content.parent != this)
            {
               addChild(this._content);
            }
         }
         if(this._content != null)
         {
            if(getChildIndex(this._content) != numChildren - 1)
            {
               setChildIndex(this._content,numChildren - 1);
            }
         }
         if(parent != null && parent == this._container)
         {
            topW = this.titleTxt.x + this.titleTxt.width;
            if(this.closeBtn.parent == this)
            {
               topW += BG.a_941 + this.closeBtn.width + BG.a_942;
            }
            else
            {
               topW += this.titleTxt.x;
            }
            this.bg.setSize(this._content.getSize().w,this._content.getSize().h,topW,this.sureBtn.parent == this || this.cancelBtn.parent == this);
            this.adjust();
         }
      }
      
      public function get content() : AbstractContent
      {
         return this._content;
      }
      
      public function set container(ct:DisplayObjectContainer) : void
      {
         if(ct != this._container)
         {
            this._container = ct;
         }
         if(this.parent != null)
         {
            this._container.addChild(this);
         }
      }
      
      public function get container() : DisplayObjectContainer
      {
         return this._container;
      }
      
      public function showTip(ct:DisplayObjectContainer, title:String = "", useMask:Boolean = true, showCloseBtn:Boolean = true, showSureBtn:Boolean = true, showCancelBtn:Boolean = true, autoHideDelay:int = -1, pSubject:* = null) : void
      {
         this.m_stCurrentSubject = null;
         this.m_stNoTipsMc.visible = false;
         if(this.ShowNoTips(pSubject))
         {
            return;
         }
         title = GameStringManager.getInstance().getString(24577);
         this.addChildHandle(this.maskMC,useMask,this.maskMCOnClick);
         this.titleTxt.text = title;
         this.formatTitle();
         this._container = ct;
         var w:int = 200;
         var h:int = 100;
         if(this._content != null)
         {
            if(this._content.parent == this)
            {
               w = int(this._content.getSize().w);
               h = int(this._content.getSize().h);
               if(this.m_stNoTipsMc.visible)
               {
                  h += this.m_stNoTipsMc.height;
               }
            }
         }
         var topW:int = this.titleTxt.x + this.titleTxt.width;
         if(showCloseBtn)
         {
            topW += BG.a_941 + this.closeBtn.width + BG.a_942;
         }
         else
         {
            topW += this.titleTxt.x;
         }
         this.bg.setSize(w,h,topW,showSureBtn || showCancelBtn);
         this.addChildHandle(this.closeBtn,showCloseBtn,this.closeBtnOnClick);
         this.addChildHandle(this.sureBtn,showSureBtn,this.sureBtnOnClick);
         this.addChildHandle(this.cancelBtn,showCancelBtn,this.cancelBtnOnClick);
         if(parent != this._container)
         {
            this._container.addChild(this);
         }
         else
         {
            this._container.setChildIndex(this,this._container.numChildren - 1);
         }
         this.adjust();
         if(this._content != null)
         {
            if(getChildIndex(this._content) != numChildren - 1)
            {
               setChildIndex(this._content,numChildren - 1);
            }
         }
         clearTimeout(this.autoHideTimeout);
         this.autoHideDelay = autoHideDelay;
         if(this.autoHideDelay > 0)
         {
            this.autoHideTimeout = setTimeout(this.hideTip,this.autoHideDelay,true);
         }
      }
      
      public function hideTip(notify:Boolean = false) : void
      {
         clearTimeout(this.autoHideTimeout);
         if(parent != null && parent == this._container)
         {
            this._container.removeChild(this);
         }
         if(notify)
         {
            dispatchEvent(new a_3251(a_3251.CLOSE));
         }
      }
      
      private function init() : void
      {
         this.maskMC.buttonMode = false;
         this.bg = new BG();
         addChildAt(this.bg,1);
         this.titleTxt.mouseEnabled = false;
         this.titleTxt.autoSize = TextFieldAutoSize.LEFT;
         this.setTFFilter(this.titleTxt);
         this.defaultContent = new a_3249();
         this.m_dictNoTipsList = new Dictionary();
         this.m_stNoTipsMc.visible = false;
         this.m_stNoTipsMc.gotoAndStop(1);
         this.m_stNoTipsMc.addEventListener(MouseEvent.CLICK,this.OnClickNoTipsMcHandler);
      }
      
      private function OnClickNoTipsMcHandler(e:MouseEvent) : void
      {
         if(this.m_stNoTipsMc.currentFrame != this.m_stNoTipsMc.totalFrames)
         {
            this.m_stNoTipsMc.gotoAndStop(2);
            this.m_dictNoTipsList[this.m_stCurrentSubject] = this.NO_TIPS_TYPE;
         }
         else
         {
            this.m_stNoTipsMc.gotoAndStop(1);
            this.m_dictNoTipsList[this.m_stCurrentSubject] = this.SHOW_TIPS_TYPE;
         }
      }
      
      private function adjust() : void
      {
         var rect:Rectangle = null;
         var btnsPos:Object = null;
         var btn:SimpleButton = null;
         var size:Object = null;
         rect = this.bg.titleRect;
         this.titleTxt.x = rect.x;
         this.titleTxt.y = int(rect.y + (rect.height - this.titleTxt.height) / 2);
         if(this.closeBtn.parent == this)
         {
            rect = this.bg.closeRect;
            this.closeBtn.x = rect.x - this.closeBtn.width;
            this.closeBtn.y = rect.y;
         }
         if(this.sureBtn.parent == this && this.cancelBtn.parent == this)
         {
            btnsPos = this.bg.btnsPos;
            this.sureBtn.y = this.cancelBtn.y = btnsPos.y;
            this.sureBtn.x = int((this.bg.getSize().w - this.sureBtn.width - this.cancelBtn.width - btnsPos.dis) / 2);
            this.cancelBtn.x = this.sureBtn.x + this.sureBtn.width + btnsPos.dis;
            if(this.m_stNoTipsMc.visible)
            {
               this.m_stNoTipsMc.x = int((this.bg.getSize().w - this.m_stNoTipsMc.width - btnsPos.dis) / 2);
               this.m_stNoTipsMc.y = this.sureBtn.y - 3 - this.m_stNoTipsMc.height;
            }
         }
         else if(this.sureBtn.parent == this || this.cancelBtn.parent == this)
         {
            btn = this.sureBtn.parent == this ? this.sureBtn : this.cancelBtn;
            btnsPos = this.bg.btnsPos;
            btn.y = btnsPos.y;
            btn.x = int((this.bg.getSize().w - btn.width) / 2);
         }
         if(this._content != null && this._content.parent == this)
         {
            rect = this.bg.contentRect;
            size = this._content.getSize();
            if(this.m_stNoTipsMc.visible)
            {
               this._content.x = rect.x + (rect.width - size.w) / 2;
               this._content.y = rect.y + (rect.height - size.h - this.m_stNoTipsMc.height) / 2;
            }
            else
            {
               this._content.x = rect.x + (rect.width - size.w) / 2;
               this._content.y = rect.y + (rect.height - size.h) / 2;
            }
         }
         this.x = int((this.STAGE_WIDTH - this.bg.getSize().w) / 2);
         this.y = int((this.STAGE_HEIGHT - this.bg.getSize().h) / 2);
         if(this.maskMC.parent == this)
         {
            this.maskMC.width = this.STAGE_WIDTH;
            this.maskMC.height = this.STAGE_HEIGHT;
            this.maskMC.x = int((this.bg.getSize().w - this.maskMC.width) / 2);
            this.maskMC.y = int((this.bg.getSize().h - this.maskMC.height) / 2);
         }
      }
      
      private function addChildHandle(target:DisplayObject, add:Boolean, clickHandle:Function) : void
      {
         if(add)
         {
            if(target.parent != this)
            {
               if(target == this.maskMC)
               {
                  addChildAt(target,0);
               }
               else
               {
                  addChild(target);
               }
            }
            if(!target.hasEventListener(MouseEvent.CLICK))
            {
               target.addEventListener(MouseEvent.CLICK,clickHandle);
            }
         }
         else
         {
            if(target.parent == this)
            {
               removeChild(target);
            }
            if(target.hasEventListener(MouseEvent.CLICK))
            {
               target.removeEventListener(MouseEvent.CLICK,clickHandle);
            }
         }
      }
      
      private function formatTitle() : void
      {
         var fmt:TextFormat = new TextFormat();
         fmt.size = 16;
         fmt.bold = true;
         fmt.color = 16249599;
         fmt.letterSpacing = 1;
         this.titleTxt.setTextFormat(fmt);
      }
      
      private function setTFFilter(tf:TextField) : void
      {
         tf.filters = [Dialog.getTextFilter()];
      }
      
      private function maskMCOnClick(a_4730:MouseEvent) : void
      {
      }
      
      private function closeBtnOnClick(a_4730:MouseEvent) : void
      {
         this.hideTip(true);
      }
      
      private function sureBtnOnClick(a_4730:MouseEvent) : void
      {
         this.hideTip();
         if(Boolean(this.m_dictNoTipsList[this.m_stCurrentSubject]) && this.m_dictNoTipsList[this.m_stCurrentSubject] != this.NO_TIPS_TYPE)
         {
            this.m_dictNoTipsList[this.m_stCurrentSubject] = this.SHOW_TIPS_TYPE;
         }
         dispatchEvent(new a_3251(a_3251.SURE));
      }
      
      private function cancelBtnOnClick(a_4730:MouseEvent) : void
      {
         this.hideTip();
         if(this.m_dictNoTipsList[this.m_stCurrentSubject])
         {
            this.m_dictNoTipsList[this.m_stCurrentSubject] = this.SHOW_TIPS_TYPE;
         }
         dispatchEvent(new a_3251(a_3251.CANCEL));
      }
   }
}

