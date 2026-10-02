package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.a_3909;
   import flash.events.Event;
   
   public class IntruderMeiHuoEffect extends a_3909
   {
      
      public function IntruderMeiHuoEffect()
      {
         a_1271 = true;
         super();
      }
      
      public static function a_3926() : IntruderMeiHuoEffect
      {
         return PoolManager.getInstance().CheckOutOne(IntruderMeiHuoEffect) as IntruderMeiHuoEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return IntruderMeiHuoEffectMovie;
      }
      
      public function a_1797(isReseaved:Boolean = false) : Boolean
      {
         a_1283 = isReseaved;
         this.visible = true;
         gotoAndStop(1);
         return true;
      }
      
      public function a_3940() : Boolean
      {
         gotoAndStop(1);
         PoolManager.getInstance().CheckInOne(this);
         return true;
      }
      
      public function a_4003(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == a_1274)
         {
            gotoAndStop(1);
         }
      }
   }
}

