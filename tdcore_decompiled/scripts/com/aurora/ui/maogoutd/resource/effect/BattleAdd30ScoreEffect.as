package com.aurora.ui.maogoutd.resource.effect
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   
   public class BattleAdd30ScoreEffect extends a_4108
   {
      
      public function BattleAdd30ScoreEffect()
      {
         super();
      }
      
      public static function a_3926() : BattleAdd30ScoreEffect
      {
         return PoolManager.getInstance().CheckOutOne(BattleAdd30ScoreEffect,BattleAdd30ScoreEffectMovie) as BattleAdd30ScoreEffect;
      }
   }
}

