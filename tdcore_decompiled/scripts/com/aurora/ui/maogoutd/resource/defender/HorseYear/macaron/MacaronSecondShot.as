package com.aurora.ui.maogoutd.resource.defender.HorseYear.macaron
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   
   public class MacaronSecondShot extends MacaronNormalShot
   {
      
      public function MacaronSecondShot()
      {
         super();
      }
      
      public static function a_4344() : MacaronSecondShot
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(MacaronSecondShot) as MacaronSecondShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return MacaronSecondShotMovie;
      }
   }
}

