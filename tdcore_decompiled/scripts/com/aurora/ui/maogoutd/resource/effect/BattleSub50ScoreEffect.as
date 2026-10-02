package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class BattleSub50ScoreEffect extends a_4108
   {
      
      public function BattleSub50ScoreEffect()
      {
         super();
      }
      
      public static function a_3926() : BattleSub50ScoreEffect
      {
         return PoolManager.getInstance().CheckOutOne(BattleSub50ScoreEffect,BattleSub50ScoreEffectMovie) as BattleSub50ScoreEffect;
      }
   }
}

