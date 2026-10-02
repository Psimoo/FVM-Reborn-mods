package com.aurora.ui.maogoutd.resource.defender.fusionCard.roastedchestnuts
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.events.Event;
   
   public class RoastedchestnutsBoomEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public var stOriginalFieldGrid:a_3491;
      
      public function RoastedchestnutsBoomEffect()
      {
         super();
         a_1279 = -47.5;
         m_iYDisplayCenterPos = -57;
         alpha = 0.5;
      }
      
      public static function a_3926() : RoastedchestnutsBoomEffect
      {
         return PoolManager.getInstance().CheckOutOne(RoastedchestnutsBoomEffect) as RoastedchestnutsBoomEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return RoastedchestnutsBoomEffectMovie;
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
         if(a_1273 == a_1274 || a_1278 != null)
         {
            a_3940();
         }
      }
   }
}

