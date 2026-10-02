package com.aurora.ui.maogoutd.resource.shot
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class WaterDropsShot extends a_4348
   {
      
      public function WaterDropsShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1304 = b_183.b_198;
         a_1573 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(WaterDropsShot) as WaterDropsShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return WaterDropsShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         if(isBothWayShot)
         {
            gotoAndStop(2);
         }
         return true;
      }
   }
}

