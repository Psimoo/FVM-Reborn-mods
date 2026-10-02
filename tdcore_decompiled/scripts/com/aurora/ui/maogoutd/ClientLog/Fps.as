package com.aurora.ui.maogoutd.ClientLog
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import flash.system.System;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.utils.getTimer;
   
   public class Fps extends Sprite
   {
      
      private static const diagramHeight:uint = 40;
      
      private static const diagramWidth:uint = 60;
      
      private static const maxMemory:uint = 500000000;
      
      private var fps:TextField;
      
      private var mem:TextField;
      
      private var instance:Fps;
      
      private var bitmapdata:BitmapData;
      
      private var i:int = 0;
      
      private var n:int = 10;
      
      private var diagramTimer:int;
      
      private var tfTimer:int;
      
      private var skins:int = -1;
      
      private var skinsChanged:int = 0;
      
      public function Fps()
      {
         super();
         this.addEventListener(Event.ADDED_TO_STAGE,this.init);
      }
      
      public function init(e:Event) : void
      {
         var bitmap:Bitmap = null;
         bitmap = null;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.fps = new TextField();
         this.mem = new TextField();
         if(this.instance == null)
         {
            this.fps.defaultTextFormat = new TextFormat("Tahoma",10,16711680);
            this.fps.autoSize = TextFieldAutoSize.LEFT;
            this.fps.text = "FPS:" + Number(stage.frameRate).toFixed(2);
            this.fps.x = -diagramWidth - 2;
            addChild(this.fps);
            this.mem.defaultTextFormat = new TextFormat("Tahoma",10,65280);
            this.mem.autoSize = TextFieldAutoSize.LEFT;
            this.mem.text = "MEM:" + this.byteToString(System.totalMemory);
            this.mem.x = -diagramWidth - 2;
            this.mem.y = this.fps.y + 10;
            addChild(this.mem);
            this.bitmapdata = new BitmapData(diagramWidth,diagramHeight,true,255);
            bitmap = new Bitmap(this.bitmapdata);
            bitmap.y = 24;
            bitmap.x = -diagramWidth;
            addChildAt(bitmap,0);
            addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
            this.diagramTimer = getTimer();
            this.tfTimer = getTimer();
         }
      }
      
      private function onEnterFrame(e:Event) : void
      {
         ++this.i;
         if(this.i >= this.n)
         {
            this.i = 0;
            this.fps.text = "FPS: " + Number(1000 * this.n / (getTimer() - this.tfTimer)).toFixed(2);
            this.tfTimer = getTimer();
         }
         if(stage == null)
         {
            return;
         }
         var _loc_2:* = 1000 / (getTimer() - this.diagramTimer);
         var _loc_3:* = _loc_2 > stage.frameRate ? 1 : _loc_2 / stage.frameRate;
         this.diagramTimer = getTimer();
         this.bitmapdata.scroll(1,0);
         this.bitmapdata.fillRect(new Rectangle(0,0,1,this.bitmapdata.height),2852126720);
         this.bitmapdata.setPixel32(0,diagramHeight * (1 - _loc_3),4294901760);
         this.mem.text = "MEM: " + this.byteToString(System.totalMemory);
         var ski:int = this.skins == 0 ? 0 : int(this.skinsChanged / this.skins);
         this.bitmapdata.setPixel32(0,diagramHeight * (1 - ski),4294967295);
         var meoryPer:Number = System.totalMemory / maxMemory;
         this.bitmapdata.setPixel32(0,diagramHeight * (1 - meoryPer),4278255360);
      }
      
      private function byteToString(byte:uint) : String
      {
         var byteStr:String = null;
         if(byte < 1024)
         {
            byteStr = String(byte) + "b";
         }
         else if(byte < 10240)
         {
            byteStr = Number(byte / 1024).toFixed(2) + "kb";
         }
         else if(byte < 102400)
         {
            byteStr = Number(byte / 1024).toFixed(1) + "kb";
         }
         else if(byte < 1048576)
         {
            byteStr = Math.round(byte / 1024) + "kb";
         }
         else if(byte < 10485760)
         {
            byteStr = Number(byte / 1048576).toFixed(2) + "mb";
         }
         else if(byte < 104857600)
         {
            byteStr = Number(byte / 1048576).toFixed(1) + "mb";
         }
         else
         {
            byteStr = Math.round(byte / 1048576) + "mb";
         }
         return byteStr;
      }
   }
}

