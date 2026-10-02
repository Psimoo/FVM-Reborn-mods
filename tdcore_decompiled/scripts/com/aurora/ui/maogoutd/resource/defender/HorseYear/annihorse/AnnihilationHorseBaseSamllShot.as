package com.aurora.ui.maogoutd.resource.defender.HorseYear.annihorse
{
   import a_4718.b_183;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class AnnihilationHorseBaseSamllShot extends a_4348
   {
      
      public function AnnihilationHorseBaseSamllShot()
      {
         super();
         a_1587 = 2;
         a_1279 = 0;
         m_iYDisplayCenterPos = 0;
         a_1573 = 1;
         a_1588 = true;
         a_1304 = b_183.enm_AnnihilationHorseBaseSamllShot;
      }
      
      public static function a_4344() : a_4348
      {
         BattleFieldView.a_1017.play();
         return PoolManager.getInstance().CheckOutOne(AnnihilationHorseBaseSamllShot) as AnnihilationHorseBaseSamllShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return AnnihilationHorseBaseSamllShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         a_1577 = false;
         m_isCanCrossFireAuxiliary = false;
         m_isCanBounceByAuxiliary = false;
         this.ApplySplitDirection(m_isSpecial,numSpeed);
         a_1275 = 1;
         gotoAndStop(2);
         m_isPenetrate = true;
         return true;
      }
      
      protected function ApplySplitDirection(type:int, baseSpeed:Number) : void
      {
         var s:Number = NaN;
         s = Math.abs(baseSpeed);
         m_isChangeYGridNo = true;
         switch(type)
         {
            case 0:
               rotation = 0;
               m_numXSpeed = s;
               m_numYSpeed = 0;
               m_isChangeYGridNo = false;
               break;
            case 1:
               rotation = 270;
               m_numXSpeed = 0;
               m_numYSpeed = -s;
               break;
            case 2:
               rotation = 90;
               m_numXSpeed = 0;
               m_numYSpeed = s;
               break;
            case 3:
               rotation = 315;
               m_numXSpeed = s * Math.SQRT1_2;
               m_numYSpeed = -s * Math.SQRT1_2;
               break;
            case 4:
               rotation = 45;
               m_numXSpeed = s * Math.SQRT1_2;
               m_numYSpeed = s * Math.SQRT1_2;
         }
         if(baseSpeed < 0)
         {
            rotation = 180 - rotation;
            m_numXSpeed = -m_numXSpeed;
         }
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
            FollowingShotHandle();
         }
         x += m_numXSpeed;
         y += m_numYSpeed;
      }
      
      override protected function CalculationBoundary() : Boolean
      {
         if(x < -10 || x >= BattleFieldView.a_1013 + 10)
         {
            m_bActive.Value = false;
            a_3940();
            return true;
         }
         if(y < -10 || y > BattleFieldView.a_1014 + 10)
         {
            m_bActive.Value = false;
            a_3940();
            return true;
         }
         return false;
      }
      
      override protected function checkCanHit(stMoveIntruder:a_4206) : Boolean
      {
         if(m_iCanHitGostMouse && BattleFieldView.m_GostMouse.indexOf(stMoveIntruder.m_stMoveIntruderTypeID) != -1)
         {
            return true;
         }
         var space:int = stMoveIntruder.iSpaceState;
         if(space == 0 && !stMoveIntruder.isCannotSeeByFighter)
         {
            return true;
         }
         if(space == 2)
         {
            return true;
         }
         return false;
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

