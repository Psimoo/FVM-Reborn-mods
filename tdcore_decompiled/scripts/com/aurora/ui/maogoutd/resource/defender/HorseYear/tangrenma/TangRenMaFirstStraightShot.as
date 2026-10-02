package com.aurora.ui.maogoutd.resource.defender.HorseYear.tangrenma
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class TangRenMaFirstStraightShot extends a_4348
   {
      
      public function TangRenMaFirstStraightShot()
      {
         super();
         a_1279 = -34;
         m_iYDisplayCenterPos = -8;
         a_1573 = 1;
         a_1275 = 0;
         a_1587 = 0;
         a_1588 = true;
      }
      
      public static function a_4344() : a_4348
      {
         return PoolManager.getInstance().CheckOutOne(TangRenMaFirstStraightShot) as a_4348;
      }
      
      override protected function getBindMovie() : Class
      {
         return TangRenMaFirstStraightShotMovie;
      }
      
      override protected function a_3940() : Boolean
      {
         rotationY = 0;
         rotationX = 0;
         return super.a_3940();
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         a_1577 = true;
         rotationY = numSpeed < 0 ? -180 : 0;
         m_isPenetrate = true;
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         super.a_4216(iCurrentTime);
      }
      
      override protected function CalculationBoundary() : Boolean
      {
         if(x < 0 || x >= BattleFieldView.a_1013 || a_1576 && y > a_3491.a_1081 * (m_iYGridNo + 1))
         {
            m_bActive.Value = false;
            this.a_3940();
            return true;
         }
         return false;
      }
      
      override protected function ReboundHandler() : void
      {
         rotationY = rotationY == -180 ? 0 : -180;
      }
      
      override protected function checkCanHit(stMoveIntruder:a_4206) : Boolean
      {
         if(stMoveIntruder.isCannotSeeByFighter)
         {
            return false;
         }
         var space:int = stMoveIntruder.iSpaceState;
         if(space == 1 && space == 3)
         {
            return false;
         }
         return true;
      }
      
      override protected function onHitHandler(stFieldGrid:a_3491, stMoveIntruder:a_4206) : void
      {
         if(Boolean(a_1583) && a_1583.isOwnBattleField)
         {
            BattleFieldView.a_1045.play();
         }
         a_4352(stMoveIntruder);
         SputterHurt(stFieldGrid,stMoveIntruder);
         m_isHited = true;
         if(a_1276.length > 0)
         {
            gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
         }
      }
   }
}

