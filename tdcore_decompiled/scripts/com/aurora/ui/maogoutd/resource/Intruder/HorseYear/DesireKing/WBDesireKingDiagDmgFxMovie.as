package com.aurora.ui.maogoutd.resource.Intruder.HorseYear.DesireKing
{
   import flash.display.MovieClip;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   
   public class WBDesireKingDiagDmgFxMovie extends MovieClip
   {
      
      public var bgMask:MovieClip;
      
      public var id:int = -1;
      
      public var index:int = 0;
      
      public function WBDesireKingDiagDmgFxMovie()
      {
         super();
      }
      
      public function PlayAnimation() : void
      {
         if(this.id != -1)
         {
            return;
         }
         visible = true;
         this.gotoAndStop(1);
         this.index = 0;
         this.id = setInterval(this.OnPlay,99);
      }
      
      private function OnPlay() : void
      {
         ++this.index;
         this.gotoAndStop(this.index);
         if(this.index == totalFrames - 1)
         {
            this.index = 0;
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

