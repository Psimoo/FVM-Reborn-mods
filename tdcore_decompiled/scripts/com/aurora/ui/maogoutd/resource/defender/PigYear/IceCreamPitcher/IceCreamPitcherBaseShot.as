package com.aurora.ui.maogoutd.resource.defender.PigYear.IceCreamPitcher
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class IceCreamPitcherBaseShot extends a_4348
   {
      
      private var a_1595:a_4206;
      
      private var a_1596:int;
      
      public function IceCreamPitcherBaseShot()
      {
         super();
         a_1573 = 1;
         a_1576 = true;
         a_1588 = true;
         a_1275 = 1;
         a_1587 = 2;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(IceCreamPitcherBaseShot,IceCreamPitcherBaseShotMovie) as IceCreamPitcherBaseShot;
      }
      
      public static function GetFreeShot1() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(IceCreamPitcherBaseShot,IceCreamPitcherBaseShot1Movie) as IceCreamPitcherBaseShot;
      }
      
      public static function GetFreeShot2() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(IceCreamPitcherBaseShot,IceCreamPitcherBaseShot2Movie) as IceCreamPitcherBaseShot;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         if(a_1580 == 1)
         {
            a_1279 = -20;
         }
         else
         {
            a_1279 = -70;
         }
         trace("m_iXDisplayCenterPos:" + a_1279);
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.a_1595 = null;
         this.a_1596 = -1;
         return true;
      }
   }
}

