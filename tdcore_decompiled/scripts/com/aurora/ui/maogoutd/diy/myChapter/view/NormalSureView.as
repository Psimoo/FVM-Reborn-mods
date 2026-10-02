package com.aurora.ui.maogoutd.diy.myChapter.view
{
   import com.aurora.ui.maogoutd.diy.DiyHandler;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class NormalSureView extends Sprite
   {
      
      private static var m_stNormalSureView:NormalSureView;
      
      public var closeBtn:SimpleButton;
      
      public var sureBtn:SimpleButton;
      
      public var cancelBtn:SimpleButton;
      
      public var hint:TextField;
      
      private var mapId:int;
      
      private var textFormat:TextFormat;
      
      public function NormalSureView()
      {
         super();
         this.textFormat = new TextFormat();
         this.textFormat.bold = true;
         this.textFormat.color = 12836333;
         this.textFormat.font = "宋体";
         this.textFormat.size = 17;
         addEventListener(MouseEvent.CLICK,this.OnClickHandler);
      }
      
      public static function Get(iMapId:int) : NormalSureView
      {
         if(null == m_stNormalSureView)
         {
            m_stNormalSureView = new NormalSureView();
         }
         m_stNormalSureView.mapId = iMapId;
         m_stNormalSureView.setHint("删除后不可恢复！");
         return m_stNormalSureView;
      }
      
      public static function GetView() : NormalSureView
      {
         if(null == m_stNormalSureView)
         {
            m_stNormalSureView = new NormalSureView();
         }
         return m_stNormalSureView;
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
            case this.cancelBtn:
               if(parent)
               {
                  parent.removeChild(this);
               }
               break;
            case this.sureBtn:
               DiyHandler.GetInstance().OnCRequestDiyDelMap(this.mapId);
         }
      }
   }
}

