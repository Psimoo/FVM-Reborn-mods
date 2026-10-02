package com.aurora.ui.maogoutd.resource.defender.RabbitYear.TimeMachine
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class lowGradeEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public var m_Level:int;
      
      public function lowGradeEffect()
      {
         super();
         a_1279 = -53;
         m_iYDisplayCenterPos = -86;
      }
      
      public static function a_3926() : lowGradeEffect
      {
         return PoolManager.getInstance().CheckOutOne(lowGradeEffect) as lowGradeEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return lowGradeEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         gotoAndStop((a_1276[this.m_Level - 1] as FrameLabel).frame);
         this.m_iStartTime = 0;
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == 17 || a_1273 == 34 || a_1273 == 52)
         {
            a_3940();
         }
      }
   }
}

