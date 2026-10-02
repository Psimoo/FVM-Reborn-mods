package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import flash.events.Event;
   
   public class WindbreakEffect extends a_4108
   {
      
      public function WindbreakEffect()
      {
         super();
      }
      
      public static function a_3926() : WindbreakEffect
      {
         return PoolManager.getInstance().CheckOutOne(WindbreakEffect) as WindbreakEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return WindbreakEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         return super.a_1797(isReversed);
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == a_1274)
         {
            gotoAndStop(1);
         }
      }
   }
}

