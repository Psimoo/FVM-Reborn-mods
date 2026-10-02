package com.aurora.ui.maogoutd.resource.defender.fusionCard.oilMushroom.shot
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class OilMushroomPrimaryLowShot extends a_4348
   {
      
      public function OilMushroomPrimaryLowShot()
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
         var stOilMushroomPrimaryLowShot:OilMushroomPrimaryLowShot = PoolManager.getInstance().CheckOutOne(OilMushroomPrimaryLowShot) as OilMushroomPrimaryLowShot;
         stOilMushroomPrimaryLowShot.m_isShotHighSkySpace = false;
         return stOilMushroomPrimaryLowShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return OilMushroomPrimaryLowShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1577 = true;
         rotationY = numSpeed < 0 ? -180 : 0;
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
      
      override protected function ReboundHandler() : void
      {
         rotationY = rotationY == -180 ? 0 : -180;
      }
   }
}

