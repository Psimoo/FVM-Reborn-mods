package com.aurora.ui.maogoutd.crossshop
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol89")]
   public class ExchangeTabbar extends Sprite
   {
      
      public var chitongTab:MovieClip;
      
      public var baiyinTab:MovieClip;
      
      public var huangjinTab:MovieClip;
      
      public var zongheTab:MovieClip;
      
      public var m_iIndex:int;
      
      public function ExchangeTabbar()
      {
         super();
         this.setChitong();
      }
      
      public function setChitong() : void
      {
         this.chitongTab.gotoAndStop(2);
         this.baiyinTab.gotoAndStop(1);
         this.huangjinTab.gotoAndStop(1);
         this.zongheTab.gotoAndStop(1);
         this.m_iIndex = 1;
      }
      
      public function setBaiyin() : void
      {
         this.chitongTab.gotoAndStop(1);
         this.baiyinTab.gotoAndStop(2);
         this.huangjinTab.gotoAndStop(1);
         this.zongheTab.gotoAndStop(1);
         this.m_iIndex = 2;
      }
      
      public function setHuangjin() : void
      {
         this.chitongTab.gotoAndStop(1);
         this.baiyinTab.gotoAndStop(1);
         this.huangjinTab.gotoAndStop(2);
         this.zongheTab.gotoAndStop(1);
         this.m_iIndex = 3;
      }
      
      public function setZonghe() : void
      {
         this.chitongTab.gotoAndStop(1);
         this.baiyinTab.gotoAndStop(1);
         this.huangjinTab.gotoAndStop(1);
         this.zongheTab.gotoAndStop(2);
         this.m_iIndex = 4;
      }
   }
}

