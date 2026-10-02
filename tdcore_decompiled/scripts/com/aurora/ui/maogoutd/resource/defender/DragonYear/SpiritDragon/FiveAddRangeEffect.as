package com.aurora.ui.maogoutd.resource.defender.DragonYear.SpiritDragon
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.events.Event;
   
   public class FiveAddRangeEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public function FiveAddRangeEffect()
      {
         super();
         a_1279 = -157.5;
         m_iYDisplayCenterPos = -162.5;
      }
      
      public static function a_3926() : FiveAddRangeEffect
      {
         return PoolManager.getInstance().CheckOutOne(FiveAddRangeEffect) as FiveAddRangeEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return FiveAddRangeEffectMovie;
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
            gotoAndStop(1);
         }
      }
   }
}

