package com.aurora.ui.maogoutd.diy.myEditor.view.element
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   
   public class TipsElement extends MovieClip
   {
      
      public var m_ContentText:TextField;
      
      public var m_BGSp:Sprite;
      
      public function TipsElement()
      {
         super();
         this.m_ContentText.multiline = true;
         this.m_ContentText.wordWrap = false;
         this.m_ContentText.autoSize = TextFieldAutoSize.CENTER;
      }
      
      public function ShowTip(sContent:String) : void
      {
         this.m_ContentText.htmlText = sContent;
         this.m_ContentText.height = this.m_ContentText.textHeight + 5;
         this.m_BGSp.width = this.m_ContentText.width + 15;
         this.m_BGSp.height = this.m_ContentText.height + 10;
         this.m_ContentText.x = (this.m_BGSp.width - this.m_ContentText.width) / 2;
         this.m_ContentText.y = (this.m_BGSp.height - this.m_ContentText.height) / 2;
      }
   }
}

