package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.LazyBoss
{
   import com.greensock.TweenMax;
   import flash.display.MovieClip;
   
   public class ChangeStepMapEffect extends MovieClip
   {
      
      public function ChangeStepMapEffect()
      {
         super();
      }
      
      public function Change2Two() : void
      {
         visible = true;
         gotoAndStop(1);
         alpha = 1;
         TweenMax.to(this,2.5,{
            "alpha":0,
            "onComplete":this.OnTweenEnd
         });
      }
      
      public function Change2Three() : void
      {
         visible = true;
         gotoAndStop(2);
         alpha = 1;
         TweenMax.to(this,2.5,{
            "alpha":0,
            "onComplete":this.OnTweenEnd
         });
      }
      
      private function OnTweenEnd() : void
      {
         visible = false;
      }
   }
}

