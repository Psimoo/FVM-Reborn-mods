package com.aurora.ui.maogoutd.resource.shot.boss
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.avatar.a_3924;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class BaseBossShot extends a_4348
   {
      
      protected var m_bIsInvincible:Boolean;
      
      private var m_fYShift:Number;
      
      private var m_iCurFrameLabelIndex:int;
      
      public function BaseBossShot()
      {
         super();
         this.fYShift = 0;
         this.InitData();
      }
      
      public function get fYShift() : Number
      {
         return this.m_fYShift;
      }
      
      public function set fYShift(fValue:Number) : void
      {
         this.m_fYShift = fValue;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos + this.fYShift,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier);
         this.InitData();
         return true;
      }
      
      protected function InitData() : void
      {
         m_numXSpeed = -m_numXSpeed;
         this.m_bIsInvincible = false;
         m_isHited = false;
         a_1588 = true;
         this.m_iCurFrameLabelIndex = 0;
         a_1275 = 0;
         a_1587 = 1;
         gotoAndStop(1);
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(iCurrentTime & 1)
         {
            return;
         }
         if(m_isHited)
         {
            nextFrame();
            if(a_1273 == a_1274)
            {
               a_3940();
            }
            return;
         }
         if(a_1588)
         {
            nextFrame();
            if(a_1273 == a_1274 || null != a_1278)
            {
               this.GotoAndStopFrame(a_1275);
            }
         }
         if(0 == a_1447)
         {
            a_1447 = iCurrentTime;
         }
         x += m_numXSpeed;
         y += m_numYSpeed;
         this.CheckShotState();
      }
      
      protected function GotoAndStopFrame(iFrame:uint, bIsNeed:Boolean = true) : void
      {
         if(!bIsNeed && this.m_iCurFrameLabelIndex == iFrame)
         {
            return;
         }
         this.m_iCurFrameLabelIndex = iFrame;
         var iFrameLabelStartIndex:int = (a_1276[iFrame] as FrameLabel).frame;
         gotoAndStop(iFrameLabelStartIndex);
         a_3419();
      }
      
      protected function CheckShotState() : void
      {
         if(x < 0 || x >= BattleFieldView.a_1013 || y > a_3491.a_1081 * (m_iYGridNo + 1))
         {
            a_3940();
            return;
         }
         var iXGridNo:int = int(x / a_3491.a_1080);
         var iYGridNo:int = int((y - this.fYShift) / a_3491.a_1081);
         this.ClearFieldGrid(iXGridNo,iYGridNo);
      }
      
      public function IsCanLanuch(stFieldGrid:a_3491) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         return null != stFieldGrid.m_stProtector || null != stFieldGrid.m_stTrayDefense || null != stFieldGrid.m_stBoomDefense || null != stFieldGrid.m_stFlowerDefense || null != stFieldGrid.m_stBaseAuxiliaryFighter || null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924);
      }
      
      protected function ClearFieldGrid(iXGridNo:int, iYGridNo:int, isCleanTray:Boolean = false) : void
      {
         var stFieldGrid:a_3491 = a_1583.a_3438(iXGridNo,iYGridNo);
         if(this.IsCanLanuch(stFieldGrid))
         {
            this.a_3502(stFieldGrid,isCleanTray);
         }
      }
      
      protected function a_3502(stFieldGrid:a_3491, isCleanTray:Boolean = false) : Boolean
      {
         if(null == stFieldGrid)
         {
            return false;
         }
         m_isHited = !this.m_bIsInvincible;
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
         }
         if(null != stFieldGrid.m_stAttackFighter && !(stFieldGrid.m_stAttackFighter is a_3924))
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         stFieldGrid.DamageNewSlot(true,0,true,0,1);
         if(isCleanTray && null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
         return true;
      }
   }
}

