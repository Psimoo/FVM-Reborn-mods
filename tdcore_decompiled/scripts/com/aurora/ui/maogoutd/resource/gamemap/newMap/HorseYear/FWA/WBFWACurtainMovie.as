package com.aurora.ui.maogoutd.resource.gamemap.newMap.HorseYear.FWA
{
   import flash.display.MovieClip;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   
   public class WBFWACurtainMovie extends MovieClip
   {
      
      public var id:int = -1;
      
      public var index:int = 0;
      
      public function WBFWACurtainMovie()
      {
         super();
      }
      
      public function PlayAnimation() : void
      {
         visible = true;
         this.gotoAndStop(1);
         this.index = 0;
         this.id = setInterval(this.OnPlay,99);
      }
      
      private function OnPlay() : void
      {
         ++this.index;
         this.gotoAndStop(this.index);
         var num:int = 23;
         if(num <= this.index)
         {
            this.StopAnimation();
         }
      }
      
      public function StopAnimation() : void
      {
         if(this.id != -1)
         {
            clearInterval(this.id);
            this.id = -1;
         }
         visible = false;
      }
   }
}

