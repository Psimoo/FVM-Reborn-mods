package com.aurora.ui.maogoutd.resource.defender.DragonYear.SpiritDragon
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.events.Event;
   
   public class ThreeAddRangeEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public function ThreeAddRangeEffect()
      {
         super();
         a_1279 = -95;
         m_iYDisplayCenterPos = -88;
      }
      
      public static function a_3926() : ThreeAddRangeEffect
      {
         return PoolManager.getInstance().CheckOutOne(ThreeAddRangeEffect) as ThreeAddRangeEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return ThreeAddRangeEffectMovie;
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

