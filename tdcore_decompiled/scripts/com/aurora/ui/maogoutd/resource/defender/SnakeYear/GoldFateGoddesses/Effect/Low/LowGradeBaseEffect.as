package com.aurora.ui.maogoutd.resource.defender.SnakeYear.GoldFateGoddesses.Effect.Low
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class LowGradeBaseEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public var m_Level:int;
      
      public function LowGradeBaseEffect()
      {
         super();
         a_1279 = -65;
         m_iYDisplayCenterPos = -145;
      }
      
      public static function a_3926() : LowGradeBaseEffect
      {
         return PoolManager.getInstance().CheckOutOne(LowGradeBaseEffect) as LowGradeBaseEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return LowGradeBaseEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         a_1275 = this.m_Level - 1;
         gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         this.m_iStartTime = 0;
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == (a_1276[a_1275] as FrameLabel).frame + 18)
         {
            a_3940();
         }
      }
   }
}

