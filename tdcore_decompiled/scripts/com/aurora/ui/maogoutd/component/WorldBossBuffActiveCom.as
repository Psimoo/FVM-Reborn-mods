package com.aurora.ui.maogoutd.component
{
   import flash.display.MovieClip;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   
   public class WorldBossBuffActiveCom extends MovieClip
   {
      
      public var buffIcon:MovieClip;
      
      public var id:int = -1;
      
      public var index:int = 0;
      
      public function WorldBossBuffActiveCom()
      {
         super();
         this.mouseChildren = false;
         this.mouseEnabled = false;
      }
      
      public function a_4332() : void
      {
         this.gotoAndStop(1);
         this.index = 0;
         this.id = setInterval(this.onPlay,80);
      }
      
      private function onPlay() : void
      {
         ++this.index;
         this.gotoAndStop(this.index);
         var num:int = this.totalFrames;
         if(num <= this.index)
         {
            this.index = 14;
         }
      }
      
      public function a_4158() : void
      {
         if(this.id != -1)
         {
            clearInterval(this.id);
            this.id = -1;
         }
      }
   }
}

