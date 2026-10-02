package com.aurora.ui.maogoutd.verifyInGame.view
{
   import flash.display.MovieClip;
   
   public class BaseTiger extends MovieClip implements IVerifyAni
   {
      
      private var type:int;
      
      private var isPlay:Boolean;
      
      public function BaseTiger()
      {
         super();
         this.setStopFrame(0);
      }
      
      public function setType(value:int) : void
      {
         this.type = value;
      }
      
      public function getType() : int
      {
         return this.type;
      }
      
      public function setPlayState() : void
      {
         this.isPlay = true;
      }
      
      public function setStopFrame(frame:int) : void
      {
         this.isPlay = false;
         this.gotoAndStop(frame);
      }
      
      public function setRandStopFrame() : void
      {
         this.isPlay = false;
         var frame:int = Math.random() * this.totalFrames;
         this.gotoAndStop(frame);
      }
      
      public function enterFrame() : void
      {
         if(this.isPlay)
         {
            if(this.currentFrame < this.totalFrames)
            {
               this.nextFrame();
            }
            else
            {
               this.gotoAndStop(1);
            }
         }
      }
   }
}

