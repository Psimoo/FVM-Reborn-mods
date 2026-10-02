package com.aurora.ui.maogoutd.resource.shot.goldLibra
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class GoldLibraBothWayShotThird extends a_4348
   {
      
      private static var m_arrLibra:Array = new Array();
      
      private var m_stLastFieldGrid:a_3491;
      
      private var isShowEffect:Boolean = false;
      
      public function GoldLibraBothWayShotThird()
      {
         super();
         a_1279 = -width * 0.5;
         a_1587 = 3;
         a_1573 = 1;
         a_1275 = 0;
      }
      
      public static function a_4344() : a_4348
      {
         var stWaterDropsShot:GoldLibraBothWayShotThird = m_arrLibra.pop();
         if(null == stWaterDropsShot)
         {
            stWaterDropsShot = new GoldLibraBothWayShotThird();
         }
         return stWaterDropsShot;
      }
      
      override protected function getBindMovie() : Class
      {
         return GoldLibraBothWayShotThirdMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         if(iXpos < 0)
         {
         }
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         a_1275 = ms_iCritFrameLable;
         a_1588 = true;
         gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         if(isBothWayShot)
         {
            this.isShowEffect = true;
            a_1275 = ms_iCritFrameLable + 0;
            gotoAndStop((a_1276[a_1275] as FrameLabel).frame);
         }
         this.m_stLastFieldGrid = null;
         return true;
      }
      
      override protected function addFireShot(stLastWaitShot:a_4348, stFieldGrid:a_3491) : Boolean
      {
         var isBothWayShot:Boolean = false;
         if(null != stLastWaitShot)
         {
            isBothWayShot = false;
            if(a_1283 && m_numXSpeed > 0 || !a_1283 && m_numXSpeed < 0)
            {
               isBothWayShot = true;
            }
            stLastWaitShot.a_1797(0,15,a_1579,x,y,a_1583,stFieldGrid,isBothWayShot,a_1325);
            ApplyFireShotExtraProperty(stLastWaitShot);
            parent.addChild(stLastWaitShot);
            m_bActive.Value = false;
            this.a_3940();
            if(Boolean(a_1583) && a_1583.isOwnBattleField)
            {
               BattleFieldView.a_1029.play();
            }
            return true;
         }
         return false;
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         ms_iCritFrameLable = 0;
         if(-1 == m_arrLibra.indexOf(this))
         {
            m_arrLibra.push(this);
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         var numYMove:Number = NaN;
         if(m_isHited)
         {
            nextFrame();
            if(a_1273 == a_1274 || a_1278 != null)
            {
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
         this.a_4351();
         if(x < 0 || x > BattleFieldView.a_1013)
         {
            this.a_3940();
            return;
         }
         if(a_1578)
         {
            if(!FollowingShotHandle())
            {
               return;
            }
         }
         x += m_numXSpeed;
         if(2 == a_1582 && y > a_1586 - a_3491.a_1081 * 0.9)
         {
            y += m_numYSpeed;
         }
         else if(3 == a_1582 && y < a_1586 + a_3491.a_1081 * 0.9)
         {
            y += m_numYSpeed;
         }
         else if(5 == a_1582 || 6 == a_1582)
         {
            y += m_numYSpeed;
         }
         if(7 == a_1582 && y > a_1586 - a_3491.a_1081 * 1.9)
         {
            y += m_numYSpeed;
         }
         else if(8 == a_1582 && y < a_1586 + a_3491.a_1081 * 1.9)
         {
            y += m_numYSpeed;
         }
         else if(a_1582 > 1)
         {
            a_1577 = true;
         }
         if(a_1576)
         {
            numYMove = 2 * m_numYSpeed * (iCurrentTime - a_1447) / a_1581 - m_numYSpeed;
            y += numYMove > 30 ? 30 : numYMove;
         }
      }
      
      override protected function a_4351() : void
      {
         var iXGridNo:int = 0;
         var arrMoveIntruder:Array = null;
         var stMoveIntruder:a_4206 = null;
         var iArrMoveIntruderLength:int = 0;
         var stFieldGrid:a_3491 = null;
         var numHotMultiplier:Number = NaN;
         var stLastWaitShot:a_4348 = null;
         var numMoveSpeedMultiplier:Number = NaN;
         var i:int = 0;
         var stOilBottleBoomEffect:GoldLibraBothBoomEffect = null;
         var yStart:int = 0;
         var xStart:int = 0;
         var yEnd:int = 0;
         var xEnd:int = 0;
         var xIndex:int = 0;
         var yIndex:int = 0;
         var newFieldGrid0:a_3491 = null;
         var newFieldGrid1:a_3491 = null;
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         var iYGridNo:int = m_iYGridNo;
         stFieldGrid = a_1583.a_3438(iXGridNo,iYGridNo);
         if(stFieldGrid == null)
         {
            return;
         }
         var stFieldGridClean:a_3491 = a_1583.a_3438(iXGridNo,iYGridNo);
         if(Boolean(stFieldGridClean) && stFieldGridClean != this.m_stLastFieldGrid)
         {
            this.m_stLastFieldGrid = stFieldGridClean;
            numHotMultiplier = 0;
            if(this.m_stLastFieldGrid.m_stBaseAuxiliaryFighter)
            {
               numHotMultiplier = this.m_stLastFieldGrid.m_stBaseAuxiliaryFighter.numHotMultiplier;
            }
            if(numHotMultiplier > 1 && null != this.m_stLastFieldGrid.m_stBaseAuxiliaryFighter && !this.m_stLastFieldGrid.m_stBaseAuxiliaryFighter.m_isShowFrozen)
            {
               if(numHotMultiplier > a_1325)
               {
                  if(ms_iCritFrameLable == 0)
                  {
                     stLastWaitShot = JudgePassFireTower(stFieldGrid,numHotMultiplier);
                     if(this.addFireShot(stLastWaitShot,stFieldGrid))
                     {
                        return;
                     }
                  }
               }
            }
         }
         if(stFieldGrid.m_stBaseAuxiliaryFighter != null && !stFieldGrid.m_stBaseAuxiliaryFighter.m_isShowFrozen)
         {
            numMoveSpeedMultiplier = stFieldGrid.m_stBaseAuxiliaryFighter.numMoveSpeedMultiplier;
            if(numMoveSpeedMultiplier != 1 && m_numMoveSpeedMultiplier == 1)
            {
               m_numMoveSpeedMultiplier = numMoveSpeedMultiplier;
               m_numXSpeed *= m_numMoveSpeedMultiplier;
               m_numYSpeed *= m_numMoveSpeedMultiplier;
               JudgeAddPowerByAuxiliaryFighter(stFieldGrid);
            }
         }
         if(!a_1576 && !m_isShotHighSkySpace && (1 == stFieldGrid.m_iFieldGridType || 4 == stFieldGrid.m_iFieldGridType))
         {
            m_isHited = true;
            this.a_3940();
            return;
         }
         if(stFieldGrid.m_isOccupy)
         {
            arrMoveIntruder = stFieldGrid.a_1511.slice();
            if(stFieldGrid.m_stCurrentBattbleFieldView.iIntruderMoveDirection > 0)
            {
               arrMoveIntruder.sortOn("x",Array.DESCENDING | Array.NUMERIC);
            }
            else
            {
               arrMoveIntruder.sortOn("x",Array.NUMERIC);
            }
            iArrMoveIntruderLength = int(arrMoveIntruder.length);
            for(i = 0; i < iArrMoveIntruderLength; i++)
            {
               stMoveIntruder = arrMoveIntruder[i];
               if(!stMoveIntruder.isCannotSeeByFighter && (!m_isShotHighSkySpace && (0 == stMoveIntruder.iSpaceState || 2 == stMoveIntruder.iSpaceState && a_1576) || 3 == stMoveIntruder.iSpaceState && m_isShotHighSkySpace) && hitTestObject(stMoveIntruder))
               {
                  if(Boolean(a_1583) && a_1583.isOwnBattleField)
                  {
                     BattleFieldView.a_1045.play();
                  }
                  a_4352(stMoveIntruder);
                  m_isHited = true;
                  if(a_1276.length > 0)
                  {
                     gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
                  }
                  if(ms_iCritFrameLable == 1)
                  {
                     stOilBottleBoomEffect = GoldLibraBothBoomEffect.a_3926();
                     stOilBottleBoomEffect.a_1797(stFieldGrid,stFieldGrid.m_stCurrentBattbleFieldView);
                     yStart = stFieldGrid.m_iYGridNo - 1 < 0 ? 0 : int(stFieldGrid.m_iYGridNo - 1);
                     xStart = stFieldGrid.m_iXGridNo - 1 < 0 ? 0 : int(stFieldGrid.m_iXGridNo - 1);
                     yEnd = stFieldGrid.m_iYGridNo + 1 >= BattleFieldView.a_1012 ? int(BattleFieldView.a_1012 - 1) : int(stFieldGrid.m_iYGridNo + 1);
                     xEnd = stFieldGrid.m_iXGridNo + 1 >= BattleFieldView.a_1011 ? int(BattleFieldView.a_1011 - 1) : int(stFieldGrid.m_iXGridNo + 1);
                     for(xIndex = xStart; xIndex <= xEnd; xIndex++)
                     {
                        newFieldGrid0 = a_1583.a_3438(xIndex,stFieldGrid.m_iYGridNo);
                        for each(stMoveIntruder in newFieldGrid0.a_1511.slice())
                        {
                           stMoveIntruder.a_3969(int(GetFinalDamage() * 3));
                        }
                     }
                     for(yIndex = yStart; yIndex <= yEnd; yIndex++)
                     {
                        newFieldGrid1 = a_1583.a_3438(stFieldGrid.m_iXGridNo,yIndex);
                        for each(stMoveIntruder in newFieldGrid1.a_1511.slice())
                        {
                           stMoveIntruder.a_3969(int(GetFinalDamage() * 3));
                        }
                     }
                  }
                  return;
               }
            }
         }
      }
   }
}

