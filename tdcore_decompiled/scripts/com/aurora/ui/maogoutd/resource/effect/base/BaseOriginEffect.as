package com.aurora.ui.maogoutd.resource.effect.base
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.resource.GameMovieClip;
   import flash.display.FrameLabel;
   import flash.display.Sprite;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   
   public class BaseOriginEffect extends Sprite
   {
      
      public var id:int = -1;
      
      public var a_1273:int = 0;
      
      public var m_bEndRelease:Boolean = false;
      
      public var a_1275:int = -1;
      
      public var a_1277:Array = [];
      
      public var m_stBindMoveClip:Class = null;
      
      public var m_stMovieClip:GameMovieClip;
      
      public function BaseOriginEffect()
      {
         super();
      }
      
      public function SetAnimation(startIndex:int, bEndRelease:Boolean = false) : void
      {
         this.m_bEndRelease = bEndRelease;
         if(this.a_1275 == startIndex)
         {
            return;
         }
         this.a_1275 = startIndex;
         this.GotoAndStop((this.m_stMovieClip.currentLabels[startIndex] as FrameLabel).frame);
      }
      
      public function SetAnimationOnce2Loop(startIndex:int, loopIndex:int) : void
      {
         this.m_bEndRelease = false;
         this.a_1275 = loopIndex;
         this.GotoAndStop((this.m_stMovieClip.currentLabels[startIndex] as FrameLabel).frame);
      }
      
      public function SetReversed(isReversed:Boolean) : void
      {
         if(isReversed)
         {
            this.m_stMovieClip.scaleX = -1;
            x = BattleFieldView.a_1013 - x;
            this.m_stMovieClip.x = -this.m_stMovieClip.a_1279;
         }
         else
         {
            this.m_stMovieClip.scaleX = 1;
         }
      }
      
      public function a_3014() : void
      {
         var frameLabel:FrameLabel = null;
         if(this.m_stMovieClip == null)
         {
            this.m_stMovieClip = new this.m_stBindMoveClip();
            this.addChild(this.m_stMovieClip);
            this.m_stMovieClip.x = this.m_stMovieClip.a_1279;
            this.m_stMovieClip.y = this.m_stMovieClip.m_iYDisplayCenterPos;
            if(this.a_1277.length == 0)
            {
               for each(frameLabel in this.m_stMovieClip.currentLabels)
               {
                  this.a_1277.push(frameLabel.frame);
               }
            }
         }
         if(this.id != -1)
         {
            return;
         }
         this.SetReversed(false);
         this.GotoAndStop(1);
         this.id = setInterval(this.OnPlayNextFrame,99);
      }
      
      private function GotoAndStop(frameIndex:int) : void
      {
         this.a_1273 = Math.min(frameIndex,this.m_stMovieClip.totalFrames);
         this.m_stMovieClip.gotoAndStop(frameIndex);
      }
      
      private function NextFrame() : void
      {
         ++this.a_1273;
         this.GotoAndStop(this.a_1273);
      }
      
      protected function OnPlayNextFrame() : void
      {
         this.NextFrame();
         if(this.a_1277.indexOf(this.a_1273) != -1 || this.a_1273 == this.m_stMovieClip.totalFrames)
         {
            if(this.m_bEndRelease == true)
            {
               this.a_3940();
            }
            else
            {
               this.GotoAndStop((this.m_stMovieClip.currentLabels[this.a_1275] as FrameLabel).frame);
            }
         }
      }
      
      public function a_3940() : void
      {
         if(this.id != -1)
         {
            clearInterval(this.id);
            this.id = -1;
         }
         PoolManager.getInstance().CheckInOne(this);
      }
   }
}

