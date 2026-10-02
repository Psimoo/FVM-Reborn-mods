package com.aurora.ui.maogoutd.resource.defender.SnakeYear.FoodTimer
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class FoodTimerBaseBottomEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public var stOriginalFieldGrid:a_3491;
      
      private var m_lastGotoAndStopFrame:int;
      
      public function FoodTimerBaseBottomEffect()
      {
         super();
         a_1279 = -23;
         m_iYDisplayCenterPos = -14;
      }
      
      public static function a_3926() : FoodTimerBaseBottomEffect
      {
         return PoolManager.getInstance().CheckOutOne(FoodTimerBaseBottomEffect) as FoodTimerBaseBottomEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return FoodTimerBaseBottomEffectMovie;
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
            a_3940();
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

