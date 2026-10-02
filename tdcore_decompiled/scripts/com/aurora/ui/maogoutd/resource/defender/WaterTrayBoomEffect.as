package com.aurora.ui.maogoutd.resource.defender
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.events.Event;
   
   public class WaterTrayBoomEffect extends a_4108
   {
      
      public function WaterTrayBoomEffect()
      {
         super();
      }
      
      public static function a_3926() : WaterTrayBoomEffect
      {
         return PoolManager.getInstance().CheckOutOne(WaterTrayBoomEffect) as WaterTrayBoomEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return WaterTrayBoomEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         gotoAndStop(1);
         play();
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

