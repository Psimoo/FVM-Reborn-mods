package com.aurora.ui.maogoutd.resource.defender.DragonYear.SpicyRiceCakeCrab
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.events.Event;
   
   public class MarkBuffEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public function MarkBuffEffect()
      {
         super();
         a_1279 = -61;
         m_iYDisplayCenterPos = -36;
      }
      
      public static function a_3926() : MarkBuffEffect
      {
         return PoolManager.getInstance().CheckOutOne(MarkBuffEffect) as MarkBuffEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return MarkBuffEffectMovie;
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

