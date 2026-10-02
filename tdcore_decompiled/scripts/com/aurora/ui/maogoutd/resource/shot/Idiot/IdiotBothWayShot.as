package com.aurora.ui.maogoutd.resource.shot.Idiot
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class IdiotBothWayShot extends a_4348
   {
      
      public function IdiotBothWayShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1304 = 65563;
         a_1587 = 3;
         a_1573 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(IdiotBothWayShot,IdiotBothWayShotMovie) as IdiotBothWayShot;
      }
      
      public static function GetFreeShot1() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(IdiotBothWayShot,IdiotBothWayShot1Movie) as IdiotBothWayShot;
      }
      
      public static function GetFreeShot2() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(IdiotBothWayShot,IdiotBothWayShot2Movie) as IdiotBothWayShot;
      }
      
      public static function GetFreeShot3() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(IdiotBothWayShot,IdiotBothWayShot3Movie) as IdiotBothWayShot;
      }
      
      public static function GetFreeShot4() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(IdiotBothWayShot,IdiotBothWayShot4Movie) as IdiotBothWayShot;
      }
      
      public static function GetFreeShot5() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(IdiotBothWayShot,IdiotBothWayShot5Movie) as IdiotBothWayShot;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         if(iXpos < 0)
         {
         }
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         if(isBothWayShot)
         {
            gotoAndStop(2);
         }
         return true;
      }
   }
}

