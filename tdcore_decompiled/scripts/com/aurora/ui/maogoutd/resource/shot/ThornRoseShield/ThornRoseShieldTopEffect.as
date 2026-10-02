package com.aurora.ui.maogoutd.resource.shot.ThornRoseShield
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class ThornRoseShieldTopEffect extends a_4108
   {
      
      public function ThornRoseShieldTopEffect()
      {
         super();
         a_1279 = -45;
         m_iYDisplayCenterPos = -45;
      }
      
      public static function a_3926() : ThornRoseShieldTopEffect
      {
         return PoolManager.getInstance().CheckOutOne(ThornRoseShieldTopEffect) as ThornRoseShieldTopEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return ThornRoseShieldTopEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         play();
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

