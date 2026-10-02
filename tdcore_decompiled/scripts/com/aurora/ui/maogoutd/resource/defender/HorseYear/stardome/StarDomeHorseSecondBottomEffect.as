package com.aurora.ui.maogoutd.resource.defender.HorseYear.stardome
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.display.FrameLabel;
   import flash.events.Event;
   
   public class StarDomeHorseSecondBottomEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public var stOriginalFieldGrid:a_3491;
      
      public function StarDomeHorseSecondBottomEffect()
      {
         super();
         a_1279 = -138;
         m_iYDisplayCenterPos = -122.5;
      }
      
      public static function a_3926() : StarDomeHorseSecondBottomEffect
      {
         return PoolManager.getInstance().CheckOutOne(StarDomeHorseSecondBottomEffect) as StarDomeHorseSecondBottomEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return StarDomeHorseSecondBottomEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         this.m_iStartTime = 0;
         play();
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == a_1274)
         {
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
      }
   }
}

