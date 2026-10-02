package com.aurora.ui.maogoutd.resource.defender.SnakeYear.goldLightBader.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.events.Event;
   
   public class FiveBySevenBombEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public var stOriginalFieldGrid:a_3491;
      
      public function FiveBySevenBombEffect()
      {
         super();
         a_1279 = -272;
         m_iYDisplayCenterPos = -401;
      }
      
      public static function a_3926() : FiveBySevenBombEffect
      {
         return PoolManager.getInstance().CheckOutOne(FiveBySevenBombEffect) as FiveBySevenBombEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return FiveBySevenBombEffectMovie;
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

