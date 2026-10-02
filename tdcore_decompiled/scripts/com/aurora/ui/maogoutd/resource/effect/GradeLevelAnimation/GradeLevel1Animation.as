package com.aurora.ui.maogoutd.resource.effect.GradeLevelAnimation
{
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class GradeLevel1Animation extends a_4108
   {
      
      public function GradeLevel1Animation()
      {
         super();
         a_1279 = -29;
         m_iYDisplayCenterPos = -10.5;
         a_1275 = 1;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == a_1274 || a_1278 != null)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
      }
   }
}

