package com.aurora.ui.maogoutd.resource.defender.HorseYear.thunder
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.events.Event;
   
   public class ThunderboltHorseSecondCollectEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public var stOriginalFieldGrid:a_3491;
      
      public function ThunderboltHorseSecondCollectEffect()
      {
         super();
         a_1279 = -9;
         m_iYDisplayCenterPos = -16;
      }
      
      public static function a_3926() : ThunderboltHorseSecondCollectEffect
      {
         return PoolManager.getInstance().CheckOutOne(ThunderboltHorseSecondCollectEffect) as ThunderboltHorseSecondCollectEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return ThunderboltHorseSecondCollectEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         play();
         this.m_iStartTime = 0;
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == a_1274 || a_1278 != null)
         {
            gotoAndStop(1);
         }
      }
   }
}

