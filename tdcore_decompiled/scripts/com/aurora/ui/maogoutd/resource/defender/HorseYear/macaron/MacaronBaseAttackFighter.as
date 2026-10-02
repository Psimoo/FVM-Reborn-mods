package com.aurora.ui.maogoutd.resource.defender.HorseYear.macaron
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.resource.defender.a_3953;
   
   public class MacaronBaseAttackFighter extends MacaronNormalAttackFighter
   {
      
      public function MacaronBaseAttackFighter()
      {
         super();
         trans = 1;
      }
      
      public static function a_3926() : a_3953
      {
         return PoolManager.getInstance().CheckOutOne(MacaronBaseAttackFighter) as MacaronBaseAttackFighter;
      }
      
      override protected function getBindMovie() : Class
      {
         return MacaronBaseAttackFighterMovie;
      }
   }
}

