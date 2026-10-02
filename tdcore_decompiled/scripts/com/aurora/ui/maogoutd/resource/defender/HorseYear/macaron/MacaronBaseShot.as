package com.aurora.ui.maogoutd.resource.defender.HorseYear.macaron
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   
   public class MacaronBaseShot extends MacaronNormalShot
   {
      
      public function MacaronBaseShot()
      {
         super();
      }
      
      public static function a_4344() : MacaronBaseShot
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(MacaronBaseShot) as MacaronBaseShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return MacaronBaseShotMovie;
      }
   }
}

