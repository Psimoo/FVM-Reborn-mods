package com.aurora.ui.maogoutd.resource.defender.SnakeYear.GoldTimeChronos
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class GoldTimeChronosSecondBottomEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public var stOriginalFieldGrid:a_3491;
      
      private var m_lastGotoAndStopFrame:int;
      
      public function GoldTimeChronosSecondBottomEffect()
      {
         super();
         a_1279 = -220;
         m_iYDisplayCenterPos = -218 - 61;
      }
      
      public static function a_3926() : GoldTimeChronosSecondBottomEffect
      {
         return PoolManager.getInstance().CheckOutOne(GoldTimeChronosSecondBottomEffect) as GoldTimeChronosSecondBottomEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return GoldTimeChronosSecondBottomEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         this.m_iStartTime = 0;
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         if(a_1278 != null && a_1273 != this.m_lastGotoAndStopFrame)
         {
            this.gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         else if(a_1273 == a_1274)
         {
            this.gotoAndStop(1);
         }
         else
         {
            nextFrame();
         }
      }
      
      override public function gotoAndStop(frame:Object, scene:String = null) : void
      {
         this.m_lastGotoAndStopFrame = frame as int;
         super.gotoAndStop(frame,scene);
      }
      
      override public function ShowPlayAnimation(startIndex:int, loopIndex:int) : void
      {
         if(a_1275 != loopIndex && startIndex != a_1273)
         {
            a_1275 = loopIndex;
            this.gotoAndStop((a_1276[startIndex] as FrameLabel).frame);
         }
      }
   }
}

