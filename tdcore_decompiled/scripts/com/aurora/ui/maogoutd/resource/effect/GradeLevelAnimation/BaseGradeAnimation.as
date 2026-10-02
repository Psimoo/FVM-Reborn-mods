package com.aurora.ui.maogoutd.resource.effect.GradeLevelAnimation
{
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class BaseGradeAnimation extends a_4108
   {
      
      private var a_1094:int;
      
      public function BaseGradeAnimation()
      {
         super();
         a_1279 = 0;
         m_iYDisplayCenterPos = 0;
         a_1275 = 1;
      }
      
      override protected function a_3910() : Boolean
      {
         a_1271 = true;
         return super.a_3910();
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         this.ApplyStarDegreeFrame();
         return super.a_1797(isReversed);
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         this.ApplyStarDegreeFrame();
         nextFrame();
         if(a_1273 == a_1274 || a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
      }
      
      public function get iStarDegree() : int
      {
         return this.a_1094;
      }
      
      public function set iStarDegree(value:int) : void
      {
         if(this.a_1094 == value)
         {
            return;
         }
         this.a_1094 = value;
         this.ApplyStarDegreeFrame();
         if(a_1273 > 0)
         {
            gotoAndStop(a_1273);
         }
      }
      
      private function ApplyStarDegreeFrame() : void
      {
         if(this.a_1094 <= 0)
         {
            return;
         }
         var stMovieClip:MovieClip = stOriginalMovieClip;
         if(stMovieClip == null)
         {
            stMovieClip = a_3913();
         }
         if(stMovieClip != null && stMovieClip["a_1094"] != null)
         {
            (stMovieClip["a_1094"] as MovieClip).gotoAndStop(this.a_1094);
         }
      }
   }
}

