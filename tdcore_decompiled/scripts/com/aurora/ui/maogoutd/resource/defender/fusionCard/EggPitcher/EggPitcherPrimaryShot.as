package com.aurora.ui.maogoutd.resource.defender.fusionCard.EggPitcher
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   
   public class EggPitcherPrimaryShot extends EggPitcherBaseShot
   {
      
      public function EggPitcherPrimaryShot()
      {
         super();
      }
      
      public static function a_4344() : EggPitcherBaseShot
      {
         BattleFieldView.a_1018.play();
         return PoolManager.getInstance().CheckOutOne(EggPitcherPrimaryShot) as EggPitcherPrimaryShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return EggPitcherPrimaryShotMovie;
      }
   }
}

