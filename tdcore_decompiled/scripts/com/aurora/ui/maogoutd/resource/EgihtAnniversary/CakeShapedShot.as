package com.aurora.ui.maogoutd.resource.EgihtAnniversary
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class CakeShapedShot extends a_4348
   {
      
      public function CakeShapedShot()
      {
         super();
         a_1279 = -width * 0.8;
         a_1573 = 1;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 1;
         a_1587 = 2;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(CakeShapedShot,CakeShapedShotMovie) as CakeShapedShot;
      }
   }
}

