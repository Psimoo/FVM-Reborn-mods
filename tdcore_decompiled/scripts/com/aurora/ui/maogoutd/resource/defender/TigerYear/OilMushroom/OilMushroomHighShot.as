package com.aurora.ui.maogoutd.resource.defender.TigerYear.OilMushroom
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class OilMushroomHighShot extends a_4348
   {
      
      public function OilMushroomHighShot()
      {
         super();
         a_1587 = 1;
         a_1279 = -width * 0.5;
         a_1573 = 1;
         a_1577 = false;
         a_1588 = true;
      }
      
      public static function a_4344() : a_4348
      {
         var stBaseShot:a_4348 = PoolManager.getInstance().CheckOutOne(OilMushroomHighShot,OilMushroomHighShotMovie) as OilMushroomHighShot;
         BattleFieldView.a_1017.play();
         return stBaseShot;
      }
      
      public static function GetFreeShot1() : a_4348
      {
         var stBaseShot:a_4348 = PoolManager.getInstance().CheckOutOne(OilMushroomHighShot,OilMushroomHighShot1Movie) as OilMushroomHighShot;
         BattleFieldView.a_1017.play();
         return stBaseShot;
      }
      
      public static function GetFreeShot2() : a_4348
      {
         var stBaseShot:a_4348 = PoolManager.getInstance().CheckOutOne(OilMushroomHighShot,OilMushroomHighShot2Movie) as OilMushroomHighShot;
         BattleFieldView.a_1017.play();
         return stBaseShot;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         m_isShotHighSkySpace = true;
         a_1577 = false;
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

