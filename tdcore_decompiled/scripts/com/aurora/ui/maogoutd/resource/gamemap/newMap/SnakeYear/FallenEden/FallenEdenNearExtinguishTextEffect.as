package com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.FallenEden
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.events.Event;
   
   public class FallenEdenNearExtinguishTextEffect extends a_4108
   {
      
      public function FallenEdenNearExtinguishTextEffect()
      {
         super();
      }
      
      public static function a_3926() : FallenEdenNearExtinguishTextEffect
      {
         return PoolManager.getInstance().CheckOutOne(FallenEdenNearExtinguishTextEffect) as FallenEdenNearExtinguishTextEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return FallenEdenNearExtinguishTextEffectMovie;
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

