package com.aurora.ui.maogoutd.resource.defender.SnakeYear.GoldFateGoddesses.Effect.Up
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class UpGradeGoldEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public var m_Level:int;
      
      public function UpGradeGoldEffect()
      {
         super();
         a_1279 = -65;
         m_iYDisplayCenterPos = -145;
      }
      
      public static function a_3926() : UpGradeGoldEffect
      {
         return PoolManager.getInstance().CheckOutOne(UpGradeGoldEffect) as UpGradeGoldEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return UpGradeGoldEffectMovie;
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
         if(a_1273 == 18 || a_1273 == 36 || a_1273 == 54 || a_1273 == 72 || a_1273 == 90)
         {
            a_3940();
         }
      }
   }
}

