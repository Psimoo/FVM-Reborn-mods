package com.aurora.ui.maogoutd.resource.Intruder.newBoss.nianBoss
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.effect.a_4108;
   
   public class NianBossHitGroundEffect extends a_4108
   {
      
      public function NianBossHitGroundEffect()
      {
         super();
      }
      
      public static function a_3926() : NianBossHitGroundEffect
      {
         return PoolManager.getInstance().CheckOutOne(NianBossHitGroundEffect) as NianBossHitGroundEffect;
      }
      
      override protected function getBindMovie() : Class
      {
         return NianBossHitGroundEffectMovie;
      }
      
      override public function a_1797(isReversed:Boolean) : Boolean
      {
         return super.a_1797(isReversed);
      }
   }
}

