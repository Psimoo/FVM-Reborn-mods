package com.aurora.ui.maogoutd.resource.defender.RabbitYear.ChakratRabbit
{
   import com.aurora.ui.maogoutd.game.BattleFieldView;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.a_4206;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import flash.display.FrameLabel;
   
   public class ChakratRabbitBaseShot extends a_4348
   {
      
      private static var ms_stChakratRabbitBaseshotVector:Array = new Array();
      
      public function ChakratRabbitBaseShot()
      {
         super();
         a_1279 = -80;
         m_iYDisplayCenterPos = 11 - 30;
         a_1573 = 1;
         a_1588 = true;
         scaleX = scaleY = 0.6;
      }
      
      public static function a_4344() : a_4348
      {
         var stChakratRabbitBaseshot:ChakratRabbitBaseShot = ms_stChakratRabbitBaseshotVector.pop();
         if(null == stChakratRabbitBaseshot)
         {
            stChakratRabbitBaseshot = new ChakratRabbitBaseShot();
         }
         return stChakratRabbitBaseshot;
      }
      
      override protected function getBindMovie() : Class
      {
         return ChakratRabbitBaseShotMovie;
      }
      
      override public function a_1797(iGlobalID:int, numSpeed:Number, iHurtPower:int, iXpos:int, iYpos:int, stCurrentBattleView:BattleFieldView, stStartFieldGrid:a_3491, isBothWayShot:Boolean = false, numHotMultiplier:Number = 1, iThreeRowShotType:int = 0) : Boolean
      {
         super.a_1797(iGlobalID,numSpeed,iHurtPower,iXpos,iYpos,stCurrentBattleView,stStartFieldGrid,isBothWayShot,numHotMultiplier,iThreeRowShotType);
         m_numXSpeed = numSpeed;
         a_1577 = true;
         m_isPenetrate = true;
         switch(m_isSpecial)
         {
            case 0:
               m_numYSpeed = 0;
               m_numXSpeed = -1 * Math.abs(m_numXSpeed);
               rotation = 180;
               break;
            case 1:
               m_numYSpeed = -1 * Math.abs(m_numXSpeed);
               m_numXSpeed = 0;
               rotation = 270;
               break;
            case 2:
               m_numYSpeed = 1 * Math.abs(m_numXSpeed);
               m_numXSpeed = 0;
               rotation = 90;
               break;
            case 3:
               m_numXSpeed = Math.SQRT1_2 * Math.abs(m_numXSpeed);
               m_numYSpeed = -1 * Math.SQRT1_2 * Math.abs(m_numXSpeed);
               rotation = -45;
               break;
            case 4:
               m_numXSpeed = Math.SQRT1_2 * Math.abs(m_numXSpeed);
               m_numYSpeed = 1 * Math.SQRT1_2 * Math.abs(m_numXSpeed);
               rotation = 45;
         }
         return true;
      }
      
      override public function a_4216(iCurrentTime:int) : void
      {
         if(m_isHited)
         {
            if(a_1273 == a_1274)
            {
               this.a_3940();
            }
            nextFrame();
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
         a_1577 = true;
         this.a_4351();
         x += m_numXSpeed;
         y += m_numYSpeed;
      }
      
      override protected function a_4351() : void
      {
         var iXGridNo:int = 0;
         var stFieldGrid:a_3491 = null;
         var arrMoveIntruder:Array = null;
         var iArrMoveIntruderLength:int = 0;
         var stMoveIntruder:a_4206 = null;
         var numMoveSpeedMultiplier:Number = NaN;
         var i:int = 0;
         if(!m_bActive.Value)
         {
            this.a_3940();
            return;
         }
         if(a_1283)
         {
            iXGridNo = BattleFieldView.a_1011 - 1 - int(x / a_3491.a_1080);
         }
         else
         {
            iXGridNo = int(x / a_3491.a_1080);
         }
         var iYGridNo:int = int(y / a_3491.a_1081);
         if(y <= -10 || y >= BattleFieldView.a_1014)
         {
            m_bActive.Value = false;
            this.a_3940();
            return;
         }
         if(x < 0 || x >= BattleFieldView.a_1013 || a_1576 && y > a_3491.a_1081 * (m_iYGridNo + 1))
         {
            m_bActive.Value = false;
            this.a_3940();
            return;
         }
         stFieldGrid = a_1583.a_3438(iXGridNo,iYGridNo);
         if(stFieldGrid == null)
         {
            m_bActive.Value = false;
            this.a_3940();
            return;
         }
         if(!a_1576 && !m_isShotHighSkySpace && (1 == stFieldGrid.m_iFieldGridType || 4 == stFieldGrid.m_iFieldGridType) && !m_isPenetrate)
         {
            m_isHited = true;
            if(a_1276.length > 0)
            {
               gotoAndStop((a_1276[a_1587] as FrameLabel).frame);
            }
            return;
         }
         if(!a_1576 && a_1577 && a_1571 != iXGridNo && a_1584 != stFieldGrid && null != stFieldGrid.m_stBaseAuxiliaryFighter && !stFieldGrid.m_stBaseAuxiliaryFighter.m_isShowFrozen)
         {
            a_1571 = iXGridNo;
            numMoveSpeedMultiplier = stFieldGrid.m_stBaseAuxiliaryFighter.numMoveSpeedMultiplier;
            if(numMoveSpeedMultiplier != 1 && m_numMoveSpeedMultiplier == 1)
            {
               m_numMoveSpeedMultiplier = numMoveSpeedMultiplier;
               m_numXSpeed *= m_numMoveSpeedMultiplier;
               m_numYSpeed *= m_numMoveSpeedMultiplier;
               this.ReboundHandler();
               JudgeAddPowerByAuxiliaryFighter(stFieldGrid);
            }
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
               if(!stMoveIntruder.isCannotSeeByFighter && (0 == stMoveIntruder.iSpaceState || 2 == stMoveIntruder.iSpaceState) && hitTestObject(stMoveIntruder))
               {
                  if(m_isPenetrate && m_HitMouseArray.indexOf(stMoveIntruder) == -1)
                  {
                     if(Boolean(a_1583) && a_1583.isOwnBattleField)
                     {
                        BattleFieldView.a_1045.play();
                     }
                     m_HitMouseArray.push(stMoveIntruder);
                     a_4352(stMoveIntruder);
                     return;
                  }
               }
            }
         }
         if(a_1283)
         {
            stFieldGrid = a_1583.a_3438(iXGridNo + 1,iYGridNo);
         }
         else
         {
            stFieldGrid = a_1583.a_3438(iXGridNo - 1,iYGridNo);
         }
         if(null != stFieldGrid && stFieldGrid.m_isOccupy)
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
               if(!stMoveIntruder.isCannotSeeByFighter && (0 == stMoveIntruder.iSpaceState || 2 == stMoveIntruder.iSpaceState) && hitTestObject(stMoveIntruder))
               {
                  if(m_isPenetrate && m_HitMouseArray.indexOf(stMoveIntruder) == -1)
                  {
                     if(Boolean(a_1583) && a_1583.isOwnBattleField)
                     {
                        BattleFieldView.a_1045.play();
                     }
                     m_HitMouseArray.push(stMoveIntruder);
                     a_4352(stMoveIntruder);
                     return;
                  }
               }
            }
         }
      }
      
      override protected function ReboundHandler() : void
      {
         switch(m_isSpecial)
         {
            case 0:
               rotation = 0;
               break;
            case 1:
               rotation = 90;
               break;
            case 2:
               rotation = 270;
               break;
            case 3:
               rotation = 135;
               break;
            case 4:
               rotation = 225;
         }
      }
      
      override protected function a_3940() : Boolean
      {
         super.a_3940();
         if(-1 == ms_stChakratRabbitBaseshotVector.indexOf(this))
         {
            ms_stChakratRabbitBaseshotVector.push(this);
         }
         return true;
      }
   }
}

