package com.aurora.ui.maogoutd.verifyInGame
{
   import a_4723.a_1767;
   import a_4728.a_1778;
   import a_4729.EventType;
   import a_4729.a_1789;
   import a_4752.GameStringManager;
   import a_4754.a_2161;
   import a_4763.a_2439;
   import a_4765.a_2333;
   import com.aurora.ui.maogoutd.ClientLog.MessageTipHandler;
   import com.aurora.ui.maogoutd.component.dialog.Dialog;
   import com.aurora.ui.maogoutd.component.dialog.IDialog;
   import com.aurora.ui.maogoutd.component.dialog.a_3251;
   import com.aurora.ui.maogoutd.role.a_4463;
   import com.aurora.utils.anticheat.NumberBehaviorVerificationEngine;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.BitmapDataChannel;
   import flash.display.BlendMode;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.filters.DisplacementMapFilter;
   import flash.filters.DisplacementMapFilterMode;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.utils.Timer;
   import flash.utils.setTimeout;
   
   public class TDRandNumVerify extends Sprite
   {
      
      private var showWidth:int = 210;
      
      private var showHeight:int = 60;
      
      private var fontSize:int = 46;
      
      private var maxErrorCnt:int = 5;
      
      private var ptMc:MovieClip;
      
      private var changeBtn:SimpleButton;
      
      private var verifyInGameSureBtn:SimpleButton;
      
      private var verifySureBtn:SimpleButton;
      
      private var countDownTxt:TextField;
      
      private var inputTxt:TextField;
      
      private var ruleTxt:TextField;
      
      private var numBmp:Bitmap;
      
      private var dialog:IDialog;
      
      private var checkNum:int;
      
      private var tick:Timer;
      
      private var verifyData:Object;
      
      private var lastTmChangeNum:Number;
      
      private var lastTmSend:Number;
      
      private var m_iOpt:int = 0;
      
      private var CD_TM:int = 3000;
      
      private var lastTickTm:Number;
      
      private var errorCnt:int;
      
      private var behaviorEngine:NumberBehaviorVerificationEngine;
      
      private var numericInput:TDNumericVerifyInput;
      
      private var simulationHasValueBtn:SimpleButton;
      
      private var simulationSortKDBtn:SimpleButton;
      
      private var simulationClearBtn:SimpleButton;
      
      private var isDebug:Boolean;
      
      private var textColorAry:Array;
      
      private var numAry:Array;
      
      private var randomPos:Array;
      
      private var verifyMover:TDVerifyMover;
      
      private var currentIndex:int = 0;
      
      public function TDRandNumVerify(mc:MovieClip, debug:Boolean)
      {
         super();
         this.isDebug = debug;
         this.ptMc = mc["ptMc"];
         this.changeBtn = mc["changeBtn"];
         this.verifyInGameSureBtn = mc["verifyInGameSureBtn"];
         this.verifySureBtn = mc["verifySureBtn"];
         this.countDownTxt = mc["cutdownTxt"];
         this.inputTxt = mc["inputTxt"];
         this.ruleTxt = mc["ruleTxt"];
         this.simulationHasValueBtn = mc["simulationHasValueBtn"];
         this.simulationSortKDBtn = mc["simulationSortKDBtn"];
         this.simulationClearBtn = mc["simulationClearBtn"];
         this.verifySureBtn.visible = false;
         this.randomPos = [296,this.verifyInGameSureBtn.x,580];
         this.countDownTxt.text = "";
         this.ruleTxt.text = "";
         this.errorCnt = 0;
         this.textColorAry = [];
         this.numAry = [];
         this.verifyData = a_2439.getInstance().GetVerifyInGame();
         this.numericInput = new TDNumericVerifyInput(this.inputTxt,8,this.isDebug);
         this.numericInput.setReporter(this.callbackReporter);
         this.generateCaptcha();
         this.startTm();
         this.lastTmChangeNum = a_1767.getInstance().TimeMs;
         this.lastTmSend = a_1767.getInstance().TimeMs;
         this.addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         this.behaviorEngine = new NumberBehaviorVerificationEngine(this.isDebug);
         this.simulationHasValueBtn.visible = this.isDebug;
         this.simulationSortKDBtn.visible = this.isDebug;
         this.simulationClearBtn.visible = this.isDebug;
      }
      
      private function callbackReporter(param:Object) : void
      {
         var data:Object = null;
         if(this.behaviorEngine)
         {
            data = param.data || {};
            data._sub = param.type;
            this.behaviorEngine.record("kd",data);
         }
      }
      
      public function destroy() : void
      {
         this.stopTm();
         if(this.numBmp)
         {
            this.numBmp.parent.removeChild(this.numBmp);
            this.numBmp.bitmapData.dispose();
            this.numBmp.bitmapData = null;
            this.numBmp = null;
         }
         if(this.numericInput)
         {
            this.numericInput.destroy();
         }
         if(Boolean(this.verifyMover) && Boolean(this.verifyMover.parent))
         {
            this.verifyMover.parent.removeChild(this.verifyMover);
         }
         this.verifyMover = null;
         this.lastTmChangeNum = 0;
         this.lastTmSend = 0;
         this.errorCnt = 0;
         this.verifyData = null;
         a_2439.getInstance().SetVerifyInGame(null);
      }
      
      private function setShowVerifyBtnState(show:Boolean) : void
      {
         var idx:int = 0;
         var newX:int = 0;
         this.verifyInGameSureBtn.visible = show;
         if(show)
         {
            idx = Math.random() * this.randomPos.length;
            newX = Math.ceil(this.randomPos[idx]);
            while(newX > 0 && newX == this.verifyInGameSureBtn.x)
            {
               idx = Math.random() * this.randomPos.length;
               newX = int(this.randomPos[idx]);
            }
            this.verifyInGameSureBtn.x = newX;
         }
      }
      
      private function onAddedToStage(e:Event) : void
      {
         this.removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         this.addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         this.changeBtn.addEventListener(MouseEvent.CLICK,this.onReqChangeNumHandler);
         this.verifyInGameSureBtn.addEventListener(MouseEvent.CLICK,this.onCheckBtnHandler);
         this.verifySureBtn.addEventListener(MouseEvent.CLICK,this.onSureBtnHandler);
         a_1789.getInstance().addEventListener(EventType.VERIFY_IN_GAME_CHANGE,this.onRspChangeNumHandler);
         this.errorCnt = 0;
         this.initBehaviorListeners();
         if(this.isDebug)
         {
            this.simulationHasValueBtn.addEventListener(MouseEvent.CLICK,this.onSimulationHasValue);
            this.simulationSortKDBtn.addEventListener(MouseEvent.CLICK,this.onSimulationSortKd);
            this.simulationClearBtn.addEventListener(MouseEvent.CLICK,this.onSimulationClear);
         }
      }
      
      private function onRemovedFromStage(a_4730:Event) : void
      {
         this.removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         this.changeBtn.removeEventListener(MouseEvent.CLICK,this.onReqChangeNumHandler);
         this.verifySureBtn.removeEventListener(MouseEvent.CLICK,this.onSureBtnHandler);
         this.verifyInGameSureBtn.removeEventListener(MouseEvent.CLICK,this.onCheckBtnHandler);
         a_1789.getInstance().removeEventListener(EventType.VERIFY_IN_GAME_CHANGE,this.onRspChangeNumHandler);
         this.removeBehaviorListeners();
         if(this.isDebug)
         {
            this.simulationHasValueBtn.removeEventListener(MouseEvent.CLICK,this.onSimulationHasValue);
            this.simulationSortKDBtn.removeEventListener(MouseEvent.CLICK,this.onSimulationSortKd);
            this.simulationClearBtn.removeEventListener(MouseEvent.CLICK,this.onSimulationClear);
         }
      }
      
      private function initBehaviorListeners() : void
      {
         if(this.stage)
         {
            this.stage.addEventListener(MouseEvent.CLICK,this.onStageClick);
            this.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMove);
            this.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onStageKeyDown);
         }
      }
      
      private function removeBehaviorListeners() : void
      {
         if(this.stage)
         {
            this.stage.removeEventListener(MouseEvent.CLICK,this.onStageClick);
            this.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMove);
            this.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onStageKeyDown);
         }
      }
      
      private function onStageMouseMove(e:MouseEvent) : void
      {
         if(this.behaviorEngine)
         {
            this.behaviorEngine.record("mm",{
               "x":e.stageX,
               "y":e.stageY
            });
         }
      }
      
      private function onStageClick(e:MouseEvent) : void
      {
         if(this.behaviorEngine)
         {
            this.behaviorEngine.record("mc",{
               "x":e.stageX,
               "y":e.stageY
            });
         }
      }
      
      private function onStageKeyDown(e:KeyboardEvent) : void
      {
         if(this.behaviorEngine)
         {
            this.behaviorEngine.record("kd",{"keyCode":e.keyCode});
         }
      }
      
      public function getInputNum() : int
      {
         var val:String = "";
         if(this.numericInput)
         {
            val = this.numericInput.getValue();
         }
         return int(val);
      }
      
      private function startTm() : void
      {
         var timeSeconds:Number = a_1767.getInstance().TimeSeconds;
         var tm:int = this.verifyData.m_iTimeStamp - timeSeconds;
         if(tm > 0)
         {
            this.lastTickTm = timeSeconds;
            this.tick = new Timer(120,0);
            this.tick.addEventListener(TimerEvent.TIMER,this.onTick);
            this.tick.start();
            this.setCutDownTm(tm);
         }
         else
         {
            this.setCutDownTm(-1);
         }
      }
      
      private function stopTm() : void
      {
         if(this.tick)
         {
            this.tick.stop();
            this.removeEventListener(TimerEvent.TIMER,this.onTick);
            this.tick = null;
         }
      }
      
      private function setCutDownTm(tm:int) : void
      {
         var temp:Array = null;
         if(tm > 0)
         {
            temp = [tm,"秒"];
            this.countDownTxt.text = temp.join("");
         }
         else
         {
            this.countDownTxt.text = "超时";
         }
      }
      
      private function onRspChangeNumHandler(e:a_1778) : void
      {
         this.verifyData = a_2439.getInstance().GetVerifyInGame();
         this.generateCaptcha();
      }
      
      private function onReqChangeNumHandler(a_4730:Event) : void
      {
         var tm:Number = NaN;
         if(this.checkTimeOut())
         {
            return;
         }
         var disTm:Number = a_1767.getInstance().TimeMs - this.lastTmChangeNum;
         if(this.lastTmChangeNum > 0 && disTm <= this.CD_TM)
         {
            tm = Math.ceil((this.CD_TM - disTm) / 1000);
            MessageTipHandler.Get().a_3146(tm + " 秒后操作");
            return;
         }
         this.numericInput.clear();
         this.behaviorEngine.clear();
         this.m_iOpt = 1;
         this.lastTmChangeNum = a_1767.getInstance().TimeMs;
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         a_2333.getInstance().onRequestVerifyInGameResult(role.m_iRoleUin,this.m_iOpt,this.verifyData.m_iNum);
      }
      
      private function checkTimeOut() : Boolean
      {
         var currSeconds:Number = a_1767.getInstance().TimeSeconds;
         var tm:int = this.verifyData.m_iTimeStamp - currSeconds;
         if(tm <= 0)
         {
            this.showDialog(GameStringManager.getInstance().getString(24740));
            return true;
         }
         return false;
      }
      
      private function onSureBtnHandler(a_4730:MouseEvent) : void
      {
         if(this.behaviorEngine)
         {
            this.behaviorEngine.recordBan(true);
         }
      }
      
      private function onCheckBtnHandler(a_4730:Event) : void
      {
         var disTm:Number = NaN;
         var tm:Number = NaN;
         var ban:Boolean = false;
         var compliance:Boolean = false;
         a_4730.stopImmediatePropagation();
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         var inputNumTxt:int = this.getInputNum();
         if(this.checkTimeOut())
         {
            return;
         }
         if(this.checkNum == inputNumTxt)
         {
            disTm = a_1767.getInstance().TimeMs - this.lastTmChangeNum;
            if(this.lastTmSend > 0 && disTm <= this.CD_TM)
            {
               tm = Math.ceil((this.CD_TM - disTm) / 1000);
               MessageTipHandler.Get().a_3146(tm + " 秒后操作");
               return;
            }
            if(this.behaviorEngine)
            {
               this.numericInput.checkInputResult();
               ban = this.behaviorEngine.getBanState();
               if(ban)
               {
                  this.m_iOpt = 0;
                  a_2333.getInstance().onRequestVerifyInGameResult(role.m_iRoleUin,this.m_iOpt,0);
                  return;
               }
               compliance = this.behaviorEngine.evaluateResultCompliance();
               if(!compliance)
               {
                  this.refreshCodeWhenError();
                  return;
               }
            }
            this.m_iOpt = 0;
            this.lastTmSend = a_1767.getInstance().TimeMs;
            MessageTipHandler.Get().a_3146("操作成功");
            a_2333.getInstance().onRequestVerifyInGameResult(role.m_iRoleUin,this.m_iOpt,this.verifyData.m_iNum);
         }
         else
         {
            if(inputNumTxt != 0)
            {
               if(this.errorCnt >= this.maxErrorCnt - 1)
               {
                  this.m_iOpt = 0;
                  a_2333.getInstance().onRequestVerifyInGameResult(role.m_iRoleUin,this.m_iOpt,0);
               }
               else
               {
                  this.refreshCodeWhenError();
               }
            }
            else
            {
               MessageTipHandler.Get().a_3146(GameStringManager.getInstance().getString(132458));
            }
            this.numericInput.clear();
            this.behaviorEngine.clear();
         }
      }
      
      private function refreshCodeWhenError() : void
      {
         var cnt:int = 0;
         this.errorCnt += 1;
         this.m_iOpt = 1;
         this.lastTmChangeNum = a_1767.getInstance().TimeMs;
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         a_2333.getInstance().onRequestVerifyInGameResult(role.m_iRoleUin,this.m_iOpt,this.verifyData.m_iNum);
         if(!this.isDebug)
         {
            cnt = Math.max(0,this.maxErrorCnt - this.errorCnt);
            MessageTipHandler.Get().a_3146(GameStringManager.getInstance().getString(132458) + " 还剩" + cnt + "次机会");
         }
         this.numericInput.clear();
         this.behaviorEngine.clear();
      }
      
      private function dialogOnSure(a_4730:a_3251) : void
      {
         this.dialog.hideTip(true);
         this.dialog.removeEventListener(a_3251.SURE,this.dialogOnSure);
         this.dialog.removeEventListener(a_3251.CANCEL,this.dialogOnCancel);
      }
      
      private function dialogOnCancel(a_4730:a_3251) : void
      {
         this.dialog.hideTip(true);
         this.dialog.removeEventListener(a_3251.SURE,this.dialogOnSure);
         this.dialog.removeEventListener(a_3251.CANCEL,this.dialogOnCancel);
      }
      
      private function showDialog(msg:String) : void
      {
         if(this.dialog == null)
         {
            this.dialog = Dialog.getInstance();
         }
         this.dialog.content = msg;
         this.dialog.showTip(this,GameStringManager.getInstance().getString(132426),true,false,true,true);
         this.dialog.addEventListener(a_3251.SURE,this.dialogOnSure);
         this.dialog.addEventListener(a_3251.CANCEL,this.dialogOnCancel);
      }
      
      private function onTick(e:TimerEvent) : void
      {
         var tm:int = 0;
         var currSeconds:Number = a_1767.getInstance().TimeSeconds;
         if(currSeconds != this.lastTickTm)
         {
            this.lastTickTm = currSeconds;
            tm = this.verifyData.m_iTimeStamp - currSeconds;
            if(tm > 0)
            {
               this.setCutDownTm(tm);
            }
            else
            {
               this.stopTm();
               this.setCutDownTm(-1);
            }
         }
      }
      
      private function generateCaptcha() : void
      {
         var i:int = 0;
         var ox:Number = NaN;
         var oy:Number = NaN;
         var ow:Number = NaN;
         var oh:Number = NaN;
         var layerScale:Number = NaN;
         var angle:Number = NaN;
         var offsetX:Number = NaN;
         var offsetY:Number = NaN;
         var m:Matrix = null;
         this.setShowVerifyBtnState(true);
         if(this.numBmp)
         {
            if(this.numBmp.bitmapData)
            {
               this.numBmp.bitmapData.dispose();
               this.numBmp.bitmapData = null;
            }
         }
         if(this.verifyMover)
         {
            if(this.verifyMover.parent)
            {
               this.verifyMover.parent.removeChild(this.verifyMover);
            }
            this.verifyMover = null;
         }
         this.ruleTxt.text = "输入下面4位数";
         this.checkNum = this.verifyData.m_iNum;
         var captchaCode:String = this.checkNum.toString();
         var bigW:int = this.showWidth;
         var bigH:int = this.showHeight;
         var bmd:BitmapData = new BitmapData(this.showWidth,this.showHeight,true,4294967295);
         bmd.noise(Math.random() * 1000,0,255,7,true);
         var baseText:BitmapData = this.createTextBitmap(captchaCode,0);
         var layers:int = 1;
         for(i = 0; i < layers; i++)
         {
            layerScale = 0.95 + Math.random() * 0.2;
            angle = (Math.random() - 0.5) * 10;
            offsetX = Math.random() * 12 - 6;
            offsetY = Math.random() * 12 - 6;
            m = new Matrix();
            m.translate(-baseText.width / 2,-baseText.height / 2);
            m.scale(layerScale,layerScale);
            m.rotate(angle * Math.PI / 180);
            m.translate(bigW / 2 + offsetX + (Math.random() - 0.5) * 6,bigH / 2 + offsetY + (Math.random() - 0.5) * 6);
            bmd.draw(baseText,m,null,BlendMode.NORMAL);
         }
         this.addNoise(bmd);
         this.applyDistortion(bmd);
         this.drawInterferenceLines(bmd);
         var occ:Shape = new Shape();
         occ.graphics.beginFill(16777215,0.15 + Math.random() * 0.18);
         ox = bigW / 2;
         oy = bigH / 2;
         ow = bigW;
         oh = bigH;
         occ.graphics.drawRect(ox - ow / 2,oy - oh / 2,ow,oh);
         occ.graphics.endFill();
         for(i = 0; i < 2; i++)
         {
            occ.graphics.beginFill(16777215,0.15 + Math.random() * 0.18);
            ox = 0;
            oy = 0;
            ow = Math.max(10,Math.random() * 60);
            oh = Math.max(10,Math.random() * 50);
            occ.graphics.drawCircle(ox,oy,50);
            occ.graphics.endFill();
         }
         for(i = 0; i < 8; i++)
         {
            occ.graphics.beginFill(16777215,0.15 + Math.random() * 0.18);
            ox = Math.random() * bigW;
            oy = Math.random() * bigH;
            ow = Math.max(20,Math.random() * 60);
            oh = Math.max(18,Math.random() * 50);
            occ.graphics.drawEllipse(ox - ow / 2,oy - oh / 2,ow,oh);
            occ.graphics.endFill();
         }
         for(i = 0; i < 2; i++)
         {
            occ.graphics.beginFill(16777215,0.15 + Math.random() * 0.18);
            ox = bigW / 2;
            oy = bigH / 2;
            ow = Math.max(40,Math.random() * 60);
            occ.graphics.drawCircle(ox,oy,ow);
            occ.graphics.endFill();
         }
         for(i = 0; i < 8; i++)
         {
            occ.graphics.beginFill(16777215,0.15 + Math.random() * 0.18);
            ox = Math.random() * bigW;
            oy = Math.random() * bigH;
            ow = Math.max(40,Math.random() * 60);
            oh = Math.max(40,Math.random() * 50);
            occ.graphics.drawRect(ox - ow / 2,oy - oh / 2,ow,oh);
            occ.graphics.endFill();
         }
         bmd.draw(occ);
         if(!this.numBmp)
         {
            this.numBmp = new Bitmap(bmd);
         }
         else
         {
            this.numBmp.bitmapData = bmd;
         }
         this.ptMc.addChild(this.numBmp);
         if(!this.verifyMover)
         {
            this.verifyMover = new TDVerifyMover(this.textColorAry,this.numAry);
            this.ptMc.addChild(this.verifyMover);
         }
      }
      
      private function createTextBitmap(sCode:String, color:Number) : BitmapData
      {
         var node:Sprite = null;
         var char:String = null;
         var tf:TextField = null;
         var fSize:int = 0;
         var colorJitter:int = 0;
         var finalColor:uint = 0;
         var fmt:TextFormat = null;
         var sX:Number = NaN;
         var sY:Number = NaN;
         var tfBack:TextField = null;
         var backFmt:TextFormat = null;
         var wrap:Sprite = null;
         var advance:Number = NaN;
         this.textColorAry.length = 0;
         this.numAry.length = 0;
         node = new Sprite();
         var baseFontSize:int = this.fontSize;
         var xCursor:Number = 0;
         for(var i:int = 0; i < sCode.length; i++)
         {
            char = sCode.charAt(i);
            tf = new TextField();
            fSize = baseFontSize + Math.max(3,Math.floor((Math.random() - 0.5) * 14));
            colorJitter = int((Math.random() - 0.5) * 986895);
            finalColor = uint(color + colorJitter & 0xFFFFFF);
            this.textColorAry[i] = finalColor;
            this.numAry[i] = char;
            fmt = new TextFormat("Arial",fSize,finalColor,true,false);
            tf.defaultTextFormat = fmt;
            tf.text = char;
            tf.autoSize = "left";
            tf.selectable = false;
            sX = 0.9 + Math.random() * 0.4;
            sY = 0.9 + Math.random() * 0.4;
            tf.scaleX = sX;
            tf.scaleY = sY;
            tfBack = new TextField();
            backFmt = new TextFormat("Arial",fSize + 2,0,true,false);
            tfBack.defaultTextFormat = backFmt;
            tfBack.text = char;
            tfBack.autoSize = "left";
            tfBack.selectable = false;
            tfBack.scaleX = sX;
            tfBack.scaleY = sY;
            tfBack.alpha = 0.9;
            wrap = new Sprite();
            wrap.addChild(tf);
            wrap.x = xCursor + Math.floor((Math.random() - 0.5) * 8);
            wrap.y = Math.floor((Math.random() - 0.5) * 8);
            node.addChild(wrap);
            advance = tf.textWidth * tf.scaleX + 6 + Math.random() * 16;
            xCursor += Math.max(advance,16);
         }
         var bounds:Rectangle = node.getBounds(node);
         var padding:int = 8;
         var requiredWidth:int = Math.ceil(bounds.width) + padding * 4;
         var requiredHeight:int = Math.ceil(bounds.height) + padding * 4;
         var bmdWidth:int = Math.max(this.showWidth,requiredWidth);
         var bmdHeight:int = Math.max(this.showHeight,requiredHeight);
         var bmd:BitmapData = new BitmapData(bmdWidth,bmdHeight,true,0);
         var m:Matrix = new Matrix();
         m.translate(-bounds.x + padding * 2,-bounds.y + padding * 2);
         bmd.draw(node,m);
         return bmd;
      }
      
      private function applyDistortion(txtBmd:BitmapData) : void
      {
         var xx:int = 0;
         var nx:Number = NaN;
         var ny:Number = NaN;
         var dx:Number = NaN;
         var dy:Number = NaN;
         var r:int = 0;
         var g:int = 0;
         var color:uint = 0;
         var w:int = txtBmd.width;
         var h:int = txtBmd.height;
         var displacementMap:BitmapData = new BitmapData(w,h,false,8421504);
         var phaseX:Number = Math.random() * Math.PI * 2;
         var phaseY:Number = Math.random() * Math.PI * 2;
         var amp1:Number = 3 + Math.random() * 4;
         var amp2:Number = 1 + Math.random() * 2;
         for(var yy:int = 0; yy < h; yy++)
         {
            for(xx = 0; xx < w; xx++)
            {
               nx = xx / w;
               ny = yy / h;
               dx = Math.sin(ny * 10 + phaseX) * amp1 + Math.sin(ny * 3 + phaseY) * amp2;
               dy = Math.cos(nx * 8 + phaseY) * amp1 * 0.6 + (Math.random() - 0.5) * 2;
               r = 128 + int(dx);
               g = 128 + int(dy);
               color = uint(r << 16 | g << 8 | 0x80);
               displacementMap.setPixel(xx,yy,color);
            }
         }
         var dispFilter:DisplacementMapFilter = new DisplacementMapFilter();
         dispFilter.mapBitmap = displacementMap;
         dispFilter.mapPoint = new Point(0,0);
         dispFilter.scaleX = 28;
         dispFilter.scaleY = 22;
         dispFilter.componentX = BitmapDataChannel.RED;
         dispFilter.componentY = BitmapDataChannel.GREEN;
         dispFilter.mode = DisplacementMapFilterMode.WRAP;
         txtBmd.applyFilter(txtBmd,txtBmd.rect,new Point(0,0),dispFilter);
         displacementMap.dispose();
      }
      
      private function applyDistortionLight(txtBmd:BitmapData) : void
      {
         var xx:int = 0;
         var nx:Number = NaN;
         var ny:Number = NaN;
         var dx:Number = NaN;
         var dy:Number = NaN;
         var r:int = 0;
         var g:int = 0;
         var color:uint = 0;
         var w:int = txtBmd.width;
         var h:int = txtBmd.height;
         var displacementMap:BitmapData = new BitmapData(w,h,false,8421504);
         var phaseX:Number = Math.random() * Math.PI * 2;
         var phaseY:Number = Math.random() * Math.PI * 2;
         var amp1:Number = 2 + Math.random() * 3;
         var amp2:Number = 1 + Math.random() * 2;
         for(var yy:int = 0; yy < h; yy++)
         {
            for(xx = 0; xx < w; xx++)
            {
               nx = xx / w;
               ny = yy / h;
               dx = Math.sin(ny * 8 + phaseX) * amp1 + Math.sin(ny * 2 + phaseY) * amp2;
               dy = Math.cos(nx * 6 + phaseY) * amp1 * 0.5;
               r = 128 + int(dx);
               g = 128 + int(dy);
               color = uint(r << 16 | g << 8 | 0x80);
               displacementMap.setPixel(xx,yy,color);
            }
         }
         var dispFilter:DisplacementMapFilter = new DisplacementMapFilter();
         dispFilter.mapBitmap = displacementMap;
         dispFilter.mapPoint = new Point(0,0);
         dispFilter.scaleX = 20;
         dispFilter.scaleY = 15;
         dispFilter.componentX = BitmapDataChannel.RED;
         dispFilter.componentY = BitmapDataChannel.GREEN;
         dispFilter.mode = DisplacementMapFilterMode.WRAP;
         txtBmd.applyFilter(txtBmd,txtBmd.rect,new Point(0,0),dispFilter);
         displacementMap.dispose();
      }
      
      private function addNoise(bmd:BitmapData) : void
      {
         var px:int = 0;
         var py:int = 0;
         var c:uint = 0;
         var speckleCount:int = Math.max(1,int(bmd.width * bmd.height * 0.1));
         for(var i:int = 0; i < speckleCount; i++)
         {
            px = Math.random() * bmd.width;
            py = Math.random() * bmd.height;
            c = uint(0 | Math.random() * 16777215);
            bmd.setPixel32(px,py,48 << 24 | c & 0xFFFFFF);
         }
      }
      
      private function drawInterferenceLines(bmd:BitmapData) : void
      {
         var bgColor:uint = 0;
         var fineAlpha:Number = NaN;
         var startX:Number = NaN;
         var startY:Number = NaN;
         var segments:int = 0;
         var s:int = 0;
         var cx:Number = NaN;
         var cy:Number = NaN;
         var ex:Number = NaN;
         var ey:Number = NaN;
         var colorOption:int = 0;
         var mixColor:uint = 0;
         var midAlpha:Number = NaN;
         var midThickness:Number = NaN;
         var thickAlpha:Number = NaN;
         var thickColor:uint = 0;
         var thickThickness:Number = NaN;
         var edge:int = 0;
         var distToCenter:Number = NaN;
         var angle:Number = NaN;
         bmd.lock();
         var shape:Shape = new Shape();
         var centerX:Number = bmd.width / 2;
         var centerY:Number = bmd.height / 2;
         var coreRadius:Number = Math.min(bmd.width,bmd.height) * 0.2;
         for(var i:int = 0; i < 5; i++)
         {
            bgColor = 13421772 - int(Math.random() * 3158064);
            fineAlpha = 0.08 + Math.random() * 0.12;
            shape.graphics.lineStyle(0.5 + Math.random() * 1,bgColor,fineAlpha);
            startX = Math.random() * bmd.width;
            startY = Math.random() * bmd.height;
            shape.graphics.moveTo(startX,startY);
            segments = 5 + Math.floor(Math.random() * 4);
            for(s = 0; s < segments; s++)
            {
               cx = Math.random() * bmd.width;
               cy = Math.random() * bmd.height;
               ex = Math.random() * bmd.width;
               ey = Math.random() * bmd.height;
               shape.graphics.curveTo(cx,cy,ex,ey);
            }
         }
         for(i = 0; i < 4; i++)
         {
            colorOption = Math.floor(Math.random() * 3);
            if(colorOption == 0)
            {
               mixColor = 8947848 + int(Math.random() * 4473924);
            }
            else if(colorOption == 1)
            {
               mixColor = 35071;
            }
            else
            {
               mixColor = 16746496;
            }
            midAlpha = 0.12 + Math.random() * 0.15;
            midThickness = 1.5 + Math.random() * 2;
            shape.graphics.lineStyle(midThickness,mixColor,midAlpha);
            startX = Math.random() * bmd.width;
            startY = Math.random() * bmd.height;
            shape.graphics.moveTo(startX,startY);
            segments = 4 + Math.floor(Math.random() * 3);
            for(s = 0; s < segments; s++)
            {
               cx = centerX + (Math.random() - 0.5) * bmd.width * 0.8;
               cy = centerY + (Math.random() - 0.5) * bmd.height * 0.8;
               ex = centerX + (Math.random() - 0.5) * bmd.width * 0.8;
               ey = centerY + (Math.random() - 0.5) * bmd.height * 0.8;
               shape.graphics.curveTo(cx,cy,ex,ey);
            }
         }
         for(i = 0; i < 2; i++)
         {
            thickAlpha = 0.06 + Math.random() * 0.09;
            thickColor = uint(0 | int(Math.random() * 8947848));
            thickThickness = 2.5 + Math.random() * 3.5;
            shape.graphics.lineStyle(thickThickness,thickColor,thickAlpha);
            edge = Math.floor(Math.random() * 4);
            switch(edge)
            {
               case 0:
                  startX = 0;
                  startY = Math.random() * bmd.height;
                  break;
               case 1:
                  startX = bmd.width;
                  startY = Math.random() * bmd.height;
                  break;
               case 2:
                  startX = Math.random() * bmd.width;
                  startY = 0;
                  break;
               default:
                  startX = Math.random() * bmd.width;
                  startY = bmd.height;
            }
            shape.graphics.moveTo(startX,startY);
            segments = 3 + Math.floor(Math.random() * 2);
            for(s = 0; s < segments; s++)
            {
               cx = Math.random() * bmd.width;
               cy = Math.random() * bmd.height;
               distToCenter = Math.sqrt((cx - centerX) * (cx - centerX) + (cy - centerY) * (cy - centerY));
               if(distToCenter < coreRadius)
               {
                  angle = Math.atan2(cy - centerY,cx - centerX);
                  cx = centerX + Math.cos(angle) * coreRadius * 1.2;
                  cy = centerY + Math.sin(angle) * coreRadius * 1.2;
               }
               ex = Math.random() * bmd.width;
               ey = Math.random() * bmd.height;
               shape.graphics.curveTo(cx,cy,ex,ey);
            }
         }
         bmd.draw(shape);
         bmd.unlock();
      }
      
      private function onSimulationHasValue(evt:MouseEvent) : void
      {
         evt.stopImmediatePropagation();
         if(this.numericInput)
         {
            this.numericInput.setValue(this.checkNum.toString());
         }
      }
      
      private function onSimulationSortKd(evt:MouseEvent) : void
      {
         evt.stopImmediatePropagation();
         this.simulateInput();
         var a_4730:MouseEvent = new MouseEvent(MouseEvent.CLICK,true,false,0);
         this.verifySureBtn.dispatchEvent(a_4730);
      }
      
      private function onSimulationClear(evt:MouseEvent) : void
      {
         evt.stopImmediatePropagation();
         this.numericInput.setValue("");
         this.behaviorEngine.clear();
      }
      
      private function getKeyCodeByNumber(num:int) : int
      {
         if(num >= 0 && num <= 9)
         {
            return 48 + num;
         }
         throw new ArgumentError("请输入0~9之间的数字");
      }
      
      private function numberToArray(num:int) : Array
      {
         var str:String = num.toString();
         var arr:Array = [];
         for(var i:int = 0; i < str.length; i++)
         {
            arr.push(int(str.charAt(i)));
         }
         return arr;
      }
      
      private function simulateInput() : void
      {
         var char:String = null;
         var pos:int = 0;
         var keyCode:uint = 0;
         var keyEvent:KeyboardEvent = null;
         var numbers:String = this.checkNum.toString();
         if(this.currentIndex < numbers.length)
         {
            char = numbers.charAt(this.currentIndex);
            pos = this.inputTxt.caretIndex;
            this.inputTxt.text = this.inputTxt.text.substr(0,pos) + char + this.inputTxt.text.substr(pos);
            this.inputTxt.setSelection(pos + 1,pos + 1);
            keyCode = char.charCodeAt(0);
            keyEvent = new KeyboardEvent(KeyboardEvent.KEY_DOWN,true,false,0,keyCode);
            this.inputTxt.dispatchEvent(keyEvent);
            ++this.currentIndex;
            setTimeout(this.simulateInput,200);
         }
         else
         {
            this.currentIndex = 0;
         }
      }
   }
}

