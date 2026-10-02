package com.aurora.ui.common.tips
{
   import com.aurora.utility.EffectsUtility;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   
   public class CommonTipsText extends TextField
   {
      
      public function CommonTipsText()
      {
         super();
         width = 550;
         height = 80;
         this.wordWrap = true;
         this.multiline = true;
         mouseEnabled = false;
         selectable = false;
         this.defaultTextFormat = GetMyFormat(16777215);
         this.filters = EffectsUtility.GetTextFilter();
      }
      
      public static function GetMyFormat(iColor:int, iSize:int = 18) : TextFormat
      {
         var stMyFormat:TextFormat = new TextFormat();
         stMyFormat.size = iSize;
         stMyFormat.bold = true;
         stMyFormat.align = TextFormatAlign.CENTER;
         stMyFormat.color = iColor;
         return stMyFormat;
      }
   }
}

