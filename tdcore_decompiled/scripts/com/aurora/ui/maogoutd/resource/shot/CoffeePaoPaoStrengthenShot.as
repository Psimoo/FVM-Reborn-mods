package com.aurora.ui.maogoutd.resource.shot
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   
   public class CoffeePaoPaoStrengthenShot extends a_4348
   {
      
      private static var a_1589:Array = new Array();
      
      private var a_1590:Number;
      
      public function CoffeePaoPaoStrengthenShot()
      {
         super();
         a_1279 = 0;
         a_1573 = 1;
         a_1576 = false;
         a_1577 = false;
         a_1588 = true;
         a_1275 = 1;
         a_1587 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(CoffeePaoPaoStrengthenShot) as CoffeePaoPaoStrengthenShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return CoffeePaoPaoStrengthenShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         this.a_1590 = x;
         return true;
      }
   }
}

