package com.aurora.ui.maogoutd.exchange
{
   import flash.display.MovieClip;
   
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

