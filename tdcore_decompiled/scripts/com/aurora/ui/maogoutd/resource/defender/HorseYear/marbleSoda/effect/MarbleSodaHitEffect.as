package com.aurora.ui.maogoutd.resource.defender.HorseYear.marbleSoda.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.events.Event;
   
   public class MarbleSodaHitEffect extends a_4108
   {
      
      public function MarbleSodaHitEffect()
      {
         super();
         a_1279 = -31;
         m_iYDisplayCenterPos = -10;
      }
      
      public static function a_3926(index:int = 0) : MarbleSodaHitEffect
      {
         if(index == 1)
         {
            return PoolManager.getInstance().CheckOutOne(MarbleSodaHitEffect,MarbleSodaFirstHitEffectMovie) as MarbleSodaHitEffect;
         }
         if(index == 2)
         {
            return PoolManager.getInstance().CheckOutOne(MarbleSodaHitEffect,MarbleSodaSecondHitEffectMovie) as MarbleSodaHitEffect;
         }
         return PoolManager.getInstance().CheckOutOne(MarbleSodaHitEffect,MarbleSodaBaseHitEffectMovie) as MarbleSodaHitEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return MarbleSodaBaseHitEffectMovie;
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
            this.a_3940();
         }
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         return true;
      }
   }
}

