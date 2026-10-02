package com.aurora.ui.maogoutd.resource.defender.HorseYear.macaron
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   
   public class MacaronFirstShot extends MacaronNormalShot
   {
      
      public function MacaronFirstShot()
      {
         super();
      }
      
      public static function a_4344() : MacaronFirstShot
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(MacaronFirstShot) as MacaronFirstShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return MacaronFirstShotMovie;
      }
   }
}

