package com.aurora.ui.maogoutd.resource.shot.Libra
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   
   public class LibraBothWayShot extends a_4348
   {
      
      private static var m_arrLibra:Array = new Array();
      
      public function LibraBothWayShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1304 = 65563;
         a_1587 = 2;
         a_1573 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         var stWaterDropsShot:LibraBothWayShot = m_arrLibra.pop();
         if(null == stWaterDropsShot)
         {
            stWaterDropsShot = new LibraBothWayShot();
         }
         return stWaterDropsShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return LibraBothWayShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         if(iXpos < 0)
         {
         }
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         if(isBothWayShot)
         {
            gotoAndStop(7);
         }
         return true;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == m_arrLibra.indexOf(this))
         {
            m_arrLibra.push(this);
         }
         return true;
      }
   }
}

