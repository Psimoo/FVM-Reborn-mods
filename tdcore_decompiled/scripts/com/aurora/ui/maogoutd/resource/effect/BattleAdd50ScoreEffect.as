package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class BattleAdd50ScoreEffect extends a_4108
   {
      
      public function BattleAdd50ScoreEffect()
      {
         super();
      }
      
      public static function a_3926() : BattleAdd50ScoreEffect
      {
         return PoolManager.getInstance().CheckOutOne(BattleAdd50ScoreEffect,BattleAdd50ScoreEffectMovie) as BattleAdd50ScoreEffect;
      }
   }
}

