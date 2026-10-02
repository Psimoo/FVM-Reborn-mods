package com.aurora.ui.maogoutd.resource.defender.HorseYear.vajra
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   import flash.events.Event;
   
   public class VajraHorseHitEffect extends a_4108
   {
      
      private var m_iStartTime:int;
      
      public var stOriginalIntruder:a_4206;
      
      public function VajraHorseHitEffect()
      {
         super();
         a_1279 = -19;
         m_iYDisplayCenterPos = -19;
      }
      
      public static function a_3926() : VajraHorseHitEffect
      {
         return PoolManager.getInstance().CheckOutOne(VajraHorseHitEffect) as VajraHorseHitEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return VajraHorseHitEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         super.a_1797(isReversed);
         this.m_iStartTime = 0;
         play();
         if(this.stOriginalIntruder)
         {
            this.stOriginalIntruder.AddTag(40007);
         }
         return true;
      }
      
      override protected function a_4109(a_4730:Event) : void
      {
         nextFrame();
         if(a_1273 == a_1274 || a_1278 != null)
         {
            this.a_3940();
         }
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         if(this.stOriginalIntruder)
         {
            this.stOriginalIntruder.RemoveTag(40007);
            this.stOriginalIntruder = null;
         }
         return true;
      }
   }
}

