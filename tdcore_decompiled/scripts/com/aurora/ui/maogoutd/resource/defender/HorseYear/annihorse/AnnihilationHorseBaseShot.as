package com.aurora.ui.maogoutd.resource.defender.HorseYear.annihorse
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class AnnihilationHorseBaseShot extends a_4348
   {
      
      public function AnnihilationHorseBaseShot()
      {
         super();
         a_1279 = -24;
         m_iYDisplayCenterPos = -5;
         a_1573 = 1;
         a_1588 = true;
         a_1587 = 1;
         a_1275 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(AnnihilationHorseBaseShot) as AnnihilationHorseBaseShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return AnnihilationHorseBaseShotMovie;
      }
      
      override protected function a_4349() : Boolean
      {
         return false;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         rotationY = 0;
         a_1577 = true;
         m_isCanCrossFireAuxiliary = true;
         m_isCanBounceByAuxiliary = true;
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
         if(a_1578)
         {
            if(!FollowingShotHandle())
            {
               return;
            }
         }
         x += m_numXSpeed;
      }
      
      override protected function ReboundHandler() : void
      {
         rotationY = rotationY == -180 ? 0 : -180;
      }
      
      override protected function onHitHandler(stFieldGrid:a_3491, stMoveIntruder:a_4206) : void
      {
         super.onHitHandler(stFieldGrid,stMoveIntruder);
      }
      
      override protected function checkCanHit(stMoveIntruder:a_4206) : Boolean
      {
         if(stMoveIntruder.isCannotSeeByFighter || stMoveIntruder.iLifeValue <= 0 || !stMoveIntruder.m_stCurrentFieldGrid)
         {
            return false;
         }
         if(stMoveIntruder.iSpaceState == 0)
         {
            return true;
         }
         return false;
      }
   }
}

