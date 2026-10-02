package a_4784
{
   import flash.display.InteractiveObject;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.ContextMenuEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.net.LocalConnection;
   import flash.system.System;
   import flash.ui.ContextMenu;
   import flash.ui.ContextMenuItem;
   import flash.utils.getTimer;
   
   public class SWFProfiler
   {
      
      private static var itvTime:int;
      
      private static var initTime:int;
      
      private static var currentTime:int;
      
      private static var frameCount:int;
      
      private static var totalCount:int;
      
      public static var minFps:Number;
      
      public static var maxFps:Number;
      
      public static var minMem:Number;
      
      public static var maxMem:Number;
      
      private static var frame:Sprite;
      
      private static var stage:Stage;
      
      private static var content:a_4645;
      
      private static var ci:ContextMenuItem;
      
      private static var cm:ContextMenu;
      
      public static var history:int = 60;
      
      public static var fpsList:Array = [];
      
      public static var memList:Array = [];
      
      private static var displayed:Boolean = false;
      
      private static var started:Boolean = false;
      
      private static var inited:Boolean = false;
      
      public function SWFProfiler()
      {
         super();
      }
      
      public static function init(swf:Stage, context:InteractiveObject) : void
      {
         if(inited)
         {
            return;
         }
         inited = true;
         stage = swf;
         content = new a_4645();
         frame = new Sprite();
         minFps = Number.MAX_VALUE;
         maxFps = Number.MIN_VALUE;
         minMem = Number.MAX_VALUE;
         maxMem = Number.MIN_VALUE;
         cm = new ContextMenu();
         cm.hideBuiltInItems();
         ci = new ContextMenuItem("Show Profiler",true);
         addEvent(ci,ContextMenuEvent.MENU_ITEM_SELECT,onSelect);
         cm.customItems = [ci];
         context.contextMenu = cm;
         start();
      }
      
      public static function a_4644(context:InteractiveObject) : void
      {
         context.contextMenu = cm;
      }
      
      public static function start() : void
      {
         if(started)
         {
            return;
         }
         started = true;
         initTime = itvTime = getTimer();
         totalCount = frameCount = 0;
         addEvent(frame,Event.ENTER_FRAME,draw);
      }
      
      public static function stop() : void
      {
         if(!started)
         {
            return;
         }
         started = false;
         removeEvent(frame,Event.ENTER_FRAME,draw);
      }
      
      public static function gc() : void
      {
         try
         {
            new LocalConnection().connect("foo");
            new LocalConnection().connect("foo");
         }
         catch(e:Error)
         {
         }
      }
      
      public static function get currentFps() : Number
      {
         return frameCount / intervalTime;
      }
      
      public static function get currentMem() : Number
      {
         return System.totalMemory / 1024 / 1000;
      }
      
      public static function get averageFps() : Number
      {
         return totalCount / runningTime;
      }
      
      private static function get runningTime() : Number
      {
         return (currentTime - initTime) / 1000;
      }
      
      private static function get intervalTime() : Number
      {
         return (currentTime - itvTime) / 1000;
      }
      
      private static function onSelect(e:ContextMenuEvent) : void
      {
         if(!displayed)
         {
            show();
         }
         else
         {
            hide();
         }
      }
      
      private static function show() : void
      {
         ci.caption = "Hide Profiler";
         displayed = true;
         addEvent(stage,Event.RESIZE,resize);
         stage.addChild(content);
         updateDisplay();
      }
      
      private static function hide() : void
      {
         ci.caption = "Show Profiler";
         displayed = false;
         removeEvent(stage,Event.RESIZE,resize);
         stage.removeChild(content);
      }
      
      private static function resize(e:Event) : void
      {
         content.update(runningTime,minFps,maxFps,minMem,maxMem,currentFps,currentMem,averageFps,fpsList,memList,history);
      }
      
      private static function draw(e:Event) : void
      {
         currentTime = getTimer();
         ++frameCount;
         ++totalCount;
         if(intervalTime >= 1)
         {
            if(displayed)
            {
               updateDisplay();
            }
            else
            {
               updateMinMax();
            }
            fpsList.unshift(currentFps);
            memList.unshift(currentMem);
            if(fpsList.length > history)
            {
               fpsList.pop();
            }
            if(memList.length > history)
            {
               memList.pop();
            }
            itvTime = currentTime;
            frameCount = 0;
         }
      }
      
      private static function updateDisplay() : void
      {
         updateMinMax();
         content.update(runningTime,minFps,maxFps,minMem,maxMem,currentFps,currentMem,averageFps,fpsList,memList,history);
      }
      
      private static function updateMinMax() : void
      {
         minFps = Math.min(currentFps,minFps);
         maxFps = Math.max(currentFps,maxFps);
         minMem = Math.min(currentMem,minMem);
         maxMem = Math.max(currentMem,maxMem);
      }
      
      private static function addEvent(item:EventDispatcher, type:String, listener:Function) : void
      {
         item.addEventListener(type,listener,false,0,true);
      }
      
      private static function removeEvent(item:EventDispatcher, type:String, listener:Function) : void
      {
         item.removeEventListener(type,listener);
      }
   }
}

import flash.display.*;
import flash.events.Event;
import flash.text.*;

class a_4645 extends Sprite
{
   
   private var minFpsTxtBx:TextField;
   
   private var maxFpsTxtBx:TextField;
   
   private var minMemTxtBx:TextField;
   
   private var maxMemTxtBx:TextField;
   
   private var infoTxtBx:TextField;
   
