package com.aurora.ui.maogoutd.resource.defender.fusionCard.EggPitcher
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   
   public class EggPitcherDeepShot extends EggPitcherBaseShot
   {
      
      public function EggPitcherDeepShot()
      {
         super();
      }
      
      public static function a_4344() : EggPitcherBaseShot
      {
         BattleFieldView.a_1018.play();
         return PoolManager.getInstance().CheckOutOne(EggPitcherDeepShot) as EggPitcherDeepShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return EggPitcherDeepShotMovie;
      }
   }
}

