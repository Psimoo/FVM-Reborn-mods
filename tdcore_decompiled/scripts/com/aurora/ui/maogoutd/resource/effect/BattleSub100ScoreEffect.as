package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class BattleSub100ScoreEffect extends a_4108
   {
      
      public function BattleSub100ScoreEffect()
      {
         super();
      }
      
      public static function a_3926() : BattleSub100ScoreEffect
      {
         return PoolManager.getInstance().CheckOutOne(BattleSub100ScoreEffect,BattleSub100ScoreEffectMovie) as BattleSub100ScoreEffect;
      }
   }
}

