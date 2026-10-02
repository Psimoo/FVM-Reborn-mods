package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class BattleAdd40ScoreEffect extends a_4108
   {
      
      public function BattleAdd40ScoreEffect()
      {
         super();
      }
      
      public static function a_3926() : BattleAdd40ScoreEffect
      {
         return PoolManager.getInstance().CheckOutOne(BattleAdd40ScoreEffect,BattleAdd40ScoreEffectMovie) as BattleAdd40ScoreEffect;
      }
   }
}

