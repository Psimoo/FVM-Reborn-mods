package com.aurora.ui.maogoutd.crossshop
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol95")]
   public class ClassifyTabbar extends Sprite
   {
      
      public var allTab:MovieClip;
      
      public var m_iIndex:int;
      
      public function ClassifyTabbar()
      {
         super();
         this.setAllTab();
      }
      
      private function reset() : void
      {
         this.allTab.gotoAndStop(1);
      }
      
      public function setAllTab() : void
      {
         this.reset();
         this.allTab.gotoAndStop(2);
         this.m_iIndex = 0;
      }
   }
}

