package com.aurora.ui.maogoutd.resource.shot
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   
   public class PetGradeBShot extends a_4348
   {
      
      public function PetGradeBShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1573 = 1;
         a_1576 = false;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(PetGradeBShot) as PetGradeBShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return PetGradeBShotMovie;
      }
   }
}

