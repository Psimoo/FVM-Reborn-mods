package com.aurora.ui.maogoutd.resource.Intruder.BaseCamp.boss.TravelRecordPlayer
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.events.Event;
   
   public class ArrowEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public function ArrowEffect()
      {
         super();
         a_1279 = 0;
         m_iYDisplayCenterPos = 0;
      }
      
      public static function a_3926() : ArrowEffect
      {
         return PoolManager.getInstance().CheckOutOne(ArrowEffect) as ArrowEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return ArrowEffectMovie;
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

