package com.aurora.ui.maogoutd.resource.defender.SnakeYear.goldLightBader.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class FinalKillBottomEffect extends a_4108
   {
      
      public var stOriginalFieldGrid:a_3491;
      
      public function FinalKillBottomEffect()
      {
         super();
         a_1279 = -156;
         m_iYDisplayCenterPos = -221;
      }
      
      public static function a_3926() : FinalKillBottomEffect
      {
         return PoolManager.getInstance().CheckOutOne(FinalKillBottomEffect) as FinalKillBottomEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return FinalKillBottomEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         return true;
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

