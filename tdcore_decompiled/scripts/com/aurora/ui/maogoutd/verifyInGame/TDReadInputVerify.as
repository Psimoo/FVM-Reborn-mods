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
   import com.aurora.ui.maogoutd.component.dialog.IDialog;
   import com.aurora.ui.maogoutd.role.a_4463;
   import com.aurora.ui.maogoutd.verifyInGame.view.IVerifyAni;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.TextField;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class TDReadInputVerify extends Sprite
   {
      
      public static const TYPE_SNAKE:int = 0;
      
      public static const TYPE_TIGER:int = 1;
      
      public static const TYPE_HORSE:int = 2;
      
      public static const TYPE_DOG:int = 3;
      
      public static const TYPE_PIG:int = 4;
      
      public static const TYPE_CHICKEN:int = 5;
      
      public static const METHOD_TYPE_100:int = 100;
      
      public static const METHOD_TYPE_101:int = 101;
      
      public static const METHOD_TYPE_102:int = 102;
      
      public static const METHOD_TYPE_103:int = 103;
      
      public static const METHOD_TYPE_104:int = 104;
      
      public static const METHOD_TYPE_105:int = 105;
      
      public static const METHOD_TYPE_106:int = 106;
      
      public static const METHOD_TYPE_200:int = 200;
      
      public static const METHOD_TYPE_201:int = 201;
      
      public static const METHOD_TYPE_202:int = 202;
      
      public static const METHOD_TYPE_300:int = 300;
      
      public static const METHOD_TYPE_301:int = 301;
      
      public static const METHOD_TYPE_400:int = 400;
      
      public static const METHOD_TYPE_401:int = 401;
      
      public static const METHOD_TYPE_402:int = 402;
      
      private var node1:Sprite;
      
      private var node2:Sprite;
      
      private var node3:Sprite;
      
      private var node4:Sprite;
      
      private var node5:Sprite;
      
      private var node6:Sprite;
      
      private var node7:Sprite;
      
      private var effectMc:MovieClip;
      
      private var cutdownTxt:TextField;
      
      private var inputTxt:TextField;
      
      private var ruleTxt:TextField;
      
      private var changeBtn:SimpleButton;
      
      private var verifyInGameSureBtn:SimpleButton;
      
      private var view:MovieClip;
      
      private var nodeAry:Array;
      
      private var nodeContentAry:Array;
      
      private var tdFactory:TDReadInputFactory;
      
      private var tdMethod:TDReadInputMethod;
      
      private var isRand:Boolean;
      
      private var currentMethodID:int;
      
      private var tick:Timer;
      
      private var lastTickTm:Number;
      
      private var lastTmChangeNum:Number;
      
      private var lastTmSend:Number;
      
      private var verifyData:Object;
      
      private var dialog:IDialog;
      
      private var m_iOpt:int = 0;
      
      private var CD_TM:int = 3000;
      
      private var maxErrorCnt:int = 3;
      
      private var errorCnt:int;
      
      private var maxChangeNewCnt:int = 3;
      
      private var changeNewCnt:int;
      
      private const MIN_TYPE_NUM:int = 3;
      
      private const NODE_CNT:int = 7;
      
      private const ANIMATION_TYPE_CNT:int = 27;
      
      private const RESOURCE_NAME_LIST:Array = ["蛇","虎","马","狗","猪","鸡"];
      
      private var speed:int = 2;
      
      private var frameCounter:int;
      
      private var methodID:int;
      
      private var checkResult:int;
      
      private var ruleMsg:String;
      
      private var preResourceTypes:Array;
      
      private var preResourceTypeNumDic:Dictionary;
      
      private var dynamicResourceTypeNumDic:Dictionary;
      
      private var staticResourceTypeNumDic:Dictionary;
      
      private var resourceInsDic:Dictionary;
      
      private var preResourceIds:Array;
      
      private var preResourceStates:Array;
      
      private var role:a_4463;
      
      private const MODE_BLEND:int = 0;
      
      private const MODE_DYNAMIC:int = 1;
      
      private const MODE_STATIC:int = 2;
      
      public function TDReadInputVerify()
      {
         super();
         this.nodeAry = [];
         this.nodeContentAry = [];
         this.tdFactory = new TDReadInputFactory();
         this.tdMethod = new TDReadInputMethod();
      }
      
      public function init(mc:MovieClip) : void
      {
         this.view = mc;
         this.effectMc = this.view.effectMc;
         this.inputTxt = this.view.inputTxt;
         this.ruleTxt = this.view.ruleTxt;
         this.changeBtn = this.view.changeBtn;
         this.verifyInGameSureBtn = this.view.verifyInGameSureBtn;
         this.cutdownTxt = this.view.cutdownTxt;
         this.nodeAry.push(this.view.node1);
         this.nodeAry.push(this.view.node2);
         this.nodeAry.push(this.view.node3);
         this.nodeAry.push(this.view.node4);
         this.nodeAry.push(this.view.node5);
         this.nodeAry.push(this.view.node6);
         this.nodeAry.push(this.view.node7);
      }
      
      public function hide() : void
      {
         this.stopTm();
         this.doEnterEvent(false);
         this.changeBtn.removeEventListener(MouseEvent.CLICK,this.onChangeHandler);
         this.verifyInGameSureBtn.removeEventListener(MouseEvent.CLICK,this.onSureHandler);
         a_1789.getInstance().removeEventListener(EventType.VERIFY_IN_GAME_CHANGE,this.onRspChangeNumHandler);
         this.removeNodeChilds();
         this.nodeAry.length = 0;
         this.nodeContentAry.length = 0;
         this.verifyData = null;
         this.lastTmChangeNum = 0;
         this.lastTmSend = 0;
         this.errorCnt = 0;
         this.changeNewCnt = 0;
         a_2439.getInstance().SetVerifyInGame(null);
      }
      
      public function show() : void
      {
         this.isRand = true;
         this.currentMethodID = 0;
         this.errorCnt = 0;
         this.changeNewCnt = 0;
         this.lastTmChangeNum = a_1767.getInstance().TimeMs;
         this.lastTmSend = a_1767.getInstance().TimeMs;
         this.inputTxt.text = "";
         this.role = a_2161.e.GetCurrentRole() as a_4463;
         this.changeBtn.addEventListener(MouseEvent.CLICK,this.onChangeHandler);
         this.verifyInGameSureBtn.addEventListener(MouseEvent.CLICK,this.onSureHandler);
         a_1789.getInstance().addEventListener(EventType.VERIFY_IN_GAME_CHANGE,this.onRspChangeNumHandler);
         this.updateContent();
         this.verifyData = a_2439.getInstance().GetVerifyInGame();
         this.startTm();
      }
      
      private function getShowElementLeftRightData() : Array
      {
         var key:String = null;
         var random:int = 0;
         var idx:int = 0;
         var leftID:int = 0;
         var rightID:int = 0;
         var leftName:String = "";
         var rightName:String = "";
         var list:Array = [];
         for(key in this.preResourceTypeNumDic)
         {
            list.push(int(key));
         }
         random = Math.random() * list.length;
         leftID = int(list[random]);
         idx = list.indexOf(leftID);
         list.splice(idx,1);
         random = Math.random() * list.length;
         rightID = int(list[random]);
         leftName = this.RESOURCE_NAME_LIST[leftID];
         rightName = this.RESOURCE_NAME_LIST[rightID];
         list.length = 0;
         list.push(leftID);
         list.push(rightID);
         list.push(leftName);
         list.push(rightName);
         return list;
      }
      
      private function getShowTypeMaxNumData() : Array
      {
         var key:String = "";
         var maxKey:int = 0;
         var maxVal:int = 0;
         var list:Array = [];
         var maxNumResourceName:String = "";
         for(key in this.preResourceTypeNumDic)
         {
            if(maxVal < this.preResourceTypeNumDic[key])
            {
               maxVal = int(this.preResourceTypeNumDic[key]);
               maxKey = int(key);
            }
         }
         maxNumResourceName = this.RESOURCE_NAME_LIST[maxKey];
         list.push(maxKey);
         list.push(maxNumResourceName);
         return list;
      }
      
      private function getShowRandomTypeExcludeTypeData(excludeResourceType:int) : Array
      {
         var key:String = null;
         var random:int = 0;
         var idx:int = 0;
         var findResourceId:int = 0;
         var findResourceName:String = "";
         var list:Array = [];
         for(key in this.preResourceTypeNumDic)
         {
            list.push(int(key));
         }
         idx = list.indexOf(excludeResourceType);
         list.splice(idx,1);
         random = Math.random() * list.length;
         findResourceId = int(list[random]);
         findResourceName = this.RESOURCE_NAME_LIST[findResourceId];
         list.length = 0;
         list.push(findResourceId);
         list.push(findResourceName);
         return list;
      }
      
      private function getShowRandomTypeData() : Array
      {
         var key:String = null;
         var random:int = 0;
         var idx:int = 0;
         var findResourceId:int = 0;
         var findResourceName:String = "";
         var list:Array = [];
         for(key in this.preResourceTypeNumDic)
         {
            list.push(int(key));
         }
         random = Math.random() * list.length;
         findResourceId = int(list[random]);
         findResourceName = this.RESOURCE_NAME_LIST[findResourceId];
         list.length = 0;
         list.push(findResourceId);
         list.push(findResourceName);
         return list;
      }
      
      private function calculateResult() : void
      {
         var random:int = 0;
         var key:String = null;
         var dynamicTotalNum:int = 0;
         var staticTotalNum:int = 0;
         var arg:Array = [];
         var list:Array = [];
         var typeNum:int = 0;
         var idx:int = 0;
         var leftResourceType:int = 0;
         var rightResourceType:int = 0;
         var leftResourceName:String = "";
         var rightResourceName:String = "";
         switch(this.methodID)
         {
            case TDReadInputVerify.METHOD_TYPE_100:
               list = this.getShowElementLeftRightData();
               leftResourceType = int(list[0]);
               rightResourceType = int(list[1]);
               leftResourceName = list[2];
               rightResourceName = list[3];
               if(!this.preResourceTypeNumDic.hasOwnProperty(leftResourceType))
               {
                  this.preResourceTypeNumDic[leftResourceType] = 0;
               }
               if(!this.preResourceTypeNumDic.hasOwnProperty(rightResourceType))
               {
                  this.preResourceTypeNumDic[rightResourceType] = 0;
               }
               this.checkResult = this.preResourceTypeNumDic[leftResourceType] + this.preResourceTypeNumDic[rightResourceType];
               this.ruleMsg = "请计算下面<font color= \'#FF0000\'>" + leftResourceName + "</font>的数量+<font color= \'#FF0000\'>" + rightResourceName + "</font>的数量之和，填入下面输入框内";
               break;
            case TDReadInputVerify.METHOD_TYPE_101:
               list = this.getShowElementLeftRightData();
               leftResourceType = int(list[0]);
               rightResourceType = int(list[1]);
               leftResourceName = list[2];
               rightResourceName = list[3];
               if(!this.preResourceTypeNumDic.hasOwnProperty(leftResourceType))
               {
                  this.preResourceTypeNumDic[leftResourceType] = 0;
               }
               if(!this.dynamicResourceTypeNumDic.hasOwnProperty(rightResourceType))
               {
                  this.dynamicResourceTypeNumDic[rightResourceType] = 0;
               }
               this.checkResult = this.preResourceTypeNumDic[leftResourceType] + this.dynamicResourceTypeNumDic[rightResourceType];
               this.ruleMsg = "请计算下面<font color= \'#FF0000\'>" + leftResourceName + "</font>的数量+运动状态<font color= \'#FF0000\'>" + rightResourceName + "</font>的数量之和，填入下面输入框内";
               break;
            case TDReadInputVerify.METHOD_TYPE_102:
               list = this.getShowElementLeftRightData();
               leftResourceType = int(list[0]);
               rightResourceType = int(list[1]);
               leftResourceName = list[2];
               rightResourceName = list[3];
               if(!this.preResourceTypeNumDic.hasOwnProperty(leftResourceType))
               {
                  this.preResourceTypeNumDic[leftResourceType] = 0;
               }
               if(!this.staticResourceTypeNumDic.hasOwnProperty(rightResourceType))
               {
                  this.staticResourceTypeNumDic[rightResourceType] = 0;
               }
               this.checkResult = this.preResourceTypeNumDic[leftResourceType] + this.staticResourceTypeNumDic[rightResourceType];
               this.ruleMsg = "请计算下面<font color= \'#FF0000\'>" + leftResourceName + "</font>的数量+静止状态<font color= \'#FF0000\'>" + rightResourceName + "</font>的数量之和，填入下面输入框内";
               break;
            case TDReadInputVerify.METHOD_TYPE_103:
               list = this.getShowElementLeftRightData();
               leftResourceType = int(list[0]);
               rightResourceType = int(list[1]);
               leftResourceName = list[2];
               rightResourceName = list[3];
               if(!this.dynamicResourceTypeNumDic.hasOwnProperty(leftResourceType))
               {
                  this.dynamicResourceTypeNumDic[leftResourceType] = 0;
               }
               if(!this.dynamicResourceTypeNumDic.hasOwnProperty(rightResourceType))
               {
                  this.dynamicResourceTypeNumDic[rightResourceType] = 0;
               }
               this.checkResult = this.dynamicResourceTypeNumDic[leftResourceType] + this.dynamicResourceTypeNumDic[rightResourceType];
               this.ruleMsg = "请计算下面运动状态<font color= \'#FF0000\'>" + leftResourceName + "</font>的数量+运动状态<font color= \'#FF0000\'>" + rightResourceName + "</font>的数量之和，填入下面输入框内";
               break;
            case TDReadInputVerify.METHOD_TYPE_104:
               list = this.getShowElementLeftRightData();
               leftResourceType = int(list[0]);
               rightResourceType = int(list[1]);
               leftResourceName = list[2];
               rightResourceName = list[3];
               if(!this.dynamicResourceTypeNumDic.hasOwnProperty(leftResourceType))
               {
                  this.dynamicResourceTypeNumDic[leftResourceType] = 0;
               }
               if(!this.staticResourceTypeNumDic.hasOwnProperty(rightResourceType))
               {
                  this.staticResourceTypeNumDic[rightResourceType] = 0;
               }
               this.checkResult = this.dynamicResourceTypeNumDic[leftResourceType] + this.staticResourceTypeNumDic[rightResourceType];
               this.ruleMsg = "请计算下面运动状态<font color= \'#FF0000\'>" + leftResourceName + "</font>的数量+静止状态<font color= \'#FF0000\'>" + rightResourceName + "</font>的数量之和，填入下面输入框内";
               break;
            case TDReadInputVerify.METHOD_TYPE_105:
               list = this.getShowElementLeftRightData();
               leftResourceType = int(list[0]);
               rightResourceType = int(list[1]);
               leftResourceName = list[2];
               rightResourceName = list[3];
               if(!this.staticResourceTypeNumDic.hasOwnProperty(leftResourceType))
               {
                  this.staticResourceTypeNumDic[leftResourceType] = 0;
               }
               if(!this.dynamicResourceTypeNumDic.hasOwnProperty(rightResourceType))
               {
                  this.dynamicResourceTypeNumDic[rightResourceType] = 0;
               }
               this.checkResult = this.staticResourceTypeNumDic[leftResourceType] + this.dynamicResourceTypeNumDic[rightResourceType];
               this.ruleMsg = "请计算下面静止状态<font color= \'#FF0000\'>" + leftResourceName + "</font>的数量+运动状态<font color= \'#FF0000\'>" + rightResourceName + "</font>的数量之和，填入下面输入框内";
               break;
            case TDReadInputVerify.METHOD_TYPE_106:
               list = this.getShowElementLeftRightData();
               leftResourceType = int(list[0]);
               rightResourceType = int(list[1]);
               leftResourceName = list[2];
               rightResourceName = list[3];
               if(!this.staticResourceTypeNumDic.hasOwnProperty(leftResourceType))
               {
                  this.staticResourceTypeNumDic[leftResourceType] = 0;
               }
               if(!this.staticResourceTypeNumDic.hasOwnProperty(rightResourceType))
               {
                  this.staticResourceTypeNumDic[rightResourceType] = 0;
               }
               this.checkResult = this.staticResourceTypeNumDic[leftResourceType] + this.staticResourceTypeNumDic[rightResourceType];
               this.ruleMsg = "请计算下面静止状态<font color= \'#FF0000\'>" + leftResourceName + "</font>的数量+静止状态<font color= \'#FF0000\'>" + rightResourceName + "</font>的数量之和，填入下面输入框内";
               break;
            case TDReadInputVerify.METHOD_TYPE_200:
               list = this.getShowTypeMaxNumData();
               leftResourceType = int(list[0]);
               leftResourceName = list[1];
               list = this.getShowRandomTypeExcludeTypeData(leftResourceType);
               rightResourceType = int(list[0]);
               rightResourceName = list[1];
               if(!this.preResourceTypeNumDic.hasOwnProperty(leftResourceType))
               {
                  this.preResourceTypeNumDic[leftResourceType] = 0;
               }
               if(!this.preResourceTypeNumDic.hasOwnProperty(rightResourceType))
               {
                  this.preResourceTypeNumDic[rightResourceType] = 0;
               }
               this.checkResult = this.preResourceTypeNumDic[leftResourceType] + this.preResourceTypeNumDic[rightResourceType];
               this.ruleMsg = "请计算下面出现同类<font color= \'#FF0000\'>最多</font>的动物个数+<font color= \'#FF0000\'>" + rightResourceName + "</font>的数量之和，填入下面输入框内";
               break;
            case TDReadInputVerify.METHOD_TYPE_201:
               list = this.getShowTypeMaxNumData();
               leftResourceType = int(list[0]);
               leftResourceName = list[1];
               list = this.getShowRandomTypeExcludeTypeData(leftResourceType);
               rightResourceType = int(list[0]);
               rightResourceName = list[1];
               if(!this.preResourceTypeNumDic.hasOwnProperty(leftResourceType))
               {
                  this.preResourceTypeNumDic[leftResourceType] = 0;
               }
               if(!this.dynamicResourceTypeNumDic.hasOwnProperty(rightResourceType))
               {
                  this.dynamicResourceTypeNumDic[rightResourceType] = 0;
               }
               this.checkResult = this.preResourceTypeNumDic[leftResourceType] + this.dynamicResourceTypeNumDic[rightResourceType];
               this.ruleMsg = "请计算下面出现同类<font color= \'#FF0000\'>最多</font>的动物个数+运动状态<font color= \'#FF0000\'>" + rightResourceName + "</font>的数量之和，填入下面输入框内";
               break;
            case TDReadInputVerify.METHOD_TYPE_202:
               list = this.getShowTypeMaxNumData();
               leftResourceType = int(list[0]);
               leftResourceName = list[1];
               list = this.getShowRandomTypeExcludeTypeData(leftResourceType);
               rightResourceType = int(list[0]);
               rightResourceName = list[1];
               if(!this.preResourceTypeNumDic.hasOwnProperty(leftResourceType))
               {
                  this.preResourceTypeNumDic[leftResourceType] = 0;
               }
               if(!this.staticResourceTypeNumDic.hasOwnProperty(rightResourceType))
               {
                  this.staticResourceTypeNumDic[rightResourceType] = 0;
               }
               this.checkResult = this.preResourceTypeNumDic[leftResourceType] + this.staticResourceTypeNumDic[rightResourceType];
               this.ruleMsg = "请计算下面出现同类<font color= \'#FF0000\'>最多</font>的动物个数+静止状态<font color= \'#FF0000\'>" + rightResourceName + "</font>的数量之和，填入下面输入框内";
               break;
            case TDReadInputVerify.METHOD_TYPE_300:
               dynamicTotalNum = 0;
               for(key in this.dynamicResourceTypeNumDic)
               {
                  dynamicTotalNum += this.dynamicResourceTypeNumDic[key];
               }
               list = this.getShowRandomTypeData();
               rightResourceType = int(list[0]);
               rightResourceName = list[1];
               if(!this.preResourceTypeNumDic.hasOwnProperty(rightResourceType))
               {
                  this.preResourceTypeNumDic[rightResourceType] = 0;
               }
               this.checkResult = dynamicTotalNum + this.preResourceTypeNumDic[rightResourceType];
               this.ruleMsg = "请计算下面<font color= \'#FF0000\'>运动</font>的所有动物个数+<font color= \'#FF0000\'>" + rightResourceName + "</font>的数量之和，填入下面输入框内";
               break;
            case TDReadInputVerify.METHOD_TYPE_301:
               staticTotalNum = 0;
               for(key in this.staticResourceTypeNumDic)
               {
                  staticTotalNum += this.staticResourceTypeNumDic[key];
               }
               list = this.getShowRandomTypeData();
               rightResourceType = int(list[0]);
               rightResourceName = list[1];
               if(!this.preResourceTypeNumDic.hasOwnProperty(rightResourceType))
               {
                  this.preResourceTypeNumDic[rightResourceType] = 0;
               }
               this.checkResult = staticTotalNum + this.preResourceTypeNumDic[rightResourceType];
               this.ruleMsg = "请计算下面<font color= \'#FF0000\'>静止</font>的所有动物个数+<font color= \'#FF0000\'>" + rightResourceName + "</font>的数量之和，填入下面输入框内";
               break;
            case TDReadInputVerify.METHOD_TYPE_400:
               typeNum = 0;
               for(key in this.preResourceTypeNumDic)
               {
                  typeNum += 1;
               }
               list = this.getShowRandomTypeData();
               rightResourceType = int(list[0]);
               rightResourceName = list[1];
               if(!this.preResourceTypeNumDic.hasOwnProperty(rightResourceType))
               {
                  this.preResourceTypeNumDic[rightResourceType] = 0;
               }
               this.checkResult = typeNum + this.preResourceTypeNumDic[rightResourceType];
               this.ruleMsg = "请计算下面出现动物<font color= \'#FF0000\'>种类</font>数+<font color= \'#FF0000\'>" + rightResourceName + "</font>的数量之和，填入下面输入框内";
               break;
            case TDReadInputVerify.METHOD_TYPE_401:
               typeNum = 0;
               for(key in this.preResourceTypeNumDic)
               {
                  typeNum += 1;
               }
               list = this.getShowRandomTypeData();
               rightResourceType = int(list[0]);
               rightResourceName = list[1];
               if(!this.dynamicResourceTypeNumDic.hasOwnProperty(rightResourceType))
               {
                  this.dynamicResourceTypeNumDic[rightResourceType] = 0;
               }
               this.checkResult = typeNum + this.dynamicResourceTypeNumDic[rightResourceType];
               this.ruleMsg = "请计算下面出现动物<font color= \'#FF0000\'>种类</font>数+运动状态<font color= \'#FF0000\'>" + rightResourceName + "</font>的数量之和，填入下面输入框内";
               break;
            case TDReadInputVerify.METHOD_TYPE_402:
               typeNum = 0;
               for(key in this.preResourceTypeNumDic)
               {
                  typeNum += 1;
               }
               list = this.getShowRandomTypeData();
               rightResourceType = int(list[0]);
               rightResourceName = list[1];
               if(!this.staticResourceTypeNumDic.hasOwnProperty(rightResourceType))
               {
                  this.staticResourceTypeNumDic[rightResourceType] = 0;
               }
               this.checkResult = typeNum + this.staticResourceTypeNumDic[rightResourceType];
               this.ruleMsg = "请计算下面出现动物<font color= \'#FF0000\'>种类</font>数+静止状态<font color= \'#FF0000\'>" + rightResourceName + "</font>的数量之和，填入下面输入框内";
         }
      }
      
      private function updateContent() : void
      {
         var args:Array = null;
         var rand:int = 0;
         if(this.isRand)
         {
            this.methodID = this.tdMethod.getRandMethodID();
         }
         else
         {
            this.methodID = this.tdMethod.getMethodList()[this.currentMethodID];
         }
         var minTypeNum:int = this.MIN_TYPE_NUM;
         if(this.methodID == TDReadInputVerify.METHOD_TYPE_400 || this.methodID == TDReadInputVerify.METHOD_TYPE_401 || this.methodID == TDReadInputVerify.METHOD_TYPE_402)
         {
            args = [2,3,4,5];
            rand = Math.random() * args.length;
            minTypeNum = int(args[rand]);
         }
         var otherRandom:Boolean = false;
         this.dynamicResourceTypeNumDic = new Dictionary();
         this.staticResourceTypeNumDic = new Dictionary();
         this.resourceInsDic = new Dictionary();
         this.preResourceTypes = this.getPreResourceTypes(minTypeNum,otherRandom);
         this.preResourceTypeNumDic = this.getPreResourceTypeNumDic(this.preResourceTypes);
         this.preResourceIds = this.getPreResourceIds(this.preResourceTypes);
         this.showBlendMode(this.preResourceIds);
         this.calculateResult();
         this.ruleTxt.htmlText = this.ruleMsg;
         this.effectMc.gotoAndPlay(1);
      }
      
      private function checkTimeEnd() : Boolean
      {
         var currSeconds:Number = a_1767.getInstance().TimeSeconds;
         var tm:int = this.verifyData.m_iTimeStamp - currSeconds;
         if(tm <= 0)
         {
            return true;
         }
         return false;
      }
      
      private function onRspChangeNumHandler(e:a_1778) : void
      {
         this.verifyData = a_2439.getInstance().GetVerifyInGame();
         if(!this.isRand)
         {
            if(this.currentMethodID < this.tdMethod.getMethodList().length - 1)
            {
               ++this.currentMethodID;
            }
            else
            {
               this.currentMethodID = 0;
            }
         }
         this.removeNodeChilds();
         this.updateContent();
      }
      
      private function onChangeHandler(evt:MouseEvent) : void
      {
         var tm:Number = NaN;
         if(this.checkTimeEnd())
         {
            MessageTipHandler.Get().a_3146(GameStringManager.getInstance().getString(24740));
            return;
         }
         if(this.errorCnt >= this.maxErrorCnt)
         {
            MessageTipHandler.Get().a_3146("验证次数已用完");
            return;
         }
         this.isRand = true;
         var disTm:Number = a_1767.getInstance().TimeMs - this.lastTmChangeNum;
         if(this.lastTmChangeNum > 0 && disTm <= this.CD_TM)
         {
            tm = Math.ceil((this.CD_TM - disTm) / 1000);
            MessageTipHandler.Get().a_3146(tm + " 秒后操作");
            return;
         }
         if(this.changeNewCnt >= this.maxChangeNewCnt)
         {
            MessageTipHandler.Get().a_3146("刷新次数已用完");
            return;
         }
         this.changeNewCnt += 1;
         if(this.changeNewCnt == this.maxChangeNewCnt)
         {
            MessageTipHandler.Get().a_3146("刷新次数已用完");
         }
         else
         {
            MessageTipHandler.Get().a_3146("刷新次数还剩" + (this.maxChangeNewCnt - this.changeNewCnt) + "次");
         }
         this.m_iOpt = 1;
         this.lastTmChangeNum = a_1767.getInstance().TimeMs;
         a_2333.getInstance().onRequestVerifyInGameResult(this.role.m_iRoleUin,this.m_iOpt,this.verifyData.m_iNum);
      }
      
      private function onSureHandler(evt:MouseEvent) : void
      {
         var disTm:Number = NaN;
         var tm:Number = NaN;
         if(this.checkTimeEnd())
         {
            MessageTipHandler.Get().a_3146(GameStringManager.getInstance().getString(24740));
            return;
         }
         if(this.errorCnt >= this.maxErrorCnt)
         {
            MessageTipHandler.Get().a_3146("验证次数已用完");
            return;
         }
         if(this.inputTxt.text == "")
         {
            MessageTipHandler.Get().a_3146("输入框内不能为空！");
            return;
         }
         var result:int = int(this.inputTxt.text);
         if(this.checkResult == result)
         {
            disTm = a_1767.getInstance().TimeMs - this.lastTmSend;
            if(this.lastTmSend > 0 && disTm <= this.CD_TM)
            {
               tm = Math.ceil((this.CD_TM - disTm) / 1000);
               MessageTipHandler.Get().a_3146(tm + " 秒后操作");
               return;
            }
            this.m_iOpt = 0;
            this.lastTmSend = a_1767.getInstance().TimeMs;
            a_2333.getInstance().onRequestVerifyInGameResult(this.role.m_iRoleUin,this.m_iOpt,this.verifyData.m_iNum);
         }
         else
         {
            this.errorCnt += 1;
            if(this.errorCnt >= this.maxErrorCnt)
            {
               this.m_iOpt = 0;
               a_2333.getInstance().onRequestVerifyInGameResult(this.role.m_iRoleUin,this.m_iOpt,0);
            }
            else
            {
               this.m_iOpt = 1;
               this.lastTmChangeNum = a_1767.getInstance().TimeMs;
               a_2333.getInstance().onRequestVerifyInGameResult(this.role.m_iRoleUin,this.m_iOpt,this.verifyData.m_iNum);
            }
            MessageTipHandler.Get().a_3146(GameStringManager.getInstance().getString(132458));
         }
      }
      
      private function doEnterEvent(bool:Boolean) : void
      {
         if(bool)
         {
            if(!this.hasEventListener(Event.ENTER_FRAME))
            {
               this.frameCounter = 0;
               this.addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
            }
         }
         else if(this.hasEventListener(Event.ENTER_FRAME))
         {
            this.frameCounter = 0;
            this.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         }
      }
      
      private function onEnterFrame(evt:Event) : void
      {
         var mc:IVerifyAni = null;
         var i:int = 0;
         ++this.frameCounter;
         if(this.frameCounter >= this.speed)
         {
            this.frameCounter = 0;
            for(i = 0; i < this.nodeContentAry.length; i++)
            {
               mc = this.nodeContentAry[i];
               mc.enterFrame();
            }
         }
      }
      
      private function showBlendMode(resourceIds:Array) : void
      {
         var resourceType:int = 0;
         var node:Sprite = null;
         var resourceID:int = 0;
         var mc:IVerifyAni = null;
         var flag:int = 0;
         var frame:int = 0;
         for(var i:int = 0; i < this.NODE_CNT; i++)
         {
            resourceID = int(resourceIds[i]);
            mc = this.tdFactory.getAnimationResource(resourceID);
            resourceType = mc.getType();
            this.nodeContentAry[i] = mc;
            node = this.nodeAry[i];
            node.addChild(mc as DisplayObject);
            flag = Math.random() * 2;
            if(flag == 0)
            {
               mc.setRandStopFrame();
               if(!this.staticResourceTypeNumDic.hasOwnProperty(resourceType))
               {
                  this.staticResourceTypeNumDic[resourceType] = 0;
               }
               this.staticResourceTypeNumDic[resourceType] += 1;
            }
            else
            {
               if(!this.dynamicResourceTypeNumDic.hasOwnProperty(resourceType))
               {
                  this.dynamicResourceTypeNumDic[resourceType] = 0;
               }
               this.dynamicResourceTypeNumDic[resourceType] += 1;
               frame = 1;
               if(!this.resourceInsDic.hasOwnProperty(resourceID))
               {
                  this.resourceInsDic[resourceID] = 0;
               }
               frame = int(this.resourceInsDic[resourceID]);
               frame += 1;
               mc.setStopFrame(frame);
               this.resourceInsDic[resourceID] = frame;
               mc.setPlayState();
            }
         }
         this.doEnterEvent(true);
      }
      
      private function getPreResourceTypeNumDic(ary:Array) : Dictionary
      {
         var type:int = 0;
         var dic:Dictionary = new Dictionary();
         for(var i:int = 0; i < ary.length; i++)
         {
            type = int(ary[i]);
            if(!dic.hasOwnProperty(type))
            {
               dic[type] = 0;
            }
            dic[type] += 1;
         }
         return dic;
      }
      
      private function getPreResourceTypes(minTypeNum:int, otherRandom:Boolean) : Array
      {
         var random:int = 0;
         var resourceType:int = 0;
         var cacheList:Array = null;
         var tempList:Array = [TYPE_SNAKE,TYPE_TIGER,TYPE_HORSE,TYPE_DOG,TYPE_PIG,TYPE_CHICKEN];
         var copyList:Array = tempList.concat(tempList);
         var resTypes:Array = [];
         var len:int = 0;
         if(otherRandom)
         {
            while(len < this.NODE_CNT)
            {
               if(len < minTypeNum)
               {
                  random = Math.random() * copyList.length;
                  resourceType = int(copyList[random]);
                  copyList.splice(random,1);
                  if(resTypes.indexOf(resourceType) == -1)
                  {
                     resTypes.push(resourceType);
                     len = int(resTypes.length);
                  }
               }
               else
               {
                  random = Math.random() * tempList.length;
                  resourceType = int(tempList[random]);
                  resTypes.push(resourceType);
                  len = int(resTypes.length);
               }
            }
         }
         else
         {
            cacheList = [];
            while(len < this.NODE_CNT)
            {
               if(len < minTypeNum)
               {
                  random = Math.random() * copyList.length;
                  resourceType = int(copyList[random]);
                  cacheList.push(resourceType);
                  copyList.splice(random,1);
                  if(resTypes.indexOf(resourceType) == -1)
                  {
                     resTypes.push(resourceType);
                     len = int(resTypes.length);
                  }
               }
               else
               {
                  random = Math.random() * cacheList.length;
                  resourceType = int(cacheList[random]);
                  resTypes.push(resourceType);
                  len = int(resTypes.length);
               }
            }
         }
         return resTypes;
      }
      
      private function getPreResourceIds(types:Array) : Array
      {
         var ids:Array = [];
         var type:int = 0;
         var random:int = 0;
         var resourceID:int = 0;
         for(var i:int = 0; i < types.length; i++)
         {
            type = int(types[i]);
            resourceID = this.tdFactory.getResourceId(type);
            ids.push(resourceID);
         }
         return ids;
      }
      
      private function removeNodeChilds() : void
      {
         var node:Sprite = null;
         for(var i:int = 0; i < this.nodeContentAry.length; i++)
         {
            node = this.nodeContentAry[i];
            node.parent.removeChild(node);
         }
      }
      
      private function getAnimationName(type:int) : String
      {
         return this.RESOURCE_NAME_LIST[type];
      }
      
      private function getLogMsg() : String
      {
         var key:String = null;
         var msg:String = "事件编号:" + this.methodID;
         msg += "\n计算结果：" + this.checkResult;
         for(key in this.preResourceTypeNumDic)
         {
            if(msg != "")
            {
               msg += "\n";
            }
            msg += "【" + key + "】" + this.getAnimationName(int(key)) + " 数量:" + this.preResourceTypeNumDic[key];
         }
         return msg;
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
            this.cutdownTxt.text = temp.join("");
         }
         else
         {
            this.cutdownTxt.text = "超时";
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
   }
}

