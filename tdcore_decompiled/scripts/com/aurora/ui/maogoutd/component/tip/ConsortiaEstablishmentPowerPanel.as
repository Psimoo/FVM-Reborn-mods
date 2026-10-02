package com.aurora.ui.maogoutd.component.tip
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class ConsortiaEstablishmentPowerPanel extends Sprite
   {
      
      private static var _instance:ConsortiaEstablishmentPowerPanel;
      
      private static var sign:Boolean;
      
      public var mask_mc:MovieClip;
      
      public var close_btn:SimpleButton;
      
      public var title_tf:TextField;
      
      public var lv1_txt:TextField;
      
      public var lv2_txt:TextField;
      
      public var lv3_txt:TextField;
      
      public var lv4_txt:TextField;
      
      public var lv5_txt:TextField;
      
      public var lv6_txt:TextField;
      
      private var m_MaxLevel:int = 7;
      
      public function ConsortiaEstablishmentPowerPanel()
      {
         super();
         if(!sign)
         {
            throw new Error("ConsortiaEstablishmentPowerPanel不允许实例化，请通过getInstance()获取！");
         }
         this.init();
      }
      
      public static function getInstance() : ConsortiaEstablishmentPowerPanel
      {
         if(_instance == null)
         {
            sign = true;
            _instance = new ConsortiaEstablishmentPowerPanel();
            sign = false;
         }
         return _instance;
      }
      
      public function setTitle(strTitle:String) : void
      {
         this.title_tf.htmlText = "<b>" + strTitle + "</b>";
      }
      
      public function setContent(arrData:Array) : void
      {
         for(var i:int = 1; i < this.m_MaxLevel; i++)
         {
            (this.getChildByName("lv" + i + "_txt") as TextField).htmlText = "<b>" + arrData[i - 1].toString() + "</b>";
         }
      }
      
      private function init() : void
      {
         this.close_btn.addEventListener(MouseEvent.CLICK,this.closeBtnOnClick);
         this.mask_mc.addEventListener(MouseEvent.CLICK,function(a_4730:MouseEvent):void
         {
            trace("你点不下去的！");
         });
      }
      
      private function closeBtnOnClick(a_4730:MouseEvent) : void
      {
         if(null == this.parent)
         {
            return;
         }
         this.parent.removeChild(this);
      }
   }
}

