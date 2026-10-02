package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.LazyBoss
{
   import flash.display.MovieClip;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   
   public class ChangeStepEffect extends MovieClip
   {
      
      public var id:int = -1;
      
      public var index:int = 0;
      
      public var _end:int = 0;
      
      public function ChangeStepEffect()
      {
         super();
      }
      
      public function PlayAnimation(begin:int, end:int) : void
      {
         visible = true;
         this.gotoAndStop(begin);
         this.index = begin;
         this._end = end;
         this.id = setInterval(this.OnPlay,99);
      }
      
      private function OnPlay() : void
      {
         ++this.index;
         if(this.index > this._end)
         {
            this.StopAnimation();
         }
         else
         {
            this.gotoAndStop(this.index);
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

