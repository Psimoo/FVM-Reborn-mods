package com.aurora.ui.maogoutd.resource.defender.HorseYear.macaron
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   
   public class MacaronFirstAttackFighter extends MacaronNormalAttackFighter
   {
      
      public function MacaronFirstAttackFighter()
      {
         super();
         trans = 2;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(MacaronFirstAttackFighter) as MacaronFirstAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return MacaronFirstAttackFighterMovie;
      }
   }
}

