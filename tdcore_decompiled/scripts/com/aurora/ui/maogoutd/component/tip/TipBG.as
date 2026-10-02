package com.aurora.ui.maogoutd.component.tip
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   
   public class TipBG extends Sprite
   {
      
      public var left:MovieClip;
      
      public var right:MovieClip;
      
      public var top:MovieClip;
      
      public var bottom:MovieClip;
      
      public var mid:MovieClip;
      
      public var ltop:MovieClip;
      
      public var lbot:MovieClip;
      
      public var rtop:MovieClip;
      
      public var rbot:MovieClip;
      
      public function TipBG()
      {
         super();
      }
      
      public function setSize(_x:int, _y:int, _width:int, _height:int) : void
      {
         this.ltop.x = _x;
         this.ltop.y = _y;
         this.rtop.x = _x + _width - this.rtop.width;
         this.rtop.y = _y;
         this.lbot.x = this.left.x;
         this.lbot.y = _y + _height - this.lbot.height;
         this.rbot.x = _x + _width - this.rbot.width;
         this.rbot.y = _y + _height - this.rbot.height;
         this.left.x = _x;
         this.left.y = _y + this.ltop.height;
         this.left.height = _height - this.ltop.height - this.lbot.height;
         this.top.x = this.ltop.x + this.ltop.width;
         this.top.y = this.ltop.y;
         this.top.width = _width - this.ltop.width - this.rtop.width;
         this.right.x = this.rtop.x;
         this.right.y = this.rtop.y + this.rtop.height;
         this.right.height = this.left.height;
         this.bottom.x = this.lbot.x + this.lbot.width;
         this.bottom.y = this.lbot.y;
         this.bottom.width = this.top.width;
         this.mid.x = this.ltop.x + this.ltop.width;
         this.mid.y = this.ltop.y + this.ltop.height;
         this.mid.width = this.top.width;
         this.mid.height = this.left.height;
      }
   }
}

