package com.aurora.ui.maogoutd.verifyInGame
{
   import a_4714.AssetType;
   import a_4714.AssetsItemData;
   import a_4714.AssetsLoader;
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
   import com.aurora.utils.anticheat.PieceBehaviorVerifycationEngine;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import flash.utils.setTimeout;
   
   public class TDPieceVerify extends Sprite
   {
      
      private var panel:MovieClip;
      
      private var changeBtn:SimpleButton;
      
      private var verifyInGameSureBtn:SimpleButton;
      
      private var verifyPieceSureBtn:SimpleButton;
      
      private var countDownTxt:TextField;
      
      private var pieceGrid:Sprite;
      
      private var piece:Bitmap;
      
      private var iconBitmap:Bitmap;
      
      private var virtualTargetGrid:Bitmap;
      
      private var iconBmd:BitmapData;
      
      private var tick:Timer;
      
      private var lastTickTm:Number;
      
      private var isDebug:Boolean;
      
      private var pieceRect:Rectangle;
      
      private var behaviorEngine:PieceBehaviorVerifycationEngine;
      
      private var checkNum:int;
      
      private var targetNum:int;
      
      private var m_iOpt:int = 0;
      
      private var CD_TM:int = 3000;
      
      private var maxErrorCnt:int = 5;
      
      private var errorCnt:int;
      
      private var lastTmChangeNum:Number;
      
      private var lastTmSend:Number;
      
      private var verifyData:Object;
      
      private var dialog:IDialog;
      
      private var randomPos:Array;
      
      private var btn1:Sprite;
      
      private var btn2:Sprite;
      
      private var btn3:Sprite;
      
      private var simulationClearBtn:SimpleButton;
      
      private var simulationHasValueBtn:SimpleButton;
      
      private var simulationLineMoveBtn:SimpleButton;
      
      private var simulationLineMoveHasClickBtn:SimpleButton;
      
      public function TDPieceVerify(mc:MovieClip, debug:Boolean)
      {
         super();
         this.isDebug = debug;
         this.addEventListener(Event.ADDED_TO_STAGE,this.onAddToStage);
         this.panel = mc;
         this.changeBtn = mc["changeBtn"];
         this.countDownTxt = mc["cutdownTxt"];
         this.verifyInGameSureBtn = mc["verifyInGameSureBtn"];
         this.verifyPieceSureBtn = mc["verifyPieceSureBtn"];
         this.btn1 = mc["btn1"];
         this.btn2 = mc["btn2"];
         this.btn3 = mc["btn3"];
         this.simulationClearBtn = mc["simulationClearBtn"];
         this.simulationHasValueBtn = mc["simulationHasValueBtn"];
         this.simulationLineMoveBtn = mc["simulationLineMoveBtn"];
         this.simulationLineMoveHasClickBtn = mc["simulationLineMoveHasClickBtn"];
         this.verifyPieceSureBtn.visible = false;
         this.randomPos = [235,this.verifyInGameSureBtn.x,630];
         this.lastTmChangeNum = a_1767.getInstance().TimeMs;
         this.lastTmSend = a_1767.getInstance().TimeMs;
         this.errorCnt = 0;
         this.verifyData = a_2439.getInstance().GetVerifyInGame();
         this.behaviorEngine = new PieceBehaviorVerifycationEngine(this.isDebug);
         this.setShowVerifyBtnState(false);
      }
      
      public function destroy() : void
      {
         this.stopTm();
         this.reset();
         this.removeBehaviorListeners();
         this.lastTmSend = 0;
         this.lastTmChangeNum = 0;
         this.lastTmSend = 0;
         this.errorCnt = 0;
         this.verifyData = null;
         this.iconBitmap = null;
         this.piece = null;
         this.pieceGrid = null;
         this.virtualTargetGrid = null;
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
            this.btn1.addEventListener(MouseEvent.CLICK,this.onBtn1Handler);
            this.btn2.addEventListener(MouseEvent.CLICK,this.onBtn2Handler);
            this.btn3.addEventListener(MouseEvent.CLICK,this.onBtn3Handler);
         }
         else
         {
            this.btn1.removeEventListener(MouseEvent.CLICK,this.onBtn1Handler);
            this.btn2.removeEventListener(MouseEvent.CLICK,this.onBtn2Handler);
            this.btn3.removeEventListener(MouseEvent.CLICK,this.onBtn3Handler);
         }
      }
      
      private function onAddToStage(e:Event) : void
      {
         this.removeEventListener(Event.ADDED_TO_STAGE,this.onAddToStage);
         this.addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         this.errorCnt = 0;
         this.iconBitmap = new Bitmap();
         this.piece = new Bitmap();
         this.pieceGrid = new Sprite();
         this.virtualTargetGrid = new Bitmap();
         this.changeBtn.addEventListener(MouseEvent.CLICK,this.onReqChangeNumHandler);
         this.verifyInGameSureBtn.addEventListener(MouseEvent.CLICK,this.onCheckBtnHandler);
         this.verifyPieceSureBtn.addEventListener(MouseEvent.CLICK,this.onSureBtnHandler);
         this.pieceGrid.addEventListener(MouseEvent.MOUSE_DOWN,this.onStartDragPieceHandler);
         a_1789.getInstance().addEventListener(EventType.VERIFY_IN_GAME_CHANGE,this.onRspChangeNumHandler);
         this.startTm();
         var pngIdx:int = 1 + int(Math.random() * 15);
         this.loadIcon(pngIdx.toString());
         this.simulationClearBtn.visible = this.isDebug;
         this.simulationHasValueBtn.visible = this.isDebug;
         this.simulationLineMoveBtn.visible = this.isDebug;
         this.simulationLineMoveHasClickBtn.visible = this.isDebug;
         if(this.isDebug)
         {
            this.simulationClearBtn.addEventListener(MouseEvent.CLICK,this.onSimulationClear);
            this.simulationHasValueBtn.addEventListener(MouseEvent.CLICK,this.onSimulationHasValue);
            this.simulationLineMoveBtn.addEventListener(MouseEvent.CLICK,this.onSimulationLineMove);
            this.simulationLineMoveHasClickBtn.addEventListener(MouseEvent.CLICK,this.onSimulationLineMoveClick);
         }
      }
      
      private function onRemovedFromStage(a_4730:Event) : void
      {
         this.removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         this.pieceGrid.removeEventListener(MouseEvent.MOUSE_DOWN,this.onStartDragPieceHandler);
         this.changeBtn.removeEventListener(MouseEvent.CLICK,this.onReqChangeNumHandler);
         this.verifyInGameSureBtn.removeEventListener(MouseEvent.CLICK,this.onCheckBtnHandler);
         this.verifyPieceSureBtn.removeEventListener(MouseEvent.CLICK,this.onSureBtnHandler);
         a_1789.getInstance().removeEventListener(EventType.VERIFY_IN_GAME_CHANGE,this.onRspChangeNumHandler);
         this.stopTm();
         this.removeBehaviorListeners();
         this.btn1.removeEventListener(MouseEvent.CLICK,this.onBtn1Handler);
         this.btn2.removeEventListener(MouseEvent.CLICK,this.onBtn2Handler);
         this.btn3.removeEventListener(MouseEvent.CLICK,this.onBtn3Handler);
         if(this.isDebug)
         {
            this.simulationClearBtn.removeEventListener(MouseEvent.CLICK,this.onSimulationClear);
            this.simulationHasValueBtn.removeEventListener(MouseEvent.CLICK,this.onSimulationHasValue);
            this.simulationLineMoveBtn.removeEventListener(MouseEvent.CLICK,this.onSimulationLineMove);
            this.simulationLineMoveHasClickBtn.removeEventListener(MouseEvent.CLICK,this.onSimulationLineMoveClick);
         }
      }
      
      private function onSimulationHasValue(evt:MouseEvent) : void
      {
         var localXY:Point = null;
         evt.stopImmediatePropagation();
         var globalTargetPt:Point = this.iconBitmap.localToGlobal(new Point(this.pieceRect.x,this.pieceRect.y));
         localXY = this.panel.globalToLocal(globalTargetPt);
         this.pieceGrid.x = localXY.x;
         this.pieceGrid.y = localXY.y;
         this.panel.addChild(this.pieceGrid);
         this.targetNum = this.verifyData.m_iNum;
         this.setShowVerifyBtnState(true);
      }
      
      private function onSimulationLineMove(evt:MouseEvent) : void
      {
         evt.stopImmediatePropagation();
         this.panel.addChild(this.pieceGrid);
         this.moveToTarget();
         this.setShowVerifyBtnState(true);
      }
      
      private function onSimulationLineMoveClick(evt:MouseEvent) : void
      {
         evt.stopImmediatePropagation();
         this.panel.addChild(this.pieceGrid);
         this.moveToTarget();
         var a_4730:MouseEvent = new MouseEvent(MouseEvent.MOUSE_DOWN,true,false,0,0);
         this.pieceGrid.dispatchEvent(a_4730);
         var event2:MouseEvent = new MouseEvent(MouseEvent.MOUSE_UP,true,false,0,0);
         this.stage.dispatchEvent(event2);
         this.setShowVerifyBtnState(true);
      }
      
      private function onSimulationClear(evt:MouseEvent) : void
      {
         evt.stopImmediatePropagation();
         this.behaviorEngine.clear();
      }
      
      private function moveToTarget() : void
      {
         var endY:Number = NaN;
         var speed:Number = NaN;
         var dy:Number = NaN;
         var dist:Number = NaN;
         var globalTargetPt:Point = this.iconBitmap.localToGlobal(new Point(this.pieceRect.x,this.pieceRect.y));
         var globalMoveTargetPt:Point = this.piece.localToGlobal(new Point(this.piece.x,this.piece.y));
         var startX:Number = globalMoveTargetPt.x;
         var startY:Number = globalMoveTargetPt.y;
         var endX:Number = globalTargetPt.x;
         endY = globalTargetPt.y;
         speed = 20;
         var dx:Number = endX - this.pieceGrid.x;
         dy = endY - this.pieceGrid.y;
         dist = Math.sqrt(dx * dx + dy * dy);
         if(dist < speed)
         {
            this.pieceGrid.x = endX;
            this.pieceGrid.y = endY;
            this.targetNum = this.verifyData.m_iNum;
         }
         else
         {
            this.pieceGrid.x += dx / dist * speed;
            this.pieceGrid.y += dy / dist * speed;
            setTimeout(this.moveToTarget,200);
         }
         if(this.behaviorEngine)
         {
            this.behaviorEngine.record("mm",{
               "x":this.pieceGrid.x,
               "y":this.pieceGrid.y
            });
         }
      }
      
      private function initBehaviorListeners() : void
      {
         if(this.stage)
         {
            this.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMove);
            this.stage.addEventListener(MouseEvent.MOUSE_UP,this.onStopDragPieceHandler);
         }
      }
      
      private function removeBehaviorListeners() : void
      {
         if(this.stage)
         {
            this.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMove);
            this.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onStopDragPieceHandler);
         }
      }
      
      private function onSureBtnHandler(a_4730:MouseEvent) : void
      {
         if(this.behaviorEngine)
         {
            this.behaviorEngine.recordBan(true);
         }
      }
      
      private function onCheckBtnHandler(a_4730:MouseEvent) : void
      {
         var disTm:Number = NaN;
         var tm:Number = NaN;
         var ban:Boolean = false;
         var compliance:Boolean = false;
         a_4730.stopImmediatePropagation();
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         if(this.checkTimeOut())
         {
            return;
         }
         if(this.checkNum == this.targetNum)
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
               ban = this.behaviorEngine.getBanState();
               if(ban)
               {
                  this.setShowVerifyBtnState(false);
                  this.m_iOpt = 0;
                  a_2333.getInstance().onRequestVerifyInGameResult(role.m_iRoleUin,this.m_iOpt,0);
                  return;
               }
               compliance = this.behaviorEngine.evaluateResultCompliance();
               if(!compliance)
               {
                  this.setShowVerifyBtnState(false);
                  this.refreshCodeWhenError();
                  return;
               }
            }
            this.m_iOpt = 0;
            this.lastTmSend = a_1767.getInstance().TimeMs;
            MessageTipHandler.Get().a_3146("操作成功");
            a_2333.getInstance().onRequestVerifyInGameResult(role.m_iRoleUin,this.m_iOpt,this.verifyData.m_iNum);
         }
         else if(this.errorCnt >= this.maxErrorCnt - 1)
         {
            this.m_iOpt = 0;
            a_2333.getInstance().onRequestVerifyInGameResult(role.m_iRoleUin,this.m_iOpt,0);
         }
         else
         {
            this.refreshCodeWhenError();
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
         this.behaviorEngine.clear();
      }
      
      private function onRspChangeNumHandler(e:a_1778) : void
      {
         this.verifyData = a_2439.getInstance().GetVerifyInGame();
         this.targetNum = -1;
         this.updateContent();
      }
      
      private function onReqChangeNumHandler(a_4730:Event) : void
      {
         var tm:Number = NaN;
         a_4730.stopImmediatePropagation();
         this.setShowVerifyBtnState(false);
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
         this.behaviorEngine.clear();
         this.m_iOpt = 1;
         this.lastTmChangeNum = a_1767.getInstance().TimeMs;
         var role:a_4463 = a_2161.e.GetCurrentRole() as a_4463;
         a_2333.getInstance().onRequestVerifyInGameResult(role.m_iRoleUin,this.m_iOpt,this.verifyData.m_iNum);
      }
      
      private function onBtn1Handler(e:MouseEvent) : void
      {
         if(this.behaviorEngine)
         {
            this.behaviorEngine.record("clickChk1",{
               "x":e.stageX,
               "y":e.stageY
            });
         }
      }
      
      private function onBtn2Handler(e:MouseEvent) : void
      {
         if(this.behaviorEngine)
         {
            this.behaviorEngine.record("clickChk2",{
               "x":e.stageX,
               "y":e.stageY
            });
         }
      }
      
      private function onBtn3Handler(e:MouseEvent) : void
      {
         if(this.behaviorEngine)
         {
            this.behaviorEngine.record("clickChk3",{
               "x":e.stageX,
               "y":e.stageY
            });
         }
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
      
      private function loadIcon(resId:String) : void
      {
         var key:String = resId;
         var dic:Dictionary = new Dictionary();
         var url:String = "./images/RobotVerify/" + key + ".jpg";
         dic[key] = new AssetsItemData(url,AssetType.PNG,key);
         var loader:AssetsLoader = new AssetsLoader();
         loader.load(dic,{
            "onComplete":this.imageLoadComplete,
            "onCompleteParms":[key]
         });
      }
      
      private function imageLoadComplete(dic:Dictionary, key:String) : void
      {
         var bitmapData:BitmapData = null;
         if(Boolean(dic[key]) && Boolean(this.iconBitmap))
         {
            bitmapData = dic[key].data.bitmapData;
            this.iconBmd = bitmapData;
            this.iconBitmap.x = -bitmapData.width / 2;
            this.iconBitmap.y = -bitmapData.height / 2;
            this.updateContent();
         }
      }
      
      private function reset() : void
      {
         if(Boolean(this.piece) && Boolean(this.piece.bitmapData))
         {
            if(this.piece.bitmapData)
            {
               this.piece.bitmapData = null;
            }
            if(this.piece.parent)
            {
               this.piece.parent.removeChild(this.piece);
            }
         }
         if(Boolean(this.iconBitmap) && Boolean(this.iconBitmap.bitmapData))
         {
            if(this.iconBitmap.bitmapData)
            {
               this.iconBitmap.bitmapData = null;
            }
            if(this.iconBitmap.parent)
            {
               this.iconBitmap.parent.removeChild(this.iconBitmap);
            }
         }
         if(Boolean(this.pieceGrid) && Boolean(this.pieceGrid.parent))
         {
            this.pieceGrid.parent.removeChild(this.pieceGrid);
         }
         if(this.virtualTargetGrid)
         {
            if(this.virtualTargetGrid.bitmapData)
            {
               this.virtualTargetGrid.bitmapData = null;
            }
            if(this.virtualTargetGrid.parent)
            {
               this.virtualTargetGrid.parent.removeChild(this.virtualTargetGrid);
            }
         }
      }
      
      private function onStartDragPieceHandler(e:MouseEvent) : void
      {
         var x:Number = 230;
         var y:Number = 115;
         var w:Number = 430;
         var h:Number = 330;
         var rect:Rectangle = new Rectangle(x,y,w,h);
         this.pieceGrid.startDrag(false,rect);
         this.panel.addChild(this.pieceGrid);
         this.initBehaviorListeners();
         if(this.behaviorEngine)
         {
            this.behaviorEngine.record("startDrag",{
               "x":e.stageX,
               "y":e.stageY
            });
         }
      }
      
      private function onStopDragPieceHandler(e:MouseEvent) : void
      {
         var localXY:Point = null;
         var role:a_4463 = null;
         this.pieceGrid.stopDrag();
         this.removeBehaviorListeners();
         var globalTargetPt:Point = this.iconBitmap.localToGlobal(new Point(this.pieceRect.x,this.pieceRect.y));
         var globalMoveTargetPt:Point = this.piece.localToGlobal(new Point(this.piece.x,this.piece.y));
         if(Math.abs(globalTargetPt.x - globalMoveTargetPt.x) < 12 && Math.abs(globalTargetPt.y - globalMoveTargetPt.y) < 12)
         {
            localXY = this.panel.globalToLocal(globalTargetPt);
            this.pieceGrid.x = localXY.x;
            this.pieceGrid.y = localXY.y;
            this.targetNum = this.verifyData.m_iNum;
            this.setShowVerifyBtnState(true);
            if(this.behaviorEngine)
            {
               this.behaviorEngine.record("stopDrag",{
                  "x":e.stageX,
                  "y":e.stageY
               });
            }
         }
         else
         {
            this.setShowVerifyBtnState(false);
            this.behaviorEngine.clear();
            this.m_iOpt = 1;
            this.lastTmChangeNum = a_1767.getInstance().TimeMs;
            role = a_2161.e.GetCurrentRole() as a_4463;
            a_2333.getInstance().onRequestVerifyInGameResult(role.m_iRoleUin,this.m_iOpt,this.verifyData.m_iNum);
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
      
      private function updateContent() : void
      {
         var copyBmd:BitmapData = null;
         var pieceData:BitmapData = null;
         this.reset();
         this.checkNum = this.verifyData.m_iNum;
         copyBmd = this.iconBmd.clone();
         var w:int = 50;
         var h:int = 50;
         var dis:int = 60;
         var drawX:Number = 0;
         var drawY:Number = 0;
         if(this.isDebug)
         {
            drawX = Math.min(copyBmd.width - dis,Math.max(dis,0.3 * copyBmd.width));
            drawY = Math.min(copyBmd.height - dis,Math.max(10,0.3 * copyBmd.height));
         }
         else
         {
            drawX = Math.min(copyBmd.width - dis,Math.max(dis,Math.random() * copyBmd.width));
            drawY = Math.min(copyBmd.height - dis,Math.max(10,Math.random() * copyBmd.height));
         }
         this.pieceRect = new Rectangle(drawX,drawY,w,h);
         pieceData = new BitmapData(w,h,true,0);
         pieceData.copyPixels(copyBmd,this.pieceRect,new Point(0,0));
         this.piece.bitmapData = pieceData;
         this.pieceGrid.addChild(this.piece);
         this.pieceGrid.x = 246;
         if(this.isDebug)
         {
            this.pieceGrid.y = 382;
         }
         else
         {
            this.pieceGrid.y = 382 - Math.random() * 5 * 40;
         }
         var glow:GlowFilter = new GlowFilter(16777215,1,4,4,10,1,false,false);
         this.piece.filters = [glow];
         this.iconBitmap.bitmapData = copyBmd;
         this.panel.addChild(this.iconBitmap);
         this.iconBitmap.x = 471 - this.iconBitmap.width / 2;
         this.iconBitmap.y = 294 - this.iconBitmap.height / 2;
         copyBmd.fillRect(this.pieceRect,0);
         this.virtualTargetGrid.bitmapData = pieceData.clone();
         this.virtualTargetGrid.filters = [new GlowFilter(16777215,1,4,4,10,1,false,false)];
         this.virtualTargetGrid.alpha = 0.6;
         this.panel.addChild(this.virtualTargetGrid);
         var globalTargetPt:Point = this.iconBitmap.localToGlobal(new Point(this.pieceRect.x,this.pieceRect.y));
         var localXY:Point = this.panel.globalToLocal(globalTargetPt);
         this.virtualTargetGrid.x = localXY.x;
         this.virtualTargetGrid.y = localXY.y;
         this.panel.addChild(this.pieceGrid);
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
   }
}

