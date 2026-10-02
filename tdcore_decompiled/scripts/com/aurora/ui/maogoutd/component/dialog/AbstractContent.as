package com.aurora.ui.maogoutd.component.dialog
{
   import flash.display.Sprite;
   
   public class AbstractContent extends Sprite
   {
      
      public static const a_940:int = 200;
      
      protected var _minHeight:int = 50;
      
      public function AbstractContent()
      {
         super();
      }
      
      public function getSize() : Object
      {
         return {
            "w":AbstractContent.a_940,
            "h":this.height
         };
      }
      
      public function set minHeight(v:int) : void
      {
         this._minHeight = v;
      }
      
      public function get minHeight() : int
      {
         return this._minHeight;
      }
   }
}

