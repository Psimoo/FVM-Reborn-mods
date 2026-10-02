package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.resource.GameMovieClip;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class BaseGameEffect extends a_4108
   {
      
      private var m_bEndRelease:Boolean = false;
      
      public function BaseGameEffect()
      {
         super();
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         var m_stMoveClip:GameMovieClip = null;
         a_1275 = -1;
         m_stMoveClip = a_3913() as GameMovieClip;
         a_1279 = m_stMoveClip.a_1279;
         m_iYDisplayCenterPos = m_stMoveClip.m_iYDisplayCenterPos;
         scaleX = m_stMoveClip.m_iScaleX;
         scaleY = m_stMoveClip.m_iScaleY;
         this.m_bEndRelease = false;
         super.a_1797(isReversed);
         play();
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1278 != null || a_1273 == a_1274)
         {
            if(this.m_bEndRelease == true)
            {
               a_3940();
            }
            else
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
      }
      
      public function SetAnimation(startIndex:int, bEndRelease:Boolean = false) : void
      {
         this.m_bEndRelease = bEndRelease;
         PlayAnimation(startIndex);
      }
      
      public function SetAnimationOnce2Loop(startIndex:int, loopIndex:int) : void
      {
         this.m_bEndRelease = false;
         a_1275 = loopIndex;
         gotoAndStop((a_1276[startIndex] as FrameLabel).frame);
      }
   }
}

