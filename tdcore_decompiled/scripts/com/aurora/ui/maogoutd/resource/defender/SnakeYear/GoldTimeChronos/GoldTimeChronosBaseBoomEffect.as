package com.aurora.ui.maogoutd.resource.defender.SnakeYear.GoldTimeChronos
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.events.Event;
   
   public class GoldTimeChronosBaseBoomEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public var stOriginalFieldGrid:a_3491;
      
      public function GoldTimeChronosBaseBoomEffect()
      {
         super();
         a_1279 = -153;
         m_iYDisplayCenterPos = -153;
      }
      
      public static function a_3926() : GoldTimeChronosBaseBoomEffect
      {
         return PoolManager.getInstance().CheckOutOne(GoldTimeChronosBaseBoomEffect) as GoldTimeChronosBaseBoomEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return GoldTimeChronosBaseBoomEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         this.m_iStartTime = 0;
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == a_1274)
         {
            a_3940();
         }
      }
   }
}

