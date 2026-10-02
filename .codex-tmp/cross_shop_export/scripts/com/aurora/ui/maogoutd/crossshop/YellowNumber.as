package com.aurora.ui.maogoutd.crossshop
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol61")]
   public class YellowNumber extends MovieClip
   {
      
      public function YellowNumber()
      {
         super();
      }
      
      public function setnumber(num:int) : void
      {
         this.gotoAndStop(num + 1);
      }
   }
}

