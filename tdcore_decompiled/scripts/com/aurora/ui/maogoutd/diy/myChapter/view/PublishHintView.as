package com.aurora.ui.maogoutd.diy.myChapter.view
{
   import com.adobe.crypto.MD5;
   import com.adobe.serialization.json.JSONDecoder;
   import com.aurora.ui.maogoutd.ClientLog.MessageTipHandler;
   import com.aurora.ui.maogoutd.diy.DiyHandler;
   import com.aurora.ui.maogoutd.diy.myChapter.data.ChapterData;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   
   public class PublishHintView extends Sprite
   {
      
      private static var m_stPublishHintView:PublishHintView;
      
      public var closeBtn:SimpleButton;
      
      public var sureBtn:SimpleButton;
      
      public var totalWaveText:TextField;
      
      public var readyTimeText:TextField;
      
      public var starLimitMovie:MovieClip;
      
      public var timeLimitText:TextField;
      
      public var petLimit:MovieClip;
      
      public var equipLimit:MovieClip;
      
      public var fireNumText:TextField;
      
      public var mouseLevelText:TextField;
      
      public var mapNameText:TextField;
      
      public var mapDescText:TextField;
      
      public var mapNameBtn:SimpleButton;
      
      public var mapDescBtn:SimpleButton;
      
      private var newNameMatchBoolean:Boolean;
      
      public function PublishHintView()
      {
         super();
         addEventListener(MouseEvent.CLICK,this.OnClickHandler);
      }
      
      public static function Get() : PublishHintView
      {
         if(null == m_stPublishHintView)
         {
            m_stPublishHintView = new PublishHintView();
         }
         return m_stPublishHintView;
      }
      
      public function updateView() : void
      {
         var h:int = 0;
         var m:int = 0;
         var data:ChapterData = DiyHandler.GetInstance().m_stCurrentChapterData;
         this.totalWaveText.text = data.a_1119.toString() + "波";
         this.readyTimeText.text = data.m_iReadyTime.toString() + "秒";
         this.starLimitMovie.gotoAndStop(data.m_iMaxCardStar);
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
         this.fireNumText.text = data.m_iFireNum.toString();
         this.mouseLevelText.text = data.m_iMouseLevel.toString() + "级";
         this.mapNameText.text = data.m_szName;
         if(null == data.m_szDesc)
         {
            this.mapDescText.text = "";
         }
         else
         {
            this.mapDescText.text = data.m_szDesc;
         }
         this.mapNameText.type = TextFieldType.DYNAMIC;
         this.mapDescText.type = TextFieldType.DYNAMIC;
         this.mapNameText.backgroundColor = this.mapDescText.backgroundColor = 3102859;
         this.mapNameText.background = false;
         this.mapDescText.background = false;
         this.mapNameText.restrict = "^[\\\\><\"]";
         this.mapDescText.restrict = "^[\\\\><\"]";
         this.mapNameText.maxChars = 7;
         this.mapDescText.maxChars = 180;
      }
      
      private function OnClickHandler(e:MouseEvent) : void
      {
         switch(e.target)
         {
            case this.closeBtn:
               if(parent)
               {
                  parent.removeChild(this);
               }
               break;
            case this.sureBtn:
               if(this.mapNameText.type == TextFieldType.INPUT)
               {
                  stage.addChild(NormalHintView.Get(NormalHintView.STRING_SURE_MAP_NAME));
                  break;
               }
               if(this.mapDescText.type == TextFieldType.INPUT)
               {
                  stage.addChild(NormalHintView.Get(NormalHintView.STRING_SURE_MAP_DESC));
                  break;
               }
               DiyHandler.GetInstance().OnCRequestDiyPublishMap();
               break;
            case this.mapNameBtn:
               this.switchTextFieldType(this.mapNameText);
               break;
            case this.mapDescBtn:
               this.switchTextFieldType(this.mapDescText);
         }
      }
      
      private function switchTextFieldType(target:TextField) : void
      {
         var str:String = null;
         if(target.type == TextFieldType.DYNAMIC)
         {
            target.type = TextFieldType.INPUT;
            target.background = true;
            stage.focus = target;
         }
         else
         {
            str = "";
            switch(target)
            {
               case this.mapNameText:
                  str = this.mapNameText.text;
                  if(this.getLen(str) > 14)
                  {
                     MessageTipHandler.Get().a_3146("名字超过 14 字符");
                     return;
                  }
                  this.MatchWord(str,this.MatchWordBackHandler,this.mapNameText);
                  break;
               case this.mapDescText:
                  str = this.mapDescText.text;
                  if(this.getLen(str) > 120)
                  {
                     MessageTipHandler.Get().a_3146("描述超过 120 字符");
                     return;
                  }
                  this.MatchWord(str,this.MatchWordBackHandler,this.mapDescText);
            }
         }
      }
      
      private function MatchWordBackHandler(target:TextField) : void
      {
         if(this.newNameMatchBoolean)
         {
            target.type = TextFieldType.DYNAMIC;
            target.background = false;
            if(target == this.mapNameText)
            {
               DiyHandler.GetInstance().m_stCurrentChapterData.m_szName = this.mapNameText.text;
            }
            if(target == this.mapDescText)
            {
               DiyHandler.GetInstance().m_stCurrentChapterData.m_szDesc = this.mapDescText.text;
            }
         }
         else
         {
            if(target == this.mapNameText)
            {
               MessageTipHandler.Get().a_3146("关卡名称含有敏感字，换一个关卡名称！");
            }
            if(target == this.mapDescText)
            {
               MessageTipHandler.Get().a_3146("关卡介绍含有敏感字，换一个关卡介绍！");
            }
         }
      }
      
      public function MatchWord(msg:String, callback:Function, targetTextField:TextField) : void
      {
         var url:String = null;
         var secret:String = null;
         var toCheck:String = null;
         var _request:URLRequest = null;
         var loader:URLLoader = null;
         this.newNameMatchBoolean = true;
         if(Boolean(stage) && Boolean(stage.loaderInfo.parameters.sitetype == "4399") || Boolean(stage) && Boolean(stage.loaderInfo.parameters.sitetype == "joyyou") || Boolean(stage) && Boolean(stage.loaderInfo.parameters.sitetype == "pps"))
         {
            url = "https://wo.webgame138.com/test/matchService.do";
            secret = "987fea36f4daae2b7872b0ae8b1e33a7";
            toCheck = msg;
            url += "?toCheck=" + encodeURIComponent(toCheck) + "&app=" + "msdzls" + "&byPinyin=" + "true" + "&sig=" + "" + MD5.hash(secret + toCheck);
            _request = new URLRequest();
            _request.url = url;
            _request.method = URLRequestMethod.POST;
            loader = new URLLoader();
            loader.addEventListener(Event.COMPLETE,function(evt:Event):void
            {
               var data:String = null;
               var replaceString:String = null;
               var j:int = 0;
               var oldPlaceStr:String = null;
               var stJsonDecode:JSONDecoder = new JSONDecoder(evt.target.data as String);
               var word:Array = new Array();
               for(data in stJsonDecode.getValue())
               {
                  word.push(stJsonDecode.getValue()[data]);
               }
               if(word.length > 0)
               {
                  newNameMatchBoolean = false;
               }
               for(var i:int = 0; i < word.length; i++)
               {
                  replaceString = "";
                  for(j = int(word[i].startPos); j <= word[i].endPos; j++)
                  {
                     replaceString += "*";
                  }
                  oldPlaceStr = toCheck.slice(word[i].startPos,word[i].endPos + 1);
                  toCheck = toCheck.replace(oldPlaceStr,replaceString);
                  targetTextField.text = toCheck;
               }
               callback(targetTextField);
            });
            loader.load(_request);
         }
         else
         {
            callback(targetTextField);
         }
      }
      
      private function getLen(str:String) : int
      {
         var len:int = 0;
         for(var i:int = 0; i < str.length; i++)
         {
            len += str.charCodeAt(i) > 128 ? 2 : 1;
         }
         return len;
      }
   }
}

