package com.aurora.ui.maogoutd.resource.defender.HorseYear.vajra
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.events.Event;
   
   public class VajraHorseDeathEffect extends a_4108
   {
      
      public function VajraHorseDeathEffect()
      {
         super();
         a_1279 = -68;
         m_iYDisplayCenterPos = -50;
      }
      
      public static function a_3926() : VajraHorseDeathEffect
      {
         return PoolManager.getInstance().CheckOutOne(VajraHorseDeathEffect) as VajraHorseDeathEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return VajraHorseDeathEffectMovie;
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
            a_3940();
         }
      }
   }
}

