package com.aurora.ui.maogoutd.resource.defender.HorseYear.evilAvocado.shot
{
   import a_4718.b_182;
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.GameMovieClip;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class EvilAvocadoCommonShot extends a_4348
   {
      
      private var m_iTransIndex:int = 0;
      
      public function EvilAvocadoCommonShot()
      {
         super();
         a_1573 = 1;
         a_1275 = 0;
         a_1587 = 0;
         a_1279 = -8;
         m_iYDisplayCenterPos = -11;
         a_1588 = true;
      }
      
      public static function a_4344(transIndex:int = 0) : EvilAvocadoCommonShot
      {
         var bindMovie:Class = shotBindMovieForTrans(transIndex);
         var stShot:EvilAvocadoCommonShot = PoolManager.getInstance().CheckOutOne(EvilAvocadoCommonShot,bindMovie) as EvilAvocadoCommonShot;
         stShot.m_iTransIndex = transIndex;
         return stShot;
      }
      
      private static function shotBindMovieForTrans(transIndex:int) : Class
      {
         switch(transIndex)
         {
            case 1:
               return EvilAvocadoFirstShotMovie;
            case 2:
               return EvilAvocadoSecondShotMovie;
            case 0:
         }
         return EvilAvocadoBaseShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         var m_stMoveClip:GameMovieClip = null;
         m_stMoveClip = a_3913() as GameMovieClip;
         if(m_stMoveClip)
         {
            a_1279 = m_stMoveClip.a_1279;
            m_iYDisplayCenterPos = m_stMoveClip.m_iYDisplayCenterPos;
         }
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         m_numXSpeed = numSpeed;
         rotationY = 0;
         a_1577 = true;
         m_isPenetrate = true;
         m_isCanCrossFireAuxiliary = false;
         m_isChangeYGridNo = true;
         this.ApplyThreeDirectionSpeed();
         return true;
      }
      
      private function ApplyThreeDirectionSpeed() : void
      {
         var numAbsSpeed:Number = Math.abs(m_numXSpeed);
         switch(m_isSpecial)
         {
            case 1:
               m_numYSpeed = 0;
               m_numXSpeed = 1 * Math.abs(m_numXSpeed);
               rotation = 0;
               break;
            case 4:
               m_numXSpeed = Math.SQRT1_2 * Math.abs(m_numXSpeed);
               m_numYSpeed = -1 * Math.SQRT1_2 * Math.abs(m_numXSpeed);
               rotation = -45;
               break;
            case 5:
               m_numXSpeed = Math.SQRT1_2 * Math.abs(m_numXSpeed);
               m_numYSpeed = 1 * Math.SQRT1_2 * Math.abs(m_numXSpeed);
               rotation = 45;
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
               this.a_3940();
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
         y += m_numYSpeed;
      }
      
      override protected function CalculationBoundary() : Boolean
      {
         if(x < 0 || x >= BattleFieldView.a_1013)
         {
            m_bActive.Value = false;
            this.a_3940();
            return true;
         }
         if(y <= -10 || y >= BattleFieldView.a_1014 + 10)
         {
            m_bActive.Value = false;
            this.a_3940();
            return true;
         }
         return false;
      }
      
      override protected function checkCanHit(stMoveIntruder:a_4206) : Boolean
      {
         if(!stMoveIntruder || stMoveIntruder.iLifeValue <= 0)
         {
            return false;
         }
         if(m_HitMouseArray.indexOf(stMoveIntruder) != -1)
         {
            return false;
         }
         if(stMoveIntruder.isCannotSeeByFighter)
         {
            return false;
         }
         if(stMoveIntruder.iSpaceState == 1)
         {
            return false;
         }
         return true;
      }
      
      override public function a_4352(baseMoveIntruder:a_4206) : Boolean
      {
         super.a_4352(baseMoveIntruder);
         if(baseMoveIntruder.m_stCurrentFieldGrid == null || baseMoveIntruder.iLifeValue <= 0 || baseMoveIntruder.parent == null)
         {
            return false;
         }
         if(this.m_iTransIndex > 0)
         {
            baseMoveIntruder.a_4208(b_182.a_433,15);
         }
         return true;
      }
      
      override protected function ReboundHandler() : void
      {
         if(m_isSpecial == 4 || m_isSpecial == 5)
         {
            rotation += 180;
         }
         else
         {
            rotationY = rotationY == -180 ? 0 : -180;
         }
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         this.m_iTransIndex = 0;
         return true;
      }
   }
}

