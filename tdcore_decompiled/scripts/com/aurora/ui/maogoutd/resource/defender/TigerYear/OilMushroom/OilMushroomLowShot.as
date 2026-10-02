package com.aurora.ui.maogoutd.resource.defender.TigerYear.OilMushroom
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class OilMushroomLowShot extends a_4348
   {
      
      public var m_isHighShot:Boolean;
      
      public function OilMushroomLowShot()
      {
         super();
         a_1279 = -width * 0.5;
         a_1573 = 1;
         a_1576 = false;
         a_1577 = true;
         a_1588 = true;
         a_1275 = 0;
         a_1587 = 1;
      }
      
      public static function a_4344() : a_4348
      {
         var stOilMushroomLowShot:OilMushroomLowShot = PoolManager.getInstance().CheckOutOne(OilMushroomLowShot,OilMushroomLowShotMovie) as OilMushroomLowShot;
         stOilMushroomLowShot.m_isShotHighSkySpace = false;
         return stOilMushroomLowShot;
      }
      
      public static function GetFreeShot1() : a_4348
      {
         var stOilMushroomLowShot:OilMushroomLowShot = PoolManager.getInstance().CheckOutOne(OilMushroomLowShot,OilMushroomLowShot1Movie) as OilMushroomLowShot;
         stOilMushroomLowShot.m_isShotHighSkySpace = false;
         return stOilMushroomLowShot;
      }
      
      public static function GetFreeShot2() : a_4348
      {
         var stOilMushroomLowShot:OilMushroomLowShot = null;
         stOilMushroomLowShot = PoolManager.getInstance().CheckOutOne(OilMushroomLowShot,OilMushroomLowShot2Movie) as OilMushroomLowShot;
         stOilMushroomLowShot.m_isShotHighSkySpace = false;
         return stOilMushroomLowShot;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1577 = true;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited && !m_isPenetrate)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               m_bActive.Value = false;
               a_3940();
            }
            return;
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
               gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
            }
         }
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
         a_4351();
         x += m_numXSpeed;
      }
   }
}

