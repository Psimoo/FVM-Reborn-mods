package com.aurora.ui.maogoutd.resource.defender.HorseYear.barrier
{
   import flash.display.MovieClip;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   
   public class BarrierHorseNormalShot extends MovieClip
   {
      
      public var m_stUp:BarrierHorseLineMovieClip;
      
      public var m_stDown:BarrierHorseLineMovieClip;
      
      public var m_HitSprite:MovieClip;
      
      public var id:int = -1;
      
      public var index:int = 0;
      
      public function BarrierHorseNormalShot()
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
         if(this.index == totalFrames)
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

