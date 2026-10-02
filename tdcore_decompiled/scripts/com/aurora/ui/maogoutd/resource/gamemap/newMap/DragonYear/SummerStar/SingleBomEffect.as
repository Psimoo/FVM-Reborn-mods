package com.aurora.ui.maogoutd.resource.gamemap.newMap.DragonYear.SummerStar
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.events.Event;
   
   public class SingleBomEffect extends a_4108
   {
      
      public function SingleBomEffect()
      {
         super();
         a_1279 = -19;
         m_iYDisplayCenterPos = -16;
         rotation = 180;
      }
      
      public static function a_3926() : SingleBomEffect
      {
         return PoolManager.getInstance().CheckOutOne(SingleBomEffect) as SingleBomEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return SingleBomEffectMovie;
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
         if(a_1273 == a_1274)
         {
            gotoAndStop(1);
         }
      }
   }
}

