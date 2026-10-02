package com.aurora.ui.maogoutd.component.dialog
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.GlowFilter;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   
   public class BuySureTipContent extends AbstractContent
   {
      
      public var m_CostTxt1:TextField;
      
      public var m_CostTxt2:TextField;
      
      public var m_DesTxt:TextField;
      
      public var m_stNoTipsMc:MovieClip;
      
      public var sureBtn:SimpleButton;
      
      public function BuySureTipContent()
      {
         super();
         this.init();
      }
      
      public static function getTextFilter() : GlowFilter
      {
         var color:Number = 537436;
         var alpha:Number = 1;
         var blurX:Number = 4;
         var blurY:Number = 4;
         var strength:Number = 18;
         var inner:Boolean = false;
         var knockout:Boolean = false;
         var quality:Number = BitmapFilterQuality.LOW;
         return new GlowFilter(color,alpha,blurX,blurY,strength,quality,inner,knockout);
      }
      
      override public function getSize() : Object
      {
         return {
            "w":286,
            "h":99
         };
      }
      
      public function setContent(msg1:String, msg2:String, msg3:String) : void
      {
         this.m_CostTxt1.filters = this.m_CostTxt2.filters = this.m_DesTxt.filters = [getTextFilter()];
         this.mouseEnabled = this.mouseChildren = false;
         this.m_CostTxt1.htmlText = msg1;
         this.m_CostTxt2.htmlText = msg2;
         this.m_DesTxt.htmlText = msg3;
      }
      
      private function init() : void
      {
         this.m_CostTxt1.text = "";
         this.m_CostTxt2.text = "";
         this.m_DesTxt.text = "";
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

