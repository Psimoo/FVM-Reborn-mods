package com.aurora.ui.maogoutd.diy.myChapter.view
{
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class NormalHintView extends Sprite
   {
      
      private static var m_stNormalHintView:NormalHintView;
      
      public static const STRING_FULL_DRAFT:String = "草稿箱已满，请及时清理草稿！";
      
      public static const STRING_SURE_MAP_NAME:String = "请确认 关卡名称 修改！";
      
      public static const STRING_SURE_MAP_DESC:String = "请确认 关卡介绍 修改！";
      
      public var closeBtn:SimpleButton;
      
      public var sureBtn:SimpleButton;
      
      public var hint:TextField;
      
      private var textFormat:TextFormat;
      
      public function NormalHintView()
      {
         super();
         this.textFormat = new TextFormat();
         this.textFormat.bold = true;
         this.textFormat.color = 12836333;
         this.textFormat.font = "宋体";
         this.textFormat.size = 17;
         addEventListener(MouseEvent.CLICK,this.OnClickHandler);
      }
      
      public static function Get(hintText:String) : NormalHintView
      {
         if(null == m_stNormalHintView)
         {
            m_stNormalHintView = new NormalHintView();
         }
         m_stNormalHintView.setHint(hintText);
         return m_stNormalHintView;
      }
      
      private function setHint(hintText:String) : void
      {
         this.hint.text = hintText;
         this.hint.setTextFormat(this.textFormat);
      }
      
      private function OnClickHandler(e:MouseEvent) : void
      {
         switch(e.target)
         {
            case this.closeBtn:
            case this.sureBtn:
               if(parent)
               {
                  parent.removeChild(this);
               }
         }
      }
   }
}

