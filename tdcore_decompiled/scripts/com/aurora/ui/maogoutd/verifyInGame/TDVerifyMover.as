package com.aurora.ui.maogoutd.verifyInGame
{
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   
   public class TDVerifyMover extends Sprite
   {
      
      private var maskShape:Sprite;
      
      private var numTxt:TextField;
      
      private var areaWidth:Number = 160;
      
      private var areaHeight:Number = 60;
      
      private var maskRadius:Number = 20;
      
      private var randomColorAry:Array;
      
      private var randomNumAry:Array;
      
      private var frame:int = 0;
      
      public function TDVerifyMover(colorAry:Array, numAry:Array)
      {
         super();
         this.randomColorAry = colorAry;
         this.randomNumAry = numAry;
         this.maskShape = new Sprite();
         this.addChild(this.maskShape);
         this.numTxt = new TextField();
         this.numTxt.width = 50;
         this.numTxt.height = 50;
         this.numTxt.selectable = false;
         this.numTxt.alpha = 0.05;
         var fmt:TextFormat = new TextFormat();
         fmt.size = 50;
         fmt.bold = true;
         fmt.font = "宋体";
         fmt.align = TextFormatAlign.CENTER;
         this.numTxt.defaultTextFormat = fmt;
         this.maskShape.addChild(this.numTxt);
         this.numTxt.x = -this.numTxt.width / 2;
         this.numTxt.y = -this.numTxt.height / 2;
         var random:int = int(Math.random() * colorAry.length);
         this.setMaskColor(random,0.004);
         this.maskShape.x = Math.random() * (this.areaWidth - 2 * this.maskRadius) + this.maskRadius;
         this.maskShape.y = Math.random() * (this.areaHeight - 2 * this.maskRadius) + this.maskRadius;
         this.addEventListener(Event.ADDED_TO_STAGE,this.onAddToStage);
      }
      
      private function setMaskColor(random:uint, alpha:Number = 0.3) : void
      {
         var color:uint = 0;
         var num:int = 0;
         if(Boolean(this.maskShape) && Boolean(this.numTxt))
         {
            color = uint(this.randomColorAry[random]);
            this.maskShape.graphics.clear();
            this.maskShape.graphics.beginFill(color,alpha);
            this.maskShape.graphics.drawCircle(0,0,this.maskRadius);
            this.maskShape.graphics.endFill();
            num = int(Math.random() * 10);
            this.numTxt.text = num.toString();
            this.numTxt.textColor = color;
         }
      }
      
      private function onAddToStage(evt:Event) : void
      {
         this.removeEventListener(Event.ADDED_TO_STAGE,this.onAddToStage);
         this.addEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
         this.addEventListener(Event.ENTER_FRAME,this.onMove);
      }
      
      private function onRemoveFromStage(evt:Event) : void
      {
         this.removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
         this.removeEventListener(Event.ENTER_FRAME,this.onMove);
      }
      
      private function onMove(e:Event) : void
      {
         var dy:Number = NaN;
         if(!this.maskShape)
         {
            return;
         }
         ++this.frame;
         if(this.frame < 4)
         {
            return;
         }
         this.frame = 0;
         var dx:Number = (Math.random() - 0.5) * 20;
         dy = (Math.random() - 0.5) * 20;
         this.maskShape.x += dx;
         this.maskShape.y += dy;
         var random:int = int(Math.random() * this.randomColorAry.length);
         this.setMaskColor(random,0.004);
         if(this.maskShape.x < this.maskRadius)
         {
            this.maskShape.x = this.maskRadius;
         }
         if(this.maskShape.x > this.areaWidth - this.maskRadius)
         {
            this.maskShape.x = this.areaWidth - this.maskRadius;
         }
         if(this.maskShape.y < this.maskRadius)
         {
            this.maskShape.y = this.maskRadius;
         }
         if(this.maskShape.y > this.areaHeight - this.maskRadius)
         {
            this.maskShape.y = this.areaHeight - this.maskRadius;
         }
      }
   }
}

