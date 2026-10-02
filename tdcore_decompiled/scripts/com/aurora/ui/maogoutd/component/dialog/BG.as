package com.aurora.ui.maogoutd.component.dialog
{
   import a_4794.a_4669;
   import com.aurora.ui.maogoutd.component.Grid9.a_3261;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   
   public class BG extends Sprite
   {
      
      public static const a_941:int = 5;
      
      public static const a_942:int = 6;
      
      private const MIN_W:int = 120;
      
      private const MIN_H:int = 100;
      
      private const CONTENT_MARGIN_L:int = 35;
      
      private const CONTENT_MARGIN_T:int = 65;
      
      private const CONTENT_MARGIN_B:int = 30;
      
      private const CONTENT_MARGIN_B_WITH_BTNS:int = 65;
      
      private const BTNS_MARGIN_B:int = 55;
      
      private const BTNS_DIS:int = 20;
      
      private const CLOSE_BTN_MARGIN_T:int = 9;
      
      private const CLOSE_BTN_SIZE:int = 50;
      
      private var bg:a_4669;
      
      private var _contentRect:Rectangle;
      
      public function BG()
      {
         super();
         this.init();
      }
      
      public function setSize(contentW:int, contentH:int, topW:int, hasBtns:Boolean = true) : void
      {
         var vw:int = 0;
         var vh:int = 0;
         var centerWidth:int = 0;
         this._contentRect.height = contentH;
         this._contentRect.width = contentW;
         vw = this.CONTENT_MARGIN_L * 2 + contentW;
         if(vw < topW)
         {
            vw = topW;
            this._contentRect.width = vw - this.CONTENT_MARGIN_L * 2;
         }
         if(hasBtns)
         {
            vh = this.CONTENT_MARGIN_T + this.CONTENT_MARGIN_B_WITH_BTNS + contentH;
         }
         else
         {
            vh = this.CONTENT_MARGIN_T + this.CONTENT_MARGIN_B + contentH;
         }
         if(vh < this.MIN_H)
         {
            vh = this.MIN_H;
         }
         if(vw < this.MIN_W)
         {
            vw = this.MIN_W;
         }
         this.bg.setSize(vw,vh);
      }
      
      public function getSize() : Object
      {
         return {
            "w":this.bg.width,
            "h":this.bg.height
         };
      }
      
      public function get titleRect() : Rectangle
      {
         return new Rectangle(13,2,this.bg.width,45);
      }
      
      public function get contentRect() : Rectangle
      {
         return this._contentRect;
      }
      
      public function get btnsPos() : Object
      {
         return {
            "y":this.bg.height - this.BTNS_MARGIN_B,
            "dis":this.BTNS_DIS
         };
      }
      
      public function get closeRect() : Rectangle
      {
         return new Rectangle(this.bg.width - a_942,this.CLOSE_BTN_MARGIN_T,this.CLOSE_BTN_SIZE,this.CLOSE_BTN_SIZE);
      }
      
      private function init() : void
      {
         this.bg = a_3261.create();
         this._contentRect = new Rectangle();
         this._contentRect.x = this.CONTENT_MARGIN_L;
         this._contentRect.y = this.CONTENT_MARGIN_T;
         addChild(this.bg);
      }
   }
}

