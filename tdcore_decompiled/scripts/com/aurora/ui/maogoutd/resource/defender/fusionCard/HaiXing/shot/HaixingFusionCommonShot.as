package com.aurora.ui.maogoutd.resource.defender.fusionCard.HaiXing.shot
{
   import com.aurora.ui.maogoutd.base.PoolManager;
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.GameMovieClip;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.defender.fusionCard.HaiXing.HaixingFusionDefence;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class HaixingFusionCommonShot extends a_4348
   {
      
      public var m_SputterHurtRate:Number = 0;
      
      private var m_iTransIndex:int = 0;
      
      public function HaixingFusionCommonShot()
      {
         super();
         a_1573 = 1;
      }
      
      public static function a_4344(transIndex:int = 0) : HaixingFusionCommonShot
      {
         var bindMovie:Class = shotBindMovieForTrans(transIndex);
         var stShot:HaixingFusionCommonShot = PoolManager.getInstance().CheckOutOne(HaixingFusionCommonShot,bindMovie) as HaixingFusionCommonShot;
         stShot.m_iTransIndex = transIndex;
         return stShot;
      }
      
      private static function shotBindMovieForTrans(transIndex:int) : Class
      {
         switch(transIndex)
         {
            case 1:
               return HaixingFusionDeepShotMovie;
            case 2:
               return HaixingFusionSoulShotMovie;
            case 0:
         }
         return HaixingFusionPrimaryShotMovie;
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
         a_1577 = true;
         m_isCanCrossFireAuxiliary = false;
         m_isCanBounceByAuxiliary = true;
         m_isChangeYGridNo = true;
         this.ApplyFiveDirectionSpeed();
         return true;
      }
      
      private function ApplyFiveDirectionSpeed() : void
      {
         switch(m_isSpecial)
         {
            case 1:
               m_numYSpeed = 0;
               m_numXSpeed = -1 * Math.abs(m_numXSpeed);
               break;
            case 2:
               m_numYSpeed = -1 * Math.abs(m_numXSpeed);
               m_numXSpeed = 0;
               break;
            case 3:
               m_numYSpeed = 1 * Math.abs(m_numXSpeed);
               m_numXSpeed = 0;
               break;
            case 4:
               m_numXSpeed = Math.SQRT1_2 * Math.abs(m_numXSpeed);
               m_numYSpeed = -1 * Math.SQRT1_2 * Math.abs(m_numXSpeed);
               break;
            case 5:
               m_numXSpeed = Math.SQRT1_2 * Math.abs(m_numXSpeed);
               m_numYSpeed = 1 * Math.SQRT1_2 * Math.abs(m_numXSpeed);
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
         var finalHurt:Number = NaN;
         if(y < 0 || y >= BattleFieldView.a_1014)
         {
            if(this.m_iTransIndex == 2 && (m_isSpecial == 4 || m_isSpecial == 5))
            {
               finalHurt = GetFinalDamage();
               HaixingFusionDefence.addFollowingShot(a_1584,x,y,Math.max(Math.abs(m_numXSpeed),Math.abs(m_numYSpeed)),finalHurt,this.m_iTransIndex);
            }
            m_bActive.Value = false;
            this.a_3940();
            return true;
         }
         if(x < 0 || x >= BattleFieldView.a_1013)
         {
            m_bActive.Value = false;
            this.a_3940();
            return true;
         }
         return false;
      }
      
      override protected function SputterHurt(stHitenFieldGrid:a_3491, stHitenMouseIntruder:a_4206) : void
      {
         var stMouseIntruder:a_4206 = null;
         if(this.m_iTransIndex == 0 || stHitenFieldGrid == null)
         {
            return;
         }
         var finalHurt:Number = GetFinalDamage();
         var iSplashHurt:int = int(finalHurt * this.m_SputterHurtRate);
         var arrMouveIntruder:Array = stHitenFieldGrid.a_1511.slice();
         for each(stMouseIntruder in arrMouveIntruder)
         {
            if(stMouseIntruder != stHitenMouseIntruder && !stMouseIntruder.isCannotSeeByFighter && (0 == stMouseIntruder.iSpaceState || 2 == stMouseIntruder.iSpaceState))
            {
               stMouseIntruder.a_4209(iSplashHurt);
            }
         }
      }
      
      override protected function a_3940() : Boolean
      {
         this.m_iTransIndex = 0;
         return super.a_3940();
      }
   }
}

