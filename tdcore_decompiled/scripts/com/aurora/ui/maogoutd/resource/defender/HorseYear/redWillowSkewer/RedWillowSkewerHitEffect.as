package com.aurora.ui.maogoutd.resource.defender.HorseYear.redWillowSkewer
{
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.HorseYear.redWillowSkewer.effect.RedWillowSkewerBaseHitEffectMovie;
   import com.aurora.ui.maogoutd.resource.effect.BaseGameEffect;
   
   public class RedWillowSkewerHitEffect extends BaseGameEffect
   {
      
      public static const HIT_EFFECT_TAG:int = 40013;
      
      public var stOriginalIntruder:a_4206;
      
      public function RedWillowSkewerHitEffect()
      {
         super();
      }
      
      override protected function getBindMovie() : Class
      {
         return RedWillowSkewerBaseHitEffectMovie;
      }
      
      public function InitData(intruder:a_4206) : void
      {
         this.stOriginalIntruder = intruder;
         if(this.stOriginalIntruder)
         {
            this.stOriginalIntruder.AddTag(HIT_EFFECT_TAG);
         }
      }
      
      override public function a_3940() : Boolean
      {
         super.a_3940();
         if(this.stOriginalIntruder)
         {
            this.stOriginalIntruder.RemoveTag(HIT_EFFECT_TAG);
            this.stOriginalIntruder = null;
         }
         return true;
      }
   }
}

