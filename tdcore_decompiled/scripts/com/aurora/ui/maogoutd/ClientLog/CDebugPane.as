package com.aurora.ui.maogoutd.ClientLog
{
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.GlowFilter;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class CDebugPane extends Sprite
   {
      
      private static var a_921:CDebugPane;
      
      private var _tf:TextField;
      
      private var _textFormat:TextFormat;
      
      public function CDebugPane()
      {
         super();
         this.addEventListener(Event.ADDED_TO_STAGE,this.onAdded);
         this.visible = false;
         this.mouseChildren = false;
         this.mouseEnabled = false;
      }
      
      public static function Get() : CDebugPane
      {
         if(!a_921)
         {
            a_921 = new CDebugPane();
         }
         return a_921;
      }
      
      private function onAdded(e:Event) : void
      {
         this.removeEventListener(Event.ADDED_TO_STAGE,this.onAdded);
         this.a_3014();
      }
      
      private function a_3014() : void
      {
         this._textFormat = new TextFormat("Arial",14,16777113);
         this._textFormat.bold = true;
         this._textFormat.leading = 48;
         this._tf = new TextField();
         this._tf.defaultTextFormat = this._textFormat;
         this._tf.width = 183;
         this._tf.height = 454;
         this._tf.multiline = true;
         this._tf.wordWrap = true;
         this._tf.selectable = true;
         this._tf.text = "";
         this._tf.x = 0;
         this._tf.y = 30;
         this._tf.filters = [new GlowFilter(0,1,2,2,10)];
         addChild(this._tf);
      }
      
      public function OnLog(msg:String, type:int = 0) : void
      {
         if(!this._tf)
         {
            return;
         }
         var lineBreak:String = "\n";
         if(type == 0)
         {
            this._tf.text = "";
            lineBreak = "";
         }
         this._tf.appendText(lineBreak + msg);
      }
   }
}

