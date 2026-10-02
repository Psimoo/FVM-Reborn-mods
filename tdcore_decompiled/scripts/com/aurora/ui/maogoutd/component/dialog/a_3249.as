package com.aurora.ui.maogoutd.component.dialog
{
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   
   public class a_3249 extends AbstractContent
   {
      
      private var tfView:TextField;
      
      private const CHAR_WIDTH:int = 10;
      
      public function a_3249()
      {
         super();
         this.init();
      }
      
      override public function getSize() : Object
      {
         var h:int = 0;
         if(this.tfView != null)
         {
            h = this.tfView.height;
         }
         if(h < _minHeight)
         {
            h = _minHeight;
         }
         return {
            "w":AbstractContent.a_940,
            "h":h
         };
      }
      
      public function setContent(msg:String) : void
      {
         var lastLineChars:int = 0;
         if(this.tfView != null)
         {
            this.tfView.text = "";
            if(this.tfView.parent == this)
            {
               this.removeChild(this.tfView);
            }
            this.tfView = null;
         }
         this.tfView = this.createTextField();
         this.tfView.htmlText = msg;
         this.formatText(this.tfView);
         if(this.tfView.numLines > 1)
         {
            lastLineChars = this.tfView.getLineLength(this.tfView.numLines - 1);
            if(lastLineChars < 4)
            {
               if(this.tfView.numLines == 2)
               {
                  this.tfView.multiline = false;
                  this.tfView.wordWrap = false;
                  this.tfView.width = 10;
                  this.tfView.autoSize = TextFieldAutoSize.LEFT;
               }
               else
               {
                  this.tfView.width = AbstractContent.a_940 + this.CHAR_WIDTH * lastLineChars;
                  this.tfView.x = -this.CHAR_WIDTH * lastLineChars / 2;
               }
            }
         }
         if(this.tfView.height < _minHeight)
         {
            this.tfView.y = int((_minHeight - this.tfView.height) / 2);
         }
         else
         {
            this.tfView.y = 0;
         }
      }
      
      private function init() : void
      {
      }
      
      private function createTextField() : TextField
      {
         var tf:TextField = null;
         tf = new TextField();
         tf.width = AbstractContent.a_940;
         tf.height = _minHeight;
         tf.autoSize = TextFieldAutoSize.CENTER;
         tf.multiline = true;
         tf.wordWrap = true;
         tf.x = 0;
         addChild(tf);
         this.setTFFilter(tf);
         return tf;
      }
      
      private function setTFFilter(tf:TextField) : void
      {
         tf.filters = [Dialog.getTextFilter()];
      }
      
      private function formatText(tf:TextField) : void
      {
         var fmt:TextFormat = new TextFormat();
         fmt.size = 14;
         fmt.color = 16252671;
         fmt.leading = 2;
         fmt.letterSpacing = 1;
         fmt.bold = true;
         fmt.font = "宋 体";
         if(tf.numLines == 1)
         {
            fmt.align = TextFormatAlign.CENTER;
         }
         else
         {
            fmt.align = TextFormatAlign.LEFT;
         }
         tf.setTextFormat(fmt);
      }
   }
}