   private var box:Shape;
   
   private var fps:Shape;
   
   private var mb:Shape;
   
   public function a_4645()
   {
      var tf:TextFormat = null;
      super();
      this.fps = new Shape();
      this.mb = new Shape();
      this.box = new Shape();
      this.mouseChildren = false;
      this.mouseEnabled = false;
      this.fps.x = 65;
      this.fps.y = 45;
      this.mb.x = 65;
      this.mb.y = 90;
      tf = new TextFormat("_sans",9,11184810);
      this.infoTxtBx = new TextField();
      this.infoTxtBx.autoSize = TextFieldAutoSize.LEFT;
      this.infoTxtBx.defaultTextFormat = new TextFormat("_sans",11,13421772);
      this.infoTxtBx.y = 98;
      this.minFpsTxtBx = new TextField();
      this.minFpsTxtBx.autoSize = TextFieldAutoSize.LEFT;
      this.minFpsTxtBx.defaultTextFormat = tf;
      this.minFpsTxtBx.x = 7;
      this.minFpsTxtBx.y = 37;
      this.maxFpsTxtBx = new TextField();
      this.maxFpsTxtBx.autoSize = TextFieldAutoSize.LEFT;
      this.maxFpsTxtBx.defaultTextFormat = tf;
      this.maxFpsTxtBx.x = 7;
      this.maxFpsTxtBx.y = 5;
      this.minMemTxtBx = new TextField();
      this.minMemTxtBx.autoSize = TextFieldAutoSize.LEFT;
      this.minMemTxtBx.defaultTextFormat = tf;
      this.minMemTxtBx.x = 7;
      this.minMemTxtBx.y = 83;
      this.maxMemTxtBx = new TextField();
      this.maxMemTxtBx.autoSize = TextFieldAutoSize.LEFT;
      this.maxMemTxtBx.defaultTextFormat = tf;
      this.maxMemTxtBx.x = 7;
      this.maxMemTxtBx.y = 50;
      addChild(this.box);
      addChild(this.infoTxtBx);
      addChild(this.minFpsTxtBx);
      addChild(this.maxFpsTxtBx);
      addChild(this.minMemTxtBx);
      addChild(this.maxMemTxtBx);
      addChild(this.fps);
      addChild(this.mb);
      this.addEventListener(Event.ADDED_TO_STAGE,this.added,false,0,true);
      this.addEventListener(Event.REMOVED_FROM_STAGE,this.removed,false,0,true);
   }
   
   public function update(runningTime:Number, minFps:Number, maxFps:Number, minMem:Number, maxMem:Number, currentFps:Number, currentMem:Number, averageFps:Number, fpsList:Array, memList:Array, history:int) : void
   {
      var value:Number = NaN;
      if(runningTime >= 1)
      {
         this.minFpsTxtBx.text = minFps.toFixed(3) + " Fps";
         this.maxFpsTxtBx.text = maxFps.toFixed(3) + " Fps";
         this.minMemTxtBx.text = minMem.toFixed(3) + " Mb";
         this.maxMemTxtBx.text = maxMem.toFixed(3) + " Mb";
      }
      this.infoTxtBx.text = "Current Fps " + currentFps.toFixed(3) + "   |   Average Fps " + averageFps.toFixed(3) + "   |   Memory Used " + currentMem.toFixed(3) + " Mb";
      this.infoTxtBx.x = stage.stageWidth - this.infoTxtBx.width - 20;
      var vec:Graphics = this.fps.graphics;
      vec.clear();
      vec.lineStyle(1,3407616,0.7);
      var i:int = 0;
      var len:int = int(fpsList.length);
      var height:int = 35;
      var width:int = stage.stageWidth - 80;
      var inc:Number = width / (history - 1);
      var rateRange:Number = maxFps - minFps;
      for(i = 0; i < len; i++)
      {
         value = (fpsList[i] - minFps) / rateRange;
         if(i == 0)
         {
            vec.moveTo(0,-value * height);
         }
         else
         {
            vec.lineTo(i * inc,-value * height);
         }
      }
      vec = this.mb.graphics;
      vec.clear();
      vec.lineStyle(1,26367,0.7);
      i = 0;
      len = int(memList.length);
      rateRange = maxMem - minMem;
      for(i = 0; i < len; i++)
      {
         value = (memList[i] - minMem) / rateRange;
         if(i == 0)
         {
            vec.moveTo(0,-value * height);
         }
         else
         {
            vec.lineTo(i * inc,-value * height);
         }
      }
   }
   
   private function added(e:Event) : void
   {
      this.resize();
      stage.addEventListener(Event.RESIZE,this.resize,false,0,true);
   }
   
   private function removed(e:Event) : void
   {
      stage.removeEventListener(Event.RESIZE,this.resize);
   }
   
   private function resize(e:Event = null) : void
   {
      var vec:Graphics = this.box.graphics;
      vec.clear();
      vec.beginFill(0,0.5);
      vec.drawRect(0,0,stage.stageWidth,120);
      vec.lineStyle(1,16777215,0.2);
      vec.moveTo(65,45);
      vec.lineTo(65,10);
      vec.moveTo(65,45);
      vec.lineTo(stage.stageWidth - 15,45);
      vec.moveTo(65,90);
      vec.lineTo(65,55);
      vec.moveTo(65,90);
      vec.lineTo(stage.stageWidth - 15,90);
      vec.endFill();
      this.infoTxtBx.x = stage.stageWidth - this.infoTxtBx.width - 20;
   }
}
